.class public Lorg/bouncycastle/jce/provider/JCEStreamCipher;
.super Lorg/bouncycastle/jce/provider/WrapCipherSpi;
.source "JCEStreamCipher.java"

# interfaces
.implements Lorg/bouncycastle/jce/provider/PBE;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/bouncycastle/jce/provider/JCEStreamCipher$Salsa20;,
        Lorg/bouncycastle/jce/provider/JCEStreamCipher$Twofish_OFB8;,
        Lorg/bouncycastle/jce/provider/JCEStreamCipher$Twofish_CFB8;
    }
.end annotation


# instance fields
.field private availableSpecs:[Ljava/lang/Class;

.field private cipher:Lorg/bouncycastle/crypto/StreamCipher;

.field private ivLength:I

.field private ivParam:Lorg/bouncycastle/crypto/params/ParametersWithIV;

.field private pbeAlgorithm:Ljava/lang/String;

.field private pbeSpec:Ljavax/crypto/spec/PBEParameterSpec;


# direct methods
.method protected constructor <init>(Lorg/bouncycastle/crypto/BlockCipher;I)V
    .locals 5
    .param p1, "engine"    # Lorg/bouncycastle/crypto/BlockCipher;
    .param p2, "ivLength"    # I

    .prologue
    const/4 v4, 0x0

    const/4 v3, 0x0

    .line 73
    invoke-direct {p0}, Lorg/bouncycastle/jce/provider/WrapCipherSpi;-><init>()V

    .line 46
    const/4 v0, 0x4

    new-array v0, v0, [Ljava/lang/Class;

    const-class v1, Ljavax/crypto/spec/RC2ParameterSpec;

    aput-object v1, v0, v3

    const/4 v1, 0x1

    const-class v2, Ljavax/crypto/spec/RC5ParameterSpec;

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-class v2, Ljavax/crypto/spec/IvParameterSpec;

    aput-object v2, v0, v1

    const/4 v1, 0x3

    const-class v2, Ljavax/crypto/spec/PBEParameterSpec;

    aput-object v2, v0, v1

    iput-object v0, p0, Lorg/bouncycastle/jce/provider/JCEStreamCipher;->availableSpecs:[Ljava/lang/Class;

    .line 57
    iput v3, p0, Lorg/bouncycastle/jce/provider/JCEStreamCipher;->ivLength:I

    .line 59
    iput-object v4, p0, Lorg/bouncycastle/jce/provider/JCEStreamCipher;->pbeSpec:Ljavax/crypto/spec/PBEParameterSpec;

    .line 60
    iput-object v4, p0, Lorg/bouncycastle/jce/provider/JCEStreamCipher;->pbeAlgorithm:Ljava/lang/String;

    .line 74
    iput p2, p0, Lorg/bouncycastle/jce/provider/JCEStreamCipher;->ivLength:I

    .line 76
    new-instance v0, Lorg/bouncycastle/crypto/StreamBlockCipher;

    invoke-direct {v0, p1}, Lorg/bouncycastle/crypto/StreamBlockCipher;-><init>(Lorg/bouncycastle/crypto/BlockCipher;)V

    iput-object v0, p0, Lorg/bouncycastle/jce/provider/JCEStreamCipher;->cipher:Lorg/bouncycastle/crypto/StreamCipher;

    .line 77
    return-void
.end method

.method protected constructor <init>(Lorg/bouncycastle/crypto/StreamCipher;I)V
    .locals 5
    .param p1, "engine"    # Lorg/bouncycastle/crypto/StreamCipher;
    .param p2, "ivLength"    # I

    .prologue
    const/4 v4, 0x0

    const/4 v3, 0x0

    .line 65
    invoke-direct {p0}, Lorg/bouncycastle/jce/provider/WrapCipherSpi;-><init>()V

    .line 46
    const/4 v0, 0x4

    new-array v0, v0, [Ljava/lang/Class;

    const-class v1, Ljavax/crypto/spec/RC2ParameterSpec;

    aput-object v1, v0, v3

    const/4 v1, 0x1

    const-class v2, Ljavax/crypto/spec/RC5ParameterSpec;

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-class v2, Ljavax/crypto/spec/IvParameterSpec;

    aput-object v2, v0, v1

    const/4 v1, 0x3

    const-class v2, Ljavax/crypto/spec/PBEParameterSpec;

    aput-object v2, v0, v1

    iput-object v0, p0, Lorg/bouncycastle/jce/provider/JCEStreamCipher;->availableSpecs:[Ljava/lang/Class;

    .line 57
    iput v3, p0, Lorg/bouncycastle/jce/provider/JCEStreamCipher;->ivLength:I

    .line 59
    iput-object v4, p0, Lorg/bouncycastle/jce/provider/JCEStreamCipher;->pbeSpec:Ljavax/crypto/spec/PBEParameterSpec;

    .line 60
    iput-object v4, p0, Lorg/bouncycastle/jce/provider/JCEStreamCipher;->pbeAlgorithm:Ljava/lang/String;

    .line 66
    iput-object p1, p0, Lorg/bouncycastle/jce/provider/JCEStreamCipher;->cipher:Lorg/bouncycastle/crypto/StreamCipher;

    .line 67
    iput p2, p0, Lorg/bouncycastle/jce/provider/JCEStreamCipher;->ivLength:I

    .line 68
    return-void
.end method


# virtual methods
.method protected engineDoFinal([BII[BI)I
    .locals 6
    .param p1, "input"    # [B
    .param p2, "inputOffset"    # I
    .param p3, "inputLen"    # I
    .param p4, "output"    # [B
    .param p5, "outputOffset"    # I

    .prologue
    .line 364
    if-eqz p3, :cond_0

    .line 366
    iget-object v0, p0, Lorg/bouncycastle/jce/provider/JCEStreamCipher;->cipher:Lorg/bouncycastle/crypto/StreamCipher;

    move-object v1, p1

    move v2, p2

    move v3, p3

    move-object v4, p4

    move v5, p5

    invoke-interface/range {v0 .. v5}, Lorg/bouncycastle/crypto/StreamCipher;->processBytes([BII[BI)V

    .line 369
    :cond_0
    iget-object v0, p0, Lorg/bouncycastle/jce/provider/JCEStreamCipher;->cipher:Lorg/bouncycastle/crypto/StreamCipher;

    invoke-interface {v0}, Lorg/bouncycastle/crypto/StreamCipher;->reset()V

    .line 371
    return p3
.end method

.method protected engineDoFinal([BII)[B
    .locals 2
    .param p1, "input"    # [B
    .param p2, "inputOffset"    # I
    .param p3, "inputLen"    # I

    .prologue
    .line 343
    if-eqz p3, :cond_0

    .line 345
    invoke-virtual {p0, p1, p2, p3}, Lorg/bouncycastle/jce/provider/JCEStreamCipher;->engineUpdate([BII)[B

    move-result-object v0

    .line 347
    .local v0, "out":[B
    iget-object v1, p0, Lorg/bouncycastle/jce/provider/JCEStreamCipher;->cipher:Lorg/bouncycastle/crypto/StreamCipher;

    invoke-interface {v1}, Lorg/bouncycastle/crypto/StreamCipher;->reset()V

    .line 354
    .end local v0    # "out":[B
    :goto_0
    return-object v0

    .line 352
    :cond_0
    iget-object v1, p0, Lorg/bouncycastle/jce/provider/JCEStreamCipher;->cipher:Lorg/bouncycastle/crypto/StreamCipher;

    invoke-interface {v1}, Lorg/bouncycastle/crypto/StreamCipher;->reset()V

    .line 354
    const/4 v1, 0x0

    new-array v0, v1, [B

    goto :goto_0
.end method

.method protected engineGetBlockSize()I
    .locals 1

    .prologue
    .line 81
    const/4 v0, 0x0

    return v0
.end method

.method protected engineGetIV()[B
    .locals 1

    .prologue
    .line 86
    iget-object v0, p0, Lorg/bouncycastle/jce/provider/JCEStreamCipher;->ivParam:Lorg/bouncycastle/crypto/params/ParametersWithIV;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/bouncycastle/jce/provider/JCEStreamCipher;->ivParam:Lorg/bouncycastle/crypto/params/ParametersWithIV;

    invoke-virtual {v0}, Lorg/bouncycastle/crypto/params/ParametersWithIV;->getIV()[B

    move-result-object v0

    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method protected engineGetKeySize(Ljava/security/Key;)I
    .locals 1
    .param p1, "key"    # Ljava/security/Key;

    .prologue
    .line 92
    invoke-interface {p1}, Ljava/security/Key;->getEncoded()[B

    move-result-object v0

    array-length v0, v0

    mul-int/lit8 v0, v0, 0x8

    return v0
.end method

.method protected engineGetOutputSize(I)I
    .locals 0
    .param p1, "inputLen"    # I

    .prologue
    .line 98
    return p1
.end method

.method protected engineGetParameters()Ljava/security/AlgorithmParameters;
    .locals 4

    .prologue
    .line 103
    iget-object v2, p0, Lorg/bouncycastle/jce/provider/JCEStreamCipher;->engineParams:Ljava/security/AlgorithmParameters;

    if-nez v2, :cond_0

    .line 105
    iget-object v2, p0, Lorg/bouncycastle/jce/provider/JCEStreamCipher;->pbeSpec:Ljavax/crypto/spec/PBEParameterSpec;

    if-eqz v2, :cond_0

    .line 109
    :try_start_0
    iget-object v2, p0, Lorg/bouncycastle/jce/provider/JCEStreamCipher;->pbeAlgorithm:Ljava/lang/String;

    const-string v3, "BC"

    invoke-static {v2, v3}, Ljava/security/AlgorithmParameters;->getInstance(Ljava/lang/String;Ljava/lang/String;)Ljava/security/AlgorithmParameters;

    move-result-object v1

    .line 110
    .local v1, "engineParams":Ljava/security/AlgorithmParameters;
    iget-object v2, p0, Lorg/bouncycastle/jce/provider/JCEStreamCipher;->pbeSpec:Ljavax/crypto/spec/PBEParameterSpec;

    invoke-virtual {v1, v2}, Ljava/security/AlgorithmParameters;->init(Ljava/security/spec/AlgorithmParameterSpec;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 121
    .end local v1    # "engineParams":Ljava/security/AlgorithmParameters;
    :goto_0
    return-object v1

    .line 114
    :catch_0
    move-exception v0

    .line 116
    .local v0, "e":Ljava/lang/Exception;
    const/4 v1, 0x0

    goto :goto_0

    .line 121
    .end local v0    # "e":Ljava/lang/Exception;
    :cond_0
    iget-object v1, p0, Lorg/bouncycastle/jce/provider/JCEStreamCipher;->engineParams:Ljava/security/AlgorithmParameters;

    goto :goto_0
.end method

.method protected engineInit(ILjava/security/Key;Ljava/security/AlgorithmParameters;Ljava/security/SecureRandom;)V
    .locals 6
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
    .line 263
    const/4 v2, 0x0

    .line 265
    .local v2, "paramSpec":Ljava/security/spec/AlgorithmParameterSpec;
    if-eqz p3, :cond_1

    .line 267
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    iget-object v3, p0, Lorg/bouncycastle/jce/provider/JCEStreamCipher;->availableSpecs:[Ljava/lang/Class;

    array-length v3, v3

    if-eq v1, v3, :cond_0

    .line 271
    :try_start_0
    iget-object v3, p0, Lorg/bouncycastle/jce/provider/JCEStreamCipher;->availableSpecs:[Ljava/lang/Class;

    aget-object v3, v3, v1

    invoke-virtual {p3, v3}, Ljava/security/AlgorithmParameters;->getParameterSpec(Ljava/lang/Class;)Ljava/security/spec/AlgorithmParameterSpec;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    .line 280
    :cond_0
    if-nez v2, :cond_1

    .line 282
    new-instance v3, Ljava/security/InvalidAlgorithmParameterException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "can\'t handle parameter "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {p3}, Ljava/security/AlgorithmParameters;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/security/InvalidAlgorithmParameterException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 274
    :catch_0
    move-exception v0

    .line 267
    .local v0, "e":Ljava/lang/Exception;
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 286
    .end local v0    # "e":Ljava/lang/Exception;
    .end local v1    # "i":I
    :cond_1
    invoke-virtual {p0, p1, p2, v2, p4}, Lorg/bouncycastle/jce/provider/JCEStreamCipher;->engineInit(ILjava/security/Key;Ljava/security/spec/AlgorithmParameterSpec;Ljava/security/SecureRandom;)V

    .line 287
    iput-object p3, p0, Lorg/bouncycastle/jce/provider/JCEStreamCipher;->engineParams:Ljava/security/AlgorithmParameters;

    .line 288
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
    .line 298
    const/4 v1, 0x0

    :try_start_0
    check-cast v1, Ljava/security/spec/AlgorithmParameterSpec;

    invoke-virtual {p0, p1, p2, v1, p3}, Lorg/bouncycastle/jce/provider/JCEStreamCipher;->engineInit(ILjava/security/Key;Ljava/security/spec/AlgorithmParameterSpec;Ljava/security/SecureRandom;)V
    :try_end_0
    .catch Ljava/security/InvalidAlgorithmParameterException; {:try_start_0 .. :try_end_0} :catch_0

    .line 304
    return-void

    .line 300
    :catch_0
    move-exception v0

    .line 302
    .local v0, "e":Ljava/security/InvalidAlgorithmParameterException;
    new-instance v1, Ljava/security/InvalidKeyException;

    invoke-virtual {v0}, Ljava/security/InvalidAlgorithmParameterException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/security/InvalidKeyException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method protected engineInit(ILjava/security/Key;Ljava/security/spec/AlgorithmParameterSpec;Ljava/security/SecureRandom;)V
    .locals 9
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
    const/4 v8, 0x1

    const/4 v5, 0x0

    .line 158
    iput-object v5, p0, Lorg/bouncycastle/jce/provider/JCEStreamCipher;->pbeSpec:Ljavax/crypto/spec/PBEParameterSpec;

    .line 159
    iput-object v5, p0, Lorg/bouncycastle/jce/provider/JCEStreamCipher;->pbeAlgorithm:Ljava/lang/String;

    .line 161
    iput-object v5, p0, Lorg/bouncycastle/jce/provider/JCEStreamCipher;->engineParams:Ljava/security/AlgorithmParameters;

    .line 166
    instance-of v5, p2, Ljavax/crypto/SecretKey;

    if-nez v5, :cond_0

    .line 168
    new-instance v5, Ljava/security/InvalidKeyException;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Key for algorithm "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-interface {p2}, Ljava/security/Key;->getAlgorithm()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " not suitable for symmetric enryption."

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/security/InvalidKeyException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 171
    :cond_0
    instance-of v5, p2, Lorg/bouncycastle/jce/provider/JCEPBEKey;

    if-eqz v5, :cond_8

    move-object v2, p2

    .line 173
    check-cast v2, Lorg/bouncycastle/jce/provider/JCEPBEKey;

    .line 175
    .local v2, "k":Lorg/bouncycastle/jce/provider/JCEPBEKey;
    invoke-virtual {v2}, Lorg/bouncycastle/jce/provider/JCEPBEKey;->getOID()Lorg/bouncycastle/asn1/DERObjectIdentifier;

    move-result-object v5

    if-eqz v5, :cond_5

    .line 177
    invoke-virtual {v2}, Lorg/bouncycastle/jce/provider/JCEPBEKey;->getOID()Lorg/bouncycastle/asn1/DERObjectIdentifier;

    move-result-object v5

    invoke-virtual {v5}, Lorg/bouncycastle/asn1/DERObjectIdentifier;->getId()Ljava/lang/String;

    move-result-object v5

    iput-object v5, p0, Lorg/bouncycastle/jce/provider/JCEStreamCipher;->pbeAlgorithm:Ljava/lang/String;

    .line 184
    :goto_0
    invoke-virtual {v2}, Lorg/bouncycastle/jce/provider/JCEPBEKey;->getParam()Lorg/bouncycastle/crypto/CipherParameters;

    move-result-object v5

    if-eqz v5, :cond_6

    .line 186
    invoke-virtual {v2}, Lorg/bouncycastle/jce/provider/JCEPBEKey;->getParam()Lorg/bouncycastle/crypto/CipherParameters;

    move-result-object v3

    .line 187
    .local v3, "param":Lorg/bouncycastle/crypto/CipherParameters;
    new-instance v5, Ljavax/crypto/spec/PBEParameterSpec;

    invoke-virtual {v2}, Lorg/bouncycastle/jce/provider/JCEPBEKey;->getSalt()[B

    move-result-object v6

    invoke-virtual {v2}, Lorg/bouncycastle/jce/provider/JCEPBEKey;->getIterationCount()I

    move-result v7

    invoke-direct {v5, v6, v7}, Ljavax/crypto/spec/PBEParameterSpec;-><init>([BI)V

    iput-object v5, p0, Lorg/bouncycastle/jce/provider/JCEStreamCipher;->pbeSpec:Ljavax/crypto/spec/PBEParameterSpec;

    .line 199
    .end local p3    # "params":Ljava/security/spec/AlgorithmParameterSpec;
    :goto_1
    invoke-virtual {v2}, Lorg/bouncycastle/jce/provider/JCEPBEKey;->getIvSize()I

    move-result v5

    if-eqz v5, :cond_1

    move-object v5, v3

    .line 201
    check-cast v5, Lorg/bouncycastle/crypto/params/ParametersWithIV;

    iput-object v5, p0, Lorg/bouncycastle/jce/provider/JCEStreamCipher;->ivParam:Lorg/bouncycastle/crypto/params/ParametersWithIV;

    .line 218
    .end local v2    # "k":Lorg/bouncycastle/jce/provider/JCEPBEKey;
    :cond_1
    :goto_2
    iget v5, p0, Lorg/bouncycastle/jce/provider/JCEStreamCipher;->ivLength:I

    if-eqz v5, :cond_4

    instance-of v5, v3, Lorg/bouncycastle/crypto/params/ParametersWithIV;

    if-nez v5, :cond_4

    .line 220
    move-object v1, p4

    .line 222
    .local v1, "ivRandom":Ljava/security/SecureRandom;
    if-nez v1, :cond_2

    .line 224
    new-instance v1, Ljava/security/SecureRandom;

    .end local v1    # "ivRandom":Ljava/security/SecureRandom;
    invoke-direct {v1}, Ljava/security/SecureRandom;-><init>()V

    .line 227
    .restart local v1    # "ivRandom":Ljava/security/SecureRandom;
    :cond_2
    if-eq p1, v8, :cond_3

    const/4 v5, 0x3

    if-ne p1, v5, :cond_b

    .line 229
    :cond_3
    iget v5, p0, Lorg/bouncycastle/jce/provider/JCEStreamCipher;->ivLength:I

    new-array v0, v5, [B

    .line 231
    .local v0, "iv":[B
    invoke-virtual {v1, v0}, Ljava/security/SecureRandom;->nextBytes([B)V

    .line 232
    new-instance v4, Lorg/bouncycastle/crypto/params/ParametersWithIV;

    invoke-direct {v4, v3, v0}, Lorg/bouncycastle/crypto/params/ParametersWithIV;-><init>(Lorg/bouncycastle/crypto/CipherParameters;[B)V

    .end local v3    # "param":Lorg/bouncycastle/crypto/CipherParameters;
    .local v4, "param":Lorg/bouncycastle/crypto/CipherParameters;
    move-object v5, v4

    .line 233
    check-cast v5, Lorg/bouncycastle/crypto/params/ParametersWithIV;

    iput-object v5, p0, Lorg/bouncycastle/jce/provider/JCEStreamCipher;->ivParam:Lorg/bouncycastle/crypto/params/ParametersWithIV;

    move-object v3, v4

    .line 241
    .end local v0    # "iv":[B
    .end local v1    # "ivRandom":Ljava/security/SecureRandom;
    .end local v4    # "param":Lorg/bouncycastle/crypto/CipherParameters;
    .restart local v3    # "param":Lorg/bouncycastle/crypto/CipherParameters;
    :cond_4
    packed-switch p1, :pswitch_data_0

    .line 252
    sget-object v5, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v6, "eeek!"

    invoke-virtual {v5, v6}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 254
    :goto_3
    return-void

    .line 181
    .end local v3    # "param":Lorg/bouncycastle/crypto/CipherParameters;
    .restart local v2    # "k":Lorg/bouncycastle/jce/provider/JCEPBEKey;
    .restart local p3    # "params":Ljava/security/spec/AlgorithmParameterSpec;
    :cond_5
    invoke-virtual {v2}, Lorg/bouncycastle/jce/provider/JCEPBEKey;->getAlgorithm()Ljava/lang/String;

    move-result-object v5

    iput-object v5, p0, Lorg/bouncycastle/jce/provider/JCEStreamCipher;->pbeAlgorithm:Ljava/lang/String;

    goto :goto_0

    .line 189
    :cond_6
    instance-of v5, p3, Ljavax/crypto/spec/PBEParameterSpec;

    if-eqz v5, :cond_7

    .line 191
    iget-object v5, p0, Lorg/bouncycastle/jce/provider/JCEStreamCipher;->cipher:Lorg/bouncycastle/crypto/StreamCipher;

    invoke-interface {v5}, Lorg/bouncycastle/crypto/StreamCipher;->getAlgorithmName()Ljava/lang/String;

    move-result-object v5

    invoke-static {v2, p3, v5}, Lorg/bouncycastle/jce/provider/PBE$Util;->makePBEParameters(Lorg/bouncycastle/jce/provider/JCEPBEKey;Ljava/security/spec/AlgorithmParameterSpec;Ljava/lang/String;)Lorg/bouncycastle/crypto/CipherParameters;

    move-result-object v3

    .line 192
    .restart local v3    # "param":Lorg/bouncycastle/crypto/CipherParameters;
    check-cast p3, Ljavax/crypto/spec/PBEParameterSpec;

    .end local p3    # "params":Ljava/security/spec/AlgorithmParameterSpec;
    iput-object p3, p0, Lorg/bouncycastle/jce/provider/JCEStreamCipher;->pbeSpec:Ljavax/crypto/spec/PBEParameterSpec;

    goto :goto_1

    .line 196
    .end local v3    # "param":Lorg/bouncycastle/crypto/CipherParameters;
    .restart local p3    # "params":Ljava/security/spec/AlgorithmParameterSpec;
    :cond_7
    new-instance v5, Ljava/security/InvalidAlgorithmParameterException;

    const-string v6, "PBE requires PBE parameters to be set."

    invoke-direct {v5, v6}, Ljava/security/InvalidAlgorithmParameterException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 204
    .end local v2    # "k":Lorg/bouncycastle/jce/provider/JCEPBEKey;
    :cond_8
    if-nez p3, :cond_9

    .line 206
    new-instance v3, Lorg/bouncycastle/crypto/params/KeyParameter;

    invoke-interface {p2}, Ljava/security/Key;->getEncoded()[B

    move-result-object v5

    invoke-direct {v3, v5}, Lorg/bouncycastle/crypto/params/KeyParameter;-><init>([B)V

    .restart local v3    # "param":Lorg/bouncycastle/crypto/CipherParameters;
    goto :goto_2

    .line 208
    .end local v3    # "param":Lorg/bouncycastle/crypto/CipherParameters;
    :cond_9
    instance-of v5, p3, Ljavax/crypto/spec/IvParameterSpec;

    if-eqz v5, :cond_a

    .line 210
    new-instance v3, Lorg/bouncycastle/crypto/params/ParametersWithIV;

    new-instance v5, Lorg/bouncycastle/crypto/params/KeyParameter;

    invoke-interface {p2}, Ljava/security/Key;->getEncoded()[B

    move-result-object v6

    invoke-direct {v5, v6}, Lorg/bouncycastle/crypto/params/KeyParameter;-><init>([B)V

    check-cast p3, Ljavax/crypto/spec/IvParameterSpec;

    .end local p3    # "params":Ljava/security/spec/AlgorithmParameterSpec;
    invoke-virtual {p3}, Ljavax/crypto/spec/IvParameterSpec;->getIV()[B

    move-result-object v6

    invoke-direct {v3, v5, v6}, Lorg/bouncycastle/crypto/params/ParametersWithIV;-><init>(Lorg/bouncycastle/crypto/CipherParameters;[B)V

    .restart local v3    # "param":Lorg/bouncycastle/crypto/CipherParameters;
    move-object v5, v3

    .line 211
    check-cast v5, Lorg/bouncycastle/crypto/params/ParametersWithIV;

    iput-object v5, p0, Lorg/bouncycastle/jce/provider/JCEStreamCipher;->ivParam:Lorg/bouncycastle/crypto/params/ParametersWithIV;

    goto :goto_2

    .line 215
    .end local v3    # "param":Lorg/bouncycastle/crypto/CipherParameters;
    .restart local p3    # "params":Ljava/security/spec/AlgorithmParameterSpec;
    :cond_a
    new-instance v5, Ljava/lang/IllegalArgumentException;

    const-string v6, "unknown parameter type."

    invoke-direct {v5, v6}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 237
    .end local p3    # "params":Ljava/security/spec/AlgorithmParameterSpec;
    .restart local v1    # "ivRandom":Ljava/security/SecureRandom;
    .restart local v3    # "param":Lorg/bouncycastle/crypto/CipherParameters;
    :cond_b
    new-instance v5, Ljava/security/InvalidAlgorithmParameterException;

    const-string v6, "no IV set when one expected"

    invoke-direct {v5, v6}, Ljava/security/InvalidAlgorithmParameterException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 245
    .end local v1    # "ivRandom":Ljava/security/SecureRandom;
    :pswitch_0
    iget-object v5, p0, Lorg/bouncycastle/jce/provider/JCEStreamCipher;->cipher:Lorg/bouncycastle/crypto/StreamCipher;

    invoke-interface {v5, v8, v3}, Lorg/bouncycastle/crypto/StreamCipher;->init(ZLorg/bouncycastle/crypto/CipherParameters;)V

    goto :goto_3

    .line 249
    :pswitch_1
    iget-object v5, p0, Lorg/bouncycastle/jce/provider/JCEStreamCipher;->cipher:Lorg/bouncycastle/crypto/StreamCipher;

    const/4 v6, 0x0

    invoke-interface {v5, v6, v3}, Lorg/bouncycastle/crypto/StreamCipher;->init(ZLorg/bouncycastle/crypto/CipherParameters;)V

    goto :goto_3

    .line 241
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method protected engineSetMode(Ljava/lang/String;)V
    .locals 3
    .param p1, "mode"    # Ljava/lang/String;

    .prologue
    .line 130
    const-string v0, "ECB"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 132
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "can\'t support mode "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 134
    :cond_0
    return-void
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
    .line 143
    const-string v0, "NoPadding"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 145
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

    .line 147
    :cond_0
    return-void
.end method

.method protected engineUpdate([BII[BI)I
    .locals 7
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
    .line 328
    :try_start_0
    iget-object v0, p0, Lorg/bouncycastle/jce/provider/JCEStreamCipher;->cipher:Lorg/bouncycastle/crypto/StreamCipher;

    move-object v1, p1

    move v2, p2

    move v3, p3

    move-object v4, p4

    move v5, p5

    invoke-interface/range {v0 .. v5}, Lorg/bouncycastle/crypto/StreamCipher;->processBytes([BII[BI)V
    :try_end_0
    .catch Lorg/bouncycastle/crypto/DataLengthException; {:try_start_0 .. :try_end_0} :catch_0

    .line 330
    return p3

    .line 332
    :catch_0
    move-exception v6

    .line 334
    .local v6, "e":Lorg/bouncycastle/crypto/DataLengthException;
    new-instance v0, Ljavax/crypto/ShortBufferException;

    invoke-virtual {v6}, Lorg/bouncycastle/crypto/DataLengthException;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljavax/crypto/ShortBufferException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method protected engineUpdate([BII)[B
    .locals 6
    .param p1, "input"    # [B
    .param p2, "inputOffset"    # I
    .param p3, "inputLen"    # I

    .prologue
    .line 311
    new-array v4, p3, [B

    .line 313
    .local v4, "out":[B
    iget-object v0, p0, Lorg/bouncycastle/jce/provider/JCEStreamCipher;->cipher:Lorg/bouncycastle/crypto/StreamCipher;

    const/4 v5, 0x0

    move-object v1, p1

    move v2, p2

    move v3, p3

    invoke-interface/range {v0 .. v5}, Lorg/bouncycastle/crypto/StreamCipher;->processBytes([BII[BI)V

    .line 315
    return-object v4
.end method
