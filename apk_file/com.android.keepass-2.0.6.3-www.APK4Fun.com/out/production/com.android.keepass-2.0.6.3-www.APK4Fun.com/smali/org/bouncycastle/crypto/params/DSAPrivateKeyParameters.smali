.class public Lorg/bouncycastle/crypto/params/DSAPrivateKeyParameters;
.super Lorg/bouncycastle/crypto/params/DSAKeyParameters;
.source "DSAPrivateKeyParameters.java"


# instance fields
.field private x:Ljava/math/BigInteger;


# direct methods
.method public constructor <init>(Ljava/math/BigInteger;Lorg/bouncycastle/crypto/params/DSAParameters;)V
    .locals 1
    .param p1, "x"    # Ljava/math/BigInteger;
    .param p2, "params"    # Lorg/bouncycastle/crypto/params/DSAParameters;

    .prologue
    .line 14
    const/4 v0, 0x1

    invoke-direct {p0, v0, p2}, Lorg/bouncycastle/crypto/params/DSAKeyParameters;-><init>(ZLorg/bouncycastle/crypto/params/DSAParameters;)V

    .line 16
    iput-object p1, p0, Lorg/bouncycastle/crypto/params/DSAPrivateKeyParameters;->x:Ljava/math/BigInteger;

    .line 17
    return-void
.end method


# virtual methods
.method public getX()Ljava/math/BigInteger;
    .locals 1

    .prologue
    .line 21
    iget-object v0, p0, Lorg/bouncycastle/crypto/params/DSAPrivateKeyParameters;->x:Ljava/math/BigInteger;

    return-object v0
.end method
