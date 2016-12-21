.class public Lcom/keepassdroid/database/edit/LoadDB;
.super Lcom/keepassdroid/database/edit/RunnableOnFinish;
.source "LoadDB.java"


# instance fields
.field private mCtx:Landroid/content/Context;

.field private mDb:Lcom/keepassdroid/Database;

.field private mKey:Landroid/net/Uri;

.field private mPass:Ljava/lang/String;

.field private mRememberKeyfile:Z

.field private mUri:Landroid/net/Uri;


# direct methods
.method public constructor <init>(Lcom/keepassdroid/Database;Landroid/content/Context;Landroid/net/Uri;Ljava/lang/String;Landroid/net/Uri;Lcom/keepassdroid/database/edit/OnFinish;)V
    .locals 4
    .param p1, "db"    # Lcom/keepassdroid/Database;
    .param p2, "ctx"    # Landroid/content/Context;
    .param p3, "uri"    # Landroid/net/Uri;
    .param p4, "pass"    # Ljava/lang/String;
    .param p5, "key"    # Landroid/net/Uri;
    .param p6, "finish"    # Lcom/keepassdroid/database/edit/OnFinish;

    .prologue
    .line 52
    invoke-direct {p0, p6}, Lcom/keepassdroid/database/edit/RunnableOnFinish;-><init>(Lcom/keepassdroid/database/edit/OnFinish;)V

    .line 54
    iput-object p1, p0, Lcom/keepassdroid/database/edit/LoadDB;->mDb:Lcom/keepassdroid/Database;

    .line 55
    iput-object p2, p0, Lcom/keepassdroid/database/edit/LoadDB;->mCtx:Landroid/content/Context;

    .line 56
    iput-object p3, p0, Lcom/keepassdroid/database/edit/LoadDB;->mUri:Landroid/net/Uri;

    .line 57
    iput-object p4, p0, Lcom/keepassdroid/database/edit/LoadDB;->mPass:Ljava/lang/String;

    .line 58
    iput-object p5, p0, Lcom/keepassdroid/database/edit/LoadDB;->mKey:Landroid/net/Uri;

    .line 60
    invoke-static {p2}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 61
    .local v0, "prefs":Landroid/content/SharedPreferences;
    const v1, 0x7f0600be

    invoke-virtual {p2, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const/high16 v3, 0x7f080000

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v2

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    iput-boolean v1, p0, Lcom/keepassdroid/database/edit/LoadDB;->mRememberKeyfile:Z

    .line 62
    return-void
.end method

.method private saveFileData(Landroid/net/Uri;Landroid/net/Uri;)V
    .locals 1
    .param p1, "uri"    # Landroid/net/Uri;
    .param p2, "key"    # Landroid/net/Uri;

    .prologue
    .line 113
    iget-boolean v0, p0, Lcom/keepassdroid/database/edit/LoadDB;->mRememberKeyfile:Z

    if-nez v0, :cond_0

    .line 114
    const/4 p2, 0x0

    .line 117
    :cond_0
    invoke-static {}, Lcom/keepassdroid/app/App;->getFileHistory()Lcom/keepassdroid/fileselect/RecentFileHistory;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Lcom/keepassdroid/fileselect/RecentFileHistory;->createFile(Landroid/net/Uri;Landroid/net/Uri;)V

    .line 118
    return-void
.end method


# virtual methods
.method public run()V
    .locals 8

    .prologue
    const/4 v7, 0x0

    .line 67
    :try_start_0
    iget-object v0, p0, Lcom/keepassdroid/database/edit/LoadDB;->mDb:Lcom/keepassdroid/Database;

    iget-object v1, p0, Lcom/keepassdroid/database/edit/LoadDB;->mCtx:Landroid/content/Context;

    iget-object v2, p0, Lcom/keepassdroid/database/edit/LoadDB;->mUri:Landroid/net/Uri;

    iget-object v3, p0, Lcom/keepassdroid/database/edit/LoadDB;->mPass:Ljava/lang/String;

    iget-object v4, p0, Lcom/keepassdroid/database/edit/LoadDB;->mKey:Landroid/net/Uri;

    iget-object v5, p0, Lcom/keepassdroid/database/edit/LoadDB;->mStatus:Lcom/keepassdroid/UpdateStatus;

    invoke-virtual/range {v0 .. v5}, Lcom/keepassdroid/Database;->LoadData(Landroid/content/Context;Landroid/net/Uri;Ljava/lang/String;Landroid/net/Uri;Lcom/keepassdroid/UpdateStatus;)V

    .line 69
    iget-object v0, p0, Lcom/keepassdroid/database/edit/LoadDB;->mUri:Landroid/net/Uri;

    iget-object v1, p0, Lcom/keepassdroid/database/edit/LoadDB;->mKey:Landroid/net/Uri;

    invoke-direct {p0, v0, v1}, Lcom/keepassdroid/database/edit/LoadDB;->saveFileData(Landroid/net/Uri;Landroid/net/Uri;)V
    :try_end_0
    .catch Lcom/keepassdroid/database/exception/ArcFourException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Lcom/keepassdroid/database/exception/InvalidPasswordException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Lcom/keepassdroid/database/exception/ContentFileNotFoundException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_3
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_4
    .catch Lcom/keepassdroid/database/exception/KeyFileEmptyException; {:try_start_0 .. :try_end_0} :catch_5
    .catch Lcom/keepassdroid/database/exception/InvalidAlgorithmException; {:try_start_0 .. :try_end_0} :catch_6
    .catch Lcom/keepassdroid/database/exception/InvalidKeyFileException; {:try_start_0 .. :try_end_0} :catch_7
    .catch Lcom/keepassdroid/database/exception/InvalidDBSignatureException; {:try_start_0 .. :try_end_0} :catch_8
    .catch Lcom/keepassdroid/database/exception/InvalidDBVersionException; {:try_start_0 .. :try_end_0} :catch_9
    .catch Lcom/keepassdroid/database/exception/InvalidDBException; {:try_start_0 .. :try_end_0} :catch_a
    .catch Ljava/lang/OutOfMemoryError; {:try_start_0 .. :try_end_0} :catch_b

    .line 109
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/keepassdroid/database/edit/LoadDB;->finish(Z)V

    .line 110
    :goto_0
    return-void

    .line 71
    :catch_0
    move-exception v6

    .line 72
    .local v6, "e":Lcom/keepassdroid/database/exception/ArcFourException;
    iget-object v0, p0, Lcom/keepassdroid/database/edit/LoadDB;->mCtx:Landroid/content/Context;

    const v1, 0x7f060034

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v7, v0}, Lcom/keepassdroid/database/edit/LoadDB;->finish(ZLjava/lang/String;)V

    goto :goto_0

    .line 74
    .end local v6    # "e":Lcom/keepassdroid/database/exception/ArcFourException;
    :catch_1
    move-exception v6

    .line 75
    .local v6, "e":Lcom/keepassdroid/database/exception/InvalidPasswordException;
    iget-object v0, p0, Lcom/keepassdroid/database/edit/LoadDB;->mCtx:Landroid/content/Context;

    const v1, 0x7f060003

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v7, v0}, Lcom/keepassdroid/database/edit/LoadDB;->finish(ZLjava/lang/String;)V

    goto :goto_0

    .line 77
    .end local v6    # "e":Lcom/keepassdroid/database/exception/InvalidPasswordException;
    :catch_2
    move-exception v6

    .line 78
    .local v6, "e":Lcom/keepassdroid/database/exception/ContentFileNotFoundException;
    iget-object v0, p0, Lcom/keepassdroid/database/edit/LoadDB;->mCtx:Landroid/content/Context;

    const v1, 0x7f0600a8

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v7, v0}, Lcom/keepassdroid/database/edit/LoadDB;->finish(ZLjava/lang/String;)V

    goto :goto_0

    .line 80
    .end local v6    # "e":Lcom/keepassdroid/database/exception/ContentFileNotFoundException;
    :catch_3
    move-exception v6

    .line 81
    .local v6, "e":Ljava/io/FileNotFoundException;
    iget-object v0, p0, Lcom/keepassdroid/database/edit/LoadDB;->mCtx:Landroid/content/Context;

    const v1, 0x7f060002

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v7, v0}, Lcom/keepassdroid/database/edit/LoadDB;->finish(ZLjava/lang/String;)V

    goto :goto_0

    .line 83
    .end local v6    # "e":Ljava/io/FileNotFoundException;
    :catch_4
    move-exception v6

    .line 84
    .local v6, "e":Ljava/io/IOException;
    invoke-virtual {v6}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v7, v0}, Lcom/keepassdroid/database/edit/LoadDB;->finish(ZLjava/lang/String;)V

    goto :goto_0

    .line 86
    .end local v6    # "e":Ljava/io/IOException;
    :catch_5
    move-exception v6

    .line 87
    .local v6, "e":Lcom/keepassdroid/database/exception/KeyFileEmptyException;
    iget-object v0, p0, Lcom/keepassdroid/database/edit/LoadDB;->mCtx:Landroid/content/Context;

    const v1, 0x7f0600a1

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v7, v0}, Lcom/keepassdroid/database/edit/LoadDB;->finish(ZLjava/lang/String;)V

    goto :goto_0

    .line 89
    .end local v6    # "e":Lcom/keepassdroid/database/exception/KeyFileEmptyException;
    :catch_6
    move-exception v6

    .line 90
    .local v6, "e":Lcom/keepassdroid/database/exception/InvalidAlgorithmException;
    iget-object v0, p0, Lcom/keepassdroid/database/edit/LoadDB;->mCtx:Landroid/content/Context;

    const v1, 0x7f06009f

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v7, v0}, Lcom/keepassdroid/database/edit/LoadDB;->finish(ZLjava/lang/String;)V

    goto :goto_0

    .line 92
    .end local v6    # "e":Lcom/keepassdroid/database/exception/InvalidAlgorithmException;
    :catch_7
    move-exception v6

    .line 93
    .local v6, "e":Lcom/keepassdroid/database/exception/InvalidKeyFileException;
    iget-object v0, p0, Lcom/keepassdroid/database/edit/LoadDB;->mCtx:Landroid/content/Context;

    const v1, 0x7f0600a0

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v7, v0}, Lcom/keepassdroid/database/edit/LoadDB;->finish(ZLjava/lang/String;)V

    goto :goto_0

    .line 95
    .end local v6    # "e":Lcom/keepassdroid/database/exception/InvalidKeyFileException;
    :catch_8
    move-exception v6

    .line 96
    .local v6, "e":Lcom/keepassdroid/database/exception/InvalidDBSignatureException;
    iget-object v0, p0, Lcom/keepassdroid/database/edit/LoadDB;->mCtx:Landroid/content/Context;

    const v1, 0x7f060058

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v7, v0}, Lcom/keepassdroid/database/edit/LoadDB;->finish(ZLjava/lang/String;)V

    goto :goto_0

    .line 98
    .end local v6    # "e":Lcom/keepassdroid/database/exception/InvalidDBSignatureException;
    :catch_9
    move-exception v6

    .line 99
    .local v6, "e":Lcom/keepassdroid/database/exception/InvalidDBVersionException;
    iget-object v0, p0, Lcom/keepassdroid/database/edit/LoadDB;->mCtx:Landroid/content/Context;

    const v1, 0x7f060091

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v7, v0}, Lcom/keepassdroid/database/edit/LoadDB;->finish(ZLjava/lang/String;)V

    goto/16 :goto_0

    .line 101
    .end local v6    # "e":Lcom/keepassdroid/database/exception/InvalidDBVersionException;
    :catch_a
    move-exception v6

    .line 102
    .local v6, "e":Lcom/keepassdroid/database/exception/InvalidDBException;
    iget-object v0, p0, Lcom/keepassdroid/database/edit/LoadDB;->mCtx:Landroid/content/Context;

    const v1, 0x7f06003d

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v7, v0}, Lcom/keepassdroid/database/edit/LoadDB;->finish(ZLjava/lang/String;)V

    goto/16 :goto_0

    .line 104
    .end local v6    # "e":Lcom/keepassdroid/database/exception/InvalidDBException;
    :catch_b
    move-exception v6

    .line 105
    .local v6, "e":Ljava/lang/OutOfMemoryError;
    iget-object v0, p0, Lcom/keepassdroid/database/edit/LoadDB;->mCtx:Landroid/content/Context;

    const v1, 0x7f060041

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v7, v0}, Lcom/keepassdroid/database/edit/LoadDB;->finish(ZLjava/lang/String;)V

    goto/16 :goto_0
.end method
