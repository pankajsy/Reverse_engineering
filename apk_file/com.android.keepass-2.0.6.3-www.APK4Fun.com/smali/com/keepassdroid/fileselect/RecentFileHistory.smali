.class public Lcom/keepassdroid/fileselect/RecentFileHistory;
.super Ljava/lang/Object;
.source "RecentFileHistory.java"


# static fields
.field private static DB_KEY:Ljava/lang/String;

.field private static KEYFILE_KEY:Ljava/lang/String;


# instance fields
.field private ctx:Landroid/content/Context;

.field private databases:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private enabled:Z

.field private init:Z

.field private keyfiles:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private listner:Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;

.field private prefs:Landroid/content/SharedPreferences;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 39
    const-string v0, "recent_databases"

    sput-object v0, Lcom/keepassdroid/fileselect/RecentFileHistory;->DB_KEY:Ljava/lang/String;

    .line 40
    const-string v0, "recent_keyfiles"

    sput-object v0, Lcom/keepassdroid/fileselect/RecentFileHistory;->KEYFILE_KEY:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 4
    .param p1, "c"    # Landroid/content/Context;

    .prologue
    .line 50
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 42
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/keepassdroid/fileselect/RecentFileHistory;->databases:Ljava/util/List;

    .line 43
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/keepassdroid/fileselect/RecentFileHistory;->keyfiles:Ljava/util/List;

    .line 48
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/keepassdroid/fileselect/RecentFileHistory;->init:Z

    .line 51
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    iput-object v0, p0, Lcom/keepassdroid/fileselect/RecentFileHistory;->ctx:Landroid/content/Context;

    .line 53
    invoke-static {p1}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    iput-object v0, p0, Lcom/keepassdroid/fileselect/RecentFileHistory;->prefs:Landroid/content/SharedPreferences;

    .line 54
    iget-object v0, p0, Lcom/keepassdroid/fileselect/RecentFileHistory;->prefs:Landroid/content/SharedPreferences;

    iget-object v1, p0, Lcom/keepassdroid/fileselect/RecentFileHistory;->ctx:Landroid/content/Context;

    const v2, 0x7f0600c5

    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/keepassdroid/fileselect/RecentFileHistory;->ctx:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f080003

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v2

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    iput-boolean v0, p0, Lcom/keepassdroid/fileselect/RecentFileHistory;->enabled:Z

    .line 55
    new-instance v0, Lcom/keepassdroid/fileselect/RecentFileHistory$1;

    invoke-direct {v0, p0}, Lcom/keepassdroid/fileselect/RecentFileHistory$1;-><init>(Lcom/keepassdroid/fileselect/RecentFileHistory;)V

    iput-object v0, p0, Lcom/keepassdroid/fileselect/RecentFileHistory;->listner:Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;

    .line 65
    iget-object v0, p0, Lcom/keepassdroid/fileselect/RecentFileHistory;->prefs:Landroid/content/SharedPreferences;

    iget-object v1, p0, Lcom/keepassdroid/fileselect/RecentFileHistory;->listner:Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;

    invoke-interface {v0, v1}, Landroid/content/SharedPreferences;->registerOnSharedPreferenceChangeListener(Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;)V

    .line 66
    return-void
.end method

.method static synthetic access$000(Lcom/keepassdroid/fileselect/RecentFileHistory;)Landroid/content/Context;
    .locals 1
    .param p0, "x0"    # Lcom/keepassdroid/fileselect/RecentFileHistory;

    .prologue
    .line 37
    iget-object v0, p0, Lcom/keepassdroid/fileselect/RecentFileHistory;->ctx:Landroid/content/Context;

    return-object v0
.end method

