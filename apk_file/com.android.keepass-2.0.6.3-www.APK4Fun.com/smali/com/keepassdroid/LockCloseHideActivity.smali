.class public abstract Lcom/keepassdroid/LockCloseHideActivity;
.super Lcom/keepassdroid/LockCloseActivity;
.source "LockCloseHideActivity.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 34
    invoke-direct {p0}, Lcom/keepassdroid/LockCloseActivity;-><init>()V

    return-void
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 3
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const/16 v2, 0x2000

    .line 38
    invoke-super {p0, p1}, Lcom/keepassdroid/LockCloseActivity;->onCreate(Landroid/os/Bundle;)V

    .line 41
    invoke-static {}, Lcom/keepassdroid/compat/BuildCompat;->getSdkVersion()I

    move-result v0

    .line 42
    .local v0, "ver":I
    const/16 v1, 0xe

    if-ge v0, v1, :cond_0

    const/16 v1, 0x9

    if-ge v0, v1, :cond_1

    .line 43
    :cond_0
    invoke-virtual {p0}, Lcom/keepassdroid/LockCloseHideActivity;->getWindow()Landroid/view/Window;

    move-result-object v1

    invoke-virtual {v1, v2, v2}, Landroid/view/Window;->setFlags(II)V

    .line 45
    :cond_1
    return-void
.end method
