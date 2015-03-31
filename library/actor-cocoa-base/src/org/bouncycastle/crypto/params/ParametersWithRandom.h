//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/ex3ndr/Develop/actor-model/library/actor-cocoa-base/build/java/org/bouncycastle/crypto/params/ParametersWithRandom.java
//

#ifndef _OrgBouncycastleCryptoParamsParametersWithRandom_H_
#define _OrgBouncycastleCryptoParamsParametersWithRandom_H_

@protocol BCRandomProvider;

#include "J2ObjC_header.h"
#include "org/bouncycastle/crypto/CipherParameters.h"

@interface OrgBouncycastleCryptoParamsParametersWithRandom : NSObject < OrgBouncycastleCryptoCipherParameters > {
}

- (instancetype)initWithOrgBouncycastleCryptoCipherParameters:(id<OrgBouncycastleCryptoCipherParameters>)parameters
                                         withBCRandomProvider:(id<BCRandomProvider>)random;

- (id<BCRandomProvider>)getRandom;

- (id<OrgBouncycastleCryptoCipherParameters>)getParameters;

@end

J2OBJC_EMPTY_STATIC_INIT(OrgBouncycastleCryptoParamsParametersWithRandom)

CF_EXTERN_C_BEGIN
CF_EXTERN_C_END

J2OBJC_TYPE_LITERAL_HEADER(OrgBouncycastleCryptoParamsParametersWithRandom)

#endif // _OrgBouncycastleCryptoParamsParametersWithRandom_H_