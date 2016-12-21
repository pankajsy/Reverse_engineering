.class public Lcom/keepassdroid/database/edit/DeleteGroup;
.super Lcom/keepassdroid/database/edit/RunnableOnFinish;
.source "DeleteGroup.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/keepassdroid/database/edit/DeleteGroup$AfterDelete;
    }
.end annotation


# instance fields
.field private mAct:Lcom/keepassdroid/GroupBaseActivity;

.field private mDb:Lcom/keepassdroid/Database;

.field private mDontSave:Z

.field private mGroup:Lcom/keepassdroid/database/PwGroup;


# direct methods
.method public constructor <init>(Lcom/keepassdroid/Database;Lcom/keepassdroid/database/PwGroup;Lcom/keepassdroid/GroupBaseActivity;Lcom/keepassdroid/database/edit/OnFinish;)V
    .locals 1
    .param p1, "db"    # Lcom/keepassdroid/Database;
    .param p2, "group"    # Lcom/keepassdroid/database/PwGroup;
    .param p3, "act"    # Lcom/keepassdroid/GroupBaseActivity;
    .param p4, "finish"    # Lcom/keepassdroid/database/edit/OnFinish;

    .prologue
    .line 39
    invoke-direct {p0, p4}, Lcom/keepassdroid/database/edit/RunnableOnFinish;-><init>(Lcom/keepassdroid/database/edit/OnFinish;)V

    .line 40
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, p3, v0}, Lcom/keepassdroid/database/edit/DeleteGroup;->setMembers(Lcom/keepassdroid/Database;Lcom/keepassdroid/database/PwGroup;Lcom/keepassdroid/GroupBaseActivity;Z)V

    .line 41
    return-void
.end method

.method public constructor <init>(Lcom/keepassdroid/Database;Lcom/keepassdroid/database/PwGroup;Lcom/keepassdroid/GroupBaseActivity;Lcom/keepassdroid/database/edit/OnFinish;Z)V
    .locals 0
    .param p1, "db"    # Lcom/keepassdroid/Database;
    .param p2, "group"    # Lcom/keepassdroid/database/PwGroup;
    .param p3, "act"    # Lcom/keepassdroid/GroupBaseActivity;
    .param p4, "finish"    # Lcom/keepassdroid/database/edit/OnFinish;
    .param p5, "dontSave"    # Z

    .prologue
    .line 44
    invoke-direct {p0, p4}, Lcom/keepassdroid/database/edit/RunnableOnFinish;-><init>(Lcom/keepassdroid/database/edit/OnFinish;)V

    .line 45
    invoke-direct {p0, p1, p2, p3, p5}, Lcom/keepassdroid/database/edit/DeleteGroup;->setMembers(Lcom/keepassdroid/Database;Lcom/keepassdroid/database/PwGroup;Lcom/keepassdroid/GroupBaseActivity;Z)V

    .line 46
    return-void
.end method

.method public constructor <init>(Lcom/keepassdroid/Database;Lcom/keepassdroid/database/PwGroup;Lcom/keepassdroid/database/edit/OnFinish;Z)V
    .locals 1
    .param p1, "db"    # Lcom/keepassdroid/Database;
    .param p2, "group"    # Lcom/keepassdroid/database/PwGroup;
    .param p3, "finish"    # Lcom/keepassdroid/database/edit/OnFinish;
    .param p4, "dontSave"    # Z

    .prologue
    .line 50
    invoke-direct {p0, p3}, Lcom/keepassdroid/database/edit/RunnableOnFinish;-><init>(Lcom/keepassdroid/database/edit/OnFinish;)V

    .line 51
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0, p4}, Lcom/keepassdroid/database/edit/DeleteGroup;->setMembers(Lcom/keepassdroid/Database;Lcom/keepassdroid/database/PwGroup;Lcom/keepassdroid/GroupBaseActivity;Z)V

    .line 52
    return-void
.end method

.method static synthetic access$000(Lcom/keepassdroid/database/edit/DeleteGroup;)Lcom/keepassdroid/database/PwGroup;
    .locals 1
    .param p0, "x0"    # Lcom/keepassdroid/database/edit/DeleteGroup;

    .prologue
    .line 31
    iget-object v0, p0, Lcom/keepassdroid/database/edit/DeleteGroup;->mGroup:Lcom/keepassdroid/database/PwGroup;

    return-object v0
.end method

