.class public abstract Lorg/bouncycastle/asn1/ASN1Sequence;
.super Lorg/bouncycastle/asn1/ASN1Object;
.source "ASN1Sequence.java"


# instance fields
.field private seq:Ljava/util/Vector;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 8
    invoke-direct {p0}, Lorg/bouncycastle/asn1/ASN1Object;-><init>()V

    .line 11
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lorg/bouncycastle/asn1/ASN1Sequence;->seq:Ljava/util/Vector;

    return-void
.end method

.method public static getInstance(Ljava/lang/Object;)Lorg/bouncycastle/asn1/ASN1Sequence;
    .locals 3
    .param p0, "obj"    # Ljava/lang/Object;

    .prologue
    .line 22
    if-eqz p0, :cond_0

    instance-of v0, p0, Lorg/bouncycastle/asn1/ASN1Sequence;

    if-eqz v0, :cond_1

    .line 24
    :cond_0
    check-cast p0, Lorg/bouncycastle/asn1/ASN1Sequence;

    .end local p0    # "obj":Ljava/lang/Object;
    return-object p0

    .line 27
    .restart local p0    # "obj":Ljava/lang/Object;
    :cond_1
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "unknown object in getInstance: "

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

.method public static getInstance(Lorg/bouncycastle/asn1/ASN1TaggedObject;Z)Lorg/bouncycastle/asn1/ASN1Sequence;
    .locals 3
    .param p0, "obj"    # Lorg/bouncycastle/asn1/ASN1TaggedObject;
    .param p1, "explicit"    # Z

    .prologue
    .line 50
    if-eqz p1, :cond_1

    .line 52
    invoke-virtual {p0}, Lorg/bouncycastle/asn1/ASN1TaggedObject;->isExplicit()Z

    move-result v0

    if-nez v0, :cond_0

    .line 54
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "object implicit - explicit expected."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 57
    :cond_0
    invoke-virtual {p0}, Lorg/bouncycastle/asn1/ASN1TaggedObject;->getObject()Lorg/bouncycastle/asn1/DERObject;

    move-result-object v0

    check-cast v0, Lorg/bouncycastle/asn1/ASN1Sequence;

    .line 81
    :goto_0
    return-object v0

    .line 66
    :cond_1
    invoke-virtual {p0}, Lorg/bouncycastle/asn1/ASN1TaggedObject;->isExplicit()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 68
    instance-of v0, p0, Lorg/bouncycastle/asn1/BERTaggedObject;

    if-eqz v0, :cond_2

    .line 70
    new-instance v0, Lorg/bouncycastle/asn1/BERSequence;

    invoke-virtual {p0}, Lorg/bouncycastle/asn1/ASN1TaggedObject;->getObject()Lorg/bouncycastle/asn1/DERObject;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/bouncycastle/asn1/BERSequence;-><init>(Lorg/bouncycastle/asn1/DEREncodable;)V

    goto :goto_0

    .line 74
    :cond_2
    new-instance v0, Lorg/bouncycastle/asn1/DERSequence;

    invoke-virtual {p0}, Lorg/bouncycastle/asn1/ASN1TaggedObject;->getObject()Lorg/bouncycastle/asn1/DERObject;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/bouncycastle/asn1/DERSequence;-><init>(Lorg/bouncycastle/asn1/DEREncodable;)V

    goto :goto_0

    .line 79
    :cond_3
    invoke-virtual {p0}, Lorg/bouncycastle/asn1/ASN1TaggedObject;->getObject()Lorg/bouncycastle/asn1/DERObject;

    move-result-object v0

    instance-of v0, v0, Lorg/bouncycastle/asn1/ASN1Sequence;

    if-eqz v0, :cond_4

    .line 81
    invoke-virtual {p0}, Lorg/bouncycastle/asn1/ASN1TaggedObject;->getObject()Lorg/bouncycastle/asn1/DERObject;

    move-result-object v0

    check-cast v0, Lorg/bouncycastle/asn1/ASN1Sequence;

    goto :goto_0

    .line 86
    :cond_4
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "unknown object in getInstance: "

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
.method protected addObject(Lorg/bouncycastle/asn1/DEREncodable;)V
    .locals 1
    .param p1, "obj"    # Lorg/bouncycastle/asn1/DEREncodable;

    .prologue
    .line 208
    iget-object v0, p0, Lorg/bouncycastle/asn1/ASN1Sequence;->seq:Ljava/util/Vector;

    invoke-virtual {v0, p1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 209
    return-void
.end method

.method asn1Equals(Lorg/bouncycastle/asn1/DERObject;)Z
    .locals 8
    .param p1, "o"    # Lorg/bouncycastle/asn1/DERObject;

    .prologue
    const/4 v6, 0x0

    .line 174
    instance-of v5, p1, Lorg/bouncycastle/asn1/ASN1Sequence;

    if-nez v5, :cond_0

    move v5, v6

    .line 202
    :goto_0
    return v5

    :cond_0
    move-object v2, p1

    .line 179
    check-cast v2, Lorg/bouncycastle/asn1/ASN1Sequence;

    .line 181
    .local v2, "other":Lorg/bouncycastle/asn1/ASN1Sequence;
    invoke-virtual {p0}, Lorg/bouncycastle/asn1/ASN1Sequence;->size()I

    move-result v5

    invoke-virtual {v2}, Lorg/bouncycastle/asn1/ASN1Sequence;->size()I

    move-result v7

    if-eq v5, v7, :cond_1

    move v5, v6

    .line 183
    goto :goto_0

    .line 186
    :cond_1
    invoke-virtual {p0}, Lorg/bouncycastle/asn1/ASN1Sequence;->getObjects()Ljava/util/Enumeration;

    move-result-object v3

    .line 187
    .local v3, "s1":Ljava/util/Enumeration;
    invoke-virtual {v2}, Lorg/bouncycastle/asn1/ASN1Sequence;->getObjects()Ljava/util/Enumeration;

    move-result-object v4

    .line 189
    .local v4, "s2":Ljava/util/Enumeration;
    :cond_2
    invoke-interface {v3}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v5

    if-eqz v5, :cond_4

    .line 191
    invoke-interface {v3}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lorg/bouncycastle/asn1/DEREncodable;

    invoke-interface {v5}, Lorg/bouncycastle/asn1/DEREncodable;->getDERObject()Lorg/bouncycastle/asn1/DERObject;

    move-result-object v0

    .line 192
    .local v0, "o1":Lorg/bouncycastle/asn1/DERObject;
    invoke-interface {v4}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lorg/bouncycastle/asn1/DEREncodable;

    invoke-interface {v5}, Lorg/bouncycastle/asn1/DEREncodable;->getDERObject()Lorg/bouncycastle/asn1/DERObject;

    move-result-object v1

    .line 194
    .local v1, "o2":Lorg/bouncycastle/asn1/DERObject;
    if-eq v0, v1, :cond_2

    if-eqz v0, :cond_3

    invoke-virtual {v0, v1}, Lorg/bouncycastle/asn1/DERObject;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_2

    :cond_3
    move v5, v6

    .line 199
    goto :goto_0

    .line 202
    .end local v0    # "o1":Lorg/bouncycastle/asn1/DERObject;
    .end local v1    # "o2":Lorg/bouncycastle/asn1/DERObject;
    :cond_4
    const/4 v5, 0x1

    goto :goto_0
.end method

.method abstract encode(Lorg/bouncycastle/asn1/DEROutputStream;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public getObjectAt(I)Lorg/bouncycastle/asn1/DEREncodable;
    .locals 1
    .param p1, "index"    # I

    .prologue
    .line 140
    iget-object v0, p0, Lorg/bouncycastle/asn1/ASN1Sequence;->seq:Ljava/util/Vector;

    invoke-virtual {v0, p1}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/bouncycastle/asn1/DEREncodable;

    return-object v0
.end method

.method public getObjects()Ljava/util/Enumeration;
    .locals 1

    .prologue
    .line 91
    iget-object v0, p0, Lorg/bouncycastle/asn1/ASN1Sequence;->seq:Ljava/util/Vector;

    invoke-virtual {v0}, Ljava/util/Vector;->elements()Ljava/util/Enumeration;

    move-result-object v0

    return-object v0
.end method

.method public hashCode()I
    .locals 4

    .prologue
    .line 155
    invoke-virtual {p0}, Lorg/bouncycastle/asn1/ASN1Sequence;->getObjects()Ljava/util/Enumeration;

    move-result-object v0

    .line 156
    .local v0, "e":Ljava/util/Enumeration;
    invoke-virtual {p0}, Lorg/bouncycastle/asn1/ASN1Sequence;->size()I

    move-result v1

    .line 158
    .local v1, "hashCode":I
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 160
    invoke-interface {v0}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v2

    .line 161
    .local v2, "o":Ljava/lang/Object;
    mul-int/lit8 v1, v1, 0x11

    .line 162
    if-eqz v2, :cond_0

    .line 164
    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v3

    xor-int/2addr v1, v3

    goto :goto_0

    .line 168
    .end local v2    # "o":Ljava/lang/Object;
    :cond_1
    return v1
.end method

.method public parser()Lorg/bouncycastle/asn1/ASN1SequenceParser;
    .locals 2

    .prologue
    .line 96
    move-object v0, p0

    .line 98
    .local v0, "outer":Lorg/bouncycastle/asn1/ASN1Sequence;
    new-instance v1, Lorg/bouncycastle/asn1/ASN1Sequence$1;

    invoke-direct {v1, p0, v0}, Lorg/bouncycastle/asn1/ASN1Sequence$1;-><init>(Lorg/bouncycastle/asn1/ASN1Sequence;Lorg/bouncycastle/asn1/ASN1Sequence;)V

    return-object v1
.end method

.method public size()I
    .locals 1

    .prologue
    .line 150
    iget-object v0, p0, Lorg/bouncycastle/asn1/ASN1Sequence;->seq:Ljava/util/Vector;

    invoke-virtual {v0}, Ljava/util/Vector;->size()I

    move-result v0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 216
    iget-object v0, p0, Lorg/bouncycastle/asn1/ASN1Sequence;->seq:Ljava/util/Vector;

    invoke-virtual {v0}, Ljava/util/Vector;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
