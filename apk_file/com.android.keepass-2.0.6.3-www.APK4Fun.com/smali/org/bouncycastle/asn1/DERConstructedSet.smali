.class public Lorg/bouncycastle/asn1/DERConstructedSet;
.super Lorg/bouncycastle/asn1/ASN1Set;
.source "DERConstructedSet.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 16
    invoke-direct {p0}, Lorg/bouncycastle/asn1/ASN1Set;-><init>()V

    .line 17
    return-void
.end method

.method public constructor <init>(Lorg/bouncycastle/asn1/DEREncodable;)V
    .locals 0
    .param p1, "obj"    # Lorg/bouncycastle/asn1/DEREncodable;

    .prologue
    .line 24
    invoke-direct {p0}, Lorg/bouncycastle/asn1/ASN1Set;-><init>()V

    .line 25
    invoke-virtual {p0, p1}, Lorg/bouncycastle/asn1/DERConstructedSet;->addObject(Lorg/bouncycastle/asn1/DEREncodable;)V

    .line 26
    return-void
.end method

.method public constructor <init>(Lorg/bouncycastle/asn1/DEREncodableVector;)V
    .locals 2
    .param p1, "v"    # Lorg/bouncycastle/asn1/DEREncodableVector;

    .prologue
    .line 33
    invoke-direct {p0}, Lorg/bouncycastle/asn1/ASN1Set;-><init>()V

    .line 34
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    invoke-virtual {p1}, Lorg/bouncycastle/asn1/DEREncodableVector;->size()I

    move-result v1

    if-eq v0, v1, :cond_0

    .line 36
    invoke-virtual {p1, v0}, Lorg/bouncycastle/asn1/DEREncodableVector;->get(I)Lorg/bouncycastle/asn1/DEREncodable;

    move-result-object v1

    invoke-virtual {p0, v1}, Lorg/bouncycastle/asn1/DERConstructedSet;->addObject(Lorg/bouncycastle/asn1/DEREncodable;)V

    .line 34
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 38
    :cond_0
    return-void
.end method


# virtual methods
.method public addObject(Lorg/bouncycastle/asn1/DEREncodable;)V
    .locals 0
    .param p1, "obj"    # Lorg/bouncycastle/asn1/DEREncodable;

    .prologue
    .line 43
    invoke-super {p0, p1}, Lorg/bouncycastle/asn1/ASN1Set;->addObject(Lorg/bouncycastle/asn1/DEREncodable;)V

    .line 44
    return-void
.end method

.method encode(Lorg/bouncycastle/asn1/DEROutputStream;)V
    .locals 6
    .param p1, "out"    # Lorg/bouncycastle/asn1/DEROutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 63
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 64
    .local v0, "bOut":Ljava/io/ByteArrayOutputStream;
    new-instance v2, Lorg/bouncycastle/asn1/DEROutputStream;

    invoke-direct {v2, v0}, Lorg/bouncycastle/asn1/DEROutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 65
    .local v2, "dOut":Lorg/bouncycastle/asn1/DEROutputStream;
    invoke-virtual {p0}, Lorg/bouncycastle/asn1/DERConstructedSet;->getObjects()Ljava/util/Enumeration;

    move-result-object v3

    .line 67
    .local v3, "e":Ljava/util/Enumeration;
    :goto_0
    invoke-interface {v3}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v5

    if-eqz v5, :cond_0

    .line 69
    invoke-interface {v3}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v4

    .line 71
    .local v4, "obj":Ljava/lang/Object;
    invoke-virtual {v2, v4}, Lorg/bouncycastle/asn1/DEROutputStream;->writeObject(Ljava/lang/Object;)V

    goto :goto_0

    .line 74
    .end local v4    # "obj":Ljava/lang/Object;
    :cond_0
    invoke-virtual {v2}, Lorg/bouncycastle/asn1/DEROutputStream;->close()V

    .line 76
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v1

    .line 78
    .local v1, "bytes":[B
    const/16 v5, 0x31

    invoke-virtual {p1, v5, v1}, Lorg/bouncycastle/asn1/DEROutputStream;->writeEncoded(I[B)V

    .line 79
    return-void
.end method

.method public getSize()I
    .locals 1

    .prologue
    .line 48
    invoke-virtual {p0}, Lorg/bouncycastle/asn1/DERConstructedSet;->size()I

    move-result v0

    return v0
.end method
