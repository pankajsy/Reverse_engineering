.class public Lcom/keepassdroid/Database;
.super Ljava/lang/Object;
.source "Database.java"


# instance fields
.field public dirty:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Lcom/keepassdroid/database/PwGroup;",
            ">;"
        }
    .end annotation
.end field

.field public drawFactory:Lcom/keepassdroid/icons/DrawableFactory;

.field private loaded:Z

.field public mUri:Landroid/net/Uri;

.field public passwordEncodingError:Z

.field public pm:Lcom/keepassdroid/database/PwDatabase;

.field public readOnly:Z

.field public searchHelper:Lcom/keepassdroid/search/SearchDbHelper;


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 55
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 56
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lcom/keepassdroid/Database;->dirty:Ljava/util/Set;

    .line 60
    iput-boolean v1, p0, Lcom/keepassdroid/Database;->readOnly:Z

    .line 61
    iput-boolean v1, p0, Lcom/keepassdroid/Database;->passwordEncodingError:Z

    .line 63
    new-instance v0, Lcom/keepassdroid/icons/DrawableFactory;

    invoke-direct {v0}, Lcom/keepassdroid/icons/DrawableFactory;-><init>()V

    iput-object v0, p0, Lcom/keepassdroid/Database;->drawFactory:Lcom/keepassdroid/icons/DrawableFactory;

    .line 65
    iput-boolean v1, p0, Lcom/keepassdroid/Database;->loaded:Z

    return-void
.end method


# virtual methods
.method public LoadData(Landroid/content/Context;Landroid/net/Uri;Ljava/lang/String;Landroid/net/Uri;)V
    .locals 7
    .param p1, "ctx"    # Landroid/content/Context;
    .param p2, "uri"    # Landroid/net/Uri;
    .param p3, "password"    # Ljava/lang/String;
    .param p4, "keyfile"    # Landroid/net/Uri;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/io/FileNotFoundException;,
            Lcom/keepassdroid/database/exception/InvalidDBException;
        }
    .end annotation

    .prologue
    .line 80
    new-instance v5, Lcom/keepassdroid/UpdateStatus;

    invoke-direct {v5}, Lcom/keepassdroid/UpdateStatus;-><init>()V

    const/4 v6, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    invoke-virtual/range {v0 .. v6}, Lcom/keepassdroid/Database;->LoadData(Landroid/content/Context;Landroid/net/Uri;Ljava/lang/String;Landroid/net/Uri;Lcom/keepassdroid/UpdateStatus;Z)V

    .line 81
    return-void
.end method

.method public LoadData(Landroid/content/Context;Landroid/net/Uri;Ljava/lang/String;Landroid/net/Uri;Lcom/keepassdroid/UpdateStatus;)V
    .locals 7
    .param p1, "ctx"    # Landroid/content/Context;
    .param p2, "uri"    # Landroid/net/Uri;
    .param p3, "password"    # Ljava/lang/String;
    .param p4, "keyfile"    # Landroid/net/Uri;
    .param p5, "status"    # Lcom/keepassdroid/UpdateStatus;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/io/FileNotFoundException;,
            Lcom/keepassdroid/database/exception/InvalidDBException;
        }
    .end annotation

    .prologue
    .line 84
    const/4 v6, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    move-object v5, p5

    invoke-virtual/range {v0 .. v6}, Lcom/keepassdroid/Database;->LoadData(Landroid/content/Context;Landroid/net/Uri;Ljava/lang/String;Landroid/net/Uri;Lcom/keepassdroid/UpdateStatus;Z)V

    .line 85
    return-void
.end method

