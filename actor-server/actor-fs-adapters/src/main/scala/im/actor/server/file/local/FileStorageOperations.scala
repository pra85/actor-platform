package im.actor.server.file.local

import akka.actor.ActorSystem
import akka.event.Logging
import akka.http.scaladsl.util.FastFuture
import akka.stream.Materializer
import akka.stream.scaladsl.{ Source, FileIO }
import akka.util.ByteString
import better.files.{ File, _ }
import im.actor.server.db.DbExtension
import im.actor.server.persist.FileRepo

import scala.concurrent.{ ExecutionContext, Future, blocking }

trait FileStorageOperations extends LocalUploadKeyImplicits {

  protected implicit val system: ActorSystem //just for logging
  protected implicit val ec: ExecutionContext
  protected implicit val mat: Materializer
  protected val storageLocation: String

  private lazy val log = Logging(system, getClass)
  private lazy val db = DbExtension(system).db

  protected def createFile(fileId: Long, name: String, data: Array[Byte]): Future[Unit] = {
    for {
      dir ← getOrCreateFileDir(fileId)
      file = dir / name
      _ ← Source(List(ByteString(data))).runWith(FileIO.toFile(file.toJava)) map (_ ⇒ ())
    } yield ()
  }

  protected def prepareForPartWrite(fileId: Long, partNumber: Int): Future[Unit] = {
    val partUploadKey = LocalUploadKey.partKey(fileId, partNumber).key

    for {
      dir ← getOrCreateFileDir(fileId)
      partFile = dir / partUploadKey
      _ ← if (partFile.exists) Future { blocking { partFile.delete(ignoreIOExceptions = true) } } else FastFuture.successful(())
    } yield ()
  }

  protected def appendPartBytes(bytes: Array[Byte], fileId: Long, partNumber: Int): Future[Unit] = {
    for {
      dir ← getOrCreateFileDir(fileId)
      partFile ← Future { blocking { dir.createChild(LocalUploadKey.partKey(fileId, partNumber).key) } }
      _ = log.debug("Appending bytes to part number: {}, fileId: {}, data length: {} target file: {}", partNumber, fileId, bytes.length, partFile)
      _ ← Source(List(ByteString(bytes))).runWith(FileIO.toFile(partFile.toJava, append = true))
    } yield ()
  }

  protected def haveAllParts(dir: File, partNames: Seq[String], fileSize: Long): Future[Boolean] = Future {
    val partsSize = (partNames map { name ⇒ (dir / name).size }).sum
    val result = partsSize == fileSize
    if (!result) {
      log.debug(
        "Failed to concat file, some parts are not there yet. Expected file size: {}, sum of parts size: {}",
        fileSize,
        partsSize
      )
    }
    result
  }

  protected def concatFiles(dir: File, partNames: Seq[String], fileName: String, fileSize: Long): Future[File] = {
    Future {
      blocking {
        log.debug("Concatenating file: {}, parts number: {}", fileName, partNames.length)
        val concatFile = dir.createChild(getFileName(fileName))
        for {
          out ← concatFile.outputStream
          _ ← for {
            iss ← partNames map { name ⇒
              log.debug("Concatenating part: {}", name)
              (dir / name).inputStream
            }
          } yield iss.foreach(_.pipeTo(out, closeOutputStream = false))
        } yield ()
        concatFile
      }
    }
  }

  protected def deleteUploadedParts(dir: File, partNames: Seq[String]): Future[Unit] =
    Future.sequence(partNames map { part ⇒ Future((dir / part).delete()) }) map (_ ⇒ ())

  protected def getFileData(fileId: Long): Future[Option[ByteString]] =
    for {
      fileOpt ← getFile(fileId)
      dataOpt ← fileOpt match {
        case Some(file) ⇒ getFileData(file) map (Some(_))
        case None       ⇒ FastFuture.successful(None)
      }
    } yield dataOpt

  protected def getFile(fileId: Long): Future[Option[File]] =
    db.run(FileRepo.find(fileId)) map {
      case Some(model) ⇒ Some(fileDirectory(fileId) / getFileName(model.name))
      case None        ⇒ None
    }

  protected def getFileData(file: File): Future[ByteString] =
    FileIO.fromFile(file.toJava).runFold(ByteString.empty)(_ ++ _)

  protected def getFileName(name: String) = if (name.trim.isEmpty) "file" else name

  protected def fileDirectory(fileId: Long): File = file"$storageLocation/file_${fileId}"

  private def getOrCreateFileDir(fileId: Long) = Future {
    blocking {
      fileDirectory(fileId).createIfNotExists(asDirectory = true)
    }
  }

}
