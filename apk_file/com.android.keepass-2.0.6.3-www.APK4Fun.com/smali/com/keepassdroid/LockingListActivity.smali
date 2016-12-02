.class public abstract Lcom/keepassdroid/LockingListActivity;
.super Landroid/app/ListActivity;
.source "LockingListActivity.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 26
    invoke-direct {p0}, Landroid/app/ListActivity;-><init>()V

    return-void
.end method


# virtual methods
.method protected onPause()V
    .locals 0

    .prologue
    .line 29
    invoke-super {p0}, Landroid/app/ListActivity;->onPause()V

    .line 31
    invoke-static {p0}, Lcom/keepassdroid/timeout/TimeoutHelper;->pause(Landroid/app/Activity;)V

    .line 32
    return-void
.end method

.method protected onResume()V
    .locals 0

    .prologue
    .line 36
    invoke-super {p0}, Landroid/app/ListActivity;->onResume()V

    .line 38
    invoke-static {p0}, Lcom/keepassdroid/timeout/TimeoutHelper;->resume(Landroid/app/Activity;)V

    .line 39
    return-void
.end method
