.class public Lorg/bouncycastle/asn1/DERGeneralString;
.super Lorg/bouncycastle/asn1/ASN1Object;
.source "DERGeneralString.java"

# interfaces
.implements Lorg/bouncycastle/asn1/DERString;


# instance fields
.field private string:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 0
    .param p1, "string"    # Ljava/lang/String;

    .prologue
    .line 47
    invoke-direct {p0}, Lorg/bouncycastle/asn1/ASN1Object;-><init>()V

    .line 48
    iput-object p1, p0, Lorg/bouncycastle/asn1/DERGeneralString;->string:Ljava/lang/String;

    .line 49
    return-void
.end method

.method public constructor <init>([B)V
    .locals 3
    .param p1, "string"    # [B

    .prologue
    .line 37
    invoke-direct {p0}, Lorg/bouncycastle/asn1/ASN1Object;-><init>()V

    .line 38
    array-length v2, p1

    new-array v0, v2, [C

    .line 39
    .local v0, "cs":[C
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    array-length v2, v0

    if-eq v1, v2, :cond_0

    .line 41
    aget-byte v2, p1, v1

    and-int/lit16 v2, v2, 0xff

    int-to-char v2, v2

    aput-char v2, v0, v1

    .line 39
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 43
    :cond_0
    new-instance v2, Ljava/lang/String;

    invoke-direct {v2, v0}, Ljava/lang/String;-><init>([C)V

    iput-object v2, p0, Lorg/bouncycastle/asn1/DERGeneralString;->string:Ljava/lang/String;

    .line 44
    return-void
.end method

.method public static getInstance(Ljava/lang/Object;)Lorg/bouncycastle/asn1/DERGeneralString;
    .locals 3
    .param p0, "obj"    # Ljava/lang/Object;

    .prologue
    .line 13
    if-eqz p0, :cond_0

    instance-of v0, p0, Lorg/bouncycastle/asn1/DERGeneralString;

    if-eqz v0, :cond_1

    .line 15
    :cond_0
    check-cast p0, Lorg/bouncycastle/asn1/DERGeneralString;

    .line 23
    .end local p0    # "obj":Ljava/lang/Object;
    :goto_0
    return-object p0

    .line 17
    .restart local p0    # "obj":Ljava/lang/Object;
    :cond_1
    instance-of v0, p0, Lorg/bouncycastle/asn1/ASN1OctetString;

    if-eqz v0, :cond_2

    .line 19
    new-instance v0, Lorg/bouncycastle/asn1/DERGeneralString;

    check-cast p0, Lorg/bouncycastle/asn1/ASN1OctetString;

    .end local p0    # "obj":Ljava/lang/Object;
    invoke-virtual {p0}, Lorg/bouncycastle/asn1/ASN1OctetString;->getOctets()[B

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/bouncycastle/asn1/DERGeneralString;-><init>([B)V

    move-object p0, v0

    goto :goto_0

    .line 21
    .restart local p0    # "obj":Ljava/lang/Object;
    :cond_2
    instance-of v0, p0, Lorg/bouncycastle/asn1/ASN1TaggedObject;

    if-eqz v0, :cond_3

    .line 23
    check-cast p0, Lorg/bouncycastle/asn1/ASN1TaggedObject;

    .end local p0    # "obj":Ljava/lang/Object;
    invoke-virtual {p0}, Lorg/bouncycastle/asn1/ASN1TaggedObject;->getObject()Lorg/bouncycastle/asn1/DERObject;

    move-result-object v0

    invoke-static {v0}, Lorg/bouncycastle/asn1/DERGeneralString;->getInstance(Ljava/lang/Object;)Lorg/bouncycastle/asn1/DERGeneralString;

    move-result-object p0

    goto :goto_0

    .line 25
    .restart local p0    # "obj":Ljava/lang/Object;
    :cond_3
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "illegal object in getInstance: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 26
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

.method public static getInstance(Lorg/bouncycastle/asn1/ASN1TaggedObject;Z)Lorg/bouncycastle/asn1/DERGeneralString;
    .locals 1
    .param p0, "obj"    # Lorg/bouncycastle/asn1/ASN1TaggedObject;
    .param p1, "explicit"    # Z

    .prologue
    .line 33
    invoke-virtual {p0}, Lorg/bouncycastle/asn1/ASN1TaggedObject;->getObject()Lorg/bouncycastle/asn1/DERObject;

    move-result-object v0

    invoke-static {v0}, Lorg/bouncycastle/asn1/DERGeneralString;->getInstance(Ljava/lang/Object;)Lorg/bouncycastle/asn1/DERGeneralString;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method asn1Equals(Lorg/bouncycastle/asn1/DERObject;)Z
    .locals 3
    .param p1, "o"    # Lorg/bouncycastle/asn1/DERObject;

    .prologue
    .line 85
    instance-of v1, p1, Lorg/bouncycastle/asn1/DERGeneralString;

    if-nez v1, :cond_0

    .line 87
    const/4 v1, 0x0

    .line 90
    :goto_0
    return v1

    :cond_0
    move-object v0, p1

    .line 89
    check-cast v0, Lorg/bouncycastle/asn1/DERGeneralString;

    .line 90
    .local v0, "s":Lorg/bouncycastle/asn1/DERGeneralString;
    invoke-virtual {p0}, Lorg/bouncycastle/asn1/DERGeneralString;->getString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0}, Lorg/bouncycastle/asn1/DERGeneralString;->getString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

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
    .line 75
    const/16 v0, 0x1b

    invoke-virtual {p0}, Lorg/bouncycastle/asn1/DERGeneralString;->getOctets()[B

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Lorg/bouncycastle/asn1/DEROutputStream;->writeEncoded(I[B)V

    .line 76
    return-void
.end method

.method public getOctets()[B
    .locals 4

    .prologue
    .line 63
    iget-object v3, p0, Lorg/bouncycastle/asn1/DERGeneralString;->string:Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->toCharArray()[C

    move-result-object v1

    .line 64
    .local v1, "cs":[C
    array-length v3, v1

    new-array v0, v3, [B

    .line 65
    .local v0, "bs":[B
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    array-length v3, v1

    if-eq v2, v3, :cond_0

    .line 67
    aget-char v3, v1, v2

    int-to-byte v3, v3

    aput-byte v3, v0, v2

    .line 65
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 69
    :cond_0
    return-object v0
.end method

.method public getString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 53
    iget-object v0, p0, Lorg/bouncycastle/asn1/DERGeneralString;->string:Ljava/lang/String;

    return-object v0
.end method

.method public hashCode()I
    .locals 1

    .prologue
    .line 80
    invoke-virtual {p0}, Lorg/bouncycastle/asn1/DERGeneralString;->getString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 58
    iget-object v0, p0, Lorg/bouncycastle/asn1/DERGeneralString;->string:Ljava/lang/String;

    return-object v0
.end method
