.class public Lorg/bouncycastle/asn1/DERNumericString;
.super Lorg/bouncycastle/asn1/ASN1Object;
.source "DERNumericString.java"

# interfaces
.implements Lorg/bouncycastle/asn1/DERString;


# instance fields
.field string:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 1
    .param p1, "string"    # Ljava/lang/String;

    .prologue
    .line 78
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lorg/bouncycastle/asn1/DERNumericString;-><init>(Ljava/lang/String;Z)V

    .line 79
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Z)V
    .locals 2
    .param p1, "string"    # Ljava/lang/String;
    .param p2, "validate"    # Z

    .prologue
    .line 92
    invoke-direct {p0}, Lorg/bouncycastle/asn1/ASN1Object;-><init>()V

    .line 93
    if-eqz p2, :cond_0

    invoke-static {p1}, Lorg/bouncycastle/asn1/DERNumericString;->isNumericString(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 95
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "string contains illegal characters"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 98
    :cond_0
    iput-object p1, p0, Lorg/bouncycastle/asn1/DERNumericString;->string:Ljava/lang/String;

    .line 99
    return-void
.end method

.method public constructor <init>([B)V
    .locals 3
    .param p1, "string"    # [B

    .prologue
    .line 61
    invoke-direct {p0}, Lorg/bouncycastle/asn1/ASN1Object;-><init>()V

    .line 62
    array-length v2, p1

    new-array v0, v2, [C

    .line 64
    .local v0, "cs":[C
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    array-length v2, v0

    if-eq v1, v2, :cond_0

    .line 66
    aget-byte v2, p1, v1

    and-int/lit16 v2, v2, 0xff

    int-to-char v2, v2

    aput-char v2, v0, v1

    .line 64
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 69
    :cond_0
    new-instance v2, Ljava/lang/String;

    invoke-direct {v2, v0}, Ljava/lang/String;-><init>([C)V

    iput-object v2, p0, Lorg/bouncycastle/asn1/DERNumericString;->string:Ljava/lang/String;

    .line 70
    return-void
.end method

.method public static getInstance(Ljava/lang/Object;)Lorg/bouncycastle/asn1/DERNumericString;
    .locals 3
    .param p0, "obj"    # Ljava/lang/Object;

    .prologue
    .line 22
    if-eqz p0, :cond_0

    instance-of v0, p0, Lorg/bouncycastle/asn1/DERNumericString;

    if-eqz v0, :cond_1

    .line 24
    :cond_0
    check-cast p0, Lorg/bouncycastle/asn1/DERNumericString;

    .line 34
    .end local p0    # "obj":Ljava/lang/Object;
    :goto_0
    return-object p0

    .line 27
    .restart local p0    # "obj":Ljava/lang/Object;
    :cond_1
    instance-of v0, p0, Lorg/bouncycastle/asn1/ASN1OctetString;

    if-eqz v0, :cond_2

    .line 29
    new-instance v0, Lorg/bouncycastle/asn1/DERNumericString;

    check-cast p0, Lorg/bouncycastle/asn1/ASN1OctetString;

    .end local p0    # "obj":Ljava/lang/Object;
    invoke-virtual {p0}, Lorg/bouncycastle/asn1/ASN1OctetString;->getOctets()[B

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/bouncycastle/asn1/DERNumericString;-><init>([B)V

    move-object p0, v0

    goto :goto_0

    .line 32
    .restart local p0    # "obj":Ljava/lang/Object;
    :cond_2
    instance-of v0, p0, Lorg/bouncycastle/asn1/ASN1TaggedObject;

    if-eqz v0, :cond_3

    .line 34
    check-cast p0, Lorg/bouncycastle/asn1/ASN1TaggedObject;

    .end local p0    # "obj":Ljava/lang/Object;
    invoke-virtual {p0}, Lorg/bouncycastle/asn1/ASN1TaggedObject;->getObject()Lorg/bouncycastle/asn1/DERObject;

    move-result-object v0

    invoke-static {v0}, Lorg/bouncycastle/asn1/DERNumericString;->getInstance(Ljava/lang/Object;)Lorg/bouncycastle/asn1/DERNumericString;

    move-result-object p0

    goto :goto_0

    .line 37
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

.method public static getInstance(Lorg/bouncycastle/asn1/ASN1TaggedObject;Z)Lorg/bouncycastle/asn1/DERNumericString;
    .locals 1
    .param p0, "obj"    # Lorg/bouncycastle/asn1/ASN1TaggedObject;
    .param p1, "explicit"    # Z

    .prologue
    .line 53
    invoke-virtual {p0}, Lorg/bouncycastle/asn1/ASN1TaggedObject;->getObject()Lorg/bouncycastle/asn1/DERObject;

    move-result-object v0

    invoke-static {v0}, Lorg/bouncycastle/asn1/DERNumericString;->getInstance(Ljava/lang/Object;)Lorg/bouncycastle/asn1/DERNumericString;

    move-result-object v0

    return-object v0
.end method

.method public static isNumericString(Ljava/lang/String;)Z
    .locals 4
    .param p0, "str"    # Ljava/lang/String;

    .prologue
    const/4 v2, 0x0

    .line 158
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    add-int/lit8 v1, v3, -0x1

    .local v1, "i":I
    :goto_0
    if-ltz v1, :cond_4

    .line 160
    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 162
    .local v0, "ch":C
    const/16 v3, 0x7f

    if-le v0, v3, :cond_1

    .line 175
    .end local v0    # "ch":C
    :cond_0
    :goto_1
    return v2

    .line 167
    .restart local v0    # "ch":C
    :cond_1
    const/16 v3, 0x30

    if-gt v3, v0, :cond_2

    const/16 v3, 0x39

    if-le v0, v3, :cond_3

    :cond_2
    const/16 v3, 0x20

    if-ne v0, v3, :cond_0

    .line 158
    :cond_3
    add-int/lit8 v1, v1, -0x1

    goto :goto_0

    .line 175
    .end local v0    # "ch":C
    :cond_4
    const/4 v2, 0x1

    goto :goto_1
.end method


# virtual methods
.method asn1Equals(Lorg/bouncycastle/asn1/DERObject;)Z
    .locals 3
    .param p1, "o"    # Lorg/bouncycastle/asn1/DERObject;

    .prologue
    .line 139
    instance-of v1, p1, Lorg/bouncycastle/asn1/DERNumericString;

    if-nez v1, :cond_0

    .line 141
    const/4 v1, 0x0

    .line 146
    :goto_0
    return v1

    :cond_0
    move-object v0, p1

    .line 144
    check-cast v0, Lorg/bouncycastle/asn1/DERNumericString;

    .line 146
    .local v0, "s":Lorg/bouncycastle/asn1/DERNumericString;
    invoke-virtual {p0}, Lorg/bouncycastle/asn1/DERNumericString;->getString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0}, Lorg/bouncycastle/asn1/DERNumericString;->getString()Ljava/lang/String;

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
    .line 128
    const/16 v0, 0x12

    invoke-virtual {p0}, Lorg/bouncycastle/asn1/DERNumericString;->getOctets()[B

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Lorg/bouncycastle/asn1/DEROutputStream;->writeEncoded(I[B)V

    .line 129
    return-void
.end method

.method public getOctets()[B
    .locals 4

    .prologue
    .line 113
    iget-object v3, p0, Lorg/bouncycastle/asn1/DERNumericString;->string:Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->toCharArray()[C

    move-result-object v1

    .line 114
    .local v1, "cs":[C
    array-length v3, v1

    new-array v0, v3, [B

    .line 116
    .local v0, "bs":[B
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    array-length v3, v1

    if-eq v2, v3, :cond_0

    .line 118
    aget-char v3, v1, v2

    int-to-byte v3, v3

    aput-byte v3, v0, v2

    .line 116
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 121
    :cond_0
    return-object v0
.end method

.method public getString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 103
    iget-object v0, p0, Lorg/bouncycastle/asn1/DERNumericString;->string:Ljava/lang/String;

    return-object v0
.end method

.method public hashCode()I
    .locals 1

    .prologue
    .line 133
    invoke-virtual {p0}, Lorg/bouncycastle/asn1/DERNumericString;->getString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 108
    iget-object v0, p0, Lorg/bouncycastle/asn1/DERNumericString;->string:Ljava/lang/String;

    return-object v0
.end method
