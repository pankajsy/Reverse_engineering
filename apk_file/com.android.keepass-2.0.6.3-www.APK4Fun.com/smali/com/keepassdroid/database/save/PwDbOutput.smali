.class public abstract Lcom/keepassdroid/database/save/PwDbOutput;
.super Ljava/lang/Object;
.source "PwDbOutput.java"


# instance fields
.field protected mOS:Ljava/io/OutputStream;


# direct methods
.method protected constructor <init>(Ljava/io/OutputStream;)V
    .locals 0
    .param p1, "os"    # Ljava/io/OutputStream;

    .prologue
    .line 46
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 47
    iput-object p1, p0, Lcom/keepassdroid/database/save/PwDbOutput;->mOS:Ljava/io/OutputStream;

    .line 48
    return-void
.end method

.method public static getInstance(Lcom/keepassdroid/database/PwDatabase;Ljava/io/OutputStream;)Lcom/keepassdroid/database/save/PwDbOutput;
    .locals 1
    .param p0, "pm"    # Lcom/keepassdroid/database/PwDatabase;
    .param p1, "os"    # Ljava/io/OutputStream;

    .prologue
    .line 37
    instance-of v0, p0, Lcom/keepassdroid/database/PwDatabaseV3;

    if-eqz v0, :cond_0

    .line 38
    new-instance v0, Lcom/keepassdroid/database/save/PwDbV3Output;

    check-cast p0, Lcom/keepassdroid/database/PwDatabaseV3;

    .end local p0    # "pm":Lcom/keepassdroid/database/PwDatabase;
    invoke-direct {v0, p0, p1}, Lcom/keepassdroid/database/save/PwDbV3Output;-><init>(Lcom/keepassdroid/database/PwDatabaseV3;Ljava/io/OutputStream;)V

    .line 43
    :goto_0
    return-object v0

    .line 39
    .restart local p0    # "pm":Lcom/keepassdroid/database/PwDatabase;
    :cond_0
    instance-of v0, p0, Lcom/keepassdroid/database/PwDatabaseV4;

    if-eqz v0, :cond_1

    .line 40
    new-instance v0, Lcom/keepassdroid/database/save/PwDbV4Output;

    check-cast p0, Lcom/keepassdroid/database/PwDatabaseV4;

    .end local p0    # "pm":Lcom/keepassdroid/database/PwDatabase;
    invoke-direct {v0, p0, p1}, Lcom/keepassdroid/database/save/PwDbV4Output;-><init>(Lcom/keepassdroid/database/PwDatabaseV4;Ljava/io/OutputStream;)V

    goto :goto_0

    .line 43
    .restart local p0    # "pm":Lcom/keepassdroid/database/PwDatabase;
    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method


# virtual methods
.method public abstract output()V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/keepassdroid/database/exception/PwDbOutputException;
        }
    .end annotation
.end method

.method public abstract outputHeader(Ljava/io/OutputStream;)Lcom/keepassdroid/database/PwDbHeader;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/keepassdroid/database/exception/PwDbOutputException;
        }
    .end annotation
.end method

.method protected setIVs(Lcom/keepassdroid/database/PwDbHeader;)Ljava/security/SecureRandom;
    .locals 4
    .param p1, "header"    # Lcom/keepassdroid/database/PwDbHeader;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/keepassdroid/database/exception/PwDbOutputException;
        }
    .end annotation

    .prologue
    .line 53
    :try_start_0
    const-string v2, "SHA1PRNG"

    invoke-static {v2}, Ljava/security/SecureRandom;->getInstance(Ljava/lang/String;)Ljava/security/SecureRandom;
    :try_end_0
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 57
    .local v1, "random":Ljava/security/SecureRandom;
    iget-object v2, p1, Lcom/keepassdroid/database/PwDbHeader;->encryptionIV:[B

    invoke-virtual {v1, v2}, Ljava/security/SecureRandom;->nextBytes([B)V

    .line 58
    iget-object v2, p1, Lcom/keepassdroid/database/PwDbHeader;->masterSeed:[B

    invoke-virtual {v1, v2}, Ljava/security/SecureRandom;->nextBytes([B)V

    .line 59
    iget-object v2, p1, Lcom/keepassdroid/database/PwDbHeader;->transformSeed:[B

    invoke-virtual {v1, v2}, Ljava/security/SecureRandom;->nextBytes([B)V

    .line 61
    return-object v1

    .line 54
    .end local v1    # "random":Ljava/security/SecureRandom;
    :catch_0
    move-exception v0

    .line 55
    .local v0, "e":Ljava/security/NoSuchAlgorithmException;
    new-instance v2, Lcom/keepassdroid/database/exception/PwDbOutputException;

    const-string v3, "Does not support secure random number generation."

    invoke-direct {v2, v3}, Lcom/keepassdroid/database/exception/PwDbOutputException;-><init>(Ljava/lang/String;)V

    throw v2
.end method
