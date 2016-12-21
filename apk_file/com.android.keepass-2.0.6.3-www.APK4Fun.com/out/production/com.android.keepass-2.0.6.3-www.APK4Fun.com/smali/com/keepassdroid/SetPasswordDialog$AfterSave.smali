.class Lcom/keepassdroid/SetPasswordDialog$AfterSave;
.super Lcom/keepassdroid/database/edit/OnFinish;
.source "SetPasswordDialog.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/keepassdroid/SetPasswordDialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "AfterSave"
.end annotation


# instance fields
.field private mFinish:Lcom/keepassdroid/database/edit/FileOnFinish;

.field final synthetic this$0:Lcom/keepassdroid/SetPasswordDialog;


# direct methods
.method public constructor <init>(Lcom/keepassdroid/SetPasswordDialog;Lcom/keepassdroid/database/edit/FileOnFinish;Landroid/os/Handler;)V
    .locals 0
    .param p2, "finish"    # Lcom/keepassdroid/database/edit/FileOnFinish;
    .param p3, "handler"    # Landroid/os/Handler;

    .prologue
    .line 132
    iput-object p1, p0, Lcom/keepassdroid/SetPasswordDialog$AfterSave;->this$0:Lcom/keepassdroid/SetPasswordDialog;

    .line 133
    invoke-direct {p0, p2, p3}, Lcom/keepassdroid/database/edit/OnFinish;-><init>(Lcom/keepassdroid/database/edit/OnFinish;Landroid/os/Handler;)V

    .line 134
    iput-object p2, p0, Lcom/keepassdroid/SetPasswordDialog$AfterSave;->mFinish:Lcom/keepassdroid/database/edit/FileOnFinish;

    .line 135
    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 139
    iget-boolean v0, p0, Lcom/keepassdroid/SetPasswordDialog$AfterSave;->mSuccess:Z

    if-eqz v0, :cond_1

    .line 140
    iget-object v0, p0, Lcom/keepassdroid/SetPasswordDialog$AfterSave;->mFinish:Lcom/keepassdroid/database/edit/FileOnFinish;

    if-eqz v0, :cond_0

    .line 141
    iget-object v0, p0, Lcom/keepassdroid/SetPasswordDialog$AfterSave;->mFinish:Lcom/keepassdroid/database/edit/FileOnFinish;

    iget-object v1, p0, Lcom/keepassdroid/SetPasswordDialog$AfterSave;->this$0:Lcom/keepassdroid/SetPasswordDialog;

    # getter for: Lcom/keepassdroid/SetPasswordDialog;->mKeyfile:Landroid/net/Uri;
    invoke-static {v1}, Lcom/keepassdroid/SetPasswordDialog;->access$000(Lcom/keepassdroid/SetPasswordDialog;)Landroid/net/Uri;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/keepassdroid/database/edit/FileOnFinish;->setFilename(Landroid/net/Uri;)V

    .line 143
    :cond_0
    iget-object v0, p0, Lcom/keepassdroid/SetPasswordDialog$AfterSave;->this$0:Lcom/keepassdroid/SetPasswordDialog;

    invoke-virtual {v0}, Lcom/keepassdroid/SetPasswordDialog;->dismiss()V

    .line 148
    :goto_0
    invoke-super {p0}, Lcom/keepassdroid/database/edit/OnFinish;->run()V

    .line 149
    return-void

    .line 145
    :cond_1
    iget-object v0, p0, Lcom/keepassdroid/SetPasswordDialog$AfterSave;->this$0:Lcom/keepassdroid/SetPasswordDialog;

    invoke-virtual {v0}, Lcom/keepassdroid/SetPasswordDialog;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/keepassdroid/SetPasswordDialog$AfterSave;->displayMessage(Landroid/content/Context;)V

    goto :goto_0
.end method
