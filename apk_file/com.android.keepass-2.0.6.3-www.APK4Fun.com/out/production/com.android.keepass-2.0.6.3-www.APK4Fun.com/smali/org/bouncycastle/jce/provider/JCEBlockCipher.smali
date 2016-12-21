.class public Lorg/bouncycastle/jce/provider/JCEBlockCipher;
.super Lorg/bouncycastle/jce/provider/WrapCipherSpi;
.source "JCEBlockCipher.java"

# interfaces
.implements Lorg/bouncycastle/jce/provider/PBE;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/bouncycastle/jce/provider/JCEBlockCipher$BufferedGenericBlockCipher;,
        Lorg/bouncycastle/jce/provider/JCEBlockCipher$GenericBlockCipher;,
        Lorg/bouncycastle/jce/provider/JCEBlockCipher$PBEWithSHAAndTwofish;,
        Lorg/bouncycastle/jce/provider/JCEBlockCipher$Twofish;
    }
.end annotation


# instance fields
.field private availableSpecs:[Ljava/lang/Class;

.field private baseEngine:Lorg/bouncycastle/crypto/BlockCipher;

.field private cipher:Lorg/bouncycastle/jce/provider/JCEBlockCipher$GenericBlockCipher;

.field private ivLength:I

.field private ivParam:Lorg/bouncycastle/crypto/params/ParametersWithIV;

.field private modeName:Ljava/lang/String;

.field private padded:Z

.field private pbeAlgorithm:Ljava/lang/String;

.field private pbeSpec:Ljavax/crypto/spec/PBEParameterSpec;


# direct methods
.method protected constructor <init>(Lorg/bouncycastle/crypto/BlockCipher;)V
    .locals 5
    .param p1, "engine"    # Lorg/bouncycastle/crypto/BlockCipher;

    .prologue
    const/4 v4, 0x0

    const/4 v3, 0x0

    .line 118
    invoke-direct {p0}, Lorg/bouncycastle/jce/provider/WrapCipherSpi;-><init>()V

    .line 94
    const/4 v0, 0x2

    new-array v0, v0, [Ljava/lang/Class;

    const-class v1, Ljavax/crypto/spec/IvParameterSpec;

    aput-object v1, v0, v4

    const/4 v1, 0x1

    const-class v2, Ljavax/crypto/spec/PBEParameterSpec;

    aput-object v2, v0, v1

    iput-object v0, p0, Lorg/bouncycastle/jce/provider/JCEBlockCipher;->availableSpecs:[Ljava/lang/Class;

    .line 107
    iput v4, p0, Lorg/bouncycastle/jce/provider/JCEBlockCipher;->ivLength:I

    .line 111
    iput-object v3, p0, Lorg/bouncycastle/jce/provider/JCEBlockCipher;->pbeSpec:Ljavax/crypto/spec/PBEParameterSpec;

    .line 112
    iput-object v3, p0, Lorg/bouncycastle/jce/provider/JCEBlockCipher;->pbeAlgorithm:Ljava/lang/String;

    .line 114
    iput-object v3, p0, Lorg/bouncycastle/jce/provider/JCEBlockCipher;->modeName:Ljava/lang/String;

    .line 119
    iput-object p1, p0, Lorg/bouncycastle/jce/provider/JCEBlockCipher;->baseEngine:Lorg/bouncycastle/crypto/BlockCipher;

    .line 121
    new-instance v0, Lorg/bouncycastle/jce/provider/JCEBlockCipher$BufferedGenericBlockCipher;

    invoke-direct {v0, p1}, Lorg/bouncycastle/jce/provider/JCEBlockCipher$BufferedGenericBlockCipher;-><init>(Lorg/bouncycastle/crypto/BlockCipher;)V

    iput-object v0, p0, Lorg/bouncycastle/jce/provider/JCEBlockCipher;->cipher:Lorg/bouncycastle/jce/provider/JCEBlockCipher$GenericBlockCipher;

    .line 122
    return-void
.end method

.method protected constructor <init>(Lorg/bouncycastle/crypto/BlockCipher;I)V
    .locals 5
    .param p1, "engine"    # Lorg/bouncycastle/crypto/BlockCipher;
    .param p2, "ivLength"    # I

    .prologue
    const/4 v4, 0x0

    const/4 v3, 0x0

    .line 127
    invoke-direct {p0}, Lorg/bouncycastle/jce/provider/WrapCipherSpi;-><init>()V

    .line 94
    const/4 v0, 0x2

    new-array v0, v0, [Ljava/lang/Class;

    const-class v1, Ljavax/crypto/spec/IvParameterSpec;

    aput-object v1, v0, v4

    const/4 v1, 0x1

    const-class v2, Ljavax/crypto/spec/PBEParameterSpec;

    aput-object v2, v0, v1

    iput-object v0, p0, Lorg/bouncycastle/jce/provider/JCEBlockCipher;->availableSpecs:[Ljava/lang/Class;

    .line 107
    iput v4, p0, Lorg/bouncycastle/jce/provider/JCEBlockCipher;->ivLength:I

    .line 111
    iput-object v3, p0, Lorg/bouncycastle/jce/provider/JCEBlockCipher;->pbeSpec:Ljavax/crypto/spec/PBEParameterSpec;

    .line 112
    iput-object v3, p0, Lorg/bouncycastle/jce/provider/JCEBlockCipher;->pbeAlgorithm:Ljava/lang/String;

    .line 114
    iput-object v3, p0, Lorg/bouncycastle/jce/provider/JCEBlockCipher;->modeName:Ljava/lang/String;

    .line 128
    iput-object p1, p0, Lorg/bouncycastle/jce/provider/JCEBlockCipher;->baseEngine:Lorg/bouncycastle/crypto/BlockCipher;

    .line 130
    new-instance v0, Lorg/bouncycastle/jce/provider/JCEBlockCipher$BufferedGenericBlockCipher;

    invoke-direct {v0, p1}, Lorg/bouncycastle/jce/provider/JCEBlockCipher$BufferedGenericBlockCipher;-><init>(Lorg/bouncycastle/crypto/BlockCipher;)V

    iput-object v0, p0, Lorg/bouncycastle/jce/provider/JCEBlockCipher;->cipher:Lorg/bouncycastle/jce/provider/JCEBlockCipher$GenericBlockCipher;

    .line 131
    div-int/lit8 v0, p2, 0x8

    iput v0, p0, Lorg/bouncycastle/jce/provider/JCEBlockCipher;->ivLength:I

    .line 132
    return-void
.end method

.method protected constructor <init>(Lorg/bouncycastle/crypto/BufferedBlockCipher;I)V
    .locals 5
    .param p1, "engine"    # Lorg/bouncycastle/crypto/BufferedBlockCipher;
    .param p2, "ivLength"    # I

    .prologue
    const/4 v4, 0x0

    const/4 v3, 0x0

    .line 137
    invoke-direct {p0}, Lorg/bouncycastle/jce/provider/WrapCipherSpi;-><init>()V

    .line 94
    const/4 v0, 0x2

    new-array v0, v0, [Ljava/lang/Class;

    const-class v1, Ljavax/crypto/spec/IvParameterSpec;

    aput-object v1, v0, v4

    const/4 v1, 0x1

    const-class v2, Ljavax/crypto/spec/PBEParameterSpec;

    aput-object v2, v0, v1

    iput-object v0, p0, Lorg/bouncycastle/jce/provider/JCEBlockCipher;->availableSpecs:[Ljava/lang/Class;

    .line 107
    iput v4, p0, Lorg/bouncycastle/jce/provider/JCEBlockCipher;->ivLength:I

    .line 111
    iput-object v3, p0, Lorg/bouncycastle/jce/provider/JCEBlockCipher;->pbeSpec:Ljavax/crypto/spec/PBEParameterSpec;

    .line 112
    iput-object v3, p0, Lorg/bouncycastle/jce/provider/JCEBlockCipher;->pbeAlgorithm:Ljava/lang/String;

    .line 114
    iput-object v3, p0, Lorg/bouncycastle/jce/provider/JCEBlockCipher;->modeName:Ljava/lang/String;

    .line 138
    invoke-virtual {p1}, Lorg/bouncycastle/crypto/BufferedBlockCipher;->getUnderlyingCipher()Lorg/bouncycastle/crypto/BlockCipher;

    move-result-object v0

    iput-object v0, p0, Lorg/bouncycastle/jce/provider/JCEBlockCipher;->baseEngine:Lorg/bouncycastle/crypto/BlockCipher;

    .line 140
    new-instance v0, Lorg/bouncycastle/jce/provider/JCEBlockCipher$BufferedGenericBlockCipher;

    invoke-direct {v0, p1}, Lorg/bouncycastle/jce/provider/JCEBlockCipher$BufferedGenericBlockCipher;-><init>(Lorg/bouncycastle/crypto/BufferedBlockCipher;)V

    iput-object v0, p0, Lorg/bouncycastle/jce/provider/JCEBlockCipher;->cipher:Lorg/bouncycastle/jce/provider/JCEBlockCipher$GenericBlockCipher;

    .line 141
    div-int/lit8 v0, p2, 0x8

    iput v0, p0, Lorg/bouncycastle/jce/provider/JCEBlockCipher;->ivLength:I

    .line 142
    return-void
.end method

.method private isAEADModeName(Ljava/lang/String;)Z
    .locals 1
    .param p1, "modeName"    # Ljava/lang/String;

    .prologue
    .line 758
    const-string v0, "CCM"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "EAX"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "GCM"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method


# virtual methods
.method protected engineDoFinal([BII[BI)I
    .locals 8
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
    .line 734
    const/4 v7, 0x0

    .line 736
    .local v7, "len":I
    if-eqz p3, :cond_0

    .line 738
    iget-object v0, p0, Lorg/bouncycastle/jce/provider/JCEBlockCipher;->cipher:Lorg/bouncycastle/jce/provider/JCEBlockCipher$GenericBlockCipher;

    move-object v1, p1

    move v2, p2

    move v3, p3

    move-object v4, p4

    move v5, p5

    invoke-interface/range {v0 .. v5}, Lorg/bouncycastle/jce/provider/JCEBlockCipher$GenericBlockCipher;->processBytes([BII[BI)I

    move-result v7

    .line 743
    :cond_0
    :try_start_0
    iget-object v0, p0, Lorg/bouncycastle/jce/provider/JCEBlockCipher;->cipher:Lorg/bouncycastle/jce/provider/JCEBlockCipher$GenericBlockCipher;

    add-int v1, p5, v7

    invoke-interface {v0, p4, v1}, Lorg/bouncycastle/jce/provider/JCEBlockCipher$GenericBlockCipher;->doFinal([BI)I
    :try_end_0
    .catch Lorg/bouncycastle/crypto/DataLengthException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Lorg/bouncycastle/crypto/InvalidCipherTextException; {:try_start_0 .. :try_end_0} :catch_1

    move-result v0

    add-int/2addr v0, v7

    return v0

    .line 745
    :catch_0
    move-exception v6

    .line 747
    .local v6, "e":Lorg/bouncycastle/crypto/DataLengthException;
    new-instance v0, Ljavax/crypto/IllegalBlockSizeException;

    invoke-virtual {v6}, Lorg/bouncycastle/crypto/DataLengthException;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljavax/crypto/IllegalBlockSizeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 749
    .end local v6    # "e":Lorg/bouncycastle/crypto/DataLengthException;
    :catch_1
    move-exception v6

    .line 751
    .local v6, "e":Lorg/bouncycastle/crypto/InvalidCipherTextException;
    new-instance v0, Ljavax/crypto/BadPaddingException;

    invoke-virtual {v6}, Lorg/bouncycastle/crypto/InvalidCipherTextException;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljavax/crypto/BadPaddingException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method protected engineDoFinal([BII)[B
    .locals 9
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
    const/4 v5, 0x0

    .line 693
    const/4 v7, 0x0

    .line 694
    .local v7, "len":I
    invoke-virtual {p0, p3}, Lorg/bouncycastle/jce/provider/JCEBlockCipher;->engineGetOutputSize(I)I

    move-result v0

    new-array v4, v0, [B

    .line 696
    .local v4, "tmp":[B
    if-eqz p3, :cond_0

    .line 698
    iget-object v0, p0, Lorg/bouncycastle/jce/provider/JCEBlockCipher;->cipher:Lorg/bouncycastle/jce/provider/JCEBlockCipher$GenericBlockCipher;

    move-object v1, p1

    move v2, p2

    move v3, p3

    invoke-interface/range {v0 .. v5}, Lorg/bouncycastle/jce/provider/JCEBlockCipher$GenericBlockCipher;->processBytes([BII[BI)I

    move-result v7

    .line 703
    :cond_0
    :try_start_0
    iget-object v0, p0, Lorg/bouncycastle/jce/provider/JCEBlockCipher;->cipher:Lorg/bouncycastle/jce/provider/JCEBlockCipher$GenericBlockCipher;

    invoke-interface {v0, v4, v7}, Lorg/bouncycastle/jce/provider/JCEBlockCipher$GenericBlockCipher;->doFinal([BI)I
    :try_end_0
    .catch Lorg/bouncycastle/crypto/DataLengthException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Lorg/bouncycastle/crypto/InvalidCipherTextException; {:try_start_0 .. :try_end_0} :catch_1

    move-result v0

    add-int/2addr v7, v0

    .line 714
    array-length v0, v4

    if-ne v7, v0, :cond_1

    .line 723
    .end local v4    # "tmp":[B
    :goto_0
    return-object v4

    .line 705
    .restart local v4    # "tmp":[B
    :catch_0
    move-exception v6

    .line 707
    .local v6, "e":Lorg/bouncycastle/crypto/DataLengthException;
    new-instance v0, Ljavax/crypto/IllegalBlockSizeException;

    invoke-virtual {v6}, Lorg/bouncycastle/crypto/DataLengthException;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljavax/crypto/IllegalBlockSizeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 709
    .end local v6    # "e":Lorg/bouncycastle/crypto/DataLengthException;
    :catch_1
    move-exception v6

    .line 711
    .local v6, "e":Lorg/bouncycastle/crypto/InvalidCipherTextException;
    new-instance v0, Ljavax/crypto/BadPaddingException;

    invoke-virtual {v6}, Lorg/bouncycastle/crypto/InvalidCipherTextException;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljavax/crypto/BadPaddingException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 719
    .end local v6    # "e":Lorg/bouncycastle/crypto/InvalidCipherTextException;
    :cond_1
    new-array v8, v7, [B

    .line 721
    .local v8, "out":[B
    invoke-static {v4, v5, v8, v5, v7}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    move-object v4, v8

    .line 723
    goto :goto_0
.end method

.method protected engineGetBlockSize()I
    .locals 1

    .prologue
    .line 146
    iget-object v0, p0, Lorg/bouncycastle/jce/provider/JCEBlockCipher;->baseEngine:Lorg/bouncycastle/crypto/BlockCipher;

    invoke-interface {v0}, Lorg/bouncycastle/crypto/BlockCipher;->getBlockSize()I

    move-result v0

    return v0
.end method

.method protected engineGetIV()[B
    .locals 1

    .prologue
    .line 151
    iget-object v0, p0, Lorg/bouncycastle/jce/provider/JCEBlockCipher;->ivParam:Lorg/bouncycastle/crypto/params/ParametersWithIV;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/bouncycastle/jce/provider/JCEBlockCipher;->ivParam:Lorg/bouncycastle/crypto/params/ParametersWithIV;

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
    .line 157
    invoke-interface {p1}, Ljava/security/Key;->getEncoded()[B

    move-result-object v0

    array-length v0, v0

    mul-int/lit8 v0, v0, 0x8

    return v0
.end method

.method protected engineGetOutputSize(I)I
    .locals 1
    .param p1, "inputLen"    # I

    .prologue
    .line 163
    iget-object v0, p0, Lorg/bouncycastle/jce/provider/JCEBlockCipher;->cipher:Lorg/bouncycastle/jce/provider/JCEBlockCipher$GenericBlockCipher;

    invoke-interface {v0, p1}, Lorg/bouncycastle/jce/provider/JCEBlockCipher$GenericBlockCipher;->getOutputSize(I)I

    move-result v0

    return v0
.end method

.method protected engineGetParameters()Ljava/security/AlgorithmParameters;
    .locals 4

    .prologue
    const/16 v3, 0x2f

    .line 168
    iget-object v2, p0, Lorg/bouncycastle/jce/provider/JCEBlockCipher;->engineParams:Ljava/security/AlgorithmParameters;

    if-nez v2, :cond_0

    .line 170
    iget-object v2, p0, Lorg/bouncycastle/jce/provider/JCEBlockCipher;->pbeSpec:Ljavax/crypto/spec/PBEParameterSpec;

    if-eqz v2, :cond_1

    .line 174
    :try_start_0
    iget-object v2, p0, Lorg/bouncycastle/jce/provider/JCEBlockCipher;->pbeAlgorithm:Ljava/lang/String;

    const-string v3, "BC"

    invoke-static {v2, v3}, Ljava/security/AlgorithmParameters;->getInstance(Ljava/lang/String;Ljava/lang/String;)Ljava/security/AlgorithmParameters;

    move-result-object v2

    iput-object v2, p0, Lorg/bouncycastle/jce/provider/JCEBlockCipher;->engineParams:Ljava/security/AlgorithmParameters;

    .line 175
    iget-object v2, p0, Lorg/bouncycastle/jce/provider/JCEBlockCipher;->engineParams:Ljava/security/AlgorithmParameters;

    iget-object v3, p0, Lorg/bouncycastle/jce/provider/JCEBlockCipher;->pbeSpec:Ljavax/crypto/spec/PBEParameterSpec;

    invoke-virtual {v2, v3}, Ljava/security/AlgorithmParameters;->init(Ljava/security/spec/AlgorithmParameterSpec;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 203
    :cond_0
    :goto_0
    iget-object v2, p0, Lorg/bouncycastle/jce/provider/JCEBlockCipher;->engineParams:Ljava/security/AlgorithmParameters;

    :goto_1
    return-object v2

    .line 177
    :catch_0
    move-exception v0

    .line 179
    .local v0, "e":Ljava/lang/Exception;
    const/4 v2, 0x0

    goto :goto_1

    .line 182
    .end local v0    # "e":Ljava/lang/Exception;
    :cond_1
    iget-object v2, p0, Lorg/bouncycastle/jce/provider/JCEBlockCipher;->ivParam:Lorg/bouncycastle/crypto/params/ParametersWithIV;

    if-eqz v2, :cond_0

    .line 184
    iget-object v2, p0, Lorg/bouncycastle/jce/provider/JCEBlockCipher;->cipher:Lorg/bouncycastle/jce/provider/JCEBlockCipher$GenericBlockCipher;

    invoke-interface {v2}, Lorg/bouncycastle/jce/provider/JCEBlockCipher$GenericBlockCipher;->getUnderlyingCipher()Lorg/bouncycastle/crypto/BlockCipher;

    move-result-object v2

    invoke-interface {v2}, Lorg/bouncycastle/crypto/BlockCipher;->getAlgorithmName()Ljava/lang/String;

    move-result-object v1

    .line 186
    .local v1, "name":Ljava/lang/String;
    invoke-virtual {v1, v3}, Ljava/lang/String;->indexOf(I)I

    move-result v2

    if-ltz v2, :cond_2

    .line 188
    const/4 v2, 0x0

    invoke-virtual {v1, v3}, Ljava/lang/String;->indexOf(I)I

    move-result v3

    invoke-virtual {v1, v2, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    .line 193
    :cond_2
    :try_start_1
    const-string v2, "BC"

    invoke-static {v1, v2}, Ljava/security/AlgorithmParameters;->getInstance(Ljava/lang/String;Ljava/lang/String;)Ljava/security/AlgorithmParameters;

    move-result-object v2

    iput-object v2, p0, Lorg/bouncycastle/jce/provider/JCEBlockCipher;->engineParams:Ljava/security/AlgorithmParameters;

    .line 194
    iget-object v2, p0, Lorg/bouncycastle/jce/provider/JCEBlockCipher;->engineParams:Ljava/security/AlgorithmParameters;

    iget-object v3, p0, Lorg/bouncycastle/jce/provider/JCEBlockCipher;->ivParam:Lorg/bouncycastle/crypto/params/ParametersWithIV;

    invoke-virtual {v3}, Lorg/bouncycastle/crypto/params/ParametersWithIV;->getIV()[B

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/security/AlgorithmParameters;->init([B)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_0

    .line 196
    :catch_1
    move-exception v0

    .line 198
    .restart local v0    # "e":Ljava/lang/Exception;
    new-instance v2, Ljava/lang/RuntimeException;

    invoke-virtual {v0}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v2
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
    .line 591
    const/4 v1, 0x0

    .line 593
    .local v1, "paramSpec":Ljava/security/spec/AlgorithmParameterSpec;
    if-eqz p3, :cond_1

    .line 595
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v2, p0, Lorg/bouncycastle/jce/provider/JCEBlockCipher;->availableSpecs:[Ljava/lang/Class;

    array-length v2, v2

    if-eq v0, v2, :cond_0

    .line 599
    :try_start_0
    iget-object v2, p0, Lorg/bouncycastle/jce/provider/JCEBlockCipher;->availableSpecs:[Ljava/lang/Class;

    aget-object v2, v2, v0

    invoke-virtual {p3, v2}, Ljava/security/AlgorithmParameters;->getParameterSpec(Ljava/lang/Class;)Ljava/security/spec/AlgorithmParameterSpec;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 608
    :cond_0
    if-nez v1, :cond_1

    .line 610
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

    .line 602
    :catch_0
    move-exception v2

    .line 595
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 614
    .end local v0    # "i":I
    :cond_1
    invoke-virtual {p0, p1, p2, v1, p4}, Lorg/bouncycastle/jce/provider/JCEBlockCipher;->engineInit(ILjava/security/Key;Ljava/security/spec/AlgorithmParameterSpec;Ljava/security/SecureRandom;)V

    .line 616
    iput-object p3, p0, Lorg/bouncycastle/jce/provider/JCEBlockCipher;->engineParams:Ljava/security/AlgorithmParameters;

    .line 617
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
    .line 627
    const/4 v1, 0x0

    :try_start_0
    check-cast v1, Ljava/security/spec/AlgorithmParameterSpec;

    invoke-virtual {p0, p1, p2, v1, p3}, Lorg/bouncycastle/jce/provider/JCEBlockCipher;->engineInit(ILjava/security/Key;Ljava/security/spec/AlgorithmParameterSpec;Ljava/security/SecureRandom;)V
    :try_end_0
    .catch Ljava/security/InvalidAlgorithmParameterException; {:try_start_0 .. :try_end_0} :catch_0

    .line 633
    return-void

    .line 629
    :catch_0
    move-exception v0

    .line 631
    .local v0, "e":Ljava/security/InvalidAlgorithmParameterException;
    new-instance v1, Ljava/security/InvalidKeyException;

    invoke-virtual {v0}, Ljava/security/InvalidAlgorithmParameterException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/security/InvalidKeyException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method protected engineInit(ILjava/security/Key;Ljava/security/spec/AlgorithmParameterSpec;Ljava/security/SecureRandom;)V
    .locals 11
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
    const/4 v10, 0x1

    const/4 v7, 0x0

    .line 386
    iput-object v7, p0, Lorg/bouncycastle/jce/provider/JCEBlockCipher;->pbeSpec:Ljavax/crypto/spec/PBEParameterSpec;

    .line 387
    iput-object v7, p0, Lorg/bouncycastle/jce/provider/JCEBlockCipher;->pbeAlgorithm:Ljava/lang/String;

    .line 388
    iput-object v7, p0, Lorg/bouncycastle/jce/provider/JCEBlockCipher;->engineParams:Ljava/security/AlgorithmParameters;

    .line 393
    instance-of v7, p2, Ljavax/crypto/SecretKey;

    if-nez v7, :cond_0

    .line 395
    new-instance v7, Ljava/security/InvalidKeyException;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Key for algorithm "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-interface {p2}, Ljava/security/Key;->getAlgorithm()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " not suitable for symmetric enryption."

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Ljava/security/InvalidKeyException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 401
    :cond_0
    if-nez p3, :cond_1

    iget-object v7, p0, Lorg/bouncycastle/jce/provider/JCEBlockCipher;->baseEngine:Lorg/bouncycastle/crypto/BlockCipher;

    invoke-interface {v7}, Lorg/bouncycastle/crypto/BlockCipher;->getAlgorithmName()Ljava/lang/String;

    move-result-object v7

    const-string v8, "RC5-64"

    invoke-virtual {v7, v8}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_1

    .line 403
    new-instance v7, Ljava/security/InvalidAlgorithmParameterException;

    const-string v8, "RC5 requires an RC5ParametersSpec to be passed in."

    invoke-direct {v7, v8}, Ljava/security/InvalidAlgorithmParameterException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 409
    :cond_1
    instance-of v7, p2, Lorg/bouncycastle/jce/provider/JCEPBEKey;

    if-eqz v7, :cond_8

    move-object v3, p2

    .line 411
    check-cast v3, Lorg/bouncycastle/jce/provider/JCEPBEKey;

    .line 413
    .local v3, "k":Lorg/bouncycastle/jce/provider/JCEPBEKey;
    invoke-virtual {v3}, Lorg/bouncycastle/jce/provider/JCEPBEKey;->getOID()Lorg/bouncycastle/asn1/DERObjectIdentifier;

    move-result-object v7

    if-eqz v7, :cond_5

    .line 415
    invoke-virtual {v3}, Lorg/bouncycastle/jce/provider/JCEPBEKey;->getOID()Lorg/bouncycastle/asn1/DERObjectIdentifier;

    move-result-object v7

    invoke-virtual {v7}, Lorg/bouncycastle/asn1/DERObjectIdentifier;->getId()Ljava/lang/String;

    move-result-object v7

    iput-object v7, p0, Lorg/bouncycastle/jce/provider/JCEBlockCipher;->pbeAlgorithm:Ljava/lang/String;

    .line 422
    :goto_0
    invoke-virtual {v3}, Lorg/bouncycastle/jce/provider/JCEPBEKey;->getParam()Lorg/bouncycastle/crypto/CipherParameters;

    move-result-object v7

    if-eqz v7, :cond_6

    .line 424
    invoke-virtual {v3}, Lorg/bouncycastle/jce/provider/JCEPBEKey;->getParam()Lorg/bouncycastle/crypto/CipherParameters;

    move-result-object v5

    .line 425
    .local v5, "param":Lorg/bouncycastle/crypto/CipherParameters;
    new-instance v7, Ljavax/crypto/spec/PBEParameterSpec;

    invoke-virtual {v3}, Lorg/bouncycastle/jce/provider/JCEPBEKey;->getSalt()[B

    move-result-object v8

    invoke-virtual {v3}, Lorg/bouncycastle/jce/provider/JCEPBEKey;->getIterationCount()I

    move-result v9

    invoke-direct {v7, v8, v9}, Ljavax/crypto/spec/PBEParameterSpec;-><init>([BI)V

    iput-object v7, p0, Lorg/bouncycastle/jce/provider/JCEBlockCipher;->pbeSpec:Ljavax/crypto/spec/PBEParameterSpec;

    .line 437
    :goto_1
    instance-of v7, v5, Lorg/bouncycastle/crypto/params/ParametersWithIV;

    if-eqz v7, :cond_2

    move-object v7, v5

    .line 439
    check-cast v7, Lorg/bouncycastle/crypto/params/ParametersWithIV;

    iput-object v7, p0, Lorg/bouncycastle/jce/provider/JCEBlockCipher;->ivParam:Lorg/bouncycastle/crypto/params/ParametersWithIV;

    .line 534
    .end local v3    # "k":Lorg/bouncycastle/jce/provider/JCEPBEKey;
    :cond_2
    :goto_2
    iget v7, p0, Lorg/bouncycastle/jce/provider/JCEBlockCipher;->ivLength:I

    if-eqz v7, :cond_10

    instance-of v7, v5, Lorg/bouncycastle/crypto/params/ParametersWithIV;

    if-nez v7, :cond_10

    .line 536
    move-object v2, p4

    .line 538
    .local v2, "ivRandom":Ljava/security/SecureRandom;
    if-nez v2, :cond_3

    .line 540
    new-instance v2, Ljava/security/SecureRandom;

    .end local v2    # "ivRandom":Ljava/security/SecureRandom;
    invoke-direct {v2}, Ljava/security/SecureRandom;-><init>()V

    .line 543
    .restart local v2    # "ivRandom":Ljava/security/SecureRandom;
    :cond_3
    if-eq p1, v10, :cond_4

    const/4 v7, 0x3

    if-ne p1, v7, :cond_e

    .line 545
    :cond_4
    iget v7, p0, Lorg/bouncycastle/jce/provider/JCEBlockCipher;->ivLength:I

    new-array v1, v7, [B

    .line 547
    .local v1, "iv":[B
    invoke-virtual {v2, v1}, Ljava/security/SecureRandom;->nextBytes([B)V

    .line 548
    new-instance v6, Lorg/bouncycastle/crypto/params/ParametersWithIV;

    invoke-direct {v6, v5, v1}, Lorg/bouncycastle/crypto/params/ParametersWithIV;-><init>(Lorg/bouncycastle/crypto/CipherParameters;[B)V

    .end local v5    # "param":Lorg/bouncycastle/crypto/CipherParameters;
    .local v6, "param":Lorg/bouncycastle/crypto/CipherParameters;
    move-object v7, v6

    .line 549
    check-cast v7, Lorg/bouncycastle/crypto/params/ParametersWithIV;

    iput-object v7, p0, Lorg/bouncycastle/jce/provider/JCEBlockCipher;->ivParam:Lorg/bouncycastle/crypto/params/ParametersWithIV;

    .line 557
    .end local v1    # "iv":[B
    .end local v2    # "ivRandom":Ljava/security/SecureRandom;
    :goto_3
    if-eqz p4, :cond_f

    iget-boolean v7, p0, Lorg/bouncycastle/jce/provider/JCEBlockCipher;->padded:Z

    if-eqz v7, :cond_f

    .line 559
    new-instance v5, Lorg/bouncycastle/crypto/params/ParametersWithRandom;

    invoke-direct {v5, v6, p4}, Lorg/bouncycastle/crypto/params/ParametersWithRandom;-><init>(Lorg/bouncycastle/crypto/CipherParameters;Ljava/security/SecureRandom;)V

    .line 564
    .end local v6    # "param":Lorg/bouncycastle/crypto/CipherParameters;
    .restart local v5    # "param":Lorg/bouncycastle/crypto/CipherParameters;
    :goto_4
    packed-switch p1, :pswitch_data_0

    .line 575
    :try_start_0
    new-instance v7, Ljava/security/InvalidParameterException;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "unknown opmode "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " passed"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Ljava/security/InvalidParameterException;-><init>(Ljava/lang/String;)V

    throw v7
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 578
    :catch_0
    move-exception v0

    .line 580
    .local v0, "e":Ljava/lang/Exception;
    new-instance v7, Ljava/security/InvalidKeyException;

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Ljava/security/InvalidKeyException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 419
    .end local v0    # "e":Ljava/lang/Exception;
    .end local v5    # "param":Lorg/bouncycastle/crypto/CipherParameters;
    .restart local v3    # "k":Lorg/bouncycastle/jce/provider/JCEPBEKey;
    :cond_5
    invoke-virtual {v3}, Lorg/bouncycastle/jce/provider/JCEPBEKey;->getAlgorithm()Ljava/lang/String;

    move-result-object v7

    iput-object v7, p0, Lorg/bouncycastle/jce/provider/JCEBlockCipher;->pbeAlgorithm:Ljava/lang/String;

    goto/16 :goto_0

    .line 427
    :cond_6
    instance-of v7, p3, Ljavax/crypto/spec/PBEParameterSpec;

    if-eqz v7, :cond_7

    move-object v7, p3

    .line 429
    check-cast v7, Ljavax/crypto/spec/PBEParameterSpec;

    iput-object v7, p0, Lorg/bouncycastle/jce/provider/JCEBlockCipher;->pbeSpec:Ljavax/crypto/spec/PBEParameterSpec;

    .line 430
    iget-object v7, p0, Lorg/bouncycastle/jce/provider/JCEBlockCipher;->cipher:Lorg/bouncycastle/jce/provider/JCEBlockCipher$GenericBlockCipher;

    invoke-interface {v7}, Lorg/bouncycastle/jce/provider/JCEBlockCipher$GenericBlockCipher;->getUnderlyingCipher()Lorg/bouncycastle/crypto/BlockCipher;

    move-result-object v7

    invoke-interface {v7}, Lorg/bouncycastle/crypto/BlockCipher;->getAlgorithmName()Ljava/lang/String;

    move-result-object v7

    invoke-static {v3, p3, v7}, Lorg/bouncycastle/jce/provider/PBE$Util;->makePBEParameters(Lorg/bouncycastle/jce/provider/JCEPBEKey;Ljava/security/spec/AlgorithmParameterSpec;Ljava/lang/String;)Lorg/bouncycastle/crypto/CipherParameters;

    move-result-object v5

    .restart local v5    # "param":Lorg/bouncycastle/crypto/CipherParameters;
    goto/16 :goto_1

    .line 434
    .end local v5    # "param":Lorg/bouncycastle/crypto/CipherParameters;
    :cond_7
    new-instance v7, Ljava/security/InvalidAlgorithmParameterException;

    const-string v8, "PBE requires PBE parameters to be set."

    invoke-direct {v7, v8}, Ljava/security/InvalidAlgorithmParameterException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 442
    .end local v3    # "k":Lorg/bouncycastle/jce/provider/JCEPBEKey;
    :cond_8
    if-nez p3, :cond_9

    .line 444
    new-instance v5, Lorg/bouncycastle/crypto/params/KeyParameter;

    invoke-interface {p2}, Ljava/security/Key;->getEncoded()[B

    move-result-object v7

    invoke-direct {v5, v7}, Lorg/bouncycastle/crypto/params/KeyParameter;-><init>([B)V

    .restart local v5    # "param":Lorg/bouncycastle/crypto/CipherParameters;
    goto/16 :goto_2

    .line 446
    .end local v5    # "param":Lorg/bouncycastle/crypto/CipherParameters;
    :cond_9
    instance-of v7, p3, Ljavax/crypto/spec/IvParameterSpec;

    if-eqz v7, :cond_d

    .line 448
    iget v7, p0, Lorg/bouncycastle/jce/provider/JCEBlockCipher;->ivLength:I

    if-eqz v7, :cond_b

    move-object v4, p3

    .line 450
    check-cast v4, Ljavax/crypto/spec/IvParameterSpec;

    .line 452
    .local v4, "p":Ljavax/crypto/spec/IvParameterSpec;
    invoke-virtual {v4}, Ljavax/crypto/spec/IvParameterSpec;->getIV()[B

    move-result-object v7

    array-length v7, v7

    iget v8, p0, Lorg/bouncycastle/jce/provider/JCEBlockCipher;->ivLength:I

    if-eq v7, v8, :cond_a

    iget-object v7, p0, Lorg/bouncycastle/jce/provider/JCEBlockCipher;->modeName:Ljava/lang/String;

    invoke-direct {p0, v7}, Lorg/bouncycastle/jce/provider/JCEBlockCipher;->isAEADModeName(Ljava/lang/String;)Z

    move-result v7

    if-nez v7, :cond_a

    .line 454
    new-instance v7, Ljava/security/InvalidAlgorithmParameterException;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "IV must be "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget v9, p0, Lorg/bouncycastle/jce/provider/JCEBlockCipher;->ivLength:I

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " bytes long."

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Ljava/security/InvalidAlgorithmParameterException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 457
    :cond_a
    new-instance v5, Lorg/bouncycastle/crypto/params/ParametersWithIV;

    new-instance v7, Lorg/bouncycastle/crypto/params/KeyParameter;

    invoke-interface {p2}, Ljava/security/Key;->getEncoded()[B

    move-result-object v8

    invoke-direct {v7, v8}, Lorg/bouncycastle/crypto/params/KeyParameter;-><init>([B)V

    invoke-virtual {v4}, Ljavax/crypto/spec/IvParameterSpec;->getIV()[B

    move-result-object v8

    invoke-direct {v5, v7, v8}, Lorg/bouncycastle/crypto/params/ParametersWithIV;-><init>(Lorg/bouncycastle/crypto/CipherParameters;[B)V

    .restart local v5    # "param":Lorg/bouncycastle/crypto/CipherParameters;
    move-object v7, v5

    .line 458
    check-cast v7, Lorg/bouncycastle/crypto/params/ParametersWithIV;

    iput-object v7, p0, Lorg/bouncycastle/jce/provider/JCEBlockCipher;->ivParam:Lorg/bouncycastle/crypto/params/ParametersWithIV;

    goto/16 :goto_2

    .line 462
    .end local v4    # "p":Ljavax/crypto/spec/IvParameterSpec;
    .end local v5    # "param":Lorg/bouncycastle/crypto/CipherParameters;
    :cond_b
    iget-object v7, p0, Lorg/bouncycastle/jce/provider/JCEBlockCipher;->modeName:Ljava/lang/String;

    if-eqz v7, :cond_c

    iget-object v7, p0, Lorg/bouncycastle/jce/provider/JCEBlockCipher;->modeName:Ljava/lang/String;

    const-string v8, "ECB"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_c

    .line 464
    new-instance v7, Ljava/security/InvalidAlgorithmParameterException;

    const-string v8, "ECB mode does not use an IV"

    invoke-direct {v7, v8}, Ljava/security/InvalidAlgorithmParameterException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 467
    :cond_c
    new-instance v5, Lorg/bouncycastle/crypto/params/KeyParameter;

    invoke-interface {p2}, Ljava/security/Key;->getEncoded()[B

    move-result-object v7

    invoke-direct {v5, v7}, Lorg/bouncycastle/crypto/params/KeyParameter;-><init>([B)V

    .restart local v5    # "param":Lorg/bouncycastle/crypto/CipherParameters;
    goto/16 :goto_2

    .line 531
    .end local v5    # "param":Lorg/bouncycastle/crypto/CipherParameters;
    :cond_d
    new-instance v7, Ljava/security/InvalidAlgorithmParameterException;

    const-string v8, "unknown parameter type."

    invoke-direct {v7, v8}, Ljava/security/InvalidAlgorithmParameterException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 551
    .restart local v2    # "ivRandom":Ljava/security/SecureRandom;
    .restart local v5    # "param":Lorg/bouncycastle/crypto/CipherParameters;
    :cond_e
    iget-object v7, p0, Lorg/bouncycastle/jce/provider/JCEBlockCipher;->cipher:Lorg/bouncycastle/jce/provider/JCEBlockCipher$GenericBlockCipher;

    invoke-interface {v7}, Lorg/bouncycastle/jce/provider/JCEBlockCipher$GenericBlockCipher;->getUnderlyingCipher()Lorg/bouncycastle/crypto/BlockCipher;

    move-result-object v7

    invoke-interface {v7}, Lorg/bouncycastle/crypto/BlockCipher;->getAlgorithmName()Ljava/lang/String;

    move-result-object v7

    const-string v8, "PGPCFB"

    invoke-virtual {v7, v8}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v7

    if-gez v7, :cond_10

    .line 553
    new-instance v7, Ljava/security/InvalidAlgorithmParameterException;

    const-string v8, "no IV set when one expected"

    invoke-direct {v7, v8}, Ljava/security/InvalidAlgorithmParameterException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 568
    .end local v2    # "ivRandom":Ljava/security/SecureRandom;
    :pswitch_0
    :try_start_1
    iget-object v7, p0, Lorg/bouncycastle/jce/provider/JCEBlockCipher;->cipher:Lorg/bouncycastle/jce/provider/JCEBlockCipher$GenericBlockCipher;

    const/4 v8, 0x1

    invoke-interface {v7, v8, v5}, Lorg/bouncycastle/jce/provider/JCEBlockCipher$GenericBlockCipher;->init(ZLorg/bouncycastle/crypto/CipherParameters;)V

    .line 582
    :goto_5
    return-void

    .line 572
    :pswitch_1
    iget-object v7, p0, Lorg/bouncycastle/jce/provider/JCEBlockCipher;->cipher:Lorg/bouncycastle/jce/provider/JCEBlockCipher$GenericBlockCipher;

    const/4 v8, 0x0

    invoke-interface {v7, v8, v5}, Lorg/bouncycastle/jce/provider/JCEBlockCipher$GenericBlockCipher;->init(ZLorg/bouncycastle/crypto/CipherParameters;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_5

    .end local v5    # "param":Lorg/bouncycastle/crypto/CipherParameters;
    .restart local v6    # "param":Lorg/bouncycastle/crypto/CipherParameters;
    :cond_f
    move-object v5, v6

    .end local v6    # "param":Lorg/bouncycastle/crypto/CipherParameters;
    .restart local v5    # "param":Lorg/bouncycastle/crypto/CipherParameters;
    goto/16 :goto_4

    :cond_10
    move-object v6, v5

    .end local v5    # "param":Lorg/bouncycastle/crypto/CipherParameters;
    .restart local v6    # "param":Lorg/bouncycastle/crypto/CipherParameters;
    goto/16 :goto_3

    .line 564
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
    .locals 5
    .param p1, "mode"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/NoSuchAlgorithmException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x3

    .line 210
    invoke-static {p1}, Lorg/bouncycastle/util/Strings;->toUpperCase(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lorg/bouncycastle/jce/provider/JCEBlockCipher;->modeName:Ljava/lang/String;

    .line 212
    iget-object v1, p0, Lorg/bouncycastle/jce/provider/JCEBlockCipher;->modeName:Ljava/lang/String;

    const-string v2, "ECB"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 214
    const/4 v1, 0x0

    iput v1, p0, Lorg/bouncycastle/jce/provider/JCEBlockCipher;->ivLength:I

    .line 215
    new-instance v1, Lorg/bouncycastle/jce/provider/JCEBlockCipher$BufferedGenericBlockCipher;

    iget-object v2, p0, Lorg/bouncycastle/jce/provider/JCEBlockCipher;->baseEngine:Lorg/bouncycastle/crypto/BlockCipher;

    invoke-direct {v1, v2}, Lorg/bouncycastle/jce/provider/JCEBlockCipher$BufferedGenericBlockCipher;-><init>(Lorg/bouncycastle/crypto/BlockCipher;)V

    iput-object v1, p0, Lorg/bouncycastle/jce/provider/JCEBlockCipher;->cipher:Lorg/bouncycastle/jce/provider/JCEBlockCipher$GenericBlockCipher;

    .line 317
    :goto_0
    return-void

    .line 217
    :cond_0
    iget-object v1, p0, Lorg/bouncycastle/jce/provider/JCEBlockCipher;->modeName:Ljava/lang/String;

    const-string v2, "CBC"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 219
    iget-object v1, p0, Lorg/bouncycastle/jce/provider/JCEBlockCipher;->baseEngine:Lorg/bouncycastle/crypto/BlockCipher;

    invoke-interface {v1}, Lorg/bouncycastle/crypto/BlockCipher;->getBlockSize()I

    move-result v1

    iput v1, p0, Lorg/bouncycastle/jce/provider/JCEBlockCipher;->ivLength:I

    .line 220
    new-instance v1, Lorg/bouncycastle/jce/provider/JCEBlockCipher$BufferedGenericBlockCipher;

    new-instance v2, Lorg/bouncycastle/crypto/modes/CBCBlockCipher;

    iget-object v3, p0, Lorg/bouncycastle/jce/provider/JCEBlockCipher;->baseEngine:Lorg/bouncycastle/crypto/BlockCipher;

    invoke-direct {v2, v3}, Lorg/bouncycastle/crypto/modes/CBCBlockCipher;-><init>(Lorg/bouncycastle/crypto/BlockCipher;)V

    invoke-direct {v1, v2}, Lorg/bouncycastle/jce/provider/JCEBlockCipher$BufferedGenericBlockCipher;-><init>(Lorg/bouncycastle/crypto/BlockCipher;)V

    iput-object v1, p0, Lorg/bouncycastle/jce/provider/JCEBlockCipher;->cipher:Lorg/bouncycastle/jce/provider/JCEBlockCipher$GenericBlockCipher;

    goto :goto_0

    .line 223
    :cond_1
    iget-object v1, p0, Lorg/bouncycastle/jce/provider/JCEBlockCipher;->modeName:Ljava/lang/String;

    const-string v2, "OFB"

    invoke-virtual {v1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 225
    iget-object v1, p0, Lorg/bouncycastle/jce/provider/JCEBlockCipher;->baseEngine:Lorg/bouncycastle/crypto/BlockCipher;

    invoke-interface {v1}, Lorg/bouncycastle/crypto/BlockCipher;->getBlockSize()I

    move-result v1

    iput v1, p0, Lorg/bouncycastle/jce/provider/JCEBlockCipher;->ivLength:I

    .line 226
    iget-object v1, p0, Lorg/bouncycastle/jce/provider/JCEBlockCipher;->modeName:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-eq v1, v3, :cond_2

    .line 228
    iget-object v1, p0, Lorg/bouncycastle/jce/provider/JCEBlockCipher;->modeName:Ljava/lang/String;

    invoke-virtual {v1, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    .line 230
    .local v0, "wordSize":I
    new-instance v1, Lorg/bouncycastle/jce/provider/JCEBlockCipher$BufferedGenericBlockCipher;

    new-instance v2, Lorg/bouncycastle/crypto/modes/OFBBlockCipher;

    iget-object v3, p0, Lorg/bouncycastle/jce/provider/JCEBlockCipher;->baseEngine:Lorg/bouncycastle/crypto/BlockCipher;

    invoke-direct {v2, v3, v0}, Lorg/bouncycastle/crypto/modes/OFBBlockCipher;-><init>(Lorg/bouncycastle/crypto/BlockCipher;I)V

    invoke-direct {v1, v2}, Lorg/bouncycastle/jce/provider/JCEBlockCipher$BufferedGenericBlockCipher;-><init>(Lorg/bouncycastle/crypto/BlockCipher;)V

    iput-object v1, p0, Lorg/bouncycastle/jce/provider/JCEBlockCipher;->cipher:Lorg/bouncycastle/jce/provider/JCEBlockCipher$GenericBlockCipher;

    goto :goto_0

    .line 235
    .end local v0    # "wordSize":I
    :cond_2
    new-instance v1, Lorg/bouncycastle/jce/provider/JCEBlockCipher$BufferedGenericBlockCipher;

    new-instance v2, Lorg/bouncycastle/crypto/modes/OFBBlockCipher;

    iget-object v3, p0, Lorg/bouncycastle/jce/provider/JCEBlockCipher;->baseEngine:Lorg/bouncycastle/crypto/BlockCipher;

    iget-object v4, p0, Lorg/bouncycastle/jce/provider/JCEBlockCipher;->baseEngine:Lorg/bouncycastle/crypto/BlockCipher;

    .line 236
    invoke-interface {v4}, Lorg/bouncycastle/crypto/BlockCipher;->getBlockSize()I

    move-result v4

    mul-int/lit8 v4, v4, 0x8

    invoke-direct {v2, v3, v4}, Lorg/bouncycastle/crypto/modes/OFBBlockCipher;-><init>(Lorg/bouncycastle/crypto/BlockCipher;I)V

    invoke-direct {v1, v2}, Lorg/bouncycastle/jce/provider/JCEBlockCipher$BufferedGenericBlockCipher;-><init>(Lorg/bouncycastle/crypto/BlockCipher;)V

    iput-object v1, p0, Lorg/bouncycastle/jce/provider/JCEBlockCipher;->cipher:Lorg/bouncycastle/jce/provider/JCEBlockCipher$GenericBlockCipher;

    goto :goto_0

    .line 239
    :cond_3
    iget-object v1, p0, Lorg/bouncycastle/jce/provider/JCEBlockCipher;->modeName:Ljava/lang/String;

    const-string v2, "CFB"

    invoke-virtual {v1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_5

    .line 241
    iget-object v1, p0, Lorg/bouncycastle/jce/provider/JCEBlockCipher;->baseEngine:Lorg/bouncycastle/crypto/BlockCipher;

    invoke-interface {v1}, Lorg/bouncycastle/crypto/BlockCipher;->getBlockSize()I

    move-result v1

    iput v1, p0, Lorg/bouncycastle/jce/provider/JCEBlockCipher;->ivLength:I

    .line 242
    iget-object v1, p0, Lorg/bouncycastle/jce/provider/JCEBlockCipher;->modeName:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-eq v1, v3, :cond_4

    .line 244
    iget-object v1, p0, Lorg/bouncycastle/jce/provider/JCEBlockCipher;->modeName:Ljava/lang/String;

    invoke-virtual {v1, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    .line 246
    .restart local v0    # "wordSize":I
    new-instance v1, Lorg/bouncycastle/jce/provider/JCEBlockCipher$BufferedGenericBlockCipher;

    new-instance v2, Lorg/bouncycastle/crypto/modes/CFBBlockCipher;

    iget-object v3, p0, Lorg/bouncycastle/jce/provider/JCEBlockCipher;->baseEngine:Lorg/bouncycastle/crypto/BlockCipher;

    invoke-direct {v2, v3, v0}, Lorg/bouncycastle/crypto/modes/CFBBlockCipher;-><init>(Lorg/bouncycastle/crypto/BlockCipher;I)V

    invoke-direct {v1, v2}, Lorg/bouncycastle/jce/provider/JCEBlockCipher$BufferedGenericBlockCipher;-><init>(Lorg/bouncycastle/crypto/BlockCipher;)V

    iput-object v1, p0, Lorg/bouncycastle/jce/provider/JCEBlockCipher;->cipher:Lorg/bouncycastle/jce/provider/JCEBlockCipher$GenericBlockCipher;

    goto/16 :goto_0

    .line 251
    .end local v0    # "wordSize":I
    :cond_4
    new-instance v1, Lorg/bouncycastle/jce/provider/JCEBlockCipher$BufferedGenericBlockCipher;

    new-instance v2, Lorg/bouncycastle/crypto/modes/CFBBlockCipher;

    iget-object v3, p0, Lorg/bouncycastle/jce/provider/JCEBlockCipher;->baseEngine:Lorg/bouncycastle/crypto/BlockCipher;

    iget-object v4, p0, Lorg/bouncycastle/jce/provider/JCEBlockCipher;->baseEngine:Lorg/bouncycastle/crypto/BlockCipher;

    .line 252
    invoke-interface {v4}, Lorg/bouncycastle/crypto/BlockCipher;->getBlockSize()I

    move-result v4

    mul-int/lit8 v4, v4, 0x8

    invoke-direct {v2, v3, v4}, Lorg/bouncycastle/crypto/modes/CFBBlockCipher;-><init>(Lorg/bouncycastle/crypto/BlockCipher;I)V

    invoke-direct {v1, v2}, Lorg/bouncycastle/jce/provider/JCEBlockCipher$BufferedGenericBlockCipher;-><init>(Lorg/bouncycastle/crypto/BlockCipher;)V

    iput-object v1, p0, Lorg/bouncycastle/jce/provider/JCEBlockCipher;->cipher:Lorg/bouncycastle/jce/provider/JCEBlockCipher$GenericBlockCipher;

    goto/16 :goto_0

    .line 315
    :cond_5
    new-instance v1, Ljava/security/NoSuchAlgorithmException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "can\'t support mode "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/security/NoSuchAlgorithmException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method protected engineSetPadding(Ljava/lang/String;)V
    .locals 4
    .param p1, "padding"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/crypto/NoSuchPaddingException;
        }
    .end annotation

    .prologue
    .line 323
    invoke-static {p1}, Lorg/bouncycastle/util/Strings;->toUpperCase(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 325
    .local v0, "paddingName":Ljava/lang/String;
    const-string v1, "NOPADDING"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 327
    iget-object v1, p0, Lorg/bouncycastle/jce/provider/JCEBlockCipher;->cipher:Lorg/bouncycastle/jce/provider/JCEBlockCipher$GenericBlockCipher;

    invoke-interface {v1}, Lorg/bouncycastle/jce/provider/JCEBlockCipher$GenericBlockCipher;->wrapOnNoPadding()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 329
    new-instance v1, Lorg/bouncycastle/jce/provider/JCEBlockCipher$BufferedGenericBlockCipher;

    new-instance v2, Lorg/bouncycastle/crypto/BufferedBlockCipher;

    iget-object v3, p0, Lorg/bouncycastle/jce/provider/JCEBlockCipher;->cipher:Lorg/bouncycastle/jce/provider/JCEBlockCipher$GenericBlockCipher;

    invoke-interface {v3}, Lorg/bouncycastle/jce/provider/JCEBlockCipher$GenericBlockCipher;->getUnderlyingCipher()Lorg/bouncycastle/crypto/BlockCipher;

    move-result-object v3

    invoke-direct {v2, v3}, Lorg/bouncycastle/crypto/BufferedBlockCipher;-><init>(Lorg/bouncycastle/crypto/BlockCipher;)V

    invoke-direct {v1, v2}, Lorg/bouncycastle/jce/provider/JCEBlockCipher$BufferedGenericBlockCipher;-><init>(Lorg/bouncycastle/crypto/BufferedBlockCipher;)V

    iput-object v1, p0, Lorg/bouncycastle/jce/provider/JCEBlockCipher;->cipher:Lorg/bouncycastle/jce/provider/JCEBlockCipher$GenericBlockCipher;

    .line 375
    :cond_0
    :goto_0
    return-void

    .line 332
    :cond_1
    const-string v1, "WITHCTS"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 334
    new-instance v1, Lorg/bouncycastle/jce/provider/JCEBlockCipher$BufferedGenericBlockCipher;

    new-instance v2, Lorg/bouncycastle/crypto/modes/CTSBlockCipher;

    iget-object v3, p0, Lorg/bouncycastle/jce/provider/JCEBlockCipher;->cipher:Lorg/bouncycastle/jce/provider/JCEBlockCipher$GenericBlockCipher;

    invoke-interface {v3}, Lorg/bouncycastle/jce/provider/JCEBlockCipher$GenericBlockCipher;->getUnderlyingCipher()Lorg/bouncycastle/crypto/BlockCipher;

    move-result-object v3

    invoke-direct {v2, v3}, Lorg/bouncycastle/crypto/modes/CTSBlockCipher;-><init>(Lorg/bouncycastle/crypto/BlockCipher;)V

    invoke-direct {v1, v2}, Lorg/bouncycastle/jce/provider/JCEBlockCipher$BufferedGenericBlockCipher;-><init>(Lorg/bouncycastle/crypto/BufferedBlockCipher;)V

    iput-object v1, p0, Lorg/bouncycastle/jce/provider/JCEBlockCipher;->cipher:Lorg/bouncycastle/jce/provider/JCEBlockCipher$GenericBlockCipher;

    goto :goto_0

    .line 338
    :cond_2
    const/4 v1, 0x1

    iput-boolean v1, p0, Lorg/bouncycastle/jce/provider/JCEBlockCipher;->padded:Z

    .line 340
    iget-object v1, p0, Lorg/bouncycastle/jce/provider/JCEBlockCipher;->modeName:Ljava/lang/String;

    invoke-direct {p0, v1}, Lorg/bouncycastle/jce/provider/JCEBlockCipher;->isAEADModeName(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 342
    new-instance v1, Ljavax/crypto/NoSuchPaddingException;

    const-string v2, "Only NoPadding can be used with AEAD modes."

    invoke-direct {v1, v2}, Ljavax/crypto/NoSuchPaddingException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 344
    :cond_3
    const-string v1, "PKCS5PADDING"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_4

    const-string v1, "PKCS7PADDING"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_5

    .line 346
    :cond_4
    new-instance v1, Lorg/bouncycastle/jce/provider/JCEBlockCipher$BufferedGenericBlockCipher;

    iget-object v2, p0, Lorg/bouncycastle/jce/provider/JCEBlockCipher;->cipher:Lorg/bouncycastle/jce/provider/JCEBlockCipher$GenericBlockCipher;

    invoke-interface {v2}, Lorg/bouncycastle/jce/provider/JCEBlockCipher$GenericBlockCipher;->getUnderlyingCipher()Lorg/bouncycastle/crypto/BlockCipher;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/bouncycastle/jce/provider/JCEBlockCipher$BufferedGenericBlockCipher;-><init>(Lorg/bouncycastle/crypto/BlockCipher;)V

    iput-object v1, p0, Lorg/bouncycastle/jce/provider/JCEBlockCipher;->cipher:Lorg/bouncycastle/jce/provider/JCEBlockCipher$GenericBlockCipher;

    goto :goto_0

    .line 348
    :cond_5
    const-string v1, "ZEROBYTEPADDING"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_6

    .line 350
    new-instance v1, Lorg/bouncycastle/jce/provider/JCEBlockCipher$BufferedGenericBlockCipher;

    iget-object v2, p0, Lorg/bouncycastle/jce/provider/JCEBlockCipher;->cipher:Lorg/bouncycastle/jce/provider/JCEBlockCipher$GenericBlockCipher;

    invoke-interface {v2}, Lorg/bouncycastle/jce/provider/JCEBlockCipher$GenericBlockCipher;->getUnderlyingCipher()Lorg/bouncycastle/crypto/BlockCipher;

    move-result-object v2

    new-instance v3, Lorg/bouncycastle/crypto/paddings/ZeroBytePadding;

    invoke-direct {v3}, Lorg/bouncycastle/crypto/paddings/ZeroBytePadding;-><init>()V

    invoke-direct {v1, v2, v3}, Lorg/bouncycastle/jce/provider/JCEBlockCipher$BufferedGenericBlockCipher;-><init>(Lorg/bouncycastle/crypto/BlockCipher;Lorg/bouncycastle/crypto/paddings/BlockCipherPadding;)V

    iput-object v1, p0, Lorg/bouncycastle/jce/provider/JCEBlockCipher;->cipher:Lorg/bouncycastle/jce/provider/JCEBlockCipher$GenericBlockCipher;

    goto :goto_0

    .line 372
    :cond_6
    new-instance v1, Ljavax/crypto/NoSuchPaddingException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Padding "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " unknown."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljavax/crypto/NoSuchPaddingException;-><init>(Ljava/lang/String;)V

    throw v1
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
    .line 679
    :try_start_0
    iget-object v0, p0, Lorg/bouncycastle/jce/provider/JCEBlockCipher;->cipher:Lorg/bouncycastle/jce/provider/JCEBlockCipher$GenericBlockCipher;

    move-object v1, p1

    move v2, p2

    move v3, p3

    move-object v4, p4

    move v5, p5

    invoke-interface/range {v0 .. v5}, Lorg/bouncycastle/jce/provider/JCEBlockCipher$GenericBlockCipher;->processBytes([BII[BI)I
    :try_end_0
    .catch Lorg/bouncycastle/crypto/DataLengthException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v0

    return v0

    .line 681
    :catch_0
    move-exception v6

    .line 683
    .local v6, "e":Lorg/bouncycastle/crypto/DataLengthException;
    new-instance v0, Ljavax/crypto/ShortBufferException;

    invoke-virtual {v6}, Lorg/bouncycastle/crypto/DataLengthException;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljavax/crypto/ShortBufferException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method protected engineUpdate([BII)[B
    .locals 15
    .param p1, "input"    # [B
    .param p2, "inputOffset"    # I
    .param p3, "inputLen"    # I

    .prologue
    .line 640
    iget-object v1, p0, Lorg/bouncycastle/jce/provider/JCEBlockCipher;->cipher:Lorg/bouncycastle/jce/provider/JCEBlockCipher$GenericBlockCipher;

    move/from16 v0, p3

    invoke-interface {v1, v0}, Lorg/bouncycastle/jce/provider/JCEBlockCipher$GenericBlockCipher;->getUpdateOutputSize(I)I

    move-result v13

    .line 642
    .local v13, "length":I
    if-lez v13, :cond_2

    .line 644
    new-array v5, v13, [B

    .line 646
    .local v5, "out":[B
    iget-object v1, p0, Lorg/bouncycastle/jce/provider/JCEBlockCipher;->cipher:Lorg/bouncycastle/jce/provider/JCEBlockCipher$GenericBlockCipher;

    const/4 v6, 0x0

    move-object/from16 v2, p1

    move/from16 v3, p2

    move/from16 v4, p3

    invoke-interface/range {v1 .. v6}, Lorg/bouncycastle/jce/provider/JCEBlockCipher$GenericBlockCipher;->processBytes([BII[BI)I

    move-result v12

    .line 648
    .local v12, "len":I
    if-nez v12, :cond_0

    .line 650
    const/4 v14, 0x0

    .line 666
    .end local v5    # "out":[B
    .end local v12    # "len":I
    :goto_0
    return-object v14

    .line 652
    .restart local v5    # "out":[B
    .restart local v12    # "len":I
    :cond_0
    array-length v1, v5

    if-eq v12, v1, :cond_1

    .line 654
    new-array v14, v12, [B

    .line 656
    .local v14, "tmp":[B
    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-static {v5, v1, v14, v2, v12}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    goto :goto_0

    .end local v14    # "tmp":[B
    :cond_1
    move-object v14, v5

    .line 661
    goto :goto_0

    .line 664
    .end local v5    # "out":[B
    .end local v12    # "len":I
    :cond_2
    iget-object v6, p0, Lorg/bouncycastle/jce/provider/JCEBlockCipher;->cipher:Lorg/bouncycastle/jce/provider/JCEBlockCipher$GenericBlockCipher;

    const/4 v10, 0x0

    const/4 v11, 0x0

    move-object/from16 v7, p1

    move/from16 v8, p2

    move/from16 v9, p3

    invoke-interface/range {v6 .. v11}, Lorg/bouncycastle/jce/provider/JCEBlockCipher$GenericBlockCipher;->processBytes([BII[BI)I

    .line 666
    const/4 v14, 0x0

    goto :goto_0
.end method
