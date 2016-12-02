.class Lcom/keepassdroid/SetPasswordDialog$1;
.super Ljava/lang/Object;
.source "SetPasswordDialog.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/keepassdroid/SetPasswordDialog;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/keepassdroid/SetPasswordDialog;


# direct methods
.method constructor <init>(Lcom/keepassdroid/SetPasswordDialog;)V
    .locals 0
    .param p1, "this$0"    # Lcom/keepassdroid/SetPasswordDialog;

    .prologue
    .line 73
    iput-object p1, p0, Lcom/keepassdroid/SetPasswordDialog$1;->this$0:Lcom/keepassdroid/SetPasswordDialog;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 15
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 76
    iget-object v1, p0, Lcom/keepassdroid/SetPasswordDialog$1;->this$0:Lcom/keepassdroid/SetPasswordDialog;

    const v2, 0x7f0b0070

    invoke-virtual {v1, v2}, Lcom/keepassdroid/SetPasswordDialog;->findViewById(I)Landroid/view/View;

    move-result-object v9

    check-cast v9, Landroid/widget/TextView;

    .line 77
    .local v9, "passView":Landroid/widget/TextView;
    invoke-virtual {v9}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v1

    invoke-interface {v1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v3

    .line 78
    .local v3, "pass":Ljava/lang/String;
    iget-object v1, p0, Lcom/keepassdroid/SetPasswordDialog$1;->this$0:Lcom/keepassdroid/SetPasswordDialog;

    const v2, 0x7f0b0071

    invoke-virtual {v1, v2}, Lcom/keepassdroid/SetPasswordDialog;->findViewById(I)Landroid/view/View;

    move-result-object v8

    check-cast v8, Landroid/widget/TextView;

    .line 79
    .local v8, "passConfView":Landroid/widget/TextView;
    invoke-virtual {v8}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v1

    invoke-interface {v1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v6

    .line 82
    .local v6, "confpass":Ljava/lang/String;
    invoke-virtual {v3, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 84
    iget-object v1, p0, Lcom/keepassdroid/SetPasswordDialog$1;->this$0:Lcom/keepassdroid/SetPasswordDialog;

    invoke-virtual {v1}, Lcom/keepassdroid/SetPasswordDialog;->getContext()Landroid/content/Context;

    move-result-object v1

    const v2, 0x7f060043

    const/4 v5, 0x1

    invoke-static {v1, v2, v5}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    .line 112
    :cond_0
    :goto_0
    return-void

    .line 88
    :cond_1
    iget-object v1, p0, Lcom/keepassdroid/SetPasswordDialog$1;->this$0:Lcom/keepassdroid/SetPasswordDialog;

    const v2, 0x7f0b006d

    invoke-virtual {v1, v2}, Lcom/keepassdroid/SetPasswordDialog;->findViewById(I)Landroid/view/View;

    move-result-object v7

    check-cast v7, Landroid/widget/TextView;

    .line 89
    .local v7, "keyfileView":Landroid/widget/TextView;
    invoke-virtual {v7}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v1

    invoke-interface {v1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/keepassdroid/utils/UriUtil;->parseDefaultFile(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v4

    .line 90
    .local v4, "keyfile":Landroid/net/Uri;
    iget-object v1, p0, Lcom/keepassdroid/SetPasswordDialog$1;->this$0:Lcom/keepassdroid/SetPasswordDialog;

    # setter for: Lcom/keepassdroid/SetPasswordDialog;->mKeyfile:Landroid/net/Uri;
    invoke-static {v1, v4}, Lcom/keepassdroid/SetPasswordDialog;->access$002(Lcom/keepassdroid/SetPasswordDialog;Landroid/net/Uri;)Landroid/net/Uri;

    .line 93
    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v1

    if-nez v1, :cond_2

    invoke-static {v4}, Lcom/keepassdroid/utils/EmptyUtils;->isNullOrEmpty(Landroid/net/Uri;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 94
    iget-object v1, p0, Lcom/keepassdroid/SetPasswordDialog$1;->this$0:Lcom/keepassdroid/SetPasswordDialog;

    invoke-virtual {v1}, Lcom/keepassdroid/SetPasswordDialog;->getContext()Landroid/content/Context;

    move-result-object v1

    const v2, 0x7f060040

    const/4 v5, 0x1

    invoke-static {v1, v2, v5}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    goto :goto_0

    .line 99
    :cond_2
    new-instance v0, Lcom/keepassdroid/database/edit/SetPassword;

    iget-object v1, p0, Lcom/keepassdroid/SetPasswordDialog$1;->this$0:Lcom/keepassdroid/SetPasswordDialog;

    invoke-virtual {v1}, Lcom/keepassdroid/SetPasswordDialog;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {}, Lcom/keepassdroid/app/App;->getDB()Lcom/keepassdroid/Database;

    move-result-object v2

    new-instance v5, Lcom/keepassdroid/SetPasswordDialog$AfterSave;

    iget-object v12, p0, Lcom/keepassdroid/SetPasswordDialog$1;->this$0:Lcom/keepassdroid/SetPasswordDialog;

    iget-object v13, p0, Lcom/keepassdroid/SetPasswordDialog$1;->this$0:Lcom/keepassdroid/SetPasswordDialog;

    # getter for: Lcom/keepassdroid/SetPasswordDialog;->mFinish:Lcom/keepassdroid/database/edit/FileOnFinish;
    invoke-static {v13}, Lcom/keepassdroid/SetPasswordDialog;->access$100(Lcom/keepassdroid/SetPasswordDialog;)Lcom/keepassdroid/database/edit/FileOnFinish;

    move-result-object v13

    new-instance v14, Landroid/os/Handler;

    invoke-direct {v14}, Landroid/os/Handler;-><init>()V

    invoke-direct {v5, v12, v13, v14}, Lcom/keepassdroid/SetPasswordDialog$AfterSave;-><init>(Lcom/keepassdroid/SetPasswordDialog;Lcom/keepassdroid/database/edit/FileOnFinish;Landroid/os/Handler;)V

    invoke-direct/range {v0 .. v5}, Lcom/keepassdroid/database/edit/SetPassword;-><init>(Landroid/content/Context;Lcom/keepassdroid/Database;Ljava/lang/String;Landroid/net/Uri;Lcom/keepassdroid/database/edit/OnFinish;)V

    .line 100
    .local v0, "sp":Lcom/keepassdroid/database/edit/SetPassword;
    new-instance v10, Lcom/keepassdroid/ProgressTask;

    iget-object v1, p0, Lcom/keepassdroid/SetPasswordDialog$1;->this$0:Lcom/keepassdroid/SetPasswordDialog;

    invoke-virtual {v1}, Lcom/keepassdroid/SetPasswordDialog;->getContext()Landroid/content/Context;

    move-result-object v1

    const v2, 0x7f060086

    invoke-direct {v10, v1, v0, v2}, Lcom/keepassdroid/ProgressTask;-><init>(Landroid/content/Context;Lcom/keepassdroid/database/edit/RunnableOnFinish;I)V

    .line 101
    .local v10, "pt":Lcom/keepassdroid/ProgressTask;
    iget-object v1, p0, Lcom/keepassdroid/SetPasswordDialog$1;->this$0:Lcom/keepassdroid/SetPasswordDialog;

    invoke-virtual {v1}, Lcom/keepassdroid/SetPasswordDialog;->getContext()Landroid/content/Context;

    move-result-object v1

    new-instance v2, Lcom/keepassdroid/SetPasswordDialog$1$1;

    invoke-direct {v2, p0, v10}, Lcom/keepassdroid/SetPasswordDialog$1$1;-><init>(Lcom/keepassdroid/SetPasswordDialog$1;Lcom/keepassdroid/ProgressTask;)V

    invoke-virtual {v0, v1, v2}, Lcom/keepassdroid/database/edit/SetPassword;->validatePassword(Landroid/content/Context;Landroid/content/DialogInterface$OnClickListener;)Z

    move-result v11

    .line 109
    .local v11, "valid":Z
    if-eqz v11, :cond_0

    .line 110
    invoke-virtual {v10}, Lcom/keepassdroid/ProgressTask;->run()V

    goto :goto_0
.end method
