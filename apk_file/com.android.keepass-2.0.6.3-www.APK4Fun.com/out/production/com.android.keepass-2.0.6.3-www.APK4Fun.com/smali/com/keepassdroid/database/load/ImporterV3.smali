.class public Lcom/keepassdroid/database/load/ImporterV3;
.super Lcom/keepassdroid/database/load/Importer;
.source "ImporterV3.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 98
    invoke-direct {p0}, Lcom/keepassdroid/database/load/Importer;-><init>()V

    .line 99
    return-void
.end method

.method public static bsw32([BI)V
    .locals 3
    .param p0, "ary"    # [B
    .param p1, "offset"    # I

    .prologue
    .line 321
    aget-byte v0, p0, p1

    .line 322
    .local v0, "t":B
    add-int/lit8 v1, p1, 0x3

    aget-byte v1, p0, v1

    aput-byte v1, p0, p1

    .line 323
    add-int/lit8 v1, p1, 0x3

    aput-byte v0, p0, v1

    .line 324
    add-int/lit8 v1, p1, 0x1

    aget-byte v0, p0, v1

    .line 325
    add-int/lit8 v1, p1, 0x1

    add-int/lit8 v2, p1, 0x2

    aget-byte v2, p0, v2

    aput-byte v2, p0, v1

    .line 326
    add-int/lit8 v1, p1, 0x2

    aput-byte v0, p0, v1

    .line 327
    return-void
.end method

.method public static makePad([B)[B
    .locals 6
    .param p0, "data"    # [B

    .prologue
    .line 298
    array-length v4, p0

    rem-int/lit8 v4, v4, 0x20

    rsub-int/lit8 v3, v4, 0x20

    .line 299
    .local v3, "thisblk":I
    const/4 v1, 0x0

    .line 301
    .local v1, "nextblk":I
    const/16 v4, 0x9

    if-ge v3, v4, :cond_0

    .line 302
    const/16 v1, 0x20

    .line 306
    :cond_0
    add-int v4, v3, v1

    new-array v2, v4, [B

    .line 307
    .local v2, "pad":[B
    const/4 v4, 0x0

    const/16 v5, -0x80

    aput-byte v5, v2, v4

    .line 310
    add-int v4, v3, v1

    add-int/lit8 v0, v4, -0x8

    .line 311
    .local v0, "ix":I
    array-length v4, p0

    shr-int/lit8 v4, v4, 0x1d

    invoke-static {v4, v2, v0}, Lcom/keepassdroid/stream/LEDataOutputStream;->writeInt(I[BI)V

    .line 312
    invoke-static {v2, v0}, Lcom/keepassdroid/database/load/ImporterV3;->bsw32([BI)V

    .line 313
    add-int/lit8 v0, v0, 0x4

    .line 314
    array-length v4, p0

    shl-int/lit8 v4, v4, 0x3

    invoke-static {v4, v2, v0}, Lcom/keepassdroid/stream/LEDataOutputStream;->writeInt(I[BI)V

    .line 315
    invoke-static {v2, v0}, Lcom/keepassdroid/database/load/ImporterV3;->bsw32([BI)V

    .line 317
    return-object v2
.end method


# virtual methods
.method protected createDB()Lcom/keepassdroid/database/PwDatabaseV3;
    .locals 1

    .prologue
    .line 102
    new-instance v0, Lcom/keepassdroid/database/PwDatabaseV3;

    invoke-direct {v0}, Lcom/keepassdroid/database/PwDatabaseV3;-><init>()V

    return-object v0
.end method

.method public bridge synthetic openDatabase(Ljava/io/InputStream;Ljava/lang/String;Ljava/io/InputStream;)Lcom/keepassdroid/database/PwDatabase;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/keepassdroid/database/exception/InvalidDBException;
        }
    .end annotation

    .prologue
    .line 95
    invoke-virtual {p0, p1, p2, p3}, Lcom/keepassdroid/database/load/ImporterV3;->openDatabase(Ljava/io/InputStream;Ljava/lang/String;Ljava/io/InputStream;)Lcom/keepassdroid/database/PwDatabaseV3;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic openDatabase(Ljava/io/InputStream;Ljava/lang/String;Ljava/io/InputStream;Lcom/keepassdroid/UpdateStatus;)Lcom/keepassdroid/database/PwDatabase;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/keepassdroid/database/exception/InvalidDBException;
        }
    .end annotation

    .prologue
    .line 95
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/keepassdroid/database/load/ImporterV3;->openDatabase(Ljava/io/InputStream;Ljava/lang/String;Ljava/io/InputStream;Lcom/keepassdroid/UpdateStatus;)Lcom/keepassdroid/database/PwDatabaseV3;

    move-result-object v0

    return-object v0
.end method

.method public openDatabase(Ljava/io/InputStream;Ljava/lang/String;Ljava/io/InputStream;)Lcom/keepassdroid/database/PwDatabaseV3;
    .locals 1
    .param p1, "inStream"    # Ljava/io/InputStream;
    .param p2, "password"    # Ljava/lang/String;
    .param p3, "kfIs"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/keepassdroid/database/exception/InvalidDBException;
        }
    .end annotation

    .prologue
    .line 128
    new-instance v0, Lcom/keepassdroid/UpdateStatus;

    invoke-direct {v0}, Lcom/keepassdroid/UpdateStatus;-><init>()V

    invoke-virtual {p0, p1, p2, p3, v0}, Lcom/keepassdroid/database/load/ImporterV3;->openDatabase(Ljava/io/InputStream;Ljava/lang/String;Ljava/io/InputStream;Lcom/keepassdroid/UpdateStatus;)Lcom/keepassdroid/database/PwDatabaseV3;

    move-result-object v0

    return-object v0
.end method

.method public openDatabase(Ljava/io/InputStream;Ljava/lang/String;Ljava/io/InputStream;Lcom/keepassdroid/UpdateStatus;)Lcom/keepassdroid/database/PwDatabaseV3;
    .locals 25
    .param p1, "inStream"    # Ljava/io/InputStream;
    .param p2, "password"    # Ljava/lang/String;
    .param p3, "kfIs"    # Ljava/io/InputStream;
    .param p4, "status"    # Lcom/keepassdroid/UpdateStatus;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/keepassdroid/database/exception/InvalidDBException;
        }
    .end annotation

    .prologue
    .line 138
    invoke-virtual/range {p1 .. p1}, Ljava/io/InputStream;->available()I

    move-result v16

    .line 139
    .local v16, "fileSize":I
    add-int/lit8 v5, v16, 0x10

    new-array v4, v5, [B

    .line 140
    .local v4, "filebuf":[B
    const/4 v5, 0x0

    move-object/from16 v0, p1

    move/from16 v1, v16

    invoke-virtual {v0, v4, v5, v1}, Ljava/io/InputStream;->read([BII)I

    .line 141
    invoke-virtual/range {p1 .. p1}, Ljava/io/InputStream;->close()V

    .line 144
    const/16 v5, 0x7c

    move/from16 v0, v16

    if-ge v0, v5, :cond_0

    .line 145
    new-instance v5, Ljava/io/IOException;

    const-string v6, "File too short for header"

    invoke-direct {v5, v6}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 146
    :cond_0
    new-instance v18, Lcom/keepassdroid/database/PwDbHeaderV3;

    invoke-direct/range {v18 .. v18}, Lcom/keepassdroid/database/PwDbHeaderV3;-><init>()V

    .line 147
    .local v18, "hdr":Lcom/keepassdroid/database/PwDbHeaderV3;
    const/4 v5, 0x0

    move-object/from16 v0, v18

    invoke-virtual {v0, v4, v5}, Lcom/keepassdroid/database/PwDbHeaderV3;->loadFromFile([BI)V

    .line 149
    move-object/from16 v0, v18

    iget v5, v0, Lcom/keepassdroid/database/PwDbHeaderV3;->signature1:I

    const v6, -0x655d26fd

    if-ne v5, v6, :cond_1

    move-object/from16 v0, v18

    iget v5, v0, Lcom/keepassdroid/database/PwDbHeaderV3;->signature2:I

    const v6, -0x4ab4049b

    if-eq v5, v6, :cond_2

    .line 150
    :cond_1
    new-instance v5, Lcom/keepassdroid/database/exception/InvalidDBSignatureException;

    invoke-direct {v5}, Lcom/keepassdroid/database/exception/InvalidDBSignatureException;-><init>()V

    throw v5

    .line 153
    :cond_2
    invoke-virtual/range {v18 .. v18}, Lcom/keepassdroid/database/PwDbHeaderV3;->matchesVersion()Z

    move-result v5

    if-nez v5, :cond_3

    .line 154
    new-instance v5, Lcom/keepassdroid/database/exception/InvalidDBVersionException;

    invoke-direct {v5}, Lcom/keepassdroid/database/exception/InvalidDBVersionException;-><init>()V

    throw v5

    .line 157
    :cond_3
    const v5, 0x7f06001b

    move-object/from16 v0, p4

    invoke-virtual {v0, v5}, Lcom/keepassdroid/UpdateStatus;->updateMessage(I)V

    .line 158
    invoke-virtual/range {p0 .. p0}, Lcom/keepassdroid/database/load/ImporterV3;->createDB()Lcom/keepassdroid/database/PwDatabaseV3;

    move-result-object v22

    .line 159
    .local v22, "newManager":Lcom/keepassdroid/database/PwDatabaseV3;
    move-object/from16 v0, v22

    move-object/from16 v1, p2

    move-object/from16 v2, p3

    invoke-virtual {v0, v1, v2}, Lcom/keepassdroid/database/PwDatabaseV3;->setMasterKey(Ljava/lang/String;Ljava/io/InputStream;)V

    .line 162
    move-object/from16 v0, v18

    iget v5, v0, Lcom/keepassdroid/database/PwDbHeaderV3;->flags:I

    and-int/lit8 v5, v5, 0x2

    if-eqz v5, :cond_4

    .line 163
    sget-object v5, Lcom/keepassdroid/database/PwEncryptionAlgorithm;->Rjindal:Lcom/keepassdroid/database/PwEncryptionAlgorithm;

    move-object/from16 v0, v22

    iput-object v5, v0, Lcom/keepassdroid/database/PwDatabaseV3;->algorithm:Lcom/keepassdroid/database/PwEncryptionAlgorithm;

    .line 171
    :goto_0
    move-object/from16 v0, v22

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Lcom/keepassdroid/database/PwDatabaseV3;->copyHeader(Lcom/keepassdroid/database/PwDbHeaderV3;)V

    .line 173
    move-object/from16 v0, v18

    iget v5, v0, Lcom/keepassdroid/database/PwDbHeaderV3;->numKeyEncRounds:I

    move-object/from16 v0, v22

    iput v5, v0, Lcom/keepassdroid/database/PwDatabaseV3;->numKeyEncRounds:I

    .line 175
    const-string v5, "KeePass Password Manager"

    move-object/from16 v0, v22

    iput-object v5, v0, Lcom/keepassdroid/database/PwDatabaseV3;->name:Ljava/lang/String;

    .line 178
    move-object/from16 v0, v18

    iget-object v5, v0, Lcom/keepassdroid/database/PwDbHeaderV3;->masterSeed:[B

    move-object/from16 v0, v18

    iget-object v6, v0, Lcom/keepassdroid/database/PwDbHeaderV3;->transformSeed:[B

    move-object/from16 v0, v22

    iget v9, v0, Lcom/keepassdroid/database/PwDatabaseV3;->numKeyEncRounds:I

    move-object/from16 v0, v22

    invoke-virtual {v0, v5, v6, v9}, Lcom/keepassdroid/database/PwDatabaseV3;->makeFinalKey([B[BI)V

    .line 180
    const v5, 0x7f06001f

    move-object/from16 v0, p4

    invoke-virtual {v0, v5}, Lcom/keepassdroid/UpdateStatus;->updateMessage(I)V

    .line 184
    :try_start_0
    move-object/from16 v0, v22

    iget-object v5, v0, Lcom/keepassdroid/database/PwDatabaseV3;->algorithm:Lcom/keepassdroid/database/PwEncryptionAlgorithm;

    sget-object v6, Lcom/keepassdroid/database/PwEncryptionAlgorithm;->Rjindal:Lcom/keepassdroid/database/PwEncryptionAlgorithm;

    if-ne v5, v6, :cond_6

    .line 185
    const-string v5, "AES/CBC/PKCS5Padding"

    invoke-static {v5}, Lcom/keepassdroid/crypto/CipherFactory;->getInstance(Ljava/lang/String;)Ljavax/crypto/Cipher;
    :try_end_0
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljavax/crypto/NoSuchPaddingException; {:try_start_0 .. :try_end_0} :catch_1

    move-result-object v3

    .line 199
    .local v3, "cipher":Ljavax/crypto/Cipher;
    :goto_1
    const/4 v5, 0x2

    :try_start_1
    new-instance v6, Ljavax/crypto/spec/SecretKeySpec;

    move-object/from16 v0, v22

    iget-object v9, v0, Lcom/keepassdroid/database/PwDatabaseV3;->finalKey:[B

    const-string v24, "AES"

    move-object/from16 v0, v24

    invoke-direct {v6, v9, v0}, Ljavax/crypto/spec/SecretKeySpec;-><init>([BLjava/lang/String;)V

    new-instance v9, Ljavax/crypto/spec/IvParameterSpec;

    move-object/from16 v0, v18

    iget-object v0, v0, Lcom/keepassdroid/database/PwDbHeaderV3;->encryptionIV:[B

    move-object/from16 v24, v0

    move-object/from16 v0, v24

    invoke-direct {v9, v0}, Ljavax/crypto/spec/IvParameterSpec;-><init>([B)V

    invoke-virtual {v3, v5, v6, v9}, Ljavax/crypto/Cipher;->init(ILjava/security/Key;Ljava/security/spec/AlgorithmParameterSpec;)V
    :try_end_1
    .catch Ljava/security/InvalidKeyException; {:try_start_1 .. :try_end_1} :catch_2
    .catch Ljava/security/InvalidAlgorithmParameterException; {:try_start_1 .. :try_end_1} :catch_3

    .line 209
    const/16 v5, 0x7c

    add-int/lit8 v6, v16, -0x7c

    const/16 v8, 0x7c

    move-object v7, v4

    :try_start_2
    invoke-virtual/range {v3 .. v8}, Ljavax/crypto/Cipher;->doFinal([BII[BI)I
    :try_end_2
    .catch Ljavax/crypto/ShortBufferException; {:try_start_2 .. :try_end_2} :catch_4
    .catch Ljavax/crypto/IllegalBlockSizeException; {:try_start_2 .. :try_end_2} :catch_5
    .catch Ljavax/crypto/BadPaddingException; {:try_start_2 .. :try_end_2} :catch_6

    move-result v14

    .line 219
    .local v14, "encryptedPartSize":I
    const/16 v5, 0x7c

    move-object/from16 v0, v22

    invoke-virtual {v0, v4, v5, v14}, Lcom/keepassdroid/database/PwDatabaseV3;->copyEncrypted([BII)V

    .line 221
    const/16 v20, 0x0

    .line 223
    .local v20, "md":Ljava/security/MessageDigest;
    :try_start_3
    const-string v5, "SHA-256"

    invoke-static {v5}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;
    :try_end_3
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_3 .. :try_end_3} :catch_7

    move-result-object v20

    .line 227
    new-instance v23, Lcom/keepassdroid/stream/NullOutputStream;

    invoke-direct/range {v23 .. v23}, Lcom/keepassdroid/stream/NullOutputStream;-><init>()V

    .line 228
    .local v23, "nos":Lcom/keepassdroid/stream/NullOutputStream;
    new-instance v11, Ljava/security/DigestOutputStream;

    move-object/from16 v0, v23

    move-object/from16 v1, v20

    invoke-direct {v11, v0, v1}, Ljava/security/DigestOutputStream;-><init>(Ljava/io/OutputStream;Ljava/security/MessageDigest;)V

    .line 229
    .local v11, "dos":Ljava/security/DigestOutputStream;
    const/16 v5, 0x7c

    invoke-virtual {v11, v4, v5, v14}, Ljava/security/DigestOutputStream;->write([BII)V

    .line 230
    invoke-virtual {v11}, Ljava/security/DigestOutputStream;->close()V

    .line 231
    invoke-virtual/range {v20 .. v20}, Ljava/security/MessageDigest;->digest()[B

    move-result-object v17

    .line 233
    .local v17, "hash":[B
    move-object/from16 v0, v18

    iget-object v5, v0, Lcom/keepassdroid/database/PwDbHeaderV3;->contentsHash:[B

    move-object/from16 v0, v17

    invoke-static {v0, v5}, Ljava/util/Arrays;->equals([B[B)Z

    move-result v5

    if-nez v5, :cond_8

    .line 235
    const-string v5, "KeePassDroid"

    const-string v6, "Database file did not decrypt correctly. (checksum code is broken)"

    invoke-static {v5, v6}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 236
    new-instance v5, Lcom/keepassdroid/database/exception/InvalidPasswordException;

    invoke-direct {v5}, Lcom/keepassdroid/database/exception/InvalidPasswordException;-><init>()V

    throw v5

    .line 164
    .end local v3    # "cipher":Ljavax/crypto/Cipher;
    .end local v11    # "dos":Ljava/security/DigestOutputStream;
    .end local v14    # "encryptedPartSize":I
    .end local v17    # "hash":[B
    .end local v20    # "md":Ljava/security/MessageDigest;
    .end local v23    # "nos":Lcom/keepassdroid/stream/NullOutputStream;
    :cond_4
    move-object/from16 v0, v18

    iget v5, v0, Lcom/keepassdroid/database/PwDbHeaderV3;->flags:I

    and-int/lit8 v5, v5, 0x8

    if-eqz v5, :cond_5

    .line 165
    sget-object v5, Lcom/keepassdroid/database/PwEncryptionAlgorithm;->Twofish:Lcom/keepassdroid/database/PwEncryptionAlgorithm;

    move-object/from16 v0, v22

    iput-object v5, v0, Lcom/keepassdroid/database/PwDatabaseV3;->algorithm:Lcom/keepassdroid/database/PwEncryptionAlgorithm;

    goto/16 :goto_0

    .line 167
    :cond_5
    new-instance v5, Lcom/keepassdroid/database/exception/InvalidAlgorithmException;

    invoke-direct {v5}, Lcom/keepassdroid/database/exception/InvalidAlgorithmException;-><init>()V

    throw v5

    .line 186
    :cond_6
    :try_start_4
    move-object/from16 v0, v22

    iget-object v5, v0, Lcom/keepassdroid/database/PwDatabaseV3;->algorithm:Lcom/keepassdroid/database/PwEncryptionAlgorithm;

    sget-object v6, Lcom/keepassdroid/database/PwEncryptionAlgorithm;->Twofish:Lcom/keepassdroid/database/PwEncryptionAlgorithm;

    if-ne v5, v6, :cond_7

    .line 187
    const-string v5, "TWOFISH/CBC/PKCS7PADDING"

    invoke-static {v5}, Lcom/keepassdroid/crypto/CipherFactory;->getInstance(Ljava/lang/String;)Ljavax/crypto/Cipher;

    move-result-object v3

    .restart local v3    # "cipher":Ljavax/crypto/Cipher;
    goto/16 :goto_1

    .line 189
    .end local v3    # "cipher":Ljavax/crypto/Cipher;
    :cond_7
    new-instance v5, Ljava/io/IOException;

    const-string v6, "Encryption algorithm is not supported"

    invoke-direct {v5, v6}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v5
    :try_end_4
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_4 .. :try_end_4} :catch_0
    .catch Ljavax/crypto/NoSuchPaddingException; {:try_start_4 .. :try_end_4} :catch_1

    .line 192
    :catch_0
    move-exception v13

    .line 193
    .local v13, "e1":Ljava/security/NoSuchAlgorithmException;
    new-instance v5, Ljava/io/IOException;

    const-string v6, "No such algorithm"

    invoke-direct {v5, v6}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 194
    .end local v13    # "e1":Ljava/security/NoSuchAlgorithmException;
    :catch_1
    move-exception v13

    .line 195
    .local v13, "e1":Ljavax/crypto/NoSuchPaddingException;
    new-instance v5, Ljava/io/IOException;

    const-string v6, "No such pdading"

    invoke-direct {v5, v6}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 200
    .end local v13    # "e1":Ljavax/crypto/NoSuchPaddingException;
    .restart local v3    # "cipher":Ljavax/crypto/Cipher;
    :catch_2
    move-exception v13

    .line 201
    .local v13, "e1":Ljava/security/InvalidKeyException;
    new-instance v5, Ljava/io/IOException;

    const-string v6, "Invalid key"

    invoke-direct {v5, v6}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 202
    .end local v13    # "e1":Ljava/security/InvalidKeyException;
    :catch_3
    move-exception v13

    .line 203
    .local v13, "e1":Ljava/security/InvalidAlgorithmParameterException;
    new-instance v5, Ljava/io/IOException;

    const-string v6, "Invalid algorithm parameter."

    invoke-direct {v5, v6}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 210
    .end local v13    # "e1":Ljava/security/InvalidAlgorithmParameterException;
    :catch_4
    move-exception v13

    .line 211
    .local v13, "e1":Ljavax/crypto/ShortBufferException;
    new-instance v5, Ljava/io/IOException;

    const-string v6, "Buffer too short"

    invoke-direct {v5, v6}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 212
    .end local v13    # "e1":Ljavax/crypto/ShortBufferException;
    :catch_5
    move-exception v13

    .line 213
    .local v13, "e1":Ljavax/crypto/IllegalBlockSizeException;
    new-instance v5, Ljava/io/IOException;

    const-string v6, "Invalid block size"

    invoke-direct {v5, v6}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 214
    .end local v13    # "e1":Ljavax/crypto/IllegalBlockSizeException;
    :catch_6
    move-exception v13

    .line 215
    .local v13, "e1":Ljavax/crypto/BadPaddingException;
    new-instance v5, Lcom/keepassdroid/database/exception/InvalidPasswordException;

    invoke-direct {v5}, Lcom/keepassdroid/database/exception/InvalidPasswordException;-><init>()V

    throw v5

    .line 224
    .end local v13    # "e1":Ljavax/crypto/BadPaddingException;
    .restart local v14    # "encryptedPartSize":I
    .restart local v20    # "md":Ljava/security/MessageDigest;
    :catch_7
    move-exception v12

    .line 225
    .local v12, "e":Ljava/security/NoSuchAlgorithmException;
    new-instance v5, Ljava/io/IOException;

    const-string v6, "No SHA-256 algorithm"

    invoke-direct {v5, v6}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 241
    .end local v12    # "e":Ljava/security/NoSuchAlgorithmException;
    .restart local v11    # "dos":Ljava/security/DigestOutputStream;
    .restart local v17    # "hash":[B
    .restart local v23    # "nos":Lcom/keepassdroid/stream/NullOutputStream;
    :cond_8
    const/16 v10, 0x7c

    .line 242
    .local v10, "pos":I
    new-instance v7, Lcom/keepassdroid/database/PwGroupV3;

    invoke-direct {v7}, Lcom/keepassdroid/database/PwGroupV3;-><init>()V

    .line 243
    .local v7, "newGrp":Lcom/keepassdroid/database/PwGroupV3;
    const/16 v19, 0x0

    .local v19, "i":I
    :goto_2
    move-object/from16 v0, v18

    iget v5, v0, Lcom/keepassdroid/database/PwDbHeaderV3;->numGroups:I

    move/from16 v0, v19

    if-ge v0, v5, :cond_a

    .line 244
    invoke-static {v4, v10}, Lcom/keepassdroid/stream/LEDataInputStream;->readUShort([BI)I

    move-result v8

    .line 245
    .local v8, "fieldType":I
    add-int/lit8 v10, v10, 0x2

    .line 246
    invoke-static {v4, v10}, Lcom/keepassdroid/stream/LEDataInputStream;->readInt([BI)I

    move-result v15

    .line 247
    .local v15, "fieldSize":I
    add-int/lit8 v10, v10, 0x4

    .line 249
    const v5, 0xffff

    if-ne v8, v5, :cond_9

    .line 252
    move-object/from16 v0, v22

    invoke-virtual {v7, v0}, Lcom/keepassdroid/database/PwGroupV3;->populateBlankFields(Lcom/keepassdroid/database/PwDatabaseV3;)V

    .line 253
    move-object/from16 v0, v22

    iget-object v5, v0, Lcom/keepassdroid/database/PwDatabaseV3;->groups:Ljava/util/List;

    invoke-interface {v5, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 254
    new-instance v7, Lcom/keepassdroid/database/PwGroupV3;

    .end local v7    # "newGrp":Lcom/keepassdroid/database/PwGroupV3;
    invoke-direct {v7}, Lcom/keepassdroid/database/PwGroupV3;-><init>()V

    .line 255
    .restart local v7    # "newGrp":Lcom/keepassdroid/database/PwGroupV3;
    add-int/lit8 v19, v19, 0x1

    .line 260
    :goto_3
    add-int/2addr v10, v15

    .line 261
    goto :goto_2

    :cond_9
    move-object/from16 v5, p0

    move-object/from16 v6, v22

    move-object v9, v4

    .line 258
    invoke-virtual/range {v5 .. v10}, Lcom/keepassdroid/database/load/ImporterV3;->readGroupField(Lcom/keepassdroid/database/PwDatabaseV3;Lcom/keepassdroid/database/PwGroupV3;I[BI)V

    goto :goto_3

    .line 264
    .end local v8    # "fieldType":I
    .end local v15    # "fieldSize":I
    :cond_a
    new-instance v21, Lcom/keepassdroid/database/PwEntryV3;

    invoke-direct/range {v21 .. v21}, Lcom/keepassdroid/database/PwEntryV3;-><init>()V

    .line 265
    .local v21, "newEnt":Lcom/keepassdroid/database/PwEntryV3;
    const/16 v19, 0x0

    :goto_4
    move-object/from16 v0, v18

    iget v5, v0, Lcom/keepassdroid/database/PwDbHeaderV3;->numEntries:I

    move/from16 v0, v19

    if-ge v0, v5, :cond_c

    .line 266
    invoke-static {v4, v10}, Lcom/keepassdroid/stream/LEDataInputStream;->readUShort([BI)I

    move-result v8

    .line 267
    .restart local v8    # "fieldType":I
    add-int/lit8 v5, v10, 0x2

    invoke-static {v4, v5}, Lcom/keepassdroid/stream/LEDataInputStream;->readInt([BI)I

    move-result v15

    .line 269
    .restart local v15    # "fieldSize":I
    const v5, 0xffff

    if-ne v8, v5, :cond_b

    .line 271
    invoke-virtual/range {v21 .. v22}, Lcom/keepassdroid/database/PwEntryV3;->populateBlankFields(Lcom/keepassdroid/database/PwDatabaseV3;)V

    .line 272
    move-object/from16 v0, v22

    iget-object v5, v0, Lcom/keepassdroid/database/PwDatabaseV3;->entries:Ljava/util/List;

    move-object/from16 v0, v21

    invoke-interface {v5, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 273
    new-instance v21, Lcom/keepassdroid/database/PwEntryV3;

    .end local v21    # "newEnt":Lcom/keepassdroid/database/PwEntryV3;
    invoke-direct/range {v21 .. v21}, Lcom/keepassdroid/database/PwEntryV3;-><init>()V

    .line 274
    .restart local v21    # "newEnt":Lcom/keepassdroid/database/PwEntryV3;
    add-int/lit8 v19, v19, 0x1

    .line 279
    :goto_5
    add-int/lit8 v5, v15, 0x6

    add-int/2addr v10, v5

    .line 280
    goto :goto_4

    .line 277
    :cond_b
    move-object/from16 v0, p0

    move-object/from16 v1, v22

    move-object/from16 v2, v21

    invoke-virtual {v0, v1, v2, v4, v10}, Lcom/keepassdroid/database/load/ImporterV3;->readEntryField(Lcom/keepassdroid/database/PwDatabaseV3;Lcom/keepassdroid/database/PwEntryV3;[BI)V

    goto :goto_5

    .line 282
    .end local v8    # "fieldType":I
    .end local v15    # "fieldSize":I
    :cond_c
    const/4 v5, 0x0

    move-object/from16 v0, v22

    invoke-virtual {v0, v5}, Lcom/keepassdroid/database/PwDatabaseV3;->constructTree(Lcom/keepassdroid/database/PwGroupV3;)V

    .line 284
    return-object v22
.end method

.method readEntryField(Lcom/keepassdroid/database/PwDatabaseV3;Lcom/keepassdroid/database/PwEntryV3;[BI)V
    .locals 4
    .param p1, "db"    # Lcom/keepassdroid/database/PwDatabaseV3;
    .param p2, "ent"    # Lcom/keepassdroid/database/PwEntryV3;
    .param p3, "buf"    # [B
    .param p4, "offset"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/UnsupportedEncodingException;
        }
    .end annotation

    .prologue
    .line 377
    invoke-static {p3, p4}, Lcom/keepassdroid/stream/LEDataInputStream;->readUShort([BI)I

    move-result v1

    .line 378
    .local v1, "fieldType":I
    add-int/lit8 p4, p4, 0x2

    .line 379
    invoke-static {p3, p4}, Lcom/keepassdroid/stream/LEDataInputStream;->readInt([BI)I

    move-result v0

    .line 380
    .local v0, "fieldSize":I
    add-int/lit8 p4, p4, 0x4

    .line 382
    packed-switch v1, :pswitch_data_0

    .line 436
    :goto_0
    :pswitch_0
    return-void

    .line 387
    :pswitch_1
    invoke-static {p3, p4}, Lcom/keepassdroid/utils/Types;->bytestoUUID([BI)Ljava/util/UUID;

    move-result-object v3

    invoke-virtual {p2, v3}, Lcom/keepassdroid/database/PwEntryV3;->setUUID(Ljava/util/UUID;)V

    goto :goto_0

    .line 390
    :pswitch_2
    invoke-static {p3, p4}, Lcom/keepassdroid/stream/LEDataInputStream;->readInt([BI)I

    move-result v3

    iput v3, p2, Lcom/keepassdroid/database/PwEntryV3;->groupId:I

    goto :goto_0

    .line 393
    :pswitch_3
    invoke-static {p3, p4}, Lcom/keepassdroid/stream/LEDataInputStream;->readInt([BI)I

    move-result v2

    .line 396
    .local v2, "iconId":I
    const/4 v3, -0x1

    if-ne v2, v3, :cond_0

    .line 397
    const/4 v2, 0x0

    .line 400
    :cond_0
    iget-object v3, p1, Lcom/keepassdroid/database/PwDatabaseV3;->iconFactory:Lcom/keepassdroid/database/PwIconFactory;

    invoke-virtual {v3, v2}, Lcom/keepassdroid/database/PwIconFactory;->getIcon(I)Lcom/keepassdroid/database/PwIconStandard;

    move-result-object v3

    iput-object v3, p2, Lcom/keepassdroid/database/PwEntryV3;->icon:Lcom/keepassdroid/database/PwIconStandard;

    goto :goto_0

    .line 403
    .end local v2    # "iconId":I
    :pswitch_4
    invoke-static {p3, p4}, Lcom/keepassdroid/utils/Types;->readCString([BI)Ljava/lang/String;

    move-result-object v3

    iput-object v3, p2, Lcom/keepassdroid/database/PwEntryV3;->title:Ljava/lang/String;

    goto :goto_0

    .line 406
    :pswitch_5
    invoke-static {p3, p4}, Lcom/keepassdroid/utils/Types;->readCString([BI)Ljava/lang/String;

    move-result-object v3

    iput-object v3, p2, Lcom/keepassdroid/database/PwEntryV3;->url:Ljava/lang/String;

    goto :goto_0

    .line 409
    :pswitch_6
    invoke-static {p3, p4}, Lcom/keepassdroid/utils/Types;->readCString([BI)Ljava/lang/String;

    move-result-object v3

    iput-object v3, p2, Lcom/keepassdroid/database/PwEntryV3;->username:Ljava/lang/String;

    goto :goto_0

    .line 412
    :pswitch_7
    invoke-static {p3, p4}, Lcom/keepassdroid/utils/Types;->strlen([BI)I

    move-result v3

    invoke-virtual {p2, p3, p4, v3}, Lcom/keepassdroid/database/PwEntryV3;->setPassword([BII)V

    goto :goto_0

    .line 415
    :pswitch_8
    invoke-static {p3, p4}, Lcom/keepassdroid/utils/Types;->readCString([BI)Ljava/lang/String;

    move-result-object v3

    iput-object v3, p2, Lcom/keepassdroid/database/PwEntryV3;->additional:Ljava/lang/String;

    goto :goto_0

    .line 418
    :pswitch_9
    new-instance v3, Lcom/keepassdroid/database/PwDate;

    invoke-direct {v3, p3, p4}, Lcom/keepassdroid/database/PwDate;-><init>([BI)V

    iput-object v3, p2, Lcom/keepassdroid/database/PwEntryV3;->tCreation:Lcom/keepassdroid/database/PwDate;

    goto :goto_0

    .line 421
    :pswitch_a
    new-instance v3, Lcom/keepassdroid/database/PwDate;

    invoke-direct {v3, p3, p4}, Lcom/keepassdroid/database/PwDate;-><init>([BI)V

    iput-object v3, p2, Lcom/keepassdroid/database/PwEntryV3;->tLastMod:Lcom/keepassdroid/database/PwDate;

    goto :goto_0

    .line 424
    :pswitch_b
    new-instance v3, Lcom/keepassdroid/database/PwDate;

    invoke-direct {v3, p3, p4}, Lcom/keepassdroid/database/PwDate;-><init>([BI)V

    iput-object v3, p2, Lcom/keepassdroid/database/PwEntryV3;->tLastAccess:Lcom/keepassdroid/database/PwDate;

    goto :goto_0

    .line 427
    :pswitch_c
    new-instance v3, Lcom/keepassdroid/database/PwDate;

    invoke-direct {v3, p3, p4}, Lcom/keepassdroid/database/PwDate;-><init>([BI)V

    iput-object v3, p2, Lcom/keepassdroid/database/PwEntryV3;->tExpire:Lcom/keepassdroid/database/PwDate;

    goto :goto_0

    .line 430
    :pswitch_d
    invoke-static {p3, p4}, Lcom/keepassdroid/utils/Types;->readCString([BI)Ljava/lang/String;

    move-result-object v3

    iput-object v3, p2, Lcom/keepassdroid/database/PwEntryV3;->binaryDesc:Ljava/lang/String;

    goto :goto_0

    .line 433
    :pswitch_e
    invoke-virtual {p2, p3, p4, v0}, Lcom/keepassdroid/database/PwEntryV3;->setBinaryData([BII)V

    goto :goto_0

    .line 382
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_5
        :pswitch_6
        :pswitch_7
        :pswitch_8
        :pswitch_9
        :pswitch_a
        :pswitch_b
        :pswitch_c
        :pswitch_d
        :pswitch_e
    .end packed-switch
.end method

.method readGroupField(Lcom/keepassdroid/database/PwDatabaseV3;Lcom/keepassdroid/database/PwGroupV3;I[BI)V
    .locals 2
    .param p1, "db"    # Lcom/keepassdroid/database/PwDatabaseV3;
    .param p2, "grp"    # Lcom/keepassdroid/database/PwGroupV3;
    .param p3, "fieldType"    # I
    .param p4, "buf"    # [B
    .param p5, "offset"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/UnsupportedEncodingException;
        }
    .end annotation

    .prologue
    .line 338
    packed-switch p3, :pswitch_data_0

    .line 370
    :goto_0
    :pswitch_0
    return-void

    .line 343
    :pswitch_1
    invoke-static {p4, p5}, Lcom/keepassdroid/stream/LEDataInputStream;->readInt([BI)I

    move-result v0

    iput v0, p2, Lcom/keepassdroid/database/PwGroupV3;->groupId:I

    goto :goto_0

    .line 346
    :pswitch_2
    invoke-static {p4, p5}, Lcom/keepassdroid/utils/Types;->readCString([BI)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p2, Lcom/keepassdroid/database/PwGroupV3;->name:Ljava/lang/String;

    goto :goto_0

    .line 349
    :pswitch_3
    new-instance v0, Lcom/keepassdroid/database/PwDate;

    invoke-direct {v0, p4, p5}, Lcom/keepassdroid/database/PwDate;-><init>([BI)V

    iput-object v0, p2, Lcom/keepassdroid/database/PwGroupV3;->tCreation:Lcom/keepassdroid/database/PwDate;

    goto :goto_0

    .line 352
    :pswitch_4
    new-instance v0, Lcom/keepassdroid/database/PwDate;

    invoke-direct {v0, p4, p5}, Lcom/keepassdroid/database/PwDate;-><init>([BI)V

    iput-object v0, p2, Lcom/keepassdroid/database/PwGroupV3;->tLastMod:Lcom/keepassdroid/database/PwDate;

    goto :goto_0

    .line 355
    :pswitch_5
    new-instance v0, Lcom/keepassdroid/database/PwDate;

    invoke-direct {v0, p4, p5}, Lcom/keepassdroid/database/PwDate;-><init>([BI)V

    iput-object v0, p2, Lcom/keepassdroid/database/PwGroupV3;->tLastAccess:Lcom/keepassdroid/database/PwDate;

    goto :goto_0

    .line 358
    :pswitch_6
    new-instance v0, Lcom/keepassdroid/database/PwDate;

    invoke-direct {v0, p4, p5}, Lcom/keepassdroid/database/PwDate;-><init>([BI)V

    iput-object v0, p2, Lcom/keepassdroid/database/PwGroupV3;->tExpire:Lcom/keepassdroid/database/PwDate;

    goto :goto_0

    .line 361
    :pswitch_7
    iget-object v0, p1, Lcom/keepassdroid/database/PwDatabaseV3;->iconFactory:Lcom/keepassdroid/database/PwIconFactory;

    invoke-static {p4, p5}, Lcom/keepassdroid/stream/LEDataInputStream;->readInt([BI)I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/keepassdroid/database/PwIconFactory;->getIcon(I)Lcom/keepassdroid/database/PwIconStandard;

    move-result-object v0

    iput-object v0, p2, Lcom/keepassdroid/database/PwGroupV3;->icon:Lcom/keepassdroid/database/PwIconStandard;

    goto :goto_0

    .line 364
    :pswitch_8
    invoke-static {p4, p5}, Lcom/keepassdroid/stream/LEDataInputStream;->readUShort([BI)I

    move-result v0

    iput v0, p2, Lcom/keepassdroid/database/PwGroupV3;->level:I

    goto :goto_0

    .line 367
    :pswitch_9
    invoke-static {p4, p5}, Lcom/keepassdroid/stream/LEDataInputStream;->readInt([BI)I

    move-result v0

    iput v0, p2, Lcom/keepassdroid/database/PwGroupV3;->flags:I

    goto :goto_0

    .line 338
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_5
        :pswitch_6
        :pswitch_7
        :pswitch_8
        :pswitch_9
    .end packed-switch
.end method
