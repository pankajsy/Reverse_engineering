.class public Lcom/android/keepass/KeePass;
.super Landroid/app/Activity;
.source "KeePass.java"


# static fields
.field public static final EXIT_LOCK:I = 0x1

.field public static final EXIT_NORMAL:I = 0x0

.field public static final EXIT_REFRESH:I = 0x2

.field public static final EXIT_REFRESH_TITLE:I = 0x3


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 28
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    return-void
.end method

.method private startFileSelect()V
    .locals 2

    .prologue
    .line 50
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/keepassdroid/fileselect/FileSelectActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 51
    .local v0, "intent":Landroid/content/Intent;
    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/android/keepass/KeePass;->startActivityForResult(Landroid/content/Intent;I)V

    .line 52
    return-void
.end method


# virtual methods
.method protected onActivityResult(IILandroid/content/Intent;)V
    .locals 0
    .param p1, "requestCode"    # I
    .param p2, "resultCode"    # I
    .param p3, "data"    # Landroid/content/Intent;

    .prologue
    .line 61
    invoke-super {p0, p1, p2, p3}, Landroid/app/Activity;->onActivityResult(IILandroid/content/Intent;)V

    .line 63
    if-nez p2, :cond_0

    .line 64
    invoke-virtual {p0}, Lcom/android/keepass/KeePass;->finish()V

    .line 66
    :cond_0
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 0
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 37
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 40
    return-void
.end method

.method protected onDestroy()V
    .locals 0

    .prologue
    .line 56
    invoke-super {p0}, Landroid/app/Activity;->onDestroy()V

    .line 57
    return-void
.end method

.method protected onStart()V
    .locals 0

    .prologue
    .line 44
    invoke-super {p0}, Landroid/app/Activity;->onStart()V

    .line 46
    invoke-direct {p0}, Lcom/android/keepass/KeePass;->startFileSelect()V

    .line 47
    return-void
.end method
