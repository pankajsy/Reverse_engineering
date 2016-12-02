.class public Lorg/bouncycastle/asn1/BERTaggedObjectParser;
.super Ljava/lang/Object;
.source "BERTaggedObjectParser.java"

# interfaces
.implements Lorg/bouncycastle/asn1/ASN1TaggedObjectParser;


# instance fields
.field private _baseTag:I

.field private _contentStream:Ljava/io/InputStream;

.field private _indefiniteLength:Z

.field private _tagNumber:I


# direct methods
.method protected constructor <init>(IILjava/io/InputStream;)V
    .locals 1
    .param p1, "baseTag"    # I
    .param p2, "tagNumber"    # I
    .param p3, "contentStream"    # Ljava/io/InputStream;

    .prologue
    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 20
    iput p1, p0, Lorg/bouncycastle/asn1/BERTaggedObjectParser;->_baseTag:I

    .line 21
    iput p2, p0, Lorg/bouncycastle/asn1/BERTaggedObjectParser;->_tagNumber:I

    .line 22
    iput-object p3, p0, Lorg/bouncycastle/asn1/BERTaggedObjectParser;->_contentStream:Ljava/io/InputStream;

    .line 23
    instance-of v0, p3, Lorg/bouncycastle/asn1/IndefiniteLengthInputStream;

    iput-boolean v0, p0, Lorg/bouncycastle/asn1/BERTaggedObjectParser;->_indefiniteLength:Z

    .line 24
    return-void
.end method

.method private rLoadVector(Ljava/io/InputStream;)Lorg/bouncycastle/asn1/ASN1EncodableVector;
    .locals 3
    .param p1, "in"    # Ljava/io/InputStream;

    .prologue
    .line 85
    :try_start_0
    new-instance v1, Lorg/bouncycastle/asn1/ASN1StreamParser;

    invoke-direct {v1, p1}, Lorg/bouncycastle/asn1/ASN1StreamParser;-><init>(Ljava/io/InputStream;)V

    invoke-virtual {v1}, Lorg/bouncycastle/asn1/ASN1StreamParser;->readVector()Lorg/bouncycastle/asn1/ASN1EncodableVector;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    return-object v1

    .line 87
    :catch_0
    move-exception v0

    .line 89
    .local v0, "e":Ljava/io/IOException;
    new-instance v1, Lorg/bouncycastle/asn1/ASN1ParsingException;

    invoke-virtual {v0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2, v0}, Lorg/bouncycastle/asn1/ASN1ParsingException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method


