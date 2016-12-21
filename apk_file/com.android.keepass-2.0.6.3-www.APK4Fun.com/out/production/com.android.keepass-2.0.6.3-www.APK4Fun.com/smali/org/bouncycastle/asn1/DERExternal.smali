.class public Lorg/bouncycastle/asn1/DERExternal;
.super Lorg/bouncycastle/asn1/ASN1Object;
.source "DERExternal.java"


# instance fields
.field private dataValueDescriptor:Lorg/bouncycastle/asn1/ASN1Object;

.field private directReference:Lorg/bouncycastle/asn1/DERObjectIdentifier;

.field private encoding:I

.field private externalContent:Lorg/bouncycastle/asn1/DERObject;

.field private indirectReference:Lorg/bouncycastle/asn1/DERInteger;


# direct methods
.method public constructor <init>(Lorg/bouncycastle/asn1/ASN1EncodableVector;)V
    .locals 5
    .param p1, "vector"    # Lorg/bouncycastle/asn1/ASN1EncodableVector;

    .prologue
    .line 19
    invoke-direct {p0}, Lorg/bouncycastle/asn1/ASN1Object;-><init>()V

    .line 20
    const/4 v2, 0x0

    .line 21
    .local v2, "offset":I
    invoke-virtual {p1, v2}, Lorg/bouncycastle/asn1/ASN1EncodableVector;->get(I)Lorg/bouncycastle/asn1/DEREncodable;

    move-result-object v3

    invoke-interface {v3}, Lorg/bouncycastle/asn1/DEREncodable;->getDERObject()Lorg/bouncycastle/asn1/DERObject;

    move-result-object v0

    .line 22
    .local v0, "enc":Lorg/bouncycastle/asn1/DERObject;
    instance-of v3, v0, Lorg/bouncycastle/asn1/DERObjectIdentifier;

    if-eqz v3, :cond_0

    .line 24
    check-cast v0, Lorg/bouncycastle/asn1/DERObjectIdentifier;

    .end local v0    # "enc":Lorg/bouncycastle/asn1/DERObject;
    iput-object v0, p0, Lorg/bouncycastle/asn1/DERExternal;->directReference:Lorg/bouncycastle/asn1/DERObjectIdentifier;

    .line 25
    add-int/lit8 v2, v2, 0x1

    .line 26
    invoke-virtual {p1, v2}, Lorg/bouncycastle/asn1/ASN1EncodableVector;->get(I)Lorg/bouncycastle/asn1/DEREncodable;

    move-result-object v3

    invoke-interface {v3}, Lorg/bouncycastle/asn1/DEREncodable;->getDERObject()Lorg/bouncycastle/asn1/DERObject;

    move-result-object v0

    .line 28
    .restart local v0    # "enc":Lorg/bouncycastle/asn1/DERObject;
    :cond_0
    instance-of v3, v0, Lorg/bouncycastle/asn1/DERInteger;

    if-eqz v3, :cond_1

    .line 30
    check-cast v0, Lorg/bouncycastle/asn1/DERInteger;

    .end local v0    # "enc":Lorg/bouncycastle/asn1/DERObject;
    iput-object v0, p0, Lorg/bouncycastle/asn1/DERExternal;->indirectReference:Lorg/bouncycastle/asn1/DERInteger;

    .line 31
    add-int/lit8 v2, v2, 0x1

    .line 32
    invoke-virtual {p1, v2}, Lorg/bouncycastle/asn1/ASN1EncodableVector;->get(I)Lorg/bouncycastle/asn1/DEREncodable;

    move-result-object v3

    invoke-interface {v3}, Lorg/bouncycastle/asn1/DEREncodable;->getDERObject()Lorg/bouncycastle/asn1/DERObject;

    move-result-object v0

    .line 34
    .restart local v0    # "enc":Lorg/bouncycastle/asn1/DERObject;
    :cond_1
    instance-of v3, v0, Lorg/bouncycastle/asn1/DERTaggedObject;

    if-nez v3, :cond_2

    .line 36
    check-cast v0, Lorg/bouncycastle/asn1/ASN1Object;

    .end local v0    # "enc":Lorg/bouncycastle/asn1/DERObject;
    iput-object v0, p0, Lorg/bouncycastle/asn1/DERExternal;->dataValueDescriptor:Lorg/bouncycastle/asn1/ASN1Object;

    .line 37
    add-int/lit8 v2, v2, 0x1

    .line 38
    invoke-virtual {p1, v2}, Lorg/bouncycastle/asn1/ASN1EncodableVector;->get(I)Lorg/bouncycastle/asn1/DEREncodable;

    move-result-object v3

    invoke-interface {v3}, Lorg/bouncycastle/asn1/DEREncodable;->getDERObject()Lorg/bouncycastle/asn1/DERObject;

    move-result-object v0

    .line 40
    .restart local v0    # "enc":Lorg/bouncycastle/asn1/DERObject;
    :cond_2
    instance-of v3, v0, Lorg/bouncycastle/asn1/DERTaggedObject;

    if-nez v3, :cond_3

    .line 42
    new-instance v3, Ljava/lang/IllegalArgumentException;

    const-string v4, "No tagged object found in vector. Structure doesn\'t seem to be of type External"

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    :cond_3
    move-object v1, v0

    .line 44
    check-cast v1, Lorg/bouncycastle/asn1/DERTaggedObject;

    .line 45
    .local v1, "obj":Lorg/bouncycastle/asn1/DERTaggedObject;
    invoke-virtual {v1}, Lorg/bouncycastle/asn1/DERTaggedObject;->getTagNo()I

    move-result v3

    invoke-direct {p0, v3}, Lorg/bouncycastle/asn1/DERExternal;->setEncoding(I)V

    .line 46
    invoke-virtual {v1}, Lorg/bouncycastle/asn1/DERTaggedObject;->getObject()Lorg/bouncycastle/asn1/DERObject;

    move-result-object v3

    iput-object v3, p0, Lorg/bouncycastle/asn1/DERExternal;->externalContent:Lorg/bouncycastle/asn1/DERObject;

    .line 47
    return-void
