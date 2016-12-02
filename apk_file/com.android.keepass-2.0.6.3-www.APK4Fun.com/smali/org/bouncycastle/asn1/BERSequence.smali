.class public Lorg/bouncycastle/asn1/BERSequence;
.super Lorg/bouncycastle/asn1/DERSequence;
.source "BERSequence.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 14
    invoke-direct {p0}, Lorg/bouncycastle/asn1/DERSequence;-><init>()V

    .line 15
    return-void
.end method

.method public constructor <init>(Lorg/bouncycastle/asn1/DEREncodable;)V
    .locals 0
    .param p1, "obj"    # Lorg/bouncycastle/asn1/DEREncodable;

    .prologue
    .line 23
    invoke-direct {p0, p1}, Lorg/bouncycastle/asn1/DERSequence;-><init>(Lorg/bouncycastle/asn1/DEREncodable;)V

    .line 24
    return-void
.end method

.method public constructor <init>(Lorg/bouncycastle/asn1/DEREncodableVector;)V
    .locals 0
    .param p1, "v"    # Lorg/bouncycastle/asn1/DEREncodableVector;

    .prologue
    .line 32
    invoke-direct {p0, p1}, Lorg/bouncycastle/asn1/DERSequence;-><init>(Lorg/bouncycastle/asn1/DEREncodableVector;)V

    .line 33
    return-void
.end method


# virtual methods
.method encode(Lorg/bouncycastle/asn1/DEROutputStream;)V
    .locals 3
    .param p1, "out"    # Lorg/bouncycastle/asn1/DEROutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 41
    instance-of v1, p1, Lorg/bouncycastle/asn1/ASN1OutputStream;

    if-nez v1, :cond_0

    instance-of v1, p1, Lorg/bouncycastle/asn1/BEROutputStream;

    if-eqz v1, :cond_2

    .line 43
    :cond_0
    const/16 v1, 0x30

    invoke-virtual {p1, v1}, Lorg/bouncycastle/asn1/DEROutputStream;->write(I)V

    .line 44
    const/16 v1, 0x80

    invoke-virtual {p1, v1}, Lorg/bouncycastle/asn1/DEROutputStream;->write(I)V

    .line 46
    invoke-virtual {p0}, Lorg/bouncycastle/asn1/BERSequence;->getObjects()Ljava/util/Enumeration;

    move-result-object v0

    .line 47
    .local v0, "e":Ljava/util/Enumeration;
    :goto_0
    invoke-interface {v0}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 49
    invoke-interface {v0}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {p1, v1}, Lorg/bouncycastle/asn1/DEROutputStream;->writeObject(Ljava/lang/Object;)V

    goto :goto_0

    .line 52
    :cond_1
    invoke-virtual {p1, v2}, Lorg/bouncycastle/asn1/DEROutputStream;->write(I)V

    .line 53
    invoke-virtual {p1, v2}, Lorg/bouncycastle/asn1/DEROutputStream;->write(I)V

    .line 59
    .end local v0    # "e":Ljava/util/Enumeration;
    :goto_1
    return-void

    .line 57
    :cond_2
    invoke-super {p0, p1}, Lorg/bouncycastle/asn1/DERSequence;->encode(Lorg/bouncycastle/asn1/DEROutputStream;)V

    goto :goto_1
.end method
