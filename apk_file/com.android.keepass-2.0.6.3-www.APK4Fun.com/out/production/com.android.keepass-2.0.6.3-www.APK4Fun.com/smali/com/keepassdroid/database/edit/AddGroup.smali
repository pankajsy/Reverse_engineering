.class public Lcom/keepassdroid/database/edit/AddGroup;
.super Lcom/keepassdroid/database/edit/RunnableOnFinish;
.source "AddGroup.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/keepassdroid/database/edit/AddGroup$AfterAdd;
    }
.end annotation


# instance fields
.field private ctx:Landroid/content/Context;

.field protected mDb:Lcom/keepassdroid/Database;

.field protected mDontSave:Z

.field private mGroup:Lcom/keepassdroid/database/PwGroup;

.field private mIconID:I

.field private mName:Ljava/lang/String;

.field private mParent:Lcom/keepassdroid/database/PwGroup;


# direct methods
.method private constructor <init>(Landroid/content/Context;Lcom/keepassdroid/Database;Ljava/lang/String;ILcom/keepassdroid/database/PwGroup;Lcom/keepassdroid/database/edit/OnFinish;Z)V
    .locals 2
    .param p1, "ctx"    # Landroid/content/Context;
    .param p2, "db"    # Lcom/keepassdroid/Database;
    .param p3, "name"    # Ljava/lang/String;
    .param p4, "iconid"    # I
    .param p5, "parent"    # Lcom/keepassdroid/database/PwGroup;
    .param p6, "finish"    # Lcom/keepassdroid/database/edit/OnFinish;
    .param p7, "dontSave"    # Z

    .prologue
    .line 44
    invoke-direct {p0, p6}, Lcom/keepassdroid/database/edit/RunnableOnFinish;-><init>(Lcom/keepassdroid/database/edit/OnFinish;)V

    .line 46
    iput-object p2, p0, Lcom/keepassdroid/database/edit/AddGroup;->mDb:Lcom/keepassdroid/Database;

    .line 47
    iput-object p3, p0, Lcom/keepassdroid/database/edit/AddGroup;->mName:Ljava/lang/String;

    .line 48
    iput p4, p0, Lcom/keepassdroid/database/edit/AddGroup;->mIconID:I

    .line 49
    iput-object p5, p0, Lcom/keepassdroid/database/edit/AddGroup;->mParent:Lcom/keepassdroid/database/PwGroup;

    .line 50
    iput-boolean p7, p0, Lcom/keepassdroid/database/edit/AddGroup;->mDontSave:Z

    .line 51
    iput-object p1, p0, Lcom/keepassdroid/database/edit/AddGroup;->ctx:Landroid/content/Context;

    .line 53
    new-instance v0, Lcom/keepassdroid/database/edit/AddGroup$AfterAdd;

    iget-object v1, p0, Lcom/keepassdroid/database/edit/AddGroup;->mFinish:Lcom/keepassdroid/database/edit/OnFinish;

    invoke-direct {v0, p0, v1}, Lcom/keepassdroid/database/edit/AddGroup$AfterAdd;-><init>(Lcom/keepassdroid/database/edit/AddGroup;Lcom/keepassdroid/database/edit/OnFinish;)V

    iput-object v0, p0, Lcom/keepassdroid/database/edit/AddGroup;->mFinish:Lcom/keepassdroid/database/edit/OnFinish;

    .line 54
    return-void
.end method

.method static synthetic access$000(Lcom/keepassdroid/database/edit/AddGroup;)Lcom/keepassdroid/database/PwGroup;
    .locals 1
    .param p0, "x0"    # Lcom/keepassdroid/database/edit/AddGroup;

    .prologue
    .line 28
    iget-object v0, p0, Lcom/keepassdroid/database/edit/AddGroup;->mParent:Lcom/keepassdroid/database/PwGroup;

    return-object v0
.end method

.method static synthetic access$100(Lcom/keepassdroid/database/edit/AddGroup;)Lcom/keepassdroid/database/PwGroup;
    .locals 1
    .param p0, "x0"    # Lcom/keepassdroid/database/edit/AddGroup;

    .prologue
    .line 28
    iget-object v0, p0, Lcom/keepassdroid/database/edit/AddGroup;->mGroup:Lcom/keepassdroid/database/PwGroup;

    return-object v0
.end method

