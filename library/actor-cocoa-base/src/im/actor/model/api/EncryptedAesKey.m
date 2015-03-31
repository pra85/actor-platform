//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/ex3ndr/Develop/actor-model/library/actor-cocoa-base/build/java/im/actor/model/api/EncryptedAesKey.java
//

#include "IOSClass.h"
#include "IOSPrimitiveArray.h"
#include "J2ObjC_source.h"
#include "im/actor/model/api/EncryptedAesKey.h"
#include "im/actor/model/droidkit/bser/BserValues.h"
#include "im/actor/model/droidkit/bser/BserWriter.h"
#include "im/actor/model/droidkit/bser/Utils.h"
#include "java/io/IOException.h"

@interface ImActorModelApiEncryptedAesKey () {
 @public
  jlong keyHash_;
  IOSByteArray *aesEncryptedKey_;
}
@end

J2OBJC_FIELD_SETTER(ImActorModelApiEncryptedAesKey, aesEncryptedKey_, IOSByteArray *)

@implementation ImActorModelApiEncryptedAesKey

- (instancetype)initWithLong:(jlong)keyHash
               withByteArray:(IOSByteArray *)aesEncryptedKey {
  if (self = [super init]) {
    self->keyHash_ = keyHash;
    self->aesEncryptedKey_ = aesEncryptedKey;
  }
  return self;
}

- (instancetype)init {
  return [super init];
}

- (jlong)getKeyHash {
  return self->keyHash_;
}

- (IOSByteArray *)getAesEncryptedKey {
  return self->aesEncryptedKey_;
}

- (void)parseWithBSBserValues:(BSBserValues *)values {
  self->keyHash_ = [((BSBserValues *) nil_chk(values)) getLongWithInt:1];
  self->aesEncryptedKey_ = [values getBytesWithInt:2];
}

- (void)serializeWithBSBserWriter:(BSBserWriter *)writer {
  [((BSBserWriter *) nil_chk(writer)) writeLongWithInt:1 withLong:self->keyHash_];
  if (self->aesEncryptedKey_ == nil) {
    @throw [[JavaIoIOException alloc] init];
  }
  [writer writeBytesWithInt:2 withByteArray:self->aesEncryptedKey_];
}

- (NSString *)description {
  NSString *res = @"struct EncryptedAesKey{";
  res = JreStrcat("$$", res, JreStrcat("$J", @"keyHash=", self->keyHash_));
  res = JreStrcat("$$", res, JreStrcat("$$", @", aesEncryptedKey=", BSUtils_byteArrayToStringCompactWithByteArray_(self->aesEncryptedKey_)));
  res = JreStrcat("$C", res, '}');
  return res;
}

- (void)copyAllFieldsTo:(ImActorModelApiEncryptedAesKey *)other {
  [super copyAllFieldsTo:other];
  other->keyHash_ = keyHash_;
  other->aesEncryptedKey_ = aesEncryptedKey_;
}

@end

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(ImActorModelApiEncryptedAesKey)