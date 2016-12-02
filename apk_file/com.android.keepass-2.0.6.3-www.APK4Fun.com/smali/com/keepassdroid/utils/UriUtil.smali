.class public Lcom/keepassdroid/utils/UriUtil;
.super Ljava/lang/Object;
.source "UriUtil.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static equalsDefaultfile(Landroid/net/Uri;Ljava/lang/String;)Z
    .locals 2
    .param p0, "left"    # Landroid/net/Uri;
    .param p1, "right"    # Ljava/lang/String;

    .prologue
    .line 58
    invoke-static {p0}, Lcom/keepassdroid/utils/UriUtil;->parseDefaultFile(Landroid/net/Uri;)Landroid/net/Uri;

    move-result-object p0

    .line 59
    invoke-static {p1}, Lcom/keepassdroid/utils/UriUtil;->parseDefaultFile(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    .line 61
    .local v0, "uriRight":Landroid/net/Uri;
    invoke-virtual {p0, v0}, Landroid/net/Uri;->equals(Ljava/lang/Object;)Z

    move-result v1

    return v1
.end method

.method public static getUriInputStream(Landroid/content/Context;Landroid/net/Uri;)Ljava/io/InputStream;
    .locals 3
    .param p0, "ctx"    # Landroid/content/Context;
    .param p1, "uri"    # Landroid/net/Uri;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/FileNotFoundException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x0

    .line 65
    if-nez p1, :cond_1

    .line 75
    :cond_0
    :goto_0
    return-object v1

    .line 67
    :cond_1
    invoke-virtual {p1}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v0

    .line 68
    .local v0, "scheme":Ljava/lang/String;
    invoke-static {v0}, Lcom/keepassdroid/utils/EmptyUtils;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_2

    const-string v2, "file"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 69
    :cond_2
    new-instance v1, Ljava/io/FileInputStream;

    invoke-virtual {p1}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V

    goto :goto_0

    .line 71
    :cond_3
    const-string v2, "content"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 72
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    invoke-virtual {v1, p1}, Landroid/content/ContentResolver;->openInputStream(Landroid/net/Uri;)Ljava/io/InputStream;

    move-result-object v1

    goto :goto_0
.end method

.method private static hasWritableContentUri(Landroid/net/Uri;)Z
    .locals 5
    .param p0, "uri"    # Landroid/net/Uri;

    .prologue
    const/4 v1, 0x0

    .line 146
    invoke-virtual {p0}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v0

    .line 148
    .local v0, "scheme":Ljava/lang/String;
    invoke-static {v0}, Lcom/keepassdroid/utils/EmptyUtils;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 157
    :cond_0
    :goto_0
    return v1

    .line 150
    :cond_1
    const-string v2, "content"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 152
    invoke-virtual {p0}, Landroid/net/Uri;->getAuthority()Ljava/lang/String;

    move-result-object v3

    const/4 v2, -0x1

    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    move-result v4

    packed-switch v4, :pswitch_data_0

    :cond_2
    :goto_1
    packed-switch v2, :pswitch_data_1

    goto :goto_0

    .line 154
    :pswitch_0
    const/4 v1, 0x1

    goto :goto_0

    .line 152
    :pswitch_1
    const-string v4, "com.google.android.apps.docs.storage"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    move v2, v1

    goto :goto_1

    :pswitch_data_0
    .packed-switch -0x5d240ea3
        :pswitch_1
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method

.method private static isValidFilePath(Ljava/lang/String;)Z
    .locals 3
    .param p0, "filepath"    # Ljava/lang/String;

    .prologue
    const/4 v1, 0x0

    .line 134
    invoke-static {p0}, Lcom/keepassdroid/utils/EmptyUtils;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 137
    :cond_0
    :goto_0
    return v1

    .line 136
    :cond_1
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 137
    .local v0, "file":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-virtual {v0}, Ljava/io/File;->canRead()Z

    move-result v2

    if-eqz v2, :cond_0

    const/4 v1, 0x1

    goto :goto_0
.end method

.method public static parseDefaultFile(Landroid/net/Uri;)Landroid/net/Uri;
    .locals 2
    .param p0, "uri"    # Landroid/net/Uri;

    .prologue
    .line 50
    invoke-virtual {p0}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/keepassdroid/utils/EmptyUtils;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 51
    invoke-virtual {p0}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object v0

    const-string v1, "file"

    invoke-virtual {v0, v1}, Landroid/net/Uri$Builder;->scheme(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v0

    const-string v1, ""

    invoke-virtual {v0, v1}, Landroid/net/Uri$Builder;->authority(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object p0

    .line 54
    :cond_0
    return-object p0
.end method

.method public static parseDefaultFile(Ljava/lang/String;)Landroid/net/Uri;
    .locals 3
    .param p0, "text"    # Ljava/lang/String;

    .prologue
    .line 38
    invoke-static {p0}, Lcom/keepassdroid/utils/EmptyUtils;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 39
    const/4 v0, 0x0

    .line 47
    :cond_0
    :goto_0
    return-object v0

    .line 42
    :cond_1
    invoke-static {p0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    .line 43
    .local v0, "uri":Landroid/net/Uri;
    invoke-virtual {v0}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/keepassdroid/utils/EmptyUtils;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 44
    invoke-virtual {v0}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object v1

    const-string v2, "file"

    invoke-virtual {v1, v2}, Landroid/net/Uri$Builder;->scheme(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v1

    const-string v2, ""

    invoke-virtual {v1, v2}, Landroid/net/Uri$Builder;->authority(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v1

    invoke-virtual {v1}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object v0

    goto :goto_0
.end method

.method public static translate(Landroid/content/Context;Landroid/net/Uri;)Landroid/net/Uri;
    .locals 12
    .param p0, "ctx"    # Landroid/content/Context;
    .param p1, "uri"    # Landroid/net/Uri;

    .prologue
    .line 87
    invoke-static {p0}, Lcom/keepassdroid/compat/StorageAF;->useStorageFramework(Landroid/content/Context;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-static {p1}, Lcom/keepassdroid/utils/UriUtil;->hasWritableContentUri(Landroid/net/Uri;)Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    move-object v11, p1

    .line 130
    .end local p1    # "uri":Landroid/net/Uri;
    .local v11, "uri":Landroid/net/Uri;
    :goto_0
    return-object v11

    .line 89
    .end local v11    # "uri":Landroid/net/Uri;
    .restart local p1    # "uri":Landroid/net/Uri;
    :cond_1
    invoke-virtual {p1}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v10

    .line 90
    .local v10, "scheme":Ljava/lang/String;
    invoke-static {v10}, Lcom/keepassdroid/utils/EmptyUtils;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    move-object v11, p1

    .end local p1    # "uri":Landroid/net/Uri;
    .restart local v11    # "uri":Landroid/net/Uri;
    goto :goto_0

    .line 92
    .end local v11    # "uri":Landroid/net/Uri;
    .restart local p1    # "uri":Landroid/net/Uri;
    :cond_2
    const/4 v9, 0x0

    .line 96
    .local v9, "filepath":Ljava/lang/String;
    :try_start_0
    const-string v0, "content"

    invoke-virtual {v10, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 97
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const/4 v1, 0x1

    new-array v2, v1, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v3, "_data"

    aput-object v3, v2, v1

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    move-object v1, p1

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v7

    .line 98
    .local v7, "cursor":Landroid/database/Cursor;
    invoke-interface {v7}, Landroid/database/Cursor;->moveToFirst()Z

    .line 100
    if-eqz v7, :cond_3

    .line 101
    const/4 v0, 0x0

    invoke-interface {v7, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v9

    .line 102
    invoke-interface {v7}, Landroid/database/Cursor;->close()V

    .line 105
    invoke-static {v9}, Lcom/keepassdroid/utils/UriUtil;->isValidFilePath(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_3

    .line 106
    const/4 v9, 0x0

    .line 112
    .end local v7    # "cursor":Landroid/database/Cursor;
    :cond_3
    invoke-static {v9}, Lcom/keepassdroid/utils/EmptyUtils;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 113
    invoke-virtual {p1}, Landroid/net/Uri;->getEncodedPath()Ljava/lang/String;

    move-result-object v9

    .line 114
    invoke-static {v9}, Lcom/keepassdroid/utils/UriUtil;->isValidFilePath(Ljava/lang/String;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v0

    if-nez v0, :cond_4

    .line 115
    const/4 v9, 0x0

    .line 125
    :cond_4
    :goto_1
    invoke-static {v9}, Lcom/keepassdroid/utils/EmptyUtils;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_5

    .line 126
    new-instance v6, Landroid/net/Uri$Builder;

    invoke-direct {v6}, Landroid/net/Uri$Builder;-><init>()V

    .line 127
    .local v6, "b":Landroid/net/Uri$Builder;
    const-string v0, "file"

    invoke-virtual {v6, v0}, Landroid/net/Uri$Builder;->scheme(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v0

    const-string v1, ""

    invoke-virtual {v0, v1}, Landroid/net/Uri$Builder;->authority(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v0

    invoke-virtual {v0, v9}, Landroid/net/Uri$Builder;->path(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object p1

    .end local v6    # "b":Landroid/net/Uri$Builder;
    :cond_5
    move-object v11, p1

    .line 130
    .end local p1    # "uri":Landroid/net/Uri;
    .restart local v11    # "uri":Landroid/net/Uri;
    goto :goto_0

    .line 120
    .end local v11    # "uri":Landroid/net/Uri;
    .restart local p1    # "uri":Landroid/net/Uri;
    :catch_0
    move-exception v8

    .line 121
    .local v8, "e":Ljava/lang/Exception;
    const/4 v9, 0x0

    goto :goto_1
.end method