.end method

.method public constructor <init>(Lorg/bouncycastle/asn1/DERObjectIdentifier;Lorg/bouncycastle/asn1/DERInteger;Lorg/bouncycastle/asn1/ASN1Object;ILorg/bouncycastle/asn1/DERObject;)V
    .locals 1
    .param p1, "directReference"    # Lorg/bouncycastle/asn1/DERObjectIdentifier;
    .param p2, "indirectReference"    # Lorg/bouncycastle/asn1/DERInteger;
    .param p3, "dataValueDescriptor"    # Lorg/bouncycastle/asn1/ASN1Object;
    .param p4, "encoding"    # I
    .param p5, "externalData"    # Lorg/bouncycastle/asn1/DERObject;

    .prologue
    .line 72
    invoke-direct {p0}, Lorg/bouncycastle/asn1/ASN1Object;-><init>()V

    .line 73
    invoke-direct {p0, p1}, Lorg/bouncycastle/asn1/DERExternal;->setDirectReference(Lorg/bouncycastle/asn1/DERObjectIdentifier;)V

    .line 74
    invoke-direct {p0, p2}, Lorg/bouncycastle/asn1/DERExternal;->setIndirectReference(Lorg/bouncycastle/asn1/DERInteger;)V

    .line 75
    invoke-direct {p0, p3}, Lorg/bouncycastle/asn1/DERExternal;->setDataValueDescriptor(Lorg/bouncycastle/asn1/ASN1Object;)V

    .line 76
    invoke-direct {p0, p4}, Lorg/bouncycastle/asn1/DERExternal;->setEncoding(I)V

    .line 77
    invoke-virtual {p5}, Lorg/bouncycastle/asn1/DERObject;->getDERObject()Lorg/bouncycastle/asn1/DERObject;

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/bouncycastle/asn1/DERExternal;->setExternalContent(Lorg/bouncycastle/asn1/DERObject;)V

    .line 78
    return-void
.end method

.method public constructor <init>(Lorg/bouncycastle/asn1/DERObjectIdentifier;Lorg/bouncycastle/asn1/DERInteger;Lorg/bouncycastle/asn1/ASN1Object;Lorg/bouncycastle/asn1/DERTaggedObject;)V
    .locals 6
    .param p1, "directReference"    # Lorg/bouncycastle/asn1/DERObjectIdentifier;
    .param p2, "indirectReference"    # Lorg/bouncycastle/asn1/DERInteger;
    .param p3, "dataValueDescriptor"    # Lorg/bouncycastle/asn1/ASN1Object;
    .param p4, "externalData"    # Lorg/bouncycastle/asn1/DERTaggedObject;

    .prologue
    .line 59
    invoke-virtual {p4}, Lorg/bouncycastle/asn1/DERTaggedObject;->getTagNo()I

    move-result v4

    invoke-virtual {p4}, Lorg/bouncycastle/asn1/DERTaggedObject;->getDERObject()Lorg/bouncycastle/asn1/DERObject;

    move-result-object v5

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    invoke-direct/range {v0 .. v5}, Lorg/bouncycastle/asn1/DERExternal;-><init>(Lorg/bouncycastle/asn1/DERObjectIdentifier;Lorg/bouncycastle/asn1/DERInteger;Lorg/bouncycastle/asn1/ASN1Object;ILorg/bouncycastle/asn1/DERObject;)V

    .line 60
    return-void
