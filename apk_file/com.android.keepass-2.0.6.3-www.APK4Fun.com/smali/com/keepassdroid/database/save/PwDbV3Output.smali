.class public Lcom/keepassdroid/database/save/PwDbV3Output;
.super Lcom/keepassdroid/database/save/PwDbOutput;
.source "PwDbV3Output.java"


# instance fields
.field private headerHashBlock:[B

.field private mPM:Lcom/keepassdroid/database/PwDatabaseV3;


# direct methods
.method public constructor <init>(Lcom/keepassdroid/database/PwDatabaseV3;Ljava/io/OutputStream;)V
    .locals 0
    .param p1, "pm"    # Lcom/keepassdroid/database/PwDatabaseV3;
    .param p2, "os"    # Ljava/io/OutputStream;

    .prologue
    .line 57
    invoke-direct {p0, p2}, Lcom/keepassdroid/database/save/PwDbOutput;-><init>(Ljava/io/OutputStream;)V

    .line 59
    iput-object p1, p0, Lcom/keepassdroid/database/save/PwDbV3Output;->mPM:Lcom/keepassdroid/database/PwDatabaseV3;

    .line 61
    return-void
.end method

.method private getHeaderHashBuffer([B)[B
    .locals 3
    .param p1, "headerDigest"    # [B

    .prologue
    .line 258
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 260
    .local v0, "baos":Ljava/io/ByteArrayOutputStream;
    :try_start_0
    invoke-direct {p0, p1, v0}, Lcom/keepassdroid/database/save/PwDbV3Output;->writeExtData([BLjava/io/OutputStream;)V

    .line 261
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    .line 263
    :goto_0
    return-object v2

    .line 262
    :catch_0
    move-exception v1

    .line 263
    .local v1, "e":Ljava/io/IOException;
    const/4 v2, 0x0

    goto :goto_0
.end method

.method private prepForOutput()V
    .locals 0

    .prologue
    .line 112
    invoke-direct {p0}, Lcom/keepassdroid/database/save/PwDbV3Output;->sortGroupsForOutput()V

    .line 113
    return-void
.end method

.method private sortGroup(Lcom/keepassdroid/database/PwGroupV3;Ljava/util/List;)V
    .locals 2
    .param p1, "group"    # Lcom/keepassdroid/database/PwGroupV3;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/keepassdroid/database/PwGroupV3;",
            "Ljava/util/List",
            "<",
            "Lcom/keepassdroid/database/PwGroup;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 249
    .local p2, "groupList":Ljava/util/List;, "Ljava/util/List<Lcom/keepassdroid/database/PwGroup;>;"
    invoke-interface {p2, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 252
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v1, p1, Lcom/keepassdroid/database/PwGroupV3;->childGroups:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-ge v0, v1, :cond_0

    .line 253
    iget-object v1, p1, Lcom/keepassdroid/database/PwGroupV3;->childGroups:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/keepassdroid/database/PwGroupV3;

    invoke-direct {p0, v1, p2}, Lcom/keepassdroid/database/save/PwDbV3Output;->sortGroup(Lcom/keepassdroid/database/PwGroupV3;Ljava/util/List;)V

    .line 252
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 255
    :cond_0
    return-void
.end method

.method private sortGroupsForOutput()V
    .locals 4

    .prologue
    .line 236
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 239
    .local v0, "groupList":Ljava/util/List;, "Ljava/util/List<Lcom/keepassdroid/database/PwGroup;>;"
    iget-object v3, p0, Lcom/keepassdroid/database/save/PwDbV3Output;->mPM:Lcom/keepassdroid/database/PwDatabaseV3;

    invoke-virtual {v3}, Lcom/keepassdroid/database/PwDatabaseV3;->getGrpRoots()Ljava/util/List;

    move-result-object v2

    .line 240
    .local v2, "roots":Ljava/util/List;, "Ljava/util/List<Lcom/keepassdroid/database/PwGroup;>;"
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v3

    if-ge v1, v3, :cond_0

    .line 241
    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/keepassdroid/database/PwGroupV3;

    invoke-direct {p0, v3, v0}, Lcom/keepassdroid/database/save/PwDbV3Output;->sortGroup(Lcom/keepassdroid/database/PwGroupV3;Ljava/util/List;)V

    .line 240
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 244
    :cond_0
    iget-object v3, p0, Lcom/keepassdroid/database/save/PwDbV3Output;->mPM:Lcom/keepassdroid/database/PwDatabaseV3;

    invoke-virtual {v3, v0}, Lcom/keepassdroid/database/PwDatabaseV3;->setGroups(Ljava/util/List;)V

    .line 245
    return-void
.end method

.method private writeExtData([BLjava/io/OutputStream;)V
    .locals 6
    .param p1, "headerDigest"    # [B
    .param p2, "os"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 268
    new-instance v1, Lcom/keepassdroid/stream/LEDataOutputStream;

    invoke-direct {v1, p2}, Lcom/keepassdroid/stream/LEDataOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 270
    .local v1, "los":Lcom/keepassdroid/stream/LEDataOutputStream;
    const/4 v3, 0x1

    array-length v4, p1

    invoke-direct {p0, v1, v3, p1, v4}, Lcom/keepassdroid/database/save/PwDbV3Output;->writeExtDataField(Lcom/keepassdroid/stream/LEDataOutputStream;I[BI)V

    .line 271
    const/16 v3, 0x20

    new-array v0, v3, [B

    .line 272
    .local v0, "headerRandom":[B
    new-instance v2, Ljava/security/SecureRandom;

    invoke-direct {v2}, Ljava/security/SecureRandom;-><init>()V

    .line 273
    .local v2, "rand":Ljava/security/SecureRandom;
    invoke-virtual {v2, v0}, Ljava/security/SecureRandom;->nextBytes([B)V

    .line 274
    const/4 v3, 0x2

    array-length v4, v0

    invoke-direct {p0, v1, v3, v0, v4}, Lcom/keepassdroid/database/save/PwDbV3Output;->writeExtDataField(Lcom/keepassdroid/stream/LEDataOutputStream;I[BI)V

    .line 275
    const v3, 0xffff

    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-direct {p0, v1, v3, v4, v5}, Lcom/keepassdroid/database/save/PwDbV3Output;->writeExtDataField(Lcom/keepassdroid/stream/LEDataOutputStream;I[BI)V

    .line 277
    return-void
.end method

.method private writeExtDataField(Lcom/keepassdroid/stream/LEDataOutputStream;I[BI)V
    .locals 0
    .param p1, "los"    # Lcom/keepassdroid/stream/LEDataOutputStream;
    .param p2, "fieldType"    # I
    .param p3, "data"    # [B
    .param p4, "fieldSize"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 280
    invoke-virtual {p1, p2}, Lcom/keepassdroid/stream/LEDataOutputStream;->writeUShort(I)V

    .line 281
    invoke-virtual {p1, p4}, Lcom/keepassdroid/stream/LEDataOutputStream;->writeInt(I)V

    .line 282
    if-eqz p3, :cond_0

    .line 283
    invoke-virtual {p1, p3}, Lcom/keepassdroid/stream/LEDataOutputStream;->write([B)V

    .line 286
    :cond_0
    return-void
.end method


# virtual methods
.method public getFinalKey(Lcom/keepassdroid/database/PwDbHeader;)[B
    .locals 5
    .param p1, "header"    # Lcom/keepassdroid/database/PwDbHeader;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/keepassdroid/database/exception/PwDbOutputException;
        }
    .end annotation

    .prologue
    .line 65
    :try_start_0
    iget-object v1, p0, Lcom/keepassdroid/database/save/PwDbV3Output;->mPM:Lcom/keepassdroid/database/PwDatabaseV3;

    iget-object v2, p1, Lcom/keepassdroid/database/PwDbHeader;->masterSeed:[B

    iget-object v3, p1, Lcom/keepassdroid/database/PwDbHeader;->transformSeed:[B

    iget-object v4, p0, Lcom/keepassdroid/database/save/PwDbV3Output;->mPM:Lcom/keepassdroid/database/PwDatabaseV3;

    iget v4, v4, Lcom/keepassdroid/database/PwDatabaseV3;->numKeyEncRounds:I

    invoke-virtual {v1, v2, v3, v4}, Lcom/keepassdroid/database/PwDatabaseV3;->makeFinalKey([B[BI)V

    .line 66
    iget-object v1, p0, Lcom/keepassdroid/database/save/PwDbV3Output;->mPM:Lcom/keepassdroid/database/PwDatabaseV3;

    iget-object v1, v1, Lcom/keepassdroid/database/PwDatabaseV3;->finalKey:[B
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v1

    .line 67
    :catch_0
    move-exception v0

    .line 68
    .local v0, "e":Ljava/io/IOException;
    new-instance v1, Lcom/keepassdroid/database/exception/PwDbOutputException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Key creation failed: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/keepassdroid/database/exception/PwDbOutputException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public output()V
    .locals 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/keepassdroid/database/exception/PwDbOutputException;
        }
    .end annotation

    .prologue
    .line 74
    invoke-direct {p0}, Lcom/keepassdroid/database/save/PwDbV3Output;->prepForOutput()V

    .line 76
    iget-object v6, p0, Lcom/keepassdroid/database/save/PwDbV3Output;->mOS:Ljava/io/OutputStream;

    invoke-virtual {p0, v6}, Lcom/keepassdroid/database/save/PwDbV3Output;->outputHeader(Ljava/io/OutputStream;)Lcom/keepassdroid/database/PwDbHeaderV3;

    move-result-object v5

    .line 78
    .local v5, "header":Lcom/keepassdroid/database/PwDbHeader;
    invoke-virtual {p0, v5}, Lcom/keepassdroid/database/save/PwDbV3Output;->getFinalKey(Lcom/keepassdroid/database/PwDbHeader;)[B

    move-result-object v4

    .line 82
    .local v4, "finalKey":[B
    :try_start_0
    iget-object v6, p0, Lcom/keepassdroid/database/save/PwDbV3Output;->mPM:Lcom/keepassdroid/database/PwDatabaseV3;

    iget-object v6, v6, Lcom/keepassdroid/database/PwDatabaseV3;->algorithm:Lcom/keepassdroid/database/PwEncryptionAlgorithm;

    sget-object v7, Lcom/keepassdroid/database/PwEncryptionAlgorithm;->Rjindal:Lcom/keepassdroid/database/PwEncryptionAlgorithm;

    if-ne v6, v7, :cond_0

    .line 83
    const-string v6, "AES/CBC/PKCS5Padding"

    invoke-static {v6}, Lcom/keepassdroid/crypto/CipherFactory;->getInstance(Ljava/lang/String;)Ljavax/crypto/Cipher;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 94
    .local v1, "cipher":Ljavax/crypto/Cipher;
    :goto_0
    const/4 v6, 0x1

    :try_start_1
    new-instance v7, Ljavax/crypto/spec/SecretKeySpec;

    const-string v8, "AES"

    invoke-direct {v7, v4, v8}, Ljavax/crypto/spec/SecretKeySpec;-><init>([BLjava/lang/String;)V

    new-instance v8, Ljavax/crypto/spec/IvParameterSpec;

    iget-object v9, v5, Lcom/keepassdroid/database/PwDbHeader;->encryptionIV:[B

    invoke-direct {v8, v9}, Ljavax/crypto/spec/IvParameterSpec;-><init>([B)V

    invoke-virtual {v1, v6, v7, v8}, Ljavax/crypto/Cipher;->init(ILjava/security/Key;Ljava/security/spec/AlgorithmParameterSpec;)V

    .line 95
    new-instance v2, Ljavax/crypto/CipherOutputStream;

    iget-object v6, p0, Lcom/keepassdroid/database/save/PwDbV3Output;->mOS:Ljava/io/OutputStream;

    invoke-direct {v2, v6, v1}, Ljavax/crypto/CipherOutputStream;-><init>(Ljava/io/OutputStream;Ljavax/crypto/Cipher;)V

    .line 96
    .local v2, "cos":Ljavax/crypto/CipherOutputStream;
    new-instance v0, Ljava/io/BufferedOutputStream;

    invoke-direct {v0, v2}, Ljava/io/BufferedOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 97
    .local v0, "bos":Ljava/io/BufferedOutputStream;
    invoke-virtual {p0, v0}, Lcom/keepassdroid/database/save/PwDbV3Output;->outputPlanGroupAndEntries(Ljava/io/OutputStream;)V

    .line 98
    invoke-virtual {v0}, Ljava/io/BufferedOutputStream;->flush()V

    .line 99
    invoke-virtual {v0}, Ljava/io/BufferedOutputStream;->close()V
    :try_end_1
    .catch Ljava/security/InvalidKeyException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/security/InvalidAlgorithmParameterException; {:try_start_1 .. :try_end_1} :catch_2
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_3

    .line 108
    return-void

    .line 84
    .end local v0    # "bos":Ljava/io/BufferedOutputStream;
    .end local v1    # "cipher":Ljavax/crypto/Cipher;
    .end local v2    # "cos":Ljavax/crypto/CipherOutputStream;
    :cond_0
    :try_start_2
    iget-object v6, p0, Lcom/keepassdroid/database/save/PwDbV3Output;->mPM:Lcom/keepassdroid/database/PwDatabaseV3;

    iget-object v6, v6, Lcom/keepassdroid/database/PwDatabaseV3;->algorithm:Lcom/keepassdroid/database/PwEncryptionAlgorithm;

    sget-object v7, Lcom/keepassdroid/database/PwEncryptionAlgorithm;->Twofish:Lcom/keepassdroid/database/PwEncryptionAlgorithm;

    if-ne v6, v7, :cond_1

    .line 85
    const-string v6, "TWOFISH/CBC/PKCS7PADDING"

    invoke-static {v6}, Lcom/keepassdroid/crypto/CipherFactory;->getInstance(Ljava/lang/String;)Ljavax/crypto/Cipher;

    move-result-object v1

    .restart local v1    # "cipher":Ljavax/crypto/Cipher;
    goto :goto_0

    .line 87
    .end local v1    # "cipher":Ljavax/crypto/Cipher;
    :cond_1
    new-instance v6, Ljava/lang/Exception;

    invoke-direct {v6}, Ljava/lang/Exception;-><init>()V

    throw v6
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 89
    :catch_0
    move-exception v3

    .line 90
    .local v3, "e":Ljava/lang/Exception;
    new-instance v6, Lcom/keepassdroid/database/exception/PwDbOutputException;

    const-string v7, "Algorithm not supported."

    invoke-direct {v6, v7}, Lcom/keepassdroid/database/exception/PwDbOutputException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 101
    .end local v3    # "e":Ljava/lang/Exception;
    .restart local v1    # "cipher":Ljavax/crypto/Cipher;
    :catch_1
    move-exception v3

    .line 102
    .local v3, "e":Ljava/security/InvalidKeyException;
    new-instance v6, Lcom/keepassdroid/database/exception/PwDbOutputException;

    const-string v7, "Invalid key"

    invoke-direct {v6, v7}, Lcom/keepassdroid/database/exception/PwDbOutputException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 103
    .end local v3    # "e":Ljava/security/InvalidKeyException;
    :catch_2
    move-exception v3

    .line 104
    .local v3, "e":Ljava/security/InvalidAlgorithmParameterException;
    new-instance v6, Lcom/keepassdroid/database/exception/PwDbOutputException;

    const-string v7, "Invalid algorithm parameter."

    invoke-direct {v6, v7}, Lcom/keepassdroid/database/exception/PwDbOutputException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 105
    .end local v3    # "e":Ljava/security/InvalidAlgorithmParameterException;
    :catch_3
    move-exception v3

    .line 106
    .local v3, "e":Ljava/io/IOException;
    new-instance v6, Lcom/keepassdroid/database/exception/PwDbOutputException;

    const-string v7, "Failed to output final encrypted part."

    invoke-direct {v6, v7}, Lcom/keepassdroid/database/exception/PwDbOutputException;-><init>(Ljava/lang/String;)V

    throw v6
.end method

.method public bridge synthetic outputHeader(Ljava/io/OutputStream;)Lcom/keepassdroid/database/PwDbHeader;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/keepassdroid/database/exception/PwDbOutputException;
        }
    .end annotation

    .prologue
    .line 52
    invoke-virtual {p0, p1}, Lcom/keepassdroid/database/save/PwDbV3Output;->outputHeader(Ljava/io/OutputStream;)Lcom/keepassdroid/database/PwDbHeaderV3;

    move-result-object v0

    return-object v0
.end method

.method public outputHeader(Ljava/io/OutputStream;)Lcom/keepassdroid/database/PwDbHeaderV3;
    .locals 12
    .param p1, "os"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/keepassdroid/database/exception/PwDbOutputException;
        }
    .end annotation

    .prologue
    const/4 v11, 0x1

    .line 117
    new-instance v3, Lcom/keepassdroid/database/PwDbHeaderV3;

    invoke-direct {v3}, Lcom/keepassdroid/database/PwDbHeaderV3;-><init>()V

    .line 118
    .local v3, "header":Lcom/keepassdroid/database/PwDbHeaderV3;
    const v10, -0x655d26fd

    iput v10, v3, Lcom/keepassdroid/database/PwDbHeaderV3;->signature1:I

    .line 119
    const v10, -0x4ab4049b

    iput v10, v3, Lcom/keepassdroid/database/PwDbHeaderV3;->signature2:I

    .line 120
    iput v11, v3, Lcom/keepassdroid/database/PwDbHeaderV3;->flags:I

    .line 122
    iget-object v10, p0, Lcom/keepassdroid/database/save/PwDbV3Output;->mPM:Lcom/keepassdroid/database/PwDatabaseV3;

    invoke-virtual {v10}, Lcom/keepassdroid/database/PwDatabaseV3;->getEncAlgorithm()Lcom/keepassdroid/database/PwEncryptionAlgorithm;

    move-result-object v10

    sget-object v11, Lcom/keepassdroid/database/PwEncryptionAlgorithm;->Rjindal:Lcom/keepassdroid/database/PwEncryptionAlgorithm;

    if-ne v10, v11, :cond_0

    .line 123
    iget v10, v3, Lcom/keepassdroid/database/PwDbHeaderV3;->flags:I

    or-int/lit8 v10, v10, 0x2

    iput v10, v3, Lcom/keepassdroid/database/PwDbHeaderV3;->flags:I

    .line 130
    :goto_0
    const v10, 0x30003

    iput v10, v3, Lcom/keepassdroid/database/PwDbHeaderV3;->version:I

    .line 131
    iget-object v10, p0, Lcom/keepassdroid/database/save/PwDbV3Output;->mPM:Lcom/keepassdroid/database/PwDatabaseV3;

    invoke-virtual {v10}, Lcom/keepassdroid/database/PwDatabaseV3;->getGroups()Ljava/util/List;

    move-result-object v10

    invoke-interface {v10}, Ljava/util/List;->size()I

    move-result v10

    iput v10, v3, Lcom/keepassdroid/database/PwDbHeaderV3;->numGroups:I

    .line 132
    iget-object v10, p0, Lcom/keepassdroid/database/save/PwDbV3Output;->mPM:Lcom/keepassdroid/database/PwDatabaseV3;

    iget-object v10, v10, Lcom/keepassdroid/database/PwDatabaseV3;->entries:Ljava/util/List;

    invoke-interface {v10}, Ljava/util/List;->size()I

    move-result v10

    iput v10, v3, Lcom/keepassdroid/database/PwDbHeaderV3;->numEntries:I

    .line 133
    iget-object v10, p0, Lcom/keepassdroid/database/save/PwDbV3Output;->mPM:Lcom/keepassdroid/database/PwDatabaseV3;

    invoke-virtual {v10}, Lcom/keepassdroid/database/PwDatabaseV3;->getNumKeyEncRecords()I

    move-result v10

    iput v10, v3, Lcom/keepassdroid/database/PwDbHeaderV3;->numKeyEncRounds:I

    .line 135
    invoke-virtual {p0, v3}, Lcom/keepassdroid/database/save/PwDbV3Output;->setIVs(Lcom/keepassdroid/database/PwDbHeader;)Ljava/security/SecureRandom;

    .line 138
    const/4 v7, 0x0

    .line 140
    .local v7, "md":Ljava/security/MessageDigest;
    :try_start_0
    const-string v10, "SHA-256"

    invoke-static {v10}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;
    :try_end_0
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v7

    .line 148
    :try_start_1
    const-string v10, "SHA-256"

    invoke-static {v10}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;
    :try_end_1
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_1 .. :try_end_1} :catch_1

    move-result-object v4

    .line 153
    .local v4, "headerDigest":Ljava/security/MessageDigest;
    new-instance v8, Lcom/keepassdroid/stream/NullOutputStream;

    invoke-direct {v8}, Lcom/keepassdroid/stream/NullOutputStream;-><init>()V

    .line 154
    .local v8, "nos":Lcom/keepassdroid/stream/NullOutputStream;
    new-instance v5, Ljava/security/DigestOutputStream;

    invoke-direct {v5, v8, v4}, Ljava/security/DigestOutputStream;-><init>(Ljava/io/OutputStream;Ljava/security/MessageDigest;)V

    .line 157
    .local v5, "headerDos":Ljava/security/DigestOutputStream;
    new-instance v9, Lcom/keepassdroid/database/save/PwDbHeaderOutputV3;

    invoke-direct {v9, v3, v5}, Lcom/keepassdroid/database/save/PwDbHeaderOutputV3;-><init>(Lcom/keepassdroid/database/PwDbHeaderV3;Ljava/io/OutputStream;)V

    .line 159
    .local v9, "pho":Lcom/keepassdroid/database/save/PwDbHeaderOutputV3;
    :try_start_2
    invoke-virtual {v9}, Lcom/keepassdroid/database/save/PwDbHeaderOutputV3;->outputStart()V

    .line 160
    invoke-virtual {v9}, Lcom/keepassdroid/database/save/PwDbHeaderOutputV3;->outputEnd()V

    .line 161
    invoke-virtual {v5}, Ljava/security/DigestOutputStream;->flush()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_2

    .line 165
    invoke-virtual {v4}, Ljava/security/MessageDigest;->digest()[B

    move-result-object v6

    .line 166
    .local v6, "headerHash":[B
    invoke-direct {p0, v6}, Lcom/keepassdroid/database/save/PwDbV3Output;->getHeaderHashBuffer([B)[B

    move-result-object v10

    iput-object v10, p0, Lcom/keepassdroid/database/save/PwDbV3Output;->headerHashBlock:[B

    .line 169
    new-instance v8, Lcom/keepassdroid/stream/NullOutputStream;

    .end local v8    # "nos":Lcom/keepassdroid/stream/NullOutputStream;
    invoke-direct {v8}, Lcom/keepassdroid/stream/NullOutputStream;-><init>()V

    .line 170
    .restart local v8    # "nos":Lcom/keepassdroid/stream/NullOutputStream;
    new-instance v1, Ljava/security/DigestOutputStream;

    invoke-direct {v1, v8, v7}, Ljava/security/DigestOutputStream;-><init>(Ljava/io/OutputStream;Ljava/security/MessageDigest;)V

    .line 171
    .local v1, "dos":Ljava/security/DigestOutputStream;
    new-instance v0, Ljava/io/BufferedOutputStream;

    invoke-direct {v0, v1}, Ljava/io/BufferedOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 173
    .local v0, "bos":Ljava/io/BufferedOutputStream;
    :try_start_3
    invoke-virtual {p0, v0}, Lcom/keepassdroid/database/save/PwDbV3Output;->outputPlanGroupAndEntries(Ljava/io/OutputStream;)V

    .line 174
    invoke-virtual {v0}, Ljava/io/BufferedOutputStream;->flush()V

    .line 175
    invoke-virtual {v0}, Ljava/io/BufferedOutputStream;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_3

    .line 180
    invoke-virtual {v7}, Ljava/security/MessageDigest;->digest()[B

    move-result-object v10

    iput-object v10, v3, Lcom/keepassdroid/database/PwDbHeaderV3;->contentsHash:[B

    .line 183
    new-instance v9, Lcom/keepassdroid/database/save/PwDbHeaderOutputV3;

    .end local v9    # "pho":Lcom/keepassdroid/database/save/PwDbHeaderOutputV3;
    invoke-direct {v9, v3, p1}, Lcom/keepassdroid/database/save/PwDbHeaderOutputV3;-><init>(Lcom/keepassdroid/database/PwDbHeaderV3;Ljava/io/OutputStream;)V

    .line 185
    .restart local v9    # "pho":Lcom/keepassdroid/database/save/PwDbHeaderOutputV3;
    :try_start_4
    invoke-virtual {v9}, Lcom/keepassdroid/database/save/PwDbHeaderOutputV3;->outputStart()V

    .line 186
    const/4 v10, 0x0

    invoke-virtual {v1, v10}, Ljava/security/DigestOutputStream;->on(Z)V

    .line 187
    invoke-virtual {v9}, Lcom/keepassdroid/database/save/PwDbHeaderOutputV3;->outputContentHash()V

    .line 188
    const/4 v10, 0x1

    invoke-virtual {v1, v10}, Ljava/security/DigestOutputStream;->on(Z)V

    .line 189
    invoke-virtual {v9}, Lcom/keepassdroid/database/save/PwDbHeaderOutputV3;->outputEnd()V

    .line 190
    invoke-virtual {v1}, Ljava/security/DigestOutputStream;->flush()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_4

    .line 195
    return-object v3

    .line 124
    .end local v0    # "bos":Ljava/io/BufferedOutputStream;
    .end local v1    # "dos":Ljava/security/DigestOutputStream;
    .end local v4    # "headerDigest":Ljava/security/MessageDigest;
    .end local v5    # "headerDos":Ljava/security/DigestOutputStream;
    .end local v6    # "headerHash":[B
    .end local v7    # "md":Ljava/security/MessageDigest;
    .end local v8    # "nos":Lcom/keepassdroid/stream/NullOutputStream;
    .end local v9    # "pho":Lcom/keepassdroid/database/save/PwDbHeaderOutputV3;
    :cond_0
    iget-object v10, p0, Lcom/keepassdroid/database/save/PwDbV3Output;->mPM:Lcom/keepassdroid/database/PwDatabaseV3;

    invoke-virtual {v10}, Lcom/keepassdroid/database/PwDatabaseV3;->getEncAlgorithm()Lcom/keepassdroid/database/PwEncryptionAlgorithm;

    move-result-object v10

    sget-object v11, Lcom/keepassdroid/database/PwEncryptionAlgorithm;->Twofish:Lcom/keepassdroid/database/PwEncryptionAlgorithm;

    if-ne v10, v11, :cond_1

    .line 125
    iget v10, v3, Lcom/keepassdroid/database/PwDbHeaderV3;->flags:I

    or-int/lit8 v10, v10, 0x8

    iput v10, v3, Lcom/keepassdroid/database/PwDbHeaderV3;->flags:I

    goto/16 :goto_0

    .line 127
    :cond_1
    new-instance v10, Lcom/keepassdroid/database/exception/PwDbOutputException;

    const-string v11, "Unsupported algorithm."

    invoke-direct {v10, v11}, Lcom/keepassdroid/database/exception/PwDbOutputException;-><init>(Ljava/lang/String;)V

    throw v10

    .line 141
    .restart local v7    # "md":Ljava/security/MessageDigest;
    :catch_0
    move-exception v2

    .line 142
    .local v2, "e":Ljava/security/NoSuchAlgorithmException;
    new-instance v10, Lcom/keepassdroid/database/exception/PwDbOutputException;

    const-string v11, "SHA-256 not implemented here."

    invoke-direct {v10, v11}, Lcom/keepassdroid/database/exception/PwDbOutputException;-><init>(Ljava/lang/String;)V

    throw v10

    .line 149
    .end local v2    # "e":Ljava/security/NoSuchAlgorithmException;
    :catch_1
    move-exception v2

    .line 150
    .restart local v2    # "e":Ljava/security/NoSuchAlgorithmException;
    new-instance v10, Lcom/keepassdroid/database/exception/PwDbOutputException;

    const-string v11, "SHA-256 not implemented here."

    invoke-direct {v10, v11}, Lcom/keepassdroid/database/exception/PwDbOutputException;-><init>(Ljava/lang/String;)V

    throw v10

    .line 162
    .end local v2    # "e":Ljava/security/NoSuchAlgorithmException;
    .restart local v4    # "headerDigest":Ljava/security/MessageDigest;
    .restart local v5    # "headerDos":Ljava/security/DigestOutputStream;
    .restart local v8    # "nos":Lcom/keepassdroid/stream/NullOutputStream;
    .restart local v9    # "pho":Lcom/keepassdroid/database/save/PwDbHeaderOutputV3;
    :catch_2
    move-exception v2

    .line 163
    .local v2, "e":Ljava/io/IOException;
    new-instance v10, Lcom/keepassdroid/database/exception/PwDbOutputException;

    invoke-direct {v10, v2}, Lcom/keepassdroid/database/exception/PwDbOutputException;-><init>(Ljava/lang/Exception;)V

    throw v10

    .line 176
    .end local v2    # "e":Ljava/io/IOException;
    .restart local v0    # "bos":Ljava/io/BufferedOutputStream;
    .restart local v1    # "dos":Ljava/security/DigestOutputStream;
    .restart local v6    # "headerHash":[B
    :catch_3
    move-exception v2

    .line 177
    .restart local v2    # "e":Ljava/io/IOException;
    new-instance v10, Lcom/keepassdroid/database/exception/PwDbOutputException;

    const-string v11, "Failed to generate checksum."

    invoke-direct {v10, v11}, Lcom/keepassdroid/database/exception/PwDbOutputException;-><init>(Ljava/lang/String;)V

    throw v10

    .line 191
    .end local v2    # "e":Ljava/io/IOException;
    :catch_4
    move-exception v2

    .line 192
    .restart local v2    # "e":Ljava/io/IOException;
    new-instance v10, Lcom/keepassdroid/database/exception/PwDbOutputException;

    invoke-direct {v10, v2}, Lcom/keepassdroid/database/exception/PwDbOutputException;-><init>(Ljava/lang/Exception;)V

    throw v10
.end method

.method public outputPlanGroupAndEntries(Ljava/io/OutputStream;)V
    .locals 11
    .param p1, "os"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/keepassdroid/database/exception/PwDbOutputException;
        }
    .end annotation

    .prologue
    .line 199
    new-instance v3, Lcom/keepassdroid/stream/LEDataOutputStream;

    invoke-direct {v3, p1}, Lcom/keepassdroid/stream/LEDataOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 201
    .local v3, "los":Lcom/keepassdroid/stream/LEDataOutputStream;
    invoke-virtual {p0}, Lcom/keepassdroid/database/save/PwDbV3Output;->useHeaderHash()Z

    move-result v8

    if-eqz v8, :cond_0

    iget-object v8, p0, Lcom/keepassdroid/database/save/PwDbV3Output;->headerHashBlock:[B

    if-eqz v8, :cond_0

    .line 203
    const/4 v8, 0x0

    :try_start_0
    invoke-virtual {v3, v8}, Lcom/keepassdroid/stream/LEDataOutputStream;->writeUShort(I)V

    .line 204
    iget-object v8, p0, Lcom/keepassdroid/database/save/PwDbV3Output;->headerHashBlock:[B

    array-length v8, v8

    invoke-virtual {v3, v8}, Lcom/keepassdroid/stream/LEDataOutputStream;->writeInt(I)V

    .line 205
    iget-object v8, p0, Lcom/keepassdroid/database/save/PwDbV3Output;->headerHashBlock:[B

    invoke-virtual {v3, v8}, Lcom/keepassdroid/stream/LEDataOutputStream;->write([B)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 212
    :cond_0
    iget-object v8, p0, Lcom/keepassdroid/database/save/PwDbV3Output;->mPM:Lcom/keepassdroid/database/PwDatabaseV3;

    invoke-virtual {v8}, Lcom/keepassdroid/database/PwDatabaseV3;->getGroups()Ljava/util/List;

    move-result-object v1

    .line 213
    .local v1, "groups":Ljava/util/List;, "Ljava/util/List<Lcom/keepassdroid/database/PwGroup;>;"
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v8

    if-ge v2, v8, :cond_1

    .line 214
    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/keepassdroid/database/PwGroupV3;

    .line 215
    .local v6, "pg":Lcom/keepassdroid/database/PwGroupV3;
    new-instance v7, Lcom/keepassdroid/database/save/PwGroupOutputV3;

    invoke-direct {v7, v6, p1}, Lcom/keepassdroid/database/save/PwGroupOutputV3;-><init>(Lcom/keepassdroid/database/PwGroupV3;Ljava/io/OutputStream;)V

    .line 217
    .local v7, "pgo":Lcom/keepassdroid/database/save/PwGroupOutputV3;
    :try_start_1
    invoke-virtual {v7}, Lcom/keepassdroid/database/save/PwGroupOutputV3;->output()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    .line 213
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 206
    .end local v1    # "groups":Ljava/util/List;, "Ljava/util/List<Lcom/keepassdroid/database/PwGroup;>;"
    .end local v2    # "i":I
    .end local v6    # "pg":Lcom/keepassdroid/database/PwGroupV3;
    .end local v7    # "pgo":Lcom/keepassdroid/database/save/PwGroupOutputV3;
    :catch_0
    move-exception v0

    .line 207
    .local v0, "e":Ljava/io/IOException;
    new-instance v8, Lcom/keepassdroid/database/exception/PwDbOutputException;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "Failed to output header hash: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-direct {v8, v9}, Lcom/keepassdroid/database/exception/PwDbOutputException;-><init>(Ljava/lang/String;)V

    throw v8

    .line 218
    .end local v0    # "e":Ljava/io/IOException;
    .restart local v1    # "groups":Ljava/util/List;, "Ljava/util/List<Lcom/keepassdroid/database/PwGroup;>;"
    .restart local v2    # "i":I
    .restart local v6    # "pg":Lcom/keepassdroid/database/PwGroupV3;
    .restart local v7    # "pgo":Lcom/keepassdroid/database/save/PwGroupOutputV3;
    :catch_1
    move-exception v0

    .line 219
    .restart local v0    # "e":Ljava/io/IOException;
    new-instance v8, Lcom/keepassdroid/database/exception/PwDbOutputException;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "Failed to output a group: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-direct {v8, v9}, Lcom/keepassdroid/database/exception/PwDbOutputException;-><init>(Ljava/lang/String;)V

    throw v8

    .line 224
    .end local v0    # "e":Ljava/io/IOException;
    .end local v6    # "pg":Lcom/keepassdroid/database/PwGroupV3;
    .end local v7    # "pgo":Lcom/keepassdroid/database/save/PwGroupOutputV3;
    :cond_1
    const/4 v2, 0x0

    :goto_1
    iget-object v8, p0, Lcom/keepassdroid/database/save/PwDbV3Output;->mPM:Lcom/keepassdroid/database/PwDatabaseV3;

    iget-object v8, v8, Lcom/keepassdroid/database/PwDatabaseV3;->entries:Ljava/util/List;

    invoke-interface {v8}, Ljava/util/List;->size()I

    move-result v8

    if-ge v2, v8, :cond_2

    .line 225
    iget-object v8, p0, Lcom/keepassdroid/database/save/PwDbV3Output;->mPM:Lcom/keepassdroid/database/PwDatabaseV3;

    iget-object v8, v8, Lcom/keepassdroid/database/PwDatabaseV3;->entries:Ljava/util/List;

    invoke-interface {v8, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/keepassdroid/database/PwEntryV3;

    .line 226
    .local v4, "pe":Lcom/keepassdroid/database/PwEntryV3;
    new-instance v5, Lcom/keepassdroid/database/save/PwEntryOutputV3;

    invoke-direct {v5, v4, p1}, Lcom/keepassdroid/database/save/PwEntryOutputV3;-><init>(Lcom/keepassdroid/database/PwEntryV3;Ljava/io/OutputStream;)V

    .line 228
    .local v5, "peo":Lcom/keepassdroid/database/save/PwEntryOutputV3;
    :try_start_2
    invoke-virtual {v5}, Lcom/keepassdroid/database/save/PwEntryOutputV3;->output()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_2

    .line 224
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 229
    :catch_2
    move-exception v0

    .line 230
    .restart local v0    # "e":Ljava/io/IOException;
    new-instance v8, Lcom/keepassdroid/database/exception/PwDbOutputException;

    const-string v9, "Failed to output an entry."

    invoke-direct {v8, v9}, Lcom/keepassdroid/database/exception/PwDbOutputException;-><init>(Ljava/lang/String;)V

    throw v8

    .line 233
    .end local v0    # "e":Ljava/io/IOException;
    .end local v4    # "pe":Lcom/keepassdroid/database/PwEntryV3;
    .end local v5    # "peo":Lcom/keepassdroid/database/save/PwEntryOutputV3;
    :cond_2
    return-void
.end method

.method protected useHeaderHash()Z
    .locals 1

    .prologue
    .line 289
    const/4 v0, 0x1

    return v0
.end method
