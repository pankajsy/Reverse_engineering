.class public Lorg/bouncycastle/asn1/pkcs/PBKDF2Params;
.super Lorg/bouncycastle/asn1/ASN1Encodable;
.source "PBKDF2Params.java"


# instance fields
.field iterationCount:Lorg/bouncycastle/asn1/DERInteger;

.field keyLength:Lorg/bouncycastle/asn1/DERInteger;

.field octStr:Lorg/bouncycastle/asn1/ASN1OctetString;


# direct methods
.method public constructor <init>(Lorg/bouncycastle/asn1/ASN1Sequence;)V
    .locals 2
    .param p1, "seq"    # Lorg/bouncycastle/asn1/ASN1Sequence;

    .prologue
    .line 49
    invoke-direct {p0}, Lorg/bouncycastle/asn1/ASN1Encodable;-><init>()V

    .line 50
    invoke-virtual {p1}, Lorg/bouncycastle/asn1/ASN1Sequence;->getObjects()Ljava/util/Enumeration;

    move-result-object v0

    .line 52
    .local v0, "e":Ljava/util/Enumeration;
    invoke-interface {v0}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/bouncycastle/asn1/ASN1OctetString;

    iput-object v1, p0, Lorg/bouncycastle/asn1/pkcs/PBKDF2Params;->octStr:Lorg/bouncycastle/asn1/ASN1OctetString;

    .line 53
    invoke-interface {v0}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/bouncycastle/asn1/DERInteger;

    iput-object v1, p0, Lorg/bouncycastle/asn1/pkcs/PBKDF2Params;->iterationCount:Lorg/bouncycastle/asn1/DERInteger;

    .line 55
    invoke-interface {v0}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 57
    invoke-interface {v0}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/bouncycastle/asn1/DERInteger;

    iput-object v1, p0, Lorg/bouncycastle/asn1/pkcs/PBKDF2Params;->keyLength:Lorg/bouncycastle/asn1/DERInteger;

    .line 63
    :goto_0
    return-void

    .line 61
    :cond_0
    const/4 v1, 0x0

    iput-object v1, p0, Lorg/bouncycastle/asn1/pkcs/PBKDF2Params;->keyLength:Lorg/bouncycastle/asn1/DERInteger;

    goto :goto_0
.end method

