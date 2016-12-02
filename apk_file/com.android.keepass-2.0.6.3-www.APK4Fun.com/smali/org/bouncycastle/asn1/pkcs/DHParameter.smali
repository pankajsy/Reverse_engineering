.class public Lorg/bouncycastle/asn1/pkcs/DHParameter;
.super Lorg/bouncycastle/asn1/ASN1Encodable;
.source "DHParameter.java"


# instance fields
.field g:Lorg/bouncycastle/asn1/DERInteger;

.field l:Lorg/bouncycastle/asn1/DERInteger;

.field p:Lorg/bouncycastle/asn1/DERInteger;


# direct methods
.method public constructor <init>(Ljava/math/BigInteger;Ljava/math/BigInteger;I)V
    .locals 1
    .param p1, "p"    # Ljava/math/BigInteger;
    .param p2, "g"    # Ljava/math/BigInteger;
    .param p3, "l"    # I

    .prologue
    .line 23
    invoke-direct {p0}, Lorg/bouncycastle/asn1/ASN1Encodable;-><init>()V

    .line 24
    new-instance v0, Lorg/bouncycastle/asn1/DERInteger;

    invoke-direct {v0, p1}, Lorg/bouncycastle/asn1/DERInteger;-><init>(Ljava/math/BigInteger;)V

    iput-object v0, p0, Lorg/bouncycastle/asn1/pkcs/DHParameter;->p:Lorg/bouncycastle/asn1/DERInteger;

    .line 25
    new-instance v0, Lorg/bouncycastle/asn1/DERInteger;

    invoke-direct {v0, p2}, Lorg/bouncycastle/asn1/DERInteger;-><init>(Ljava/math/BigInteger;)V

    iput-object v0, p0, Lorg/bouncycastle/asn1/pkcs/DHParameter;->g:Lorg/bouncycastle/asn1/DERInteger;

    .line 27
    if-eqz p3, :cond_0

    .line 29
    new-instance v0, Lorg/bouncycastle/asn1/DERInteger;

    invoke-direct {v0, p3}, Lorg/bouncycastle/asn1/DERInteger;-><init>(I)V

    iput-object v0, p0, Lorg/bouncycastle/asn1/pkcs/DHParameter;->l:Lorg/bouncycastle/asn1/DERInteger;

    .line 35
    :goto_0
    return-void

    .line 33
    :cond_0
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/bouncycastle/asn1/pkcs/DHParameter;->l:Lorg/bouncycastle/asn1/DERInteger;

    goto :goto_0
.end method

.method public constructor <init>(Lorg/bouncycastle/asn1/ASN1Sequence;)V
    .locals 2
    .param p1, "seq"    # Lorg/bouncycastle/asn1/ASN1Sequence;

    .prologue
    .line 39
    invoke-direct {p0}, Lorg/bouncycastle/asn1/ASN1Encodable;-><init>()V

    .line 40
    invoke-virtual {p1}, Lorg/bouncycastle/asn1/ASN1Sequence;->getObjects()Ljava/util/Enumeration;

    move-result-object v0

    .line 42
    .local v0, "e":Ljava/util/Enumeration;
    invoke-interface {v0}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/bouncycastle/asn1/DERInteger;

    iput-object v1, p0, Lorg/bouncycastle/asn1/pkcs/DHParameter;->p:Lorg/bouncycastle/asn1/DERInteger;

    .line 43
    invoke-interface {v0}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/bouncycastle/asn1/DERInteger;

    iput-object v1, p0, Lorg/bouncycastle/asn1/pkcs/DHParameter;->g:Lorg/bouncycastle/asn1/DERInteger;

    .line 45
    invoke-interface {v0}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 47
    invoke-interface {v0}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/bouncycastle/asn1/DERInteger;

    iput-object v1, p0, Lorg/bouncycastle/asn1/pkcs/DHParameter;->l:Lorg/bouncycastle/asn1/DERInteger;

    .line 53
    :goto_0
    return-void

    .line 51
    :cond_0
    const/4 v1, 0x0

    iput-object v1, p0, Lorg/bouncycastle/asn1/pkcs/DHParameter;->l:Lorg/bouncycastle/asn1/DERInteger;

    goto :goto_0
