.class Lcom/keepassdroid/database/edit/DeleteEntry$AfterDelete;
.super Lcom/keepassdroid/database/edit/OnFinish;
.source "DeleteEntry.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/keepassdroid/database/edit/DeleteEntry;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "AfterDelete"
.end annotation


# instance fields
.field private mEntry:Lcom/keepassdroid/database/PwEntry;

.field private mParent:Lcom/keepassdroid/database/PwGroup;

.field private recycled:Z

.field final synthetic this$0:Lcom/keepassdroid/database/edit/DeleteEntry;


# direct methods
.method public constructor <init>(Lcom/keepassdroid/database/edit/DeleteEntry;Lcom/keepassdroid/database/edit/OnFinish;Lcom/keepassdroid/database/PwGroup;Lcom/keepassdroid/database/PwEntry;Z)V
    .locals 0
    .param p2, "finish"    # Lcom/keepassdroid/database/edit/OnFinish;
    .param p3, "parent"    # Lcom/keepassdroid/database/PwGroup;
    .param p4, "entry"    # Lcom/keepassdroid/database/PwEntry;
    .param p5, "r"    # Z

    .prologue
    .line 84
    iput-object p1, p0, Lcom/keepassdroid/database/edit/DeleteEntry$AfterDelete;->this$0:Lcom/keepassdroid/database/edit/DeleteEntry;

    .line 85
    invoke-direct {p0, p2}, Lcom/keepassdroid/database/edit/OnFinish;-><init>(Lcom/keepassdroid/database/edit/OnFinish;)V

    .line 87
    iput-object p3, p0, Lcom/keepassdroid/database/edit/DeleteEntry$AfterDelete;->mParent:Lcom/keepassdroid/database/PwGroup;

    .line 88
    iput-object p4, p0, Lcom/keepassdroid/database/edit/DeleteEntry$AfterDelete;->mEntry:Lcom/keepassdroid/database/PwEntry;

    .line 89
    iput-boolean p5, p0, Lcom/keepassdroid/database/edit/DeleteEntry$AfterDelete;->recycled:Z

    .line 90
    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .prologue
    .line 94
    iget-object v2, p0, Lcom/keepassdroid/database/edit/DeleteEntry$AfterDelete;->this$0:Lcom/keepassdroid/database/edit/DeleteEntry;

    # getter for: Lcom/keepassdroid/database/edit/DeleteEntry;->mDb:Lcom/keepassdroid/Database;
    invoke-static {v2}, Lcom/keepassdroid/database/edit/DeleteEntry;->access$000(Lcom/keepassdroid/database/edit/DeleteEntry;)Lcom/keepassdroid/Database;

    move-result-object v2

    iget-object v0, v2, Lcom/keepassdroid/Database;->pm:Lcom/keepassdroid/database/PwDatabase;

    .line 95
    .local v0, "pm":Lcom/keepassdroid/database/PwDatabase;
    iget-boolean v2, p0, Lcom/keepassdroid/database/edit/DeleteEntry$AfterDelete;->mSuccess:Z

    if-eqz v2, :cond_2

    .line 97
    iget-object v2, p0, Lcom/keepassdroid/database/edit/DeleteEntry$AfterDelete;->mParent:Lcom/keepassdroid/database/PwGroup;

    if-eqz v2, :cond_0

    .line 98
    iget-object v2, p0, Lcom/keepassdroid/database/edit/DeleteEntry$AfterDelete;->this$0:Lcom/keepassdroid/database/edit/DeleteEntry;

    # getter for: Lcom/keepassdroid/database/edit/DeleteEntry;->mDb:Lcom/keepassdroid/Database;
    invoke-static {v2}, Lcom/keepassdroid/database/edit/DeleteEntry;->access$000(Lcom/keepassdroid/database/edit/DeleteEntry;)Lcom/keepassdroid/Database;

    move-result-object v2

    iget-object v2, v2, Lcom/keepassdroid/Database;->dirty:Ljava/util/Set;

    iget-object v3, p0, Lcom/keepassdroid/database/edit/DeleteEntry$AfterDelete;->mParent:Lcom/keepassdroid/database/PwGroup;

    invoke-interface {v2, v3}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 101
    :cond_0
    iget-boolean v2, p0, Lcom/keepassdroid/database/edit/DeleteEntry$AfterDelete;->recycled:Z

    if-eqz v2, :cond_1

    .line 102
    invoke-virtual {v0}, Lcom/keepassdroid/database/PwDatabase;->getRecycleBin()Lcom/keepassdroid/database/PwGroup;

    move-result-object v1

    .line 103
    .local v1, "recycleBin":Lcom/keepassdroid/database/PwGroup;
    iget-object v2, p0, Lcom/keepassdroid/database/edit/DeleteEntry$AfterDelete;->this$0:Lcom/keepassdroid/database/edit/DeleteEntry;

    # getter for: Lcom/keepassdroid/database/edit/DeleteEntry;->mDb:Lcom/keepassdroid/Database;
    invoke-static {v2}, Lcom/keepassdroid/database/edit/DeleteEntry;->access$000(Lcom/keepassdroid/database/edit/DeleteEntry;)Lcom/keepassdroid/Database;

    move-result-object v2

    iget-object v2, v2, Lcom/keepassdroid/Database;->dirty:Ljava/util/Set;

    invoke-interface {v2, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 104
    iget-object v2, p0, Lcom/keepassdroid/database/edit/DeleteEntry$AfterDelete;->this$0:Lcom/keepassdroid/database/edit/DeleteEntry;

    # getter for: Lcom/keepassdroid/database/edit/DeleteEntry;->mDb:Lcom/keepassdroid/Database;
    invoke-static {v2}, Lcom/keepassdroid/database/edit/DeleteEntry;->access$000(Lcom/keepassdroid/database/edit/DeleteEntry;)Lcom/keepassdroid/Database;

    move-result-object v2

    iget-object v2, v2, Lcom/keepassdroid/Database;->dirty:Ljava/util/Set;

    iget-object v3, p0, Lcom/keepassdroid/database/edit/DeleteEntry$AfterDelete;->this$0:Lcom/keepassdroid/database/edit/DeleteEntry;

    # getter for: Lcom/keepassdroid/database/edit/DeleteEntry;->mDb:Lcom/keepassdroid/Database;
    invoke-static {v3}, Lcom/keepassdroid/database/edit/DeleteEntry;->access$000(Lcom/keepassdroid/database/edit/DeleteEntry;)Lcom/keepassdroid/Database;

    move-result-object v3

    iget-object v3, v3, Lcom/keepassdroid/Database;->pm:Lcom/keepassdroid/database/PwDatabase;

    iget-object v3, v3, Lcom/keepassdroid/database/PwDatabase;->rootGroup:Lcom/keepassdroid/database/PwGroup;

    invoke-interface {v2, v3}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 115
    .end local v1    # "recycleBin":Lcom/keepassdroid/database/PwGroup;
    :cond_1
    :goto_0
    invoke-super {p0}, Lcom/keepassdroid/database/edit/OnFinish;->run()V

    .line 117
    return-void

    .line 107
    :cond_2
    iget-boolean v2, p0, Lcom/keepassdroid/database/edit/DeleteEntry$AfterDelete;->recycled:Z

    if-eqz v2, :cond_3

    .line 108
    iget-object v2, p0, Lcom/keepassdroid/database/edit/DeleteEntry$AfterDelete;->mEntry:Lcom/keepassdroid/database/PwEntry;

    iget-object v3, p0, Lcom/keepassdroid/database/edit/DeleteEntry$AfterDelete;->mParent:Lcom/keepassdroid/database/PwGroup;

    invoke-virtual {v0, v2, v3}, Lcom/keepassdroid/database/PwDatabase;->undoRecycle(Lcom/keepassdroid/database/PwEntry;Lcom/keepassdroid/database/PwGroup;)V

    goto :goto_0

    .line 111
    :cond_3
    iget-object v2, p0, Lcom/keepassdroid/database/edit/DeleteEntry$AfterDelete;->mEntry:Lcom/keepassdroid/database/PwEntry;

    iget-object v3, p0, Lcom/keepassdroid/database/edit/DeleteEntry$AfterDelete;->mParent:Lcom/keepassdroid/database/PwGroup;

    invoke-virtual {v0, v2, v3}, Lcom/keepassdroid/database/PwDatabase;->undoDeleteEntry(Lcom/keepassdroid/database/PwEntry;Lcom/keepassdroid/database/PwGroup;)V

    goto :goto_0
.end method