.method static synthetic access$102(Lcom/keepassdroid/fileselect/RecentFileHistory;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/keepassdroid/fileselect/RecentFileHistory;
    .param p1, "x1"    # Z

    .prologue
    .line 37
    iput-boolean p1, p0, Lcom/keepassdroid/fileselect/RecentFileHistory;->enabled:Z

    return p1
.end method

.method private declared-synchronized init()V
    .locals 1

    .prologue
    .line 69
    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lcom/keepassdroid/fileselect/RecentFileHistory;->init:Z

    if-nez v0, :cond_1

    .line 70
    invoke-direct {p0}, Lcom/keepassdroid/fileselect/RecentFileHistory;->upgradeFromSQL()Z

    move-result v0

    if-nez v0, :cond_0

    .line 71
    invoke-direct {p0}, Lcom/keepassdroid/fileselect/RecentFileHistory;->loadPrefs()V

    .line 74
    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/keepassdroid/fileselect/RecentFileHistory;->init:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 76
    :cond_1
    monitor-exit p0

    return-void

    .line 69
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method private loadList(Ljava/util/List;Ljava/lang/String;)V
    .locals 5
    .param p2, "keyprefix"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .prologue
    .line 175
    .local p1, "list":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    iget-object v3, p0, Lcom/keepassdroid/fileselect/RecentFileHistory;->ctx:Landroid/content/Context;

    invoke-static {v3}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v1

    .line 176
    .local v1, "prefs":Landroid/content/SharedPreferences;
    const/4 v3, 0x0

    invoke-interface {v1, p2, v3}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v2

    .line 178
    .local v2, "size":I
    invoke-interface {p1}, Ljava/util/List;->clear()V

    .line 179
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    if-ge v0, v2, :cond_0

    .line 180
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "_"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    const-string v4, ""

    invoke-interface {v1, v3, v4}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-interface {p1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 179
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 182
    :cond_0
    return-void
.end method

.method private loadPrefs()V
    .locals 2

    .prologue
    .line 165
    iget-object v0, p0, Lcom/keepassdroid/fileselect/RecentFileHistory;->databases:Ljava/util/List;

    sget-object v1, Lcom/keepassdroid/fileselect/RecentFileHistory;->DB_KEY:Ljava/lang/String;

    invoke-direct {p0, v0, v1}, Lcom/keepassdroid/fileselect/RecentFileHistory;->loadList(Ljava/util/List;Ljava/lang/String;)V

    .line 166
    iget-object v0, p0, Lcom/keepassdroid/fileselect/RecentFileHistory;->keyfiles:Ljava/util/List;

    sget-object v1, Lcom/keepassdroid/fileselect/RecentFileHistory;->KEYFILE_KEY:Ljava/lang/String;

    invoke-direct {p0, v0, v1}, Lcom/keepassdroid/fileselect/RecentFileHistory;->loadList(Ljava/util/List;Ljava/lang/String;)V

    .line 167
    return-void
.end method

.method private saveList(Ljava/lang/String;Ljava/util/List;)V
    .locals 6
    .param p1, "keyprefix"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 185
    .local p2, "list":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    iget-object v4, p0, Lcom/keepassdroid/fileselect/RecentFileHistory;->ctx:Landroid/content/Context;

    invoke-static {v4}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v2

    .line 186
    .local v2, "prefs":Landroid/content/SharedPreferences;
    invoke-interface {v2}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 187
    .local v0, "edit":Landroid/content/SharedPreferences$Editor;
    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result v3

    .line 188
    .local v3, "size":I
    invoke-interface {v0, p1, v3}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    .line 190
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-ge v1, v3, :cond_0

    .line 191
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "_"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-interface {p2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-interface {v0, v5, v4}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 190
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 193
    :cond_0
    invoke-static {v0}, Lcom/keepassdroid/compat/EditorCompat;->apply(Landroid/content/SharedPreferences$Editor;)V

    .line 194
    return-void
.end method

.method private savePrefs()V
    .locals 2

    .prologue
    .line 170
    sget-object v0, Lcom/keepassdroid/fileselect/RecentFileHistory;->DB_KEY:Ljava/lang/String;

    iget-object v1, p0, Lcom/keepassdroid/fileselect/RecentFileHistory;->databases:Ljava/util/List;

    invoke-direct {p0, v0, v1}, Lcom/keepassdroid/fileselect/RecentFileHistory;->saveList(Ljava/lang/String;Ljava/util/List;)V

    .line 171
    sget-object v0, Lcom/keepassdroid/fileselect/RecentFileHistory;->KEYFILE_KEY:Ljava/lang/String;

    iget-object v1, p0, Lcom/keepassdroid/fileselect/RecentFileHistory;->keyfiles:Ljava/util/List;

    invoke-direct {p0, v0, v1}, Lcom/keepassdroid/fileselect/RecentFileHistory;->saveList(Ljava/lang/String;Ljava/util/List;)V

    .line 172
    return-void
.end method

.method private sqlDatabaseExists()Z
    .locals 3

    .prologue
    .line 125
    iget-object v1, p0, Lcom/keepassdroid/fileselect/RecentFileHistory;->ctx:Landroid/content/Context;

    const-string v2, "keepassdroid"

    invoke-virtual {v1, v2}, Landroid/content/Context;->getDatabasePath(Ljava/lang/String;)Ljava/io/File;

    move-result-object v0

    .line 126
    .local v0, "db":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    return v1
.end method

.method private trimLists()V
    .locals 3

    .prologue
    .line 264
    iget-object v2, p0, Lcom/keepassdroid/fileselect/RecentFileHistory;->databases:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v1

    .line 265
    .local v1, "size":I
    const/4 v0, 0x5

    .local v0, "i":I
    :goto_0
    if-ge v0, v1, :cond_0

    .line 266
    iget-object v2, p0, Lcom/keepassdroid/fileselect/RecentFileHistory;->databases:Ljava/util/List;

    invoke-interface {v2, v0}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 267
    iget-object v2, p0, Lcom/keepassdroid/fileselect/RecentFileHistory;->keyfiles:Ljava/util/List;

    invoke-interface {v2, v0}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 265
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 269
    :cond_0
    return-void
.end method

.method private upgradeFromSQL()Z
    .locals 7

    .prologue
    .line 82
    :try_start_0
    invoke-direct {p0}, Lcom/keepassdroid/fileselect/RecentFileHistory;->sqlDatabaseExists()Z

    move-result v6

    if-nez v6, :cond_0

    .line 83
    const/4 v6, 0x0

    .line 121
    :goto_0
    return v6

    .line 86
    :cond_0
    iget-object v6, p0, Lcom/keepassdroid/fileselect/RecentFileHistory;->databases:Ljava/util/List;

    invoke-interface {v6}, Ljava/util/List;->clear()V

    .line 87
    iget-object v6, p0, Lcom/keepassdroid/fileselect/RecentFileHistory;->keyfiles:Ljava/util/List;

    invoke-interface {v6}, Ljava/util/List;->clear()V

    .line 89
    new-instance v3, Lcom/keepassdroid/fileselect/FileDbHelper;

    iget-object v6, p0, Lcom/keepassdroid/fileselect/RecentFileHistory;->ctx:Landroid/content/Context;

    invoke-direct {v3, v6}, Lcom/keepassdroid/fileselect/FileDbHelper;-><init>(Landroid/content/Context;)V

    .line 90
    .local v3, "helper":Lcom/keepassdroid/fileselect/FileDbHelper;
    invoke-virtual {v3}, Lcom/keepassdroid/fileselect/FileDbHelper;->open()Lcom/keepassdroid/fileselect/FileDbHelper;

    .line 91
    invoke-virtual {v3}, Lcom/keepassdroid/fileselect/FileDbHelper;->fetchAllFiles()Landroid/database/Cursor;

    move-result-object v0

    .line 93
    .local v0, "cursor":Landroid/database/Cursor;
    const-string v6, "fileName"

    invoke-interface {v0, v6}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v1

    .line 94
    .local v1, "dbIndex":I
    const-string v6, "keyFile"

    invoke-interface {v0, v6}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v4

    .line 96
    .local v4, "keyIndex":I
    invoke-interface {v0}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v6

    if-eqz v6, :cond_1

    .line 97
    :goto_1
    invoke-interface {v0}, Landroid/database/Cursor;->moveToNext()Z

    move-result v6

    if-eqz v6, :cond_1

    .line 98
    invoke-interface {v0, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    .line 99
    .local v2, "filename":Ljava/lang/String;
    invoke-interface {v0, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v5

    .line 101
    .local v5, "keyfile":Ljava/lang/String;
    iget-object v6, p0, Lcom/keepassdroid/fileselect/RecentFileHistory;->databases:Ljava/util/List;

    invoke-interface {v6, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 102
    iget-object v6, p0, Lcom/keepassdroid/fileselect/RecentFileHistory;->keyfiles:Ljava/util/List;

    invoke-interface {v6, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 111
    .end local v0    # "cursor":Landroid/database/Cursor;
    .end local v1    # "dbIndex":I
    .end local v2    # "filename":Ljava/lang/String;
    .end local v3    # "helper":Lcom/keepassdroid/fileselect/FileDbHelper;
    .end local v4    # "keyIndex":I
    .end local v5    # "keyfile":Ljava/lang/String;
    :catch_0
    move-exception v6

    .line 116
    :goto_2
    :try_start_1
    iget-object v6, p0, Lcom/keepassdroid/fileselect/RecentFileHistory;->ctx:Landroid/content/Context;

    invoke-static {v6}, Lcom/keepassdroid/fileselect/FileDbHelper;->deleteDatabase(Landroid/content/Context;)Z
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 121
    :goto_3
    const/4 v6, 0x1

    goto :goto_0

    .line 106
    .restart local v0    # "cursor":Landroid/database/Cursor;
    .restart local v1    # "dbIndex":I
    .restart local v3    # "helper":Lcom/keepassdroid/fileselect/FileDbHelper;
    .restart local v4    # "keyIndex":I
    :cond_1
    :try_start_2
    invoke-direct {p0}, Lcom/keepassdroid/fileselect/RecentFileHistory;->savePrefs()V

    .line 108
    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    .line 109
    invoke-virtual {v3}, Lcom/keepassdroid/fileselect/FileDbHelper;->close()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    goto :goto_2

    .line 117
    .end local v0    # "cursor":Landroid/database/Cursor;
    .end local v1    # "dbIndex":I
    .end local v3    # "helper":Lcom/keepassdroid/fileselect/FileDbHelper;
    .end local v4    # "keyIndex":I
    :catch_1
    move-exception v6

    goto :goto_3
.end method


# virtual methods
.method public createFile(Landroid/net/Uri;Landroid/net/Uri;)V
    .locals 4
    .param p1, "uri"    # Landroid/net/Uri;
    .param p2, "keyUri"    # Landroid/net/Uri;

    .prologue
    const/4 v3, 0x0

    .line 130
    iget-boolean v1, p0, Lcom/keepassdroid/fileselect/RecentFileHistory;->enabled:Z

    if-eqz v1, :cond_0

    if-nez p1, :cond_1

    .line 144
    :cond_0
    :goto_0
    return-void

    .line 132
    :cond_1
    invoke-direct {p0}, Lcom/keepassdroid/fileselect/RecentFileHistory;->init()V

    .line 135
    invoke-virtual {p0, p1, v3}, Lcom/keepassdroid/fileselect/RecentFileHistory;->deleteFile(Landroid/net/Uri;Z)V

    .line 137
    iget-object v1, p0, Lcom/keepassdroid/fileselect/RecentFileHistory;->databases:Ljava/util/List;

    invoke-virtual {p1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v3, v2}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 139
    if-nez p2, :cond_2

    const-string v0, ""

    .line 140
    .local v0, "key":Ljava/lang/String;
    :goto_1
    iget-object v1, p0, Lcom/keepassdroid/fileselect/RecentFileHistory;->keyfiles:Ljava/util/List;

    invoke-interface {v1, v3, v0}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 142
    invoke-direct {p0}, Lcom/keepassdroid/fileselect/RecentFileHistory;->trimLists()V

    .line 143
    invoke-direct {p0}, Lcom/keepassdroid/fileselect/RecentFileHistory;->savePrefs()V

    goto :goto_0

    .line 139
    .end local v0    # "key":Ljava/lang/String;
    :cond_2
    invoke-virtual {p2}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_1
.end method

.method public deleteAll()V
    .locals 1

    .prologue
    .line 242
    invoke-direct {p0}, Lcom/keepassdroid/fileselect/RecentFileHistory;->init()V

    .line 244
    iget-object v0, p0, Lcom/keepassdroid/fileselect/RecentFileHistory;->databases:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 245
    iget-object v0, p0, Lcom/keepassdroid/fileselect/RecentFileHistory;->keyfiles:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 247
    invoke-direct {p0}, Lcom/keepassdroid/fileselect/RecentFileHistory;->savePrefs()V

    .line 248
    return-void
.end method

.method public deleteAllKeys()V
    .locals 4

    .prologue
    .line 251
    invoke-direct {p0}, Lcom/keepassdroid/fileselect/RecentFileHistory;->init()V

    .line 253
    iget-object v2, p0, Lcom/keepassdroid/fileselect/RecentFileHistory;->keyfiles:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->clear()V

    .line 255
    iget-object v2, p0, Lcom/keepassdroid/fileselect/RecentFileHistory;->databases:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v1

    .line 256
    .local v1, "size":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    if-ge v0, v1, :cond_0

    .line 257
    iget-object v2, p0, Lcom/keepassdroid/fileselect/RecentFileHistory;->keyfiles:Ljava/util/List;

    const-string v3, ""

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 256
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 260
    :cond_0
    invoke-direct {p0}, Lcom/keepassdroid/fileselect/RecentFileHistory;->savePrefs()V

    .line 261
    return-void
.end method

.method public deleteFile(Landroid/net/Uri;)V
    .locals 1
    .param p1, "uri"    # Landroid/net/Uri;

    .prologue
    .line 197
    const/4 v0, 0x1

    invoke-virtual {p0, p1, v0}, Lcom/keepassdroid/fileselect/RecentFileHistory;->deleteFile(Landroid/net/Uri;Z)V

    .line 198
    return-void
.end method

.method public deleteFile(Landroid/net/Uri;Z)V
    .locals 5
    .param p1, "uri"    # Landroid/net/Uri;
    .param p2, "save"    # Z

    .prologue
    .line 201
    invoke-direct {p0}, Lcom/keepassdroid/fileselect/RecentFileHistory;->init()V

    .line 203
    invoke-virtual {p1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v3

    .line 204
    .local v3, "uriName":Ljava/lang/String;
    invoke-virtual {p1}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v1

    .line 206
    .local v1, "fileName":Ljava/lang/String;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    iget-object v4, p0, Lcom/keepassdroid/fileselect/RecentFileHistory;->databases:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v4

    if-ge v2, v4, :cond_1

    .line 207
    iget-object v4, p0, Lcom/keepassdroid/fileselect/RecentFileHistory;->databases:Ljava/util/List;

    invoke-interface {v4, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 208
    .local v0, "entry":Ljava/lang/String;
    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_0

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_3

    .line 209
    :cond_0
    iget-object v4, p0, Lcom/keepassdroid/fileselect/RecentFileHistory;->databases:Ljava/util/List;

    invoke-interface {v4, v2}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 210
    iget-object v4, p0, Lcom/keepassdroid/fileselect/RecentFileHistory;->keyfiles:Ljava/util/List;

    invoke-interface {v4, v2}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 215
    .end local v0    # "entry":Ljava/lang/String;
    :cond_1
    if-eqz p2, :cond_2

    .line 216
    invoke-direct {p0}, Lcom/keepassdroid/fileselect/RecentFileHistory;->savePrefs()V

    .line 218
    :cond_2
    return-void

    .line 206
    .restart local v0    # "entry":Ljava/lang/String;
    :cond_3
    add-int/lit8 v2, v2, 0x1

    goto :goto_0
.end method

.method public getDatabaseAt(I)Ljava/lang/String;
    .locals 1
    .param p1, "i"    # I

    .prologue
    .line 155
    invoke-direct {p0}, Lcom/keepassdroid/fileselect/RecentFileHistory;->init()V

    .line 156
    iget-object v0, p0, Lcom/keepassdroid/fileselect/RecentFileHistory;->databases:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    return-object v0
.end method

.method public getDbList()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 221
    invoke-direct {p0}, Lcom/keepassdroid/fileselect/RecentFileHistory;->init()V

    .line 223
    iget-object v0, p0, Lcom/keepassdroid/fileselect/RecentFileHistory;->databases:Ljava/util/List;

    return-object v0
.end method

.method public getFileByName(Landroid/net/Uri;)Landroid/net/Uri;
    .locals 4
    .param p1, "database"    # Landroid/net/Uri;

    .prologue
    const/4 v3, 0x0

    .line 227
    iget-boolean v2, p0, Lcom/keepassdroid/fileselect/RecentFileHistory;->enabled:Z

    if-nez v2, :cond_0

    move-object v2, v3

    .line 238
    :goto_0
    return-object v2

    .line 229
    :cond_0
    invoke-direct {p0}, Lcom/keepassdroid/fileselect/RecentFileHistory;->init()V

    .line 231
    iget-object v2, p0, Lcom/keepassdroid/fileselect/RecentFileHistory;->databases:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v1

    .line 232
    .local v1, "size":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    if-ge v0, v1, :cond_2

    .line 233
    iget-object v2, p0, Lcom/keepassdroid/fileselect/RecentFileHistory;->databases:Ljava/util/List;

    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-static {p1, v2}, Lcom/keepassdroid/utils/UriUtil;->equalsDefaultfile(Landroid/net/Uri;Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 234
    iget-object v2, p0, Lcom/keepassdroid/fileselect/RecentFileHistory;->keyfiles:Ljava/util/List;

    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-static {v2}, Lcom/keepassdroid/utils/UriUtil;->parseDefaultFile(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    goto :goto_0

    .line 232
    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_2
    move-object v2, v3

    .line 238
    goto :goto_0
.end method

.method public getKeyfileAt(I)Ljava/lang/String;
    .locals 1
    .param p1, "i"    # I

    .prologue
    .line 160
    invoke-direct {p0}, Lcom/keepassdroid/fileselect/RecentFileHistory;->init()V

    .line 161
    iget-object v0, p0, Lcom/keepassdroid/fileselect/RecentFileHistory;->keyfiles:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    return-object v0
.end method

.method public hasRecentFiles()Z
    .locals 2

    .prologue
    const/4 v0, 0x0

    .line 147
    iget-boolean v1, p0, Lcom/keepassdroid/fileselect/RecentFileHistory;->enabled:Z

    if-nez v1, :cond_1

    .line 151
    :cond_0
    :goto_0
    return v0

    .line 149
    :cond_1
    invoke-direct {p0}, Lcom/keepassdroid/fileselect/RecentFileHistory;->init()V

    .line 151
    iget-object v1, p0, Lcom/keepassdroid/fileselect/RecentFileHistory;->databases:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-lez v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0
.end method
