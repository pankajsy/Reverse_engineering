.class public abstract Lcom/keepassdroid/LockCloseListActivity;
.super Lcom/keepassdroid/LockingListActivity;
.source "LockCloseListActivity.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 24
    invoke-direct {p0}, Lcom/keepassdroid/LockingListActivity;-><init>()V

    return-void
.end method


# virtual methods
.method protected onResume()V
    .locals 0

    .prologue
    .line 28
    invoke-super {p0}, Lcom/keepassdroid/LockingListActivity;->onResume()V

    .line 30
    invoke-static {p0}, Lcom/keepassdroid/timeout/TimeoutHelper;->checkShutdown(Landroid/app/Activity;)V

    .line 31
    return-void
.end method
