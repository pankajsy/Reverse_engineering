.class public Lcom/keepassdroid/dialog/ReadOnlyDialog;
.super Lcom/keepassdroid/dialog/WarningDialog;
.source "ReadOnlyDialog.java"


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 30
    const v0, 0x7f0600c9

    invoke-direct {p0, p1, v0}, Lcom/keepassdroid/dialog/WarningDialog;-><init>(Landroid/content/Context;I)V

    .line 32
    const v0, 0x7f0600a4

    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/keepassdroid/dialog/ReadOnlyDialog;->warning:Ljava/lang/String;

    .line 34
    invoke-static {}, Lcom/keepassdroid/compat/BuildCompat;->getSdkVersion()I

    move-result v0

    const/16 v1, 0x13

    if-lt v0, v1, :cond_0

    .line 35
    iget-object v0, p0, Lcom/keepassdroid/dialog/ReadOnlyDialog;->warning:Ljava/lang/String;

    const-string v1, "\n\n"

    invoke-virtual {v0, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const v1, 0x7f0600a3

    invoke-virtual {p1, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/keepassdroid/dialog/ReadOnlyDialog;->warning:Ljava/lang/String;

    .line 37
    :cond_0
    return-void
.end method