.end method


# virtual methods
.method public getG()Ljava/math/BigInteger;
    .locals 1

    .prologue
    .line 62
    iget-object v0, p0, Lorg/bouncycastle/asn1/pkcs/DHParameter;->g:Lorg/bouncycastle/asn1/DERInteger;

    invoke-virtual {v0}, Lorg/bouncycastle/asn1/DERInteger;->getPositiveValue()Ljava/math/BigInteger;

    move-result-object v0

    return-object v0
.end method

.method public getL()Ljava/math/BigInteger;
    .locals 1

    .prologue
    .line 67
    iget-object v0, p0, Lorg/bouncycastle/asn1/pkcs/DHParameter;->l:Lorg/bouncycastle/asn1/DERInteger;

    if-nez v0, :cond_0

    .line 69
    const/4 v0, 0x0

    .line 72
    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lorg/bouncycastle/asn1/pkcs/DHParameter;->l:Lorg/bouncycastle/asn1/DERInteger;

    invoke-virtual {v0}, Lorg/bouncycastle/asn1/DERInteger;->getPositiveValue()Ljava/math/BigInteger;

    move-result-object v0

    goto :goto_0
.end method

.method public getP()Ljava/math/BigInteger;
    .locals 1

    .prologue
    .line 57
    iget-object v0, p0, Lorg/bouncycastle/asn1/pkcs/DHParameter;->p:Lorg/bouncycastle/asn1/DERInteger;

    invoke-virtual {v0}, Lorg/bouncycastle/asn1/DERInteger;->getPositiveValue()Ljava/math/BigInteger;

    move-result-object v0

    return-object v0
.end method

.method public toASN1Object()Lorg/bouncycastle/asn1/DERObject;
    .locals 2

    .prologue
    .line 77
    new-instance v0, Lorg/bouncycastle/asn1/ASN1EncodableVector;

    invoke-direct {v0}, Lorg/bouncycastle/asn1/ASN1EncodableVector;-><init>()V

    .line 79
    .local v0, "v":Lorg/bouncycastle/asn1/ASN1EncodableVector;
    iget-object v1, p0, Lorg/bouncycastle/asn1/pkcs/DHParameter;->p:Lorg/bouncycastle/asn1/DERInteger;

    invoke-virtual {v0, v1}, Lorg/bouncycastle/asn1/ASN1EncodableVector;->add(Lorg/bouncycastle/asn1/DEREncodable;)V

    .line 80
    iget-object v1, p0, Lorg/bouncycastle/asn1/pkcs/DHParameter;->g:Lorg/bouncycastle/asn1/DERInteger;

    invoke-virtual {v0, v1}, Lorg/bouncycastle/asn1/ASN1EncodableVector;->add(Lorg/bouncycastle/asn1/DEREncodable;)V

    .line 82
    invoke-virtual {p0}, Lorg/bouncycastle/asn1/pkcs/DHParameter;->getL()Ljava/math/BigInteger;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 84
    iget-object v1, p0, Lorg/bouncycastle/asn1/pkcs/DHParameter;->l:Lorg/bouncycastle/asn1/DERInteger;

    invoke-virtual {v0, v1}, Lorg/bouncycastle/asn1/ASN1EncodableVector;->add(Lorg/bouncycastle/asn1/DEREncodable;)V

    .line 87
    :cond_0
    new-instance v1, Lorg/bouncycastle/asn1/DERSequence;

    invoke-direct {v1, v0}, Lorg/bouncycastle/asn1/DERSequence;-><init>(Lorg/bouncycastle/asn1/DEREncodableVector;)V

    return-object v1
.end method
