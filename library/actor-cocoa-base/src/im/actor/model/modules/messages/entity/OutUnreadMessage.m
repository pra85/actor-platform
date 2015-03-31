//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/ex3ndr/Develop/actor-model/library/actor-cocoa-base/build/java/im/actor/model/modules/messages/entity/OutUnreadMessage.java
//

#include "IOSClass.h"
#include "J2ObjC_source.h"
#include "im/actor/model/droidkit/bser/BserValues.h"
#include "im/actor/model/droidkit/bser/BserWriter.h"
#include "im/actor/model/modules/messages/entity/OutUnreadMessage.h"
#include "java/io/IOException.h"

@interface ImActorModelModulesMessagesEntityOutUnreadMessage () {
 @public
  jlong rid_;
  jlong date_;
}
@end

@implementation ImActorModelModulesMessagesEntityOutUnreadMessage

- (instancetype)initWithLong:(jlong)rid
                    withLong:(jlong)date {
  if (self = [super init]) {
    self->rid_ = rid;
    self->date_ = date;
  }
  return self;
}

- (instancetype)init {
  return [super init];
}

- (jlong)getDate {
  return date_;
}

- (jlong)getRid {
  return rid_;
}

- (void)parseWithBSBserValues:(BSBserValues *)values {
  rid_ = [((BSBserValues *) nil_chk(values)) getLongWithInt:1];
  date_ = [values getLongWithInt:2];
}

- (void)serializeWithBSBserWriter:(BSBserWriter *)writer {
  [((BSBserWriter *) nil_chk(writer)) writeLongWithInt:1 withLong:rid_];
  [writer writeLongWithInt:2 withLong:date_];
}

- (void)copyAllFieldsTo:(ImActorModelModulesMessagesEntityOutUnreadMessage *)other {
  [super copyAllFieldsTo:other];
  other->rid_ = rid_;
  other->date_ = date_;
}

@end

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(ImActorModelModulesMessagesEntityOutUnreadMessage)