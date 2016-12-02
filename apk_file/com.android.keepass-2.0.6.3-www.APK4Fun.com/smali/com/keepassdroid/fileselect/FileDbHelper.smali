.class public Lcom/keepassdroid/fileselect/FileDbHelper;
.super Ljava/lang/Object;
.source "FileDbHelper.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/keepassdroid/fileselect/FileDbHelper$DatabaseHelper;
    }
.end annotation


# static fields
.field private static final DATABASE_CREATE:Ljava/lang/String; = "create table files ( _id integer primary key autoincrement, fileName text not null, keyFile text, updated integer not null);"

.field public static final DATABASE_NAME:Ljava/lang/String; = "keepassdroid"

.field private static final DATABASE_VERSION:I = 0x1

.field private static final FILE_TABLE:Ljava/lang/String; = "files"

.field public static final KEY_FILE_FILENAME:Ljava/lang/String; = "fileName"

.field public static final KEY_FILE_ID:Ljava/lang/String; = "_id"

.field public static final KEY_FILE_KEYFILE:Ljava/lang/String; = "keyFile"

.field public static final KEY_FILE_UPDATED:Ljava/lang/String; = "updated"

.field public static final LAST_FILENAME:Ljava/lang/String; = "lastFile"

.field public static final LAST_KEYFILE:Ljava/lang/String; = "lastKey"

.field public static final MAX_FILES:I = 0x5


# instance fields
.field private final mCtx:Landroid/content/Context;

.field private mDb:Landroid/database/sqlite/SQLiteDatabase;

.field private mDbHelper:Lcom/keepassdroid/fileselect/FileDbHelper$DatabaseHelper;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1, "ctx"    # Landroid/content/Context;

    .prologue
    .line 112
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 113
    iput-object p1, p0, Lcom/keepassdroid/fileselect/FileDbHelper;->mCtx:Landroid/content/Context;

    .line 114
    return-void
.end method

.method private deleteAllBut(I)V
    .locals 12
    .param p1, "limit"    # I

    .prologue
    const/4 v3, 0x0

    .line 179
    iget-object v0, p0, Lcom/keepassdroid/fileselect/FileDbHelper;->mDb:Landroid/database/sqlite/SQLiteDatabase;

    const-string v1, "files"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/String;

    const/4 v4, 0x0

    const-string v5, "updated"

    aput-object v5, v2, v4

    const-string v7, "updated"

    move-object v4, v3

    move-object v5, v3

    move-object v6, v3

    invoke-virtual/range {v0 .. v7}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v8

    .line 181
    .local v8, "cursor":Landroid/database/Cursor;
    invoke-interface {v8}, Landroid/database/Cursor;->getCount()I

    move-result v0

    if-le v0, p1, :cond_0

    .line 182
    invoke-interface {v8}, Landroid/database/Cursor;->moveToFirst()Z

    .line 183
    const-string v0, "updated"

    invoke-interface {v8, v0}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v0

    invoke-interface {v8, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v10

    .line 185
    .local v10, "time":J
    iget-object v0, p0, Lcom/keepassdroid/fileselect/FileDbHelper;->mDb:Landroid/database/sqlite/SQLiteDatabase;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "DELETE FROM files WHERE updated<"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v10, v11}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ";"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 188
    .end local v10    # "time":J
    :cond_0
    invoke-interface {v8}, Landroid/database/Cursor;->close()V

    .line 190
    return-void
.end method

