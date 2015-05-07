//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/ex3ndr/Develop/actor-model/library/actor-cocoa-base/build/java/im/actor/model/api/UserOutPeer.java
//


#include "IOSClass.h"
#include "J2ObjC_source.h"
#include "im/actor/model/api/UserOutPeer.h"
#include "im/actor/model/droidkit/bser/BserObject.h"
#include "im/actor/model/droidkit/bser/BserValues.h"
#include "im/actor/model/droidkit/bser/BserWriter.h"
#include "java/io/IOException.h"

@interface ImActorModelApiUserOutPeer () {
 @public
  jint uid_;
  jlong accessHash_;
}

@end

@implementation ImActorModelApiUserOutPeer

- (instancetype)initWithInt:(jint)uid
                   withLong:(jlong)accessHash {
  ImActorModelApiUserOutPeer_initWithInt_withLong_(self, uid, accessHash);
  return self;
}

- (instancetype)init {
  ImActorModelApiUserOutPeer_init(self);
  return self;
}

- (jint)getUid {
  return self->uid_;
}

- (jlong)getAccessHash {
  return self->accessHash_;
}

- (void)parseWithBSBserValues:(BSBserValues *)values {
  self->uid_ = [((BSBserValues *) nil_chk(values)) getIntWithInt:1];
  self->accessHash_ = [values getLongWithInt:2];
}

- (void)serializeWithBSBserWriter:(BSBserWriter *)writer {
  [((BSBserWriter *) nil_chk(writer)) writeIntWithInt:1 withInt:self->uid_];
  [writer writeLongWithInt:2 withLong:self->accessHash_];
}

- (NSString *)description {
  NSString *res = @"struct UserOutPeer{";
  res = JreStrcat("$$", res, JreStrcat("$I", @"uid=", self->uid_));
  res = JreStrcat("$C", res, '}');
  return res;
}

@end

void ImActorModelApiUserOutPeer_initWithInt_withLong_(ImActorModelApiUserOutPeer *self, jint uid, jlong accessHash) {
  (void) BSBserObject_init(self);
  self->uid_ = uid;
  self->accessHash_ = accessHash;
}

ImActorModelApiUserOutPeer *new_ImActorModelApiUserOutPeer_initWithInt_withLong_(jint uid, jlong accessHash) {
  ImActorModelApiUserOutPeer *self = [ImActorModelApiUserOutPeer alloc];
  ImActorModelApiUserOutPeer_initWithInt_withLong_(self, uid, accessHash);
  return self;
}

void ImActorModelApiUserOutPeer_init(ImActorModelApiUserOutPeer *self) {
  (void) BSBserObject_init(self);
}

ImActorModelApiUserOutPeer *new_ImActorModelApiUserOutPeer_init() {
  ImActorModelApiUserOutPeer *self = [ImActorModelApiUserOutPeer alloc];
  ImActorModelApiUserOutPeer_init(self);
  return self;
}

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(ImActorModelApiUserOutPeer)
