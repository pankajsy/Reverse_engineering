.class public abstract Lcom/keepassdroid/LockingActivity;
.super Landroid/app/Activity;
.source "LockingActivity.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 26
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    return-void
.end method


# virtual methods
.method protected onPause()V
    .locals 0

    .prologue
    .line 30
    invoke-super {p0}, Landroid/app/Activity;->onPause()V

    .line 32
    invoke-static {p0}, Lcom/keepassdroid/timeout/TimeoutHelper;->pause(Landroid/app/Activity;)V

    .line 33
    return-void
.end method

.method protected onResume()V
    .locals 0

    .prologue
    .line 37
    invoke-super {p0}, Landroid/app/Activity;->onResume()V

    .line 39
    invoke-static {p0}, Lcom/keepassdroid/timeout/TimeoutHelper;->resume(Landroid/app/Activity;)V

    .line 40
    return-void
.end method
