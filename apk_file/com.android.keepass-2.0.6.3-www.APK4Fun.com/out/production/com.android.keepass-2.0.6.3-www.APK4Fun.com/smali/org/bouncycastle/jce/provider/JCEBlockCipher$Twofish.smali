.class public Lorg/bouncycastle/jce/provider/JCEBlockCipher$Twofish;
.super Lorg/bouncycastle/jce/provider/JCEBlockCipher;
.source "JCEBlockCipher.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/bouncycastle/jce/provider/JCEBlockCipher;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Twofish"
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 894
    new-instance v0, Lorg/bouncycastle/crypto/engines/TwofishEngine;

    invoke-direct {v0}, Lorg/bouncycastle/crypto/engines/TwofishEngine;-><init>()V

    invoke-direct {p0, v0}, Lorg/bouncycastle/jce/provider/JCEBlockCipher;-><init>(Lorg/bouncycastle/crypto/BlockCipher;)V

    .line 895
    return-void
.end method
