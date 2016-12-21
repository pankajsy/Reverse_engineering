.class public Lorg/bouncycastle/asn1/DERGeneralizedTime;
.super Lorg/bouncycastle/asn1/ASN1Object;
.source "DERGeneralizedTime.java"


# instance fields
.field time:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 4
    .param p1, "time"    # Ljava/lang/String;

    .prologue
    .line 66
    invoke-direct {p0}, Lorg/bouncycastle/asn1/ASN1Object;-><init>()V

    .line 67
    iput-object p1, p0, Lorg/bouncycastle/asn1/DERGeneralizedTime;->time:Ljava/lang/String;

    .line 70
    :try_start_0
    invoke-virtual {p0}, Lorg/bouncycastle/asn1/DERGeneralizedTime;->getDate()Ljava/util/Date;
    :try_end_0
    .catch Ljava/text/ParseException; {:try_start_0 .. :try_end_0} :catch_0

    .line 76
    return-void

    .line 72
    :catch_0
    move-exception v0

    .line 74
    .local v0, "e":Ljava/text/ParseException;
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "invalid date string: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Ljava/text/ParseException;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public constructor <init>(Ljava/util/Date;)V
    .locals 4
    .param p1, "time"    # Ljava/util/Date;

    .prologue
    .line 83
    invoke-direct {p0}, Lorg/bouncycastle/asn1/ASN1Object;-><init>()V

    .line 84
    new-instance v0, Ljava/text/SimpleDateFormat;

    const-string v1, "yyyyMMddHHmmss\'Z\'"

    invoke-direct {v0, v1}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    .line 86
    .local v0, "dateF":Ljava/text/SimpleDateFormat;
    new-instance v1, Ljava/util/SimpleTimeZone;

    const/4 v2, 0x0

    const-string v3, "Z"

    invoke-direct {v1, v2, v3}, Ljava/util/SimpleTimeZone;-><init>(ILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/text/SimpleDateFormat;->setTimeZone(Ljava/util/TimeZone;)V

    .line 88
    invoke-virtual {v0, p1}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lorg/bouncycastle/asn1/DERGeneralizedTime;->time:Ljava/lang/String;

    .line 89
    return-void
.end method

.method constructor <init>([B)V
    .locals 3
    .param p1, "bytes"    # [B

    .prologue
    .line 93
    invoke-direct {p0}, Lorg/bouncycastle/asn1/ASN1Object;-><init>()V

    .line 97
    array-length v2, p1

    new-array v0, v2, [C

    .line 99
    .local v0, "dateC":[C
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    array-length v2, v0

    if-eq v1, v2, :cond_0

    .line 101
    aget-byte v2, p1, v1

    and-int/lit16 v2, v2, 0xff

    int-to-char v2, v2

    aput-char v2, v0, v1

    .line 99
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 104
    :cond_0
    new-instance v2, Ljava/lang/String;

    invoke-direct {v2, v0}, Ljava/lang/String;-><init>([C)V

    iput-object v2, p0, Lorg/bouncycastle/asn1/DERGeneralizedTime;->time:Ljava/lang/String;

    .line 105
    return-void
.end method

.method private calculateGMTOffset()Ljava/lang/String;
    .locals 7

    .prologue
    .line 167
    const-string v3, "+"

    .line 168
    .local v3, "sign":Ljava/lang/String;
    invoke-static {}, Ljava/util/TimeZone;->getDefault()Ljava/util/TimeZone;

    move-result-object v4

    .line 169
    .local v4, "timeZone":Ljava/util/TimeZone;
    invoke-virtual {v4}, Ljava/util/TimeZone;->getRawOffset()I

    move-result v2

    .line 170
    .local v2, "offset":I
    if-gez v2, :cond_0

    .line 172
    const-string v3, "-"

    .line 173
    neg-int v2, v2

    .line 175
    :cond_0
    const v5, 0x36ee80

    div-int v0, v2, v5

    .line 176
    .local v0, "hours":I
    mul-int/lit8 v5, v0, 0x3c

    mul-int/lit8 v5, v5, 0x3c

    mul-int/lit16 v5, v5, 0x3e8

    sub-int v5, v2, v5

    const v6, 0xea60

    div-int v1, v5, v6

    .line 180
    .local v1, "minutes":I
    :try_start_0
    invoke-virtual {v4}, Ljava/util/TimeZone;->useDaylightTime()Z

    move-result v5

    if-eqz v5, :cond_1

    invoke-virtual {p0}, Lorg/bouncycastle/asn1/DERGeneralizedTime;->getDate()Ljava/util/Date;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/util/TimeZone;->inDaylightTime(Ljava/util/Date;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 182
    const-string v5, "+"

    invoke-virtual {v3, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/text/ParseException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v5

    if-eqz v5, :cond_2

    const/4 v5, 0x1

    :goto_0
    add-int/2addr v0, v5

    .line 190
    :cond_1
    :goto_1
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "GMT"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-direct {p0, v0}, Lorg/bouncycastle/asn1/DERGeneralizedTime;->convert(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ":"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-direct {p0, v1}, Lorg/bouncycastle/asn1/DERGeneralizedTime;->convert(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    return-object v5

    .line 182
    :cond_2
    const/4 v5, -0x1

    goto :goto_0

    .line 185
    :catch_0
    move-exception v5

    goto :goto_1
.end method

.method private convert(I)Ljava/lang/String;
    .locals 2
    .param p1, "time"    # I

    .prologue
    .line 195
    const/16 v0, 0xa

    if-ge p1, v0, :cond_0

    .line 197
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "0"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 200
    :goto_0
    return-object v0

    :cond_0
    invoke-static {p1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public static getInstance(Ljava/lang/Object;)Lorg/bouncycastle/asn1/DERGeneralizedTime;
    .locals 3
    .param p0, "obj"    # Ljava/lang/Object;

    .prologue
    .line 26
    if-eqz p0, :cond_0

    instance-of v0, p0, Lorg/bouncycastle/asn1/DERGeneralizedTime;

    if-eqz v0, :cond_1

    .line 28
    :cond_0
    check-cast p0, Lorg/bouncycastle/asn1/DERGeneralizedTime;

    .line 33
    .end local p0    # "obj":Ljava/lang/Object;
    :goto_0
    return-object p0

    .line 31
    .restart local p0    # "obj":Ljava/lang/Object;
    :cond_1
    instance-of v0, p0, Lorg/bouncycastle/asn1/ASN1OctetString;

    if-eqz v0, :cond_2

    .line 33
    new-instance v0, Lorg/bouncycastle/asn1/DERGeneralizedTime;

    check-cast p0, Lorg/bouncycastle/asn1/ASN1OctetString;

    .end local p0    # "obj":Ljava/lang/Object;
    invoke-virtual {p0}, Lorg/bouncycastle/asn1/ASN1OctetString;->getOctets()[B

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/bouncycastle/asn1/DERGeneralizedTime;-><init>([B)V

    move-object p0, v0

    goto :goto_0

    .line 36
    .restart local p0    # "obj":Ljava/lang/Object;
    :cond_2
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

.method public static getInstance(Lorg/bouncycastle/asn1/ASN1TaggedObject;Z)Lorg/bouncycastle/asn1/DERGeneralizedTime;
    .locals 1
    .param p0, "obj"    # Lorg/bouncycastle/asn1/ASN1TaggedObject;
    .param p1, "explicit"    # Z

    .prologue
    .line 52
    invoke-virtual {p0}, Lorg/bouncycastle/asn1/ASN1TaggedObject;->getObject()Lorg/bouncycastle/asn1/DERObject;

    move-result-object v0

    invoke-static {v0}, Lorg/bouncycastle/asn1/DERGeneralizedTime;->getInstance(Ljava/lang/Object;)Lorg/bouncycastle/asn1/DERGeneralizedTime;

    move-result-object v0

    return-object v0
.end method

.method private getOctets()[B
    .locals 4

    .prologue
    .line 280
    iget-object v3, p0, Lorg/bouncycastle/asn1/DERGeneralizedTime;->time:Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->toCharArray()[C

    move-result-object v1

    .line 281
    .local v1, "cs":[C
    array-length v3, v1

    new-array v0, v3, [B

    .line 283
    .local v0, "bs":[B
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    array-length v3, v1

    if-eq v2, v3, :cond_0

    .line 285
    aget-char v3, v1, v2

    int-to-byte v3, v3

    aput-byte v3, v0, v2

    .line 283
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 288
    :cond_0
    return-object v0
.end method

.method private hasFractionalSeconds()Z
    .locals 2

    .prologue
    .line 275
    iget-object v0, p0, Lorg/bouncycastle/asn1/DERGeneralizedTime;->time:Ljava/lang/String;

    const/16 v1, 0x2e

    invoke-virtual {v0, v1}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    const/16 v1, 0xe

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method


# virtual methods
.method asn1Equals(Lorg/bouncycastle/asn1/DERObject;)Z
    .locals 2
    .param p1, "o"    # Lorg/bouncycastle/asn1/DERObject;

    .prologue
    .line 302
    instance-of v0, p1, Lorg/bouncycastle/asn1/DERGeneralizedTime;

    if-nez v0, :cond_0

    .line 304
    const/4 v0, 0x0

    .line 307
    .end local p1    # "o":Lorg/bouncycastle/asn1/DERObject;
    :goto_0
    return v0

    .restart local p1    # "o":Lorg/bouncycastle/asn1/DERObject;
    :cond_0
    iget-object v0, p0, Lorg/bouncycastle/asn1/DERGeneralizedTime;->time:Ljava/lang/String;

    check-cast p1, Lorg/bouncycastle/asn1/DERGeneralizedTime;

    .end local p1    # "o":Lorg/bouncycastle/asn1/DERObject;
    iget-object v1, p1, Lorg/bouncycastle/asn1/DERGeneralizedTime;->time:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

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
    .line 296
    const/16 v0, 0x18

    invoke-direct {p0}, Lorg/bouncycastle/asn1/DERGeneralizedTime;->getOctets()[B

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Lorg/bouncycastle/asn1/DEROutputStream;->writeEncoded(I[B)V

    .line 297
    return-void
.end method

.method public getDate()Ljava/util/Date;
    .locals 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .prologue
    const/16 v8, 0xe

    const/4 v7, 0x0

    .line 207
    iget-object v1, p0, Lorg/bouncycastle/asn1/DERGeneralizedTime;->time:Ljava/lang/String;

    .line 209
    .local v1, "d":Ljava/lang/String;
    iget-object v5, p0, Lorg/bouncycastle/asn1/DERGeneralizedTime;->time:Ljava/lang/String;

    const-string v6, "Z"

    invoke-virtual {v5, v6}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_3

    .line 211
    invoke-direct {p0}, Lorg/bouncycastle/asn1/DERGeneralizedTime;->hasFractionalSeconds()Z

    move-result v5

    if-eqz v5, :cond_2

    .line 213
    new-instance v2, Ljava/text/SimpleDateFormat;

    const-string v5, "yyyyMMddHHmmss.SSS\'Z\'"

    invoke-direct {v2, v5}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    .line 220
    .local v2, "dateF":Ljava/text/SimpleDateFormat;
    :goto_0
    new-instance v5, Ljava/util/SimpleTimeZone;

    const-string v6, "Z"

    invoke-direct {v5, v7, v6}, Ljava/util/SimpleTimeZone;-><init>(ILjava/lang/String;)V

    invoke-virtual {v2, v5}, Ljava/text/SimpleDateFormat;->setTimeZone(Ljava/util/TimeZone;)V

    .line 250
    :goto_1
    invoke-direct {p0}, Lorg/bouncycastle/asn1/DERGeneralizedTime;->hasFractionalSeconds()Z

    move-result v5

    if-eqz v5, :cond_1

    .line 253
    invoke-virtual {v1, v8}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    .line 255
    .local v3, "frac":Ljava/lang/String;
    const/4 v4, 0x1

    .local v4, "index":I
    :goto_2
    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v5

    if-ge v4, v5, :cond_0

    .line 257
    invoke-virtual {v3, v4}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 258
    .local v0, "ch":C
    const/16 v5, 0x30

    if-gt v5, v0, :cond_0

    const/16 v5, 0x39

    if-le v0, v5, :cond_8

    .line 263
    .end local v0    # "ch":C
    :cond_0
    add-int/lit8 v5, v4, -0x1

    const/4 v6, 0x3

    if-le v5, v6, :cond_1

    .line 265
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v6, 0x4

    invoke-virtual {v3, v7, v6}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v3, v4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 266
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v7, v8}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 270
    .end local v3    # "frac":Ljava/lang/String;
    .end local v4    # "index":I
    :cond_1
    invoke-virtual {v2, v1}, Ljava/text/SimpleDateFormat;->parse(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v5

    return-object v5

    .line 217
    .end local v2    # "dateF":Ljava/text/SimpleDateFormat;
    :cond_2
    new-instance v2, Ljava/text/SimpleDateFormat;

    const-string v5, "yyyyMMddHHmmss\'Z\'"

    invoke-direct {v2, v5}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    .restart local v2    # "dateF":Ljava/text/SimpleDateFormat;
    goto :goto_0

    .line 222
    .end local v2    # "dateF":Ljava/text/SimpleDateFormat;
    :cond_3
    iget-object v5, p0, Lorg/bouncycastle/asn1/DERGeneralizedTime;->time:Ljava/lang/String;

    const/16 v6, 0x2d

    invoke-virtual {v5, v6}, Ljava/lang/String;->indexOf(I)I

    move-result v5

    if-gtz v5, :cond_4

    iget-object v5, p0, Lorg/bouncycastle/asn1/DERGeneralizedTime;->time:Ljava/lang/String;

    const/16 v6, 0x2b

    invoke-virtual {v5, v6}, Ljava/lang/String;->indexOf(I)I

    move-result v5

    if-lez v5, :cond_6

    .line 224
    :cond_4
    invoke-virtual {p0}, Lorg/bouncycastle/asn1/DERGeneralizedTime;->getTime()Ljava/lang/String;

    move-result-object v1

    .line 225
    invoke-direct {p0}, Lorg/bouncycastle/asn1/DERGeneralizedTime;->hasFractionalSeconds()Z

    move-result v5

    if-eqz v5, :cond_5

    .line 227
    new-instance v2, Ljava/text/SimpleDateFormat;

    const-string v5, "yyyyMMddHHmmss.SSSz"

    invoke-direct {v2, v5}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    .line 234
    .restart local v2    # "dateF":Ljava/text/SimpleDateFormat;
    :goto_3
    new-instance v5, Ljava/util/SimpleTimeZone;

    const-string v6, "Z"

    invoke-direct {v5, v7, v6}, Ljava/util/SimpleTimeZone;-><init>(ILjava/lang/String;)V

    invoke-virtual {v2, v5}, Ljava/text/SimpleDateFormat;->setTimeZone(Ljava/util/TimeZone;)V

    goto/16 :goto_1

    .line 231
    .end local v2    # "dateF":Ljava/text/SimpleDateFormat;
    :cond_5
    new-instance v2, Ljava/text/SimpleDateFormat;

    const-string v5, "yyyyMMddHHmmssz"

    invoke-direct {v2, v5}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    .restart local v2    # "dateF":Ljava/text/SimpleDateFormat;
    goto :goto_3

    .line 238
    .end local v2    # "dateF":Ljava/text/SimpleDateFormat;
    :cond_6
    invoke-direct {p0}, Lorg/bouncycastle/asn1/DERGeneralizedTime;->hasFractionalSeconds()Z

    move-result v5

    if-eqz v5, :cond_7

    .line 240
    new-instance v2, Ljava/text/SimpleDateFormat;

    const-string v5, "yyyyMMddHHmmss.SSS"

    invoke-direct {v2, v5}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    .line 247
    .restart local v2    # "dateF":Ljava/text/SimpleDateFormat;
    :goto_4
    new-instance v5, Ljava/util/SimpleTimeZone;

    invoke-static {}, Ljava/util/TimeZone;->getDefault()Ljava/util/TimeZone;

    move-result-object v6

    invoke-virtual {v6}, Ljava/util/TimeZone;->getID()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v7, v6}, Ljava/util/SimpleTimeZone;-><init>(ILjava/lang/String;)V

    invoke-virtual {v2, v5}, Ljava/text/SimpleDateFormat;->setTimeZone(Ljava/util/TimeZone;)V

    goto/16 :goto_1

    .line 244
    .end local v2    # "dateF":Ljava/text/SimpleDateFormat;
    :cond_7
    new-instance v2, Ljava/text/SimpleDateFormat;

    const-string v5, "yyyyMMddHHmmss"

    invoke-direct {v2, v5}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    .restart local v2    # "dateF":Ljava/text/SimpleDateFormat;
    goto :goto_4

    .line 255
    .restart local v0    # "ch":C
    .restart local v3    # "frac":Ljava/lang/String;
    .restart local v4    # "index":I
    :cond_8
    add-int/lit8 v4, v4, 0x1

    goto/16 :goto_2
.end method

.method public getTime()Ljava/lang/String;
    .locals 7

    .prologue
    const/16 v6, 0x2d

    const/16 v4, 0x2b

    const/4 v5, 0x0

    .line 133
    iget-object v2, p0, Lorg/bouncycastle/asn1/DERGeneralizedTime;->time:Ljava/lang/String;

    iget-object v3, p0, Lorg/bouncycastle/asn1/DERGeneralizedTime;->time:Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    add-int/lit8 v3, v3, -0x1

    invoke-virtual {v2, v3}, Ljava/lang/String;->charAt(I)C

    move-result v2

    const/16 v3, 0x5a

    if-ne v2, v3, :cond_0

    .line 135
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, p0, Lorg/bouncycastle/asn1/DERGeneralizedTime;->time:Ljava/lang/String;

    iget-object v4, p0, Lorg/bouncycastle/asn1/DERGeneralizedTime;->time:Ljava/lang/String;

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v4

    add-int/lit8 v4, v4, -0x1

    invoke-virtual {v3, v5, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "GMT+00:00"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 162
    :goto_0
    return-object v2

    .line 139
    :cond_0
    iget-object v2, p0, Lorg/bouncycastle/asn1/DERGeneralizedTime;->time:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    add-int/lit8 v1, v2, -0x5

    .line 140
    .local v1, "signPos":I
    iget-object v2, p0, Lorg/bouncycastle/asn1/DERGeneralizedTime;->time:Ljava/lang/String;

    invoke-virtual {v2, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 141
    .local v0, "sign":C
    if-eq v0, v6, :cond_1

    if-ne v0, v4, :cond_2

    .line 143
    :cond_1
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, p0, Lorg/bouncycastle/asn1/DERGeneralizedTime;->time:Ljava/lang/String;

    invoke-virtual {v3, v5, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "GMT"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lorg/bouncycastle/asn1/DERGeneralizedTime;->time:Ljava/lang/String;

    add-int/lit8 v4, v1, 0x3

    .line 145
    invoke-virtual {v3, v1, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ":"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lorg/bouncycastle/asn1/DERGeneralizedTime;->time:Ljava/lang/String;

    add-int/lit8 v4, v1, 0x3

    .line 147
    invoke-virtual {v3, v4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    goto :goto_0

    .line 151
    :cond_2
    iget-object v2, p0, Lorg/bouncycastle/asn1/DERGeneralizedTime;->time:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    add-int/lit8 v1, v2, -0x3

    .line 152
    iget-object v2, p0, Lorg/bouncycastle/asn1/DERGeneralizedTime;->time:Ljava/lang/String;

    invoke-virtual {v2, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 153
    if-eq v0, v6, :cond_3

    if-ne v0, v4, :cond_4

    .line 155
    :cond_3
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, p0, Lorg/bouncycastle/asn1/DERGeneralizedTime;->time:Ljava/lang/String;

    invoke-virtual {v3, v5, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "GMT"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lorg/bouncycastle/asn1/DERGeneralizedTime;->time:Ljava/lang/String;

    .line 157
    invoke-virtual {v3, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ":00"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    goto/16 :goto_0

    .line 162
    :cond_4
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, p0, Lorg/bouncycastle/asn1/DERGeneralizedTime;->time:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-direct {p0}, Lorg/bouncycastle/asn1/DERGeneralizedTime;->calculateGMTOffset()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    goto/16 :goto_0
.end method

.method public getTimeString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 113
    iget-object v0, p0, Lorg/bouncycastle/asn1/DERGeneralizedTime;->time:Ljava/lang/String;

    return-object v0
.end method

.method public hashCode()I
    .locals 1

    .prologue
    .line 312
    iget-object v0, p0, Lorg/bouncycastle/asn1/DERGeneralizedTime;->time:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    return v0
.end method