.end method

.method private setDataValueDescriptor(Lorg/bouncycastle/asn1/ASN1Object;)V
    .locals 0
    .param p1, "dataValueDescriptor"    # Lorg/bouncycastle/asn1/ASN1Object;

    .prologue
    .line 220
    iput-object p1, p0, Lorg/bouncycastle/asn1/DERExternal;->dataValueDescriptor:Lorg/bouncycastle/asn1/ASN1Object;

    .line 221
    return-void
.end method

.method private setDirectReference(Lorg/bouncycastle/asn1/DERObjectIdentifier;)V
    .locals 0
    .param p1, "directReferemce"    # Lorg/bouncycastle/asn1/DERObjectIdentifier;

    .prologue
    .line 229
    iput-object p1, p0, Lorg/bouncycastle/asn1/DERExternal;->directReference:Lorg/bouncycastle/asn1/DERObjectIdentifier;

    .line 230
    return-void
.end method

.method private setEncoding(I)V
    .locals 3
    .param p1, "encoding"    # I

    .prologue
    .line 243
    if-ltz p1, :cond_0

    const/4 v0, 0x2

    if-le p1, v0, :cond_1

    .line 245
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "invalid encoding value: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 247
    :cond_1
    iput p1, p0, Lorg/bouncycastle/asn1/DERExternal;->encoding:I

    .line 248
    return-void
.end method

.method private setExternalContent(Lorg/bouncycastle/asn1/DERObject;)V
    .locals 0
    .param p1, "externalContent"    # Lorg/bouncycastle/asn1/DERObject;

    .prologue
    .line 256
    iput-object p1, p0, Lorg/bouncycastle/asn1/DERExternal;->externalContent:Lorg/bouncycastle/asn1/DERObject;

    .line 257
    return-void
.end method

.method private setIndirectReference(Lorg/bouncycastle/asn1/DERInteger;)V
    .locals 0
    .param p1, "indirectReference"    # Lorg/bouncycastle/asn1/DERInteger;

    .prologue
    .line 265
    iput-object p1, p0, Lorg/bouncycastle/asn1/DERExternal;->indirectReference:Lorg/bouncycastle/asn1/DERInteger;

    .line 266
    return-void
.end method