.method public LoadData(Landroid/content/Context;Landroid/net/Uri;Ljava/lang/String;Landroid/net/Uri;Lcom/keepassdroid/UpdateStatus;Z)V
    .locals 9
    .param p1, "ctx"    # Landroid/content/Context;
    .param p2, "uri"    # Landroid/net/Uri;
    .param p3, "password"    # Ljava/lang/String;
    .param p4, "keyfile"    # Landroid/net/Uri;
    .param p5, "status"    # Lcom/keepassdroid/UpdateStatus;
    .param p6, "debug"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/io/FileNotFoundException;,
            Lcom/keepassdroid/database/exception/InvalidDBException;
        }
    .end annotation

    .prologue
    const/4 v0, 0x0

    .line 88
    iput-object p2, p0, Lcom/keepassdroid/Database;->mUri:Landroid/net/Uri;

    .line 89
    iput-boolean v0, p0, Lcom/keepassdroid/Database;->readOnly:Z

    .line 90
    invoke-virtual {p2}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v1

    const-string v3, "file"

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 91
    new-instance v8, Ljava/io/File;

    invoke-virtual {p2}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v8, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 92
    .local v8, "file":Ljava/io/File;
    invoke-virtual {v8}, Ljava/io/File;->canWrite()Z

    move-result v1

    if-nez v1, :cond_0

    const/4 v0, 0x1

    :cond_0
    iput-boolean v0, p0, Lcom/keepassdroid/Database;->readOnly:Z

    .line 97
    .end local v8    # "file":Ljava/io/File;
    :cond_1
    :try_start_0
    invoke-static {p1, p2}, Lcom/keepassdroid/utils/UriUtil;->getUriInputStream(Landroid/content/Context;Landroid/net/Uri;)Ljava/io/InputStream;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    .line 104
    .local v2, "is":Ljava/io/InputStream;
    :try_start_1
    invoke-static {p1, p4}, Lcom/keepassdroid/utils/UriUtil;->getUriInputStream(Landroid/content/Context;Landroid/net/Uri;)Ljava/io/InputStream;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    move-result-object v4

    .local v4, "kfIs":Ljava/io/InputStream;
    move-object v0, p0

    move-object v1, p1

    move-object v3, p3

    move-object v5, p5

    move v6, p6

    .line 109
    invoke-virtual/range {v0 .. v6}, Lcom/keepassdroid/Database;->LoadData(Landroid/content/Context;Ljava/io/InputStream;Ljava/lang/String;Ljava/io/InputStream;Lcom/keepassdroid/UpdateStatus;Z)V

    .line 111
    return-void

    .line 98
    .end local v2    # "is":Ljava/io/InputStream;
    .end local v4    # "kfIs":Ljava/io/InputStream;
    :catch_0
    move-exception v7

    .line 99
    .local v7, "e":Ljava/lang/Exception;
    const-string v0, "KPD"

    const-string v1, "Database::LoadData"

    invoke-static {v0, v1, v7}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 100
    invoke-static {p2}, Lcom/keepassdroid/database/exception/ContentFileNotFoundException;->getInstance(Landroid/net/Uri;)Ljava/io/FileNotFoundException;

    move-result-object v0

    throw v0

    .line 105
    .end local v7    # "e":Ljava/lang/Exception;
    .restart local v2    # "is":Ljava/io/InputStream;
    :catch_1
    move-exception v7

    .line 106
    .restart local v7    # "e":Ljava/lang/Exception;
    const-string v0, "KPD"

    const-string v1, "Database::LoadData"

    invoke-static {v0, v1, v7}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 107
    invoke-static {p4}, Lcom/keepassdroid/database/exception/ContentFileNotFoundException;->getInstance(Landroid/net/Uri;)Ljava/io/FileNotFoundException;

    move-result-object v0

    throw v0
.end method

