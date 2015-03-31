//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/ex3ndr/Develop/actor-model/library/actor-cocoa-base/build/java/org/bouncycastle/crypto/digests/LongDigest.java
//

#include "IOSPrimitiveArray.h"
#include "J2ObjC_source.h"
#include "java/lang/System.h"
#include "org/bouncycastle/crypto/digests/LongDigest.h"
#include "org/bouncycastle/util/Pack.h"

#pragma clang diagnostic ignored "-Wprotocol"

__attribute__((unused)) static void OrgBouncycastleCryptoDigestsLongDigest_adjustByteCounts(OrgBouncycastleCryptoDigestsLongDigest *self);
__attribute__((unused)) static jlong OrgBouncycastleCryptoDigestsLongDigest_ChWithLong_withLong_withLong_(OrgBouncycastleCryptoDigestsLongDigest *self, jlong x, jlong y, jlong z);
__attribute__((unused)) static jlong OrgBouncycastleCryptoDigestsLongDigest_MajWithLong_withLong_withLong_(OrgBouncycastleCryptoDigestsLongDigest *self, jlong x, jlong y, jlong z);
__attribute__((unused)) static jlong OrgBouncycastleCryptoDigestsLongDigest_Sum0WithLong_(OrgBouncycastleCryptoDigestsLongDigest *self, jlong x);
__attribute__((unused)) static jlong OrgBouncycastleCryptoDigestsLongDigest_Sum1WithLong_(OrgBouncycastleCryptoDigestsLongDigest *self, jlong x);
__attribute__((unused)) static jlong OrgBouncycastleCryptoDigestsLongDigest_Sigma0WithLong_(OrgBouncycastleCryptoDigestsLongDigest *self, jlong x);
__attribute__((unused)) static jlong OrgBouncycastleCryptoDigestsLongDigest_Sigma1WithLong_(OrgBouncycastleCryptoDigestsLongDigest *self, jlong x);

@interface OrgBouncycastleCryptoDigestsLongDigest () {
 @public
  IOSByteArray *xBuf_;
  jint xBufOff_;
  jlong byteCount1_;
  jlong byteCount2_;
  IOSLongArray *W_;
  jint wOff_;
}

- (void)adjustByteCounts;

- (jlong)ChWithLong:(jlong)x
           withLong:(jlong)y
           withLong:(jlong)z;

- (jlong)MajWithLong:(jlong)x
            withLong:(jlong)y
            withLong:(jlong)z;

- (jlong)Sum0WithLong:(jlong)x;

- (jlong)Sum1WithLong:(jlong)x;

- (jlong)Sigma0WithLong:(jlong)x;

- (jlong)Sigma1WithLong:(jlong)x;
@end

J2OBJC_FIELD_SETTER(OrgBouncycastleCryptoDigestsLongDigest, xBuf_, IOSByteArray *)
J2OBJC_FIELD_SETTER(OrgBouncycastleCryptoDigestsLongDigest, W_, IOSLongArray *)

BOOL OrgBouncycastleCryptoDigestsLongDigest_initialized = NO;

@implementation OrgBouncycastleCryptoDigestsLongDigest

IOSLongArray * OrgBouncycastleCryptoDigestsLongDigest_K_;

- (instancetype)init {
  if (self = [super init]) {
    xBuf_ = [IOSByteArray newArrayWithLength:8];
    W_ = [IOSLongArray newArrayWithLength:80];
    xBufOff_ = 0;
    [self reset];
  }
  return self;
}

- (instancetype)initWithOrgBouncycastleCryptoDigestsLongDigest:(OrgBouncycastleCryptoDigestsLongDigest *)t {
  if (self = [super init]) {
    xBuf_ = [IOSByteArray newArrayWithLength:8];
    W_ = [IOSLongArray newArrayWithLength:80];
    [self copyInWithOrgBouncycastleCryptoDigestsLongDigest:t];
  }
  return self;
}

