.class Lcom/keepassdroid/fileselect/FileSelectActivity$LaunchGroupActivity;
.super Lcom/keepassdroid/database/edit/FileOnFinish;
.source "FileSelectActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/keepassdroid/fileselect/FileSelectActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "LaunchGroupActivity"
.end annotation


# instance fields
.field private mUri:Landroid/net/Uri;

.field final synthetic this$0:Lcom/keepassdroid/fileselect/FileSelectActivity;


# direct methods
.method public constructor <init>(Lcom/keepassdroid/fileselect/FileSelectActivity;Ljava/lang/String;)V
    .locals 1
    .param p2, "filename"    # Ljava/lang/String;

    .prologue
    .line 274
    iput-object p1, p0, Lcom/keepassdroid/fileselect/FileSelectActivity$LaunchGroupActivity;->this$0:Lcom/keepassdroid/fileselect/FileSelectActivity;

    .line 275
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/keepassdroid/database/edit/FileOnFinish;-><init>(Lcom/keepassdroid/database/edit/FileOnFinish;)V

    .line 277
    invoke-static {p2}, Lcom/keepassdroid/utils/UriUtil;->parseDefaultFile(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    iput-object v0, p0, Lcom/keepassdroid/fileselect/FileSelectActivity$LaunchGroupActivity;->mUri:Landroid/net/Uri;

    .line 278
    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 282
    iget-boolean v0, p0, Lcom/keepassdroid/fileselect/FileSelectActivity$LaunchGroupActivity;->mSuccess:Z

    if-eqz v0, :cond_0

    .line 284
    iget-object v0, p0, Lcom/keepassdroid/fileselect/FileSelectActivity$LaunchGroupActivity;->this$0:Lcom/keepassdroid/fileselect/FileSelectActivity;

    # getter for: Lcom/keepassdroid/fileselect/FileSelectActivity;->fileHistory:Lcom/keepassdroid/fileselect/RecentFileHistory;
    invoke-static {v0}, Lcom/keepassdroid/fileselect/FileSelectActivity;->access$000(Lcom/keepassdroid/fileselect/FileSelectActivity;)Lcom/keepassdroid/fileselect/RecentFileHistory;

    move-result-object v0

    iget-object v1, p0, Lcom/keepassdroid/fileselect/FileSelectActivity$LaunchGroupActivity;->mUri:Landroid/net/Uri;

    invoke-virtual {p0}, Lcom/keepassdroid/fileselect/FileSelectActivity$LaunchGroupActivity;->getFilename()Landroid/net/Uri;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/keepassdroid/fileselect/RecentFileHistory;->createFile(Landroid/net/Uri;Landroid/net/Uri;)V

    .line 286
    iget-object v0, p0, Lcom/keepassdroid/fileselect/FileSelectActivity$LaunchGroupActivity;->this$0:Lcom/keepassdroid/fileselect/FileSelectActivity;

    invoke-static {v0}, Lcom/keepassdroid/GroupActivity;->Launch(Landroid/app/Activity;)V

    .line 288
    :cond_0
    return-void
.end method
