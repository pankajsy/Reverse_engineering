.class public Lorg/bouncycastle/asn1/DEREnumerated;
.super Lorg/bouncycastle/asn1/ASN1Object;
.source "DEREnumerated.java"


# instance fields
.field bytes:[B


# direct methods
.method public constructor <init>(I)V
    .locals 2
    .param p1, "value"    # I

    .prologue
    .line 57
    invoke-direct {p0}, Lorg/bouncycastle/asn1/ASN1Object;-><init>()V

    .line 58
    int-to-long v0, p1

    invoke-static {v0, v1}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    move-result-object v0

    invoke-virtual {v0}, Ljava/math/BigInteger;->toByteArray()[B

    move-result-object v0

    iput-object v0, p0, Lorg/bouncycastle/asn1/DEREnumerated;->bytes:[B

    .line 59
    return-void
.end method

.method public constructor <init>(Ljava/math/BigInteger;)V
    .locals 1
    .param p1, "value"    # Ljava/math/BigInteger;

    .prologue
    .line 63
    invoke-direct {p0}, Lorg/bouncycastle/asn1/ASN1Object;-><init>()V

    .line 64
    invoke-virtual {p1}, Ljava/math/BigInteger;->toByteArray()[B

    move-result-object v0

    iput-object v0, p0, Lorg/bouncycastle/asn1/DEREnumerated;->bytes:[B

    .line 65
    return-void
.end method

.method public constructor <init>([B)V
    .locals 0
    .param p1, "bytes"    # [B

    .prologue
    .line 69
    invoke-direct {p0}, Lorg/bouncycastle/asn1/ASN1Object;-><init>()V

    .line 70
    iput-object p1, p0, Lorg/bouncycastle/asn1/DEREnumerated;->bytes:[B

    .line 71
    return-void
.end method

.method public static getInstance(Ljava/lang/Object;)Lorg/bouncycastle/asn1/DEREnumerated;
    .locals 3
    .param p0, "obj"    # Ljava/lang/Object;

    .prologue
    .line 21
    if-eqz p0, :cond_0

    instance-of v0, p0, Lorg/bouncycastle/asn1/DEREnumerated;

    if-eqz v0, :cond_1

    .line 23
    :cond_0
    check-cast p0, Lorg/bouncycastle/asn1/DEREnumerated;

    .line 33
    .end local p0    # "obj":Ljava/lang/Object;
    :goto_0
    return-object p0

    .line 26
    .restart local p0    # "obj":Ljava/lang/Object;
    :cond_1
    instance-of v0, p0, Lorg/bouncycastle/asn1/ASN1OctetString;

    if-eqz v0, :cond_2

    .line 28
    new-instance v0, Lorg/bouncycastle/asn1/DEREnumerated;

    check-cast p0, Lorg/bouncycastle/asn1/ASN1OctetString;

    .end local p0    # "obj":Ljava/lang/Object;
    invoke-virtual {p0}, Lorg/bouncycastle/asn1/ASN1OctetString;->getOctets()[B

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/bouncycastle/asn1/DEREnumerated;-><init>([B)V

    move-object p0, v0

    goto :goto_0

    .line 31
    .restart local p0    # "obj":Ljava/lang/Object;
    :cond_2
    instance-of v0, p0, Lorg/bouncycastle/asn1/ASN1TaggedObject;

    if-eqz v0, :cond_3

    .line 33
    check-cast p0, Lorg/bouncycastle/asn1/ASN1TaggedObject;

    .end local p0    # "obj":Ljava/lang/Object;
    invoke-virtual {p0}, Lorg/bouncycastle/asn1/ASN1TaggedObject;->getObject()Lorg/bouncycastle/asn1/DERObject;

    move-result-object v0

    invoke-static {v0}, Lorg/bouncycastle/asn1/DEREnumerated;->getInstance(Ljava/lang/Object;)Lorg/bouncycastle/asn1/DEREnumerated;

    move-result-object p0

    goto :goto_0

    .line 36
    .restart local p0    # "obj":Ljava/lang/Object;
    :cond_3
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "illegal object in getInstance: "

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

.method public static getInstance(Lorg/bouncycastle/asn1/ASN1TaggedObject;Z)Lorg/bouncycastle/asn1/DEREnumerated;
    .locals 1
    .param p0, "obj"    # Lorg/bouncycastle/asn1/ASN1TaggedObject;
    .param p1, "explicit"    # Z

    .prologue
    .line 52
    invoke-virtual {p0}, Lorg/bouncycastle/asn1/ASN1TaggedObject;->getObject()Lorg/bouncycastle/asn1/DERObject;

    move-result-object v0

    invoke-static {v0}, Lorg/bouncycastle/asn1/DEREnumerated;->getInstance(Ljava/lang/Object;)Lorg/bouncycastle/asn1/DEREnumerated;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method asn1Equals(Lorg/bouncycastle/asn1/DERObject;)Z
    .locals 3
    .param p1, "o"    # Lorg/bouncycastle/asn1/DERObject;

    .prologue
    .line 88
    instance-of v1, p1, Lorg/bouncycastle/asn1/DEREnumerated;

    if-nez v1, :cond_0

    .line 90
    const/4 v1, 0x0

    .line 95
    :goto_0
    return v1

    :cond_0
    move-object v0, p1

    .line 93
    check-cast v0, Lorg/bouncycastle/asn1/DEREnumerated;

    .line 95
    .local v0, "other":Lorg/bouncycastle/asn1/DEREnumerated;
    iget-object v1, p0, Lorg/bouncycastle/asn1/DEREnumerated;->bytes:[B

    iget-object v2, v0, Lorg/bouncycastle/asn1/DEREnumerated;->bytes:[B

    invoke-static {v1, v2}, Lorg/bouncycastle/util/Arrays;->areEqual([B[B)Z

    move-result v1

    goto :goto_0
.end method

.method encode(Lorg/bouncycastle/asn1/DEROutputStream;)V
    .locals 2
    .param p1, "out"    # Lorg/bouncycastle/asn1/DEROutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 82
    const/16 v0, 0xa

    iget-object v1, p0, Lorg/bouncycastle/asn1/DEREnumerated;->bytes:[B

    invoke-virtual {p1, v0, v1}, Lorg/bouncycastle/asn1/DEROutputStream;->writeEncoded(I[B)V

    .line 83
    return-void
.end method

.method public getValue()Ljava/math/BigInteger;
    .locals 2

    .prologue
    .line 75
    new-instance v0, Ljava/math/BigInteger;

    iget-object v1, p0, Lorg/bouncycastle/asn1/DEREnumerated;->bytes:[B

    invoke-direct {v0, v1}, Ljava/math/BigInteger;-><init>([B)V

    return-object v0
.end method

.method public hashCode()I
    .locals 1

    .prologue
    .line 100
    iget-object v0, p0, Lorg/bouncycastle/asn1/DEREnumerated;->bytes:[B

    invoke-static {v0}, Lorg/bouncycastle/util/Arrays;->hashCode([B)I

    move-result v0

    return v0
.end method