- (void)copyInWithOrgBouncycastleCryptoDigestsLongDigest:(OrgBouncycastleCryptoDigestsLongDigest *)t {
  JavaLangSystem_arraycopyWithId_withInt_withId_withInt_withInt_(((OrgBouncycastleCryptoDigestsLongDigest *) nil_chk(t))->xBuf_, 0, xBuf_, 0, ((IOSByteArray *) nil_chk(t->xBuf_))->size_);
  xBufOff_ = t->xBufOff_;
  byteCount1_ = t->byteCount1_;
  byteCount2_ = t->byteCount2_;
  H1_ = t->H1_;
  H2_ = t->H2_;
  H3_ = t->H3_;
  H4_ = t->H4_;
  H5_ = t->H5_;
  H6_ = t->H6_;
  H7_ = t->H7_;
  H8_ = t->H8_;
  JavaLangSystem_arraycopyWithId_withInt_withId_withInt_withInt_(t->W_, 0, W_, 0, ((IOSLongArray *) nil_chk(t->W_))->size_);
  wOff_ = t->wOff_;
}

- (void)populateStateWithByteArray:(IOSByteArray *)state {
  JavaLangSystem_arraycopyWithId_withInt_withId_withInt_withInt_(xBuf_, 0, state, 0, xBufOff_);
  OrgBouncycastleUtilPack_intToBigEndianWithInt_withByteArray_withInt_(xBufOff_, state, 8);
  OrgBouncycastleUtilPack_longToBigEndianWithLong_withByteArray_withInt_(byteCount1_, state, 12);
  OrgBouncycastleUtilPack_longToBigEndianWithLong_withByteArray_withInt_(byteCount2_, state, 20);
  OrgBouncycastleUtilPack_longToBigEndianWithLong_withByteArray_withInt_(H1_, state, 28);
  OrgBouncycastleUtilPack_longToBigEndianWithLong_withByteArray_withInt_(H2_, state, 36);
  OrgBouncycastleUtilPack_longToBigEndianWithLong_withByteArray_withInt_(H3_, state, 44);
  OrgBouncycastleUtilPack_longToBigEndianWithLong_withByteArray_withInt_(H4_, state, 52);
  OrgBouncycastleUtilPack_longToBigEndianWithLong_withByteArray_withInt_(H5_, state, 60);
  OrgBouncycastleUtilPack_longToBigEndianWithLong_withByteArray_withInt_(H6_, state, 68);
  OrgBouncycastleUtilPack_longToBigEndianWithLong_withByteArray_withInt_(H7_, state, 76);
  OrgBouncycastleUtilPack_longToBigEndianWithLong_withByteArray_withInt_(H8_, state, 84);
  OrgBouncycastleUtilPack_intToBigEndianWithInt_withByteArray_withInt_(wOff_, state, 92);
  for (jint i = 0; i < wOff_; i++) {
    OrgBouncycastleUtilPack_longToBigEndianWithLong_withByteArray_withInt_(IOSLongArray_Get(nil_chk(W_), i), state, 96 + (i * 8));
  }
}

