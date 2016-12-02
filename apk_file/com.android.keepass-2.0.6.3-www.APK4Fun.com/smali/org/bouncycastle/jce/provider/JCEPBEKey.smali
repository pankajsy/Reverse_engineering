.class public Lorg/bouncycastle/jce/provider/JCEPBEKey;
.super Ljava/lang/Object;
.source "JCEPBEKey.java"

# interfaces
.implements Ljavax/crypto/interfaces/PBEKey;


# instance fields
.field algorithm:Ljava/lang/String;

.field digest:I

.field ivSize:I

.field keySize:I

.field oid:Lorg/bouncycastle/asn1/DERObjectIdentifier;

.field param:Lorg/bouncycastle/crypto/CipherParameters;

.field pbeKeySpec:Ljavax/crypto/spec/PBEKeySpec;

.field tryWrong:Z

.field type:I


# direct methods
.method public constructor <init>(Ljava/lang/String;Lorg/bouncycastle/asn1/DERObjectIdentifier;IIIILjavax/crypto/spec/PBEKeySpec;Lorg/bouncycastle/crypto/CipherParameters;)V
    .locals 1
    .param p1, "algorithm"    # Ljava/lang/String;
    .param p2, "oid"    # Lorg/bouncycastle/asn1/DERObjectIdentifier;
    .param p3, "type"    # I
    .param p4, "digest"    # I
    .param p5, "keySize"    # I
    .param p6, "ivSize"    # I
    .param p7, "pbeKeySpec"    # Ljavax/crypto/spec/PBEKeySpec;
    .param p8, "param"    # Lorg/bouncycastle/crypto/CipherParameters;

    .prologue
    .line 38
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 24
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/bouncycastle/jce/provider/JCEPBEKey;->tryWrong:Z

    .line 39
    iput-object p1, p0, Lorg/bouncycastle/jce/provider/JCEPBEKey;->algorithm:Ljava/lang/String;

    .line 40
    iput-object p2, p0, Lorg/bouncycastle/jce/provider/JCEPBEKey;->oid:Lorg/bouncycastle/asn1/DERObjectIdentifier;

    .line 41
    iput p3, p0, Lorg/bouncycastle/jce/provider/JCEPBEKey;->type:I

    .line 42
    iput p4, p0, Lorg/bouncycastle/jce/provider/JCEPBEKey;->digest:I

    .line 43
    iput p5, p0, Lorg/bouncycastle/jce/provider/JCEPBEKey;->keySize:I

    .line 44
    iput p6, p0, Lorg/bouncycastle/jce/provider/JCEPBEKey;->ivSize:I

    .line 45
    iput-object p7, p0, Lorg/bouncycastle/jce/provider/JCEPBEKey;->pbeKeySpec:Ljavax/crypto/spec/PBEKeySpec;

    .line 46
    iput-object p8, p0, Lorg/bouncycastle/jce/provider/JCEPBEKey;->param:Lorg/bouncycastle/crypto/CipherParameters;

    .line 47
    return-void
.end method


# virtual methods
.method public getAlgorithm()Ljava/lang/String;
    .locals 1

    .prologue
    .line 51
    iget-object v0, p0, Lorg/bouncycastle/jce/provider/JCEPBEKey;->algorithm:Ljava/lang/String;

    return-object v0
.end method

.method getDigest()I
    .locals 1

    .prologue
    .line 96
    iget v0, p0, Lorg/bouncycastle/jce/provider/JCEPBEKey;->digest:I

    return v0
.end method

