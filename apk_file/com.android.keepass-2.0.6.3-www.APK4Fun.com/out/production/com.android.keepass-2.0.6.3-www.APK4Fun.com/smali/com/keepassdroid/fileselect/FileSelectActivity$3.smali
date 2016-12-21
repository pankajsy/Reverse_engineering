.class Lcom/keepassdroid/fileselect/FileSelectActivity$3;
.super Ljava/lang/Object;
.source "FileSelectActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/keepassdroid/fileselect/FileSelectActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/keepassdroid/fileselect/FileSelectActivity;


# direct methods
.method constructor <init>(Lcom/keepassdroid/fileselect/FileSelectActivity;)V
    .locals 0
    .param p1, "this$0"    # Lcom/keepassdroid/fileselect/FileSelectActivity;

    .prologue
    .line 191
    iput-object p1, p0, Lcom/keepassdroid/fileselect/FileSelectActivity$3;->this$0:Lcom/keepassdroid/fileselect/FileSelectActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private lookForOpenIntentsFilePicker()V
    .locals 5

    .prologue
    .line 217
    iget-object v2, p0, Lcom/keepassdroid/fileselect/FileSelectActivity$3;->this$0:Lcom/keepassdroid/fileselect/FileSelectActivity;

    const-string v3, "org.openintents.action.PICK_FILE"

    invoke-static {v2, v3}, Lcom/keepassdroid/utils/Interaction;->isIntentAvailable(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 218
    new-instance v1, Landroid/content/Intent;

    const-string v2, "org.openintents.action.PICK_FILE"

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 219
    .local v1, "i":Landroid/content/Intent;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "file://"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/keepassdroid/fileselect/FileSelectActivity$3;->this$0:Lcom/keepassdroid/fileselect/FileSelectActivity;

    const v4, 0x7f0b0040

    invoke-static {v3, v4}, Lcom/keepassdroid/utils/Util;->getEditText(Landroid/app/Activity;I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    .line 221
    :try_start_0
    iget-object v2, p0, Lcom/keepassdroid/fileselect/FileSelectActivity$3;->this$0:Lcom/keepassdroid/fileselect/FileSelectActivity;

    const/4 v3, 0x1

    invoke-virtual {v2, v1, v3}, Lcom/keepassdroid/fileselect/FileSelectActivity;->startActivityForResult(Landroid/content/Intent;I)V
    :try_end_0
    .catch Landroid/content/ActivityNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 229
    .end local v1    # "i":Landroid/content/Intent;
    :goto_0
    return-void

    .line 222
    .restart local v1    # "i":Landroid/content/Intent;
    :catch_0
    move-exception v0

    .line 223
    .local v0, "e":Landroid/content/ActivityNotFoundException;
    invoke-direct {p0}, Lcom/keepassdroid/fileselect/FileSelectActivity$3;->showBrowserDialog()V

    goto :goto_0

    .line 227
    .end local v0    # "e":Landroid/content/ActivityNotFoundException;
    .end local v1    # "i":Landroid/content/Intent;
    :cond_0
    invoke-direct {p0}, Lcom/keepassdroid/fileselect/FileSelectActivity$3;->showBrowserDialog()V

    goto :goto_0
.end method

.method private showBrowserDialog()V
    .locals 2

    .prologue
    .line 232
    new-instance v0, Lcom/keepassdroid/fileselect/BrowserDialog;

    iget-object v1, p0, Lcom/keepassdroid/fileselect/FileSelectActivity$3;->this$0:Lcom/keepassdroid/fileselect/FileSelectActivity;

    invoke-direct {v0, v1}, Lcom/keepassdroid/fileselect/BrowserDialog;-><init>(Landroid/content/Context;)V

    .line 233
    .local v0, "diag":Lcom/keepassdroid/fileselect/BrowserDialog;
    invoke-virtual {v0}, Lcom/keepassdroid/fileselect/BrowserDialog;->show()V

    .line 234
    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 4
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 194
    iget-object v2, p0, Lcom/keepassdroid/fileselect/FileSelectActivity$3;->this$0:Lcom/keepassdroid/fileselect/FileSelectActivity;

    invoke-static {v2}, Lcom/keepassdroid/compat/StorageAF;->useStorageFramework(Landroid/content/Context;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 195
    new-instance v1, Landroid/content/Intent;

    sget-object v2, Lcom/keepassdroid/compat/StorageAF;->ACTION_OPEN_DOCUMENT:Ljava/lang/String;

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 196
    .local v1, "i":Landroid/content/Intent;
    const-string v2, "android.intent.category.OPENABLE"

    invoke-virtual {v1, v2}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    .line 197
    const-string v2, "*/*"

    invoke-virtual {v1, v2}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    .line 198
    iget-object v2, p0, Lcom/keepassdroid/fileselect/FileSelectActivity$3;->this$0:Lcom/keepassdroid/fileselect/FileSelectActivity;

    const/4 v3, 0x3

    invoke-virtual {v2, v1, v3}, Lcom/keepassdroid/fileselect/FileSelectActivity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 213
    :goto_0
    return-void

    .line 201
    .end local v1    # "i":Landroid/content/Intent;
    :cond_0
    new-instance v1, Landroid/content/Intent;

    const-string v2, "android.intent.action.GET_CONTENT"

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 202
    .restart local v1    # "i":Landroid/content/Intent;
    const-string v2, "android.intent.category.OPENABLE"

    invoke-virtual {v1, v2}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    .line 203
    const-string v2, "*/*"

    invoke-virtual {v1, v2}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    .line 206
    :try_start_0
    iget-object v2, p0, Lcom/keepassdroid/fileselect/FileSelectActivity$3;->this$0:Lcom/keepassdroid/fileselect/FileSelectActivity;

    const/4 v3, 0x2

    invoke-virtual {v2, v1, v3}, Lcom/keepassdroid/fileselect/FileSelectActivity;->startActivityForResult(Landroid/content/Intent;I)V
    :try_end_0
    .catch Landroid/content/ActivityNotFoundException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_1

    goto :goto_0

    .line 207
    :catch_0
    move-exception v0

    .line 208
    .local v0, "e":Landroid/content/ActivityNotFoundException;
    invoke-direct {p0}, Lcom/keepassdroid/fileselect/FileSelectActivity$3;->lookForOpenIntentsFilePicker()V

    goto :goto_0

    .line 209
    .end local v0    # "e":Landroid/content/ActivityNotFoundException;
    :catch_1
    move-exception v0

    .line 210
    .local v0, "e":Ljava/lang/SecurityException;
    invoke-direct {p0}, Lcom/keepassdroid/fileselect/FileSelectActivity$3;->lookForOpenIntentsFilePicker()V

    goto :goto_0
.end method
