.class public Lcom/keepassdroid/database/edit/AddEntry;
.super Lcom/keepassdroid/database/edit/RunnableOnFinish;
.source "AddEntry.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/keepassdroid/database/edit/AddEntry$AfterAdd;
    }
.end annotation


# instance fields
.field private ctx:Landroid/content/Context;

.field protected mDb:Lcom/keepassdroid/Database;

.field private mEntry:Lcom/keepassdroid/database/PwEntry;


# direct methods
.method protected constructor <init>(Landroid/content/Context;Lcom/keepassdroid/Database;Lcom/keepassdroid/database/PwEntry;Lcom/keepassdroid/database/edit/OnFinish;)V
    .locals 2
    .param p1, "ctx"    # Landroid/content/Context;
    .param p2, "db"    # Lcom/keepassdroid/Database;
    .param p3, "entry"    # Lcom/keepassdroid/database/PwEntry;
    .param p4, "finish"    # Lcom/keepassdroid/database/edit/OnFinish;

    .prologue
    .line 39
    invoke-direct {p0, p4}, Lcom/keepassdroid/database/edit/RunnableOnFinish;-><init>(Lcom/keepassdroid/database/edit/OnFinish;)V

    .line 41
    iput-object p2, p0, Lcom/keepassdroid/database/edit/AddEntry;->mDb:Lcom/keepassdroid/Database;

    .line 42
    iput-object p3, p0, Lcom/keepassdroid/database/edit/AddEntry;->mEntry:Lcom/keepassdroid/database/PwEntry;

    .line 43
    iput-object p1, p0, Lcom/keepassdroid/database/edit/AddEntry;->ctx:Landroid/content/Context;

    .line 45
    new-instance v0, Lcom/keepassdroid/database/edit/AddEntry$AfterAdd;

    iget-object v1, p0, Lcom/keepassdroid/database/edit/AddEntry;->mFinish:Lcom/keepassdroid/database/edit/OnFinish;

    invoke-direct {v0, p0, v1}, Lcom/keepassdroid/database/edit/AddEntry$AfterAdd;-><init>(Lcom/keepassdroid/database/edit/AddEntry;Lcom/keepassdroid/database/edit/OnFinish;)V

    iput-object v0, p0, Lcom/keepassdroid/database/edit/AddEntry;->mFinish:Lcom/keepassdroid/database/edit/OnFinish;

    .line 46
    return-void
.end method

.method static synthetic access$000(Lcom/keepassdroid/database/edit/AddEntry;)Lcom/keepassdroid/database/PwEntry;
    .locals 1
    .param p0, "x0"    # Lcom/keepassdroid/database/edit/AddEntry;

    .prologue
    .line 29
    iget-object v0, p0, Lcom/keepassdroid/database/edit/AddEntry;->mEntry:Lcom/keepassdroid/database/PwEntry;

    return-object v0
.end method

.method public static getInstance(Landroid/content/Context;Lcom/keepassdroid/Database;Lcom/keepassdroid/database/PwEntry;Lcom/keepassdroid/database/edit/OnFinish;)Lcom/keepassdroid/database/edit/AddEntry;
    .locals 1
    .param p0, "ctx"    # Landroid/content/Context;
    .param p1, "db"    # Lcom/keepassdroid/Database;
    .param p2, "entry"    # Lcom/keepassdroid/database/PwEntry;
    .param p3, "finish"    # Lcom/keepassdroid/database/edit/OnFinish;

    .prologue
    .line 35
    new-instance v0, Lcom/keepassdroid/database/edit/AddEntry;

    invoke-direct {v0, p0, p1, p2, p3}, Lcom/keepassdroid/database/edit/AddEntry;-><init>(Landroid/content/Context;Lcom/keepassdroid/Database;Lcom/keepassdroid/database/PwEntry;Lcom/keepassdroid/database/edit/OnFinish;)V

    return-object v0
.end method


# virtual methods
.method public run()V
    .locals 4

    .prologue
    .line 50
    iget-object v1, p0, Lcom/keepassdroid/database/edit/AddEntry;->mDb:Lcom/keepassdroid/Database;

    iget-object v1, v1, Lcom/keepassdroid/Database;->pm:Lcom/keepassdroid/database/PwDatabase;

    iget-object v2, p0, Lcom/keepassdroid/database/edit/AddEntry;->mEntry:Lcom/keepassdroid/database/PwEntry;

    iget-object v3, p0, Lcom/keepassdroid/database/edit/AddEntry;->mEntry:Lcom/keepassdroid/database/PwEntry;

    invoke-virtual {v3}, Lcom/keepassdroid/database/PwEntry;->getParent()Lcom/keepassdroid/database/PwGroup;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lcom/keepassdroid/database/PwDatabase;->addEntryTo(Lcom/keepassdroid/database/PwEntry;Lcom/keepassdroid/database/PwGroup;)V

    .line 53
    new-instance v0, Lcom/keepassdroid/database/edit/SaveDB;

    iget-object v1, p0, Lcom/keepassdroid/database/edit/AddEntry;->ctx:Landroid/content/Context;

    iget-object v2, p0, Lcom/keepassdroid/database/edit/AddEntry;->mDb:Lcom/keepassdroid/Database;

    iget-object v3, p0, Lcom/keepassdroid/database/edit/AddEntry;->mFinish:Lcom/keepassdroid/database/edit/OnFinish;

    invoke-direct {v0, v1, v2, v3}, Lcom/keepassdroid/database/edit/SaveDB;-><init>(Landroid/content/Context;Lcom/keepassdroid/Database;Lcom/keepassdroid/database/edit/OnFinish;)V

    .line 54
    .local v0, "save":Lcom/keepassdroid/database/edit/SaveDB;
    invoke-virtual {v0}, Lcom/keepassdroid/database/edit/SaveDB;->run()V

    .line 55
    return-void
.end method