.method public LoadData(Landroid/content/Context;Lcom/keepassdroid/database/PwDatabase;Ljava/lang/String;Ljava/io/InputStream;Lcom/keepassdroid/UpdateStatus;)V
    .locals 2
    .param p1, "ctx"    # Landroid/content/Context;
    .param p2, "pm"    # Lcom/keepassdroid/database/PwDatabase;
    .param p3, "password"    # Ljava/lang/String;
    .param p4, "keyInputStream"    # Ljava/io/InputStream;
    .param p5, "status"    # Lcom/keepassdroid/UpdateStatus;

    .prologue
    const/4 v1, 0x1

    .line 145
    if-eqz p2, :cond_0

    .line 146
    invoke-virtual {p2, p3}, Lcom/keepassdroid/database/PwDatabase;->validatePasswordEncoding(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1

    move v0, v1

    :goto_0
    iput-boolean v0, p0, Lcom/keepassdroid/Database;->passwordEncodingError:Z

    .line 149
    :cond_0
    new-instance v0, Lcom/keepassdroid/search/SearchDbHelper;

    invoke-direct {v0, p1}, Lcom/keepassdroid/search/SearchDbHelper;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/keepassdroid/Database;->searchHelper:Lcom/keepassdroid/search/SearchDbHelper;

    .line 151
    iput-boolean v1, p0, Lcom/keepassdroid/Database;->loaded:Z

    .line 152
    return-void

    .line 146
    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public LoadData(Landroid/content/Context;Ljava/io/InputStream;Ljava/lang/String;Ljava/io/InputStream;)V
    .locals 7
    .param p1, "ctx"    # Landroid/content/Context;
    .param p2, "is"    # Ljava/io/InputStream;
    .param p3, "password"    # Ljava/lang/String;
    .param p4, "keyInputStream"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/keepassdroid/database/exception/InvalidDBException;
        }
    .end annotation

    .prologue
    .line 76
    new-instance v5, Lcom/keepassdroid/UpdateStatus;

    invoke-direct {v5}, Lcom/keepassdroid/UpdateStatus;-><init>()V

    const/4 v6, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    invoke-virtual/range {v0 .. v6}, Lcom/keepassdroid/Database;->LoadData(Landroid/content/Context;Ljava/io/InputStream;Ljava/lang/String;Ljava/io/InputStream;Lcom/keepassdroid/UpdateStatus;Z)V

    .line 77
    return-void
.end method

.method public LoadData(Landroid/content/Context;Ljava/io/InputStream;Ljava/lang/String;Ljava/io/InputStream;Lcom/keepassdroid/UpdateStatus;Z)V
    .locals 9
    .param p1, "ctx"    # Landroid/content/Context;
    .param p2, "is"    # Ljava/io/InputStream;
    .param p3, "password"    # Ljava/lang/String;
    .param p4, "kfIs"    # Ljava/io/InputStream;
    .param p5, "status"    # Lcom/keepassdroid/UpdateStatus;
    .param p6, "debug"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/keepassdroid/database/exception/InvalidDBException;
        }
    .end annotation

    .prologue
    .line 119
    new-instance v6, Ljava/io/BufferedInputStream;

    invoke-direct {v6, p2}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V

    .line 121
    .local v6, "bis":Ljava/io/BufferedInputStream;
    invoke-virtual {v6}, Ljava/io/BufferedInputStream;->markSupported()Z

    move-result v0

    if-nez v0, :cond_0

    .line 122
    new-instance v0, Ljava/io/IOException;

    const-string v1, "Input stream does not support mark."

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 126
    :cond_0
    const/16 v0, 0xa

    invoke-virtual {v6, v0}, Ljava/io/BufferedInputStream;->mark(I)V

    .line 128
    invoke-static {v6, p6}, Lcom/keepassdroid/database/load/ImporterFactory;->createImporter(Ljava/io/InputStream;Z)Lcom/keepassdroid/database/load/Importer;

    move-result-object v7

    .line 130
    .local v7, "imp":Lcom/keepassdroid/database/load/Importer;
    invoke-virtual {v6}, Ljava/io/BufferedInputStream;->reset()V

    .line 132
    invoke-virtual {v7, v6, p3, p4, p5}, Lcom/keepassdroid/database/load/Importer;->openDatabase(Ljava/io/InputStream;Ljava/lang/String;Ljava/io/InputStream;Lcom/keepassdroid/UpdateStatus;)Lcom/keepassdroid/database/PwDatabase;

    move-result-object v0

    iput-object v0, p0, Lcom/keepassdroid/Database;->pm:Lcom/keepassdroid/database/PwDatabase;

    .line 133
    iget-object v0, p0, Lcom/keepassdroid/Database;->pm:Lcom/keepassdroid/database/PwDatabase;

    if-eqz v0, :cond_1

    .line 134
    iget-object v0, p0, Lcom/keepassdroid/Database;->pm:Lcom/keepassdroid/database/PwDatabase;

    iget-object v8, v0, Lcom/keepassdroid/database/PwDatabase;->rootGroup:Lcom/keepassdroid/database/PwGroup;

    .line 136
    .local v8, "root":Lcom/keepassdroid/database/PwGroup;
    iget-object v0, p0, Lcom/keepassdroid/Database;->pm:Lcom/keepassdroid/database/PwDatabase;

    invoke-virtual {v0, v8}, Lcom/keepassdroid/database/PwDatabase;->populateGlobals(Lcom/keepassdroid/database/PwGroup;)V

    .line 138
    iget-object v2, p0, Lcom/keepassdroid/Database;->pm:Lcom/keepassdroid/database/PwDatabase;

    move-object v0, p0

    move-object v1, p1

    move-object v3, p3

    move-object v4, p4

    move-object v5, p5

    invoke-virtual/range {v0 .. v5}, Lcom/keepassdroid/Database;->LoadData(Landroid/content/Context;Lcom/keepassdroid/database/PwDatabase;Ljava/lang/String;Ljava/io/InputStream;Lcom/keepassdroid/UpdateStatus;)V

    .line 141
    .end local v8    # "root":Lcom/keepassdroid/database/PwGroup;
    :cond_1
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/keepassdroid/Database;->loaded:Z

    .line 142
    return-void
