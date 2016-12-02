.class public abstract Lorg/bouncycastle/jce/provider/WrapCipherSpi;
.super Ljavax/crypto/CipherSpi;
.source "WrapCipherSpi.java"

# interfaces
.implements Lorg/bouncycastle/jce/provider/PBE;


# instance fields
.field private availableSpecs:[Ljava/lang/Class;

.field protected engineParams:Ljava/security/AlgorithmParameters;

.field private iv:[B

.field private ivSize:I

.field protected pbeHash:I

.field protected pbeIvSize:I

.field protected pbeKeySize:I

.field protected pbeType:I

.field protected wrapEngine:Lorg/bouncycastle/crypto/Wrapper;


# direct methods
.method protected constructor <init>()V
    .locals 6

    .prologue
    const/4 v5, 0x0

    const/4 v4, 0x2

    const/4 v3, 0x1

    .line 75
    invoke-direct {p0}, Ljavax/crypto/CipherSpi;-><init>()V

    .line 53
    const/4 v0, 0x4

    new-array v0, v0, [Ljava/lang/Class;

    const/4 v1, 0x0

    const-class v2, Ljavax/crypto/spec/IvParameterSpec;

    aput-object v2, v0, v1

    const-class v1, Ljavax/crypto/spec/PBEParameterSpec;

    aput-object v1, v0, v3

    const-class v1, Ljavax/crypto/spec/RC2ParameterSpec;

    aput-object v1, v0, v4

    const/4 v1, 0x3

    const-class v2, Ljavax/crypto/spec/RC5ParameterSpec;

    aput-object v2, v0, v1

    iput-object v0, p0, Lorg/bouncycastle/jce/provider/WrapCipherSpi;->availableSpecs:[Ljava/lang/Class;

    .line 62
    iput v4, p0, Lorg/bouncycastle/jce/provider/WrapCipherSpi;->pbeType:I

    .line 63
    iput v3, p0, Lorg/bouncycastle/jce/provider/WrapCipherSpi;->pbeHash:I

    .line 67
    iput-object v5, p0, Lorg/bouncycastle/jce/provider/WrapCipherSpi;->engineParams:Ljava/security/AlgorithmParameters;

    .line 69
    iput-object v5, p0, Lorg/bouncycastle/jce/provider/WrapCipherSpi;->wrapEngine:Lorg/bouncycastle/crypto/Wrapper;

    .line 76
    return-void
.end method

.method protected constructor <init>(Lorg/bouncycastle/crypto/Wrapper;)V
    .locals 1
    .param p1, "wrapEngine"    # Lorg/bouncycastle/crypto/Wrapper;

    .prologue
    .line 81
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lorg/bouncycastle/jce/provider/WrapCipherSpi;-><init>(Lorg/bouncycastle/crypto/Wrapper;I)V

    .line 82
    return-void
.end method

.method protected constructor <init>(Lorg/bouncycastle/crypto/Wrapper;I)V
    .locals 6
    .param p1, "wrapEngine"    # Lorg/bouncycastle/crypto/Wrapper;
    .param p2, "ivSize"    # I

    .prologue
    const/4 v5, 0x0

    const/4 v4, 0x2

    const/4 v3, 0x1

    .line 87
    invoke-direct {p0}, Ljavax/crypto/CipherSpi;-><init>()V

    .line 53
    const/4 v0, 0x4

    new-array v0, v0, [Ljava/lang/Class;

    const/4 v1, 0x0

    const-class v2, Ljavax/crypto/spec/IvParameterSpec;

    aput-object v2, v0, v1

    const-class v1, Ljavax/crypto/spec/PBEParameterSpec;

    aput-object v1, v0, v3

    const-class v1, Ljavax/crypto/spec/RC2ParameterSpec;

    aput-object v1, v0, v4

    const/4 v1, 0x3

    const-class v2, Ljavax/crypto/spec/RC5ParameterSpec;

    aput-object v2, v0, v1

    iput-object v0, p0, Lorg/bouncycastle/jce/provider/WrapCipherSpi;->availableSpecs:[Ljava/lang/Class;

    .line 62
    iput v4, p0, Lorg/bouncycastle/jce/provider/WrapCipherSpi;->pbeType:I

    .line 63
    iput v3, p0, Lorg/bouncycastle/jce/provider/WrapCipherSpi;->pbeHash:I

    .line 67
    iput-object v5, p0, Lorg/bouncycastle/jce/provider/WrapCipherSpi;->engineParams:Ljava/security/AlgorithmParameters;

    .line 69
    iput-object v5, p0, Lorg/bouncycastle/jce/provider/WrapCipherSpi;->wrapEngine:Lorg/bouncycastle/crypto/Wrapper;

    .line 88
    iput-object p1, p0, Lorg/bouncycastle/jce/provider/WrapCipherSpi;->wrapEngine:Lorg/bouncycastle/crypto/Wrapper;

    .line 89
    iput p2, p0, Lorg/bouncycastle/jce/provider/WrapCipherSpi;->ivSize:I

    .line 90
    return-void
.end method


# virtual methods
.method protected engineDoFinal([BII[BI)I
    .locals 1
    .param p1, "input"    # [B
    .param p2, "inputOffset"    # I
    .param p3, "inputLen"    # I
    .param p4, "output"    # [B
    .param p5, "outputOffset"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/crypto/IllegalBlockSizeException;,
            Ljavax/crypto/BadPaddingException;
        }
    .end annotation

    .prologue
    .line 280
    const/4 v0, 0x0

    return v0
.end method

.method protected engineDoFinal([BII)[B
    .locals 1
    .param p1, "input"    # [B
    .param p2, "inputOffset"    # I
    .param p3, "inputLen"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/crypto/IllegalBlockSizeException;,
            Ljavax/crypto/BadPaddingException;
        }
    .end annotation

    .prologue
    .line 269
    const/4 v0, 0x0

    return-object v0
.end method

.method protected engineGetBlockSize()I
    .locals 1

    .prologue
    .line 94
    const/4 v0, 0x0

    return v0
.end method

.method protected engineGetIV()[B
    .locals 1

    .prologue
    .line 99
    iget-object v0, p0, Lorg/bouncycastle/jce/provider/WrapCipherSpi;->iv:[B

    invoke-virtual {v0}, [B->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [B

    check-cast v0, [B

    return-object v0
.end method

.method protected engineGetKeySize(Ljava/security/Key;)I
    .locals 1
    .param p1, "key"    # Ljava/security/Key;

    .prologue
    .line 105
    invoke-interface {p1}, Ljava/security/Key;->getEncoded()[B

    move-result-object v0

    array-length v0, v0

    return v0
.end method

.method protected engineGetOutputSize(I)I
    .locals 1
    .param p1, "inputLen"    # I

    .prologue
    .line 111
    const/4 v0, -0x1

    return v0
.end method

.method protected engineGetParameters()Ljava/security/AlgorithmParameters;
    .locals 1

    .prologue
    .line 116
    const/4 v0, 0x0

    return-object v0
.end method

.method protected engineInit(ILjava/security/Key;Ljava/security/AlgorithmParameters;Ljava/security/SecureRandom;)V
    .locals 5
    .param p1, "opmode"    # I
    .param p2, "key"    # Ljava/security/Key;
    .param p3, "params"    # Ljava/security/AlgorithmParameters;
    .param p4, "random"    # Ljava/security/SecureRandom;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/InvalidKeyException;,
            Ljava/security/InvalidAlgorithmParameterException;
        }
    .end annotation

    .prologue
    .line 201
    const/4 v1, 0x0

    .line 203
    .local v1, "paramSpec":Ljava/security/spec/AlgorithmParameterSpec;
    if-eqz p3, :cond_1

    .line 205
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v2, p0, Lorg/bouncycastle/jce/provider/WrapCipherSpi;->availableSpecs:[Ljava/lang/Class;

    array-length v2, v2

    if-eq v0, v2, :cond_0

    .line 209
    :try_start_0
    iget-object v2, p0, Lorg/bouncycastle/jce/provider/WrapCipherSpi;->availableSpecs:[Ljava/lang/Class;

    aget-object v2, v2, v0

    invoke-virtual {p3, v2}, Ljava/security/AlgorithmParameters;->getParameterSpec(Ljava/lang/Class;)Ljava/security/spec/AlgorithmParameterSpec;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 218
    :cond_0
    if-nez v1, :cond_1

    .line 220
    new-instance v2, Ljava/security/InvalidAlgorithmParameterException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "can\'t handle parameter "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p3}, Ljava/security/AlgorithmParameters;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/security/InvalidAlgorithmParameterException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 212
    :catch_0
    move-exception v2

    .line 205
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 224
    .end local v0    # "i":I
    :cond_1
    iput-object p3, p0, Lorg/bouncycastle/jce/provider/WrapCipherSpi;->engineParams:Ljava/security/AlgorithmParameters;

    .line 225
    invoke-virtual {p0, p1, p2, v1, p4}, Lorg/bouncycastle/jce/provider/WrapCipherSpi;->engineInit(ILjava/security/Key;Ljava/security/spec/AlgorithmParameterSpec;Ljava/security/SecureRandom;)V

    .line 226
    return-void
.end method

.method protected engineInit(ILjava/security/Key;Ljava/security/SecureRandom;)V
    .locals 3
    .param p1, "opmode"    # I
    .param p2, "key"    # Ljava/security/Key;
    .param p3, "random"    # Ljava/security/SecureRandom;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/InvalidKeyException;
        }
    .end annotation

    .prologue
    .line 236
    const/4 v1, 0x0

    :try_start_0
    check-cast v1, Ljava/security/spec/AlgorithmParameterSpec;

    invoke-virtual {p0, p1, p2, v1, p3}, Lorg/bouncycastle/jce/provider/WrapCipherSpi;->engineInit(ILjava/security/Key;Ljava/security/spec/AlgorithmParameterSpec;Ljava/security/SecureRandom;)V
    :try_end_0
    .catch Ljava/security/InvalidAlgorithmParameterException; {:try_start_0 .. :try_end_0} :catch_0

    .line 242
    return-void

    .line 238
    :catch_0
    move-exception v0

    .line 240
    .local v0, "e":Ljava/security/InvalidAlgorithmParameterException;
    new-instance v1, Ljava/lang/IllegalArgumentException;

    invoke-virtual {v0}, Ljava/security/InvalidAlgorithmParameterException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method protected engineInit(ILjava/security/Key;Ljava/security/spec/AlgorithmParameterSpec;Ljava/security/SecureRandom;)V
    .locals 6
    .param p1, "opmode"    # I
    .param p2, "key"    # Ljava/security/Key;
    .param p3, "params"    # Ljava/security/spec/AlgorithmParameterSpec;
    .param p4, "random"    # Ljava/security/SecureRandom;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/InvalidKeyException;,
            Ljava/security/InvalidAlgorithmParameterException;
        }
    .end annotation

    .prologue
    .line 142
    instance-of v4, p2, Lorg/bouncycastle/jce/provider/JCEPBEKey;

    if-eqz v4, :cond_4

    move-object v1, p2

    .line 144
    check-cast v1, Lorg/bouncycastle/jce/provider/JCEPBEKey;

    .line 146
    .local v1, "k":Lorg/bouncycastle/jce/provider/JCEPBEKey;
    instance-of v4, p3, Ljavax/crypto/spec/PBEParameterSpec;

    if-eqz v4, :cond_2

    .line 148
    iget-object v4, p0, Lorg/bouncycastle/jce/provider/WrapCipherSpi;->wrapEngine:Lorg/bouncycastle/crypto/Wrapper;

    invoke-interface {v4}, Lorg/bouncycastle/crypto/Wrapper;->getAlgorithmName()Ljava/lang/String;

    move-result-object v4

    invoke-static {v1, p3, v4}, Lorg/bouncycastle/jce/provider/PBE$Util;->makePBEParameters(Lorg/bouncycastle/jce/provider/JCEPBEKey;Ljava/security/spec/AlgorithmParameterSpec;Ljava/lang/String;)Lorg/bouncycastle/crypto/CipherParameters;

    move-result-object v2

    .line 164
    .end local v1    # "k":Lorg/bouncycastle/jce/provider/JCEPBEKey;
    .local v2, "param":Lorg/bouncycastle/crypto/CipherParameters;
    :goto_0
    instance-of v4, p3, Ljavax/crypto/spec/IvParameterSpec;

    if-eqz v4, :cond_0

    move-object v0, p3

    .line 166
    check-cast v0, Ljavax/crypto/spec/IvParameterSpec;

    .line 167
    .local v0, "iv":Ljavax/crypto/spec/IvParameterSpec;
    new-instance v3, Lorg/bouncycastle/crypto/params/ParametersWithIV;

    invoke-virtual {v0}, Ljavax/crypto/spec/IvParameterSpec;->getIV()[B

    move-result-object v4

    invoke-direct {v3, v2, v4}, Lorg/bouncycastle/crypto/params/ParametersWithIV;-><init>(Lorg/bouncycastle/crypto/CipherParameters;[B)V

    .end local v2    # "param":Lorg/bouncycastle/crypto/CipherParameters;
    .local v3, "param":Lorg/bouncycastle/crypto/CipherParameters;
    move-object v2, v3

    .line 170
    .end local v0    # "iv":Ljavax/crypto/spec/IvParameterSpec;
    .end local v3    # "param":Lorg/bouncycastle/crypto/CipherParameters;
    .restart local v2    # "param":Lorg/bouncycastle/crypto/CipherParameters;
    :cond_0
    instance-of v4, v2, Lorg/bouncycastle/crypto/params/KeyParameter;

    if-eqz v4, :cond_1

    iget v4, p0, Lorg/bouncycastle/jce/provider/WrapCipherSpi;->ivSize:I

    if-eqz v4, :cond_1

    .line 172
    iget v4, p0, Lorg/bouncycastle/jce/provider/WrapCipherSpi;->ivSize:I

    new-array v4, v4, [B

    iput-object v4, p0, Lorg/bouncycastle/jce/provider/WrapCipherSpi;->iv:[B

    .line 173
    iget-object v4, p0, Lorg/bouncycastle/jce/provider/WrapCipherSpi;->iv:[B

    invoke-virtual {p4, v4}, Ljava/security/SecureRandom;->nextBytes([B)V

    .line 174
    new-instance v3, Lorg/bouncycastle/crypto/params/ParametersWithIV;

    iget-object v4, p0, Lorg/bouncycastle/jce/provider/WrapCipherSpi;->iv:[B

    invoke-direct {v3, v2, v4}, Lorg/bouncycastle/crypto/params/ParametersWithIV;-><init>(Lorg/bouncycastle/crypto/CipherParameters;[B)V

    .end local v2    # "param":Lorg/bouncycastle/crypto/CipherParameters;
    .restart local v3    # "param":Lorg/bouncycastle/crypto/CipherParameters;
    move-object v2, v3

    .line 177
    .end local v3    # "param":Lorg/bouncycastle/crypto/CipherParameters;
    .restart local v2    # "param":Lorg/bouncycastle/crypto/CipherParameters;
    :cond_1
    packed-switch p1, :pswitch_data_0

    .line 189
    sget-object v4, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v5, "eeek!"

    invoke-virtual {v4, v5}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 191
    :goto_1
    return-void

    .line 150
    .end local v2    # "param":Lorg/bouncycastle/crypto/CipherParameters;
    .restart local v1    # "k":Lorg/bouncycastle/jce/provider/JCEPBEKey;
    :cond_2
    invoke-virtual {v1}, Lorg/bouncycastle/jce/provider/JCEPBEKey;->getParam()Lorg/bouncycastle/crypto/CipherParameters;

    move-result-object v4

    if-eqz v4, :cond_3

    .line 152
    invoke-virtual {v1}, Lorg/bouncycastle/jce/provider/JCEPBEKey;->getParam()Lorg/bouncycastle/crypto/CipherParameters;

    move-result-object v2

    .restart local v2    # "param":Lorg/bouncycastle/crypto/CipherParameters;
    goto :goto_0

    .line 156
    .end local v2    # "param":Lorg/bouncycastle/crypto/CipherParameters;
    :cond_3
    new-instance v4, Ljava/security/InvalidAlgorithmParameterException;

    const-string v5, "PBE requires PBE parameters to be set."

    invoke-direct {v4, v5}, Ljava/security/InvalidAlgorithmParameterException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 161
    .end local v1    # "k":Lorg/bouncycastle/jce/provider/JCEPBEKey;
    :cond_4
    new-instance v2, Lorg/bouncycastle/crypto/params/KeyParameter;

    invoke-interface {p2}, Ljava/security/Key;->getEncoded()[B

    move-result-object v4

    invoke-direct {v2, v4}, Lorg/bouncycastle/crypto/params/KeyParameter;-><init>([B)V

    .restart local v2    # "param":Lorg/bouncycastle/crypto/CipherParameters;
    goto :goto_0

    .line 180
    :pswitch_0
    iget-object v4, p0, Lorg/bouncycastle/jce/provider/WrapCipherSpi;->wrapEngine:Lorg/bouncycastle/crypto/Wrapper;

    const/4 v5, 0x1

    invoke-interface {v4, v5, v2}, Lorg/bouncycastle/crypto/Wrapper;->init(ZLorg/bouncycastle/crypto/CipherParameters;)V

    goto :goto_1

    .line 183
    :pswitch_1
    iget-object v4, p0, Lorg/bouncycastle/jce/provider/WrapCipherSpi;->wrapEngine:Lorg/bouncycastle/crypto/Wrapper;

    const/4 v5, 0x0

    invoke-interface {v4, v5, v2}, Lorg/bouncycastle/crypto/Wrapper;->init(ZLorg/bouncycastle/crypto/CipherParameters;)V

    goto :goto_1

    .line 187
    :pswitch_2
    new-instance v4, Ljava/lang/IllegalArgumentException;

    const-string v5, "engine only valid for wrapping"

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 177
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_2
        :pswitch_2
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method protected engineSetMode(Ljava/lang/String;)V
    .locals 3
    .param p1, "mode"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/NoSuchAlgorithmException;
        }
    .end annotation

    .prologue
    .line 123
    new-instance v0, Ljava/security/NoSuchAlgorithmException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "can\'t support mode "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/security/NoSuchAlgorithmException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method protected engineSetPadding(Ljava/lang/String;)V
    .locals 3
    .param p1, "padding"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/crypto/NoSuchPaddingException;
        }
    .end annotation

    .prologue
    .line 130
    new-instance v0, Ljavax/crypto/NoSuchPaddingException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Padding "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " unknown."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljavax/crypto/NoSuchPaddingException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method protected engineUnwrap([BLjava/lang/String;I)Ljava/security/Key;
    .locals 7
    .param p1, "wrappedKey"    # [B
    .param p2, "wrappedKeyAlgorithm"    # Ljava/lang/String;
    .param p3, "wrappedKeyType"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/InvalidKeyException;
        }
    .end annotation

    .prologue
    .line 319
    :try_start_0
    iget-object v4, p0, Lorg/bouncycastle/jce/provider/WrapCipherSpi;->wrapEngine:Lorg/bouncycastle/crypto/Wrapper;

    if-nez v4, :cond_0

    .line 321
    const/4 v4, 0x0

    array-length v5, p1

    invoke-virtual {p0, p1, v4, v5}, Lorg/bouncycastle/jce/provider/WrapCipherSpi;->engineDoFinal([BII)[B
    :try_end_0
    .catch Lorg/bouncycastle/crypto/InvalidCipherTextException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljavax/crypto/BadPaddingException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljavax/crypto/IllegalBlockSizeException; {:try_start_0 .. :try_end_0} :catch_2

    move-result-object v2

    .line 341
    .local v2, "encoded":[B
    :goto_0
    const/4 v4, 0x3

    if-ne p3, v4, :cond_1

    .line 343
    new-instance v4, Ljavax/crypto/spec/SecretKeySpec;

    invoke-direct {v4, v2, p2}, Ljavax/crypto/spec/SecretKeySpec;-><init>([BLjava/lang/String;)V

    .line 408
    :goto_1
    return-object v4

    .line 325
    .end local v2    # "encoded":[B
    :cond_0
    :try_start_1
    iget-object v4, p0, Lorg/bouncycastle/jce/provider/WrapCipherSpi;->wrapEngine:Lorg/bouncycastle/crypto/Wrapper;

    const/4 v5, 0x0

    array-length v6, p1

    invoke-interface {v4, p1, v5, v6}, Lorg/bouncycastle/crypto/Wrapper;->unwrap([BII)[B
    :try_end_1
    .catch Lorg/bouncycastle/crypto/InvalidCipherTextException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljavax/crypto/BadPaddingException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljavax/crypto/IllegalBlockSizeException; {:try_start_1 .. :try_end_1} :catch_2

    move-result-object v2

    .restart local v2    # "encoded":[B
    goto :goto_0

    .line 328
    .end local v2    # "encoded":[B
    :catch_0
    move-exception v0

    .line 330
    .local v0, "e":Lorg/bouncycastle/crypto/InvalidCipherTextException;
    new-instance v4, Ljava/security/InvalidKeyException;

    invoke-virtual {v0}, Lorg/bouncycastle/crypto/InvalidCipherTextException;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/security/InvalidKeyException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 332
    .end local v0    # "e":Lorg/bouncycastle/crypto/InvalidCipherTextException;
    :catch_1
    move-exception v0

    .line 334
    .local v0, "e":Ljavax/crypto/BadPaddingException;
    new-instance v4, Ljava/security/InvalidKeyException;

    invoke-virtual {v0}, Ljavax/crypto/BadPaddingException;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/security/InvalidKeyException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 336
    .end local v0    # "e":Ljavax/crypto/BadPaddingException;
    :catch_2
    move-exception v1

    .line 338
    .local v1, "e2":Ljavax/crypto/IllegalBlockSizeException;
    new-instance v4, Ljava/security/InvalidKeyException;

    invoke-virtual {v1}, Ljavax/crypto/IllegalBlockSizeException;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/security/InvalidKeyException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 401
    .end local v1    # "e2":Ljavax/crypto/IllegalBlockSizeException;
    .restart local v2    # "encoded":[B
    :cond_1
    :try_start_2
    const-string v4, "BC"

    invoke-static {p2, v4}, Ljava/security/KeyFactory;->getInstance(Ljava/lang/String;Ljava/lang/String;)Ljava/security/KeyFactory;

    move-result-object v3

    .line 402
    .local v3, "kf":Ljava/security/KeyFactory;
    const/4 v4, 0x1

    if-ne p3, v4, :cond_2

    .line 404
    new-instance v4, Ljava/security/spec/X509EncodedKeySpec;

    invoke-direct {v4, v2}, Ljava/security/spec/X509EncodedKeySpec;-><init>([B)V

    invoke-virtual {v3, v4}, Ljava/security/KeyFactory;->generatePublic(Ljava/security/spec/KeySpec;)Ljava/security/PublicKey;

    move-result-object v4

    goto :goto_1

    .line 406
    :cond_2
    const/4 v4, 0x2

    if-ne p3, v4, :cond_3

    .line 408
    new-instance v4, Ljava/security/spec/PKCS8EncodedKeySpec;

    invoke-direct {v4, v2}, Ljava/security/spec/PKCS8EncodedKeySpec;-><init>([B)V

    invoke-virtual {v3, v4}, Ljava/security/KeyFactory;->generatePrivate(Ljava/security/spec/KeySpec;)Ljava/security/PrivateKey;
    :try_end_2
    .catch Ljava/security/NoSuchProviderException; {:try_start_2 .. :try_end_2} :catch_3
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_2 .. :try_end_2} :catch_4
    .catch Ljava/security/spec/InvalidKeySpecException; {:try_start_2 .. :try_end_2} :catch_5

    move-result-object v4

    goto :goto_1

    .line 411
    .end local v3    # "kf":Ljava/security/KeyFactory;
    :catch_3
    move-exception v0

    .line 413
    .local v0, "e":Ljava/security/NoSuchProviderException;
    new-instance v4, Ljava/security/InvalidKeyException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Unknown key type "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v0}, Ljava/security/NoSuchProviderException;->getMessage()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/security/InvalidKeyException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 415
    .end local v0    # "e":Ljava/security/NoSuchProviderException;
    :catch_4
    move-exception v0

    .line 417
    .local v0, "e":Ljava/security/NoSuchAlgorithmException;
    new-instance v4, Ljava/security/InvalidKeyException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Unknown key type "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v0}, Ljava/security/NoSuchAlgorithmException;->getMessage()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/security/InvalidKeyException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 419
    .end local v0    # "e":Ljava/security/NoSuchAlgorithmException;
    :catch_5
    move-exception v1

    .line 421
    .local v1, "e2":Ljava/security/spec/InvalidKeySpecException;
    new-instance v4, Ljava/security/InvalidKeyException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Unknown key type "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v1}, Ljava/security/spec/InvalidKeySpecException;->getMessage()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/security/InvalidKeyException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 424
    .end local v1    # "e2":Ljava/security/spec/InvalidKeySpecException;
    .restart local v3    # "kf":Ljava/security/KeyFactory;
    :cond_3
    new-instance v4, Ljava/security/InvalidKeyException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Unknown key type "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/security/InvalidKeyException;-><init>(Ljava/lang/String;)V

    throw v4
.end method

.method protected engineUpdate([BII[BI)I
    .locals 2
    .param p1, "input"    # [B
    .param p2, "inputOffset"    # I
    .param p3, "inputLen"    # I
    .param p4, "output"    # [B
    .param p5, "outputOffset"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/crypto/ShortBufferException;
        }
    .end annotation

    .prologue
    .line 260
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "not supported for wrapping"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method protected engineUpdate([BII)[B
    .locals 2
    .param p1, "input"    # [B
    .param p2, "inputOffset"    # I
    .param p3, "inputLen"    # I

    .prologue
    .line 249
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "not supported for wrapping"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method protected engineWrap(Ljava/security/Key;)[B
    .locals 5
    .param p1, "key"    # Ljava/security/Key;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/crypto/IllegalBlockSizeException;,
            Ljava/security/InvalidKeyException;
        }
    .end annotation

    .prologue
    .line 287
    invoke-interface {p1}, Ljava/security/Key;->getEncoded()[B

    move-result-object v1

    .line 288
    .local v1, "encoded":[B
    if-nez v1, :cond_0

    .line 290
    new-instance v2, Ljava/security/InvalidKeyException;

    const-string v3, "Cannot wrap key, null encoding."

    invoke-direct {v2, v3}, Ljava/security/InvalidKeyException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 295
    :cond_0
    :try_start_0
    iget-object v2, p0, Lorg/bouncycastle/jce/provider/WrapCipherSpi;->wrapEngine:Lorg/bouncycastle/crypto/Wrapper;

    if-nez v2, :cond_1

    .line 297
    const/4 v2, 0x0

    array-length v3, v1

    invoke-virtual {p0, v1, v2, v3}, Lorg/bouncycastle/jce/provider/WrapCipherSpi;->engineDoFinal([BII)[B

    move-result-object v2

    .line 301
    :goto_0
    return-object v2

    :cond_1
    iget-object v2, p0, Lorg/bouncycastle/jce/provider/WrapCipherSpi;->wrapEngine:Lorg/bouncycastle/crypto/Wrapper;

    const/4 v3, 0x0

    array-length v4, v1

    invoke-interface {v2, v1, v3, v4}, Lorg/bouncycastle/crypto/Wrapper;->wrap([BII)[B
    :try_end_0
    .catch Ljavax/crypto/BadPaddingException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    goto :goto_0

    .line 304
    :catch_0
    move-exception v0

    .line 306
    .local v0, "e":Ljavax/crypto/BadPaddingException;
    new-instance v2, Ljavax/crypto/IllegalBlockSizeException;

    invoke-virtual {v0}, Ljavax/crypto/BadPaddingException;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljavax/crypto/IllegalBlockSizeException;-><init>(Ljava/lang/String;)V

    throw v2
.end method
