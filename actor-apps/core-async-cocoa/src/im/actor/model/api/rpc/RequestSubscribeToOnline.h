//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/ex3ndr/Develop/actor-platform/actor-apps/core/src/main/java/im/actor/model/api/rpc/RequestSubscribeToOnline.java
//

#ifndef _APRequestSubscribeToOnline_H_
#define _APRequestSubscribeToOnline_H_

#include "J2ObjC_header.h"
#include "im/actor/model/network/parser/Request.h"

@class BSBserValues;
@class BSBserWriter;
@class IOSByteArray;
@protocol JavaUtilList;

#define APRequestSubscribeToOnline_HEADER 32

@interface APRequestSubscribeToOnline : APRequest

#pragma mark Public

- (instancetype)init;

- (instancetype)initWithJavaUtilList:(id<JavaUtilList>)users;

+ (APRequestSubscribeToOnline *)fromBytesWithByteArray:(IOSByteArray *)data;

- (jint)getHeaderKey;

- (id<JavaUtilList>)getUsers;

- (void)parseWithBSBserValues:(BSBserValues *)values;

- (void)serializeWithBSBserWriter:(BSBserWriter *)writer;

- (NSString *)description;

@end

J2OBJC_EMPTY_STATIC_INIT(APRequestSubscribeToOnline)

J2OBJC_STATIC_FIELD_GETTER(APRequestSubscribeToOnline, HEADER, jint)

FOUNDATION_EXPORT APRequestSubscribeToOnline *APRequestSubscribeToOnline_fromBytesWithByteArray_(IOSByteArray *data);

FOUNDATION_EXPORT void APRequestSubscribeToOnline_initWithJavaUtilList_(APRequestSubscribeToOnline *self, id<JavaUtilList> users);

FOUNDATION_EXPORT APRequestSubscribeToOnline *new_APRequestSubscribeToOnline_initWithJavaUtilList_(id<JavaUtilList> users) NS_RETURNS_RETAINED;

FOUNDATION_EXPORT void APRequestSubscribeToOnline_init(APRequestSubscribeToOnline *self);

FOUNDATION_EXPORT APRequestSubscribeToOnline *new_APRequestSubscribeToOnline_init() NS_RETURNS_RETAINED;

J2OBJC_TYPE_LITERAL_HEADER(APRequestSubscribeToOnline)

typedef APRequestSubscribeToOnline ImActorModelApiRpcRequestSubscribeToOnline;

#endif // _APRequestSubscribeToOnline_H_