.method static synthetic access$100(Lcom/keepassdroid/database/edit/DeleteGroup;)Lcom/keepassdroid/Database;
    .locals 1
    .param p0, "x0"    # Lcom/keepassdroid/database/edit/DeleteGroup;

    .prologue
    .line 31
    iget-object v0, p0, Lcom/keepassdroid/database/edit/DeleteGroup;->mDb:Lcom/keepassdroid/Database;

    return-object v0
.end method

.method private setMembers(Lcom/keepassdroid/Database;Lcom/keepassdroid/database/PwGroup;Lcom/keepassdroid/GroupBaseActivity;Z)V
    .locals 2
    .param p1, "db"    # Lcom/keepassdroid/Database;
    .param p2, "group"    # Lcom/keepassdroid/database/PwGroup;
    .param p3, "act"    # Lcom/keepassdroid/GroupBaseActivity;
    .param p4, "dontSave"    # Z

    .prologue
    .line 55
    iput-object p1, p0, Lcom/keepassdroid/database/edit/DeleteGroup;->mDb:Lcom/keepassdroid/Database;

    .line 56
    iput-object p2, p0, Lcom/keepassdroid/database/edit/DeleteGroup;->mGroup:Lcom/keepassdroid/database/PwGroup;

    .line 57
    iput-object p3, p0, Lcom/keepassdroid/database/edit/DeleteGroup;->mAct:Lcom/keepassdroid/GroupBaseActivity;

    .line 58
    iput-boolean p4, p0, Lcom/keepassdroid/database/edit/DeleteGroup;->mDontSave:Z

    .line 60
    new-instance v0, Lcom/keepassdroid/database/edit/DeleteGroup$AfterDelete;

    iget-object v1, p0, Lcom/keepassdroid/database/edit/DeleteGroup;->mFinish:Lcom/keepassdroid/database/edit/OnFinish;

    invoke-direct {v0, p0, v1}, Lcom/keepassdroid/database/edit/DeleteGroup$AfterDelete;-><init>(Lcom/keepassdroid/database/edit/DeleteGroup;Lcom/keepassdroid/database/edit/OnFinish;)V

    iput-object v0, p0, Lcom/keepassdroid/database/edit/DeleteGroup;->mFinish:Lcom/keepassdroid/database/edit/OnFinish;

    .line 61
    return-void
.end method


