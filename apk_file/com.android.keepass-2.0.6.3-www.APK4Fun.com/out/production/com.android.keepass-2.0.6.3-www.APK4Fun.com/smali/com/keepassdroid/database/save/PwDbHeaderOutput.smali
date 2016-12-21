.class public Lcom/keepassdroid/database/save/PwDbHeaderOutput;
.super Ljava/lang/Object;
.source "PwDbHeaderOutput.java"


# instance fields
.field protected hashOfHeader:[B


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 23
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/keepassdroid/database/save/PwDbHeaderOutput;->hashOfHeader:[B

    return-void
.end method


# virtual methods
.method public getHashOfHeader()[B
    .locals 1

    .prologue
    .line 25
    iget-object v0, p0, Lcom/keepassdroid/database/save/PwDbHeaderOutput;->hashOfHeader:[B

    return-object v0
.end method
