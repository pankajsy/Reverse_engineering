.class Lcom/keepassdroid/fileselect/FileSelectActivity$5;
.super Landroid/os/AsyncTask;
.source "FileSelectActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/keepassdroid/fileselect/FileSelectActivity;->onContextItemSelected(Landroid/view/MenuItem;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask",
        "<",
        "Ljava/lang/String;",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/keepassdroid/fileselect/FileSelectActivity;


# direct methods
.method constructor <init>(Lcom/keepassdroid/fileselect/FileSelectActivity;)V
    .locals 0
    .param p1, "this$0"    # Lcom/keepassdroid/fileselect/FileSelectActivity;

    .prologue
    .line 449
    iput-object p1, p0, Lcom/keepassdroid/fileselect/FileSelectActivity$5;->this$0:Lcom/keepassdroid/fileselect/FileSelectActivity;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    return-void
.end method


# virtual methods
.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 449
    check-cast p1, [Ljava/lang/String;

    invoke-virtual {p0, p1}, Lcom/keepassdroid/fileselect/FileSelectActivity$5;->doInBackground([Ljava/lang/String;)Ljava/lang/Void;

    move-result-object v0

    return-object v0
.end method

.method protected varargs doInBackground([Ljava/lang/String;)Ljava/lang/Void;
    .locals 3
    .param p1, "args"    # [Ljava/lang/String;

    .prologue
    const/4 v2, 0x0

    .line 451
    aget-object v0, p1, v2

    .line 452
    .local v0, "filename":Ljava/lang/String;
    iget-object v1, p0, Lcom/keepassdroid/fileselect/FileSelectActivity$5;->this$0:Lcom/keepassdroid/fileselect/FileSelectActivity;

    # getter for: Lcom/keepassdroid/fileselect/FileSelectActivity;->fileHistory:Lcom/keepassdroid/fileselect/RecentFileHistory;
    invoke-static {v1}, Lcom/keepassdroid/fileselect/FileSelectActivity;->access$000(Lcom/keepassdroid/fileselect/FileSelectActivity;)Lcom/keepassdroid/fileselect/RecentFileHistory;

    move-result-object v1

    aget-object v2, p1, v2

    invoke-static {v2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/keepassdroid/fileselect/RecentFileHistory;->deleteFile(Landroid/net/Uri;)V

    .line 453
    const/4 v1, 0x0

    return-object v1
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 449
    check-cast p1, Ljava/lang/Void;

    invoke-virtual {p0, p1}, Lcom/keepassdroid/fileselect/FileSelectActivity$5;->onPostExecute(Ljava/lang/Void;)V

    return-void
.end method

.method protected onPostExecute(Ljava/lang/Void;)V
    .locals 1
    .param p1, "v"    # Ljava/lang/Void;

    .prologue
    .line 457
    iget-object v0, p0, Lcom/keepassdroid/fileselect/FileSelectActivity$5;->this$0:Lcom/keepassdroid/fileselect/FileSelectActivity;

    # invokes: Lcom/keepassdroid/fileselect/FileSelectActivity;->refreshList()V
    invoke-static {v0}, Lcom/keepassdroid/fileselect/FileSelectActivity;->access$100(Lcom/keepassdroid/fileselect/FileSelectActivity;)V

    .line 458
    return-void
.end method
