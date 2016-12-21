.class public abstract Lorg/bouncycastle/asn1/ASN1Set;
.super Lorg/bouncycastle/asn1/ASN1Object;
.source "ASN1Set.java"


# instance fields
.field protected set:Ljava/util/Vector;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 105
    invoke-direct {p0}, Lorg/bouncycastle/asn1/ASN1Object;-><init>()V

    .line 12
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lorg/bouncycastle/asn1/ASN1Set;->set:Ljava/util/Vector;

    .line 106
    return-void
.end method

.method private getEncoded(Lorg/bouncycastle/asn1/DEREncodable;)[B
    .locals 5
    .param p1, "obj"    # Lorg/bouncycastle/asn1/DEREncodable;

    .prologue
    .line 274
    new-instance v1, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v1}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 275
    .local v1, "bOut":Ljava/io/ByteArrayOutputStream;
    new-instance v0, Lorg/bouncycastle/asn1/ASN1OutputStream;

    invoke-direct {v0, v1}, Lorg/bouncycastle/asn1/ASN1OutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 279
    .local v0, "aOut":Lorg/bouncycastle/asn1/ASN1OutputStream;
    :try_start_0
    invoke-virtual {v0, p1}, Lorg/bouncycastle/asn1/ASN1OutputStream;->writeObject(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 286
    invoke-virtual {v1}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v3

    return-object v3

    .line 281
    :catch_0
    move-exception v2

    .line 283
    .local v2, "e":Ljava/io/IOException;
    new-instance v3, Ljava/lang/IllegalArgumentException;

    const-string v4, "cannot encode object added to SET"

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3
.end method

.method public static getInstance(Ljava/lang/Object;)Lorg/bouncycastle/asn1/ASN1Set;
    .locals 3
    .param p0, "obj"    # Ljava/lang/Object;

    .prologue
    .line 23
    if-eqz p0, :cond_0

    instance-of v0, p0, Lorg/bouncycastle/asn1/ASN1Set;

    if-eqz v0, :cond_1

    .line 25
    :cond_0
    check-cast p0, Lorg/bouncycastle/asn1/ASN1Set;

    .end local p0    # "obj":Ljava/lang/Object;
    return-object p0

    .line 28
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

.method public static getInstance(Lorg/bouncycastle/asn1/ASN1TaggedObject;Z)Lorg/bouncycastle/asn1/ASN1Set;
    .locals 7
    .param p0, "obj"    # Lorg/bouncycastle/asn1/ASN1TaggedObject;
    .param p1, "explicit"    # Z

    .prologue
    .line 51
    if-eqz p1, :cond_1

    .line 53
    invoke-virtual {p0}, Lorg/bouncycastle/asn1/ASN1TaggedObject;->isExplicit()Z

    move-result v4

    if-nez v4, :cond_0

    .line 55
    new-instance v4, Ljava/lang/IllegalArgumentException;

    const-string v5, "object implicit - explicit expected."

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 58
    :cond_0
    invoke-virtual {p0}, Lorg/bouncycastle/asn1/ASN1TaggedObject;->getObject()Lorg/bouncycastle/asn1/DERObject;

    move-result-object v4

    check-cast v4, Lorg/bouncycastle/asn1/ASN1Set;

    .line 96
    :goto_0
    return-object v4

    .line 67
    :cond_1
    invoke-virtual {p0}, Lorg/bouncycastle/asn1/ASN1TaggedObject;->isExplicit()Z

    move-result v4

    if-eqz v4, :cond_2

    .line 69
    new-instance v2, Lorg/bouncycastle/asn1/DERSet;

    invoke-virtual {p0}, Lorg/bouncycastle/asn1/ASN1TaggedObject;->getObject()Lorg/bouncycastle/asn1/DERObject;

    move-result-object v4

    invoke-direct {v2, v4}, Lorg/bouncycastle/asn1/DERSet;-><init>(Lorg/bouncycastle/asn1/DEREncodable;)V

    .local v2, "set":Lorg/bouncycastle/asn1/ASN1Set;
    move-object v4, v2

    .line 71
    goto :goto_0

    .line 75
    .end local v2    # "set":Lorg/bouncycastle/asn1/ASN1Set;
    :cond_2
    invoke-virtual {p0}, Lorg/bouncycastle/asn1/ASN1TaggedObject;->getObject()Lorg/bouncycastle/asn1/DERObject;

    move-result-object v4

    instance-of v4, v4, Lorg/bouncycastle/asn1/ASN1Set;

    if-eqz v4, :cond_3

    .line 77
    invoke-virtual {p0}, Lorg/bouncycastle/asn1/ASN1TaggedObject;->getObject()Lorg/bouncycastle/asn1/DERObject;

    move-result-object v4

    check-cast v4, Lorg/bouncycastle/asn1/ASN1Set;

    goto :goto_0

    .line 84
    :cond_3
    new-instance v3, Lorg/bouncycastle/asn1/ASN1EncodableVector;

    invoke-direct {v3}, Lorg/bouncycastle/asn1/ASN1EncodableVector;-><init>()V

    .line 86
    .local v3, "v":Lorg/bouncycastle/asn1/ASN1EncodableVector;
    invoke-virtual {p0}, Lorg/bouncycastle/asn1/ASN1TaggedObject;->getObject()Lorg/bouncycastle/asn1/DERObject;

    move-result-object v4

    instance-of v4, v4, Lorg/bouncycastle/asn1/ASN1Sequence;

    if-eqz v4, :cond_5

    .line 88
    invoke-virtual {p0}, Lorg/bouncycastle/asn1/ASN1TaggedObject;->getObject()Lorg/bouncycastle/asn1/DERObject;

    move-result-object v1

    check-cast v1, Lorg/bouncycastle/asn1/ASN1Sequence;

    .line 89
    .local v1, "s":Lorg/bouncycastle/asn1/ASN1Sequence;
    invoke-virtual {v1}, Lorg/bouncycastle/asn1/ASN1Sequence;->getObjects()Ljava/util/Enumeration;

    move-result-object v0

    .line 91
    .local v0, "e":Ljava/util/Enumeration;
    :goto_1
    invoke-interface {v0}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v4

    if-eqz v4, :cond_4

    .line 93
    invoke-interface {v0}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/bouncycastle/asn1/DEREncodable;

    invoke-virtual {v3, v4}, Lorg/bouncycastle/asn1/ASN1EncodableVector;->add(Lorg/bouncycastle/asn1/DEREncodable;)V

    goto :goto_1

    .line 96
    :cond_4
    new-instance v4, Lorg/bouncycastle/asn1/DERSet;

    const/4 v5, 0x0

    invoke-direct {v4, v3, v5}, Lorg/bouncycastle/asn1/DERSet;-><init>(Lorg/bouncycastle/asn1/DEREncodableVector;Z)V

    goto :goto_0

    .line 101
    .end local v0    # "e":Ljava/util/Enumeration;
    .end local v1    # "s":Lorg/bouncycastle/asn1/ASN1Sequence;
    :cond_5
    new-instance v4, Ljava/lang/IllegalArgumentException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "unknown object in getInstance: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4
.end method

.method private lessThanOrEqual([B[B)Z
    .locals 7
    .param p1, "a"    # [B
    .param p2, "b"    # [B

    .prologue
    const/4 v3, 0x1

    const/4 v4, 0x0

    .line 231
    array-length v5, p1

    array-length v6, p2

    if-gt v5, v6, :cond_3

    .line 233
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v5, p1

    if-eq v0, v5, :cond_0

    .line 235
    aget-byte v5, p1, v0

    and-int/lit16 v1, v5, 0xff

    .line 236
    .local v1, "l":I
    aget-byte v5, p2, v0

    and-int/lit16 v2, v5, 0xff

    .line 238
    .local v2, "r":I
    if-le v2, v1, :cond_1

    .line 267
    .end local v1    # "l":I
    .end local v2    # "r":I
    :cond_0
    :goto_1
    return v3

    .line 242
    .restart local v1    # "l":I
    .restart local v2    # "r":I
    :cond_1
    if-le v1, v2, :cond_2

    move v3, v4

    .line 244
    goto :goto_1

    .line 233
    :cond_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 252
    .end local v0    # "i":I
    .end local v1    # "l":I
    .end local v2    # "r":I
    :cond_3
    const/4 v0, 0x0

    .restart local v0    # "i":I
    :goto_2
    array-length v5, p2

    if-eq v0, v5, :cond_5

    .line 254
    aget-byte v5, p1, v0

    and-int/lit16 v1, v5, 0xff

    .line 255
    .restart local v1    # "l":I
    aget-byte v5, p2, v0

    and-int/lit16 v2, v5, 0xff

    .line 257
    .restart local v2    # "r":I
    if-gt v2, v1, :cond_0

    .line 261
    if-le v1, v2, :cond_4

    move v3, v4

    .line 263
    goto :goto_1

    .line 252
    :cond_4
    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    .end local v1    # "l":I
    .end local v2    # "r":I
    :cond_5
    move v3, v4

    .line 267
    goto :goto_1
.end method


# virtual methods
.method protected addObject(Lorg/bouncycastle/asn1/DEREncodable;)V
    .locals 1
    .param p1, "obj"    # Lorg/bouncycastle/asn1/DEREncodable;

    .prologue
    .line 334
    iget-object v0, p0, Lorg/bouncycastle/asn1/ASN1Set;->set:Ljava/util/Vector;

    invoke-virtual {v0, p1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 335
    return-void
.end method

.method asn1Equals(Lorg/bouncycastle/asn1/DERObject;)Z
    .locals 8
    .param p1, "o"    # Lorg/bouncycastle/asn1/DERObject;

    .prologue
    const/4 v6, 0x0

    .line 193
    instance-of v5, p1, Lorg/bouncycastle/asn1/ASN1Set;

    if-nez v5, :cond_0

    move v5, v6

    .line 221
    :goto_0
    return v5

    :cond_0
    move-object v2, p1

    .line 198
    check-cast v2, Lorg/bouncycastle/asn1/ASN1Set;

    .line 200
    .local v2, "other":Lorg/bouncycastle/asn1/ASN1Set;
    invoke-virtual {p0}, Lorg/bouncycastle/asn1/ASN1Set;->size()I

    move-result v5

    invoke-virtual {v2}, Lorg/bouncycastle/asn1/ASN1Set;->size()I

    move-result v7

    if-eq v5, v7, :cond_1

    move v5, v6

    .line 202
    goto :goto_0

    .line 205
    :cond_1
    invoke-virtual {p0}, Lorg/bouncycastle/asn1/ASN1Set;->getObjects()Ljava/util/Enumeration;

    move-result-object v3

    .line 206
    .local v3, "s1":Ljava/util/Enumeration;
    invoke-virtual {v2}, Lorg/bouncycastle/asn1/ASN1Set;->getObjects()Ljava/util/Enumeration;

    move-result-object v4

    .line 208
    .local v4, "s2":Ljava/util/Enumeration;
    :cond_2
    invoke-interface {v3}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v5

    if-eqz v5, :cond_4

    .line 210
    invoke-interface {v3}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lorg/bouncycastle/asn1/DEREncodable;

    invoke-interface {v5}, Lorg/bouncycastle/asn1/DEREncodable;->getDERObject()Lorg/bouncycastle/asn1/DERObject;

    move-result-object v0

    .line 211
    .local v0, "o1":Lorg/bouncycastle/asn1/DERObject;
    invoke-interface {v4}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lorg/bouncycastle/asn1/DEREncodable;

    invoke-interface {v5}, Lorg/bouncycastle/asn1/DEREncodable;->getDERObject()Lorg/bouncycastle/asn1/DERObject;

    move-result-object v1

    .line 213
    .local v1, "o2":Lorg/bouncycastle/asn1/DERObject;
    if-eq v0, v1, :cond_2

    if-eqz v0, :cond_3

    invoke-virtual {v0, v1}, Lorg/bouncycastle/asn1/DERObject;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_2

    :cond_3
    move v5, v6

    .line 218
    goto :goto_0

    .line 221
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
    .line 122
    iget-object v0, p0, Lorg/bouncycastle/asn1/ASN1Set;->set:Ljava/util/Vector;

    invoke-virtual {v0, p1}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/bouncycastle/asn1/DEREncodable;

    return-object v0
.end method

.method public getObjects()Ljava/util/Enumeration;
    .locals 1

    .prologue
    .line 110
    iget-object v0, p0, Lorg/bouncycastle/asn1/ASN1Set;->set:Ljava/util/Vector;

    invoke-virtual {v0}, Ljava/util/Vector;->elements()Ljava/util/Enumeration;

    move-result-object v0

    return-object v0
.end method

.method public hashCode()I
    .locals 4

    .prologue
    .line 174
    invoke-virtual {p0}, Lorg/bouncycastle/asn1/ASN1Set;->getObjects()Ljava/util/Enumeration;

    move-result-object v0

    .line 175
    .local v0, "e":Ljava/util/Enumeration;
    invoke-virtual {p0}, Lorg/bouncycastle/asn1/ASN1Set;->size()I

    move-result v1

    .line 177
    .local v1, "hashCode":I
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 179
    invoke-interface {v0}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v2

    .line 180
    .local v2, "o":Ljava/lang/Object;
    mul-int/lit8 v1, v1, 0x11

    .line 181
    if-eqz v2, :cond_0

    .line 183
    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v3

    xor-int/2addr v1, v3

    goto :goto_0

    .line 187
    .end local v2    # "o":Ljava/lang/Object;
    :cond_1
    return v1
.end method

.method public parser()Lorg/bouncycastle/asn1/ASN1SetParser;
    .locals 2

    .prologue
    .line 137
    move-object v0, p0

    .line 139
    .local v0, "outer":Lorg/bouncycastle/asn1/ASN1Set;
    new-instance v1, Lorg/bouncycastle/asn1/ASN1Set$1;

    invoke-direct {v1, p0, v0}, Lorg/bouncycastle/asn1/ASN1Set$1;-><init>(Lorg/bouncycastle/asn1/ASN1Set;Lorg/bouncycastle/asn1/ASN1Set;)V

    return-object v1
.end method

.method public size()I
    .locals 1

    .prologue
    .line 132
    iget-object v0, p0, Lorg/bouncycastle/asn1/ASN1Set;->set:Ljava/util/Vector;

    invoke-virtual {v0}, Ljava/util/Vector;->size()I

    move-result v0

    return v0
.end method

.method protected sort()V
    .locals 10

    .prologue
    .line 291
    iget-object v7, p0, Lorg/bouncycastle/asn1/ASN1Set;->set:Ljava/util/Vector;

    invoke-virtual {v7}, Ljava/util/Vector;->size()I

    move-result v7

    const/4 v8, 0x1

    if-le v7, v8, :cond_2

    .line 293
    const/4 v6, 0x1

    .line 294
    .local v6, "swapped":Z
    iget-object v7, p0, Lorg/bouncycastle/asn1/ASN1Set;->set:Ljava/util/Vector;

    invoke-virtual {v7}, Ljava/util/Vector;->size()I

    move-result v7

    add-int/lit8 v3, v7, -0x1

    .line 296
    .local v3, "lastSwap":I
    :goto_0
    if-eqz v6, :cond_2

    .line 298
    const/4 v2, 0x0

    .line 299
    .local v2, "index":I
    const/4 v5, 0x0

    .line 300
    .local v5, "swapIndex":I
    iget-object v7, p0, Lorg/bouncycastle/asn1/ASN1Set;->set:Ljava/util/Vector;

    const/4 v8, 0x0

    invoke-virtual {v7, v8}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lorg/bouncycastle/asn1/DEREncodable;

    invoke-direct {p0, v7}, Lorg/bouncycastle/asn1/ASN1Set;->getEncoded(Lorg/bouncycastle/asn1/DEREncodable;)[B

    move-result-object v0

    .line 302
    .local v0, "a":[B
    const/4 v6, 0x0

    .line 304
    :goto_1
    if-eq v2, v3, :cond_1

    .line 306
    iget-object v7, p0, Lorg/bouncycastle/asn1/ASN1Set;->set:Ljava/util/Vector;

    add-int/lit8 v8, v2, 0x1

    invoke-virtual {v7, v8}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lorg/bouncycastle/asn1/DEREncodable;

    invoke-direct {p0, v7}, Lorg/bouncycastle/asn1/ASN1Set;->getEncoded(Lorg/bouncycastle/asn1/DEREncodable;)[B

    move-result-object v1

    .line 308
    .local v1, "b":[B
    invoke-direct {p0, v0, v1}, Lorg/bouncycastle/asn1/ASN1Set;->lessThanOrEqual([B[B)Z

    move-result v7

    if-eqz v7, :cond_0

    .line 310
    move-object v0, v1

    .line 323
    :goto_2
    add-int/lit8 v2, v2, 0x1

    .line 324
    goto :goto_1

    .line 314
    :cond_0
    iget-object v7, p0, Lorg/bouncycastle/asn1/ASN1Set;->set:Ljava/util/Vector;

    invoke-virtual {v7, v2}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v4

    .line 316
    .local v4, "o":Ljava/lang/Object;
    iget-object v7, p0, Lorg/bouncycastle/asn1/ASN1Set;->set:Ljava/util/Vector;

    iget-object v8, p0, Lorg/bouncycastle/asn1/ASN1Set;->set:Ljava/util/Vector;

    add-int/lit8 v9, v2, 0x1

    invoke-virtual {v8, v9}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v8

    invoke-virtual {v7, v8, v2}, Ljava/util/Vector;->setElementAt(Ljava/lang/Object;I)V

    .line 317
    iget-object v7, p0, Lorg/bouncycastle/asn1/ASN1Set;->set:Ljava/util/Vector;

    add-int/lit8 v8, v2, 0x1

    invoke-virtual {v7, v4, v8}, Ljava/util/Vector;->setElementAt(Ljava/lang/Object;I)V

    .line 319
    const/4 v6, 0x1

    .line 320
    move v5, v2

    goto :goto_2

    .line 326
    .end local v1    # "b":[B
    .end local v4    # "o":Ljava/lang/Object;
    :cond_1
    move v3, v5

    .line 327
    goto :goto_0

    .line 329
    .end local v0    # "a":[B
    .end local v2    # "index":I
    .end local v3    # "lastSwap":I
    .end local v5    # "swapIndex":I
    .end local v6    # "swapped":Z
    :cond_2
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 342
    iget-object v0, p0, Lorg/bouncycastle/asn1/ASN1Set;->set:Ljava/util/Vector;

    invoke-virtual {v0}, Ljava/util/Vector;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
