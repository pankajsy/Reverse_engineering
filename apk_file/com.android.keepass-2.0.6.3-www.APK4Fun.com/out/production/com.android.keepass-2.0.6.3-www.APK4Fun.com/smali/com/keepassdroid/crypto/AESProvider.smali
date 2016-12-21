.class public final Lcom/keepassdroid/crypto/AESProvider;
.super Ljava/security/Provider;
.source "AESProvider.java"


# static fields
.field private static final serialVersionUID:J = -0x3560fa4b948b76c2L


# direct methods
.method public constructor <init>()V
    .locals 4

    .prologue
    .line 32
    const-string v0, "AESProvider"

    const-wide/high16 v2, 0x3ff0000000000000L    # 1.0

    const-string v1, ""

    invoke-direct {p0, v0, v2, v3, v1}, Ljava/security/Provider;-><init>(Ljava/lang/String;DLjava/lang/String;)V

    .line 33
    const-string v0, "Cipher.AES"

    const-class v1, Lcom/keepassdroid/crypto/NativeAESCipherSpi;

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/keepassdroid/crypto/AESProvider;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 34
    return-void
.end method
