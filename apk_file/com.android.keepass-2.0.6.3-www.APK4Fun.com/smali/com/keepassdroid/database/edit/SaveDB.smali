.class public Lcom/keepassdroid/database/edit/SaveDB;
.super Lcom/keepassdroid/database/edit/RunnableOnFinish;
.source "SaveDB.java"


# instance fields
.field private mCtx:Landroid/content/Context;

.field private mDb:Lcom/keepassdroid/Database;

.field private mDontSave:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/keepassdroid/Database;Lcom/keepassdroid/database/edit/OnFinish;)V
    .locals 1
    .param p1, "ctx"    # Landroid/content/Context;
    .param p2, "db"    # Lcom/keepassdroid/Database;
    .param p3, "finish"    # Lcom/keepassdroid/database/edit/OnFinish;

    .prologue
    .line 43
    invoke-direct {p0, p3}, Lcom/keepassdroid/database/edit/RunnableOnFinish;-><init>(Lcom/keepassdroid/database/edit/OnFinish;)V

    .line 45
    iput-object p2, p0, Lcom/keepassdroid/database/edit/SaveDB;->mDb:Lcom/keepassdroid/Database;

    .line 46
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/keepassdroid/database/edit/SaveDB;->mDontSave:Z

    .line 47
    iput-object p1, p0, Lcom/keepassdroid/database/edit/SaveDB;->mCtx:Landroid/content/Context;

    .line 48
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/keepassdroid/Database;Lcom/keepassdroid/database/edit/OnFinish;Z)V
    .locals 0
    .param p1, "ctx"    # Landroid/content/Context;
    .param p2, "db"    # Lcom/keepassdroid/Database;
    .param p3, "finish"    # Lcom/keepassdroid/database/edit/OnFinish;
    .param p4, "dontSave"    # Z

    .prologue
    .line 35
    invoke-direct {p0, p3}, Lcom/keepassdroid/database/edit/RunnableOnFinish;-><init>(Lcom/keepassdroid/database/edit/OnFinish;)V

    .line 37
    iput-object p2, p0, Lcom/keepassdroid/database/edit/SaveDB;->mDb:Lcom/keepassdroid/Database;

    .line 38
    iput-boolean p4, p0, Lcom/keepassdroid/database/edit/SaveDB;->mDontSave:Z

    .line 39
    iput-object p1, p0, Lcom/keepassdroid/database/edit/SaveDB;->mCtx:Landroid/content/Context;

    .line 40
    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 53
    iget-boolean v1, p0, Lcom/keepassdroid/database/edit/SaveDB;->mDontSave:Z

    if-nez v1, :cond_0

    .line 55
    :try_start_0
    iget-object v1, p0, Lcom/keepassdroid/database/edit/SaveDB;->mDb:Lcom/keepassdroid/Database;

    iget-object v2, p0, Lcom/keepassdroid/database/edit/SaveDB;->mCtx:Landroid/content/Context;

    invoke-virtual {v1, v2}, Lcom/keepassdroid/Database;->SaveData(Landroid/content/Context;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Lcom/keepassdroid/database/exception/PwDbOutputException; {:try_start_0 .. :try_end_0} :catch_1

    .line 69
    :cond_0
    const/4 v1, 0x1

    invoke-virtual {p0, v1}, Lcom/keepassdroid/database/edit/SaveDB;->finish(Z)V

    .line 70
    :goto_0
    return-void

    .line 56
    :catch_0
    move-exception v0

    .line 57
    .local v0, "e":Ljava/io/IOException;
    const/4 v1, 0x0

    invoke-virtual {v0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v1, v2}, Lcom/keepassdroid/database/edit/SaveDB;->finish(ZLjava/lang/String;)V

    goto :goto_0

    .line 59
    .end local v0    # "e":Ljava/io/IOException;
    :catch_1
    move-exception v0

    .line 61
    .local v0, "e":Lcom/keepassdroid/database/exception/PwDbOutputException;
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method