.method public static getInstance(Landroid/content/Context;Lcom/keepassdroid/Database;Ljava/lang/String;ILcom/keepassdroid/database/PwGroup;Lcom/keepassdroid/database/edit/OnFinish;Z)Lcom/keepassdroid/database/edit/AddGroup;
    .locals 8
    .param p0, "ctx"    # Landroid/content/Context;
    .param p1, "db"    # Lcom/keepassdroid/Database;
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "iconid"    # I
    .param p4, "parent"    # Lcom/keepassdroid/database/PwGroup;
    .param p5, "finish"    # Lcom/keepassdroid/database/edit/OnFinish;
    .param p6, "dontSave"    # Z

    .prologue
    .line 39
    new-instance v0, Lcom/keepassdroid/database/edit/AddGroup;

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move v4, p3

    move-object v5, p4

    move-object v6, p5

    move v7, p6

    invoke-direct/range {v0 .. v7}, Lcom/keepassdroid/database/edit/AddGroup;-><init>(Landroid/content/Context;Lcom/keepassdroid/Database;Ljava/lang/String;ILcom/keepassdroid/database/PwGroup;Lcom/keepassdroid/database/edit/OnFinish;Z)V

    return-object v0
.end method


# virtual methods
.method public run()V
    .locals 6

    .prologue
    .line 58
    iget-object v2, p0, Lcom/keepassdroid/database/edit/AddGroup;->mDb:Lcom/keepassdroid/Database;

    iget-object v0, v2, Lcom/keepassdroid/Database;->pm:Lcom/keepassdroid/database/PwDatabase;

    .line 61
    .local v0, "pm":Lcom/keepassdroid/database/PwDatabase;
    invoke-virtual {v0}, Lcom/keepassdroid/database/PwDatabase;->createGroup()Lcom/keepassdroid/database/PwGroup;

    move-result-object v2

    iput-object v2, p0, Lcom/keepassdroid/database/edit/AddGroup;->mGroup:Lcom/keepassdroid/database/PwGroup;

    .line 62
    iget-object v2, p0, Lcom/keepassdroid/database/edit/AddGroup;->mGroup:Lcom/keepassdroid/database/PwGroup;

    iget-object v3, p0, Lcom/keepassdroid/database/edit/AddGroup;->mName:Ljava/lang/String;

    invoke-virtual {v0}, Lcom/keepassdroid/database/PwDatabase;->newGroupId()Lcom/keepassdroid/database/PwGroupId;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Lcom/keepassdroid/database/PwGroup;->initNewGroup(Ljava/lang/String;Lcom/keepassdroid/database/PwGroupId;)V

    .line 63
    iget-object v2, p0, Lcom/keepassdroid/database/edit/AddGroup;->mGroup:Lcom/keepassdroid/database/PwGroup;

    iget-object v3, p0, Lcom/keepassdroid/database/edit/AddGroup;->mDb:Lcom/keepassdroid/Database;

    iget-object v3, v3, Lcom/keepassdroid/Database;->pm:Lcom/keepassdroid/database/PwDatabase;

    iget-object v3, v3, Lcom/keepassdroid/database/PwDatabase;->iconFactory:Lcom/keepassdroid/database/PwIconFactory;

    iget v4, p0, Lcom/keepassdroid/database/edit/AddGroup;->mIconID:I

    invoke-virtual {v3, v4}, Lcom/keepassdroid/database/PwIconFactory;->getIcon(I)Lcom/keepassdroid/database/PwIconStandard;

    move-result-object v3

    iput-object v3, v2, Lcom/keepassdroid/database/PwGroup;->icon:Lcom/keepassdroid/database/PwIconStandard;

    .line 64
    iget-object v2, p0, Lcom/keepassdroid/database/edit/AddGroup;->mGroup:Lcom/keepassdroid/database/PwGroup;

    iget-object v3, p0, Lcom/keepassdroid/database/edit/AddGroup;->mParent:Lcom/keepassdroid/database/PwGroup;

    invoke-virtual {v0, v2, v3}, Lcom/keepassdroid/database/PwDatabase;->addGroupTo(Lcom/keepassdroid/database/PwGroup;Lcom/keepassdroid/database/PwGroup;)V

    .line 69
    new-instance v1, Lcom/keepassdroid/database/edit/SaveDB;

    iget-object v2, p0, Lcom/keepassdroid/database/edit/AddGroup;->ctx:Landroid/content/Context;

    iget-object v3, p0, Lcom/keepassdroid/database/edit/AddGroup;->mDb:Lcom/keepassdroid/Database;

    iget-object v4, p0, Lcom/keepassdroid/database/edit/AddGroup;->mFinish:Lcom/keepassdroid/database/edit/OnFinish;

    iget-boolean v5, p0, Lcom/keepassdroid/database/edit/AddGroup;->mDontSave:Z

    invoke-direct {v1, v2, v3, v4, v5}, Lcom/keepassdroid/database/edit/SaveDB;-><init>(Landroid/content/Context;Lcom/keepassdroid/Database;Lcom/keepassdroid/database/edit/OnFinish;Z)V

    .line 70
    .local v1, "save":Lcom/keepassdroid/database/edit/SaveDB;
    invoke-virtual {v1}, Lcom/keepassdroid/database/edit/SaveDB;->run()V

    .line 71
    return-void
.end method
