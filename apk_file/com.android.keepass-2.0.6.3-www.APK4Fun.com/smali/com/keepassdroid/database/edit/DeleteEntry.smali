.class public Lcom/keepassdroid/database/edit/DeleteEntry;
.super Lcom/keepassdroid/database/edit/RunnableOnFinish;
.source "DeleteEntry.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/keepassdroid/database/edit/DeleteEntry$AfterDelete;
    }
.end annotation


# instance fields
.field private ctx:Landroid/content/Context;

.field private mDb:Lcom/keepassdroid/Database;

.field private mDontSave:Z

.field private mEntry:Lcom/keepassdroid/database/PwEntry;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/keepassdroid/Database;Lcom/keepassdroid/database/PwEntry;Lcom/keepassdroid/database/edit/OnFinish;)V
    .locals 6
    .param p1, "ctx"    # Landroid/content/Context;
    .param p2, "db"    # Lcom/keepassdroid/Database;
    .param p3, "entry"    # Lcom/keepassdroid/database/PwEntry;
    .param p4, "finish"    # Lcom/keepassdroid/database/edit/OnFinish;

    .prologue
    .line 41
    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    invoke-direct/range {v0 .. v5}, Lcom/keepassdroid/database/edit/DeleteEntry;-><init>(Landroid/content/Context;Lcom/keepassdroid/Database;Lcom/keepassdroid/database/PwEntry;Lcom/keepassdroid/database/edit/OnFinish;Z)V

    .line 42
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/keepassdroid/Database;Lcom/keepassdroid/database/PwEntry;Lcom/keepassdroid/database/edit/OnFinish;Z)V
    .locals 0
    .param p1, "ctx"    # Landroid/content/Context;
    .param p2, "db"    # Lcom/keepassdroid/Database;
    .param p3, "entry"    # Lcom/keepassdroid/database/PwEntry;
    .param p4, "finish"    # Lcom/keepassdroid/database/edit/OnFinish;
    .param p5, "dontSave"    # Z

    .prologue
    .line 45
    invoke-direct {p0, p4}, Lcom/keepassdroid/database/edit/RunnableOnFinish;-><init>(Lcom/keepassdroid/database/edit/OnFinish;)V

    .line 47
    iput-object p2, p0, Lcom/keepassdroid/database/edit/DeleteEntry;->mDb:Lcom/keepassdroid/Database;

    .line 48
    iput-object p3, p0, Lcom/keepassdroid/database/edit/DeleteEntry;->mEntry:Lcom/keepassdroid/database/PwEntry;

    .line 49
    iput-boolean p5, p0, Lcom/keepassdroid/database/edit/DeleteEntry;->mDontSave:Z

    .line 50
    iput-object p1, p0, Lcom/keepassdroid/database/edit/DeleteEntry;->ctx:Landroid/content/Context;

    .line 52
    return-void
.end method

.method static synthetic access$000(Lcom/keepassdroid/database/edit/DeleteEntry;)Lcom/keepassdroid/Database;
    .locals 1
    .param p0, "x0"    # Lcom/keepassdroid/database/edit/DeleteEntry;

    .prologue
    .line 33
    iget-object v0, p0, Lcom/keepassdroid/database/edit/DeleteEntry;->mDb:Lcom/keepassdroid/Database;

    return-object v0
.end method


# virtual methods
.method public run()V
    .locals 8

    .prologue
    .line 56
    iget-object v0, p0, Lcom/keepassdroid/database/edit/DeleteEntry;->mDb:Lcom/keepassdroid/Database;

    iget-object v6, v0, Lcom/keepassdroid/Database;->pm:Lcom/keepassdroid/database/PwDatabase;

    .line 57
    .local v6, "pm":Lcom/keepassdroid/database/PwDatabase;
    iget-object v0, p0, Lcom/keepassdroid/database/edit/DeleteEntry;->mEntry:Lcom/keepassdroid/database/PwEntry;

    invoke-virtual {v0}, Lcom/keepassdroid/database/PwEntry;->getParent()Lcom/keepassdroid/database/PwGroup;

    move-result-object v3

    .line 60
    .local v3, "parent":Lcom/keepassdroid/database/PwGroup;
    iget-object v0, p0, Lcom/keepassdroid/database/edit/DeleteEntry;->mEntry:Lcom/keepassdroid/database/PwEntry;

    invoke-virtual {v6, v0}, Lcom/keepassdroid/database/PwDatabase;->canRecycle(Lcom/keepassdroid/database/PwEntry;)Z

    move-result v5

    .line 61
    .local v5, "recycle":Z
    if-eqz v5, :cond_0

    .line 62
    iget-object v0, p0, Lcom/keepassdroid/database/edit/DeleteEntry;->mEntry:Lcom/keepassdroid/database/PwEntry;

    invoke-virtual {v6, v0}, Lcom/keepassdroid/database/PwDatabase;->recycle(Lcom/keepassdroid/database/PwEntry;)V

    .line 69
    :goto_0
    new-instance v0, Lcom/keepassdroid/database/edit/DeleteEntry$AfterDelete;

    iget-object v2, p0, Lcom/keepassdroid/database/edit/DeleteEntry;->mFinish:Lcom/keepassdroid/database/edit/OnFinish;

    iget-object v4, p0, Lcom/keepassdroid/database/edit/DeleteEntry;->mEntry:Lcom/keepassdroid/database/PwEntry;

    move-object v1, p0

    invoke-direct/range {v0 .. v5}, Lcom/keepassdroid/database/edit/DeleteEntry$AfterDelete;-><init>(Lcom/keepassdroid/database/edit/DeleteEntry;Lcom/keepassdroid/database/edit/OnFinish;Lcom/keepassdroid/database/PwGroup;Lcom/keepassdroid/database/PwEntry;Z)V

    iput-object v0, p0, Lcom/keepassdroid/database/edit/DeleteEntry;->mFinish:Lcom/keepassdroid/database/edit/OnFinish;

    .line 72
    new-instance v7, Lcom/keepassdroid/database/edit/SaveDB;

    iget-object v0, p0, Lcom/keepassdroid/database/edit/DeleteEntry;->ctx:Landroid/content/Context;

    iget-object v1, p0, Lcom/keepassdroid/database/edit/DeleteEntry;->mDb:Lcom/keepassdroid/Database;

    iget-object v2, p0, Lcom/keepassdroid/database/edit/DeleteEntry;->mFinish:Lcom/keepassdroid/database/edit/OnFinish;

    iget-boolean v4, p0, Lcom/keepassdroid/database/edit/DeleteEntry;->mDontSave:Z

    invoke-direct {v7, v0, v1, v2, v4}, Lcom/keepassdroid/database/edit/SaveDB;-><init>(Landroid/content/Context;Lcom/keepassdroid/Database;Lcom/keepassdroid/database/edit/OnFinish;Z)V

    .line 73
    .local v7, "save":Lcom/keepassdroid/database/edit/SaveDB;
    invoke-virtual {v7}, Lcom/keepassdroid/database/edit/SaveDB;->run()V

    .line 76
    return-void

    .line 65
    .end local v7    # "save":Lcom/keepassdroid/database/edit/SaveDB;
    :cond_0
    iget-object v0, p0, Lcom/keepassdroid/database/edit/DeleteEntry;->mEntry:Lcom/keepassdroid/database/PwEntry;

    invoke-virtual {v6, v0}, Lcom/keepassdroid/database/PwDatabase;->deleteEntry(Lcom/keepassdroid/database/PwEntry;)V

    goto :goto_0
.end method