- (void)restoreStateWithByteArray:(IOSByteArray *)encodedState {
  xBufOff_ = OrgBouncycastleUtilPack_bigEndianToIntWithByteArray_withInt_(encodedState, 8);
  JavaLangSystem_arraycopyWithId_withInt_withId_withInt_withInt_(encodedState, 0, xBuf_, 0, xBufOff_);
  byteCount1_ = OrgBouncycastleUtilPack_bigEndianToLongWithByteArray_withInt_(encodedState, 12);
  byteCount2_ = OrgBouncycastleUtilPack_bigEndianToLongWithByteArray_withInt_(encodedState, 20);
  H1_ = OrgBouncycastleUtilPack_bigEndianToLongWithByteArray_withInt_(encodedState, 28);
  H2_ = OrgBouncycastleUtilPack_bigEndianToLongWithByteArray_withInt_(encodedState, 36);
  H3_ = OrgBouncycastleUtilPack_bigEndianToLongWithByteArray_withInt_(encodedState, 44);
  H4_ = OrgBouncycastleUtilPack_bigEndianToLongWithByteArray_withInt_(encodedState, 52);
  H5_ = OrgBouncycastleUtilPack_bigEndianToLongWithByteArray_withInt_(encodedState, 60);
  H6_ = OrgBouncycastleUtilPack_bigEndianToLongWithByteArray_withInt_(encodedState, 68);
  H7_ = OrgBouncycastleUtilPack_bigEndianToLongWithByteArray_withInt_(encodedState, 76);
  H8_ = OrgBouncycastleUtilPack_bigEndianToLongWithByteArray_withInt_(encodedState, 84);
  wOff_ = OrgBouncycastleUtilPack_bigEndianToIntWithByteArray_withInt_(encodedState, 92);
  for (jint i = 0; i < wOff_; i++) {
    *IOSLongArray_GetRef(nil_chk(W_), i) = OrgBouncycastleUtilPack_bigEndianToLongWithByteArray_withInt_(encodedState, 96 + (i * 8));
  }
}

- (jint)getEncodedStateSize {
  return 96 + (wOff_ * 8);
}

- (void)updateWithByte:(jbyte)inArg {
  *IOSByteArray_GetRef(nil_chk(xBuf_), xBufOff_++) = inArg;
  if (xBufOff_ == xBuf_->size_) {
    [self processWordWithByteArray:xBuf_ withInt:0];
    xBufOff_ = 0;
  }
  byteCount1_++;
}

- (void)updateWithByteArray:(IOSByteArray *)inArg
                    withInt:(jint)inOff
                    withInt:(jint)len {
  while ((xBufOff_ != 0) && (len > 0)) {
    [self updateWithByte:IOSByteArray_Get(nil_chk(inArg), inOff)];
    inOff++;
    len--;
  }
  while (len > ((IOSByteArray *) nil_chk(xBuf_))->size_) {
    [self processWordWithByteArray:inArg withInt:inOff];
    inOff += xBuf_->size_;
    len -= xBuf_->size_;
    byteCount1_ += xBuf_->size_;
  }
  while (len > 0) {
    [self updateWithByte:IOSByteArray_Get(nil_chk(inArg), inOff)];
    inOff++;
    len--;
  }
}

- (void)finish {
  OrgBouncycastleCryptoDigestsLongDigest_adjustByteCounts(self);
  jlong lowBitLength = LShift64(byteCount1_, 3);
  jlong hiBitLength = byteCount2_;
  [self updateWithByte:(jbyte) 128];
  while (xBufOff_ != 0) {
    [self updateWithByte:(jbyte) 0];
  }
  [self processLengthWithLong:lowBitLength withLong:hiBitLength];
  [self processBlock];
}

- (void)reset {
  byteCount1_ = 0;
  byteCount2_ = 0;
  xBufOff_ = 0;
  for (jint i = 0; i < ((IOSByteArray *) nil_chk(xBuf_))->size_; i++) {
    *IOSByteArray_GetRef(xBuf_, i) = 0;
  }
  wOff_ = 0;
  for (jint i = 0; i != ((IOSLongArray *) nil_chk(W_))->size_; i++) {
    *IOSLongArray_GetRef(W_, i) = 0;
  }
}

- (jint)getByteLength {
  return OrgBouncycastleCryptoDigestsLongDigest_BYTE_LENGTH;
}

- (void)processWordWithByteArray:(IOSByteArray *)inArg
                         withInt:(jint)inOff {
  *IOSLongArray_GetRef(nil_chk(W_), wOff_) = OrgBouncycastleUtilPack_bigEndianToLongWithByteArray_withInt_(inArg, inOff);
  if (++wOff_ == 16) {
    [self processBlock];
  }
}

