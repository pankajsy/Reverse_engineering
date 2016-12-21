.class public Lorg/bouncycastle/asn1/BERTaggedObject;
.super Lorg/bouncycastle/asn1/DERTaggedObject;
.source "BERTaggedObject.java"


# direct methods
.method public constructor <init>(I)V
    .locals 2
    .param p1, "tagNo"    # I

    .prologue
    .line 46
    const/4 v0, 0x0

    new-instance v1, Lorg/bouncycastle/asn1/BERSequence;

    invoke-direct {v1}, Lorg/bouncycastle/asn1/BERSequence;-><init>()V

    invoke-direct {p0, v0, p1, v1}, Lorg/bouncycastle/asn1/DERTaggedObject;-><init>(ZILorg/bouncycastle/asn1/DEREncodable;)V

    .line 47
    return-void
.end method

.method public constructor <init>(ILorg/bouncycastle/asn1/DEREncodable;)V
    .locals 0
    .param p1, "tagNo"    # I
    .param p2, "obj"    # Lorg/bouncycastle/asn1/DEREncodable;

    .prologue
    .line 23
    invoke-direct {p0, p1, p2}, Lorg/bouncycastle/asn1/DERTaggedObject;-><init>(ILorg/bouncycastle/asn1/DEREncodable;)V

    .line 24
    return-void
.end method

.method public constructor <init>(ZILorg/bouncycastle/asn1/DEREncodable;)V
    .locals 0
    .param p1, "explicit"    # Z
    .param p2, "tagNo"    # I
    .param p3, "obj"    # Lorg/bouncycastle/asn1/DEREncodable;

    .prologue
    .line 36
    invoke-direct {p0, p1, p2, p3}, Lorg/bouncycastle/asn1/DERTaggedObject;-><init>(ZILorg/bouncycastle/asn1/DEREncodable;)V

    .line 37
    return-void
.end method


