.class public Lorg/bouncycastle/asn1/DERSet;
.super Lorg/bouncycastle/asn1/ASN1Set;
.source "DERSet.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 18
    invoke-direct {p0}, Lorg/bouncycastle/asn1/ASN1Set;-><init>()V

    .line 19
    return-void
.end method

.method public constructor <init>(Lorg/bouncycastle/asn1/DEREncodable;)V
    .locals 0
    .param p1, "obj"    # Lorg/bouncycastle/asn1/DEREncodable;

    .prologue
    .line 26
    invoke-direct {p0}, Lorg/bouncycastle/asn1/ASN1Set;-><init>()V

    .line 27
    invoke-virtual {p0, p1}, Lorg/bouncycastle/asn1/DERSet;->addObject(Lorg/bouncycastle/asn1/DEREncodable;)V

    .line 28
    return-void
.end method

.method public constructor <init>(Lorg/bouncycastle/asn1/DEREncodableVector;)V
    .locals 1
    .param p1, "v"    # Lorg/bouncycastle/asn1/DEREncodableVector;

    .prologue
    .line 36
    const/4 v0, 0x1

    invoke-direct {p0, p1, v0}, Lorg/bouncycastle/asn1/DERSet;-><init>(Lorg/bouncycastle/asn1/DEREncodableVector;Z)V

    .line 37
    return-void
.end method

.method constructor <init>(Lorg/bouncycastle/asn1/DEREncodableVector;Z)V
    .locals 2
    .param p1, "v"    # Lorg/bouncycastle/asn1/DEREncodableVector;
    .param p2, "needsSorting"    # Z

    .prologue
    .line 59
    invoke-direct {p0}, Lorg/bouncycastle/asn1/ASN1Set;-><init>()V

    .line 60
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    invoke-virtual {p1}, Lorg/bouncycastle/asn1/DEREncodableVector;->size()I

    move-result v1

    if-eq v0, v1, :cond_0

    .line 62
    invoke-virtual {p1, v0}, Lorg/bouncycastle/asn1/DEREncodableVector;->get(I)Lorg/bouncycastle/asn1/DEREncodable;

    move-result-object v1

    invoke-virtual {p0, v1}, Lorg/bouncycastle/asn1/DERSet;->addObject(Lorg/bouncycastle/asn1/DEREncodable;)V

    .line 60
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 65
    :cond_0
    if-eqz p2, :cond_1

    .line 67
    invoke-virtual {p0}, Lorg/bouncycastle/asn1/DERSet;->sort()V

    .line 69
    :cond_1
    return-void
.end method

.method public constructor <init>([Lorg/bouncycastle/asn1/ASN1Encodable;)V
    .locals 2
    .param p1, "a"    # [Lorg/bouncycastle/asn1/ASN1Encodable;

    .prologue
    .line 44
    invoke-direct {p0}, Lorg/bouncycastle/asn1/ASN1Set;-><init>()V

    .line 45
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v1, p1

    if-eq v0, v1, :cond_0

    .line 47
    aget-object v1, p1, v0

    invoke-virtual {p0, v1}, Lorg/bouncycastle/asn1/DERSet;->addObject(Lorg/bouncycastle/asn1/DEREncodable;)V

    .line 45
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 50
    :cond_0
    invoke-virtual {p0}, Lorg/bouncycastle/asn1/DERSet;->sort()V

    .line 51
    return-void
.end method


# virtual methods
.method encode(Lorg/bouncycastle/asn1/DEROutputStream;)V
    .locals 6
    .param p1, "out"    # Lorg/bouncycastle/asn1/DEROutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 84
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 85
    .local v0, "bOut":Ljava/io/ByteArrayOutputStream;
    new-instance v2, Lorg/bouncycastle/asn1/DEROutputStream;

    invoke-direct {v2, v0}, Lorg/bouncycastle/asn1/DEROutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 86
    .local v2, "dOut":Lorg/bouncycastle/asn1/DEROutputStream;
    invoke-virtual {p0}, Lorg/bouncycastle/asn1/DERSet;->getObjects()Ljava/util/Enumeration;

    move-result-object v3

    .line 88
    .local v3, "e":Ljava/util/Enumeration;
    :goto_0
    invoke-interface {v3}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v5

    if-eqz v5, :cond_0

    .line 90
    invoke-interface {v3}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v4

    .line 92
    .local v4, "obj":Ljava/lang/Object;
    invoke-virtual {v2, v4}, Lorg/bouncycastle/asn1/DEROutputStream;->writeObject(Ljava/lang/Object;)V

    goto :goto_0

    .line 95
    .end local v4    # "obj":Ljava/lang/Object;
    :cond_0
    invoke-virtual {v2}, Lorg/bouncycastle/asn1/DEROutputStream;->close()V

    .line 97
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v1

    .line 99
    .local v1, "bytes":[B
    const/16 v5, 0x31

    invoke-virtual {p1, v5, v1}, Lorg/bouncycastle/asn1/DEROutputStream;->writeEncoded(I[B)V

    .line 100
    return-void
.end method
