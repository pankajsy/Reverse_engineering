.class public abstract Lcom/keepassdroid/crypto/finalkey/FinalKey;
.super Ljava/lang/Object;
.source "FinalKey.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public abstract transformMasterKey([B[BI)[B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method
