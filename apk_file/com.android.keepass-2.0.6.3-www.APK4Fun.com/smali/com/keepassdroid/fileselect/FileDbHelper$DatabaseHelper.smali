.class Lcom/keepassdroid/fileselect/FileDbHelper$DatabaseHelper;
.super Landroid/database/sqlite/SQLiteOpenHelper;
.source "FileDbHelper.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/keepassdroid/fileselect/FileDbHelper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "DatabaseHelper"
.end annotation


# instance fields
.field private final mCtx:Landroid/content/Context;


# direct methods
.method constructor <init>(Landroid/content/Context;)V
    .locals 3
    .param p1, "ctx"    # Landroid/content/Context;

    .prologue
    .line 64
    const-string v0, "keepassdroid"

    const/4 v1, 0x0

    const/4 v2, 0x1

    invoke-direct {p0, p1, v0, v1, v2}, Landroid/database/sqlite/SQLiteOpenHelper;-><init>(Landroid/content/Context;Ljava/lang/String;Landroid/database/sqlite/SQLiteDatabase$CursorFactory;I)V

    .line 65
    iput-object p1, p0, Lcom/keepassdroid/fileselect/FileDbHelper$DatabaseHelper;->mCtx:Landroid/content/Context;

    .line 66
    return-void
.end method

.method private deletePrefs(Landroid/content/SharedPreferences;)V
    .locals 2
    .param p1, "prefs"    # Landroid/content/SharedPreferences;

    .prologue
    .line 102
    :try_start_0
    invoke-interface {p1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 103
    .local v0, "editor":Landroid/content/SharedPreferences$Editor;
    const-string v1, "lastFile"

    invoke-interface {v0, v1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 104
    const-string v1, "lastKey"

    invoke-interface {v0, v1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 105
    invoke-static {v0}, Lcom/keepassdroid/compat/EditorCompat;->apply(Landroid/content/SharedPreferences$Editor;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 109
    .end local v0    # "editor":Landroid/content/SharedPreferences$Editor;
    :goto_0
    return-void

    .line 106
    :catch_0
    move-exception v1

    goto :goto_0
.end method


# virtual methods
.method public onCreate(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 8
    .param p1, "db"    # Landroid/database/sqlite/SQLiteDatabase;

    .prologue
    .line 70
    const-string v4, "create table files ( _id integer primary key autoincrement, fileName text not null, keyFile text, updated integer not null);"

    invoke-virtual {p1, v4}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 73
    iget-object v4, p0, Lcom/keepassdroid/fileselect/FileDbHelper$DatabaseHelper;->mCtx:Landroid/content/Context;

    const-string v5, "PasswordActivity"

    const/4 v6, 0x0

    invoke-virtual {v4, v5, v6}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v2

    .line 74
    .local v2, "settings":Landroid/content/SharedPreferences;
    const-string v4, "lastFile"

    const-string v5, ""

    invoke-interface {v2, v4, v5}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 75
    .local v0, "lastFile":Ljava/lang/String;
    const-string v4, "lastKey"

    const-string v5, ""

    invoke-interface {v2, v4, v5}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 77
    .local v1, "lastKey":Ljava/lang/String;
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v4

    if-lez v4, :cond_1

    .line 78
    new-instance v3, Landroid/content/ContentValues;

    invoke-direct {v3}, Landroid/content/ContentValues;-><init>()V

    .line 79
    .local v3, "vals":Landroid/content/ContentValues;
    const-string v4, "fileName"

    invoke-virtual {v3, v4, v0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 80
    const-string v4, "updated"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 82
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v4

    if-lez v4, :cond_0

    .line 83
    const-string v4, "keyFile"

    invoke-virtual {v3, v4, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 86
    :cond_0
    const-string v4, "files"

    const/4 v5, 0x0

    invoke-virtual {p1, v4, v5, v3}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    .line 89
    invoke-direct {p0, v2}, Lcom/keepassdroid/fileselect/FileDbHelper$DatabaseHelper;->deletePrefs(Landroid/content/SharedPreferences;)V

    .line 92
    .end local v3    # "vals":Landroid/content/ContentValues;
    :cond_1
    return-void
.end method

.method public onUpgrade(Landroid/database/sqlite/SQLiteDatabase;II)V
    .locals 0
    .param p1, "db"    # Landroid/database/sqlite/SQLiteDatabase;
    .param p2, "oldVersion"    # I
    .param p3, "newVersion"    # I

    .prologue
    .line 97
    return-void
.end method
