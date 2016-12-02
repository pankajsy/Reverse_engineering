.class public Lcom/keepassdroid/crypto/finalkey/AndroidFinalKey;
.super Lcom/keepassdroid/crypto/finalkey/FinalKey;
.source "AndroidFinalKey.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 32
    invoke-direct {p0}, Lcom/keepassdroid/crypto/finalkey/FinalKey;-><init>()V

    return-void
.end method


# virtual methods
.method public transformMasterKey([B[BI)[B
    .locals 10
    .param p1, "pKeySeed"    # [B
    .param p2, "pKey"    # [B
    .param p3, "rounds"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v9, 0x0

    .line 38
    :try_start_0
    const-string v2, "AES/ECB/NoPadding"

    invoke-static {v2}, Ljavax/crypto/Cipher;->getInstance(Ljava/lang/String;)Ljavax/crypto/Cipher;
    :try_end_0
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljavax/crypto/NoSuchPaddingException; {:try_start_0 .. :try_end_0} :catch_1

    move-result-object v0

    .line 46
    .local v0, "cipher":Ljavax/crypto/Cipher;
    const/4 v2, 0x1

    :try_start_1
    new-instance v3, Ljavax/crypto/spec/SecretKeySpec;

    const-string v5, "AES"

    invoke-direct {v3, p1, v5}, Ljavax/crypto/spec/SecretKeySpec;-><init>([BLjava/lang/String;)V

    invoke-virtual {v0, v2, v3}, Ljavax/crypto/Cipher;->init(ILjava/security/Key;)V
    :try_end_1
    .catch Ljava/security/InvalidKeyException; {:try_start_1 .. :try_end_1} :catch_2

    .line 52
    array-length v2, p2

    new-array v1, v2, [B

    .line 53
    .local v1, "newKey":[B
    array-length v2, p2

    invoke-static {p2, v9, v1, v9, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 54
    array-length v2, p2

    new-array v4, v2, [B

    .line 55
    .local v4, "destKey":[B
    const/4 v7, 0x0

    .local v7, "i":I
    :goto_0
    if-ge v7, p3, :cond_0

    .line 57
    const/4 v2, 0x0

    :try_start_2
    array-length v3, v1

    const/4 v5, 0x0

    invoke-virtual/range {v0 .. v5}, Ljavax/crypto/Cipher;->update([BII[BI)I

    .line 58
    const/4 v2, 0x0

    const/4 v3, 0x0

    array-length v5, v1

    invoke-static {v4, v2, v1, v3, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V
    :try_end_2
    .catch Ljavax/crypto/ShortBufferException; {:try_start_2 .. :try_end_2} :catch_3

    .line 55
    add-int/lit8 v7, v7, 0x1

    goto :goto_0

    .line 39
    .end local v0    # "cipher":Ljavax/crypto/Cipher;
    .end local v1    # "newKey":[B
    .end local v4    # "destKey":[B
    .end local v7    # "i":I
    :catch_0
    move-exception v6

    .line 40
    .local v6, "e":Ljava/security/NoSuchAlgorithmException;
    new-instance v2, Ljava/io/IOException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "NoSuchAlgorithm: "

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v6}, Ljava/security/NoSuchAlgorithmException;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 41
    .end local v6    # "e":Ljava/security/NoSuchAlgorithmException;
    :catch_1
    move-exception v6

    .line 42
    .local v6, "e":Ljavax/crypto/NoSuchPaddingException;
    new-instance v2, Ljava/io/IOException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "NoSuchPadding: "

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v6}, Ljavax/crypto/NoSuchPaddingException;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 47
    .end local v6    # "e":Ljavax/crypto/NoSuchPaddingException;
    .restart local v0    # "cipher":Ljavax/crypto/Cipher;
    :catch_2
    move-exception v6

    .line 48
    .local v6, "e":Ljava/security/InvalidKeyException;
    new-instance v2, Ljava/io/IOException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "InvalidPasswordException: "

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v6}, Ljava/security/InvalidKeyException;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 60
    .end local v6    # "e":Ljava/security/InvalidKeyException;
    .restart local v1    # "newKey":[B
    .restart local v4    # "destKey":[B
    .restart local v7    # "i":I
    :catch_3
    move-exception v6

    .line 61
    .local v6, "e":Ljavax/crypto/ShortBufferException;
    new-instance v2, Ljava/io/IOException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Short buffer: "

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v6}, Ljavax/crypto/ShortBufferException;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 66
    .end local v6    # "e":Ljavax/crypto/ShortBufferException;
    :cond_0
    const/4 v8, 0x0

    .line 68
    .local v8, "md":Ljava/security/MessageDigest;
    :try_start_3
    const-string v2, "SHA-256"

    invoke-static {v2}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;
    :try_end_3
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_3 .. :try_end_3} :catch_4

    move-result-object v8

    .line 74
    invoke-virtual {v8, v1}, Ljava/security/MessageDigest;->update([B)V

    .line 75
    invoke-virtual {v8}, Ljava/security/MessageDigest;->digest()[B

    move-result-object v2

    return-object v2

    .line 69
    :catch_4
    move-exception v6

    .line 71
    .local v6, "e":Ljava/security/NoSuchAlgorithmException;
    new-instance v2, Ljava/io/IOException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "SHA-256 not implemented here: "

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v6}, Ljava/security/NoSuchAlgorithmException;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v2
.end method
