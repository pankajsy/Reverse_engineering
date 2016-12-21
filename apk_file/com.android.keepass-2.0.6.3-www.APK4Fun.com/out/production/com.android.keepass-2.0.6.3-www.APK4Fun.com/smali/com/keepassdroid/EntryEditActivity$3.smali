.class Lcom/keepassdroid/EntryEditActivity$3;
.super Ljava/lang/Object;
.source "EntryEditActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/keepassdroid/EntryEditActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/keepassdroid/EntryEditActivity;


# direct methods
.method constructor <init>(Lcom/keepassdroid/EntryEditActivity;)V
    .locals 0
    .param p1, "this$0"    # Lcom/keepassdroid/EntryEditActivity;

    .prologue
    .line 170
    iput-object p1, p0, Lcom/keepassdroid/EntryEditActivity$3;->this$0:Lcom/keepassdroid/EntryEditActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 8
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 173
    iget-object v6, p0, Lcom/keepassdroid/EntryEditActivity$3;->this$0:Lcom/keepassdroid/EntryEditActivity;

    .line 175
    .local v6, "act":Lcom/keepassdroid/EntryEditActivity;
    iget-object v1, p0, Lcom/keepassdroid/EntryEditActivity$3;->this$0:Lcom/keepassdroid/EntryEditActivity;

    invoke-virtual {v1}, Lcom/keepassdroid/EntryEditActivity;->validateBeforeSaving()Z

    move-result v1

    if-nez v1, :cond_0

    .line 197
    :goto_0
    return-void

    .line 179
    :cond_0
    iget-object v1, p0, Lcom/keepassdroid/EntryEditActivity$3;->this$0:Lcom/keepassdroid/EntryEditActivity;

    invoke-virtual {v1}, Lcom/keepassdroid/EntryEditActivity;->populateNewEntry()Lcom/keepassdroid/database/PwEntry;

    move-result-object v4

    .line 181
    .local v4, "newEntry":Lcom/keepassdroid/database/PwEntry;
    invoke-virtual {v4}, Lcom/keepassdroid/database/PwEntry;->getTitle()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/keepassdroid/EntryEditActivity$3;->this$0:Lcom/keepassdroid/EntryEditActivity;

    iget-object v2, v2, Lcom/keepassdroid/EntryEditActivity;->mEntry:Lcom/keepassdroid/database/PwEntry;

    invoke-virtual {v2}, Lcom/keepassdroid/database/PwEntry;->getTitle()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 182
    iget-object v1, p0, Lcom/keepassdroid/EntryEditActivity$3;->this$0:Lcom/keepassdroid/EntryEditActivity;

    const/4 v2, 0x2

    invoke-virtual {v1, v2}, Lcom/keepassdroid/EntryEditActivity;->setResult(I)V

    .line 188
    :goto_1
    new-instance v5, Lcom/keepassdroid/EntryEditActivity$AfterSave;

    invoke-virtual {v6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v1, Landroid/os/Handler;

    invoke-direct {v1}, Landroid/os/Handler;-><init>()V

    invoke-direct {v5, v6, v1}, Lcom/keepassdroid/EntryEditActivity$AfterSave;-><init>(Lcom/keepassdroid/EntryEditActivity;Landroid/os/Handler;)V

    .line 190
    .local v5, "onFinish":Lcom/keepassdroid/database/edit/OnFinish;
    iget-object v1, p0, Lcom/keepassdroid/EntryEditActivity$3;->this$0:Lcom/keepassdroid/EntryEditActivity;

    iget-boolean v1, v1, Lcom/keepassdroid/EntryEditActivity;->mIsNew:Z

    if-eqz v1, :cond_2

    .line 191
    iget-object v1, p0, Lcom/keepassdroid/EntryEditActivity$3;->this$0:Lcom/keepassdroid/EntryEditActivity;

    invoke-static {}, Lcom/keepassdroid/app/App;->getDB()Lcom/keepassdroid/Database;

    move-result-object v2

    invoke-static {v1, v2, v4, v5}, Lcom/keepassdroid/database/edit/AddEntry;->getInstance(Landroid/content/Context;Lcom/keepassdroid/Database;Lcom/keepassdroid/database/PwEntry;Lcom/keepassdroid/database/edit/OnFinish;)Lcom/keepassdroid/database/edit/AddEntry;

    move-result-object v0

    .line 195
    .local v0, "task":Lcom/keepassdroid/database/edit/RunnableOnFinish;
    :goto_2
    new-instance v7, Lcom/keepassdroid/ProgressTask;

    const v1, 0x7f060086

    invoke-direct {v7, v6, v0, v1}, Lcom/keepassdroid/ProgressTask;-><init>(Landroid/content/Context;Lcom/keepassdroid/database/edit/RunnableOnFinish;I)V

    .line 196
    .local v7, "pt":Lcom/keepassdroid/ProgressTask;
    invoke-virtual {v7}, Lcom/keepassdroid/ProgressTask;->run()V

    goto :goto_0

    .line 184
    .end local v0    # "task":Lcom/keepassdroid/database/edit/RunnableOnFinish;
    .end local v5    # "onFinish":Lcom/keepassdroid/database/edit/OnFinish;
    .end local v7    # "pt":Lcom/keepassdroid/ProgressTask;
    :cond_1
    iget-object v1, p0, Lcom/keepassdroid/EntryEditActivity$3;->this$0:Lcom/keepassdroid/EntryEditActivity;

    const/4 v2, 0x3

    invoke-virtual {v1, v2}, Lcom/keepassdroid/EntryEditActivity;->setResult(I)V

    goto :goto_1

    .line 193
    .restart local v5    # "onFinish":Lcom/keepassdroid/database/edit/OnFinish;
    :cond_2
    new-instance v0, Lcom/keepassdroid/database/edit/UpdateEntry;

    iget-object v1, p0, Lcom/keepassdroid/EntryEditActivity$3;->this$0:Lcom/keepassdroid/EntryEditActivity;

    invoke-static {}, Lcom/keepassdroid/app/App;->getDB()Lcom/keepassdroid/Database;

    move-result-object v2

    iget-object v3, p0, Lcom/keepassdroid/EntryEditActivity$3;->this$0:Lcom/keepassdroid/EntryEditActivity;

    iget-object v3, v3, Lcom/keepassdroid/EntryEditActivity;->mEntry:Lcom/keepassdroid/database/PwEntry;

    invoke-direct/range {v0 .. v5}, Lcom/keepassdroid/database/edit/UpdateEntry;-><init>(Landroid/content/Context;Lcom/keepassdroid/Database;Lcom/keepassdroid/database/PwEntry;Lcom/keepassdroid/database/PwEntry;Lcom/keepassdroid/database/edit/OnFinish;)V

    .restart local v0    # "task":Lcom/keepassdroid/database/edit/RunnableOnFinish;
    goto :goto_2
.end method