- (void)adjustByteCounts {
  OrgBouncycastleCryptoDigestsLongDigest_adjustByteCounts(self);
}

- (void)processLengthWithLong:(jlong)lowW
                     withLong:(jlong)hiW {
  if (wOff_ > 14) {
    [self processBlock];
  }
  *IOSLongArray_GetRef(nil_chk(W_), 14) = hiW;
  *IOSLongArray_GetRef(W_, 15) = lowW;
}

- (void)processBlock {
  OrgBouncycastleCryptoDigestsLongDigest_adjustByteCounts(self);
  for (jint t = 16; t <= 79; t++) {
    *IOSLongArray_GetRef(nil_chk(W_), t) = OrgBouncycastleCryptoDigestsLongDigest_Sigma1WithLong_(self, IOSLongArray_Get(W_, t - 2)) + IOSLongArray_Get(W_, t - 7) + OrgBouncycastleCryptoDigestsLongDigest_Sigma0WithLong_(self, IOSLongArray_Get(W_, t - 15)) + IOSLongArray_Get(W_, t - 16);
  }
  jlong a = H1_;
  jlong b = H2_;
  jlong c = H3_;
  jlong d = H4_;
  jlong e = H5_;
  jlong f = H6_;
  jlong g = H7_;
  jlong h = H8_;
  jint t = 0;
  for (jint i = 0; i < 10; i++) {
    h += OrgBouncycastleCryptoDigestsLongDigest_Sum1WithLong_(self, e) + OrgBouncycastleCryptoDigestsLongDigest_ChWithLong_withLong_withLong_(self, e, f, g) + IOSLongArray_Get(nil_chk(OrgBouncycastleCryptoDigestsLongDigest_K_), t) + IOSLongArray_Get(nil_chk(W_), t++);
    d += h;
    h += OrgBouncycastleCryptoDigestsLongDigest_Sum0WithLong_(self, a) + OrgBouncycastleCryptoDigestsLongDigest_MajWithLong_withLong_withLong_(self, a, b, c);
    g += OrgBouncycastleCryptoDigestsLongDigest_Sum1WithLong_(self, d) + OrgBouncycastleCryptoDigestsLongDigest_ChWithLong_withLong_withLong_(self, d, e, f) + IOSLongArray_Get(OrgBouncycastleCryptoDigestsLongDigest_K_, t) + IOSLongArray_Get(W_, t++);
    c += g;
    g += OrgBouncycastleCryptoDigestsLongDigest_Sum0WithLong_(self, h) + OrgBouncycastleCryptoDigestsLongDigest_MajWithLong_withLong_withLong_(self, h, a, b);
    f += OrgBouncycastleCryptoDigestsLongDigest_Sum1WithLong_(self, c) + OrgBouncycastleCryptoDigestsLongDigest_ChWithLong_withLong_withLong_(self, c, d, e) + IOSLongArray_Get(OrgBouncycastleCryptoDigestsLongDigest_K_, t) + IOSLongArray_Get(W_, t++);
    b += f;
    f += OrgBouncycastleCryptoDigestsLongDigest_Sum0WithLong_(self, g) + OrgBouncycastleCryptoDigestsLongDigest_MajWithLong_withLong_withLong_(self, g, h, a);
    e += OrgBouncycastleCryptoDigestsLongDigest_Sum1WithLong_(self, b) + OrgBouncycastleCryptoDigestsLongDigest_ChWithLong_withLong_withLong_(self, b, c, d) + IOSLongArray_Get(OrgBouncycastleCryptoDigestsLongDigest_K_, t) + IOSLongArray_Get(W_, t++);
    a += e;
    e += OrgBouncycastleCryptoDigestsLongDigest_Sum0WithLong_(self, f) + OrgBouncycastleCryptoDigestsLongDigest_MajWithLong_withLong_withLong_(self, f, g, h);
    d += OrgBouncycastleCryptoDigestsLongDigest_Sum1WithLong_(self, a) + OrgBouncycastleCryptoDigestsLongDigest_ChWithLong_withLong_withLong_(self, a, b, c) + IOSLongArray_Get(OrgBouncycastleCryptoDigestsLongDigest_K_, t) + IOSLongArray_Get(W_, t++);
    h += d;
    d += OrgBouncycastleCryptoDigestsLongDigest_Sum0WithLong_(self, e) + OrgBouncycastleCryptoDigestsLongDigest_MajWithLong_withLong_withLong_(self, e, f, g);
    c += OrgBouncycastleCryptoDigestsLongDigest_Sum1WithLong_(self, h) + OrgBouncycastleCryptoDigestsLongDigest_ChWithLong_withLong_withLong_(self, h, a, b) + IOSLongArray_Get(OrgBouncycastleCryptoDigestsLongDigest_K_, t) + IOSLongArray_Get(W_, t++);
    g += c;
    c += OrgBouncycastleCryptoDigestsLongDigest_Sum0WithLong_(self, d) + OrgBouncycastleCryptoDigestsLongDigest_MajWithLong_withLong_withLong_(self, d, e, f);
    b += OrgBouncycastleCryptoDigestsLongDigest_Sum1WithLong_(self, g) + OrgBouncycastleCryptoDigestsLongDigest_ChWithLong_withLong_withLong_(self, g, h, a) + IOSLongArray_Get(OrgBouncycastleCryptoDigestsLongDigest_K_, t) + IOSLongArray_Get(W_, t++);
    f += b;
    b += OrgBouncycastleCryptoDigestsLongDigest_Sum0WithLong_(self, c) + OrgBouncycastleCryptoDigestsLongDigest_MajWithLong_withLong_withLong_(self, c, d, e);
    a += OrgBouncycastleCryptoDigestsLongDigest_Sum1WithLong_(self, f) + OrgBouncycastleCryptoDigestsLongDigest_ChWithLong_withLong_withLong_(self, f, g, h) + IOSLongArray_Get(OrgBouncycastleCryptoDigestsLongDigest_K_, t) + IOSLongArray_Get(W_, t++);
    e += a;
    a += OrgBouncycastleCryptoDigestsLongDigest_Sum0WithLong_(self, b) + OrgBouncycastleCryptoDigestsLongDigest_MajWithLong_withLong_withLong_(self, b, c, d);
  }
  H1_ += a;
  H2_ += b;
  H3_ += c;
  H4_ += d;
  H5_ += e;
  H6_ += f;
  H7_ += g;
  H8_ += h;
  wOff_ = 0;
  for (jint i = 0; i < 16; i++) {
    *IOSLongArray_GetRef(nil_chk(W_), i) = 0;
  }
}

