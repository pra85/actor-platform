//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/ex3ndr/Develop/actor-model/library/actor-cocoa-base/build/java/org/bouncycastle/math/ec/FixedPointPreCompInfo.java
//

#include "IOSObjectArray.h"
#include "J2ObjC_source.h"
#include "org/bouncycastle/math/ec/FixedPointPreCompInfo.h"

@implementation OrgBouncycastleMathEcFixedPointPreCompInfo

- (IOSObjectArray *)getPreComp {
  return preComp_;
}

- (void)setPreCompWithOrgBouncycastleMathEcECPointArray:(IOSObjectArray *)preComp {
  self->preComp_ = preComp;
}

- (jint)getWidth {
  return width_;
}

- (void)setWidthWithInt:(jint)width {
  self->width_ = width;
}

- (instancetype)init {
  if (self = [super init]) {
    preComp_ = nil;
    width_ = -1;
  }
  return self;
}

- (void)copyAllFieldsTo:(OrgBouncycastleMathEcFixedPointPreCompInfo *)other {
  [super copyAllFieldsTo:other];
  other->preComp_ = preComp_;
  other->width_ = width_;
}

@end

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(OrgBouncycastleMathEcFixedPointPreCompInfo)