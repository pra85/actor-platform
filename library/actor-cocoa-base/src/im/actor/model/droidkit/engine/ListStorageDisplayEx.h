//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/ex3ndr/Develop/actor-model/library/actor-cocoa-base/build/java/im/actor/model/droidkit/engine/ListStorageDisplayEx.java
//

#ifndef _DKListStorageDisplayEx_H_
#define _DKListStorageDisplayEx_H_

@class JavaLangLong;
@protocol JavaUtilList;

#include "J2ObjC_header.h"
#include "im/actor/model/droidkit/engine/ListStorage.h"

@protocol DKListStorageDisplayEx < DKListStorage, NSObject, JavaObject >
- (id<JavaUtilList>)loadBackwardWithJavaLangLong:(JavaLangLong *)sortingKey
                                         withInt:(jint)limit;

- (id<JavaUtilList>)loadForwardWithJavaLangLong:(JavaLangLong *)sortingKey
                                        withInt:(jint)limit;

- (id<JavaUtilList>)loadBackwardWithNSString:(NSString *)query
                            withJavaLangLong:(JavaLangLong *)sortingKey
                                     withInt:(jint)limit;

- (id<JavaUtilList>)loadForwardWithNSString:(NSString *)query
                           withJavaLangLong:(JavaLangLong *)sortingKey
                                    withInt:(jint)limit;

@end

J2OBJC_EMPTY_STATIC_INIT(DKListStorageDisplayEx)

#define ImActorModelDroidkitEngineListStorageDisplayEx DKListStorageDisplayEx

J2OBJC_TYPE_LITERAL_HEADER(DKListStorageDisplayEx)

#endif // _DKListStorageDisplayEx_H_