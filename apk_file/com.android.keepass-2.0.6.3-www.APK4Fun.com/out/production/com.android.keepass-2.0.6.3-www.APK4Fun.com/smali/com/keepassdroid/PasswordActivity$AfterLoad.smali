.class final Lcom/keepassdroid/PasswordActivity$AfterLoad;
.super Lcom/keepassdroid/database/edit/OnFinish;
.source "PasswordActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/keepassdroid/PasswordActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "AfterLoad"
.end annotation


# instance fields
.field private db:Lcom/keepassdroid/Database;

.field final synthetic this$0:Lcom/keepassdroid/PasswordActivity;


# direct methods
.method public constructor <init>(Lcom/keepassdroid/PasswordActivity;Landroid/os/Handler;Lcom/keepassdroid/Database;)V
    .locals 0
    .param p2, "handler"    # Landroid/os/Handler;
    .param p3, "db"    # Lcom/keepassdroid/Database;

    .prologue
    .line 331
    iput-object p1, p0, Lcom/keepassdroid/PasswordActivity$AfterLoad;->this$0:Lcom/keepassdroid/PasswordActivity;

    .line 332
    invoke-direct {p0, p2}, Lcom/keepassdroid/database/edit/OnFinish;-><init>(Landroid/os/Handler;)V

    .line 334
    iput-object p3, p0, Lcom/keepassdroid/PasswordActivity$AfterLoad;->db:Lcom/keepassdroid/Database;

    .line 335
    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 339
    iget-object v1, p0, Lcom/keepassdroid/PasswordActivity$AfterLoad;->db:Lcom/keepassdroid/Database;

    iget-boolean v1, v1, Lcom/keepassdroid/Database;->passwordEncodingError:Z

    if-eqz v1, :cond_0

    .line 340
    new-instance v0, Lcom/keepassdroid/dialog/PasswordEncodingDialogHelper;

    invoke-direct {v0}, Lcom/keepassdroid/dialog/PasswordEncodingDialogHelper;-><init>()V

    .line 341
    .local v0, "dialog":Lcom/keepassdroid/dialog/PasswordEncodingDialogHelper;
    iget-object v1, p0, Lcom/keepassdroid/PasswordActivity$AfterLoad;->this$0:Lcom/keepassdroid/PasswordActivity;

    new-instance v2, Lcom/keepassdroid/PasswordActivity$AfterLoad$1;

    invoke-direct {v2, p0}, Lcom/keepassdroid/PasswordActivity$AfterLoad$1;-><init>(Lcom/keepassdroid/PasswordActivity$AfterLoad;)V

    invoke-virtual {v0, v1, v2}, Lcom/keepassdroid/dialog/PasswordEncodingDialogHelper;->show(Landroid/content/Context;Landroid/content/DialogInterface$OnClickListener;)V

    .line 354
    .end local v0    # "dialog":Lcom/keepassdroid/dialog/PasswordEncodingDialogHelper;
    :goto_0
    return-void

    .line 349
    :cond_0
    iget-boolean v1, p0, Lcom/keepassdroid/PasswordActivity$AfterLoad;->mSuccess:Z

    if-eqz v1, :cond_1

    .line 350
    iget-object v1, p0, Lcom/keepassdroid/PasswordActivity$AfterLoad;->this$0:Lcom/keepassdroid/PasswordActivity;

    invoke-static {v1}, Lcom/keepassdroid/GroupActivity;->Launch(Landroid/app/Activity;)V

    goto :goto_0

    .line 352
    :cond_1
    iget-object v1, p0, Lcom/keepassdroid/PasswordActivity$AfterLoad;->this$0:Lcom/keepassdroid/PasswordActivity;

    invoke-virtual {p0, v1}, Lcom/keepassdroid/PasswordActivity$AfterLoad;->displayMessage(Landroid/content/Context;)V

    goto :goto_0
.end method
