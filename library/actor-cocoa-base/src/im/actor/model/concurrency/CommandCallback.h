//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/ex3ndr/Develop/actor-model/library/actor-cocoa-base/build/java/im/actor/model/concurrency/CommandCallback.java
//

#ifndef _AMCommandCallback_H_
#define _AMCommandCallback_H_

#include "J2ObjC_header.h"

@class JavaLangException;

@protocol AMCommandCallback < NSObject, JavaObject >

- (void)onResult:(id)res;

- (void)onError:(JavaLangException *)e;

@end

J2OBJC_EMPTY_STATIC_INIT(AMCommandCallback)

J2OBJC_TYPE_LITERAL_HEADER(AMCommandCallback)

#define ImActorModelConcurrencyCommandCallback AMCommandCallback

#endif // _AMCommandCallback_H_