# virtual methods
.method public getDERObject()Lorg/bouncycastle/asn1/DERObject;
    .locals 8

    .prologue
    const/4 v7, 0x1

    const/4 v6, 0x0

    .line 95
    iget-boolean v3, p0, Lorg/bouncycastle/asn1/BERTaggedObjectParser;->_indefiniteLength:Z

    if-eqz v3, :cond_1

    .line 97
    iget-object v3, p0, Lorg/bouncycastle/asn1/BERTaggedObjectParser;->_contentStream:Ljava/io/InputStream;

    invoke-direct {p0, v3}, Lorg/bouncycastle/asn1/BERTaggedObjectParser;->rLoadVector(Ljava/io/InputStream;)Lorg/bouncycastle/asn1/ASN1EncodableVector;

    move-result-object v2

    .line 99
    .local v2, "v":Lorg/bouncycastle/asn1/ASN1EncodableVector;
    invoke-virtual {v2}, Lorg/bouncycastle/asn1/ASN1EncodableVector;->size()I

    move-result v3

    if-ne v3, v7, :cond_0

    new-instance v3, Lorg/bouncycastle/asn1/BERTaggedObject;

    iget v4, p0, Lorg/bouncycastle/asn1/BERTaggedObjectParser;->_tagNumber:I

    .line 100
    invoke-virtual {v2, v6}, Lorg/bouncycastle/asn1/ASN1EncodableVector;->get(I)Lorg/bouncycastle/asn1/DEREncodable;

    move-result-object v5

    invoke-direct {v3, v7, v4, v5}, Lorg/bouncycastle/asn1/BERTaggedObject;-><init>(ZILorg/bouncycastle/asn1/DEREncodable;)V

    .line 116
    .end local v2    # "v":Lorg/bouncycastle/asn1/ASN1EncodableVector;
    :goto_0
    return-object v3

    .line 100
    .restart local v2    # "v":Lorg/bouncycastle/asn1/ASN1EncodableVector;
    :cond_0
    new-instance v3, Lorg/bouncycastle/asn1/BERTaggedObject;

    iget v4, p0, Lorg/bouncycastle/asn1/BERTaggedObjectParser;->_tagNumber:I

    .line 101
    invoke-static {v2}, Lorg/bouncycastle/asn1/BERFactory;->createSequence(Lorg/bouncycastle/asn1/ASN1EncodableVector;)Lorg/bouncycastle/asn1/BERSequence;

    move-result-object v5

    invoke-direct {v3, v6, v4, v5}, Lorg/bouncycastle/asn1/BERTaggedObject;-><init>(ZILorg/bouncycastle/asn1/DEREncodable;)V

    goto :goto_0

    .line 104
    .end local v2    # "v":Lorg/bouncycastle/asn1/ASN1EncodableVector;
    :cond_1
    invoke-virtual {p0}, Lorg/bouncycastle/asn1/BERTaggedObjectParser;->isConstructed()Z

    move-result v3

    if-eqz v3, :cond_3

    .line 106
    iget-object v3, p0, Lorg/bouncycastle/asn1/BERTaggedObjectParser;->_contentStream:Ljava/io/InputStream;

    invoke-direct {p0, v3}, Lorg/bouncycastle/asn1/BERTaggedObjectParser;->rLoadVector(Ljava/io/InputStream;)Lorg/bouncycastle/asn1/ASN1EncodableVector;

    move-result-object v2

    .line 108
    .restart local v2    # "v":Lorg/bouncycastle/asn1/ASN1EncodableVector;
    invoke-virtual {v2}, Lorg/bouncycastle/asn1/ASN1EncodableVector;->size()I

    move-result v3

    if-ne v3, v7, :cond_2

    new-instance v3, Lorg/bouncycastle/asn1/DERTaggedObject;

    iget v4, p0, Lorg/bouncycastle/asn1/BERTaggedObjectParser;->_tagNumber:I

    .line 109
    invoke-virtual {v2, v6}, Lorg/bouncycastle/asn1/ASN1EncodableVector;->get(I)Lorg/bouncycastle/asn1/DEREncodable;

    move-result-object v5

    invoke-direct {v3, v7, v4, v5}, Lorg/bouncycastle/asn1/DERTaggedObject;-><init>(ZILorg/bouncycastle/asn1/DEREncodable;)V

    goto :goto_0

    :cond_2
    new-instance v3, Lorg/bouncycastle/asn1/DERTaggedObject;

    iget v4, p0, Lorg/bouncycastle/asn1/BERTaggedObjectParser;->_tagNumber:I

    .line 110
    invoke-static {v2}, Lorg/bouncycastle/asn1/DERFactory;->createSequence(Lorg/bouncycastle/asn1/ASN1EncodableVector;)Lorg/bouncycastle/asn1/DERSequence;

    move-result-object v5

    invoke-direct {v3, v6, v4, v5}, Lorg/bouncycastle/asn1/DERTaggedObject;-><init>(ZILorg/bouncycastle/asn1/DEREncodable;)V

    goto :goto_0

    .line 115
    .end local v2    # "v":Lorg/bouncycastle/asn1/ASN1EncodableVector;
    :cond_3
    :try_start_0
    iget-object v0, p0, Lorg/bouncycastle/asn1/BERTaggedObjectParser;->_contentStream:Ljava/io/InputStream;

    check-cast v0, Lorg/bouncycastle/asn1/DefiniteLengthInputStream;

    .line 116
    .local v0, "defIn":Lorg/bouncycastle/asn1/DefiniteLengthInputStream;
    new-instance v3, Lorg/bouncycastle/asn1/DERTaggedObject;

    const/4 v4, 0x0

    iget v5, p0, Lorg/bouncycastle/asn1/BERTaggedObjectParser;->_tagNumber:I

    new-instance v6, Lorg/bouncycastle/asn1/DEROctetString;

    invoke-virtual {v0}, Lorg/bouncycastle/asn1/DefiniteLengthInputStream;->toByteArray()[B

    move-result-object v7

    invoke-direct {v6, v7}, Lorg/bouncycastle/asn1/DEROctetString;-><init>([B)V

    invoke-direct {v3, v4, v5, v6}, Lorg/bouncycastle/asn1/DERTaggedObject;-><init>(ZILorg/bouncycastle/asn1/DEREncodable;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 118
    .end local v0    # "defIn":Lorg/bouncycastle/asn1/DefiniteLengthInputStream;
    :catch_0
    move-exception v1

    .line 120
    .local v1, "e":Ljava/io/IOException;
    new-instance v3, Ljava/lang/IllegalStateException;

    invoke-virtual {v1}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v3
.end method

.method public getObjectParser(IZ)Lorg/bouncycastle/asn1/DEREncodable;
    .locals 3
    .param p1, "tag"    # I
    .param p2, "isExplicit"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 41
    if-eqz p2, :cond_0

    .line 43
    new-instance v0, Lorg/bouncycastle/asn1/ASN1StreamParser;

    iget-object v1, p0, Lorg/bouncycastle/asn1/BERTaggedObjectParser;->_contentStream:Ljava/io/InputStream;

    invoke-direct {v0, v1}, Lorg/bouncycastle/asn1/ASN1StreamParser;-><init>(Ljava/io/InputStream;)V

    invoke-virtual {v0}, Lorg/bouncycastle/asn1/ASN1StreamParser;->readObject()Lorg/bouncycastle/asn1/DEREncodable;

    move-result-object v0

    .line 74
    :goto_0
    return-object v0

    .line 46
    :cond_0
    sparse-switch p1, :sswitch_data_0

    .line 78
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "implicit tagging not implemented"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 49
    :sswitch_0
    iget-boolean v0, p0, Lorg/bouncycastle/asn1/BERTaggedObjectParser;->_indefiniteLength:Z

    if-eqz v0, :cond_1

    .line 51
    new-instance v0, Lorg/bouncycastle/asn1/BERSetParser;

    new-instance v1, Lorg/bouncycastle/asn1/ASN1StreamParser;

    iget-object v2, p0, Lorg/bouncycastle/asn1/BERTaggedObjectParser;->_contentStream:Ljava/io/InputStream;

    invoke-direct {v1, v2}, Lorg/bouncycastle/asn1/ASN1StreamParser;-><init>(Ljava/io/InputStream;)V

    invoke-direct {v0, v1}, Lorg/bouncycastle/asn1/BERSetParser;-><init>(Lorg/bouncycastle/asn1/ASN1StreamParser;)V

    goto :goto_0

    .line 55
    :cond_1
    new-instance v0, Lorg/bouncycastle/asn1/DERSetParser;

    new-instance v1, Lorg/bouncycastle/asn1/ASN1StreamParser;

    iget-object v2, p0, Lorg/bouncycastle/asn1/BERTaggedObjectParser;->_contentStream:Ljava/io/InputStream;

    invoke-direct {v1, v2}, Lorg/bouncycastle/asn1/ASN1StreamParser;-><init>(Ljava/io/InputStream;)V

    invoke-direct {v0, v1}, Lorg/bouncycastle/asn1/DERSetParser;-><init>(Lorg/bouncycastle/asn1/ASN1StreamParser;)V

    goto :goto_0

    .line 58
    :sswitch_1
    iget-boolean v0, p0, Lorg/bouncycastle/asn1/BERTaggedObjectParser;->_indefiniteLength:Z

    if-eqz v0, :cond_2

    .line 60
    new-instance v0, Lorg/bouncycastle/asn1/BERSequenceParser;

    new-instance v1, Lorg/bouncycastle/asn1/ASN1StreamParser;

    iget-object v2, p0, Lorg/bouncycastle/asn1/BERTaggedObjectParser;->_contentStream:Ljava/io/InputStream;

    invoke-direct {v1, v2}, Lorg/bouncycastle/asn1/ASN1StreamParser;-><init>(Ljava/io/InputStream;)V

    invoke-direct {v0, v1}, Lorg/bouncycastle/asn1/BERSequenceParser;-><init>(Lorg/bouncycastle/asn1/ASN1StreamParser;)V

    goto :goto_0

    .line 64
    :cond_2
    new-instance v0, Lorg/bouncycastle/asn1/DERSequenceParser;

    new-instance v1, Lorg/bouncycastle/asn1/ASN1StreamParser;

    iget-object v2, p0, Lorg/bouncycastle/asn1/BERTaggedObjectParser;->_contentStream:Ljava/io/InputStream;

    invoke-direct {v1, v2}, Lorg/bouncycastle/asn1/ASN1StreamParser;-><init>(Ljava/io/InputStream;)V

    invoke-direct {v0, v1}, Lorg/bouncycastle/asn1/DERSequenceParser;-><init>(Lorg/bouncycastle/asn1/ASN1StreamParser;)V

    goto :goto_0

    .line 68
    :sswitch_2
    iget-boolean v0, p0, Lorg/bouncycastle/asn1/BERTaggedObjectParser;->_indefiniteLength:Z

    if-nez v0, :cond_3

    invoke-virtual {p0}, Lorg/bouncycastle/asn1/BERTaggedObjectParser;->isConstructed()Z

    move-result v0

    if-eqz v0, :cond_4

    .line 70
    :cond_3
    new-instance v0, Lorg/bouncycastle/asn1/BEROctetStringParser;

    new-instance v1, Lorg/bouncycastle/asn1/ASN1StreamParser;

    iget-object v2, p0, Lorg/bouncycastle/asn1/BERTaggedObjectParser;->_contentStream:Ljava/io/InputStream;

    invoke-direct {v1, v2}, Lorg/bouncycastle/asn1/ASN1StreamParser;-><init>(Ljava/io/InputStream;)V

    invoke-direct {v0, v1}, Lorg/bouncycastle/asn1/BEROctetStringParser;-><init>(Lorg/bouncycastle/asn1/ASN1StreamParser;)V

    goto :goto_0

    .line 74
    :cond_4
    new-instance v1, Lorg/bouncycastle/asn1/DEROctetStringParser;

    iget-object v0, p0, Lorg/bouncycastle/asn1/BERTaggedObjectParser;->_contentStream:Ljava/io/InputStream;

    check-cast v0, Lorg/bouncycastle/asn1/DefiniteLengthInputStream;

    invoke-direct {v1, v0}, Lorg/bouncycastle/asn1/DEROctetStringParser;-><init>(Lorg/bouncycastle/asn1/DefiniteLengthInputStream;)V

    move-object v0, v1

    goto :goto_0

    .line 46
    nop

    :sswitch_data_0
    .sparse-switch
        0x4 -> :sswitch_2
        0x10 -> :sswitch_1
        0x11 -> :sswitch_0
    .end sparse-switch
.end method

.method public getTagNo()I
    .locals 1

    .prologue
    .line 33
    iget v0, p0, Lorg/bouncycastle/asn1/BERTaggedObjectParser;->_tagNumber:I

    return v0
.end method

.method public isConstructed()Z
    .locals 1

    .prologue
    .line 28
    iget v0, p0, Lorg/bouncycastle/asn1/BERTaggedObjectParser;->_baseTag:I

    and-int/lit8 v0, v0, 0x20

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
