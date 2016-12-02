.class public Lorg/bouncycastle/asn1/DERInputStream;
.super Ljava/io/FilterInputStream;
.source "DERInputStream.java"

# interfaces
.implements Lorg/bouncycastle/asn1/DERTags;


# direct methods
.method public constructor <init>(Ljava/io/InputStream;)V
    .locals 0
    .param p1, "is"    # Ljava/io/InputStream;

    .prologue
    .line 24
    invoke-direct {p0, p1}, Ljava/io/FilterInputStream;-><init>(Ljava/io/InputStream;)V

    .line 25
    return-void
.end method


# virtual methods
.method protected buildObject(I[B)Lorg/bouncycastle/asn1/DERObject;
    .locals 12
    .param p1, "tag"    # I
    .param p2, "bytes"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v11, 0x0

    .line 105
    sparse-switch p1, :sswitch_data_0

    .line 187
    and-int/lit16 v9, p1, 0x80

    if-eqz v9, :cond_5

    .line 189
    and-int/lit8 v9, p1, 0x1f

    const/16 v10, 0x1f

    if-ne v9, v10, :cond_0

    .line 191
    new-instance v9, Ljava/io/IOException;

    const-string v10, "unsupported high tag encountered"

    invoke-direct {v9, v10}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v9

    .line 108
    :sswitch_0
    const/4 v7, 0x0

    .line 252
    :goto_0
    return-object v7

    .line 110
    :sswitch_1
    new-instance v0, Ljava/io/ByteArrayInputStream;

    invoke-direct {v0, p2}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    .line 111
    .local v0, "bIn":Ljava/io/ByteArrayInputStream;
    new-instance v1, Lorg/bouncycastle/asn1/BERInputStream;

    invoke-direct {v1, v0}, Lorg/bouncycastle/asn1/BERInputStream;-><init>(Ljava/io/InputStream;)V

    .line 112
    .local v1, "dIn":Lorg/bouncycastle/asn1/BERInputStream;
    new-instance v7, Lorg/bouncycastle/asn1/DERConstructedSequence;

    invoke-direct {v7}, Lorg/bouncycastle/asn1/DERConstructedSequence;-><init>()V

    .line 118
    .local v7, "seq":Lorg/bouncycastle/asn1/DERConstructedSequence;
    :goto_1
    :try_start_0
    invoke-virtual {v1}, Lorg/bouncycastle/asn1/BERInputStream;->readObject()Lorg/bouncycastle/asn1/DERObject;

    move-result-object v5

    .line 120
    .local v5, "obj":Lorg/bouncycastle/asn1/DERObject;
    invoke-virtual {v7, v5}, Lorg/bouncycastle/asn1/DERConstructedSequence;->addObject(Lorg/bouncycastle/asn1/DEREncodable;)V
    :try_end_0
    .catch Ljava/io/EOFException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 123
    .end local v5    # "obj":Lorg/bouncycastle/asn1/DERObject;
    :catch_0
    move-exception v4

    .line 125
    .local v4, "ex":Ljava/io/EOFException;
    goto :goto_0

    .line 128
    .end local v0    # "bIn":Ljava/io/ByteArrayInputStream;
    .end local v1    # "dIn":Lorg/bouncycastle/asn1/BERInputStream;
    .end local v4    # "ex":Ljava/io/EOFException;
    .end local v7    # "seq":Lorg/bouncycastle/asn1/DERConstructedSequence;
    :sswitch_2
    new-instance v0, Ljava/io/ByteArrayInputStream;

    invoke-direct {v0, p2}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    .line 129
    .restart local v0    # "bIn":Ljava/io/ByteArrayInputStream;
    new-instance v1, Lorg/bouncycastle/asn1/BERInputStream;

    invoke-direct {v1, v0}, Lorg/bouncycastle/asn1/BERInputStream;-><init>(Ljava/io/InputStream;)V

    .line 131
    .restart local v1    # "dIn":Lorg/bouncycastle/asn1/BERInputStream;
    new-instance v8, Lorg/bouncycastle/asn1/ASN1EncodableVector;

    invoke-direct {v8}, Lorg/bouncycastle/asn1/ASN1EncodableVector;-><init>()V

    .line 137
    .local v8, "v":Lorg/bouncycastle/asn1/ASN1EncodableVector;
    :goto_2
    :try_start_1
    invoke-virtual {v1}, Lorg/bouncycastle/asn1/BERInputStream;->readObject()Lorg/bouncycastle/asn1/DERObject;

    move-result-object v5

    .line 139
    .restart local v5    # "obj":Lorg/bouncycastle/asn1/DERObject;
    invoke-virtual {v8, v5}, Lorg/bouncycastle/asn1/ASN1EncodableVector;->add(Lorg/bouncycastle/asn1/DEREncodable;)V
    :try_end_1
    .catch Ljava/io/EOFException; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_2

    .line 142
    .end local v5    # "obj":Lorg/bouncycastle/asn1/DERObject;
    :catch_1
    move-exception v4

    .line 144
    .restart local v4    # "ex":Ljava/io/EOFException;
    new-instance v7, Lorg/bouncycastle/asn1/DERConstructedSet;

    invoke-direct {v7, v8}, Lorg/bouncycastle/asn1/DERConstructedSet;-><init>(Lorg/bouncycastle/asn1/DEREncodableVector;)V

    goto :goto_0

    .line 147
    .end local v0    # "bIn":Ljava/io/ByteArrayInputStream;
    .end local v1    # "dIn":Lorg/bouncycastle/asn1/BERInputStream;
    .end local v4    # "ex":Ljava/io/EOFException;
    .end local v8    # "v":Lorg/bouncycastle/asn1/ASN1EncodableVector;
    :sswitch_3
    new-instance v7, Lorg/bouncycastle/asn1/DERBoolean;

    invoke-direct {v7, p2}, Lorg/bouncycastle/asn1/DERBoolean;-><init>([B)V

    goto :goto_0

    .line 149
    :sswitch_4
    new-instance v7, Lorg/bouncycastle/asn1/DERInteger;

    invoke-direct {v7, p2}, Lorg/bouncycastle/asn1/DERInteger;-><init>([B)V

    goto :goto_0

    .line 151
    :sswitch_5
    new-instance v7, Lorg/bouncycastle/asn1/DEREnumerated;

    invoke-direct {v7, p2}, Lorg/bouncycastle/asn1/DEREnumerated;-><init>([B)V

    goto :goto_0

    .line 153
    :sswitch_6
    new-instance v7, Lorg/bouncycastle/asn1/DERObjectIdentifier;

    invoke-direct {v7, p2}, Lorg/bouncycastle/asn1/DERObjectIdentifier;-><init>([B)V

    goto :goto_0

    .line 155
    :sswitch_7
    aget-byte v6, p2, v11

    .line 156
    .local v6, "padBits":I
    array-length v9, p2

    add-int/lit8 v9, v9, -0x1

    new-array v3, v9, [B

    .line 158
    .local v3, "data":[B
    const/4 v9, 0x1

    array-length v10, p2

    add-int/lit8 v10, v10, -0x1

    invoke-static {p2, v9, v3, v11, v10}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 160
    new-instance v7, Lorg/bouncycastle/asn1/DERBitString;

    invoke-direct {v7, v3, v6}, Lorg/bouncycastle/asn1/DERBitString;-><init>([BI)V

    goto :goto_0

    .line 162
    .end local v3    # "data":[B
    .end local v6    # "padBits":I
    :sswitch_8
    new-instance v7, Lorg/bouncycastle/asn1/DERUTF8String;

    invoke-direct {v7, p2}, Lorg/bouncycastle/asn1/DERUTF8String;-><init>([B)V

    goto :goto_0

    .line 164
    :sswitch_9
    new-instance v7, Lorg/bouncycastle/asn1/DERPrintableString;

    invoke-direct {v7, p2}, Lorg/bouncycastle/asn1/DERPrintableString;-><init>([B)V

    goto :goto_0

    .line 166
    :sswitch_a
    new-instance v7, Lorg/bouncycastle/asn1/DERIA5String;

    invoke-direct {v7, p2}, Lorg/bouncycastle/asn1/DERIA5String;-><init>([B)V

    goto :goto_0

    .line 168
    :sswitch_b
    new-instance v7, Lorg/bouncycastle/asn1/DERT61String;

    invoke-direct {v7, p2}, Lorg/bouncycastle/asn1/DERT61String;-><init>([B)V

    goto :goto_0

    .line 170
    :sswitch_c
    new-instance v7, Lorg/bouncycastle/asn1/DERVisibleString;

    invoke-direct {v7, p2}, Lorg/bouncycastle/asn1/DERVisibleString;-><init>([B)V

    goto/16 :goto_0

    .line 172
    :sswitch_d
    new-instance v7, Lorg/bouncycastle/asn1/DERUniversalString;

    invoke-direct {v7, p2}, Lorg/bouncycastle/asn1/DERUniversalString;-><init>([B)V

    goto/16 :goto_0

    .line 174
    :sswitch_e
    new-instance v7, Lorg/bouncycastle/asn1/DERGeneralString;

    invoke-direct {v7, p2}, Lorg/bouncycastle/asn1/DERGeneralString;-><init>([B)V

    goto/16 :goto_0

    .line 176
    :sswitch_f
    new-instance v7, Lorg/bouncycastle/asn1/DERBMPString;

    invoke-direct {v7, p2}, Lorg/bouncycastle/asn1/DERBMPString;-><init>([B)V

    goto/16 :goto_0

    .line 178
    :sswitch_10
    new-instance v7, Lorg/bouncycastle/asn1/DEROctetString;

    invoke-direct {v7, p2}, Lorg/bouncycastle/asn1/DEROctetString;-><init>([B)V

    goto/16 :goto_0

    .line 180
    :sswitch_11
    new-instance v7, Lorg/bouncycastle/asn1/DERUTCTime;

    invoke-direct {v7, p2}, Lorg/bouncycastle/asn1/DERUTCTime;-><init>([B)V

    goto/16 :goto_0

    .line 182
    :sswitch_12
    new-instance v7, Lorg/bouncycastle/asn1/DERGeneralizedTime;

    invoke-direct {v7, p2}, Lorg/bouncycastle/asn1/DERGeneralizedTime;-><init>([B)V

    goto/16 :goto_0

    .line 194
    :cond_0
    array-length v9, p2

    if-nez v9, :cond_2

    .line 196
    and-int/lit8 v9, p1, 0x20

    if-nez v9, :cond_1

    .line 198
    new-instance v7, Lorg/bouncycastle/asn1/DERTaggedObject;

    and-int/lit8 v9, p1, 0x1f

    new-instance v10, Lorg/bouncycastle/asn1/DERNull;

    invoke-direct {v10}, Lorg/bouncycastle/asn1/DERNull;-><init>()V

    invoke-direct {v7, v11, v9, v10}, Lorg/bouncycastle/asn1/DERTaggedObject;-><init>(ZILorg/bouncycastle/asn1/DEREncodable;)V

    goto/16 :goto_0

    .line 202
    :cond_1
    new-instance v7, Lorg/bouncycastle/asn1/DERTaggedObject;

    and-int/lit8 v9, p1, 0x1f

    new-instance v10, Lorg/bouncycastle/asn1/DERConstructedSequence;

    invoke-direct {v10}, Lorg/bouncycastle/asn1/DERConstructedSequence;-><init>()V

    invoke-direct {v7, v11, v9, v10}, Lorg/bouncycastle/asn1/DERTaggedObject;-><init>(ZILorg/bouncycastle/asn1/DEREncodable;)V

    goto/16 :goto_0

    .line 209
    :cond_2
    and-int/lit8 v9, p1, 0x20

    if-nez v9, :cond_3

    .line 211
    new-instance v7, Lorg/bouncycastle/asn1/DERTaggedObject;

    and-int/lit8 v9, p1, 0x1f

    new-instance v10, Lorg/bouncycastle/asn1/DEROctetString;

    invoke-direct {v10, p2}, Lorg/bouncycastle/asn1/DEROctetString;-><init>([B)V

    invoke-direct {v7, v11, v9, v10}, Lorg/bouncycastle/asn1/DERTaggedObject;-><init>(ZILorg/bouncycastle/asn1/DEREncodable;)V

    goto/16 :goto_0

    .line 214
    :cond_3
    new-instance v0, Ljava/io/ByteArrayInputStream;

    invoke-direct {v0, p2}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    .line 215
    .restart local v0    # "bIn":Ljava/io/ByteArrayInputStream;
    new-instance v1, Lorg/bouncycastle/asn1/BERInputStream;

    invoke-direct {v1, v0}, Lorg/bouncycastle/asn1/BERInputStream;-><init>(Ljava/io/InputStream;)V

    .line 217
    .restart local v1    # "dIn":Lorg/bouncycastle/asn1/BERInputStream;
    invoke-virtual {v1}, Lorg/bouncycastle/asn1/BERInputStream;->readObject()Lorg/bouncycastle/asn1/DERObject;

    move-result-object v2

    .line 223
    .local v2, "dObj":Lorg/bouncycastle/asn1/DEREncodable;
    invoke-virtual {v1}, Lorg/bouncycastle/asn1/BERInputStream;->available()I

    move-result v9

    if-nez v9, :cond_4

    .line 225
    new-instance v7, Lorg/bouncycastle/asn1/DERTaggedObject;

    and-int/lit8 v9, p1, 0x1f

    invoke-direct {v7, v9, v2}, Lorg/bouncycastle/asn1/DERTaggedObject;-><init>(ILorg/bouncycastle/asn1/DEREncodable;)V

    goto/16 :goto_0

    .line 231
    :cond_4
    new-instance v7, Lorg/bouncycastle/asn1/DERConstructedSequence;

    invoke-direct {v7}, Lorg/bouncycastle/asn1/DERConstructedSequence;-><init>()V

    .line 233
    .restart local v7    # "seq":Lorg/bouncycastle/asn1/DERConstructedSequence;
    invoke-virtual {v7, v2}, Lorg/bouncycastle/asn1/DERConstructedSequence;->addObject(Lorg/bouncycastle/asn1/DEREncodable;)V

    .line 239
    :goto_3
    :try_start_2
    invoke-virtual {v1}, Lorg/bouncycastle/asn1/BERInputStream;->readObject()Lorg/bouncycastle/asn1/DERObject;

    move-result-object v2

    .line 241
    invoke-virtual {v7, v2}, Lorg/bouncycastle/asn1/DERConstructedSequence;->addObject(Lorg/bouncycastle/asn1/DEREncodable;)V
    :try_end_2
    .catch Ljava/io/EOFException; {:try_start_2 .. :try_end_2} :catch_2

    goto :goto_3

    .line 244
    :catch_2
    move-exception v9

    .line 249
    new-instance v9, Lorg/bouncycastle/asn1/DERTaggedObject;

    and-int/lit8 v10, p1, 0x1f

    invoke-direct {v9, v11, v10, v7}, Lorg/bouncycastle/asn1/DERTaggedObject;-><init>(ZILorg/bouncycastle/asn1/DEREncodable;)V

    move-object v7, v9

    goto/16 :goto_0

    .line 252
    .end local v0    # "bIn":Ljava/io/ByteArrayInputStream;
    .end local v1    # "dIn":Lorg/bouncycastle/asn1/BERInputStream;
    .end local v2    # "dObj":Lorg/bouncycastle/asn1/DEREncodable;
    .end local v7    # "seq":Lorg/bouncycastle/asn1/DERConstructedSequence;
    :cond_5
    new-instance v7, Lorg/bouncycastle/asn1/DERUnknownTag;

    invoke-direct {v7, p1, p2}, Lorg/bouncycastle/asn1/DERUnknownTag;-><init>(I[B)V

    goto/16 :goto_0

    .line 105
    :sswitch_data_0
    .sparse-switch
        0x1 -> :sswitch_3
        0x2 -> :sswitch_4
        0x3 -> :sswitch_7
        0x4 -> :sswitch_10
        0x5 -> :sswitch_0
        0x6 -> :sswitch_6
        0xa -> :sswitch_5
        0xc -> :sswitch_8
        0x13 -> :sswitch_9
        0x14 -> :sswitch_b
        0x16 -> :sswitch_a
        0x17 -> :sswitch_11
        0x18 -> :sswitch_12
        0x1a -> :sswitch_c
        0x1b -> :sswitch_e
        0x1c -> :sswitch_d
        0x1e -> :sswitch_f
        0x30 -> :sswitch_1
        0x31 -> :sswitch_2
    .end sparse-switch
.end method

.method protected readFully([B)V
    .locals 4
    .param p1, "bytes"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 76
    array-length v1, p1

    .line 78
    .local v1, "left":I
    if-nez v1, :cond_2

    .line 94
    :cond_0
    return-void

    .line 92
    .local v0, "l":I
    :cond_1
    sub-int/2addr v1, v0

    .line 83
    .end local v0    # "l":I
    :cond_2
    if-lez v1, :cond_0

    .line 85
    array-length v2, p1

    sub-int/2addr v2, v1

    invoke-virtual {p0, p1, v2, v1}, Lorg/bouncycastle/asn1/DERInputStream;->read([BII)I

    move-result v0

    .line 87
    .restart local v0    # "l":I
    if-gez v0, :cond_1

    .line 89
    new-instance v2, Ljava/io/EOFException;

    const-string v3, "unexpected end of stream"

    invoke-direct {v2, v3}, Ljava/io/EOFException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method protected readLength()I
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 30
    invoke-virtual {p0}, Lorg/bouncycastle/asn1/DERInputStream;->read()I

    move-result v1

    .line 31
    .local v1, "length":I
    if-gez v1, :cond_0

    .line 33
    new-instance v4, Ljava/io/IOException;

    const-string v5, "EOF found when length expected"

    invoke-direct {v4, v5}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 36
    :cond_0
    const/16 v4, 0x80

    if-ne v1, v4, :cond_1

    .line 38
    const/4 v4, -0x1

    .line 69
    :goto_0
    return v4

    .line 41
    :cond_1
    const/16 v4, 0x7f

    if-le v1, v4, :cond_5

    .line 43
    and-int/lit8 v3, v1, 0x7f

    .line 45
    .local v3, "size":I
    const/4 v4, 0x4

    if-le v3, v4, :cond_2

    .line 47
    new-instance v4, Ljava/io/IOException;

    const-string v5, "DER length more than 4 bytes"

    invoke-direct {v4, v5}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 50
    :cond_2
    const/4 v1, 0x0

    .line 51
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    if-ge v0, v3, :cond_4

    .line 53
    invoke-virtual {p0}, Lorg/bouncycastle/asn1/DERInputStream;->read()I

    move-result v2

    .line 55
    .local v2, "next":I
    if-gez v2, :cond_3

    .line 57
    new-instance v4, Ljava/io/IOException;

    const-string v5, "EOF found reading length"

    invoke-direct {v4, v5}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 60
    :cond_3
    shl-int/lit8 v4, v1, 0x8

    add-int v1, v4, v2

    .line 51
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 63
    .end local v2    # "next":I
    :cond_4
    if-gez v1, :cond_5

    .line 65
    new-instance v4, Ljava/io/IOException;

    const-string v5, "corrupted stream - negative length found"

    invoke-direct {v4, v5}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v4

    .end local v0    # "i":I
    .end local v3    # "size":I
    :cond_5
    move v4, v1

    .line 69
    goto :goto_0
.end method

.method public readObject()Lorg/bouncycastle/asn1/DERObject;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 259
    invoke-virtual {p0}, Lorg/bouncycastle/asn1/DERInputStream;->read()I

    move-result v2

    .line 260
    .local v2, "tag":I
    const/4 v3, -0x1

    if-ne v2, v3, :cond_0

    .line 262
    new-instance v3, Ljava/io/EOFException;

    invoke-direct {v3}, Ljava/io/EOFException;-><init>()V

    throw v3

    .line 265
    :cond_0
    invoke-virtual {p0}, Lorg/bouncycastle/asn1/DERInputStream;->readLength()I

    move-result v1

    .line 266
    .local v1, "length":I
    new-array v0, v1, [B

    .line 268
    .local v0, "bytes":[B
    invoke-virtual {p0, v0}, Lorg/bouncycastle/asn1/DERInputStream;->readFully([B)V

    .line 270
    invoke-virtual {p0, v2, v0}, Lorg/bouncycastle/asn1/DERInputStream;->buildObject(I[B)Lorg/bouncycastle/asn1/DERObject;

    move-result-object v3

    return-object v3
.end method