.method public getEncoded()[B
    .locals 3

    .prologue
    .line 61
    iget-object v1, p0, Lorg/bouncycastle/jce/provider/JCEPBEKey;->param:Lorg/bouncycastle/crypto/CipherParameters;

    if-eqz v1, :cond_1

    .line 65
    iget-object v1, p0, Lorg/bouncycastle/jce/provider/JCEPBEKey;->param:Lorg/bouncycastle/crypto/CipherParameters;

    instance-of v1, v1, Lorg/bouncycastle/crypto/params/ParametersWithIV;

    if-eqz v1, :cond_0

    .line 67
    iget-object v1, p0, Lorg/bouncycastle/jce/provider/JCEPBEKey;->param:Lorg/bouncycastle/crypto/CipherParameters;

    check-cast v1, Lorg/bouncycastle/crypto/params/ParametersWithIV;

    invoke-virtual {v1}, Lorg/bouncycastle/crypto/params/ParametersWithIV;->getParameters()Lorg/bouncycastle/crypto/CipherParameters;

    move-result-object v0

    check-cast v0, Lorg/bouncycastle/crypto/params/KeyParameter;

    .line 74
    .local v0, "kParam":Lorg/bouncycastle/crypto/params/KeyParameter;
    :goto_0
    invoke-virtual {v0}, Lorg/bouncycastle/crypto/params/KeyParameter;->getKey()[B

    move-result-object v1

    .line 84
    .end local v0    # "kParam":Lorg/bouncycastle/crypto/params/KeyParameter;
    :goto_1
    return-object v1

    .line 71
    :cond_0
    iget-object v0, p0, Lorg/bouncycastle/jce/provider/JCEPBEKey;->param:Lorg/bouncycastle/crypto/CipherParameters;

    check-cast v0, Lorg/bouncycastle/crypto/params/KeyParameter;

    .restart local v0    # "kParam":Lorg/bouncycastle/crypto/params/KeyParameter;
    goto :goto_0

    .line 78
    .end local v0    # "kParam":Lorg/bouncycastle/crypto/params/KeyParameter;
    :cond_1
    iget v1, p0, Lorg/bouncycastle/jce/provider/JCEPBEKey;->type:I

    const/4 v2, 0x2

    if-ne v1, v2, :cond_2

    .line 80
    iget-object v1, p0, Lorg/bouncycastle/jce/provider/JCEPBEKey;->pbeKeySpec:Ljavax/crypto/spec/PBEKeySpec;

    invoke-virtual {v1}, Ljavax/crypto/spec/PBEKeySpec;->getPassword()[C

    move-result-object v1

    invoke-static {v1}, Lorg/bouncycastle/crypto/PBEParametersGenerator;->PKCS12PasswordToBytes([C)[B

    move-result-object v1

    goto :goto_1

    .line 84
    :cond_2
    iget-object v1, p0, Lorg/bouncycastle/jce/provider/JCEPBEKey;->pbeKeySpec:Ljavax/crypto/spec/PBEKeySpec;

    invoke-virtual {v1}, Ljavax/crypto/spec/PBEKeySpec;->getPassword()[C

    move-result-object v1

    invoke-static {v1}, Lorg/bouncycastle/crypto/PBEParametersGenerator;->PKCS5PasswordToBytes([C)[B

    move-result-object v1

    goto :goto_1
.end method

.method public getFormat()Ljava/lang/String;
    .locals 1

    .prologue
    .line 56
    const-string v0, "RAW"

    return-object v0
.end method

.method public getIterationCount()I
    .locals 1

    .prologue
    .line 135
    iget-object v0, p0, Lorg/bouncycastle/jce/provider/JCEPBEKey;->pbeKeySpec:Ljavax/crypto/spec/PBEKeySpec;

    invoke-virtual {v0}, Ljavax/crypto/spec/PBEKeySpec;->getIterationCount()I

    move-result v0

    return v0
.end method

.method getIvSize()I
    .locals 1

    .prologue
    .line 106
    iget v0, p0, Lorg/bouncycastle/jce/provider/JCEPBEKey;->ivSize:I

    return v0
.end method

.method getKeySize()I
    .locals 1

    .prologue
    .line 101
    iget v0, p0, Lorg/bouncycastle/jce/provider/JCEPBEKey;->keySize:I

    return v0
.end method

.method public getOID()Lorg/bouncycastle/asn1/DERObjectIdentifier;
    .locals 1

    .prologue
    .line 140
    iget-object v0, p0, Lorg/bouncycastle/jce/provider/JCEPBEKey;->oid:Lorg/bouncycastle/asn1/DERObjectIdentifier;

    return-object v0
.end method

.method getParam()Lorg/bouncycastle/crypto/CipherParameters;
    .locals 1

    .prologue
    .line 111
    iget-object v0, p0, Lorg/bouncycastle/jce/provider/JCEPBEKey;->param:Lorg/bouncycastle/crypto/CipherParameters;

    return-object v0
.end method

.method public getPassword()[C
    .locals 1

    .prologue
    .line 119
    iget-object v0, p0, Lorg/bouncycastle/jce/provider/JCEPBEKey;->pbeKeySpec:Ljavax/crypto/spec/PBEKeySpec;

    invoke-virtual {v0}, Ljavax/crypto/spec/PBEKeySpec;->getPassword()[C

    move-result-object v0

    return-object v0
.end method

.method public getSalt()[B
    .locals 1

    .prologue
    .line 127
    iget-object v0, p0, Lorg/bouncycastle/jce/provider/JCEPBEKey;->pbeKeySpec:Ljavax/crypto/spec/PBEKeySpec;

    invoke-virtual {v0}, Ljavax/crypto/spec/PBEKeySpec;->getSalt()[B

    move-result-object v0

    return-object v0
.end method

.method getType()I
    .locals 1

    .prologue
    .line 91
    iget v0, p0, Lorg/bouncycastle/jce/provider/JCEPBEKey;->type:I

    return v0
.end method

.method setTryWrongPKCS12Zero(Z)V
    .locals 0
    .param p1, "tryWrong"    # Z

    .prologue
    .line 145
    iput-boolean p1, p0, Lorg/bouncycastle/jce/provider/JCEPBEKey;->tryWrong:Z

    .line 146
    return-void
.end method

.method shouldTryWrongPKCS12()Z
    .locals 1

    .prologue
    .line 150
    iget-boolean v0, p0, Lorg/bouncycastle/jce/provider/JCEPBEKey;->tryWrong:Z

    return v0
.end method