# virtual methods
.method encode(Lorg/bouncycastle/asn1/DEROutputStream;)V
    .locals 6
    .param p1, "out"    # Lorg/bouncycastle/asn1/DEROutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v5, 0x0

    .line 53
    instance-of v3, p1, Lorg/bouncycastle/asn1/ASN1OutputStream;

    if-nez v3, :cond_0

    instance-of v3, p1, Lorg/bouncycastle/asn1/BEROutputStream;

    if-eqz v3, :cond_7

    .line 55
    :cond_0
    const/16 v3, 0xa0

    iget v4, p0, Lorg/bouncycastle/asn1/BERTaggedObject;->tagNo:I

    invoke-virtual {p1, v3, v4}, Lorg/bouncycastle/asn1/DEROutputStream;->writeTag(II)V

    .line 56
    const/16 v3, 0x80

    invoke-virtual {p1, v3}, Lorg/bouncycastle/asn1/DEROutputStream;->write(I)V

    .line 58
    iget-boolean v3, p0, Lorg/bouncycastle/asn1/BERTaggedObject;->empty:Z

    if-nez v3, :cond_6

    .line 60
    iget-boolean v3, p0, Lorg/bouncycastle/asn1/BERTaggedObject;->explicit:Z

    if-nez v3, :cond_5

    .line 63
    iget-object v3, p0, Lorg/bouncycastle/asn1/BERTaggedObject;->obj:Lorg/bouncycastle/asn1/DEREncodable;

    instance-of v3, v3, Lorg/bouncycastle/asn1/ASN1OctetString;

    if-eqz v3, :cond_2

    .line 65
    iget-object v3, p0, Lorg/bouncycastle/asn1/BERTaggedObject;->obj:Lorg/bouncycastle/asn1/DEREncodable;

    instance-of v3, v3, Lorg/bouncycastle/asn1/BERConstructedOctetString;

    if-eqz v3, :cond_1

    .line 67
    iget-object v3, p0, Lorg/bouncycastle/asn1/BERTaggedObject;->obj:Lorg/bouncycastle/asn1/DEREncodable;

    check-cast v3, Lorg/bouncycastle/asn1/BERConstructedOctetString;

    invoke-virtual {v3}, Lorg/bouncycastle/asn1/BERConstructedOctetString;->getObjects()Ljava/util/Enumeration;

    move-result-object v1

    .line 89
    .local v1, "e":Ljava/util/Enumeration;
    :goto_0
    invoke-interface {v1}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v3

    if-eqz v3, :cond_6

    .line 91
    invoke-interface {v1}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {p1, v3}, Lorg/bouncycastle/asn1/DEROutputStream;->writeObject(Ljava/lang/Object;)V

    goto :goto_0

    .line 71
    .end local v1    # "e":Ljava/util/Enumeration;
    :cond_1
    iget-object v2, p0, Lorg/bouncycastle/asn1/BERTaggedObject;->obj:Lorg/bouncycastle/asn1/DEREncodable;

    check-cast v2, Lorg/bouncycastle/asn1/ASN1OctetString;

    .line 72
    .local v2, "octs":Lorg/bouncycastle/asn1/ASN1OctetString;
    new-instance v0, Lorg/bouncycastle/asn1/BERConstructedOctetString;

    invoke-virtual {v2}, Lorg/bouncycastle/asn1/ASN1OctetString;->getOctets()[B

    move-result-object v3

    invoke-direct {v0, v3}, Lorg/bouncycastle/asn1/BERConstructedOctetString;-><init>([B)V

    .line 73
    .local v0, "berO":Lorg/bouncycastle/asn1/BERConstructedOctetString;
    invoke-virtual {v0}, Lorg/bouncycastle/asn1/BERConstructedOctetString;->getObjects()Ljava/util/Enumeration;

    move-result-object v1

    .line 74
    .restart local v1    # "e":Ljava/util/Enumeration;
    goto :goto_0

    .line 76
    .end local v0    # "berO":Lorg/bouncycastle/asn1/BERConstructedOctetString;
    .end local v1    # "e":Ljava/util/Enumeration;
    .end local v2    # "octs":Lorg/bouncycastle/asn1/ASN1OctetString;
    :cond_2
    iget-object v3, p0, Lorg/bouncycastle/asn1/BERTaggedObject;->obj:Lorg/bouncycastle/asn1/DEREncodable;

    instance-of v3, v3, Lorg/bouncycastle/asn1/ASN1Sequence;

    if-eqz v3, :cond_3

    .line 78
    iget-object v3, p0, Lorg/bouncycastle/asn1/BERTaggedObject;->obj:Lorg/bouncycastle/asn1/DEREncodable;

    check-cast v3, Lorg/bouncycastle/asn1/ASN1Sequence;

    invoke-virtual {v3}, Lorg/bouncycastle/asn1/ASN1Sequence;->getObjects()Ljava/util/Enumeration;

    move-result-object v1

    .restart local v1    # "e":Ljava/util/Enumeration;
    goto :goto_0

    .line 80
    .end local v1    # "e":Ljava/util/Enumeration;
    :cond_3
    iget-object v3, p0, Lorg/bouncycastle/asn1/BERTaggedObject;->obj:Lorg/bouncycastle/asn1/DEREncodable;

    instance-of v3, v3, Lorg/bouncycastle/asn1/ASN1Set;

    if-eqz v3, :cond_4

    .line 82
    iget-object v3, p0, Lorg/bouncycastle/asn1/BERTaggedObject;->obj:Lorg/bouncycastle/asn1/DEREncodable;

    check-cast v3, Lorg/bouncycastle/asn1/ASN1Set;

    invoke-virtual {v3}, Lorg/bouncycastle/asn1/ASN1Set;->getObjects()Ljava/util/Enumeration;

    move-result-object v1

    .restart local v1    # "e":Ljava/util/Enumeration;
    goto :goto_0

    .line 86
    .end local v1    # "e":Ljava/util/Enumeration;
    :cond_4
    new-instance v3, Ljava/lang/RuntimeException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "not implemented: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lorg/bouncycastle/asn1/BERTaggedObject;->obj:Lorg/bouncycastle/asn1/DEREncodable;

    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 96
    :cond_5
    iget-object v3, p0, Lorg/bouncycastle/asn1/BERTaggedObject;->obj:Lorg/bouncycastle/asn1/DEREncodable;

    invoke-virtual {p1, v3}, Lorg/bouncycastle/asn1/DEROutputStream;->writeObject(Ljava/lang/Object;)V

    .line 100
    :cond_6
    invoke-virtual {p1, v5}, Lorg/bouncycastle/asn1/DEROutputStream;->write(I)V

    .line 101
    invoke-virtual {p1, v5}, Lorg/bouncycastle/asn1/DEROutputStream;->write(I)V

    .line 107
    :goto_1
    return-void

    .line 105
    :cond_7
    invoke-super {p0, p1}, Lorg/bouncycastle/asn1/DERTaggedObject;->encode(Lorg/bouncycastle/asn1/DEROutputStream;)V

    goto :goto_1
.end method
