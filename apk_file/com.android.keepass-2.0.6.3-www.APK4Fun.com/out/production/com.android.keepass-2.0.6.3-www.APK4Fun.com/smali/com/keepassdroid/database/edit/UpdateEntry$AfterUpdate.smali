.class Lcom/keepassdroid/database/edit/UpdateEntry$AfterUpdate;
.super Lcom/keepassdroid/database/edit/OnFinish;
.source "UpdateEntry.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/keepassdroid/database/edit/UpdateEntry;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "AfterUpdate"
.end annotation


# instance fields
.field private mBackup:Lcom/keepassdroid/database/PwEntry;

.field final synthetic this$0:Lcom/keepassdroid/database/edit/UpdateEntry;


# direct methods
.method public constructor <init>(Lcom/keepassdroid/database/edit/UpdateEntry;Lcom/keepassdroid/database/PwEntry;Lcom/keepassdroid/database/edit/OnFinish;)V
    .locals 0
    .param p2, "backup"    # Lcom/keepassdroid/database/PwEntry;
    .param p3, "finish"    # Lcom/keepassdroid/database/edit/OnFinish;

    .prologue
    .line 64
    iput-object p1, p0, Lcom/keepassdroid/database/edit/UpdateEntry$AfterUpdate;->this$0:Lcom/keepassdroid/database/edit/UpdateEntry;

    .line 65
    invoke-direct {p0, p3}, Lcom/keepassdroid/database/edit/OnFinish;-><init>(Lcom/keepassdroid/database/edit/OnFinish;)V

    .line 67
    iput-object p2, p0, Lcom/keepassdroid/database/edit/UpdateEntry$AfterUpdate;->mBackup:Lcom/keepassdroid/database/PwEntry;

    .line 68
    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 72
    iget-boolean v1, p0, Lcom/keepassdroid/database/edit/UpdateEntry$AfterUpdate;->mSuccess:Z

    if-eqz v1, :cond_2

    .line 74
    iget-object v1, p0, Lcom/keepassdroid/database/edit/UpdateEntry$AfterUpdate;->mBackup:Lcom/keepassdroid/database/PwEntry;

    invoke-virtual {v1}, Lcom/keepassdroid/database/PwEntry;->getTitle()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/keepassdroid/database/edit/UpdateEntry$AfterUpdate;->this$0:Lcom/keepassdroid/database/edit/UpdateEntry;

    # getter for: Lcom/keepassdroid/database/edit/UpdateEntry;->mNewE:Lcom/keepassdroid/database/PwEntry;
    invoke-static {v2}, Lcom/keepassdroid/database/edit/UpdateEntry;->access$000(Lcom/keepassdroid/database/edit/UpdateEntry;)Lcom/keepassdroid/database/PwEntry;

    move-result-object v2

    invoke-virtual {v2}, Lcom/keepassdroid/database/PwEntry;->getTitle()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/keepassdroid/database/edit/UpdateEntry$AfterUpdate;->mBackup:Lcom/keepassdroid/database/PwEntry;

    invoke-virtual {v1}, Lcom/keepassdroid/database/PwEntry;->getIcon()Lcom/keepassdroid/database/PwIcon;

    move-result-object v1

    iget-object v2, p0, Lcom/keepassdroid/database/edit/UpdateEntry$AfterUpdate;->this$0:Lcom/keepassdroid/database/edit/UpdateEntry;

    # getter for: Lcom/keepassdroid/database/edit/UpdateEntry;->mNewE:Lcom/keepassdroid/database/PwEntry;
    invoke-static {v2}, Lcom/keepassdroid/database/edit/UpdateEntry;->access$000(Lcom/keepassdroid/database/edit/UpdateEntry;)Lcom/keepassdroid/database/PwEntry;

    move-result-object v2

    invoke-virtual {v2}, Lcom/keepassdroid/database/PwEntry;->getIcon()Lcom/keepassdroid/database/PwIcon;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 75
    :cond_0
    iget-object v1, p0, Lcom/keepassdroid/database/edit/UpdateEntry$AfterUpdate;->mBackup:Lcom/keepassdroid/database/PwEntry;

    invoke-virtual {v1}, Lcom/keepassdroid/database/PwEntry;->getParent()Lcom/keepassdroid/database/PwGroup;

    move-result-object v0

    .line 76
    .local v0, "parent":Lcom/keepassdroid/database/PwGroup;
    if-eqz v0, :cond_1

    .line 78
    invoke-virtual {v0}, Lcom/keepassdroid/database/PwGroup;->sortEntriesByName()V

    .line 81
    iget-object v1, p0, Lcom/keepassdroid/database/edit/UpdateEntry$AfterUpdate;->this$0:Lcom/keepassdroid/database/edit/UpdateEntry;

    # getter for: Lcom/keepassdroid/database/edit/UpdateEntry;->mDb:Lcom/keepassdroid/Database;
    invoke-static {v1}, Lcom/keepassdroid/database/edit/UpdateEntry;->access$100(Lcom/keepassdroid/database/edit/UpdateEntry;)Lcom/keepassdroid/Database;

    move-result-object v1

    iget-object v1, v1, Lcom/keepassdroid/Database;->dirty:Ljava/util/Set;

    invoke-interface {v1, v0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 90
    .end local v0    # "parent":Lcom/keepassdroid/database/PwGroup;
    :cond_1
    :goto_0
    invoke-super {p0}, Lcom/keepassdroid/database/edit/OnFinish;->run()V

    .line 91
    return-void

    .line 87
    :cond_2
    iget-object v1, p0, Lcom/keepassdroid/database/edit/UpdateEntry$AfterUpdate;->this$0:Lcom/keepassdroid/database/edit/UpdateEntry;

    # getter for: Lcom/keepassdroid/database/edit/UpdateEntry;->mOldE:Lcom/keepassdroid/database/PwEntry;
    invoke-static {v1}, Lcom/keepassdroid/database/edit/UpdateEntry;->access$200(Lcom/keepassdroid/database/edit/UpdateEntry;)Lcom/keepassdroid/database/PwEntry;

    move-result-object v1

    iget-object v2, p0, Lcom/keepassdroid/database/edit/UpdateEntry$AfterUpdate;->mBackup:Lcom/keepassdroid/database/PwEntry;

    invoke-virtual {v1, v2}, Lcom/keepassdroid/database/PwEntry;->assign(Lcom/keepassdroid/database/PwEntry;)V

    goto :goto_0
.end method
