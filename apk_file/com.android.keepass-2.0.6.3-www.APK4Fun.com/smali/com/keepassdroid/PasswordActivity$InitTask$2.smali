.class Lcom/keepassdroid/PasswordActivity$InitTask$2;
.super Ljava/lang/Object;
.source "PasswordActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/keepassdroid/PasswordActivity$InitTask;->onPostExecute(Ljava/lang/Integer;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/keepassdroid/PasswordActivity$InitTask;


# direct methods
.method constructor <init>(Lcom/keepassdroid/PasswordActivity$InitTask;)V
    .locals 0
    .param p1, "this$1"    # Lcom/keepassdroid/PasswordActivity$InitTask;

    .prologue
    .line 452
    iput-object p1, p0, Lcom/keepassdroid/PasswordActivity$InitTask$2;->this$1:Lcom/keepassdroid/PasswordActivity$InitTask;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private lookForOpenIntentsFilePicker()V
    .locals 6

    .prologue
    .line 475
    iget-object v4, p0, Lcom/keepassdroid/PasswordActivity$InitTask$2;->this$1:Lcom/keepassdroid/PasswordActivity$InitTask;

    iget-object v4, v4, Lcom/keepassdroid/PasswordActivity$InitTask;->this$0:Lcom/keepassdroid/PasswordActivity;

    const-string v5, "org.openintents.action.PICK_FILE"

    invoke-static {v4, v5}, Lcom/keepassdroid/utils/Interaction;->isIntentAvailable(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 476
    new-instance v1, Landroid/content/Intent;

    const-string v4, "org.openintents.action.PICK_FILE"

    invoke-direct {v1, v4}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 480
    .local v1, "i":Landroid/content/Intent;
    :try_start_0
    iget-object v4, p0, Lcom/keepassdroid/PasswordActivity$InitTask$2;->this$1:Lcom/keepassdroid/PasswordActivity$InitTask;

    iget-object v4, v4, Lcom/keepassdroid/PasswordActivity$InitTask;->this$0:Lcom/keepassdroid/PasswordActivity;

    # getter for: Lcom/keepassdroid/PasswordActivity;->mDbUri:Landroid/net/Uri;
    invoke-static {v4}, Lcom/keepassdroid/PasswordActivity;->access$100(Lcom/keepassdroid/PasswordActivity;)Landroid/net/Uri;

    move-result-object v4

    if-eqz v4, :cond_0

    iget-object v4, p0, Lcom/keepassdroid/PasswordActivity$InitTask$2;->this$1:Lcom/keepassdroid/PasswordActivity$InitTask;

    iget-object v4, v4, Lcom/keepassdroid/PasswordActivity$InitTask;->this$0:Lcom/keepassdroid/PasswordActivity;

    # getter for: Lcom/keepassdroid/PasswordActivity;->mDbUri:Landroid/net/Uri;
    invoke-static {v4}, Lcom/keepassdroid/PasswordActivity;->access$100(Lcom/keepassdroid/PasswordActivity;)Landroid/net/Uri;

    move-result-object v4

    invoke-virtual {v4}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v4

    if-lez v4, :cond_0

    .line 481
    iget-object v4, p0, Lcom/keepassdroid/PasswordActivity$InitTask$2;->this$1:Lcom/keepassdroid/PasswordActivity$InitTask;

    iget-object v4, v4, Lcom/keepassdroid/PasswordActivity$InitTask;->this$0:Lcom/keepassdroid/PasswordActivity;

    # getter for: Lcom/keepassdroid/PasswordActivity;->mDbUri:Landroid/net/Uri;
    invoke-static {v4}, Lcom/keepassdroid/PasswordActivity;->access$100(Lcom/keepassdroid/PasswordActivity;)Landroid/net/Uri;

    move-result-object v4

    invoke-virtual {v4}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v4

    const-string v5, "file"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 482
    new-instance v2, Ljava/io/File;

    iget-object v4, p0, Lcom/keepassdroid/PasswordActivity$InitTask$2;->this$1:Lcom/keepassdroid/PasswordActivity$InitTask;

    iget-object v4, v4, Lcom/keepassdroid/PasswordActivity$InitTask;->this$0:Lcom/keepassdroid/PasswordActivity;

    # getter for: Lcom/keepassdroid/PasswordActivity;->mDbUri:Landroid/net/Uri;
    invoke-static {v4}, Lcom/keepassdroid/PasswordActivity;->access$100(Lcom/keepassdroid/PasswordActivity;)Landroid/net/Uri;

    move-result-object v4

    invoke-virtual {v4}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v2, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 483
    .local v2, "keyfile":Ljava/io/File;
    invoke-virtual {v2}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v3

    .line 484
    .local v3, "parent":Ljava/io/File;
    if-eqz v3, :cond_0

    .line 485
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "file://"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v3}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v4

    invoke-virtual {v1, v4}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 494
    .end local v2    # "keyfile":Ljava/io/File;
    .end local v3    # "parent":Ljava/io/File;
    :cond_0
    :goto_0
    :try_start_1
    iget-object v4, p0, Lcom/keepassdroid/PasswordActivity$InitTask$2;->this$1:Lcom/keepassdroid/PasswordActivity$InitTask;

    iget-object v4, v4, Lcom/keepassdroid/PasswordActivity$InitTask;->this$0:Lcom/keepassdroid/PasswordActivity;

    const/16 v5, 0x100

    invoke-virtual {v4, v1, v5}, Lcom/keepassdroid/PasswordActivity;->startActivityForResult(Landroid/content/Intent;I)V
    :try_end_1
    .catch Landroid/content/ActivityNotFoundException; {:try_start_1 .. :try_end_1} :catch_0

    .line 501
    .end local v1    # "i":Landroid/content/Intent;
    :goto_1
    return-void

    .line 495
    .restart local v1    # "i":Landroid/content/Intent;
    :catch_0
    move-exception v0

    .line 496
    .local v0, "e":Landroid/content/ActivityNotFoundException;
    invoke-direct {p0}, Lcom/keepassdroid/PasswordActivity$InitTask$2;->showBrowserDialog()V

    goto :goto_1

    .line 499
    .end local v0    # "e":Landroid/content/ActivityNotFoundException;
    .end local v1    # "i":Landroid/content/Intent;
    :cond_1
    invoke-direct {p0}, Lcom/keepassdroid/PasswordActivity$InitTask$2;->showBrowserDialog()V

    goto :goto_1

    .line 489
    .restart local v1    # "i":Landroid/content/Intent;
    :catch_1
    move-exception v4

    goto :goto_0
