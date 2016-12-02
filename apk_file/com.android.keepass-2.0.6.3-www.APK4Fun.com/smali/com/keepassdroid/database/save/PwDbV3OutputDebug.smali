.class public Lcom/keepassdroid/database/save/PwDbV3OutputDebug;
.super Lcom/keepassdroid/database/save/PwDbV3Output;
.source "PwDbV3OutputDebug.java"


# instance fields
.field debugDb:Lcom/keepassdroid/database/PwDatabaseV3Debug;

.field private noHeaderHash:Z


# direct methods
.method public constructor <init>(Lcom/keepassdroid/database/PwDatabaseV3;Ljava/io/OutputStream;)V
    .locals 1
    .param p1, "pm"    # Lcom/keepassdroid/database/PwDatabaseV3;
    .param p2, "os"    # Ljava/io/OutputStream;

    .prologue
    .line 36
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/keepassdroid/database/save/PwDbV3OutputDebug;-><init>(Lcom/keepassdroid/database/PwDatabaseV3;Ljava/io/OutputStream;Z)V

    .line 37
    return-void
.end method

.method public constructor <init>(Lcom/keepassdroid/database/PwDatabaseV3;Ljava/io/OutputStream;Z)V
    .locals 0
    .param p1, "pm"    # Lcom/keepassdroid/database/PwDatabaseV3;
    .param p2, "os"    # Ljava/io/OutputStream;
    .param p3, "noHeaderHash"    # Z

    .prologue
    .line 40
    invoke-direct {p0, p1, p2}, Lcom/keepassdroid/database/save/PwDbV3Output;-><init>(Lcom/keepassdroid/database/PwDatabaseV3;Ljava/io/OutputStream;)V

    .line 41
    check-cast p1, Lcom/keepassdroid/database/PwDatabaseV3Debug;

    .end local p1    # "pm":Lcom/keepassdroid/database/PwDatabaseV3;
    iput-object p1, p0, Lcom/keepassdroid/database/save/PwDbV3OutputDebug;->debugDb:Lcom/keepassdroid/database/PwDatabaseV3Debug;

    .line 42
    iput-boolean p3, p0, Lcom/keepassdroid/database/save/PwDbV3OutputDebug;->noHeaderHash:Z

    .line 43
    return-void
.end method


# virtual methods
.method protected setIVs(Lcom/keepassdroid/database/PwDbHeader;)Ljava/security/SecureRandom;
    .locals 6
    .param p1, "h"    # Lcom/keepassdroid/database/PwDbHeader;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/keepassdroid/database/exception/PwDbOutputException;
        }
    .end annotation

    .prologue
    const/4 v5, 0x0

    .line 47
    move-object v0, p1

    check-cast v0, Lcom/keepassdroid/database/PwDbHeaderV3;

    .line 51
    .local v0, "header":Lcom/keepassdroid/database/PwDbHeaderV3;
    iget-object v2, p0, Lcom/keepassdroid/database/save/PwDbV3OutputDebug;->debugDb:Lcom/keepassdroid/database/PwDatabaseV3Debug;

    iget-object v1, v2, Lcom/keepassdroid/database/PwDatabaseV3Debug;->dbHeader:Lcom/keepassdroid/database/PwDbHeaderV3;

    .line 52
    .local v1, "origHeader":Lcom/keepassdroid/database/PwDbHeaderV3;
    iget-object v2, v1, Lcom/keepassdroid/database/PwDbHeaderV3;->encryptionIV:[B

    iget-object v3, v0, Lcom/keepassdroid/database/PwDbHeaderV3;->encryptionIV:[B

    iget-object v4, v1, Lcom/keepassdroid/database/PwDbHeaderV3;->encryptionIV:[B

    array-length v4, v4

    invoke-static {v2, v5, v3, v5, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 53
    iget-object v2, v1, Lcom/keepassdroid/database/PwDbHeaderV3;->masterSeed:[B

    iget-object v3, v0, Lcom/keepassdroid/database/PwDbHeaderV3;->masterSeed:[B

    iget-object v4, v1, Lcom/keepassdroid/database/PwDbHeaderV3;->masterSeed:[B

    array-length v4, v4

    invoke-static {v2, v5, v3, v5, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 54
    iget-object v2, v1, Lcom/keepassdroid/database/PwDbHeaderV3;->transformSeed:[B

    iget-object v3, v0, Lcom/keepassdroid/database/PwDbHeaderV3;->transformSeed:[B

    iget-object v4, v1, Lcom/keepassdroid/database/PwDbHeaderV3;->transformSeed:[B

    array-length v4, v4

    invoke-static {v2, v5, v3, v5, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 56
    const/4 v2, 0x0

    return-object v2
.end method

.method protected useHeaderHash()Z
    .locals 1

    .prologue
    .line 61
    iget-boolean v0, p0, Lcom/keepassdroid/database/save/PwDbV3OutputDebug;->noHeaderHash:Z

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
