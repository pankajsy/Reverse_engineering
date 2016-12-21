.class public Lorg/bouncycastle/asn1/ASN1StreamParser;
.super Ljava/lang/Object;
.source "ASN1StreamParser.java"


# instance fields
.field private final _in:Ljava/io/InputStream;

.field private final _limit:I


# direct methods
.method public constructor <init>(Ljava/io/InputStream;)V
    .locals 1
    .param p1, "in"    # Ljava/io/InputStream;

    .prologue
    .line 25
    invoke-static {p1}, Lorg/bouncycastle/asn1/ASN1StreamParser;->findLimit(Ljava/io/InputStream;)I

    move-result v0

    invoke-direct {p0, p1, v0}, Lorg/bouncycastle/asn1/ASN1StreamParser;-><init>(Ljava/io/InputStream;I)V

    .line 26
    return-void
.end method

.method public constructor <init>(Ljava/io/InputStream;I)V
    .locals 0
    .param p1, "in"    # Ljava/io/InputStream;
    .param p2, "limit"    # I

    .prologue
    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 32
    iput-object p1, p0, Lorg/bouncycastle/asn1/ASN1StreamParser;->_in:Ljava/io/InputStream;

    .line 33
    iput p2, p0, Lorg/bouncycastle/asn1/ASN1StreamParser;->_limit:I

    .line 34
    return-void
.end method