- (jlong)ChWithLong:(jlong)x
           withLong:(jlong)y
           withLong:(jlong)z {
  return OrgBouncycastleCryptoDigestsLongDigest_ChWithLong_withLong_withLong_(self, x, y, z);
}

- (jlong)MajWithLong:(jlong)x
            withLong:(jlong)y
            withLong:(jlong)z {
  return OrgBouncycastleCryptoDigestsLongDigest_MajWithLong_withLong_withLong_(self, x, y, z);
}

- (jlong)Sum0WithLong:(jlong)x {
  return OrgBouncycastleCryptoDigestsLongDigest_Sum0WithLong_(self, x);
}

- (jlong)Sum1WithLong:(jlong)x {
  return OrgBouncycastleCryptoDigestsLongDigest_Sum1WithLong_(self, x);
}

- (jlong)Sigma0WithLong:(jlong)x {
  return OrgBouncycastleCryptoDigestsLongDigest_Sigma0WithLong_(self, x);
}

- (jlong)Sigma1WithLong:(jlong)x {
  return OrgBouncycastleCryptoDigestsLongDigest_Sigma1WithLong_(self, x);
}

- (void)copyAllFieldsTo:(OrgBouncycastleCryptoDigestsLongDigest *)other {
  [super copyAllFieldsTo:other];
  other->xBuf_ = xBuf_;
  other->xBufOff_ = xBufOff_;
  other->byteCount1_ = byteCount1_;
  other->byteCount2_ = byteCount2_;
  other->H1_ = H1_;
  other->H2_ = H2_;
  other->H3_ = H3_;
  other->H4_ = H4_;
  other->H5_ = H5_;
  other->H6_ = H6_;
  other->H7_ = H7_;
  other->H8_ = H8_;
  other->W_ = W_;
  other->wOff_ = wOff_;
}