# virtual methods
.method public run()V
    .locals 11

    .prologue
    const/4 v4, 0x0

    const/4 v5, 0x1

    .line 69
    new-instance v6, Ljava/util/ArrayList;

    iget-object v1, p0, Lcom/keepassdroid/database/edit/DeleteGroup;->mGroup:Lcom/keepassdroid/database/PwGroup;

    iget-object v1, v1, Lcom/keepassdroid/database/PwGroup;->childEntries:Ljava/util/List;

    invoke-direct {v6, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 70
    .local v6, "childEnt":Ljava/util/List;, "Ljava/util/List<Lcom/keepassdroid/database/PwEntry;>;"
    const/4 v8, 0x0

    .local v8, "i":I
    :goto_0
    invoke-interface {v6}, Ljava/util/List;->size()I

    move-result v1

    if-ge v8, v1, :cond_0

    .line 71
    new-instance v0, Lcom/keepassdroid/database/edit/DeleteEntry;

    iget-object v1, p0, Lcom/keepassdroid/database/edit/DeleteGroup;->mAct:Lcom/keepassdroid/GroupBaseActivity;

    iget-object v2, p0, Lcom/keepassdroid/database/edit/DeleteGroup;->mDb:Lcom/keepassdroid/Database;

    invoke-interface {v6, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/keepassdroid/database/PwEntry;

    invoke-direct/range {v0 .. v5}, Lcom/keepassdroid/database/edit/DeleteEntry;-><init>(Landroid/content/Context;Lcom/keepassdroid/Database;Lcom/keepassdroid/database/PwEntry;Lcom/keepassdroid/database/edit/OnFinish;Z)V

    .line 72
    .local v0, "task":Lcom/keepassdroid/database/edit/DeleteEntry;
    invoke-virtual {v0}, Lcom/keepassdroid/database/edit/DeleteEntry;->run()V

    .line 70
    add-int/lit8 v8, v8, 0x1

    goto :goto_0

    .line 76
    .end local v0    # "task":Lcom/keepassdroid/database/edit/DeleteEntry;
    :cond_0
    new-instance v7, Ljava/util/ArrayList;

    iget-object v1, p0, Lcom/keepassdroid/database/edit/DeleteGroup;->mGroup:Lcom/keepassdroid/database/PwGroup;

    iget-object v1, v1, Lcom/keepassdroid/database/PwGroup;->childGroups:Ljava/util/List;

    invoke-direct {v7, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 77
    .local v7, "childGrp":Ljava/util/List;, "Ljava/util/List<Lcom/keepassdroid/database/PwGroup;>;"
    const/4 v8, 0x0

    :goto_1
    invoke-interface {v7}, Ljava/util/List;->size()I

    move-result v1

    if-ge v8, v1, :cond_1

    .line 78
    new-instance v0, Lcom/keepassdroid/database/edit/DeleteGroup;

    iget-object v1, p0, Lcom/keepassdroid/database/edit/DeleteGroup;->mDb:Lcom/keepassdroid/Database;

    invoke-interface {v7, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/keepassdroid/database/PwGroup;

    iget-object v3, p0, Lcom/keepassdroid/database/edit/DeleteGroup;->mAct:Lcom/keepassdroid/GroupBaseActivity;

    invoke-direct/range {v0 .. v5}, Lcom/keepassdroid/database/edit/DeleteGroup;-><init>(Lcom/keepassdroid/Database;Lcom/keepassdroid/database/PwGroup;Lcom/keepassdroid/GroupBaseActivity;Lcom/keepassdroid/database/edit/OnFinish;Z)V

    .line 79
    .local v0, "task":Lcom/keepassdroid/database/edit/DeleteGroup;
    invoke-virtual {v0}, Lcom/keepassdroid/database/edit/DeleteGroup;->run()V

    .line 77
    add-int/lit8 v8, v8, 0x1

    goto :goto_1

    .line 84
    .end local v0    # "task":Lcom/keepassdroid/database/edit/DeleteGroup;
    :cond_1
    iget-object v1, p0, Lcom/keepassdroid/database/edit/DeleteGroup;->mGroup:Lcom/keepassdroid/database/PwGroup;

    invoke-virtual {v1}, Lcom/keepassdroid/database/PwGroup;->getParent()Lcom/keepassdroid/database/PwGroup;

    move-result-object v9

    .line 85
    .local v9, "parent":Lcom/keepassdroid/database/PwGroup;
    if-eqz v9, :cond_2

    .line 86
    iget-object v1, v9, Lcom/keepassdroid/database/PwGroup;->childGroups:Ljava/util/List;

    iget-object v2, p0, Lcom/keepassdroid/database/edit/DeleteGroup;->mGroup:Lcom/keepassdroid/database/PwGroup;

    invoke-interface {v1, v2}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 90
    :cond_2
    iget-object v1, p0, Lcom/keepassdroid/database/edit/DeleteGroup;->mDb:Lcom/keepassdroid/Database;

    iget-object v1, v1, Lcom/keepassdroid/Database;->pm:Lcom/keepassdroid/database/PwDatabase;

    invoke-virtual {v1}, Lcom/keepassdroid/database/PwDatabase;->getGroups()Ljava/util/List;

    move-result-object v1

    iget-object v2, p0, Lcom/keepassdroid/database/edit/DeleteGroup;->mGroup:Lcom/keepassdroid/database/PwGroup;

    invoke-interface {v1, v2}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 93
    new-instance v10, Lcom/keepassdroid/database/edit/SaveDB;

    iget-object v1, p0, Lcom/keepassdroid/database/edit/DeleteGroup;->mAct:Lcom/keepassdroid/GroupBaseActivity;

    iget-object v2, p0, Lcom/keepassdroid/database/edit/DeleteGroup;->mDb:Lcom/keepassdroid/Database;

    iget-object v3, p0, Lcom/keepassdroid/database/edit/DeleteGroup;->mFinish:Lcom/keepassdroid/database/edit/OnFinish;

    iget-boolean v4, p0, Lcom/keepassdroid/database/edit/DeleteGroup;->mDontSave:Z

    invoke-direct {v10, v1, v2, v3, v4}, Lcom/keepassdroid/database/edit/SaveDB;-><init>(Landroid/content/Context;Lcom/keepassdroid/Database;Lcom/keepassdroid/database/edit/OnFinish;Z)V

    .line 94
    .local v10, "save":Lcom/keepassdroid/database/edit/SaveDB;
    invoke-virtual {v10}, Lcom/keepassdroid/database/edit/SaveDB;->run()V

    .line 96
    return-void
.end method
