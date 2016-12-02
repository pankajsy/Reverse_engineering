.class public Lorg/bouncycastle/crypto/DataLengthException;
.super Lorg/bouncycastle/crypto/RuntimeCryptoException;
.source "DataLengthException.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 17
    invoke-direct {p0}, Lorg/bouncycastle/crypto/RuntimeCryptoException;-><init>()V

    .line 18
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 0
    .param p1, "message"    # Ljava/lang/String;

    .prologue
    .line 28
    invoke-direct {p0, p1}, Lorg/bouncycastle/crypto/RuntimeCryptoException;-><init>(Ljava/lang/String;)V

    .line 29
    return-void
.end method
