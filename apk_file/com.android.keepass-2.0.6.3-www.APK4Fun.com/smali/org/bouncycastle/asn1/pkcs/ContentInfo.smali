.class public Lorg/bouncycastle/asn1/pkcs/ContentInfo;
.super Lorg/bouncycastle/asn1/ASN1Encodable;
.source "ContentInfo.java"

# interfaces
.implements Lorg/bouncycastle/asn1/pkcs/PKCSObjectIdentifiers;


# instance fields
.field private content:Lorg/bouncycastle/asn1/DEREncodable;

.field private contentType:Lorg/bouncycastle/asn1/DERObjectIdentifier;


# direct methods
.method public constructor <init>(Lorg/bouncycastle/asn1/ASN1Sequence;)V
    .locals 2
    .param p1, "seq"    # Lorg/bouncycastle/asn1/ASN1Sequence;

    .prologue
    .line 40
    invoke-direct {p0}, Lorg/bouncycastle/asn1/ASN1Encodable;-><init>()V

    .line 41
    invoke-virtual {p1}, Lorg/bouncycastle/asn1/ASN1Sequence;->getObjects()Ljava/util/Enumeration;

    move-result-object v0

    .line 43
    .local v0, "e":Ljava/util/Enumeration;
    invoke-interface {v0}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/bouncycastle/asn1/DERObjectIdentifier;

    iput-object v1, p0, Lorg/bouncycastle/asn1/pkcs/ContentInfo;->contentType:Lorg/bouncycastle/asn1/DERObjectIdentifier;

    .line 45
    invoke-interface {v0}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 47
    invoke-interface {v0}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/bouncycastle/asn1/DERTaggedObject;

    invoke-virtual {v1}, Lorg/bouncycastle/asn1/DERTaggedObject;->getObject()Lorg/bouncycastle/asn1/DERObject;

    move-result-object v1

    iput-object v1, p0, Lorg/bouncycastle/asn1/pkcs/ContentInfo;->content:Lorg/bouncycastle/asn1/DEREncodable;

    .line 49
    :cond_0
    return-void
.end method

.method public constructor <init>(Lorg/bouncycastle/asn1/DERObjectIdentifier;Lorg/bouncycastle/asn1/DEREncodable;)V
    .locals 0
    .param p1, "contentType"    # Lorg/bouncycastle/asn1/DERObjectIdentifier;
    .param p2, "content"    # Lorg/bouncycastle/asn1/DEREncodable;

    .prologue
    .line 54
    invoke-direct {p0}, Lorg/bouncycastle/asn1/ASN1Encodable;-><init>()V

    .line 55
    iput-object p1, p0, Lorg/bouncycastle/asn1/pkcs/ContentInfo;->contentType:Lorg/bouncycastle/asn1/DERObjectIdentifier;

    .line 56
    iput-object p2, p0, Lorg/bouncycastle/asn1/pkcs/ContentInfo;->content:Lorg/bouncycastle/asn1/DEREncodable;

    .line 57
    return-void
.end method

.method public static getInstance(Ljava/lang/Object;)Lorg/bouncycastle/asn1/pkcs/ContentInfo;
    .locals 3
    .param p0, "obj"    # Ljava/lang/Object;

    .prologue
    .line 26
    instance-of v0, p0, Lorg/bouncycastle/asn1/pkcs/ContentInfo;

    if-eqz v0, :cond_0

    .line 28
    check-cast p0, Lorg/bouncycastle/asn1/pkcs/ContentInfo;

    .line 32
    .end local p0    # "obj":Ljava/lang/Object;
    :goto_0
    return-object p0

    .line 30
    .restart local p0    # "obj":Ljava/lang/Object;
    :cond_0
    instance-of v0, p0, Lorg/bouncycastle/asn1/ASN1Sequence;

    if-eqz v0, :cond_1

    .line 32
    new-instance v0, Lorg/bouncycastle/asn1/pkcs/ContentInfo;

    check-cast p0, Lorg/bouncycastle/asn1/ASN1Sequence;

    .end local p0    # "obj":Ljava/lang/Object;
    invoke-direct {v0, p0}, Lorg/bouncycastle/asn1/pkcs/ContentInfo;-><init>(Lorg/bouncycastle/asn1/ASN1Sequence;)V

    move-object p0, v0

    goto :goto_0

    .line 35
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
.method public getContent()Lorg/bouncycastle/asn1/DEREncodable;
    .locals 1

    .prologue
    .line 66
    iget-object v0, p0, Lorg/bouncycastle/asn1/pkcs/ContentInfo;->content:Lorg/bouncycastle/asn1/DEREncodable;

    return-object v0
.end method

.method public getContentType()Lorg/bouncycastle/asn1/DERObjectIdentifier;
    .locals 1

    .prologue
    .line 61
    iget-object v0, p0, Lorg/bouncycastle/asn1/pkcs/ContentInfo;->contentType:Lorg/bouncycastle/asn1/DERObjectIdentifier;

    return-object v0
.end method

.method public toASN1Object()Lorg/bouncycastle/asn1/DERObject;
    .locals 4

    .prologue
    .line 80
    new-instance v0, Lorg/bouncycastle/asn1/ASN1EncodableVector;

    invoke-direct {v0}, Lorg/bouncycastle/asn1/ASN1EncodableVector;-><init>()V

    .line 82
    .local v0, "v":Lorg/bouncycastle/asn1/ASN1EncodableVector;
    iget-object v1, p0, Lorg/bouncycastle/asn1/pkcs/ContentInfo;->contentType:Lorg/bouncycastle/asn1/DERObjectIdentifier;

    invoke-virtual {v0, v1}, Lorg/bouncycastle/asn1/ASN1EncodableVector;->add(Lorg/bouncycastle/asn1/DEREncodable;)V

    .line 84
    iget-object v1, p0, Lorg/bouncycastle/asn1/pkcs/ContentInfo;->content:Lorg/bouncycastle/asn1/DEREncodable;

    if-eqz v1, :cond_0

    .line 86
    new-instance v1, Lorg/bouncycastle/asn1/BERTaggedObject;

    const/4 v2, 0x0

    iget-object v3, p0, Lorg/bouncycastle/asn1/pkcs/ContentInfo;->content:Lorg/bouncycastle/asn1/DEREncodable;

    invoke-direct {v1, v2, v3}, Lorg/bouncycastle/asn1/BERTaggedObject;-><init>(ILorg/bouncycastle/asn1/DEREncodable;)V

    invoke-virtual {v0, v1}, Lorg/bouncycastle/asn1/ASN1EncodableVector;->add(Lorg/bouncycastle/asn1/DEREncodable;)V

    .line 89
    :cond_0
    new-instance v1, Lorg/bouncycastle/asn1/BERSequence;

    invoke-direct {v1, v0}, Lorg/bouncycastle/asn1/BERSequence;-><init>(Lorg/bouncycastle/asn1/DEREncodableVector;)V

    return-object v1
.end method
