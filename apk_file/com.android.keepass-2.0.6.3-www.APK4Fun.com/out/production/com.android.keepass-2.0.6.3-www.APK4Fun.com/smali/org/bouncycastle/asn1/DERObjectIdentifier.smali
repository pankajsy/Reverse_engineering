.class public Lorg/bouncycastle/asn1/DERObjectIdentifier;
.super Lorg/bouncycastle/asn1/ASN1Object;
.source "DERObjectIdentifier.java"


# instance fields
.field identifier:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 3
    .param p1, "identifier"    # Ljava/lang/String;

    .prologue
    .line 119
    invoke-direct {p0}, Lorg/bouncycastle/asn1/ASN1Object;-><init>()V

    .line 120
    invoke-static {p1}, Lorg/bouncycastle/asn1/DERObjectIdentifier;->isValidIdentifier(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 122
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "string "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " not an OID"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 125
    :cond_0
    iput-object p1, p0, Lorg/bouncycastle/asn1/DERObjectIdentifier;->identifier:Ljava/lang/String;

    .line 126
    return-void
.end method

.method constructor <init>([B)V
    .locals 13
    .param p1, "bytes"    # [B

    .prologue
    const/16 v12, 0x2e

    .line 58
    invoke-direct {p0}, Lorg/bouncycastle/asn1/ASN1Object;-><init>()V

    .line 59
    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    .line 60
    .local v4, "objId":Ljava/lang/StringBuffer;
    const-wide/16 v6, 0x0

    .line 61
    .local v6, "value":J
    const/4 v1, 0x0

    .line 62
    .local v1, "bigValue":Ljava/math/BigInteger;
    const/4 v2, 0x1

    .line 64
    .local v2, "first":Z
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    array-length v5, p1

    if-eq v3, v5, :cond_4

    .line 66
    aget-byte v5, p1, v3

    and-int/lit16 v0, v5, 0xff

    .line 68
    .local v0, "b":I
    const-wide/high16 v8, 0x80000000000000L

    cmp-long v5, v6, v8

    if-gez v5, :cond_2

    .line 70
    const-wide/16 v8, 0x80

    mul-long/2addr v8, v6

    and-int/lit8 v5, v0, 0x7f

    int-to-long v10, v5

    add-long v6, v8, v10

    .line 71
    and-int/lit16 v5, v0, 0x80

    if-nez v5, :cond_1

    .line 73
    if-eqz v2, :cond_0

    .line 75
    long-to-int v5, v6

    div-int/lit8 v5, v5, 0x28

    packed-switch v5, :pswitch_data_0

    .line 85
    const/16 v5, 0x32

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 86
    const-wide/16 v8, 0x50

    sub-long/2addr v6, v8

    .line 88
    :goto_1
    const/4 v2, 0x0

    .line 91
    :cond_0
    invoke-virtual {v4, v12}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 92
    invoke-virtual {v4, v6, v7}, Ljava/lang/StringBuffer;->append(J)Ljava/lang/StringBuffer;

    .line 93
    const-wide/16 v6, 0x0

    .line 64
    :cond_1
    :goto_2
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 78
    :pswitch_0
    const/16 v5, 0x30

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    goto :goto_1

    .line 81
    :pswitch_1
    const/16 v5, 0x31

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 82
    const-wide/16 v8, 0x28

    sub-long/2addr v6, v8

    .line 83
    goto :goto_1

    .line 98
    :cond_2
    if-nez v1, :cond_3

    .line 100
    invoke-static {v6, v7}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    move-result-object v1

    .line 102
    :cond_3
    const/4 v5, 0x7

    invoke-virtual {v1, v5}, Ljava/math/BigInteger;->shiftLeft(I)Ljava/math/BigInteger;

    move-result-object v1

    .line 103
    and-int/lit8 v5, v0, 0x7f

    int-to-long v8, v5

    invoke-static {v8, v9}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    move-result-object v5

    invoke-virtual {v1, v5}, Ljava/math/BigInteger;->or(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v1

    .line 104
    and-int/lit16 v5, v0, 0x80

    if-nez v5, :cond_1

    .line 106
    invoke-virtual {v4, v12}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 107
    invoke-virtual {v4, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    .line 108
    const/4 v1, 0x0

    .line 109
    const-wide/16 v6, 0x0

    goto :goto_2

    .line 114
    .end local v0    # "b":I
    :cond_4
    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    iput-object v5, p0, Lorg/bouncycastle/asn1/DERObjectIdentifier;->identifier:Ljava/lang/String;

    .line 115
    return-void

    .line 75
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public static getInstance(Ljava/lang/Object;)Lorg/bouncycastle/asn1/DERObjectIdentifier;
    .locals 3
    .param p0, "obj"    # Ljava/lang/Object;

    .prologue
    .line 21
    if-eqz p0, :cond_0

    instance-of v0, p0, Lorg/bouncycastle/asn1/DERObjectIdentifier;

    if-eqz v0, :cond_1

    .line 23
    :cond_0
    check-cast p0, Lorg/bouncycastle/asn1/DERObjectIdentifier;

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
    new-instance v0, Lorg/bouncycastle/asn1/DERObjectIdentifier;

    check-cast p0, Lorg/bouncycastle/asn1/ASN1OctetString;

    .end local p0    # "obj":Ljava/lang/Object;
    invoke-virtual {p0}, Lorg/bouncycastle/asn1/ASN1OctetString;->getOctets()[B

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/bouncycastle/asn1/DERObjectIdentifier;-><init>([B)V

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

    invoke-static {v0}, Lorg/bouncycastle/asn1/DERObjectIdentifier;->getInstance(Ljava/lang/Object;)Lorg/bouncycastle/asn1/DERObjectIdentifier;

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

.method public static getInstance(Lorg/bouncycastle/asn1/ASN1TaggedObject;Z)Lorg/bouncycastle/asn1/DERObjectIdentifier;
    .locals 1
    .param p0, "obj"    # Lorg/bouncycastle/asn1/ASN1TaggedObject;
    .param p1, "explicit"    # Z

    .prologue
    .line 52
    invoke-virtual {p0}, Lorg/bouncycastle/asn1/ASN1TaggedObject;->getObject()Lorg/bouncycastle/asn1/DERObject;

    move-result-object v0

    invoke-static {v0}, Lorg/bouncycastle/asn1/DERObjectIdentifier;->getInstance(Ljava/lang/Object;)Lorg/bouncycastle/asn1/DERObjectIdentifier;

    move-result-object v0

    return-object v0
.end method

.method private static isValidIdentifier(Ljava/lang/String;)Z
    .locals 9
    .param p0, "identifier"    # Ljava/lang/String;

    .prologue
    const/16 v8, 0x30

    const/16 v7, 0x2e

    const/4 v4, 0x0

    .line 254
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v5

    const/4 v6, 0x3

    if-lt v5, v6, :cond_0

    const/4 v5, 0x1

    .line 255
    invoke-virtual {p0, v5}, Ljava/lang/String;->charAt(I)C

    move-result v5

    if-eq v5, v7, :cond_2

    :cond_0
    move v3, v4

    .line 291
    :cond_1
    :goto_0
    return v3

    .line 260
    :cond_2
    invoke-virtual {p0, v4}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 261
    .local v1, "first":C
    if-lt v1, v8, :cond_3

    const/16 v5, 0x32

    if-le v1, v5, :cond_4

    :cond_3
    move v3, v4

    .line 263
    goto :goto_0

    .line 266
    :cond_4
    const/4 v3, 0x0

    .line 267
    .local v3, "periodAllowed":Z
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v5

    add-int/lit8 v2, v5, -0x1

    .local v2, "i":I
    :goto_1
    const/4 v5, 0x2

    if-lt v2, v5, :cond_1

    .line 269
    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 271
    .local v0, "ch":C
    if-gt v8, v0, :cond_5

    const/16 v5, 0x39

    if-gt v0, v5, :cond_5

    .line 273
    const/4 v3, 0x1

    .line 267
    :goto_2
    add-int/lit8 v2, v2, -0x1

    goto :goto_1

    .line 277
    :cond_5
    if-ne v0, v7, :cond_7

    .line 279
    if-nez v3, :cond_6

    move v3, v4

    .line 281
    goto :goto_0

    .line 284
    :cond_6
    const/4 v3, 0x0

    .line 285
    goto :goto_2

    :cond_7
    move v3, v4

    .line 288
    goto :goto_0
.end method

.method private writeField(Ljava/io/OutputStream;J)V
    .locals 2
    .param p1, "out"    # Ljava/io/OutputStream;
    .param p2, "fieldValue"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 138
    const-wide/16 v0, 0x80

    cmp-long v0, p2, v0

    if-ltz v0, :cond_7

    .line 140
    const-wide/16 v0, 0x4000

    cmp-long v0, p2, v0

    if-ltz v0, :cond_6

    .line 142
    const-wide/32 v0, 0x200000

    cmp-long v0, p2, v0

    if-ltz v0, :cond_5

    .line 144
    const-wide/32 v0, 0x10000000

    cmp-long v0, p2, v0

    if-ltz v0, :cond_4

    .line 146
    const-wide v0, 0x800000000L

    cmp-long v0, p2, v0

    if-ltz v0, :cond_3

    .line 148
    const-wide v0, 0x40000000000L

    cmp-long v0, p2, v0

    if-ltz v0, :cond_2

    .line 150
    const-wide/high16 v0, 0x2000000000000L

    cmp-long v0, p2, v0

    if-ltz v0, :cond_1

    .line 152
    const-wide/high16 v0, 0x100000000000000L

    cmp-long v0, p2, v0

    if-ltz v0, :cond_0

    .line 154
    const/16 v0, 0x38

    shr-long v0, p2, v0

    long-to-int v0, v0

    or-int/lit16 v0, v0, 0x80

    invoke-virtual {p1, v0}, Ljava/io/OutputStream;->write(I)V

    .line 156
    :cond_0
    const/16 v0, 0x31

    shr-long v0, p2, v0

    long-to-int v0, v0

    or-int/lit16 v0, v0, 0x80

    invoke-virtual {p1, v0}, Ljava/io/OutputStream;->write(I)V

    .line 158
    :cond_1
    const/16 v0, 0x2a

    shr-long v0, p2, v0

    long-to-int v0, v0

    or-int/lit16 v0, v0, 0x80

    invoke-virtual {p1, v0}, Ljava/io/OutputStream;->write(I)V

    .line 160
    :cond_2
    const/16 v0, 0x23

    shr-long v0, p2, v0

    long-to-int v0, v0

    or-int/lit16 v0, v0, 0x80

    invoke-virtual {p1, v0}, Ljava/io/OutputStream;->write(I)V

    .line 162
    :cond_3
    const/16 v0, 0x1c

    shr-long v0, p2, v0

    long-to-int v0, v0

    or-int/lit16 v0, v0, 0x80

    invoke-virtual {p1, v0}, Ljava/io/OutputStream;->write(I)V

    .line 164
    :cond_4
    const/16 v0, 0x15

    shr-long v0, p2, v0

    long-to-int v0, v0

    or-int/lit16 v0, v0, 0x80

    invoke-virtual {p1, v0}, Ljava/io/OutputStream;->write(I)V

    .line 166
    :cond_5
    const/16 v0, 0xe

    shr-long v0, p2, v0

    long-to-int v0, v0

    or-int/lit16 v0, v0, 0x80

    invoke-virtual {p1, v0}, Ljava/io/OutputStream;->write(I)V

    .line 168
    :cond_6
    const/4 v0, 0x7

    shr-long v0, p2, v0

    long-to-int v0, v0

    or-int/lit16 v0, v0, 0x80

    invoke-virtual {p1, v0}, Ljava/io/OutputStream;->write(I)V

    .line 170
    :cond_7
    long-to-int v0, p2

    and-int/lit8 v0, v0, 0x7f

    invoke-virtual {p1, v0}, Ljava/io/OutputStream;->write(I)V

    .line 171
    return-void
.end method

.method private writeField(Ljava/io/OutputStream;Ljava/math/BigInteger;)V
    .locals 6
    .param p1, "out"    # Ljava/io/OutputStream;
    .param p2, "fieldValue"    # Ljava/math/BigInteger;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 178
    invoke-virtual {p2}, Ljava/math/BigInteger;->bitLength()I

    move-result v4

    add-int/lit8 v4, v4, 0x6

    div-int/lit8 v0, v4, 0x7

    .line 179
    .local v0, "byteCount":I
    if-nez v0, :cond_0

    .line 181
    const/4 v4, 0x0

    invoke-virtual {p1, v4}, Ljava/io/OutputStream;->write(I)V

    .line 196
    :goto_0
    return-void

    .line 185
    :cond_0
    move-object v3, p2

    .line 186
    .local v3, "tmpValue":Ljava/math/BigInteger;
    new-array v2, v0, [B

    .line 187
    .local v2, "tmp":[B
    add-int/lit8 v1, v0, -0x1

    .local v1, "i":I
    :goto_1
    if-ltz v1, :cond_1

    .line 189
    invoke-virtual {v3}, Ljava/math/BigInteger;->intValue()I

    move-result v4

    and-int/lit8 v4, v4, 0x7f

    or-int/lit16 v4, v4, 0x80

    int-to-byte v4, v4

    aput-byte v4, v2, v1

    .line 190
    const/4 v4, 0x7

    invoke-virtual {v3, v4}, Ljava/math/BigInteger;->shiftRight(I)Ljava/math/BigInteger;

    move-result-object v3

    .line 187
    add-int/lit8 v1, v1, -0x1

    goto :goto_1

    .line 192
    :cond_1
    add-int/lit8 v4, v0, -0x1

    aget-byte v5, v2, v4

    and-int/lit8 v5, v5, 0x7f

    int-to-byte v5, v5

    aput-byte v5, v2, v4

    .line 193
    invoke-virtual {p1, v2}, Ljava/io/OutputStream;->write([B)V

    goto :goto_0
.end method


# virtual methods
.method asn1Equals(Lorg/bouncycastle/asn1/DERObject;)Z
    .locals 2
    .param p1, "o"    # Lorg/bouncycastle/asn1/DERObject;

    .prologue
    .line 238
    instance-of v0, p1, Lorg/bouncycastle/asn1/DERObjectIdentifier;

    if-nez v0, :cond_0

    .line 240
    const/4 v0, 0x0

    .line 243
    .end local p1    # "o":Lorg/bouncycastle/asn1/DERObject;
    :goto_0
    return v0

    .restart local p1    # "o":Lorg/bouncycastle/asn1/DERObject;
    :cond_0
    iget-object v0, p0, Lorg/bouncycastle/asn1/DERObjectIdentifier;->identifier:Ljava/lang/String;

    check-cast p1, Lorg/bouncycastle/asn1/DERObjectIdentifier;

    .end local p1    # "o":Lorg/bouncycastle/asn1/DERObject;
    iget-object v1, p1, Lorg/bouncycastle/asn1/DERObjectIdentifier;->identifier:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    goto :goto_0
.end method

.method encode(Lorg/bouncycastle/asn1/DEROutputStream;)V
    .locals 8
    .param p1, "out"    # Lorg/bouncycastle/asn1/DEROutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 202
    new-instance v3, Lorg/bouncycastle/asn1/OIDTokenizer;

    iget-object v5, p0, Lorg/bouncycastle/asn1/DERObjectIdentifier;->identifier:Ljava/lang/String;

    invoke-direct {v3, v5}, Lorg/bouncycastle/asn1/OIDTokenizer;-><init>(Ljava/lang/String;)V

    .line 203
    .local v3, "tok":Lorg/bouncycastle/asn1/OIDTokenizer;
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 204
    .local v0, "bOut":Ljava/io/ByteArrayOutputStream;
    new-instance v2, Lorg/bouncycastle/asn1/DEROutputStream;

    invoke-direct {v2, v0}, Lorg/bouncycastle/asn1/DEROutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 207
    .local v2, "dOut":Lorg/bouncycastle/asn1/DEROutputStream;
    invoke-virtual {v3}, Lorg/bouncycastle/asn1/OIDTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v5

    mul-int/lit8 v5, v5, 0x28

    .line 208
    invoke-virtual {v3}, Lorg/bouncycastle/asn1/OIDTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v6

    add-int/2addr v5, v6

    int-to-long v6, v5

    .line 206
    invoke-direct {p0, v0, v6, v7}, Lorg/bouncycastle/asn1/DERObjectIdentifier;->writeField(Ljava/io/OutputStream;J)V

    .line 210
    :goto_0
    invoke-virtual {v3}, Lorg/bouncycastle/asn1/OIDTokenizer;->hasMoreTokens()Z

    move-result v5

    if-eqz v5, :cond_1

    .line 212
    invoke-virtual {v3}, Lorg/bouncycastle/asn1/OIDTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v4

    .line 213
    .local v4, "token":Ljava/lang/String;
    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v5

    const/16 v6, 0x12

    if-ge v5, v6, :cond_0

    .line 215
    invoke-static {v4}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v6

    invoke-direct {p0, v0, v6, v7}, Lorg/bouncycastle/asn1/DERObjectIdentifier;->writeField(Ljava/io/OutputStream;J)V

    goto :goto_0

    .line 219
    :cond_0
    new-instance v5, Ljava/math/BigInteger;

    invoke-direct {v5, v4}, Ljava/math/BigInteger;-><init>(Ljava/lang/String;)V

    invoke-direct {p0, v0, v5}, Lorg/bouncycastle/asn1/DERObjectIdentifier;->writeField(Ljava/io/OutputStream;Ljava/math/BigInteger;)V

    goto :goto_0

    .line 223
    .end local v4    # "token":Ljava/lang/String;
    :cond_1
    invoke-virtual {v2}, Lorg/bouncycastle/asn1/DEROutputStream;->close()V

    .line 225
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v1

    .line 227
    .local v1, "bytes":[B
    const/4 v5, 0x6

    invoke-virtual {p1, v5, v1}, Lorg/bouncycastle/asn1/DEROutputStream;->writeEncoded(I[B)V

    .line 228
    return-void
.end method

.method public getId()Ljava/lang/String;
    .locals 1

    .prologue
    .line 130
    iget-object v0, p0, Lorg/bouncycastle/asn1/DERObjectIdentifier;->identifier:Ljava/lang/String;

    return-object v0
.end method

.method public hashCode()I
    .locals 1

    .prologue
    .line 232
    iget-object v0, p0, Lorg/bouncycastle/asn1/DERObjectIdentifier;->identifier:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 248
    invoke-virtual {p0}, Lorg/bouncycastle/asn1/DERObjectIdentifier;->getId()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
