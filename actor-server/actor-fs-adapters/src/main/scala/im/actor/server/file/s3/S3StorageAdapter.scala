package im.actor.server.file.s3

import java.io.{ ByteArrayInputStream, InputStream, File }

import akka.actor._
import akka.stream.{ ActorMaterializer, Materializer }
import akka.stream.scaladsl.{ Sink, FileIO }
import akka.util.ByteString
import com.amazonaws.HttpMethod
import com.amazonaws.auth.BasicAWSCredentials
import com.amazonaws.services.s3.model.{ ObjectMetadata, PutObjectRequest, GeneratePresignedUrlRequest }
import com.amazonaws.services.s3.transfer.TransferManager
import com.amazonaws.services.s3.transfer.model.UploadResult
import com.github.dwhjames.awswrap.s3.{ AmazonS3ScalaClient, FutureTransfer }
import im.actor.acl.ACLFiles
import im.actor.server.db.DbExtension
import im.actor.server.file.FileUtils._
import im.actor.server.file._
import im.actor.server.{ model, persist }
import im.actor.server.db.ActorPostgresDriver.api._

import scala.concurrent.duration._
import scala.concurrent.forkjoin.ThreadLocalRandom
import scala.concurrent.{ ExecutionContext, Future }

final class S3StorageAdapter(_system: ActorSystem) extends FileStorageAdapter {

  private implicit val system: ActorSystem = _system
  private implicit val ec: ExecutionContext = system.dispatcher
  private implicit val mat: Materializer = ActorMaterializer()

  private val config = S3StorageAdapterConfig.load(system.settings.config.getConfig("services.aws.s3")).get
  private val bucketName = config.bucketName
  private val awsCredentials = new BasicAWSCredentials(config.key, config.secret)
  private val db = DbExtension(system).db

  val s3Client = new AmazonS3ScalaClient(awsCredentials)
  if (!config.endpoint.isEmpty) {
    s3Client.client.setEndpoint(config.endpoint)
  }

  val transferManager = new TransferManager(s3Client.client)

  override def uploadFile(name: UnsafeFileName, data: Array[Byte]): DBIO[FileLocation] =
    uploadFile(bucketName, name, data)

  override def uploadFileF(name: UnsafeFileName, data: Array[Byte]): Future[FileLocation] =
    db.run(uploadFile(name, data))

  override def downloadFile(id: Long): DBIO[Option[Array[Byte]]] = {
    persist.FileRepo.find(id) flatMap {
      case Some(file) ⇒
        downloadFile(bucketName, file.id, file.name) map (Some(_))
      case None ⇒ DBIO.successful(None)
    }
  }

  override def downloadFileF(id: Long): Future[Option[Array[Byte]]] =
    db.run(downloadFile(id))

  override def getFileDownloadUrl(file: model.File, accessHash: Long): Future[Option[String]] = {
    val timeout = 1.day

    if (ACLFiles.fileAccessHash(file.id, file.accessSalt) == accessHash) {
      val presignedRequest = new GeneratePresignedUrlRequest(bucketName, s3Key(file.id, file.name))

      val expiration = new java.util.Date
      expiration.setTime(expiration.getTime + timeout.toMillis)
      presignedRequest.setExpiration(expiration)
      presignedRequest.setMethod(HttpMethod.GET)

      s3Client.generatePresignedUrlRequest(presignedRequest).map(_.toString).map(Some(_))
    } else Future.successful(None)
  }

  private def downloadFile(bucketName: String, id: Long, name: String) = {
    for {
      dirFile ← DBIO.from(FileUtils.createTempDir())
      file = dirFile.toPath.resolve("file").toFile
      _ ← DBIO.from(FutureTransfer.listenFor(transferManager.download(bucketName, s3Key(id, name), file)) map (_.waitForCompletion()))
      data ← DBIO.from(FileIO.fromFile(file).runFold(ByteString.empty)(_ ++ _))
    } yield data.toArray
  }

  private def uploadFile(bucketName: String, name: UnsafeFileName, data: Array[Byte]): DBIO[FileLocation] = {
    val rnd = ThreadLocalRandom.current()
    val id = rnd.nextLong()
    val accessSalt = ACLFiles.nextAccessSalt(rnd)
    val size = data.length

    for {
      _ ← persist.FileRepo.create(id, size.toLong, accessSalt, s3Key(id, name.safe))
      _ ← DBIO.from(s3Upload(bucketName, id, name.safe, data))
      _ ← persist.FileRepo.setUploaded(id, name.safe)
    } yield FileLocation(id, ACLFiles.fileAccessHash(id, accessSalt))
  }

  private def s3Upload(bucketName: String, id: Long, name: String, data: Array[Byte]): Future[UploadResult] = {
    val is = new ByteArrayInputStream(data)
    val md = new ObjectMetadata()
    FutureTransfer.listenFor(transferManager.upload(bucketName, s3Key(id, name), is, md)) map (_.waitForUploadResult())
  }

  override def getFileUploadPartUrl(fileId: Long, partNumber: Int): Future[(UploadKey, String)] = {
    val fileKey = uploadKey(fileId)
    val partKey = S3UploadKey(s"upload_part_${fileKey.key}_$partNumber")
    val request = new GeneratePresignedUrlRequest(bucketName, partKey.key)
    val expiration = new java.util.Date
    expiration.setTime(expiration.getTime + 1.day.toMillis)
    request.setMethod(HttpMethod.PUT)
    request.setExpiration(expiration)
    request.setContentType("application/octet-stream")

    for (url ← s3Client.generatePresignedUrlRequest(request)) yield partKey → url.toString
  }

  override def getFileUploadUrl(fileId: Long): Future[(UploadKey, String)] = {
    val fileKey = uploadKey(fileId)
    val presignedRequest = new GeneratePresignedUrlRequest(bucketName, fileKey.key)
    val expiration = new java.util.Date
    expiration.setTime(expiration.getTime + 1.day.toMillis)
    presignedRequest.setExpiration(expiration)
    presignedRequest.setMethod(HttpMethod.PUT)

    for (url ← s3Client.generatePresignedUrlRequest(presignedRequest)) yield fileKey → url.toString
  }

  override def completeFileUpload(fileId: Long, fileSize: Long, fileName: UnsafeFileName, partNames: Seq[String]): Future[Unit] = {
    for {
      tempDir ← createTempDir()
      fk = uploadKey(fileId).key
      _ ← FutureTransfer.listenFor {
        transferManager.downloadDirectory(bucketName, s"upload_part_$fk", tempDir)
      } map (_.waitForCompletion())
      concatFile ← concatFiles(tempDir, partNames)
      _ ← FutureTransfer.listenFor {
        transferManager.upload(bucketName, s3Key(fileId, fileName.safe), concatFile)
      } map (_.waitForCompletion())
      _ ← db.run(persist.FileRepo.setUploaded(fileId, fileName.safe))
      _ ← deleteDir(tempDir)
    } yield ()
  }

  private def uploadKey(fileId: Long): S3UploadKey = S3UploadKey(s"upload_$fileId")

  private def s3Key(id: Long, name: String): String =
    if (name.isEmpty) {
      s"file_$id"
    } else {
      s"file_$id/$name"
    }

  override def parseKey(bytes: Array[Byte]): UploadKey = S3UploadKey.parseFrom(bytes)
}