.method public constructor <init>([BI)V
    .locals 1
    .param p1, "salt"    # [B
    .param p2, "iterationCount"    # I

    .prologue
    .line 42
    invoke-direct {p0}, Lorg/bouncycastle/asn1/ASN1Encodable;-><init>()V

    .line 43
    new-instance v0, Lorg/bouncycastle/asn1/DEROctetString;

    invoke-direct {v0, p1}, Lorg/bouncycastle/asn1/DEROctetString;-><init>([B)V

    iput-object v0, p0, Lorg/bouncycastle/asn1/pkcs/PBKDF2Params;->octStr:Lorg/bouncycastle/asn1/ASN1OctetString;

    .line 44
    new-instance v0, Lorg/bouncycastle/asn1/DERInteger;

    invoke-direct {v0, p2}, Lorg/bouncycastle/asn1/DERInteger;-><init>(I)V

    iput-object v0, p0, Lorg/bouncycastle/asn1/pkcs/PBKDF2Params;->iterationCount:Lorg/bouncycastle/asn1/DERInteger;

    .line 45
    return-void
.end method

.method public static getInstance(Ljava/lang/Object;)Lorg/bouncycastle/asn1/pkcs/PBKDF2Params;
    .locals 3
    .param p0, "obj"    # Ljava/lang/Object;

    .prologue
    .line 26
    instance-of v0, p0, Lorg/bouncycastle/asn1/pkcs/PBKDF2Params;

    if-eqz v0, :cond_0

    .line 28
    check-cast p0, Lorg/bouncycastle/asn1/pkcs/PBKDF2Params;

    .line 33
    .end local p0    # "obj":Ljava/lang/Object;
    :goto_0
    return-object p0

    .line 31
    .restart local p0    # "obj":Ljava/lang/Object;
    :cond_0
    instance-of v0, p0, Lorg/bouncycastle/asn1/ASN1Sequence;

    if-eqz v0, :cond_1

    .line 33
    new-instance v0, Lorg/bouncycastle/asn1/pkcs/PBKDF2Params;

    check-cast p0, Lorg/bouncycastle/asn1/ASN1Sequence;

    .end local p0    # "obj":Ljava/lang/Object;
    invoke-direct {v0, p0}, Lorg/bouncycastle/asn1/pkcs/PBKDF2Params;-><init>(Lorg/bouncycastle/asn1/ASN1Sequence;)V

    move-object p0, v0

    goto :goto_0

    .line 36
    .restart local p0    # "obj":Ljava/lang/Object;
    :cond_1
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "unknown object in factory: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method


# virtual methods
.method public getIterationCount()Ljava/math/BigInteger;
    .locals 1

    .prologue
    .line 72
    iget-object v0, p0, Lorg/bouncycastle/asn1/pkcs/PBKDF2Params;->iterationCount:Lorg/bouncycastle/asn1/DERInteger;

    invoke-virtual {v0}, Lorg/bouncycastle/asn1/DERInteger;->getValue()Ljava/math/BigInteger;

    move-result-object v0

    return-object v0
.end method

.method public getKeyLength()Ljava/math/BigInteger;
    .locals 1

    .prologue
    .line 77
    iget-object v0, p0, Lorg/bouncycastle/asn1/pkcs/PBKDF2Params;->keyLength:Lorg/bouncycastle/asn1/DERInteger;

    if-eqz v0, :cond_0

    .line 79
    iget-object v0, p0, Lorg/bouncycastle/asn1/pkcs/PBKDF2Params;->keyLength:Lorg/bouncycastle/asn1/DERInteger;

    invoke-virtual {v0}, Lorg/bouncycastle/asn1/DERInteger;->getValue()Ljava/math/BigInteger;

    move-result-object v0

    .line 82
    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getSalt()[B
    .locals 1

    .prologue
    .line 67
    iget-object v0, p0, Lorg/bouncycastle/asn1/pkcs/PBKDF2Params;->octStr:Lorg/bouncycastle/asn1/ASN1OctetString;

    invoke-virtual {v0}, Lorg/bouncycastle/asn1/ASN1OctetString;->getOctets()[B

    move-result-object v0

    return-object v0
.end method

.method public toASN1Object()Lorg/bouncycastle/asn1/DERObject;
    .locals 2

    .prologue
    .line 87
    new-instance v0, Lorg/bouncycastle/asn1/ASN1EncodableVector;

    invoke-direct {v0}, Lorg/bouncycastle/asn1/ASN1EncodableVector;-><init>()V

    .line 89
    .local v0, "v":Lorg/bouncycastle/asn1/ASN1EncodableVector;
    iget-object v1, p0, Lorg/bouncycastle/asn1/pkcs/PBKDF2Params;->octStr:Lorg/bouncycastle/asn1/ASN1OctetString;

    invoke-virtual {v0, v1}, Lorg/bouncycastle/asn1/ASN1EncodableVector;->add(Lorg/bouncycastle/asn1/DEREncodable;)V

    .line 90
    iget-object v1, p0, Lorg/bouncycastle/asn1/pkcs/PBKDF2Params;->iterationCount:Lorg/bouncycastle/asn1/DERInteger;

    invoke-virtual {v0, v1}, Lorg/bouncycastle/asn1/ASN1EncodableVector;->add(Lorg/bouncycastle/asn1/DEREncodable;)V

    .line 92
    iget-object v1, p0, Lorg/bouncycastle/asn1/pkcs/PBKDF2Params;->keyLength:Lorg/bouncycastle/asn1/DERInteger;

    if-eqz v1, :cond_0

    .line 94
    iget-object v1, p0, Lorg/bouncycastle/asn1/pkcs/PBKDF2Params;->keyLength:Lorg/bouncycastle/asn1/DERInteger;

    invoke-virtual {v0, v1}, Lorg/bouncycastle/asn1/ASN1EncodableVector;->add(Lorg/bouncycastle/asn1/DEREncodable;)V

    .line 97
    :cond_0
    new-instance v1, Lorg/bouncycastle/asn1/DERSequence;

    invoke-direct {v1, v0}, Lorg/bouncycastle/asn1/DERSequence;-><init>(Lorg/bouncycastle/asn1/DEREncodableVector;)V

    return-object v1
.end method
