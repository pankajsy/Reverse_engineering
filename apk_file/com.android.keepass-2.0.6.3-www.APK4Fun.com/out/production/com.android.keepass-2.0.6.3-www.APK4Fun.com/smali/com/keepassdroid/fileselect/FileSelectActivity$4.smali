.class Lcom/keepassdroid/fileselect/FileSelectActivity$4;
.super Landroid/os/AsyncTask;
.source "FileSelectActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/keepassdroid/fileselect/FileSelectActivity;->onListItemClick(Landroid/widget/ListView;Landroid/view/View;IJ)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask",
        "<",
        "Ljava/lang/Integer;",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        ">;"
    }
.end annotation


# instance fields
.field fileName:Ljava/lang/String;

.field keyFile:Ljava/lang/String;

.field final synthetic this$0:Lcom/keepassdroid/fileselect/FileSelectActivity;


# direct methods
.method constructor <init>(Lcom/keepassdroid/fileselect/FileSelectActivity;)V
    .locals 0
    .param p1, "this$0"    # Lcom/keepassdroid/fileselect/FileSelectActivity;

    .prologue
    .line 318
    iput-object p1, p0, Lcom/keepassdroid/fileselect/FileSelectActivity$4;->this$0:Lcom/keepassdroid/fileselect/FileSelectActivity;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    return-void
.end method


# virtual methods
.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 318
    check-cast p1, [Ljava/lang/Integer;

    invoke-virtual {p0, p1}, Lcom/keepassdroid/fileselect/FileSelectActivity$4;->doInBackground([Ljava/lang/Integer;)Ljava/lang/Void;

    move-result-object v0

    return-object v0
.end method

.method protected varargs doInBackground([Ljava/lang/Integer;)Ljava/lang/Void;
    .locals 2
    .param p1, "args"    # [Ljava/lang/Integer;

    .prologue
    .line 322
    const/4 v1, 0x0

    aget-object v1, p1, v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .line 323
    .local v0, "position":I
    iget-object v1, p0, Lcom/keepassdroid/fileselect/FileSelectActivity$4;->this$0:Lcom/keepassdroid/fileselect/FileSelectActivity;

    # getter for: Lcom/keepassdroid/fileselect/FileSelectActivity;->fileHistory:Lcom/keepassdroid/fileselect/RecentFileHistory;
    invoke-static {v1}, Lcom/keepassdroid/fileselect/FileSelectActivity;->access$000(Lcom/keepassdroid/fileselect/FileSelectActivity;)Lcom/keepassdroid/fileselect/RecentFileHistory;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/keepassdroid/fileselect/RecentFileHistory;->getDatabaseAt(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/keepassdroid/fileselect/FileSelectActivity$4;->fileName:Ljava/lang/String;

    .line 324
    iget-object v1, p0, Lcom/keepassdroid/fileselect/FileSelectActivity$4;->this$0:Lcom/keepassdroid/fileselect/FileSelectActivity;

    # getter for: Lcom/keepassdroid/fileselect/FileSelectActivity;->fileHistory:Lcom/keepassdroid/fileselect/RecentFileHistory;
    invoke-static {v1}, Lcom/keepassdroid/fileselect/FileSelectActivity;->access$000(Lcom/keepassdroid/fileselect/FileSelectActivity;)Lcom/keepassdroid/fileselect/RecentFileHistory;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/keepassdroid/fileselect/RecentFileHistory;->getKeyfileAt(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/keepassdroid/fileselect/FileSelectActivity$4;->keyFile:Ljava/lang/String;

    .line 325
    const/4 v1, 0x0

    return-object v1
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 318
    check-cast p1, Ljava/lang/Void;

    invoke-virtual {p0, p1}, Lcom/keepassdroid/fileselect/FileSelectActivity$4;->onPostExecute(Ljava/lang/Void;)V

    return-void
.end method

.method protected onPostExecute(Ljava/lang/Void;)V
    .locals 5
    .param p1, "v"    # Ljava/lang/Void;

    .prologue
    const/4 v4, 0x1

    .line 330
    :try_start_0
    iget-object v1, p0, Lcom/keepassdroid/fileselect/FileSelectActivity$4;->this$0:Lcom/keepassdroid/fileselect/FileSelectActivity;

    iget-object v2, p0, Lcom/keepassdroid/fileselect/FileSelectActivity$4;->fileName:Ljava/lang/String;

    iget-object v3, p0, Lcom/keepassdroid/fileselect/FileSelectActivity$4;->keyFile:Ljava/lang/String;

    invoke-static {v1, v2, v3}, Lcom/keepassdroid/PasswordActivity;->Launch(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Lcom/keepassdroid/database/exception/ContentFileNotFoundException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_1

    .line 340
    :goto_0
    return-void

    .line 332
    :catch_0
    move-exception v0

    .line 333
    .local v0, "e":Lcom/keepassdroid/database/exception/ContentFileNotFoundException;
    iget-object v1, p0, Lcom/keepassdroid/fileselect/FileSelectActivity$4;->this$0:Lcom/keepassdroid/fileselect/FileSelectActivity;

    const v2, 0x7f0600a8

    invoke-static {v1, v2, v4}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v1

    .line 334
    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    goto :goto_0

    .line 336
    .end local v0    # "e":Lcom/keepassdroid/database/exception/ContentFileNotFoundException;
    :catch_1
    move-exception v0

    .line 337
    .local v0, "e":Ljava/io/FileNotFoundException;
    iget-object v1, p0, Lcom/keepassdroid/fileselect/FileSelectActivity$4;->this$0:Lcom/keepassdroid/fileselect/FileSelectActivity;

    const v2, 0x7f060002

    invoke-static {v1, v2, v4}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v1

    .line 338
    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    goto :goto_0
.end method