.end method

.method public LoadData(Landroid/content/Context;Ljava/io/InputStream;Ljava/lang/String;Ljava/io/InputStream;Z)V
    .locals 7
    .param p1, "ctx"    # Landroid/content/Context;
    .param p2, "is"    # Ljava/io/InputStream;
    .param p3, "password"    # Ljava/lang/String;
    .param p4, "kfIs"    # Ljava/io/InputStream;
    .param p5, "debug"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/keepassdroid/database/exception/InvalidDBException;
        }
    .end annotation

    .prologue
    .line 114
    new-instance v5, Lcom/keepassdroid/UpdateStatus;

    invoke-direct {v5}, Lcom/keepassdroid/UpdateStatus;-><init>()V

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    move v6, p5

    invoke-virtual/range {v0 .. v6}, Lcom/keepassdroid/Database;->LoadData(Landroid/content/Context;Ljava/io/InputStream;Ljava/lang/String;Ljava/io/InputStream;Lcom/keepassdroid/UpdateStatus;Z)V

    .line 115
    return-void
.end method

.method public Loaded()Z
    .locals 1

    .prologue
    .line 68
    iget-boolean v0, p0, Lcom/keepassdroid/Database;->loaded:Z

    return v0
.end method

.method public SaveData(Landroid/content/Context;)V
    .locals 1
    .param p1, "ctx"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/keepassdroid/database/exception/PwDbOutputException;
        }
    .end annotation

    .prologue
    .line 164
    iget-object v0, p0, Lcom/keepassdroid/Database;->mUri:Landroid/net/Uri;

    invoke-virtual {p0, p1, v0}, Lcom/keepassdroid/Database;->SaveData(Landroid/content/Context;Landroid/net/Uri;)V

    .line 165
    return-void
.end method