.method public static deleteDatabase(Landroid/content/Context;)Z
    .locals 10
    .param p0, "ctx"    # Landroid/content/Context;

    .prologue
    .line 259
    const-string v6, "keepassdroid"

    invoke-virtual {p0, v6}, Landroid/content/Context;->getDatabasePath(Ljava/lang/String;)Ljava/io/File;

    move-result-object v2

    .line 260
    .local v2, "file":Ljava/io/File;
    if-nez v2, :cond_0

    .line 261
    new-instance v6, Ljava/lang/IllegalArgumentException;

    const-string v7, "file must not be null"

    invoke-direct {v6, v7}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 264
    :cond_0
    const/4 v0, 0x0

    .line 265
    .local v0, "deleted":Z
    invoke-virtual {v2}, Ljava/io/File;->delete()Z

    move-result v6

    or-int/2addr v0, v6

    .line 266
    new-instance v6, Ljava/io/File;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "-journal"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6}, Ljava/io/File;->delete()Z

    move-result v6

    or-int/2addr v0, v6

    .line 267
    new-instance v6, Ljava/io/File;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "-shm"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6}, Ljava/io/File;->delete()Z

    move-result v6

    or-int/2addr v0, v6

    .line 268
    new-instance v6, Ljava/io/File;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "-wal"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6}, Ljava/io/File;->delete()Z

    move-result v6

    or-int/2addr v0, v6

    .line 270
    invoke-virtual {v2}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v1

    .line 271
    .local v1, "dir":Ljava/io/File;
    if-eqz v1, :cond_1

    .line 272
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "-mj"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 273
    .local v5, "prefix":Ljava/lang/String;
    new-instance v3, Lcom/keepassdroid/fileselect/FileDbHelper$1;

    invoke-direct {v3, v5}, Lcom/keepassdroid/fileselect/FileDbHelper$1;-><init>(Ljava/lang/String;)V

    .line 279
    .local v3, "filter":Ljava/io/FileFilter;
    invoke-virtual {v1, v3}, Ljava/io/File;->listFiles(Ljava/io/FileFilter;)[Ljava/io/File;

    move-result-object v7

    array-length v8, v7

    const/4 v6, 0x0

    :goto_0
    if-ge v6, v8, :cond_1

    aget-object v4, v7, v6

    .line 280
    .local v4, "masterJournal":Ljava/io/File;
    invoke-virtual {v4}, Ljava/io/File;->delete()Z

    move-result v9

    or-int/2addr v0, v9

    .line 279
    add-int/lit8 v6, v6, 0x1

    goto :goto_0

    .line 283
    .end local v3    # "filter":Ljava/io/FileFilter;
    .end local v4    # "masterJournal":Ljava/io/File;
    .end local v5    # "prefix":Ljava/lang/String;
    :cond_1
    return v0
.end method


# virtual methods
.method public close()V
    .locals 1

    .prologue
    .line 127
    iget-object v0, p0, Lcom/keepassdroid/fileselect/FileDbHelper;->mDb:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->close()V

    .line 128
    return-void
.end method

.method public createFile(Ljava/lang/String;Ljava/lang/String;)J
    .locals 19
    .param p1, "fileName"    # Ljava/lang/String;
    .param p2, "keyFile"    # Ljava/lang/String;

    .prologue
    .line 135
    :try_start_0
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/keepassdroid/fileselect/FileDbHelper;->mDb:Landroid/database/sqlite/SQLiteDatabase;

    const/4 v3, 0x1

    const-string v4, "files"

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/String;

    const/4 v6, 0x0

    const-string v7, "_id"

    aput-object v7, v5, v6

    const-string v6, "fileName=?"

    const/4 v7, 0x1

    new-array v7, v7, [Ljava/lang/String;

    const/4 v8, 0x0

    aput-object p1, v7, v8

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x0

    invoke-virtual/range {v2 .. v11}, Landroid/database/sqlite/SQLiteDatabase;->query(ZLjava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v12

    .line 144
    .local v12, "cursor":Landroid/database/Cursor;
    invoke-interface {v12}, Landroid/database/Cursor;->getCount()I

    move-result v2

    if-lez v2, :cond_0

    .line 145
    invoke-interface {v12}, Landroid/database/Cursor;->moveToFirst()Z

    .line 146
    const-string v2, "_id"

    invoke-interface {v12, v2}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v2

    invoke-interface {v12, v2}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v14

    .line 148
    .local v14, "id":J
    new-instance v18, Landroid/content/ContentValues;

    invoke-direct/range {v18 .. v18}, Landroid/content/ContentValues;-><init>()V

    .line 149
    .local v18, "vals":Landroid/content/ContentValues;
    const-string v2, "keyFile"

    move-object/from16 v0, v18

    move-object/from16 v1, p2

    invoke-virtual {v0, v2, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 150
    const-string v2, "updated"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    move-object/from16 v0, v18

    invoke-virtual {v0, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 152
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/keepassdroid/fileselect/FileDbHelper;->mDb:Landroid/database/sqlite/SQLiteDatabase;

    const-string v3, "files"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "_id = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v14, v15}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x0

    move-object/from16 v0, v18

    invoke-virtual {v2, v3, v0, v4, v5}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v2

    int-to-long v0, v2

    move-wide/from16 v16, v0

    .line 166
    .end local v14    # "id":J
    .local v16, "result":J
    :goto_0
    const/4 v2, 0x5

    :try_start_1
    move-object/from16 v0, p0

    invoke-direct {v0, v2}, Lcom/keepassdroid/fileselect/FileDbHelper;->deleteAllBut(I)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 172
    :goto_1
    invoke-interface {v12}, Landroid/database/Cursor;->close()V

    .line 174
    .end local v12    # "cursor":Landroid/database/Cursor;
    .end local v16    # "result":J
    .end local v18    # "vals":Landroid/content/ContentValues;
    :goto_2
    return-wide v16

    .line 137
    :catch_0
    move-exception v13

    .line 139
    .local v13, "e":Ljava/lang/Exception;
    const-wide/16 v16, -0x1

    goto :goto_2

    .line 156
    .end local v13    # "e":Ljava/lang/Exception;
    .restart local v12    # "cursor":Landroid/database/Cursor;
    :cond_0
    new-instance v18, Landroid/content/ContentValues;

    invoke-direct/range {v18 .. v18}, Landroid/content/ContentValues;-><init>()V

    .line 157
    .restart local v18    # "vals":Landroid/content/ContentValues;
    const-string v2, "fileName"

    move-object/from16 v0, v18

    move-object/from16 v1, p1

    invoke-virtual {v0, v2, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 158
    const-string v2, "keyFile"

    move-object/from16 v0, v18

    move-object/from16 v1, p2

    invoke-virtual {v0, v2, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 159
    const-string v2, "updated"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    move-object/from16 v0, v18

    invoke-virtual {v0, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 161
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/keepassdroid/fileselect/FileDbHelper;->mDb:Landroid/database/sqlite/SQLiteDatabase;

    const-string v3, "files"

    const/4 v4, 0x0

    move-object/from16 v0, v18

    invoke-virtual {v2, v3, v4, v0}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    move-result-wide v16

    .restart local v16    # "result":J
    goto :goto_0

    .line 167
    :catch_1
    move-exception v13

    .line 168
    .restart local v13    # "e":Ljava/lang/Exception;
    invoke-virtual {v13}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_1
.end method

.method public deleteAllKeys()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 193
    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    .line 194
    .local v0, "vals":Landroid/content/ContentValues;
    const-string v1, "keyFile"

    const-string v2, ""

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 196
    iget-object v1, p0, Lcom/keepassdroid/fileselect/FileDbHelper;->mDb:Landroid/database/sqlite/SQLiteDatabase;

    const-string v2, "files"

    invoke-virtual {v1, v2, v0, v3, v3}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    .line 197
    return-void
.end method

.method public deleteFile(Ljava/lang/String;)V
    .locals 5
    .param p1, "filename"    # Ljava/lang/String;

    .prologue
    .line 200
    iget-object v0, p0, Lcom/keepassdroid/fileselect/FileDbHelper;->mDb:Landroid/database/sqlite/SQLiteDatabase;

    const-string v1, "files"

    const-string v2, "fileName = ?"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/String;

    const/4 v4, 0x0

    aput-object p1, v3, v4

    invoke-virtual {v0, v1, v2, v3}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    .line 201
    return-void
.end method

.method public fetchAllFiles()Landroid/database/Cursor;
    .locals 10

    .prologue
    const/4 v3, 0x0

    .line 206
    iget-object v0, p0, Lcom/keepassdroid/fileselect/FileDbHelper;->mDb:Landroid/database/sqlite/SQLiteDatabase;

    const-string v1, "files"

    const/4 v2, 0x3

    new-array v2, v2, [Ljava/lang/String;

    const/4 v4, 0x0

    const-string v5, "_id"

    aput-object v5, v2, v4

    const/4 v4, 0x1

    const-string v5, "fileName"

    aput-object v5, v2, v4

    const/4 v4, 0x2

    const-string v5, "keyFile"

    aput-object v5, v2, v4

    const-string v7, "updated DESC"

    const/4 v4, 0x5

    invoke-static {v4}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v8

    move-object v4, v3

    move-object v5, v3

    move-object v6, v3

    invoke-virtual/range {v0 .. v8}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v9

    .line 207
    .local v9, "ret":Landroid/database/Cursor;
    return-object v9
.end method

.method public fetchFile(J)Landroid/database/Cursor;
    .locals 11
    .param p1, "fileId"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/database/SQLException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x1

    const/4 v5, 0x0

    .line 211
    iget-object v0, p0, Lcom/keepassdroid/fileselect/FileDbHelper;->mDb:Landroid/database/sqlite/SQLiteDatabase;

    const-string v2, "files"

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/String;

    const/4 v4, 0x0

    const-string v6, "fileName"

    aput-object v6, v3, v4

    const-string v4, "keyFile"

    aput-object v4, v3, v1

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "_id="

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    move-object v6, v5

    move-object v7, v5

    move-object v8, v5

    move-object v9, v5

    invoke-virtual/range {v0 .. v9}, Landroid/database/sqlite/SQLiteDatabase;->query(ZLjava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v10

    .line 214
    .local v10, "cursor":Landroid/database/Cursor;
    if-eqz v10, :cond_0

    .line 215
    invoke-interface {v10}, Landroid/database/Cursor;->moveToFirst()Z

    .line 218
    :cond_0
    return-object v10
.end method

.method public getFileByName(Ljava/lang/String;)Ljava/lang/String;
    .locals 13
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    const/4 v1, 0x1

    const/4 v12, 0x0

    const/4 v6, 0x0

    .line 223
    iget-object v0, p0, Lcom/keepassdroid/fileselect/FileDbHelper;->mDb:Landroid/database/sqlite/SQLiteDatabase;

    const-string v2, "files"

    new-array v3, v1, [Ljava/lang/String;

    const-string v4, "keyFile"

    aput-object v4, v3, v12

    const-string v4, "fileName= ?"

    new-array v5, v1, [Ljava/lang/String;

    aput-object p1, v5, v12

    move-object v7, v6

    move-object v8, v6

    move-object v9, v6

    invoke-virtual/range {v0 .. v9}, Landroid/database/sqlite/SQLiteDatabase;->query(ZLjava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v10

    .line 226
    .local v10, "cursor":Landroid/database/Cursor;
    if-nez v10, :cond_0

    .line 227
    const-string v11, ""

    .line 239
    :goto_0
    return-object v11

    .line 232
    :cond_0
    invoke-interface {v10}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 233
    invoke-interface {v10, v12}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v11

    .line 238
    .local v11, "filename":Ljava/lang/String;
    :goto_1
    invoke-interface {v10}, Landroid/database/Cursor;->close()V

    goto :goto_0

    .line 236
    .end local v11    # "filename":Ljava/lang/String;
    :cond_1
    const-string v11, ""

    .restart local v11    # "filename":Ljava/lang/String;
    goto :goto_1
.end method

.method public hasRecentFiles()Z
    .locals 3

    .prologue
    .line 243
    invoke-virtual {p0}, Lcom/keepassdroid/fileselect/FileDbHelper;->fetchAllFiles()Landroid/database/Cursor;

    move-result-object v0

    .line 245
    .local v0, "cursor":Landroid/database/Cursor;
    invoke-interface {v0}, Landroid/database/Cursor;->getCount()I

    move-result v2

    if-lez v2, :cond_0

    const/4 v1, 0x1

    .line 246
    .local v1, "hasRecent":Z
    :goto_0
    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    .line 248
    return v1

    .line 245
    .end local v1    # "hasRecent":Z
    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public isOpen()Z
    .locals 1

    .prologue
    .line 123
    iget-object v0, p0, Lcom/keepassdroid/fileselect/FileDbHelper;->mDb:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->isOpen()Z

    move-result v0

    return v0
.end method

.method public open()Lcom/keepassdroid/fileselect/FileDbHelper;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/database/SQLException;
        }
    .end annotation

    .prologue
    .line 117
    new-instance v0, Lcom/keepassdroid/fileselect/FileDbHelper$DatabaseHelper;

    iget-object v1, p0, Lcom/keepassdroid/fileselect/FileDbHelper;->mCtx:Landroid/content/Context;

    invoke-direct {v0, v1}, Lcom/keepassdroid/fileselect/FileDbHelper$DatabaseHelper;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/keepassdroid/fileselect/FileDbHelper;->mDbHelper:Lcom/keepassdroid/fileselect/FileDbHelper$DatabaseHelper;

    .line 118
    iget-object v0, p0, Lcom/keepassdroid/fileselect/FileDbHelper;->mDbHelper:Lcom/keepassdroid/fileselect/FileDbHelper$DatabaseHelper;

    invoke-virtual {v0}, Lcom/keepassdroid/fileselect/FileDbHelper$DatabaseHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    iput-object v0, p0, Lcom/keepassdroid/fileselect/FileDbHelper;->mDb:Landroid/database/sqlite/SQLiteDatabase;

    .line 119
    return-object p0
.end method