.end method

.method private showBrowserDialog()V
    .locals 2

    .prologue
    .line 504
    new-instance v0, Lcom/keepassdroid/fileselect/BrowserDialog;

    iget-object v1, p0, Lcom/keepassdroid/PasswordActivity$InitTask$2;->this$1:Lcom/keepassdroid/PasswordActivity$InitTask;

    iget-object v1, v1, Lcom/keepassdroid/PasswordActivity$InitTask;->this$0:Lcom/keepassdroid/PasswordActivity;

    invoke-direct {v0, v1}, Lcom/keepassdroid/fileselect/BrowserDialog;-><init>(Landroid/content/Context;)V

    .line 505
    .local v0, "diag":Lcom/keepassdroid/fileselect/BrowserDialog;
    invoke-virtual {v0}, Lcom/keepassdroid/fileselect/BrowserDialog;->show()V

    .line 506
    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 4
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 455
    iget-object v2, p0, Lcom/keepassdroid/PasswordActivity$InitTask$2;->this$1:Lcom/keepassdroid/PasswordActivity$InitTask;

    iget-object v2, v2, Lcom/keepassdroid/PasswordActivity$InitTask;->this$0:Lcom/keepassdroid/PasswordActivity;

    invoke-static {v2}, Lcom/keepassdroid/compat/StorageAF;->useStorageFramework(Landroid/content/Context;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 456
    new-instance v1, Landroid/content/Intent;

    sget-object v2, Lcom/keepassdroid/compat/StorageAF;->ACTION_OPEN_DOCUMENT:Ljava/lang/String;

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 457
    .local v1, "i":Landroid/content/Intent;
    const-string v2, "android.intent.category.OPENABLE"

    invoke-virtual {v1, v2}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    .line 458
    const-string v2, "*/*"

    invoke-virtual {v1, v2}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    .line 459
    iget-object v2, p0, Lcom/keepassdroid/PasswordActivity$InitTask$2;->this$1:Lcom/keepassdroid/PasswordActivity$InitTask;

    iget-object v2, v2, Lcom/keepassdroid/PasswordActivity$InitTask;->this$0:Lcom/keepassdroid/PasswordActivity;

    const/16 v3, 0x102

    invoke-virtual {v2, v1, v3}, Lcom/keepassdroid/PasswordActivity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 472
    :goto_0
    return-void

    .line 462
    .end local v1    # "i":Landroid/content/Intent;
    :cond_0
    new-instance v1, Landroid/content/Intent;

    const-string v2, "android.intent.action.GET_CONTENT"

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 463
    .restart local v1    # "i":Landroid/content/Intent;
    const-string v2, "android.intent.category.OPENABLE"

    invoke-virtual {v1, v2}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    .line 464
    const-string v2, "*/*"

    invoke-virtual {v1, v2}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    .line 467
    :try_start_0
    iget-object v2, p0, Lcom/keepassdroid/PasswordActivity$InitTask$2;->this$1:Lcom/keepassdroid/PasswordActivity$InitTask;

    iget-object v2, v2, Lcom/keepassdroid/PasswordActivity$InitTask;->this$0:Lcom/keepassdroid/PasswordActivity;

    const/16 v3, 0x101

    invoke-virtual {v2, v1, v3}, Lcom/keepassdroid/PasswordActivity;->startActivityForResult(Landroid/content/Intent;I)V
    :try_end_0
    .catch Landroid/content/ActivityNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 468
    :catch_0
    move-exception v0

    .line 469
    .local v0, "e":Landroid/content/ActivityNotFoundException;
    invoke-direct {p0}, Lcom/keepassdroid/PasswordActivity$InitTask$2;->lookForOpenIntentsFilePicker()V

    goto :goto_0
.end method