.method public SaveData(Landroid/content/Context;Landroid/net/Uri;)V
    .locals 9
    .param p1, "ctx"    # Landroid/content/Context;
    .param p2, "uri"    # Landroid/net/Uri;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/keepassdroid/database/exception/PwDbOutputException;
        }
    .end annotation

    .prologue
    .line 168
    invoke-virtual {p2}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v7

    const-string v8, "file"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_0

    .line 169
    invoke-virtual {p2}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v1

    .line 170
    .local v1, "filename":Ljava/lang/String;
    new-instance v6, Ljava/io/File;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, ".tmp"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 171
    .local v6, "tempFile":Ljava/io/File;
    new-instance v2, Ljava/io/FileOutputStream;

    invoke-direct {v2, v6}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 175
    .local v2, "fos":Ljava/io/FileOutputStream;
    iget-object v7, p0, Lcom/keepassdroid/Database;->pm:Lcom/keepassdroid/database/PwDatabase;

    invoke-static {v7, v2}, Lcom/keepassdroid/database/save/PwDbOutput;->getInstance(Lcom/keepassdroid/database/PwDatabase;Ljava/io/OutputStream;)Lcom/keepassdroid/database/save/PwDbOutput;

    move-result-object v5

    .line 176
    .local v5, "pmo":Lcom/keepassdroid/database/save/PwDbOutput;
    invoke-virtual {v5}, Lcom/keepassdroid/database/save/PwDbOutput;->output()V

    .line 179
    invoke-virtual {v2}, Ljava/io/FileOutputStream;->close()V

    .line 183
    :try_start_0
    invoke-virtual {v2}, Ljava/io/FileOutputStream;->getFD()Ljava/io/FileDescriptor;

    move-result-object v7

    invoke-virtual {v7}, Ljava/io/FileDescriptor;->sync()V
    :try_end_0
    .catch Ljava/io/SyncFailedException; {:try_start_0 .. :try_end_0} :catch_1

    .line 188
    :goto_0
    new-instance v3, Ljava/io/File;

    invoke-direct {v3, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 190
    .local v3, "orig":Ljava/io/File;
    invoke-virtual {v6, v3}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    move-result v7

    if-nez v7, :cond_1

    .line 191
    new-instance v7, Ljava/io/IOException;

    const-string v8, "Failed to store database."

    invoke-direct {v7, v8}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 197
    .end local v1    # "filename":Ljava/lang/String;
    .end local v2    # "fos":Ljava/io/FileOutputStream;
    .end local v3    # "orig":Ljava/io/File;
    .end local v5    # "pmo":Lcom/keepassdroid/database/save/PwDbOutput;
    .end local v6    # "tempFile":Ljava/io/File;
    :cond_0
    :try_start_1
    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v7

    invoke-virtual {v7, p2}, Landroid/content/ContentResolver;->openOutputStream(Landroid/net/Uri;)Ljava/io/OutputStream;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    move-result-object v4

    .line 202
    .local v4, "os":Ljava/io/OutputStream;
    iget-object v7, p0, Lcom/keepassdroid/Database;->pm:Lcom/keepassdroid/database/PwDatabase;

    invoke-static {v7, v4}, Lcom/keepassdroid/database/save/PwDbOutput;->getInstance(Lcom/keepassdroid/database/PwDatabase;Ljava/io/OutputStream;)Lcom/keepassdroid/database/save/PwDbOutput;

    move-result-object v5

    .line 203
    .restart local v5    # "pmo":Lcom/keepassdroid/database/save/PwDbOutput;
    invoke-virtual {v5}, Lcom/keepassdroid/database/save/PwDbOutput;->output()V

    .line 204
    invoke-virtual {v4}, Ljava/io/OutputStream;->close()V

    .line 207
    .end local v4    # "os":Ljava/io/OutputStream;
    :cond_1
    iput-object p2, p0, Lcom/keepassdroid/Database;->mUri:Landroid/net/Uri;

    .line 209
    return-void

    .line 198
    .end local v5    # "pmo":Lcom/keepassdroid/database/save/PwDbOutput;
    :catch_0
    move-exception v0

    .line 199
    .local v0, "e":Ljava/lang/Exception;
    new-instance v7, Ljava/io/IOException;

    const-string v8, "Failed to store database."

    invoke-direct {v7, v8}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 184
    .end local v0    # "e":Ljava/lang/Exception;
    .restart local v1    # "filename":Ljava/lang/String;
    .restart local v2    # "fos":Ljava/io/FileOutputStream;
    .restart local v5    # "pmo":Lcom/keepassdroid/database/save/PwDbOutput;
    .restart local v6    # "tempFile":Ljava/io/File;
    :catch_1
    move-exception v7

    goto :goto_0
.end method

.method public Search(Ljava/lang/String;)Lcom/keepassdroid/database/PwGroup;
    .locals 2
    .param p1, "str"    # Ljava/lang/String;

    .prologue
    .line 155
    iget-object v1, p0, Lcom/keepassdroid/Database;->searchHelper:Lcom/keepassdroid/search/SearchDbHelper;

    if-nez v1, :cond_0

    const/4 v0, 0x0

    .line 159
    :goto_0
    return-object v0

    .line 157
    :cond_0
    iget-object v1, p0, Lcom/keepassdroid/Database;->searchHelper:Lcom/keepassdroid/search/SearchDbHelper;

    invoke-virtual {v1, p0, p1}, Lcom/keepassdroid/search/SearchDbHelper;->search(Lcom/keepassdroid/Database;Ljava/lang/String;)Lcom/keepassdroid/database/PwGroup;

    move-result-object v0

    .line 159
    .local v0, "group":Lcom/keepassdroid/database/PwGroup;
    goto :goto_0
.end method

.method public clear()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x0

    .line 212
    iget-object v0, p0, Lcom/keepassdroid/Database;->dirty:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->clear()V

    .line 213
    iget-object v0, p0, Lcom/keepassdroid/Database;->drawFactory:Lcom/keepassdroid/icons/DrawableFactory;

    invoke-virtual {v0}, Lcom/keepassdroid/icons/DrawableFactory;->clear()V

    .line 215
    iput-object v2, p0, Lcom/keepassdroid/Database;->pm:Lcom/keepassdroid/database/PwDatabase;

    .line 216
    iput-object v2, p0, Lcom/keepassdroid/Database;->mUri:Landroid/net/Uri;

    .line 217
    iput-boolean v1, p0, Lcom/keepassdroid/Database;->loaded:Z

    .line 218
    iput-boolean v1, p0, Lcom/keepassdroid/Database;->passwordEncodingError:Z

    .line 219
    return-void
.end method

.method public markAllGroupsAsDirty()V
    .locals 3

    .prologue
    .line 222
    iget-object v1, p0, Lcom/keepassdroid/Database;->pm:Lcom/keepassdroid/database/PwDatabase;

    invoke-virtual {v1}, Lcom/keepassdroid/database/PwDatabase;->getGroups()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/keepassdroid/database/PwGroup;

    .line 223
    .local v0, "group":Lcom/keepassdroid/database/PwGroup;
    iget-object v2, p0, Lcom/keepassdroid/Database;->dirty:Ljava/util/Set;

    invoke-interface {v2, v0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 228
    .end local v0    # "group":Lcom/keepassdroid/database/PwGroup;
    :cond_0
    iget-object v1, p0, Lcom/keepassdroid/Database;->pm:Lcom/keepassdroid/database/PwDatabase;

    instance-of v1, v1, Lcom/keepassdroid/database/PwDatabaseV3;

    if-eqz v1, :cond_1

    .line 229
    iget-object v1, p0, Lcom/keepassdroid/Database;->dirty:Ljava/util/Set;

    iget-object v2, p0, Lcom/keepassdroid/Database;->pm:Lcom/keepassdroid/database/PwDatabase;

    iget-object v2, v2, Lcom/keepassdroid/database/PwDatabase;->rootGroup:Lcom/keepassdroid/database/PwGroup;

    invoke-interface {v1, v2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 231
    :cond_1
    return-void
.end method

.method public setLoaded()V
    .locals 1

    .prologue
    .line 72
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/keepassdroid/Database;->loaded:Z

    .line 73
    return-void
.end method
