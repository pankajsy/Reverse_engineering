.class public Lcom/keepassdroid/database/edit/CreateDB;
.super Lcom/keepassdroid/database/edit/RunnableOnFinish;
.source "CreateDB.java"


# instance fields
.field private final DEFAULT_ENCRYPTION_ROUNDS:I

.field private ctx:Landroid/content/Context;

.field private mDontSave:Z

.field private mFilename:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;Lcom/keepassdroid/database/edit/OnFinish;Z)V
    .locals 1
    .param p1, "ctx"    # Landroid/content/Context;
    .param p2, "filename"    # Ljava/lang/String;
    .param p3, "finish"    # Lcom/keepassdroid/database/edit/OnFinish;
    .param p4, "dontSave"    # Z

    .prologue
    .line 42
    invoke-direct {p0, p3}, Lcom/keepassdroid/database/edit/RunnableOnFinish;-><init>(Lcom/keepassdroid/database/edit/OnFinish;)V

    .line 35
    const/16 v0, 0x12c

    iput v0, p0, Lcom/keepassdroid/database/edit/CreateDB;->DEFAULT_ENCRYPTION_ROUNDS:I

    .line 44
    iput-object p2, p0, Lcom/keepassdroid/database/edit/CreateDB;->mFilename:Ljava/lang/String;

    .line 45
    iput-boolean p4, p0, Lcom/keepassdroid/database/edit/CreateDB;->mDontSave:Z

    .line 46
    iput-object p1, p0, Lcom/keepassdroid/database/edit/CreateDB;->ctx:Landroid/content/Context;

    .line 47
    return-void
.end method


# virtual methods
.method public run()V
    .locals 7

    .prologue
    .line 52
    new-instance v1, Lcom/keepassdroid/Database;

    invoke-direct {v1}, Lcom/keepassdroid/Database;-><init>()V

    .line 53
    .local v1, "db":Lcom/keepassdroid/Database;
    invoke-static {v1}, Lcom/keepassdroid/app/App;->setDB(Lcom/keepassdroid/Database;)V

    .line 55
    iget-object v4, p0, Lcom/keepassdroid/database/edit/CreateDB;->mFilename:Ljava/lang/String;

    invoke-static {v4}, Lcom/keepassdroid/database/PwDatabase;->getNewDBInstance(Ljava/lang/String;)Lcom/keepassdroid/database/PwDatabase;

    move-result-object v2

    .line 56
    .local v2, "pm":Lcom/keepassdroid/database/PwDatabase;
    iget-object v4, p0, Lcom/keepassdroid/database/edit/CreateDB;->mFilename:Ljava/lang/String;

    invoke-virtual {v2, v4}, Lcom/keepassdroid/database/PwDatabase;->initNew(Ljava/lang/String;)V

    .line 59
    iput-object v2, v1, Lcom/keepassdroid/Database;->pm:Lcom/keepassdroid/database/PwDatabase;

    .line 60
    new-instance v0, Landroid/net/Uri$Builder;

    invoke-direct {v0}, Landroid/net/Uri$Builder;-><init>()V

    .line 61
    .local v0, "b":Landroid/net/Uri$Builder;
    iget-object v4, p0, Lcom/keepassdroid/database/edit/CreateDB;->mFilename:Ljava/lang/String;

    invoke-static {v4}, Lcom/keepassdroid/utils/UriUtil;->parseDefaultFile(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v4

    iput-object v4, v1, Lcom/keepassdroid/Database;->mUri:Landroid/net/Uri;

    .line 62
    invoke-virtual {v1}, Lcom/keepassdroid/Database;->setLoaded()V

    .line 63
    invoke-static {}, Lcom/keepassdroid/app/App;->clearShutdown()V

    .line 66
    new-instance v3, Lcom/keepassdroid/database/edit/SaveDB;

    iget-object v4, p0, Lcom/keepassdroid/database/edit/CreateDB;->ctx:Landroid/content/Context;

    iget-object v5, p0, Lcom/keepassdroid/database/edit/CreateDB;->mFinish:Lcom/keepassdroid/database/edit/OnFinish;

    iget-boolean v6, p0, Lcom/keepassdroid/database/edit/CreateDB;->mDontSave:Z

    invoke-direct {v3, v4, v1, v5, v6}, Lcom/keepassdroid/database/edit/SaveDB;-><init>(Landroid/content/Context;Lcom/keepassdroid/Database;Lcom/keepassdroid/database/edit/OnFinish;Z)V

    .line 67
    .local v3, "save":Lcom/keepassdroid/database/edit/SaveDB;
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/keepassdroid/database/edit/CreateDB;->mFinish:Lcom/keepassdroid/database/edit/OnFinish;

    .line 68
    invoke-virtual {v3}, Lcom/keepassdroid/database/edit/SaveDB;->run()V

    .line 69
    return-void
.end method
