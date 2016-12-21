.class public Lorg/bouncycastle/asn1/DERUniversalString;
.super Lorg/bouncycastle/asn1/ASN1Object;
.source "DERUniversalString.java"

# interfaces
.implements Lorg/bouncycastle/asn1/DERString;


# static fields
.field private static final table:[C


# instance fields
.field private string:[B


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 13
    const/16 v0, 0x10

    new-array v0, v0, [C

    fill-array-data v0, :array_0

    sput-object v0, Lorg/bouncycastle/asn1/DERUniversalString;->table:[C

    return-void

    :array_0
    .array-data 2
        0x30s
        0x31s
        0x32s
        0x33s
        0x34s
        0x35s
        0x36s
        0x37s
        0x38s
        0x39s
        0x41s
        0x42s
        0x43s
        0x44s
        0x45s
        0x46s
    .end array-data
.end method

.method public constructor <init>([B)V
    .locals 0
    .param p1, "string"    # [B

    .prologue
    .line 58
    invoke-direct {p0}, Lorg/bouncycastle/asn1/ASN1Object;-><init>()V

    .line 59
    iput-object p1, p0, Lorg/bouncycastle/asn1/DERUniversalString;->string:[B

    .line 60
    return-void
.end method

.method public static getInstance(Ljava/lang/Object;)Lorg/bouncycastle/asn1/DERUniversalString;
    .locals 3
    .param p0, "obj"    # Ljava/lang/Object;

    .prologue
    .line 24
    if-eqz p0, :cond_0

    instance-of v0, p0, Lorg/bouncycastle/asn1/DERUniversalString;

    if-eqz v0, :cond_1

    .line 26
    :cond_0
    check-cast p0, Lorg/bouncycastle/asn1/DERUniversalString;

    .line 31
    .end local p0    # "obj":Ljava/lang/Object;
    :goto_0
    return-object p0

    .line 29
    .restart local p0    # "obj":Ljava/lang/Object;
    :cond_1
    instance-of v0, p0, Lorg/bouncycastle/asn1/ASN1OctetString;

    if-eqz v0, :cond_2

    .line 31
    new-instance v0, Lorg/bouncycastle/asn1/DERUniversalString;

    check-cast p0, Lorg/bouncycastle/asn1/ASN1OctetString;

    .end local p0    # "obj":Ljava/lang/Object;
    invoke-virtual {p0}, Lorg/bouncycastle/asn1/ASN1OctetString;->getOctets()[B

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/bouncycastle/asn1/DERUniversalString;-><init>([B)V

    move-object p0, v0

    goto :goto_0

    .line 34
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

.method public static getInstance(Lorg/bouncycastle/asn1/ASN1TaggedObject;Z)Lorg/bouncycastle/asn1/DERUniversalString;
    .locals 1
    .param p0, "obj"    # Lorg/bouncycastle/asn1/ASN1TaggedObject;
    .param p1, "explicit"    # Z

    .prologue
    .line 50
    invoke-virtual {p0}, Lorg/bouncycastle/asn1/ASN1TaggedObject;->getObject()Lorg/bouncycastle/asn1/DERObject;

    move-result-object v0

    invoke-static {v0}, Lorg/bouncycastle/asn1/DERUniversalString;->getInstance(Ljava/lang/Object;)Lorg/bouncycastle/asn1/DERUniversalString;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method asn1Equals(Lorg/bouncycastle/asn1/DERObject;)Z
    .locals 2
    .param p1, "o"    # Lorg/bouncycastle/asn1/DERObject;

    .prologue
    .line 108
    instance-of v0, p1, Lorg/bouncycastle/asn1/DERUniversalString;

    if-nez v0, :cond_0

    .line 110
    const/4 v0, 0x0

    .line 113
    .end local p1    # "o":Lorg/bouncycastle/asn1/DERObject;
    :goto_0
    return v0

    .restart local p1    # "o":Lorg/bouncycastle/asn1/DERObject;
    :cond_0
    invoke-virtual {p0}, Lorg/bouncycastle/asn1/DERUniversalString;->getString()Ljava/lang/String;

    move-result-object v0

    check-cast p1, Lorg/bouncycastle/asn1/DERUniversalString;

    .end local p1    # "o":Lorg/bouncycastle/asn1/DERObject;
    invoke-virtual {p1}, Lorg/bouncycastle/asn1/DERUniversalString;->getString()Ljava/lang/String;

    move-result-object v1

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
    .line 102
    const/16 v0, 0x1c

    invoke-virtual {p0}, Lorg/bouncycastle/asn1/DERUniversalString;->getOctets()[B

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Lorg/bouncycastle/asn1/DEROutputStream;->writeEncoded(I[B)V

    .line 103
    return-void
.end method

.method public getOctets()[B
    .locals 1

    .prologue
    .line 95
    iget-object v0, p0, Lorg/bouncycastle/asn1/DERUniversalString;->string:[B

    return-object v0
.end method

.method public getString()Ljava/lang/String;
    .locals 8

    .prologue
    .line 64
    new-instance v2, Ljava/lang/StringBuffer;

    const-string v6, "#"

    invoke-direct {v2, v6}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    .line 65
    .local v2, "buf":Ljava/lang/StringBuffer;
    new-instance v1, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v1}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 66
    .local v1, "bOut":Ljava/io/ByteArrayOutputStream;
    new-instance v0, Lorg/bouncycastle/asn1/ASN1OutputStream;

    invoke-direct {v0, v1}, Lorg/bouncycastle/asn1/ASN1OutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 70
    .local v0, "aOut":Lorg/bouncycastle/asn1/ASN1OutputStream;
    :try_start_0
    invoke-virtual {v0, p0}, Lorg/bouncycastle/asn1/ASN1OutputStream;->writeObject(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 77
    invoke-virtual {v1}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v5

    .line 79
    .local v5, "string":[B
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_0
    array-length v6, v5

    if-eq v4, v6, :cond_0

    .line 81
    sget-object v6, Lorg/bouncycastle/asn1/DERUniversalString;->table:[C

    aget-byte v7, v5, v4

    ushr-int/lit8 v7, v7, 0x4

    and-int/lit8 v7, v7, 0xf

    aget-char v6, v6, v7

    invoke-virtual {v2, v6}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 82
    sget-object v6, Lorg/bouncycastle/asn1/DERUniversalString;->table:[C

    aget-byte v7, v5, v4

    and-int/lit8 v7, v7, 0xf

    aget-char v6, v6, v7

    invoke-virtual {v2, v6}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 79
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 72
    .end local v4    # "i":I
    .end local v5    # "string":[B
    :catch_0
    move-exception v3

    .line 74
    .local v3, "e":Ljava/io/IOException;
    new-instance v6, Ljava/lang/RuntimeException;

    const-string v7, "internal error encoding BitString"

    invoke-direct {v6, v7}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 85
    .end local v3    # "e":Ljava/io/IOException;
    .restart local v4    # "i":I
    .restart local v5    # "string":[B
    :cond_0
    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    return-object v6
.end method

.method public hashCode()I
    .locals 1

    .prologue
    .line 118
    invoke-virtual {p0}, Lorg/bouncycastle/asn1/DERUniversalString;->getString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 90
    invoke-virtual {p0}, Lorg/bouncycastle/asn1/DERUniversalString;->getString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
