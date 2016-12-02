.class public Lorg/bouncycastle/asn1/BERInputStream;
.super Lorg/bouncycastle/asn1/DERInputStream;
.source "BERInputStream.java"


# static fields
.field private static final END_OF_STREAM:Lorg/bouncycastle/asn1/DERObject;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 16
    new-instance v0, Lorg/bouncycastle/asn1/BERInputStream$1;

    invoke-direct {v0}, Lorg/bouncycastle/asn1/BERInputStream$1;-><init>()V

    sput-object v0, Lorg/bouncycastle/asn1/BERInputStream;->END_OF_STREAM:Lorg/bouncycastle/asn1/DERObject;

    return-void
.end method

.method public constructor <init>(Ljava/io/InputStream;)V
    .locals 0
    .param p1, "is"    # Ljava/io/InputStream;

    .prologue
    .line 37
    invoke-direct {p0, p1}, Lorg/bouncycastle/asn1/DERInputStream;-><init>(Ljava/io/InputStream;)V

    .line 38
    return-void
.end method

.method private buildConstructedOctetString()Lorg/bouncycastle/asn1/BERConstructedOctetString;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 68
    new-instance v1, Ljava/util/Vector;

    invoke-direct {v1}, Ljava/util/Vector;-><init>()V

    .line 72
    .local v1, "octs":Ljava/util/Vector;
    :goto_0
    invoke-virtual {p0}, Lorg/bouncycastle/asn1/BERInputStream;->readObject()Lorg/bouncycastle/asn1/DERObject;

    move-result-object v0

    .line 74
    .local v0, "o":Lorg/bouncycastle/asn1/DERObject;
    sget-object v2, Lorg/bouncycastle/asn1/BERInputStream;->END_OF_STREAM:Lorg/bouncycastle/asn1/DERObject;

    if-ne v0, v2, :cond_0

    .line 82
    new-instance v2, Lorg/bouncycastle/asn1/BERConstructedOctetString;

    invoke-direct {v2, v1}, Lorg/bouncycastle/asn1/BERConstructedOctetString;-><init>(Ljava/util/Vector;)V

    return-object v2

    .line 79
    :cond_0
    invoke-virtual {v1, v0}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    goto :goto_0
.end method

.method private readIndefiniteLengthFully()[B
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 46
    new-instance v2, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v2}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 49
    .local v2, "bOut":Ljava/io/ByteArrayOutputStream;
    invoke-virtual {p0}, Lorg/bouncycastle/asn1/BERInputStream;->read()I

    move-result v1

    .line 51
    .local v1, "b1":I
    :goto_0
    invoke-virtual {p0}, Lorg/bouncycastle/asn1/BERInputStream;->read()I

    move-result v0

    .local v0, "b":I
    if-ltz v0, :cond_0

    .line 53
    if-nez v1, :cond_1

    if-nez v0, :cond_1

    .line 62
    :cond_0
    invoke-virtual {v2}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v3

    return-object v3

    .line 58
    :cond_1
    invoke-virtual {v2, v1}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 59
    move v1, v0

    goto :goto_0
.end method


