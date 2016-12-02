.class public Lcom/keepassdroid/CancelDialog;
.super Landroid/app/Dialog;
.source "CancelDialog.java"


# instance fields
.field private mCanceled:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 30
    invoke-direct {p0, p1}, Landroid/app/Dialog;-><init>(Landroid/content/Context;)V

    .line 27
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/keepassdroid/CancelDialog;->mCanceled:Z

    .line 31
    return-void
.end method


# virtual methods
.method public cancel()V
    .locals 1

    .prologue
    .line 39
    invoke-super {p0}, Landroid/app/Dialog;->cancel()V

    .line 40
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/keepassdroid/CancelDialog;->mCanceled:Z

    .line 41
    return-void
.end method

.method public canceled()Z
    .locals 1

    .prologue
    .line 34
    iget-boolean v0, p0, Lcom/keepassdroid/CancelDialog;->mCanceled:Z

    return v0
.end method
