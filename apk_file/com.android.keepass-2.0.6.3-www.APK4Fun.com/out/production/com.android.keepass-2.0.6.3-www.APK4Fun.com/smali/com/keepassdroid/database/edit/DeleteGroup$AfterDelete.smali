.class Lcom/keepassdroid/database/edit/DeleteGroup$AfterDelete;
.super Lcom/keepassdroid/database/edit/OnFinish;
.source "DeleteGroup.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/keepassdroid/database/edit/DeleteGroup;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "AfterDelete"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/keepassdroid/database/edit/DeleteGroup;


# direct methods
.method public constructor <init>(Lcom/keepassdroid/database/edit/DeleteGroup;Lcom/keepassdroid/database/edit/OnFinish;)V
    .locals 0
    .param p2, "finish"    # Lcom/keepassdroid/database/edit/OnFinish;

    .prologue
    .line 99
    iput-object p1, p0, Lcom/keepassdroid/database/edit/DeleteGroup$AfterDelete;->this$0:Lcom/keepassdroid/database/edit/DeleteGroup;

    .line 100
    invoke-direct {p0, p2}, Lcom/keepassdroid/database/edit/OnFinish;-><init>(Lcom/keepassdroid/database/edit/OnFinish;)V

    .line 101
    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 104
    iget-boolean v1, p0, Lcom/keepassdroid/database/edit/DeleteGroup$AfterDelete;->mSuccess:Z

    if-eqz v1, :cond_1

    .line 106
    iget-object v1, p0, Lcom/keepassdroid/database/edit/DeleteGroup$AfterDelete;->this$0:Lcom/keepassdroid/database/edit/DeleteGroup;

    # getter for: Lcom/keepassdroid/database/edit/DeleteGroup;->mDb:Lcom/keepassdroid/Database;
    invoke-static {v1}, Lcom/keepassdroid/database/edit/DeleteGroup;->access$100(Lcom/keepassdroid/database/edit/DeleteGroup;)Lcom/keepassdroid/Database;

    move-result-object v1

    iget-object v1, v1, Lcom/keepassdroid/Database;->pm:Lcom/keepassdroid/database/PwDatabase;

    iget-object v1, v1, Lcom/keepassdroid/database/PwDatabase;->groups:Ljava/util/Map;

    iget-object v2, p0, Lcom/keepassdroid/database/edit/DeleteGroup$AfterDelete;->this$0:Lcom/keepassdroid/database/edit/DeleteGroup;

    # getter for: Lcom/keepassdroid/database/edit/DeleteGroup;->mGroup:Lcom/keepassdroid/database/PwGroup;
    invoke-static {v2}, Lcom/keepassdroid/database/edit/DeleteGroup;->access$000(Lcom/keepassdroid/database/edit/DeleteGroup;)Lcom/keepassdroid/database/PwGroup;

    move-result-object v2

    invoke-virtual {v2}, Lcom/keepassdroid/database/PwGroup;->getId()Lcom/keepassdroid/database/PwGroupId;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 109
    iget-object v1, p0, Lcom/keepassdroid/database/edit/DeleteGroup$AfterDelete;->this$0:Lcom/keepassdroid/database/edit/DeleteGroup;

    # getter for: Lcom/keepassdroid/database/edit/DeleteGroup;->mDb:Lcom/keepassdroid/Database;
    invoke-static {v1}, Lcom/keepassdroid/database/edit/DeleteGroup;->access$100(Lcom/keepassdroid/database/edit/DeleteGroup;)Lcom/keepassdroid/Database;

    move-result-object v1

    iget-object v1, v1, Lcom/keepassdroid/Database;->dirty:Ljava/util/Set;

    iget-object v2, p0, Lcom/keepassdroid/database/edit/DeleteGroup$AfterDelete;->this$0:Lcom/keepassdroid/database/edit/DeleteGroup;

    # getter for: Lcom/keepassdroid/database/edit/DeleteGroup;->mGroup:Lcom/keepassdroid/database/PwGroup;
    invoke-static {v2}, Lcom/keepassdroid/database/edit/DeleteGroup;->access$000(Lcom/keepassdroid/database/edit/DeleteGroup;)Lcom/keepassdroid/database/PwGroup;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 112
    iget-object v1, p0, Lcom/keepassdroid/database/edit/DeleteGroup$AfterDelete;->this$0:Lcom/keepassdroid/database/edit/DeleteGroup;

    # getter for: Lcom/keepassdroid/database/edit/DeleteGroup;->mGroup:Lcom/keepassdroid/database/PwGroup;
    invoke-static {v1}, Lcom/keepassdroid/database/edit/DeleteGroup;->access$000(Lcom/keepassdroid/database/edit/DeleteGroup;)Lcom/keepassdroid/database/PwGroup;

    move-result-object v1

    invoke-virtual {v1}, Lcom/keepassdroid/database/PwGroup;->getParent()Lcom/keepassdroid/database/PwGroup;

    move-result-object v0

    .line 113
    .local v0, "parent":Lcom/keepassdroid/database/PwGroup;
    if-eqz v0, :cond_0

    .line 114
    iget-object v1, p0, Lcom/keepassdroid/database/edit/DeleteGroup$AfterDelete;->this$0:Lcom/keepassdroid/database/edit/DeleteGroup;

    # getter for: Lcom/keepassdroid/database/edit/DeleteGroup;->mDb:Lcom/keepassdroid/Database;
    invoke-static {v1}, Lcom/keepassdroid/database/edit/DeleteGroup;->access$100(Lcom/keepassdroid/database/edit/DeleteGroup;)Lcom/keepassdroid/Database;

    move-result-object v1

    iget-object v1, v1, Lcom/keepassdroid/Database;->dirty:Ljava/util/Set;

    invoke-interface {v1, v0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 116
    :cond_0
    iget-object v1, p0, Lcom/keepassdroid/database/edit/DeleteGroup$AfterDelete;->this$0:Lcom/keepassdroid/database/edit/DeleteGroup;

    # getter for: Lcom/keepassdroid/database/edit/DeleteGroup;->mDb:Lcom/keepassdroid/Database;
    invoke-static {v1}, Lcom/keepassdroid/database/edit/DeleteGroup;->access$100(Lcom/keepassdroid/database/edit/DeleteGroup;)Lcom/keepassdroid/Database;

    move-result-object v1

    iget-object v1, v1, Lcom/keepassdroid/Database;->dirty:Ljava/util/Set;

    iget-object v2, p0, Lcom/keepassdroid/database/edit/DeleteGroup$AfterDelete;->this$0:Lcom/keepassdroid/database/edit/DeleteGroup;

    # getter for: Lcom/keepassdroid/database/edit/DeleteGroup;->mDb:Lcom/keepassdroid/Database;
    invoke-static {v2}, Lcom/keepassdroid/database/edit/DeleteGroup;->access$100(Lcom/keepassdroid/database/edit/DeleteGroup;)Lcom/keepassdroid/Database;

    move-result-object v2

    iget-object v2, v2, Lcom/keepassdroid/Database;->pm:Lcom/keepassdroid/database/PwDatabase;

    iget-object v2, v2, Lcom/keepassdroid/database/PwDatabase;->rootGroup:Lcom/keepassdroid/database/PwGroup;

    invoke-interface {v1, v2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 122
    .end local v0    # "parent":Lcom/keepassdroid/database/PwGroup;
    :goto_0
    invoke-super {p0}, Lcom/keepassdroid/database/edit/OnFinish;->run()V

    .line 124
    return-void

    .line 119
    :cond_1
    invoke-static {}, Lcom/keepassdroid/app/App;->setShutdown()V

    goto :goto_0
.end method