# virtual methods
.method public readObject()Lorg/bouncycastle/asn1/DERObject;
    .locals 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v10, 0x0

    .line 88
    invoke-virtual {p0}, Lorg/bouncycastle/asn1/BERInputStream;->read()I

    move-result v6

    .line 89
    .local v6, "tag":I
    const/4 v8, -0x1

    if-ne v6, v8, :cond_0

    .line 91
    new-instance v8, Ljava/io/EOFException;

    invoke-direct {v8}, Ljava/io/EOFException;-><init>()V

    throw v8

    .line 94
    :cond_0
    invoke-virtual {p0}, Lorg/bouncycastle/asn1/BERInputStream;->readLength()I

    move-result v2

    .line 96
    .local v2, "length":I
    if-gez v2, :cond_9

    .line 98
    sparse-switch v6, :sswitch_data_0

    .line 138
    and-int/lit16 v8, v6, 0x80

    if-eqz v8, :cond_8

    .line 140
    and-int/lit8 v8, v6, 0x1f

    const/16 v9, 0x1f

    if-ne v8, v9, :cond_3

    .line 142
    new-instance v8, Ljava/io/IOException;

    const-string v9, "unsupported high tag encountered"

    invoke-direct {v8, v9}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v8

    .line 101
    :sswitch_0
    const/4 v5, 0x0

    .line 207
    :cond_1
    :goto_0
    return-object v5

    .line 103
    :sswitch_1
    new-instance v5, Lorg/bouncycastle/asn1/BERConstructedSequence;

    invoke-direct {v5}, Lorg/bouncycastle/asn1/BERConstructedSequence;-><init>()V

    .line 107
    .local v5, "seq":Lorg/bouncycastle/asn1/BERConstructedSequence;
    :goto_1
    invoke-virtual {p0}, Lorg/bouncycastle/asn1/BERInputStream;->readObject()Lorg/bouncycastle/asn1/DERObject;

    move-result-object v4

    .line 109
    .local v4, "obj":Lorg/bouncycastle/asn1/DERObject;
    sget-object v8, Lorg/bouncycastle/asn1/BERInputStream;->END_OF_STREAM:Lorg/bouncycastle/asn1/DERObject;

    if-eq v4, v8, :cond_1

    .line 114
    invoke-virtual {v5, v4}, Lorg/bouncycastle/asn1/BERConstructedSequence;->addObject(Lorg/bouncycastle/asn1/DEREncodable;)V

    goto :goto_1

    .line 118
    .end local v4    # "obj":Lorg/bouncycastle/asn1/DERObject;
    .end local v5    # "seq":Lorg/bouncycastle/asn1/BERConstructedSequence;
    :sswitch_2
    invoke-direct {p0}, Lorg/bouncycastle/asn1/BERInputStream;->buildConstructedOctetString()Lorg/bouncycastle/asn1/BERConstructedOctetString;

    move-result-object v5

    goto :goto_0

    .line 120
    :sswitch_3
    new-instance v7, Lorg/bouncycastle/asn1/ASN1EncodableVector;

    invoke-direct {v7}, Lorg/bouncycastle/asn1/ASN1EncodableVector;-><init>()V

    .line 124
    .local v7, "v":Lorg/bouncycastle/asn1/ASN1EncodableVector;
    :goto_2
    invoke-virtual {p0}, Lorg/bouncycastle/asn1/BERInputStream;->readObject()Lorg/bouncycastle/asn1/DERObject;

    move-result-object v4

    .line 126
    .restart local v4    # "obj":Lorg/bouncycastle/asn1/DERObject;
    sget-object v8, Lorg/bouncycastle/asn1/BERInputStream;->END_OF_STREAM:Lorg/bouncycastle/asn1/DERObject;

    if-ne v4, v8, :cond_2

    .line 133
    new-instance v5, Lorg/bouncycastle/asn1/BERSet;

    invoke-direct {v5, v7}, Lorg/bouncycastle/asn1/BERSet;-><init>(Lorg/bouncycastle/asn1/DEREncodableVector;)V

    goto :goto_0

    .line 131
    :cond_2
    invoke-virtual {v7, v4}, Lorg/bouncycastle/asn1/ASN1EncodableVector;->add(Lorg/bouncycastle/asn1/DEREncodable;)V

    goto :goto_2

    .line 148
    .end local v4    # "obj":Lorg/bouncycastle/asn1/DERObject;
    .end local v7    # "v":Lorg/bouncycastle/asn1/ASN1EncodableVector;
    :cond_3
    and-int/lit8 v8, v6, 0x20

    if-nez v8, :cond_4

    .line 150
    invoke-direct {p0}, Lorg/bouncycastle/asn1/BERInputStream;->readIndefiniteLengthFully()[B

    move-result-object v0

    .line 152
    .local v0, "bytes":[B
    new-instance v5, Lorg/bouncycastle/asn1/BERTaggedObject;

    and-int/lit8 v8, v6, 0x1f

    new-instance v9, Lorg/bouncycastle/asn1/DEROctetString;

    invoke-direct {v9, v0}, Lorg/bouncycastle/asn1/DEROctetString;-><init>([B)V

    invoke-direct {v5, v10, v8, v9}, Lorg/bouncycastle/asn1/BERTaggedObject;-><init>(ZILorg/bouncycastle/asn1/DEREncodable;)V

    goto :goto_0

    .line 158
    .end local v0    # "bytes":[B
    :cond_4
    invoke-virtual {p0}, Lorg/bouncycastle/asn1/BERInputStream;->readObject()Lorg/bouncycastle/asn1/DERObject;

    move-result-object v1

    .line 160
    .local v1, "dObj":Lorg/bouncycastle/asn1/DERObject;
    sget-object v8, Lorg/bouncycastle/asn1/BERInputStream;->END_OF_STREAM:Lorg/bouncycastle/asn1/DERObject;

    if-ne v1, v8, :cond_5

    .line 162
    new-instance v5, Lorg/bouncycastle/asn1/DERTaggedObject;

    and-int/lit8 v8, v6, 0x1f

    invoke-direct {v5, v8}, Lorg/bouncycastle/asn1/DERTaggedObject;-><init>(I)V

    goto :goto_0

    .line 165
    :cond_5
    invoke-virtual {p0}, Lorg/bouncycastle/asn1/BERInputStream;->readObject()Lorg/bouncycastle/asn1/DERObject;

    move-result-object v3

    .line 171
    .local v3, "next":Lorg/bouncycastle/asn1/DERObject;
    sget-object v8, Lorg/bouncycastle/asn1/BERInputStream;->END_OF_STREAM:Lorg/bouncycastle/asn1/DERObject;

    if-ne v3, v8, :cond_6

    .line 173
    new-instance v5, Lorg/bouncycastle/asn1/BERTaggedObject;

    and-int/lit8 v8, v6, 0x1f

    invoke-direct {v5, v8, v1}, Lorg/bouncycastle/asn1/BERTaggedObject;-><init>(ILorg/bouncycastle/asn1/DEREncodable;)V

    goto :goto_0

    .line 179
    :cond_6
    new-instance v5, Lorg/bouncycastle/asn1/BERConstructedSequence;

    invoke-direct {v5}, Lorg/bouncycastle/asn1/BERConstructedSequence;-><init>()V

    .line 181
    .restart local v5    # "seq":Lorg/bouncycastle/asn1/BERConstructedSequence;
    invoke-virtual {v5, v1}, Lorg/bouncycastle/asn1/BERConstructedSequence;->addObject(Lorg/bouncycastle/asn1/DEREncodable;)V

    .line 185
    :cond_7
    invoke-virtual {v5, v3}, Lorg/bouncycastle/asn1/BERConstructedSequence;->addObject(Lorg/bouncycastle/asn1/DEREncodable;)V

    .line 186
    invoke-virtual {p0}, Lorg/bouncycastle/asn1/BERInputStream;->readObject()Lorg/bouncycastle/asn1/DERObject;

    move-result-object v3

    .line 188
    sget-object v8, Lorg/bouncycastle/asn1/BERInputStream;->END_OF_STREAM:Lorg/bouncycastle/asn1/DERObject;

    if-ne v3, v8, :cond_7

    .line 190
    new-instance v8, Lorg/bouncycastle/asn1/BERTaggedObject;

    and-int/lit8 v9, v6, 0x1f

    invoke-direct {v8, v10, v9, v5}, Lorg/bouncycastle/asn1/BERTaggedObject;-><init>(ZILorg/bouncycastle/asn1/DEREncodable;)V

    move-object v5, v8

    goto :goto_0

    .line 193
    .end local v1    # "dObj":Lorg/bouncycastle/asn1/DERObject;
    .end local v3    # "next":Lorg/bouncycastle/asn1/DERObject;
    .end local v5    # "seq":Lorg/bouncycastle/asn1/BERConstructedSequence;
    :cond_8
    new-instance v8, Ljava/io/IOException;

    const-string v9, "unknown BER object encountered"

    invoke-direct {v8, v9}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v8

    .line 198
    :cond_9
    if-nez v6, :cond_a

    if-nez v2, :cond_a

    .line 200
    sget-object v5, Lorg/bouncycastle/asn1/BERInputStream;->END_OF_STREAM:Lorg/bouncycastle/asn1/DERObject;

    goto/16 :goto_0

    .line 203
    :cond_a
    new-array v0, v2, [B

    .line 205
    .restart local v0    # "bytes":[B
    invoke-virtual {p0, v0}, Lorg/bouncycastle/asn1/BERInputStream;->readFully([B)V

    .line 207
    invoke-virtual {p0, v6, v0}, Lorg/bouncycastle/asn1/BERInputStream;->buildObject(I[B)Lorg/bouncycastle/asn1/DERObject;

    move-result-object v5

    goto/16 :goto_0

    .line 98
    :sswitch_data_0
    .sparse-switch
        0x5 -> :sswitch_0
        0x24 -> :sswitch_2
        0x30 -> :sswitch_1
        0x31 -> :sswitch_3
    .end sparse-switch
.end method