# virtual methods
.method asn1Equals(Lorg/bouncycastle/asn1/DERObject;)Z
    .locals 4
    .param p1, "o"    # Lorg/bouncycastle/asn1/DERObject;

    .prologue
    const/4 v1, 0x0

    .line 131
    instance-of v2, p1, Lorg/bouncycastle/asn1/DERExternal;

    if-nez v2, :cond_1

    .line 161
    :cond_0
    :goto_0
    return v1

    .line 135
    :cond_1
    if-ne p0, p1, :cond_2

    .line 137
    const/4 v1, 0x1

    goto :goto_0

    :cond_2
    move-object v0, p1

    .line 139
    check-cast v0, Lorg/bouncycastle/asn1/DERExternal;

    .line 140
    .local v0, "other":Lorg/bouncycastle/asn1/DERExternal;
    iget-object v2, p0, Lorg/bouncycastle/asn1/DERExternal;->directReference:Lorg/bouncycastle/asn1/DERObjectIdentifier;

    if-eqz v2, :cond_3

    .line 142
    iget-object v2, v0, Lorg/bouncycastle/asn1/DERExternal;->directReference:Lorg/bouncycastle/asn1/DERObjectIdentifier;

    if-eqz v2, :cond_0

    iget-object v2, v0, Lorg/bouncycastle/asn1/DERExternal;->directReference:Lorg/bouncycastle/asn1/DERObjectIdentifier;

    iget-object v3, p0, Lorg/bouncycastle/asn1/DERExternal;->directReference:Lorg/bouncycastle/asn1/DERObjectIdentifier;

    invoke-virtual {v2, v3}, Lorg/bouncycastle/asn1/DERObjectIdentifier;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 147
    :cond_3
    iget-object v2, p0, Lorg/bouncycastle/asn1/DERExternal;->indirectReference:Lorg/bouncycastle/asn1/DERInteger;

    if-eqz v2, :cond_4

    .line 149
    iget-object v2, v0, Lorg/bouncycastle/asn1/DERExternal;->indirectReference:Lorg/bouncycastle/asn1/DERInteger;

    if-eqz v2, :cond_0

    iget-object v2, v0, Lorg/bouncycastle/asn1/DERExternal;->indirectReference:Lorg/bouncycastle/asn1/DERInteger;

    iget-object v3, p0, Lorg/bouncycastle/asn1/DERExternal;->indirectReference:Lorg/bouncycastle/asn1/DERInteger;

    invoke-virtual {v2, v3}, Lorg/bouncycastle/asn1/DERInteger;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 154
    :cond_4
    iget-object v2, p0, Lorg/bouncycastle/asn1/DERExternal;->dataValueDescriptor:Lorg/bouncycastle/asn1/ASN1Object;

    if-eqz v2, :cond_5

    .line 156
    iget-object v2, v0, Lorg/bouncycastle/asn1/DERExternal;->dataValueDescriptor:Lorg/bouncycastle/asn1/ASN1Object;

    if-eqz v2, :cond_0

    iget-object v2, v0, Lorg/bouncycastle/asn1/DERExternal;->dataValueDescriptor:Lorg/bouncycastle/asn1/ASN1Object;

    iget-object v3, p0, Lorg/bouncycastle/asn1/DERExternal;->dataValueDescriptor:Lorg/bouncycastle/asn1/ASN1Object;

    invoke-virtual {v2, v3}, Lorg/bouncycastle/asn1/ASN1Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 161
    :cond_5
    iget-object v1, p0, Lorg/bouncycastle/asn1/DERExternal;->externalContent:Lorg/bouncycastle/asn1/DERObject;

    iget-object v2, v0, Lorg/bouncycastle/asn1/DERExternal;->externalContent:Lorg/bouncycastle/asn1/DERObject;

    invoke-virtual {v1, v2}, Lorg/bouncycastle/asn1/DERObject;->equals(Ljava/lang/Object;)Z

    move-result v1

    goto :goto_0
.end method

