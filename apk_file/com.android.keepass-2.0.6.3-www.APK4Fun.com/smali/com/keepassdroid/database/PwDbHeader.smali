.class public abstract Lcom/keepassdroid/database/PwDbHeader;
.super Ljava/lang/Object;
.source "PwDbHeader.java"


# static fields
.field public static final PWM_DBSIG_1:I = -0x655d26fd


# instance fields
.field public encryptionIV:[B

.field public masterSeed:[B

.field public transformSeed:[B


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 30
    const/16 v0, 0x20

    new-array v0, v0, [B

    iput-object v0, p0, Lcom/keepassdroid/database/PwDbHeader;->transformSeed:[B

    .line 33
    const/16 v0, 0x10

    new-array v0, v0, [B

    iput-object v0, p0, Lcom/keepassdroid/database/PwDbHeader;->encryptionIV:[B

    return-void
.end method
