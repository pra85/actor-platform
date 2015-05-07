//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/ex3ndr/Develop/actor-model/library/actor-cocoa-base/build/java/im/actor/model/api/rpc/RequestLoadDialogs.java
//


#include "IOSClass.h"
#include "IOSPrimitiveArray.h"
#include "J2ObjC_source.h"
#include "im/actor/model/api/rpc/RequestLoadDialogs.h"
#include "im/actor/model/droidkit/bser/Bser.h"
#include "im/actor/model/droidkit/bser/BserObject.h"
#include "im/actor/model/droidkit/bser/BserValues.h"
#include "im/actor/model/droidkit/bser/BserWriter.h"
#include "im/actor/model/network/parser/Request.h"
#include "java/io/IOException.h"

@interface ImActorModelApiRpcRequestLoadDialogs () {
 @public
  jlong minDate_;
  jint limit_;
}

@end

@implementation ImActorModelApiRpcRequestLoadDialogs

+ (ImActorModelApiRpcRequestLoadDialogs *)fromBytesWithByteArray:(IOSByteArray *)data {
  return ImActorModelApiRpcRequestLoadDialogs_fromBytesWithByteArray_(data);
}

- (instancetype)initWithLong:(jlong)minDate
                     withInt:(jint)limit {
  ImActorModelApiRpcRequestLoadDialogs_initWithLong_withInt_(self, minDate, limit);
  return self;
}

- (instancetype)init {
  ImActorModelApiRpcRequestLoadDialogs_init(self);
  return self;
}

- (jlong)getMinDate {
  return self->minDate_;
}

- (jint)getLimit {
  return self->limit_;
}

- (void)parseWithBSBserValues:(BSBserValues *)values {
  self->minDate_ = [((BSBserValues *) nil_chk(values)) getLongWithInt:1];
  self->limit_ = [values getIntWithInt:2];
}

- (void)serializeWithBSBserWriter:(BSBserWriter *)writer {
  [((BSBserWriter *) nil_chk(writer)) writeLongWithInt:1 withLong:self->minDate_];
  [writer writeIntWithInt:2 withInt:self->limit_];
}

- (NSString *)description {
  NSString *res = @"rpc LoadDialogs{";
  res = JreStrcat("$$", res, JreStrcat("$J", @"minDate=", self->minDate_));
  res = JreStrcat("$$", res, JreStrcat("$I", @", limit=", self->limit_));
  res = JreStrcat("$C", res, '}');
  return res;
}

- (jint)getHeaderKey {
  return ImActorModelApiRpcRequestLoadDialogs_HEADER;
}

@end

ImActorModelApiRpcRequestLoadDialogs *ImActorModelApiRpcRequestLoadDialogs_fromBytesWithByteArray_(IOSByteArray *data) {
  ImActorModelApiRpcRequestLoadDialogs_initialize();
  return ((ImActorModelApiRpcRequestLoadDialogs *) BSBser_parseWithBSBserObject_withByteArray_(new_ImActorModelApiRpcRequestLoadDialogs_init(), data));
}

void ImActorModelApiRpcRequestLoadDialogs_initWithLong_withInt_(ImActorModelApiRpcRequestLoadDialogs *self, jlong minDate, jint limit) {
  (void) ImActorModelNetworkParserRequest_init(self);
  self->minDate_ = minDate;
  self->limit_ = limit;
}

ImActorModelApiRpcRequestLoadDialogs *new_ImActorModelApiRpcRequestLoadDialogs_initWithLong_withInt_(jlong minDate, jint limit) {
  ImActorModelApiRpcRequestLoadDialogs *self = [ImActorModelApiRpcRequestLoadDialogs alloc];
  ImActorModelApiRpcRequestLoadDialogs_initWithLong_withInt_(self, minDate, limit);
  return self;
}

void ImActorModelApiRpcRequestLoadDialogs_init(ImActorModelApiRpcRequestLoadDialogs *self) {
  (void) ImActorModelNetworkParserRequest_init(self);
}

ImActorModelApiRpcRequestLoadDialogs *new_ImActorModelApiRpcRequestLoadDialogs_init() {
  ImActorModelApiRpcRequestLoadDialogs *self = [ImActorModelApiRpcRequestLoadDialogs alloc];
  ImActorModelApiRpcRequestLoadDialogs_init(self);
  return self;
}

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(ImActorModelApiRpcRequestLoadDialogs)
