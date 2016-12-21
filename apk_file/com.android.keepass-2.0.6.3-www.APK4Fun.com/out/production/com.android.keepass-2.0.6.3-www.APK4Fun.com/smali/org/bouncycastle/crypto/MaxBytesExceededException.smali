.class public Lorg/bouncycastle/crypto/MaxBytesExceededException;
.super Lorg/bouncycastle/crypto/RuntimeCryptoException;
.source "MaxBytesExceededException.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 15
    invoke-direct {p0}, Lorg/bouncycastle/crypto/RuntimeCryptoException;-><init>()V

    .line 16
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 0
    .param p1, "message"    # Ljava/lang/String;

    .prologue
    .line 26
    invoke-direct {p0, p1}, Lorg/bouncycastle/crypto/RuntimeCryptoException;-><init>(Ljava/lang/String;)V

    .line 27
    return-void
.end method
