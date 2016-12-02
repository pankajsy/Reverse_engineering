.class public Lorg/bouncycastle/asn1/DERSequence;
.super Lorg/bouncycastle/asn1/ASN1Sequence;
.source "DERSequence.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 15
    invoke-direct {p0}, Lorg/bouncycastle/asn1/ASN1Sequence;-><init>()V

    .line 16
    return-void
.end method

.method public constructor <init>(Lorg/bouncycastle/asn1/DEREncodable;)V
    .locals 0
    .param p1, "obj"    # Lorg/bouncycastle/asn1/DEREncodable;

    .prologue
    .line 23
    invoke-direct {p0}, Lorg/bouncycastle/asn1/ASN1Sequence;-><init>()V

    .line 24
    invoke-virtual {p0, p1}, Lorg/bouncycastle/asn1/DERSequence;->addObject(Lorg/bouncycastle/asn1/DEREncodable;)V

    .line 25
    return-void
.end method

.method public constructor <init>(Lorg/bouncycastle/asn1/DEREncodableVector;)V
    .locals 2
    .param p1, "v"    # Lorg/bouncycastle/asn1/DEREncodableVector;

    .prologue
    .line 32
    invoke-direct {p0}, Lorg/bouncycastle/asn1/ASN1Sequence;-><init>()V

    .line 33
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    invoke-virtual {p1}, Lorg/bouncycastle/asn1/DEREncodableVector;->size()I

    move-result v1

    if-eq v0, v1, :cond_0

    .line 35
    invoke-virtual {p1, v0}, Lorg/bouncycastle/asn1/DEREncodableVector;->get(I)Lorg/bouncycastle/asn1/DEREncodable;

    move-result-object v1

    invoke-virtual {p0, v1}, Lorg/bouncycastle/asn1/DERSequence;->addObject(Lorg/bouncycastle/asn1/DEREncodable;)V

    .line 33
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 37
    :cond_0
    return-void
.end method

.method public constructor <init>([Lorg/bouncycastle/asn1/ASN1Encodable;)V
    .locals 2
    .param p1, "a"    # [Lorg/bouncycastle/asn1/ASN1Encodable;

    .prologue
    .line 44
    invoke-direct {p0}, Lorg/bouncycastle/asn1/ASN1Sequence;-><init>()V

    .line 45
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v1, p1

    if-eq v0, v1, :cond_0

    .line 47
    aget-object v1, p1, v0

    invoke-virtual {p0, v1}, Lorg/bouncycastle/asn1/DERSequence;->addObject(Lorg/bouncycastle/asn1/DEREncodable;)V

    .line 45
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 49
    :cond_0
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
    .line 64
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 65
    .local v0, "bOut":Ljava/io/ByteArrayOutputStream;
    new-instance v2, Lorg/bouncycastle/asn1/DEROutputStream;

    invoke-direct {v2, v0}, Lorg/bouncycastle/asn1/DEROutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 66
    .local v2, "dOut":Lorg/bouncycastle/asn1/DEROutputStream;
    invoke-virtual {p0}, Lorg/bouncycastle/asn1/DERSequence;->getObjects()Ljava/util/Enumeration;

    move-result-object v3

    .line 68
    .local v3, "e":Ljava/util/Enumeration;
    :goto_0
    invoke-interface {v3}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v5

    if-eqz v5, :cond_0

    .line 70
    invoke-interface {v3}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v4

    .line 72
    .local v4, "obj":Ljava/lang/Object;
    invoke-virtual {v2, v4}, Lorg/bouncycastle/asn1/DEROutputStream;->writeObject(Ljava/lang/Object;)V

    goto :goto_0

    .line 75
    .end local v4    # "obj":Ljava/lang/Object;
    :cond_0
    invoke-virtual {v2}, Lorg/bouncycastle/asn1/DEROutputStream;->close()V

    .line 77
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v1

    .line 79
    .local v1, "bytes":[B
    const/16 v5, 0x30

    invoke-virtual {p1, v5, v1}, Lorg/bouncycastle/asn1/DEROutputStream;->writeEncoded(I[B)V

    .line 80
    return-void
.end method
