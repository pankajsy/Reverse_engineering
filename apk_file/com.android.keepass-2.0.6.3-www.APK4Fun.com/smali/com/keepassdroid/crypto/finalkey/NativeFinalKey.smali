.class public Lcom/keepassdroid/crypto/finalkey/NativeFinalKey;
.super Lcom/keepassdroid/crypto/finalkey/FinalKey;
.source "NativeFinalKey.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 27
    invoke-direct {p0}, Lcom/keepassdroid/crypto/finalkey/FinalKey;-><init>()V

    return-void
.end method

.method public static availble()Z
    .locals 1

    .prologue
    .line 30
    invoke-static {}, Lcom/keepassdroid/crypto/NativeLib;->init()Z

    move-result v0

    return v0
.end method

.method private static native nTransformMasterKey([B[BI)[B
.end method


# virtual methods
.method public transformMasterKey([B[BI)[B
    .locals 1
    .param p1, "seed"    # [B
    .param p2, "key"    # [B
    .param p3, "rounds"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 35
    invoke-static {}, Lcom/keepassdroid/crypto/NativeLib;->init()Z

    .line 37
    invoke-static {p1, p2, p3}, Lcom/keepassdroid/crypto/finalkey/NativeFinalKey;->nTransformMasterKey([B[BI)[B

    move-result-object v0

    return-object v0
.end method
