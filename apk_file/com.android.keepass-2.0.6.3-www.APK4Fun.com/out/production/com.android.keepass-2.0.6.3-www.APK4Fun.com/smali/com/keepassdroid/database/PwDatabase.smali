.class public abstract Lcom/keepassdroid/database/PwDatabase;
.super Ljava/lang/Object;
.source "PwDatabase.java"


# static fields
.field static final synthetic $assertionsDisabled:Z


# instance fields
.field public entries:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/util/UUID;",
            "Lcom/keepassdroid/database/PwEntry;",
            ">;"
        }
    .end annotation
.end field

.field public finalKey:[B

.field public groups:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Lcom/keepassdroid/database/PwGroupId;",
            "Lcom/keepassdroid/database/PwGroup;",
            ">;"
        }
    .end annotation
.end field

.field public iconFactory:Lcom/keepassdroid/database/PwIconFactory;

.field public masterKey:[B

.field public name:Ljava/lang/String;

.field public rootGroup:Lcom/keepassdroid/database/PwGroup;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 48
    const-class v0, Lcom/keepassdroid/database/PwDatabase;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    sput-boolean v0, Lcom/keepassdroid/database/PwDatabase;->$assertionsDisabled:Z

    return-void

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 48
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 50
    const/16 v0, 0x20

    new-array v0, v0, [B

    iput-object v0, p0, Lcom/keepassdroid/database/PwDatabase;->masterKey:[B

    .line 52
    const-string v0, "KeePass database"

    iput-object v0, p0, Lcom/keepassdroid/database/PwDatabase;->name:Ljava/lang/String;

    .line 54
    new-instance v0, Lcom/keepassdroid/database/PwIconFactory;

    invoke-direct {v0}, Lcom/keepassdroid/database/PwIconFactory;-><init>()V

    iput-object v0, p0, Lcom/keepassdroid/database/PwDatabase;->iconFactory:Lcom/keepassdroid/database/PwIconFactory;

    .line 55
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/keepassdroid/database/PwDatabase;->groups:Ljava/util/Map;

    .line 56
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/keepassdroid/database/PwDatabase;->entries:Ljava/util/Map;

    return-void
.end method

.method public static getNewDBInstance(Ljava/lang/String;)Lcom/keepassdroid/database/PwDatabase;
    .locals 1
    .param p0, "filename"    # Ljava/lang/String;

    .prologue
    .line 69
    invoke-static {p0}, Lcom/keepassdroid/database/PwDatabase;->isKDBExtension(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 70
    new-instance v0, Lcom/keepassdroid/database/PwDatabaseV3;

    invoke-direct {v0}, Lcom/keepassdroid/database/PwDatabaseV3;-><init>()V

    .line 72
    :goto_0
    return-object v0

    :cond_0
    new-instance v0, Lcom/keepassdroid/database/PwDatabaseV4;

    invoke-direct {v0}, Lcom/keepassdroid/database/PwDatabaseV4;-><init>()V

    goto :goto_0
.end method

.method public static hexStringToByteArray(Ljava/lang/String;)[B
    .locals 7
    .param p0, "s"    # Ljava/lang/String;

    .prologue
    const/16 v6, 0x10

    .line 187
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    .line 188
    .local v2, "len":I
    div-int/lit8 v3, v2, 0x2

    new-array v0, v3, [B

    .line 189
    .local v0, "data":[B
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-ge v1, v2, :cond_0

    .line 190
    div-int/lit8 v3, v1, 0x2

    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v4

    invoke-static {v4, v6}, Ljava/lang/Character;->digit(CI)I

    move-result v4

    shl-int/lit8 v4, v4, 0x4

    add-int/lit8 v5, v1, 0x1

    .line 191
    invoke-virtual {p0, v5}, Ljava/lang/String;->charAt(I)C

    move-result v5

    invoke-static {v5, v6}, Ljava/lang/Character;->digit(CI)I

    move-result v5

    add-int/2addr v4, v5

    int-to-byte v4, v4

    aput-byte v4, v0, v3

    .line 189
    add-int/lit8 v1, v1, 0x2

    goto :goto_0

    .line 193
    :cond_0
    return-object v0
.end method

.method private static isKDBExtension(Ljava/lang/String;)Z
    .locals 3
    .param p0, "filename"    # Ljava/lang/String;

    .prologue
    const/4 v1, 0x0

    .line 60
    if-nez p0, :cond_1

    .line 65
    :cond_0
    :goto_0
    return v1

    .line 62
    :cond_1
    const-string v2, "."

    invoke-virtual {p0, v2}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v0

    .line 63
    .local v0, "extIdx":I
    const/4 v2, -0x1

    if-eq v0, v2, :cond_0

    .line 65
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    const-string v2, ".kdb"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    goto :goto_0
.end method

.method private static transformMasterKey([B[BI)[B
    .locals 2
    .param p0, "pKeySeed"    # [B
    .param p1, "pKey"    # [B
    .param p2, "rounds"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 101
    invoke-static {}, Lcom/keepassdroid/crypto/finalkey/FinalKeyFactory;->createFinalKey()Lcom/keepassdroid/crypto/finalkey/FinalKey;

    move-result-object v0

    .line 103
    .local v0, "key":Lcom/keepassdroid/crypto/finalkey/FinalKey;
    invoke-virtual {v0, p0, p1, p2}, Lcom/keepassdroid/crypto/finalkey/FinalKey;->transformMasterKey([B[BI)[B

    move-result-object v1

    return-object v1
.end method


# virtual methods
.method public addEntryTo(Lcom/keepassdroid/database/PwEntry;Lcom/keepassdroid/database/PwGroup;)V
    .locals 2
    .param p1, "newEntry"    # Lcom/keepassdroid/database/PwEntry;
    .param p2, "parent"    # Lcom/keepassdroid/database/PwGroup;

    .prologue
    .line 280
    if-eqz p2, :cond_0

    .line 281
    iget-object v0, p2, Lcom/keepassdroid/database/PwGroup;->childEntries:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 283
    :cond_0
    invoke-virtual {p1, p2}, Lcom/keepassdroid/database/PwEntry;->setParent(Lcom/keepassdroid/database/PwGroup;)V

    .line 285
    iget-object v0, p0, Lcom/keepassdroid/database/PwDatabase;->entries:Ljava/util/Map;

    invoke-virtual {p1}, Lcom/keepassdroid/database/PwEntry;->getUUID()Ljava/util/UUID;

    move-result-object v1

    invoke-interface {v0, v1, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 286
    return-void
.end method

.method public addGroupTo(Lcom/keepassdroid/database/PwGroup;Lcom/keepassdroid/database/PwGroup;)V
    .locals 3
    .param p1, "newGroup"    # Lcom/keepassdroid/database/PwGroup;
    .param p2, "parent"    # Lcom/keepassdroid/database/PwGroup;

    .prologue
    const/4 v2, 0x1

    .line 260
    if-nez p2, :cond_0

    .line 261
    iget-object p2, p0, Lcom/keepassdroid/database/PwDatabase;->rootGroup:Lcom/keepassdroid/database/PwGroup;

    .line 264
    :cond_0
    iget-object v0, p2, Lcom/keepassdroid/database/PwGroup;->childGroups:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 265
    invoke-virtual {p1, p2}, Lcom/keepassdroid/database/PwGroup;->setParent(Lcom/keepassdroid/database/PwGroup;)V

    .line 266
    iget-object v0, p0, Lcom/keepassdroid/database/PwDatabase;->groups:Ljava/util/Map;

    invoke-virtual {p1}, Lcom/keepassdroid/database/PwGroup;->getId()Lcom/keepassdroid/database/PwGroupId;

    move-result-object v1

    invoke-interface {v0, v1, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 268
    invoke-virtual {p2, v2, v2}, Lcom/keepassdroid/database/PwGroup;->touch(ZZ)V

    .line 269
    return-void
.end method

.method public abstract appSettingsEnabled()Z
.end method

.method public canRecycle(Lcom/keepassdroid/database/PwEntry;)Z
    .locals 1
    .param p1, "entry"    # Lcom/keepassdroid/database/PwEntry;

    .prologue
    .line 344
    const/4 v0, 0x0

    return v0
.end method

.method public canRecycle(Lcom/keepassdroid/database/PwGroup;)Z
    .locals 1
    .param p1, "group"    # Lcom/keepassdroid/database/PwGroup;

    .prologue
    .line 340
    const/4 v0, 0x0

    return v0
.end method

.method public abstract createGroup()Lcom/keepassdroid/database/PwGroup;
.end method

.method public deleteEntry(Lcom/keepassdroid/database/PwEntry;)V
    .locals 3
    .param p1, "entry"    # Lcom/keepassdroid/database/PwEntry;

    .prologue
    .line 357
    invoke-virtual {p1}, Lcom/keepassdroid/database/PwEntry;->getParent()Lcom/keepassdroid/database/PwGroup;

    move-result-object v0

    .line 358
    .local v0, "parent":Lcom/keepassdroid/database/PwGroup;
    invoke-virtual {p0, p1, v0}, Lcom/keepassdroid/database/PwDatabase;->removeEntryFrom(Lcom/keepassdroid/database/PwEntry;Lcom/keepassdroid/database/PwGroup;)V

    .line 359
    const/4 v1, 0x0

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Lcom/keepassdroid/database/PwGroup;->touch(ZZ)V

    .line 361
    return-void
.end method

.method protected getCompositeKey(Ljava/lang/String;Ljava/io/InputStream;)[B
    .locals 6
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "keyInputStream"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/keepassdroid/database/exception/InvalidKeyFileException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 118
    sget-boolean v4, Lcom/keepassdroid/database/PwDatabase;->$assertionsDisabled:Z

    if-nez v4, :cond_1

    if-eqz p1, :cond_0

    if-nez p2, :cond_1

    :cond_0
    new-instance v4, Ljava/lang/AssertionError;

    invoke-direct {v4}, Ljava/lang/AssertionError;-><init>()V

    throw v4

    .line 120
    :cond_1
    invoke-virtual {p0, p2}, Lcom/keepassdroid/database/PwDatabase;->getFileKey(Ljava/io/InputStream;)[B

    move-result-object v1

    .line 122
    .local v1, "fileKey":[B
    invoke-virtual {p0, p1}, Lcom/keepassdroid/database/PwDatabase;->getPasswordKey(Ljava/lang/String;)[B

    move-result-object v3

    .line 126
    .local v3, "passwordKey":[B
    :try_start_0
    const-string v4, "SHA-256"

    invoke-static {v4}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;
    :try_end_0
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    .line 131
    .local v2, "md":Ljava/security/MessageDigest;
    invoke-virtual {v2, v3}, Ljava/security/MessageDigest;->update([B)V

    .line 133
    invoke-virtual {v2, v1}, Ljava/security/MessageDigest;->digest([B)[B

    move-result-object v4

    return-object v4

    .line 127
    .end local v2    # "md":Ljava/security/MessageDigest;
    :catch_0
    move-exception v0

    .line 128
    .local v0, "e":Ljava/security/NoSuchAlgorithmException;
    new-instance v4, Ljava/io/IOException;

    const-string v5, "SHA-256 not supported"

    invoke-direct {v4, v5}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v4
.end method

.method public abstract getEncAlgorithm()Lcom/keepassdroid/database/PwEncryptionAlgorithm;
.end method

.method public abstract getEntries()Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/keepassdroid/database/PwEntry;",
            ">;"
        }
    .end annotation
.end method

.method protected getFileKey(Ljava/io/InputStream;)[B
    .locals 14
    .param p1, "keyInputStream"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/keepassdroid/database/exception/InvalidKeyFileException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 138
    sget-boolean v11, Lcom/keepassdroid/database/PwDatabase;->$assertionsDisabled:Z

    if-nez v11, :cond_0

    if-nez p1, :cond_0

    new-instance v11, Ljava/lang/AssertionError;

    invoke-direct {v11}, Ljava/lang/AssertionError;-><init>()V

    throw v11

    .line 140
    :cond_0
    new-instance v1, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v1}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 141
    .local v1, "bos":Ljava/io/ByteArrayOutputStream;
    invoke-static {p1, v1}, Lcom/keepassdroid/utils/Util;->copyStream(Ljava/io/InputStream;Ljava/io/OutputStream;)V

    .line 142
    invoke-virtual {v1}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v8

    .line 144
    .local v8, "keyData":[B
    new-instance v0, Ljava/io/ByteArrayInputStream;

    invoke-direct {v0, v8}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    .line 145
    .local v0, "bis":Ljava/io/ByteArrayInputStream;
    invoke-virtual {p0, v0}, Lcom/keepassdroid/database/PwDatabase;->loadXmlKeyFile(Ljava/io/InputStream;)[B

    move-result-object v7

    .line 146
    .local v7, "key":[B
    if-eqz v7, :cond_1

    .line 181
    .end local v7    # "key":[B
    :goto_0
    return-object v7

    .line 150
    .restart local v7    # "key":[B
    :cond_1
    array-length v11, v8

    int-to-long v4, v11

    .line 151
    .local v4, "fileSize":J
    const-wide/16 v12, 0x0

    cmp-long v11, v4, v12

    if-nez v11, :cond_2

    .line 152
    new-instance v11, Lcom/keepassdroid/database/exception/KeyFileEmptyException;

    invoke-direct {v11}, Lcom/keepassdroid/database/exception/KeyFileEmptyException;-><init>()V

    throw v11

    .line 153
    :cond_2
    const-wide/16 v12, 0x20

    cmp-long v11, v4, v12

    if-nez v11, :cond_3

    move-object v7, v8

    .line 154
    goto :goto_0

    .line 155
    :cond_3
    const-wide/16 v12, 0x40

    cmp-long v11, v4, v12

    if-nez v11, :cond_4

    .line 156
    const/16 v11, 0x40

    new-array v6, v11, [B

    .line 159
    .local v6, "hex":[B
    :try_start_0
    new-instance v11, Ljava/lang/String;

    invoke-direct {v11, v8}, Ljava/lang/String;-><init>([B)V

    invoke-static {v11}, Lcom/keepassdroid/database/PwDatabase;->hexStringToByteArray(Ljava/lang/String;)[B
    :try_end_0
    .catch Ljava/lang/IndexOutOfBoundsException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v7

    goto :goto_0

    .line 160
    :catch_0
    move-exception v11

    .line 167
    .end local v6    # "hex":[B
    :cond_4
    :try_start_1
    const-string v11, "SHA-256"

    invoke-static {v11}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;
    :try_end_1
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_1 .. :try_end_1} :catch_1

    move-result-object v9

    .line 172
    .local v9, "md":Ljava/security/MessageDigest;
    const/16 v11, 0x800

    new-array v2, v11, [B

    .line 173
    .local v2, "buffer":[B
    const/4 v10, 0x0

    .line 176
    .local v10, "offset":I
    :try_start_2
    invoke-virtual {v9, v8}, Ljava/security/MessageDigest;->update([B)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    .line 181
    :goto_1
    invoke-virtual {v9}, Ljava/security/MessageDigest;->digest()[B

    move-result-object v7

    goto :goto_0

    .line 168
    .end local v2    # "buffer":[B
    .end local v9    # "md":Ljava/security/MessageDigest;
    .end local v10    # "offset":I
    :catch_1
    move-exception v3

    .line 169
    .local v3, "e":Ljava/security/NoSuchAlgorithmException;
    new-instance v11, Ljava/io/IOException;

    const-string v12, "SHA-256 not supported"

    invoke-direct {v11, v12}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v11

    .line 177
    .end local v3    # "e":Ljava/security/NoSuchAlgorithmException;
    .restart local v2    # "buffer":[B
    .restart local v9    # "md":Ljava/security/MessageDigest;
    .restart local v10    # "offset":I
    :catch_2
    move-exception v3

    .line 178
    .local v3, "e":Ljava/lang/Exception;
    sget-object v11, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {v3}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    goto :goto_1
.end method

.method public abstract getGroups()Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/keepassdroid/database/PwGroup;",
            ">;"
        }
    .end annotation
.end method

.method public abstract getGrpRoots()Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/keepassdroid/database/PwGroup;",
            ">;"
        }
    .end annotation
.end method

.method public abstract getMasterKey(Ljava/lang/String;Ljava/io/InputStream;)[B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/keepassdroid/database/exception/InvalidKeyFileException;,
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract getNumRounds()J
.end method

.method protected abstract getPasswordEncoding()Ljava/lang/String;
.end method

.method public getPasswordKey(Ljava/lang/String;)[B
    .locals 5
    .param p1, "key"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 220
    sget-boolean v3, Lcom/keepassdroid/database/PwDatabase;->$assertionsDisabled:Z

    if-nez v3, :cond_0

    if-nez p1, :cond_0

    new-instance v3, Ljava/lang/AssertionError;

    invoke-direct {v3}, Ljava/lang/AssertionError;-><init>()V

    throw v3

    .line 222
    :cond_0
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v3

    if-nez v3, :cond_1

    .line 223
    new-instance v3, Ljava/lang/IllegalArgumentException;

    const-string v4, "Key cannot be empty."

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 227
    :cond_1
    :try_start_0
    const-string v3, "SHA-256"

    invoke-static {v3}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;
    :try_end_0
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    .line 234
    .local v2, "md":Ljava/security/MessageDigest;
    :try_start_1
    invoke-virtual {p0}, Lcom/keepassdroid/database/PwDatabase;->getPasswordEncoding()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1, v3}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B
    :try_end_1
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_1 .. :try_end_1} :catch_1

    move-result-object v0

    .line 239
    .local v0, "bKey":[B
    :goto_0
    const/4 v3, 0x0

    array-length v4, v0

    invoke-virtual {v2, v0, v3, v4}, Ljava/security/MessageDigest;->update([BII)V

    .line 241
    invoke-virtual {v2}, Ljava/security/MessageDigest;->digest()[B

    move-result-object v3

    return-object v3

    .line 228
    .end local v0    # "bKey":[B
    .end local v2    # "md":Ljava/security/MessageDigest;
    :catch_0
    move-exception v1

    .line 229
    .local v1, "e":Ljava/security/NoSuchAlgorithmException;
    new-instance v3, Ljava/io/IOException;

    const-string v4, "SHA-256 not supported"

    invoke-direct {v3, v4}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 235
    .end local v1    # "e":Ljava/security/NoSuchAlgorithmException;
    .restart local v2    # "md":Ljava/security/MessageDigest;
    :catch_1
    move-exception v1

    .line 236
    .local v1, "e":Ljava/io/UnsupportedEncodingException;
    sget-boolean v3, Lcom/keepassdroid/database/PwDatabase;->$assertionsDisabled:Z

    if-nez v3, :cond_2

    new-instance v3, Ljava/lang/AssertionError;

    invoke-direct {v3}, Ljava/lang/AssertionError;-><init>()V

    throw v3

    .line 237
    :cond_2
    invoke-virtual {p1}, Ljava/lang/String;->getBytes()[B

    move-result-object v0

    .restart local v0    # "bKey":[B
    goto :goto_0
.end method

.method public getRecycleBin()Lcom/keepassdroid/database/PwGroup;
    .locals 1

    .prologue
    .line 368
    const/4 v0, 0x0

    return-object v0
.end method

.method public abstract initNew(Ljava/lang/String;)V
.end method

.method public abstract isBackup(Lcom/keepassdroid/database/PwGroup;)Z
.end method

.method protected isGroupIdUsed(Lcom/keepassdroid/database/PwGroupId;)Z
    .locals 4
    .param p1, "id"    # Lcom/keepassdroid/database/PwGroupId;

    .prologue
    .line 306
    invoke-virtual {p0}, Lcom/keepassdroid/database/PwDatabase;->getGroups()Ljava/util/List;

    move-result-object v1

    .line 308
    .local v1, "groups":Ljava/util/List;, "Ljava/util/List<Lcom/keepassdroid/database/PwGroup;>;"
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v3

    if-ge v2, v3, :cond_1

    .line 309
    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/keepassdroid/database/PwGroup;

    .line 310
    .local v0, "group":Lcom/keepassdroid/database/PwGroup;
    invoke-virtual {v0}, Lcom/keepassdroid/database/PwGroup;->getId()Lcom/keepassdroid/database/PwGroupId;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 311
    const/4 v3, 0x1

    .line 315
    .end local v0    # "group":Lcom/keepassdroid/database/PwGroup;
    :goto_1
    return v3

    .line 308
    .restart local v0    # "group":Lcom/keepassdroid/database/PwGroup;
    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 315
    .end local v0    # "group":Lcom/keepassdroid/database/PwGroup;
    :cond_1
    const/4 v3, 0x0

    goto :goto_1
.end method

.method public isGroupSearchable(Lcom/keepassdroid/database/PwGroup;Z)Z
    .locals 1
    .param p1, "group"    # Lcom/keepassdroid/database/PwGroup;
    .param p2, "omitBackup"    # Z

    .prologue
    .line 372
    if-eqz p1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method protected abstract loadXmlKeyFile(Ljava/io/InputStream;)[B
.end method

.method public makeFinalKey([B[BI)V
    .locals 7
    .param p1, "masterSeed"    # [B
    .param p2, "masterSeed2"    # [B
    .param p3, "numRounds"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 79
    const/4 v2, 0x0

    .line 81
    .local v2, "md":Ljava/security/MessageDigest;
    :try_start_0
    const-string v5, "SHA-256"

    invoke-static {v5}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;
    :try_end_0
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    .line 85
    new-instance v3, Lcom/keepassdroid/stream/NullOutputStream;

    invoke-direct {v3}, Lcom/keepassdroid/stream/NullOutputStream;-><init>()V

    .line 86
    .local v3, "nos":Lcom/keepassdroid/stream/NullOutputStream;
    new-instance v0, Ljava/security/DigestOutputStream;

    invoke-direct {v0, v3, v2}, Ljava/security/DigestOutputStream;-><init>(Ljava/io/OutputStream;Ljava/security/MessageDigest;)V

    .line 88
    .local v0, "dos":Ljava/security/DigestOutputStream;
    iget-object v5, p0, Lcom/keepassdroid/database/PwDatabase;->masterKey:[B

    invoke-static {p2, v5, p3}, Lcom/keepassdroid/database/PwDatabase;->transformMasterKey([B[BI)[B

    move-result-object v4

    .line 89
    .local v4, "transformedMasterKey":[B
    invoke-virtual {v0, p1}, Ljava/security/DigestOutputStream;->write([B)V

    .line 90
    invoke-virtual {v0, v4}, Ljava/security/DigestOutputStream;->write([B)V

    .line 92
    invoke-virtual {v2}, Ljava/security/MessageDigest;->digest()[B

    move-result-object v5

    iput-object v5, p0, Lcom/keepassdroid/database/PwDatabase;->finalKey:[B

    .line 93
    return-void

    .line 82
    .end local v0    # "dos":Ljava/security/DigestOutputStream;
    .end local v3    # "nos":Lcom/keepassdroid/stream/NullOutputStream;
    .end local v4    # "transformedMasterKey":[B
    :catch_0
    move-exception v1

    .line 83
    .local v1, "e":Ljava/security/NoSuchAlgorithmException;
    new-instance v5, Ljava/io/IOException;

    const-string v6, "SHA-256 not implemented here."

    invoke-direct {v5, v6}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v5
.end method

.method public abstract newGroupId()Lcom/keepassdroid/database/PwGroupId;
.end method

.method public populateGlobals(Lcom/keepassdroid/database/PwGroup;)V
    .locals 6
    .param p1, "currentGroup"    # Lcom/keepassdroid/database/PwGroup;

    .prologue
    .line 324
    iget-object v1, p1, Lcom/keepassdroid/database/PwGroup;->childGroups:Ljava/util/List;

    .line 325
    .local v1, "childGroups":Ljava/util/List;, "Ljava/util/List<Lcom/keepassdroid/database/PwGroup;>;"
    iget-object v0, p1, Lcom/keepassdroid/database/PwGroup;->childEntries:Ljava/util/List;

    .line 327
    .local v0, "childEntries":Ljava/util/List;, "Ljava/util/List<Lcom/keepassdroid/database/PwEntry;>;"
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v4

    if-ge v3, v4, :cond_0

    .line 328
    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/keepassdroid/database/PwEntry;

    .line 329
    .local v2, "cur":Lcom/keepassdroid/database/PwEntry;
    iget-object v4, p0, Lcom/keepassdroid/database/PwDatabase;->entries:Ljava/util/Map;

    invoke-virtual {v2}, Lcom/keepassdroid/database/PwEntry;->getUUID()Ljava/util/UUID;

    move-result-object v5

    invoke-interface {v4, v5, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 327
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 332
    .end local v2    # "cur":Lcom/keepassdroid/database/PwEntry;
    :cond_0
    const/4 v3, 0x0

    :goto_1
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v4

    if-ge v3, v4, :cond_1

    .line 333
    invoke-interface {v1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/keepassdroid/database/PwGroup;

    .line 334
    .local v2, "cur":Lcom/keepassdroid/database/PwGroup;
    iget-object v4, p0, Lcom/keepassdroid/database/PwDatabase;->groups:Ljava/util/Map;

    invoke-virtual {v2}, Lcom/keepassdroid/database/PwGroup;->getId()Lcom/keepassdroid/database/PwGroupId;

    move-result-object v5

    invoke-interface {v4, v5, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 335
    invoke-virtual {p0, v2}, Lcom/keepassdroid/database/PwDatabase;->populateGlobals(Lcom/keepassdroid/database/PwGroup;)V

    .line 332
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 337
    .end local v2    # "cur":Lcom/keepassdroid/database/PwGroup;
    :cond_1
    return-void
.end method

.method public recycle(Lcom/keepassdroid/database/PwEntry;)V
    .locals 2
    .param p1, "entry"    # Lcom/keepassdroid/database/PwEntry;

    .prologue
    .line 349
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "Call not valid for .kdb databases."

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public removeEntryFrom(Lcom/keepassdroid/database/PwEntry;Lcom/keepassdroid/database/PwGroup;)V
    .locals 2
    .param p1, "remove"    # Lcom/keepassdroid/database/PwEntry;
    .param p2, "parent"    # Lcom/keepassdroid/database/PwGroup;

    .prologue
    .line 290
    if-eqz p2, :cond_0

    .line 291
    iget-object v0, p2, Lcom/keepassdroid/database/PwGroup;->childEntries:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 293
    :cond_0
    iget-object v0, p0, Lcom/keepassdroid/database/PwDatabase;->entries:Ljava/util/Map;

    invoke-virtual {p1}, Lcom/keepassdroid/database/PwEntry;->getUUID()Ljava/util/UUID;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 294
    return-void
.end method

.method public removeGroupFrom(Lcom/keepassdroid/database/PwGroup;Lcom/keepassdroid/database/PwGroup;)V
    .locals 2
    .param p1, "remove"    # Lcom/keepassdroid/database/PwGroup;
    .param p2, "parent"    # Lcom/keepassdroid/database/PwGroup;

    .prologue
    .line 273
    iget-object v0, p2, Lcom/keepassdroid/database/PwGroup;->childGroups:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 275
    iget-object v0, p0, Lcom/keepassdroid/database/PwDatabase;->groups:Ljava/util/Map;

    invoke-virtual {p1}, Lcom/keepassdroid/database/PwGroup;->getId()Lcom/keepassdroid/database/PwGroupId;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 276
    return-void
.end method

.method public setMasterKey(Ljava/lang/String;Ljava/io/InputStream;)V
    .locals 1
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "keyInputStream"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/keepassdroid/database/exception/InvalidKeyFileException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 111
    sget-boolean v0, Lcom/keepassdroid/database/PwDatabase;->$assertionsDisabled:Z

    if-nez v0, :cond_0

    if-nez p1, :cond_0

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 113
    :cond_0
    invoke-virtual {p0, p1, p2}, Lcom/keepassdroid/database/PwDatabase;->getMasterKey(Ljava/lang/String;Ljava/io/InputStream;)[B

    move-result-object v0

    iput-object v0, p0, Lcom/keepassdroid/database/PwDatabase;->masterKey:[B

    .line 114
    return-void
.end method

.method public abstract setNumRounds(J)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/NumberFormatException;
        }
    .end annotation
.end method

.method public undoDeleteEntry(Lcom/keepassdroid/database/PwEntry;Lcom/keepassdroid/database/PwGroup;)V
    .locals 0
    .param p1, "entry"    # Lcom/keepassdroid/database/PwEntry;
    .param p2, "origParent"    # Lcom/keepassdroid/database/PwGroup;

    .prologue
    .line 364
    invoke-virtual {p0, p1, p2}, Lcom/keepassdroid/database/PwDatabase;->addEntryTo(Lcom/keepassdroid/database/PwEntry;Lcom/keepassdroid/database/PwGroup;)V

    .line 365
    return-void
.end method

.method public undoRecycle(Lcom/keepassdroid/database/PwEntry;Lcom/keepassdroid/database/PwGroup;)V
    .locals 2
    .param p1, "entry"    # Lcom/keepassdroid/database/PwEntry;
    .param p2, "origParent"    # Lcom/keepassdroid/database/PwGroup;

    .prologue
    .line 353
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "Call not valid for .kdb databases."

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public validatePasswordEncoding(Ljava/lang/String;)Z
    .locals 5
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    const/4 v4, 0x0

    .line 197
    invoke-virtual {p0}, Lcom/keepassdroid/database/PwDatabase;->getPasswordEncoding()Ljava/lang/String;

    move-result-object v2

    .line 201
    .local v2, "encoding":Ljava/lang/String;
    :try_start_0
    invoke-virtual {p1, v2}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    .line 209
    .local v0, "bKey":[B
    :try_start_1
    new-instance v3, Ljava/lang/String;

    invoke-direct {v3, v0, v2}, Ljava/lang/String;-><init>([BLjava/lang/String;)V
    :try_end_1
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_1 .. :try_end_1} :catch_1

    .line 214
    .local v3, "reencoded":Ljava/lang/String;
    invoke-virtual {p1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    .end local v0    # "bKey":[B
    .end local v3    # "reencoded":Ljava/lang/String;
    :goto_0
    return v4

    .line 202
    :catch_0
    move-exception v1

    .line 203
    .local v1, "e":Ljava/io/UnsupportedEncodingException;
    goto :goto_0

    .line 210
    .end local v1    # "e":Ljava/io/UnsupportedEncodingException;
    .restart local v0    # "bKey":[B
    :catch_1
    move-exception v1

    .line 211
    .restart local v1    # "e":Ljava/io/UnsupportedEncodingException;
    goto :goto_0
.end method