+ (void)initialize {
  if (self == [OrgBouncycastleCryptoDigestsLongDigest class]) {
    OrgBouncycastleCryptoDigestsLongDigest_K_ = [IOSLongArray newArrayWithLongs:(jlong[]){ (jlong) 0x428a2f98d728ae22LL, (jlong) 0x7137449123ef65cdLL, (jlong) 0xb5c0fbcfec4d3b2fLL, (jlong) 0xe9b5dba58189dbbcLL, (jlong) 0x3956c25bf348b538LL, (jlong) 0x59f111f1b605d019LL, (jlong) 0x923f82a4af194f9bLL, (jlong) 0xab1c5ed5da6d8118LL, (jlong) 0xd807aa98a3030242LL, (jlong) 0x12835b0145706fbeLL, (jlong) 0x243185be4ee4b28cLL, (jlong) 0x550c7dc3d5ffb4e2LL, (jlong) 0x72be5d74f27b896fLL, (jlong) 0x80deb1fe3b1696b1LL, (jlong) 0x9bdc06a725c71235LL, (jlong) 0xc19bf174cf692694LL, (jlong) 0xe49b69c19ef14ad2LL, (jlong) 0xefbe4786384f25e3LL, (jlong) 0x0fc19dc68b8cd5b5LL, (jlong) 0x240ca1cc77ac9c65LL, (jlong) 0x2de92c6f592b0275LL, (jlong) 0x4a7484aa6ea6e483LL, (jlong) 0x5cb0a9dcbd41fbd4LL, (jlong) 0x76f988da831153b5LL, (jlong) 0x983e5152ee66dfabLL, (jlong) 0xa831c66d2db43210LL, (jlong) 0xb00327c898fb213fLL, (jlong) 0xbf597fc7beef0ee4LL, (jlong) 0xc6e00bf33da88fc2LL, (jlong) 0xd5a79147930aa725LL, (jlong) 0x06ca6351e003826fLL, (jlong) 0x142929670a0e6e70LL, (jlong) 0x27b70a8546d22ffcLL, (jlong) 0x2e1b21385c26c926LL, (jlong) 0x4d2c6dfc5ac42aedLL, (jlong) 0x53380d139d95b3dfLL, (jlong) 0x650a73548baf63deLL, (jlong) 0x766a0abb3c77b2a8LL, (jlong) 0x81c2c92e47edaee6LL, (jlong) 0x92722c851482353bLL, (jlong) 0xa2bfe8a14cf10364LL, (jlong) 0xa81a664bbc423001LL, (jlong) 0xc24b8b70d0f89791LL, (jlong) 0xc76c51a30654be30LL, (jlong) 0xd192e819d6ef5218LL, (jlong) 0xd69906245565a910LL, (jlong) 0xf40e35855771202aLL, (jlong) 0x106aa07032bbd1b8LL, (jlong) 0x19a4c116b8d2d0c8LL, (jlong) 0x1e376c085141ab53LL, (jlong) 0x2748774cdf8eeb99LL, (jlong) 0x34b0bcb5e19b48a8LL, (jlong) 0x391c0cb3c5c95a63LL, (jlong) 0x4ed8aa4ae3418acbLL, (jlong) 0x5b9cca4f7763e373LL, (jlong) 0x682e6ff3d6b2b8a3LL, (jlong) 0x748f82ee5defb2fcLL, (jlong) 0x78a5636f43172f60LL, (jlong) 0x84c87814a1f0ab72LL, (jlong) 0x8cc702081a6439ecLL, (jlong) 0x90befffa23631e28LL, (jlong) 0xa4506cebde82bde9LL, (jlong) 0xbef9a3f7b2c67915LL, (jlong) 0xc67178f2e372532bLL, (jlong) 0xca273eceea26619cLL, (jlong) 0xd186b8c721c0c207LL, (jlong) 0xeada7dd6cde0eb1eLL, (jlong) 0xf57d4f7fee6ed178LL, (jlong) 0x06f067aa72176fbaLL, (jlong) 0x0a637dc5a2c898a6LL, (jlong) 0x113f9804bef90daeLL, (jlong) 0x1b710b35131c471bLL, (jlong) 0x28db77f523047d84LL, (jlong) 0x32caab7b40c72493LL, (jlong) 0x3c9ebe0a15c9bebcLL, (jlong) 0x431d67c49c100d4cLL, (jlong) 0x4cc5d4becb3e42b6LL, (jlong) 0x597f299cfc657e2aLL, (jlong) 0x5fcb6fab3ad6faecLL, (jlong) 0x6c44198c4a475817LL } count:80];
    J2OBJC_SET_INITIALIZED(OrgBouncycastleCryptoDigestsLongDigest)
  }
}

