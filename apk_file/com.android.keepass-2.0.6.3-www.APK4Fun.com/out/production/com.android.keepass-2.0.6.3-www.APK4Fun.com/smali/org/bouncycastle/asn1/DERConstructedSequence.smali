.class public Lorg/bouncycastle/asn1/DERConstructedSequence;
.super Lorg/bouncycastle/asn1/ASN1Sequence;
.source "DERConstructedSequence.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 11
    invoke-direct {p0}, Lorg/bouncycastle/asn1/ASN1Sequence;-><init>()V

    return-void
.end method


# virtual methods
.method public addObject(Lorg/bouncycastle/asn1/DEREncodable;)V
    .locals 0
    .param p1, "obj"    # Lorg/bouncycastle/asn1/DEREncodable;

    .prologue
    .line 17
    invoke-super {p0, p1}, Lorg/bouncycastle/asn1/ASN1Sequence;->addObject(Lorg/bouncycastle/asn1/DEREncodable;)V

    .line 18
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
    .line 37
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 38
    .local v0, "bOut":Ljava/io/ByteArrayOutputStream;
    new-instance v2, Lorg/bouncycastle/asn1/DEROutputStream;

    invoke-direct {v2, v0}, Lorg/bouncycastle/asn1/DEROutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 39
    .local v2, "dOut":Lorg/bouncycastle/asn1/DEROutputStream;
    invoke-virtual {p0}, Lorg/bouncycastle/asn1/DERConstructedSequence;->getObjects()Ljava/util/Enumeration;

    move-result-object v3

    .line 41
    .local v3, "e":Ljava/util/Enumeration;
    :goto_0
    invoke-interface {v3}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v5

    if-eqz v5, :cond_0

    .line 43
    invoke-interface {v3}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v4

    .line 45
    .local v4, "obj":Ljava/lang/Object;
    invoke-virtual {v2, v4}, Lorg/bouncycastle/asn1/DEROutputStream;->writeObject(Ljava/lang/Object;)V

    goto :goto_0

    .line 48
    .end local v4    # "obj":Ljava/lang/Object;
    :cond_0
    invoke-virtual {v2}, Lorg/bouncycastle/asn1/DEROutputStream;->close()V

    .line 50
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v1

    .line 52
    .local v1, "bytes":[B
    const/16 v5, 0x30

    invoke-virtual {p1, v5, v1}, Lorg/bouncycastle/asn1/DEROutputStream;->writeEncoded(I[B)V

    .line 53
    return-void
.end method

.method public getSize()I
    .locals 1

    .prologue
    .line 22
    invoke-virtual {p0}, Lorg/bouncycastle/asn1/DERConstructedSequence;->size()I

    move-result v0

    return v0
.end method