.method public constructor <init>([B)V
    .locals 2
    .param p1, "encoding"    # [B

    .prologue
    .line 39
    new-instance v0, Ljava/io/ByteArrayInputStream;

    invoke-direct {v0, p1}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    array-length v1, p1

    invoke-direct {p0, v0, v1}, Lorg/bouncycastle/asn1/ASN1StreamParser;-><init>(Ljava/io/InputStream;I)V

    .line 40
    return-void
.end method

.method private static findLimit(Ljava/io/InputStream;)I
    .locals 1
    .param p0, "in"    # Ljava/io/InputStream;

    .prologue
    .line 14
    instance-of v0, p0, Lorg/bouncycastle/asn1/DefiniteLengthInputStream;

    if-eqz v0, :cond_0

    .line 16
    check-cast p0, Lorg/bouncycastle/asn1/DefiniteLengthInputStream;

    .end local p0    # "in":Ljava/io/InputStream;
    invoke-virtual {p0}, Lorg/bouncycastle/asn1/DefiniteLengthInputStream;->getRemaining()I

    move-result v0

    .line 19
    :goto_0
    return v0

    .restart local p0    # "in":Ljava/io/InputStream;
    :cond_0
    const v0, 0x7fffffff

    goto :goto_0
.end method

.method private set00Check(Z)V
    .locals 1
    .param p1, "enabled"    # Z

    .prologue
    .line 156
    iget-object v0, p0, Lorg/bouncycastle/asn1/ASN1StreamParser;->_in:Ljava/io/InputStream;

    instance-of v0, v0, Lorg/bouncycastle/asn1/IndefiniteLengthInputStream;

    if-eqz v0, :cond_0

    .line 158
    iget-object v0, p0, Lorg/bouncycastle/asn1/ASN1StreamParser;->_in:Ljava/io/InputStream;

    check-cast v0, Lorg/bouncycastle/asn1/IndefiniteLengthInputStream;

    invoke-virtual {v0, p1}, Lorg/bouncycastle/asn1/IndefiniteLengthInputStream;->setEofOn00(Z)V

    .line 160
    :cond_0
    return-void
.end method


# virtual methods
.method public readObject()Lorg/bouncycastle/asn1/DEREncodable;
    .locals 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v7, 0x1

    const/4 v2, 0x0

    .line 45
    iget-object v8, p0, Lorg/bouncycastle/asn1/ASN1StreamParser;->_in:Ljava/io/InputStream;

    invoke-virtual {v8}, Ljava/io/InputStream;->read()I

    move-result v5

    .line 46
    .local v5, "tag":I
    const/4 v8, -0x1

    if-ne v5, v8, :cond_0

    .line 48
    const/4 v7, 0x0

    .line 150
    :goto_0
    return-object v7

    .line 54
    :cond_0
    invoke-direct {p0, v2}, Lorg/bouncycastle/asn1/ASN1StreamParser;->set00Check(Z)V

    .line 59
    iget-object v8, p0, Lorg/bouncycastle/asn1/ASN1StreamParser;->_in:Ljava/io/InputStream;

    invoke-static {v8, v5}, Lorg/bouncycastle/asn1/ASN1InputStream;->readTagNumber(Ljava/io/InputStream;I)I

    move-result v6

    .line 61
    .local v6, "tagNo":I
    and-int/lit8 v8, v5, 0x20

    if-eqz v8, :cond_1

    move v2, v7

    .line 66
    .local v2, "isConstructed":Z
    :cond_1
    iget-object v8, p0, Lorg/bouncycastle/asn1/ASN1StreamParser;->_in:Ljava/io/InputStream;

    iget v9, p0, Lorg/bouncycastle/asn1/ASN1StreamParser;->_limit:I

    invoke-static {v8, v9}, Lorg/bouncycastle/asn1/ASN1InputStream;->readLength(Ljava/io/InputStream;I)I

    move-result v3

    .line 68
    .local v3, "length":I
    if-gez v3, :cond_5

    .line 70
    if-nez v2, :cond_2

    .line 72
    new-instance v7, Ljava/io/IOException;

    const-string v8, "indefinite length primitive encoding encountered"

    invoke-direct {v7, v8}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 75
    :cond_2
    new-instance v1, Lorg/bouncycastle/asn1/IndefiniteLengthInputStream;

    iget-object v7, p0, Lorg/bouncycastle/asn1/ASN1StreamParser;->_in:Ljava/io/InputStream;

    invoke-direct {v1, v7}, Lorg/bouncycastle/asn1/IndefiniteLengthInputStream;-><init>(Ljava/io/InputStream;)V

    .line 77
    .local v1, "indIn":Lorg/bouncycastle/asn1/IndefiniteLengthInputStream;
    and-int/lit8 v7, v5, 0x40

    if-eqz v7, :cond_3

    .line 79
    new-instance v4, Lorg/bouncycastle/asn1/ASN1StreamParser;

    iget v7, p0, Lorg/bouncycastle/asn1/ASN1StreamParser;->_limit:I

    invoke-direct {v4, v1, v7}, Lorg/bouncycastle/asn1/ASN1StreamParser;-><init>(Ljava/io/InputStream;I)V

    .line 81
    .local v4, "sp":Lorg/bouncycastle/asn1/ASN1StreamParser;
    new-instance v7, Lorg/bouncycastle/asn1/BERApplicationSpecificParser;

    invoke-direct {v7, v6, v4}, Lorg/bouncycastle/asn1/BERApplicationSpecificParser;-><init>(ILorg/bouncycastle/asn1/ASN1StreamParser;)V

    goto :goto_0

    .line 84
    .end local v4    # "sp":Lorg/bouncycastle/asn1/ASN1StreamParser;
    :cond_3
    and-int/lit16 v7, v5, 0x80

    if-eqz v7, :cond_4

    .line 86
    new-instance v7, Lorg/bouncycastle/asn1/BERTaggedObjectParser;

    invoke-direct {v7, v5, v6, v1}, Lorg/bouncycastle/asn1/BERTaggedObjectParser;-><init>(IILjava/io/InputStream;)V

    goto :goto_0

    .line 89
    :cond_4
    new-instance v4, Lorg/bouncycastle/asn1/ASN1StreamParser;

    iget v7, p0, Lorg/bouncycastle/asn1/ASN1StreamParser;->_limit:I

    invoke-direct {v4, v1, v7}, Lorg/bouncycastle/asn1/ASN1StreamParser;-><init>(Ljava/io/InputStream;I)V

    .line 92
    .restart local v4    # "sp":Lorg/bouncycastle/asn1/ASN1StreamParser;
    sparse-switch v6, :sswitch_data_0

    .line 104
    new-instance v7, Ljava/io/IOException;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "unknown BER object encountered: 0x"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-static {v6}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 95
    :sswitch_0
    new-instance v7, Lorg/bouncycastle/asn1/BEROctetStringParser;

    invoke-direct {v7, v4}, Lorg/bouncycastle/asn1/BEROctetStringParser;-><init>(Lorg/bouncycastle/asn1/ASN1StreamParser;)V

    goto :goto_0

    .line 97
    :sswitch_1
    new-instance v7, Lorg/bouncycastle/asn1/BERSequenceParser;

    invoke-direct {v7, v4}, Lorg/bouncycastle/asn1/BERSequenceParser;-><init>(Lorg/bouncycastle/asn1/ASN1StreamParser;)V

    goto :goto_0

    .line 99
    :sswitch_2
    new-instance v7, Lorg/bouncycastle/asn1/BERSetParser;

    invoke-direct {v7, v4}, Lorg/bouncycastle/asn1/BERSetParser;-><init>(Lorg/bouncycastle/asn1/ASN1StreamParser;)V

    goto :goto_0

    .line 101
    :sswitch_3
    new-instance v7, Lorg/bouncycastle/asn1/DERExternalParser;

    invoke-direct {v7, v4}, Lorg/bouncycastle/asn1/DERExternalParser;-><init>(Lorg/bouncycastle/asn1/ASN1StreamParser;)V

    goto/16 :goto_0

    .line 109
    .end local v1    # "indIn":Lorg/bouncycastle/asn1/IndefiniteLengthInputStream;
    .end local v4    # "sp":Lorg/bouncycastle/asn1/ASN1StreamParser;
    :cond_5
    new-instance v0, Lorg/bouncycastle/asn1/DefiniteLengthInputStream;

    iget-object v8, p0, Lorg/bouncycastle/asn1/ASN1StreamParser;->_in:Ljava/io/InputStream;

    invoke-direct {v0, v8, v3}, Lorg/bouncycastle/asn1/DefiniteLengthInputStream;-><init>(Ljava/io/InputStream;I)V

    .line 111
    .local v0, "defIn":Lorg/bouncycastle/asn1/DefiniteLengthInputStream;
    and-int/lit8 v8, v5, 0x40

    if-eqz v8, :cond_6

    .line 113
    new-instance v7, Lorg/bouncycastle/asn1/DERApplicationSpecific;

    invoke-virtual {v0}, Lorg/bouncycastle/asn1/DefiniteLengthInputStream;->toByteArray()[B

    move-result-object v8

    invoke-direct {v7, v2, v6, v8}, Lorg/bouncycastle/asn1/DERApplicationSpecific;-><init>(ZI[B)V

    goto/16 :goto_0

    .line 116
    :cond_6
    and-int/lit16 v8, v5, 0x80

    if-eqz v8, :cond_7

    .line 118
    new-instance v7, Lorg/bouncycastle/asn1/BERTaggedObjectParser;

    invoke-direct {v7, v5, v6, v0}, Lorg/bouncycastle/asn1/BERTaggedObjectParser;-><init>(IILjava/io/InputStream;)V

    goto/16 :goto_0

    .line 121
    :cond_7
    if-eqz v2, :cond_8

    .line 124
    sparse-switch v6, :sswitch_data_1

    .line 139
    new-instance v8, Lorg/bouncycastle/asn1/DERUnknownTag;

    invoke-virtual {v0}, Lorg/bouncycastle/asn1/DefiniteLengthInputStream;->toByteArray()[B

    move-result-object v9

    invoke-direct {v8, v7, v6, v9}, Lorg/bouncycastle/asn1/DERUnknownTag;-><init>(ZI[B)V

    move-object v7, v8

    goto/16 :goto_0

    .line 130
    :sswitch_4
    new-instance v7, Lorg/bouncycastle/asn1/BEROctetStringParser;

    new-instance v8, Lorg/bouncycastle/asn1/ASN1StreamParser;

    invoke-direct {v8, v0}, Lorg/bouncycastle/asn1/ASN1StreamParser;-><init>(Ljava/io/InputStream;)V

    invoke-direct {v7, v8}, Lorg/bouncycastle/asn1/BEROctetStringParser;-><init>(Lorg/bouncycastle/asn1/ASN1StreamParser;)V

    goto/16 :goto_0

    .line 132
    :sswitch_5
    new-instance v7, Lorg/bouncycastle/asn1/DERSequenceParser;

    new-instance v8, Lorg/bouncycastle/asn1/ASN1StreamParser;

    invoke-direct {v8, v0}, Lorg/bouncycastle/asn1/ASN1StreamParser;-><init>(Ljava/io/InputStream;)V

    invoke-direct {v7, v8}, Lorg/bouncycastle/asn1/DERSequenceParser;-><init>(Lorg/bouncycastle/asn1/ASN1StreamParser;)V

    goto/16 :goto_0

    .line 134
    :sswitch_6
    new-instance v7, Lorg/bouncycastle/asn1/DERSetParser;

    new-instance v8, Lorg/bouncycastle/asn1/ASN1StreamParser;

    invoke-direct {v8, v0}, Lorg/bouncycastle/asn1/ASN1StreamParser;-><init>(Ljava/io/InputStream;)V

    invoke-direct {v7, v8}, Lorg/bouncycastle/asn1/DERSetParser;-><init>(Lorg/bouncycastle/asn1/ASN1StreamParser;)V

    goto/16 :goto_0

    .line 136
    :sswitch_7
    new-instance v7, Lorg/bouncycastle/asn1/DERExternalParser;

    new-instance v8, Lorg/bouncycastle/asn1/ASN1StreamParser;

    invoke-direct {v8, v0}, Lorg/bouncycastle/asn1/ASN1StreamParser;-><init>(Ljava/io/InputStream;)V

    invoke-direct {v7, v8}, Lorg/bouncycastle/asn1/DERExternalParser;-><init>(Lorg/bouncycastle/asn1/ASN1StreamParser;)V

    goto/16 :goto_0

    .line 144
    :cond_8
    packed-switch v6, :pswitch_data_0

    .line 150
    invoke-virtual {v0}, Lorg/bouncycastle/asn1/DefiniteLengthInputStream;->toByteArray()[B

    move-result-object v7

    invoke-static {v6, v7}, Lorg/bouncycastle/asn1/ASN1InputStream;->createPrimitiveDERObject(I[B)Lorg/bouncycastle/asn1/DERObject;

    move-result-object v7

    goto/16 :goto_0

    .line 147
    :pswitch_0
    new-instance v7, Lorg/bouncycastle/asn1/DEROctetStringParser;

    invoke-direct {v7, v0}, Lorg/bouncycastle/asn1/DEROctetStringParser;-><init>(Lorg/bouncycastle/asn1/DefiniteLengthInputStream;)V

    goto/16 :goto_0

    .line 92
    nop

    :sswitch_data_0
    .sparse-switch
        0x4 -> :sswitch_0
        0x8 -> :sswitch_3
        0x10 -> :sswitch_1
        0x11 -> :sswitch_2
    .end sparse-switch

    .line 124
    :sswitch_data_1
    .sparse-switch
        0x4 -> :sswitch_4
        0x8 -> :sswitch_7
        0x10 -> :sswitch_5
        0x11 -> :sswitch_6
    .end sparse-switch

    .line 144
    :pswitch_data_0
    .packed-switch 0x4
        :pswitch_0
    .end packed-switch
.end method

.method readVector()Lorg/bouncycastle/asn1/ASN1EncodableVector;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 164
    new-instance v1, Lorg/bouncycastle/asn1/ASN1EncodableVector;

    invoke-direct {v1}, Lorg/bouncycastle/asn1/ASN1EncodableVector;-><init>()V

    .line 167
    .local v1, "v":Lorg/bouncycastle/asn1/ASN1EncodableVector;
    :goto_0
    invoke-virtual {p0}, Lorg/bouncycastle/asn1/ASN1StreamParser;->readObject()Lorg/bouncycastle/asn1/DEREncodable;

    move-result-object v0

    .local v0, "obj":Lorg/bouncycastle/asn1/DEREncodable;
    if-eqz v0, :cond_0

    .line 169
    invoke-interface {v0}, Lorg/bouncycastle/asn1/DEREncodable;->getDERObject()Lorg/bouncycastle/asn1/DERObject;

    move-result-object v2

    invoke-virtual {v1, v2}, Lorg/bouncycastle/asn1/ASN1EncodableVector;->add(Lorg/bouncycastle/asn1/DEREncodable;)V

    goto :goto_0

    .line 172
    :cond_0
    return-object v1
.end method