@end

void OrgBouncycastleCryptoDigestsLongDigest_adjustByteCounts(OrgBouncycastleCryptoDigestsLongDigest *self) {
  if (self->byteCount1_ > (jlong) 0x1fffffffffffffffLL) {
    self->byteCount2_ += (URShift64(self->byteCount1_, 61));
    self->byteCount1_ &= (jlong) 0x1fffffffffffffffLL;
  }
}

jlong OrgBouncycastleCryptoDigestsLongDigest_ChWithLong_withLong_withLong_(OrgBouncycastleCryptoDigestsLongDigest *self, jlong x, jlong y, jlong z) {
  return ((x & y) ^ ((~x) & z));
}

jlong OrgBouncycastleCryptoDigestsLongDigest_MajWithLong_withLong_withLong_(OrgBouncycastleCryptoDigestsLongDigest *self, jlong x, jlong y, jlong z) {
  return ((x & y) ^ (x & z) ^ (y & z));
}

jlong OrgBouncycastleCryptoDigestsLongDigest_Sum0WithLong_(OrgBouncycastleCryptoDigestsLongDigest *self, jlong x) {
  return ((LShift64(x, 36)) | (URShift64(x, 28))) ^ ((LShift64(x, 30)) | (URShift64(x, 34))) ^ ((LShift64(x, 25)) | (URShift64(x, 39)));
}

jlong OrgBouncycastleCryptoDigestsLongDigest_Sum1WithLong_(OrgBouncycastleCryptoDigestsLongDigest *self, jlong x) {
  return ((LShift64(x, 50)) | (URShift64(x, 14))) ^ ((LShift64(x, 46)) | (URShift64(x, 18))) ^ ((LShift64(x, 23)) | (URShift64(x, 41)));
}

jlong OrgBouncycastleCryptoDigestsLongDigest_Sigma0WithLong_(OrgBouncycastleCryptoDigestsLongDigest *self, jlong x) {
  return ((LShift64(x, 63)) | (URShift64(x, 1))) ^ ((LShift64(x, 56)) | (URShift64(x, 8))) ^ (URShift64(x, 7));
}

jlong OrgBouncycastleCryptoDigestsLongDigest_Sigma1WithLong_(OrgBouncycastleCryptoDigestsLongDigest *self, jlong x) {
  return ((LShift64(x, 45)) | (URShift64(x, 19))) ^ ((LShift64(x, 3)) | (URShift64(x, 61))) ^ (URShift64(x, 6));
}

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(OrgBouncycastleCryptoDigestsLongDigest)