.method encode(Lorg/bouncycastle/asn1/DEROutputStream;)V
    .locals 5
    .param p1, "out"    # Lorg/bouncycastle/asn1/DEROutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 108
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 109
    .local v0, "baos":Ljava/io/ByteArrayOutputStream;
    iget-object v2, p0, Lorg/bouncycastle/asn1/DERExternal;->directReference:Lorg/bouncycastle/asn1/DERObjectIdentifier;

    if-eqz v2, :cond_0

    .line 111
    iget-object v2, p0, Lorg/bouncycastle/asn1/DERExternal;->directReference:Lorg/bouncycastle/asn1/DERObjectIdentifier;

    invoke-virtual {v2}, Lorg/bouncycastle/asn1/DERObjectIdentifier;->getDEREncoded()[B

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/io/ByteArrayOutputStream;->write([B)V

    .line 113
    :cond_0
    iget-object v2, p0, Lorg/bouncycastle/asn1/DERExternal;->indirectReference:Lorg/bouncycastle/asn1/DERInteger;

    if-eqz v2, :cond_1

    .line 115
    iget-object v2, p0, Lorg/bouncycastle/asn1/DERExternal;->indirectReference:Lorg/bouncycastle/asn1/DERInteger;

    invoke-virtual {v2}, Lorg/bouncycastle/asn1/DERInteger;->getDEREncoded()[B

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/io/ByteArrayOutputStream;->write([B)V

    .line 117
    :cond_1
    iget-object v2, p0, Lorg/bouncycastle/asn1/DERExternal;->dataValueDescriptor:Lorg/bouncycastle/asn1/ASN1Object;

    if-eqz v2, :cond_2

    .line 119
    iget-object v2, p0, Lorg/bouncycastle/asn1/DERExternal;->dataValueDescriptor:Lorg/bouncycastle/asn1/ASN1Object;

    invoke-virtual {v2}, Lorg/bouncycastle/asn1/ASN1Object;->getDEREncoded()[B

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/io/ByteArrayOutputStream;->write([B)V

    .line 121
    :cond_2
    new-instance v1, Lorg/bouncycastle/asn1/DERTaggedObject;

    iget v2, p0, Lorg/bouncycastle/asn1/DERExternal;->encoding:I

    iget-object v3, p0, Lorg/bouncycastle/asn1/DERExternal;->externalContent:Lorg/bouncycastle/asn1/DERObject;

    invoke-direct {v1, v2, v3}, Lorg/bouncycastle/asn1/DERTaggedObject;-><init>(ILorg/bouncycastle/asn1/DEREncodable;)V

    .line 122
    .local v1, "obj":Lorg/bouncycastle/asn1/DERTaggedObject;
    invoke-virtual {v1}, Lorg/bouncycastle/asn1/DERTaggedObject;->getDEREncoded()[B

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/io/ByteArrayOutputStream;->write([B)V

    .line 123
    const/16 v2, 0x20

    const/16 v3, 0x8

    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v4

    invoke-virtual {p1, v2, v3, v4}, Lorg/bouncycastle/asn1/DEROutputStream;->writeEncoded(II[B)V

    .line 124
    return-void
.end method

.method public getDataValueDescriptor()Lorg/bouncycastle/asn1/ASN1Object;
    .locals 1

    .prologue
    .line 170
    iget-object v0, p0, Lorg/bouncycastle/asn1/DERExternal;->dataValueDescriptor:Lorg/bouncycastle/asn1/ASN1Object;

    return-object v0
.end method

.method public getDirectReference()Lorg/bouncycastle/asn1/DERObjectIdentifier;
    .locals 1

    .prologue
    .line 179
    iget-object v0, p0, Lorg/bouncycastle/asn1/DERExternal;->directReference:Lorg/bouncycastle/asn1/DERObjectIdentifier;

    return-object v0
.end method

.method public getEncoding()I
    .locals 1

    .prologue
    .line 193
    iget v0, p0, Lorg/bouncycastle/asn1/DERExternal;->encoding:I

    return v0
.end method

.method public getExternalContent()Lorg/bouncycastle/asn1/DERObject;
    .locals 1

    .prologue
    .line 202
    iget-object v0, p0, Lorg/bouncycastle/asn1/DERExternal;->externalContent:Lorg/bouncycastle/asn1/DERObject;

    return-object v0
.end method

.method public getIndirectReference()Lorg/bouncycastle/asn1/DERInteger;
    .locals 1

    .prologue
    .line 211
    iget-object v0, p0, Lorg/bouncycastle/asn1/DERExternal;->indirectReference:Lorg/bouncycastle/asn1/DERInteger;

    return-object v0
.end method

.method public hashCode()I
    .locals 2

    .prologue
    .line 85
    const/4 v0, 0x0

    .line 86
    .local v0, "ret":I
    iget-object v1, p0, Lorg/bouncycastle/asn1/DERExternal;->directReference:Lorg/bouncycastle/asn1/DERObjectIdentifier;

    if-eqz v1, :cond_0

    .line 88
    iget-object v1, p0, Lorg/bouncycastle/asn1/DERExternal;->directReference:Lorg/bouncycastle/asn1/DERObjectIdentifier;

    invoke-virtual {v1}, Lorg/bouncycastle/asn1/DERObjectIdentifier;->hashCode()I

    move-result v0

    .line 90
    :cond_0
    iget-object v1, p0, Lorg/bouncycastle/asn1/DERExternal;->indirectReference:Lorg/bouncycastle/asn1/DERInteger;

    if-eqz v1, :cond_1

    .line 92
    iget-object v1, p0, Lorg/bouncycastle/asn1/DERExternal;->indirectReference:Lorg/bouncycastle/asn1/DERInteger;

    invoke-virtual {v1}, Lorg/bouncycastle/asn1/DERInteger;->hashCode()I

    move-result v1

    xor-int/2addr v0, v1

    .line 94
    :cond_1
    iget-object v1, p0, Lorg/bouncycastle/asn1/DERExternal;->dataValueDescriptor:Lorg/bouncycastle/asn1/ASN1Object;

    if-eqz v1, :cond_2

    .line 96
    iget-object v1, p0, Lorg/bouncycastle/asn1/DERExternal;->dataValueDescriptor:Lorg/bouncycastle/asn1/ASN1Object;

    invoke-virtual {v1}, Lorg/bouncycastle/asn1/ASN1Object;->hashCode()I

    move-result v1

    xor-int/2addr v0, v1

    .line 98
    :cond_2
    iget-object v1, p0, Lorg/bouncycastle/asn1/DERExternal;->externalContent:Lorg/bouncycastle/asn1/DERObject;

    invoke-virtual {v1}, Lorg/bouncycastle/asn1/DERObject;->hashCode()I

    move-result v1

    xor-int/2addr v0, v1

    .line 99
    return v0
.end method
