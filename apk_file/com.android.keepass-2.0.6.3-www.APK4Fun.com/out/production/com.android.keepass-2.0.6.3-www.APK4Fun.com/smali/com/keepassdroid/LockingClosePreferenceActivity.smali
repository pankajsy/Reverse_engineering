.class public Lcom/keepassdroid/LockingClosePreferenceActivity;
.super Lcom/keepassdroid/LockingPreferenceActivity;
.source "LockingClosePreferenceActivity.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 24
    invoke-direct {p0}, Lcom/keepassdroid/LockingPreferenceActivity;-><init>()V

    return-void
.end method


# virtual methods
.method protected onResume()V
    .locals 0

    .prologue
    .line 28
    invoke-super {p0}, Lcom/keepassdroid/LockingPreferenceActivity;->onResume()V

    .line 30
    invoke-static {p0}, Lcom/keepassdroid/timeout/TimeoutHelper;->checkShutdown(Landroid/app/Activity;)V

    .line 31
    return-void
.end method
