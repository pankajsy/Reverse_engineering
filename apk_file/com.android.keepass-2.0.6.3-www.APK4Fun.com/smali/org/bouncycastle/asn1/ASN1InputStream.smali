.class public Lorg/bouncycastle/asn1/ASN1InputStream;
.super Ljava/io/FilterInputStream;
.source "ASN1InputStream.java"

# interfaces
.implements Lorg/bouncycastle/asn1/DERTags;


# static fields
.field static final synthetic $assertionsDisabled:Z


# instance fields
.field private final lazyEvaluate:Z

.field private final limit:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 17
    const-class v0, Lorg/bouncycastle/asn1/ASN1InputStream;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    sput-boolean v0, Lorg/bouncycastle/asn1/ASN1InputStream;->$assertionsDisabled:Z

    return-void

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public constructor <init>(Ljava/io/InputStream;)V
    .locals 1
    .param p1, "is"    # Ljava/io/InputStream;

    .prologue
    .line 27
    const v0, 0x7fffffff

    invoke-direct {p0, p1, v0}, Lorg/bouncycastle/asn1/ASN1InputStream;-><init>(Ljava/io/InputStream;I)V

    .line 28
    return-void
.end method

.method public constructor <init>(Ljava/io/InputStream;I)V
    .locals 1
    .param p1, "input"    # Ljava/io/InputStream;
    .param p2, "limit"    # I

    .prologue
    .line 66
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lorg/bouncycastle/asn1/ASN1InputStream;-><init>(Ljava/io/InputStream;IZ)V

    .line 67
    return-void
.end method

.method public constructor <init>(Ljava/io/InputStream;IZ)V
    .locals 0
    .param p1, "input"    # Ljava/io/InputStream;
    .param p2, "limit"    # I
    .param p3, "lazyEvaluate"    # Z

    .prologue
    .line 82
    invoke-direct {p0, p1}, Ljava/io/FilterInputStream;-><init>(Ljava/io/InputStream;)V

    .line 83
    iput p2, p0, Lorg/bouncycastle/asn1/ASN1InputStream;->limit:I

    .line 84
    iput-boolean p3, p0, Lorg/bouncycastle/asn1/ASN1InputStream;->lazyEvaluate:Z

    .line 85
    return-void
.end method

.method public constructor <init>([B)V
    .locals 2
    .param p1, "input"    # [B

    .prologue
    .line 39
    new-instance v0, Ljava/io/ByteArrayInputStream;

    invoke-direct {v0, p1}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    array-length v1, p1

    invoke-direct {p0, v0, v1}, Lorg/bouncycastle/asn1/ASN1InputStream;-><init>(Ljava/io/InputStream;I)V

    .line 40
    return-void
.end method

.method public constructor <init>([BZ)V
    .locals 2
    .param p1, "input"    # [B
    .param p2, "lazyEvaluate"    # Z

    .prologue
    .line 53
    new-instance v0, Ljava/io/ByteArrayInputStream;

    invoke-direct {v0, p1}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    array-length v1, p1

    invoke-direct {p0, v0, v1, p2}, Lorg/bouncycastle/asn1/ASN1InputStream;-><init>(Ljava/io/InputStream;IZ)V

    .line 54
    return-void
.end method

.method static createPrimitiveDERObject(I[B)Lorg/bouncycastle/asn1/DERObject;
    .locals 5
    .param p0, "tagNo"    # I
    .param p1, "bytes"    # [B

    .prologue
    const/4 v4, 0x0

    .line 340
    packed-switch p0, :pswitch_data_0

    .line 384
    :pswitch_0
    new-instance v2, Lorg/bouncycastle/asn1/DERUnknownTag;

    invoke-direct {v2, v4, p0, p1}, Lorg/bouncycastle/asn1/DERUnknownTag;-><init>(ZI[B)V

    :goto_0
    return-object v2

    .line 344
    :pswitch_1
    aget-byte v1, p1, v4

    .line 345
    .local v1, "padBits":I
    array-length v2, p1

    add-int/lit8 v2, v2, -0x1

    new-array v0, v2, [B

    .line 346
    .local v0, "data":[B
    const/4 v2, 0x1

    array-length v3, p1

    add-int/lit8 v3, v3, -0x1

    invoke-static {p1, v2, v0, v4, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 347
    new-instance v2, Lorg/bouncycastle/asn1/DERBitString;

    invoke-direct {v2, v0, v1}, Lorg/bouncycastle/asn1/DERBitString;-><init>([BI)V

    goto :goto_0

    .line 350
    .end local v0    # "data":[B
    .end local v1    # "padBits":I
    :pswitch_2
    new-instance v2, Lorg/bouncycastle/asn1/DERBMPString;

    invoke-direct {v2, p1}, Lorg/bouncycastle/asn1/DERBMPString;-><init>([B)V

    goto :goto_0

    .line 352
    :pswitch_3
    new-instance v2, Lorg/bouncycastle/asn1/DERBoolean;

    invoke-direct {v2, p1}, Lorg/bouncycastle/asn1/DERBoolean;-><init>([B)V

    goto :goto_0

    .line 354
    :pswitch_4
    new-instance v2, Lorg/bouncycastle/asn1/DEREnumerated;

    invoke-direct {v2, p1}, Lorg/bouncycastle/asn1/DEREnumerated;-><init>([B)V

    goto :goto_0

    .line 356
    :pswitch_5
    new-instance v2, Lorg/bouncycastle/asn1/DERGeneralizedTime;

    invoke-direct {v2, p1}, Lorg/bouncycastle/asn1/DERGeneralizedTime;-><init>([B)V

    goto :goto_0

    .line 358
    :pswitch_6
    new-instance v2, Lorg/bouncycastle/asn1/DERGeneralString;

    invoke-direct {v2, p1}, Lorg/bouncycastle/asn1/DERGeneralString;-><init>([B)V

    goto :goto_0

    .line 360
    :pswitch_7
    new-instance v2, Lorg/bouncycastle/asn1/DERIA5String;

    invoke-direct {v2, p1}, Lorg/bouncycastle/asn1/DERIA5String;-><init>([B)V

    goto :goto_0

    .line 362
    :pswitch_8
    new-instance v2, Lorg/bouncycastle/asn1/DERInteger;

    invoke-direct {v2, p1}, Lorg/bouncycastle/asn1/DERInteger;-><init>([B)V

    goto :goto_0

    .line 364
    :pswitch_9
    sget-object v2, Lorg/bouncycastle/asn1/DERNull;->INSTANCE:Lorg/bouncycastle/asn1/DERNull;

    goto :goto_0

    .line 366
    :pswitch_a
    new-instance v2, Lorg/bouncycastle/asn1/DERNumericString;

    invoke-direct {v2, p1}, Lorg/bouncycastle/asn1/DERNumericString;-><init>([B)V

    goto :goto_0

    .line 368
    :pswitch_b
    new-instance v2, Lorg/bouncycastle/asn1/DERObjectIdentifier;

    invoke-direct {v2, p1}, Lorg/bouncycastle/asn1/DERObjectIdentifier;-><init>([B)V

    goto :goto_0

    .line 370
    :pswitch_c
    new-instance v2, Lorg/bouncycastle/asn1/DEROctetString;

    invoke-direct {v2, p1}, Lorg/bouncycastle/asn1/DEROctetString;-><init>([B)V

    goto :goto_0

    .line 372
    :pswitch_d
    new-instance v2, Lorg/bouncycastle/asn1/DERPrintableString;

    invoke-direct {v2, p1}, Lorg/bouncycastle/asn1/DERPrintableString;-><init>([B)V

    goto :goto_0

    .line 374
    :pswitch_e
    new-instance v2, Lorg/bouncycastle/asn1/DERT61String;

    invoke-direct {v2, p1}, Lorg/bouncycastle/asn1/DERT61String;-><init>([B)V

    goto :goto_0

    .line 376
    :pswitch_f
    new-instance v2, Lorg/bouncycastle/asn1/DERUniversalString;

    invoke-direct {v2, p1}, Lorg/bouncycastle/asn1/DERUniversalString;-><init>([B)V

    goto :goto_0

    .line 378
    :pswitch_10
    new-instance v2, Lorg/bouncycastle/asn1/DERUTCTime;

    invoke-direct {v2, p1}, Lorg/bouncycastle/asn1/DERUTCTime;-><init>([B)V

    goto :goto_0

    .line 380
    :pswitch_11
    new-instance v2, Lorg/bouncycastle/asn1/DERUTF8String;

    invoke-direct {v2, p1}, Lorg/bouncycastle/asn1/DERUTF8String;-><init>([B)V

    goto :goto_0

    .line 382
    :pswitch_12
    new-instance v2, Lorg/bouncycastle/asn1/DERVisibleString;

    invoke-direct {v2, p1}, Lorg/bouncycastle/asn1/DERVisibleString;-><init>([B)V

    goto :goto_0

    .line 340
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_3
        :pswitch_8
        :pswitch_1
        :pswitch_c
        :pswitch_9
        :pswitch_b
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_4
        :pswitch_0
        :pswitch_11
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_a
        :pswitch_d
        :pswitch_e
        :pswitch_0
        :pswitch_7
        :pswitch_10
        :pswitch_5
        :pswitch_0
        :pswitch_12
        :pswitch_6
        :pswitch_f
        :pswitch_0
        :pswitch_2
    .end packed-switch
.end method

.method static readLength(Ljava/io/InputStream;I)I
    .locals 7
    .param p0, "s"    # Ljava/io/InputStream;
    .param p1, "limit"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 289
    invoke-virtual {p0}, Ljava/io/InputStream;->read()I

    move-result v1

    .line 290
    .local v1, "length":I
    if-gez v1, :cond_0

    .line 292
    new-instance v4, Ljava/io/EOFException;

    const-string v5, "EOF found when length expected"

    invoke-direct {v4, v5}, Ljava/io/EOFException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 295
    :cond_0
    const/16 v4, 0x80

    if-ne v1, v4, :cond_1

    .line 297
    const/4 v4, -0x1

    .line 333
    :goto_0
    return v4

    .line 300
    :cond_1
    const/16 v4, 0x7f

    if-le v1, v4, :cond_6

    .line 302
    and-int/lit8 v3, v1, 0x7f

    .line 304
    .local v3, "size":I
    const/4 v4, 0x4

    if-le v3, v4, :cond_2

    .line 306
    new-instance v4, Ljava/io/IOException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "DER length more than 4 bytes: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 309
    :cond_2
    const/4 v1, 0x0

    .line 310
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    if-ge v0, v3, :cond_4

    .line 312
    invoke-virtual {p0}, Ljava/io/InputStream;->read()I

    move-result v2

    .line 314
    .local v2, "next":I
    if-gez v2, :cond_3

    .line 316
    new-instance v4, Ljava/io/EOFException;

    const-string v5, "EOF found reading length"

    invoke-direct {v4, v5}, Ljava/io/EOFException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 319
    :cond_3
    shl-int/lit8 v4, v1, 0x8

    add-int v1, v4, v2

    .line 310
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 322
    .end local v2    # "next":I
    :cond_4
    if-gez v1, :cond_5

    .line 324
    new-instance v4, Ljava/io/IOException;

    const-string v5, "corrupted stream - negative length found"

    invoke-direct {v4, v5}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 327
    :cond_5
    if-lt v1, p1, :cond_6

    .line 329
    new-instance v4, Ljava/io/IOException;

    const-string v5, "corrupted stream - out of bounds length found"

    invoke-direct {v4, v5}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v4

    .end local v0    # "i":I
    .end local v3    # "size":I
    :cond_6
    move v4, v1

    .line 333
    goto :goto_0
.end method

.method static readTagNumber(Ljava/io/InputStream;I)I
    .locals 4
    .param p0, "s"    # Ljava/io/InputStream;
    .param p1, "tag"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 250
    and-int/lit8 v1, p1, 0x1f

    .line 255
    .local v1, "tagNo":I
    const/16 v2, 0x1f

    if-ne v1, v2, :cond_3

    .line 257
    const/4 v1, 0x0

    .line 259
    invoke-virtual {p0}, Ljava/io/InputStream;->read()I

    move-result v0

    .line 263
    .local v0, "b":I
    and-int/lit8 v2, v0, 0x7f

    if-nez v2, :cond_0

    .line 265
    new-instance v2, Ljava/io/IOException;

    const-string v3, "corrupted stream - invalid high tag number found"

    invoke-direct {v2, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 268
    :cond_0
    :goto_0
    if-ltz v0, :cond_1

    and-int/lit16 v2, v0, 0x80

    if-eqz v2, :cond_1

    .line 270
    and-int/lit8 v2, v0, 0x7f

    or-int/2addr v1, v2

    .line 271
    shl-int/lit8 v1, v1, 0x7

    .line 272
    invoke-virtual {p0}, Ljava/io/InputStream;->read()I

    move-result v0

    goto :goto_0

    .line 275
    :cond_1
    if-gez v0, :cond_2

    .line 277
    new-instance v2, Ljava/io/EOFException;

    const-string v3, "EOF found inside tag value."

    invoke-direct {v2, v3}, Ljava/io/EOFException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 280
    :cond_2
    and-int/lit8 v2, v0, 0x7f

    or-int/2addr v1, v2

    .line 283
    .end local v0    # "b":I
    :cond_3
    return v1
.end method


# virtual methods
.method buildDEREncodableVector(Lorg/bouncycastle/asn1/DefiniteLengthInputStream;)Lorg/bouncycastle/asn1/ASN1EncodableVector;
    .locals 1
    .param p1, "dIn"    # Lorg/bouncycastle/asn1/DefiniteLengthInputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 175
    new-instance v0, Lorg/bouncycastle/asn1/ASN1InputStream;

    invoke-direct {v0, p1}, Lorg/bouncycastle/asn1/ASN1InputStream;-><init>(Ljava/io/InputStream;)V

    invoke-virtual {v0}, Lorg/bouncycastle/asn1/ASN1InputStream;->buildEncodableVector()Lorg/bouncycastle/asn1/ASN1EncodableVector;

    move-result-object v0

    return-object v0
.end method

.method buildEncodableVector()Lorg/bouncycastle/asn1/ASN1EncodableVector;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 161
    new-instance v1, Lorg/bouncycastle/asn1/ASN1EncodableVector;

    invoke-direct {v1}, Lorg/bouncycastle/asn1/ASN1EncodableVector;-><init>()V

    .line 164
    .local v1, "v":Lorg/bouncycastle/asn1/ASN1EncodableVector;
    :goto_0
    invoke-virtual {p0}, Lorg/bouncycastle/asn1/ASN1InputStream;->readObject()Lorg/bouncycastle/asn1/DERObject;

    move-result-object v0

    .local v0, "o":Lorg/bouncycastle/asn1/DERObject;
    if-eqz v0, :cond_0

    .line 166
    invoke-virtual {v1, v0}, Lorg/bouncycastle/asn1/ASN1EncodableVector;->add(Lorg/bouncycastle/asn1/DEREncodable;)V

    goto :goto_0

    .line 169
    :cond_0
    return-object v1
.end method

.method protected buildObject(III)Lorg/bouncycastle/asn1/DERObject;
    .locals 5
    .param p1, "tag"    # I
    .param p2, "tagNo"    # I
    .param p3, "length"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 112
    and-int/lit8 v4, p1, 0x20

    if-eqz v4, :cond_0

    move v1, v2

    .line 114
    .local v1, "isConstructed":Z
    :goto_0
    new-instance v0, Lorg/bouncycastle/asn1/DefiniteLengthInputStream;

    invoke-direct {v0, p0, p3}, Lorg/bouncycastle/asn1/DefiniteLengthInputStream;-><init>(Ljava/io/InputStream;I)V

    .line 116
    .local v0, "defIn":Lorg/bouncycastle/asn1/DefiniteLengthInputStream;
    and-int/lit8 v4, p1, 0x40

    if-eqz v4, :cond_1

    .line 118
    new-instance v2, Lorg/bouncycastle/asn1/DERApplicationSpecific;

    invoke-virtual {v0}, Lorg/bouncycastle/asn1/DefiniteLengthInputStream;->toByteArray()[B

    move-result-object v3

    invoke-direct {v2, v1, p2, v3}, Lorg/bouncycastle/asn1/DERApplicationSpecific;-><init>(ZI[B)V

    .line 155
    :goto_1
    return-object v2

    .end local v0    # "defIn":Lorg/bouncycastle/asn1/DefiniteLengthInputStream;
    .end local v1    # "isConstructed":Z
    :cond_0
    move v1, v3

    .line 112
    goto :goto_0

    .line 121
    .restart local v0    # "defIn":Lorg/bouncycastle/asn1/DefiniteLengthInputStream;
    .restart local v1    # "isConstructed":Z
    :cond_1
    and-int/lit16 v4, p1, 0x80

    if-eqz v4, :cond_2

    .line 123
    new-instance v2, Lorg/bouncycastle/asn1/BERTaggedObjectParser;

    invoke-direct {v2, p1, p2, v0}, Lorg/bouncycastle/asn1/BERTaggedObjectParser;-><init>(IILjava/io/InputStream;)V

    invoke-virtual {v2}, Lorg/bouncycastle/asn1/BERTaggedObjectParser;->getDERObject()Lorg/bouncycastle/asn1/DERObject;

    move-result-object v2

    goto :goto_1

    .line 126
    :cond_2
    if-eqz v1, :cond_5

    .line 129
    sparse-switch p2, :sswitch_data_0

    .line 151
    new-instance v3, Lorg/bouncycastle/asn1/DERUnknownTag;

    invoke-virtual {v0}, Lorg/bouncycastle/asn1/DefiniteLengthInputStream;->toByteArray()[B

    move-result-object v4

    invoke-direct {v3, v2, p2, v4}, Lorg/bouncycastle/asn1/DERUnknownTag;-><init>(ZI[B)V

    move-object v2, v3

    goto :goto_1

    .line 135
    :sswitch_0
    new-instance v2, Lorg/bouncycastle/asn1/BERConstructedOctetString;

    invoke-virtual {p0, v0}, Lorg/bouncycastle/asn1/ASN1InputStream;->buildDEREncodableVector(Lorg/bouncycastle/asn1/DefiniteLengthInputStream;)Lorg/bouncycastle/asn1/ASN1EncodableVector;

    move-result-object v3

    iget-object v3, v3, Lorg/bouncycastle/asn1/ASN1EncodableVector;->v:Ljava/util/Vector;

    invoke-direct {v2, v3}, Lorg/bouncycastle/asn1/BERConstructedOctetString;-><init>(Ljava/util/Vector;)V

    goto :goto_1

    .line 137
    :sswitch_1
    iget-boolean v2, p0, Lorg/bouncycastle/asn1/ASN1InputStream;->lazyEvaluate:Z

    if-eqz v2, :cond_3

    .line 139
    sget-boolean v2, Lorg/bouncycastle/asn1/ASN1InputStream;->$assertionsDisabled:Z

    if-nez v2, :cond_4

    new-instance v2, Ljava/lang/AssertionError;

    invoke-direct {v2}, Ljava/lang/AssertionError;-><init>()V

    throw v2

    .line 144
    :cond_3
    invoke-virtual {p0, v0}, Lorg/bouncycastle/asn1/ASN1InputStream;->buildDEREncodableVector(Lorg/bouncycastle/asn1/DefiniteLengthInputStream;)Lorg/bouncycastle/asn1/ASN1EncodableVector;

    move-result-object v2

    invoke-static {v2}, Lorg/bouncycastle/asn1/DERFactory;->createSequence(Lorg/bouncycastle/asn1/ASN1EncodableVector;)Lorg/bouncycastle/asn1/DERSequence;

    move-result-object v2

    goto :goto_1

    .line 147
    :cond_4
    :sswitch_2
    invoke-virtual {p0, v0}, Lorg/bouncycastle/asn1/ASN1InputStream;->buildDEREncodableVector(Lorg/bouncycastle/asn1/DefiniteLengthInputStream;)Lorg/bouncycastle/asn1/ASN1EncodableVector;

    move-result-object v2

    invoke-static {v2, v3}, Lorg/bouncycastle/asn1/DERFactory;->createSet(Lorg/bouncycastle/asn1/ASN1EncodableVector;Z)Lorg/bouncycastle/asn1/DERSet;

    move-result-object v2

    goto :goto_1

    .line 149
    :sswitch_3
    new-instance v2, Lorg/bouncycastle/asn1/DERExternal;

    invoke-virtual {p0, v0}, Lorg/bouncycastle/asn1/ASN1InputStream;->buildDEREncodableVector(Lorg/bouncycastle/asn1/DefiniteLengthInputStream;)Lorg/bouncycastle/asn1/ASN1EncodableVector;

    move-result-object v3

    invoke-direct {v2, v3}, Lorg/bouncycastle/asn1/DERExternal;-><init>(Lorg/bouncycastle/asn1/ASN1EncodableVector;)V

    goto :goto_1

    .line 155
    :cond_5
    invoke-virtual {v0}, Lorg/bouncycastle/asn1/DefiniteLengthInputStream;->toByteArray()[B

    move-result-object v2

    invoke-static {p2, v2}, Lorg/bouncycastle/asn1/ASN1InputStream;->createPrimitiveDERObject(I[B)Lorg/bouncycastle/asn1/DERObject;

    move-result-object v2

    goto :goto_1

    .line 129
    nop

    :sswitch_data_0
    .sparse-switch
        0x4 -> :sswitch_0
        0x8 -> :sswitch_3
        0x10 -> :sswitch_1
        0x11 -> :sswitch_2
    .end sparse-switch
.end method

.method protected readFully([B)V
    .locals 2
    .param p1, "bytes"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 97
    invoke-static {p0, p1}, Lorg/bouncycastle/util/io/Streams;->readFully(Ljava/io/InputStream;[B)I

    move-result v0

    array-length v1, p1

    if-eq v0, v1, :cond_0

    .line 99
    new-instance v0, Ljava/io/EOFException;

    const-string v1, "EOF encountered in middle of object"

    invoke-direct {v0, v1}, Ljava/io/EOFException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 101
    :cond_0
    return-void
.end method

.method protected readLength()I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 90
    iget v0, p0, Lorg/bouncycastle/asn1/ASN1InputStream;->limit:I

    invoke-static {p0, v0}, Lorg/bouncycastle/asn1/ASN1InputStream;->readLength(Ljava/io/InputStream;I)I

    move-result v0

    return v0
.end method

.method public readObject()Lorg/bouncycastle/asn1/DERObject;
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 181
    invoke-virtual {p0}, Lorg/bouncycastle/asn1/ASN1InputStream;->read()I

    move-result v4

    .line 182
    .local v4, "tag":I
    if-gtz v4, :cond_1

    .line 184
    if-nez v4, :cond_0

    .line 186
    new-instance v6, Ljava/io/IOException;

    const-string v7, "unexpected end-of-contents marker"

    invoke-direct {v6, v7}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 189
    :cond_0
    const/4 v6, 0x0

    .line 243
    :goto_0
    return-object v6

    .line 195
    :cond_1
    invoke-static {p0, v4}, Lorg/bouncycastle/asn1/ASN1InputStream;->readTagNumber(Ljava/io/InputStream;I)I

    move-result v5

    .line 197
    .local v5, "tagNo":I
    and-int/lit8 v6, v4, 0x20

    if-eqz v6, :cond_2

    const/4 v1, 0x1

    .line 202
    .local v1, "isConstructed":Z
    :goto_1
    invoke-virtual {p0}, Lorg/bouncycastle/asn1/ASN1InputStream;->readLength()I

    move-result v2

    .line 204
    .local v2, "length":I
    if-gez v2, :cond_6

    .line 206
    if-nez v1, :cond_3

    .line 208
    new-instance v6, Ljava/io/IOException;

    const-string v7, "indefinite length primitive encoding encountered"

    invoke-direct {v6, v7}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 197
    .end local v1    # "isConstructed":Z
    .end local v2    # "length":I
    :cond_2
    const/4 v1, 0x0

    goto :goto_1

    .line 211
    .restart local v1    # "isConstructed":Z
    .restart local v2    # "length":I
    :cond_3
    new-instance v0, Lorg/bouncycastle/asn1/IndefiniteLengthInputStream;

    invoke-direct {v0, p0}, Lorg/bouncycastle/asn1/IndefiniteLengthInputStream;-><init>(Ljava/io/InputStream;)V

    .line 213
    .local v0, "indIn":Lorg/bouncycastle/asn1/IndefiniteLengthInputStream;
    and-int/lit8 v6, v4, 0x40

    if-eqz v6, :cond_4

    .line 215
    new-instance v3, Lorg/bouncycastle/asn1/ASN1StreamParser;

    iget v6, p0, Lorg/bouncycastle/asn1/ASN1InputStream;->limit:I

    invoke-direct {v3, v0, v6}, Lorg/bouncycastle/asn1/ASN1StreamParser;-><init>(Ljava/io/InputStream;I)V

    .line 217
    .local v3, "sp":Lorg/bouncycastle/asn1/ASN1StreamParser;
    new-instance v6, Lorg/bouncycastle/asn1/BERApplicationSpecificParser;

    invoke-direct {v6, v5, v3}, Lorg/bouncycastle/asn1/BERApplicationSpecificParser;-><init>(ILorg/bouncycastle/asn1/ASN1StreamParser;)V

    invoke-virtual {v6}, Lorg/bouncycastle/asn1/BERApplicationSpecificParser;->getDERObject()Lorg/bouncycastle/asn1/DERObject;

    move-result-object v6

    goto :goto_0

    .line 219
    .end local v3    # "sp":Lorg/bouncycastle/asn1/ASN1StreamParser;
    :cond_4
    and-int/lit16 v6, v4, 0x80

    if-eqz v6, :cond_5

    .line 221
    new-instance v6, Lorg/bouncycastle/asn1/BERTaggedObjectParser;

    invoke-direct {v6, v4, v5, v0}, Lorg/bouncycastle/asn1/BERTaggedObjectParser;-><init>(IILjava/io/InputStream;)V

    invoke-virtual {v6}, Lorg/bouncycastle/asn1/BERTaggedObjectParser;->getDERObject()Lorg/bouncycastle/asn1/DERObject;

    move-result-object v6

    goto :goto_0

    .line 224
    :cond_5
    new-instance v3, Lorg/bouncycastle/asn1/ASN1StreamParser;

    iget v6, p0, Lorg/bouncycastle/asn1/ASN1InputStream;->limit:I

    invoke-direct {v3, v0, v6}, Lorg/bouncycastle/asn1/ASN1StreamParser;-><init>(Ljava/io/InputStream;I)V

    .line 227
    .restart local v3    # "sp":Lorg/bouncycastle/asn1/ASN1StreamParser;
    sparse-switch v5, :sswitch_data_0

    .line 238
    new-instance v6, Ljava/io/IOException;

    const-string v7, "unknown BER object encountered"

    invoke-direct {v6, v7}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 230
    :sswitch_0
    new-instance v6, Lorg/bouncycastle/asn1/BEROctetStringParser;

    invoke-direct {v6, v3}, Lorg/bouncycastle/asn1/BEROctetStringParser;-><init>(Lorg/bouncycastle/asn1/ASN1StreamParser;)V

    invoke-virtual {v6}, Lorg/bouncycastle/asn1/BEROctetStringParser;->getDERObject()Lorg/bouncycastle/asn1/DERObject;

    move-result-object v6

    goto :goto_0

    .line 232
    :sswitch_1
    new-instance v6, Lorg/bouncycastle/asn1/BERSequenceParser;

    invoke-direct {v6, v3}, Lorg/bouncycastle/asn1/BERSequenceParser;-><init>(Lorg/bouncycastle/asn1/ASN1StreamParser;)V

    invoke-virtual {v6}, Lorg/bouncycastle/asn1/BERSequenceParser;->getDERObject()Lorg/bouncycastle/asn1/DERObject;

    move-result-object v6

    goto :goto_0

    .line 234
    :sswitch_2
    new-instance v6, Lorg/bouncycastle/asn1/BERSetParser;

    invoke-direct {v6, v3}, Lorg/bouncycastle/asn1/BERSetParser;-><init>(Lorg/bouncycastle/asn1/ASN1StreamParser;)V

    invoke-virtual {v6}, Lorg/bouncycastle/asn1/BERSetParser;->getDERObject()Lorg/bouncycastle/asn1/DERObject;

    move-result-object v6

    goto :goto_0

    .line 236
    :sswitch_3
    new-instance v6, Lorg/bouncycastle/asn1/DERExternalParser;

    invoke-direct {v6, v3}, Lorg/bouncycastle/asn1/DERExternalParser;-><init>(Lorg/bouncycastle/asn1/ASN1StreamParser;)V

    invoke-virtual {v6}, Lorg/bouncycastle/asn1/DERExternalParser;->getDERObject()Lorg/bouncycastle/asn1/DERObject;

    move-result-object v6

    goto :goto_0

    .line 243
    .end local v0    # "indIn":Lorg/bouncycastle/asn1/IndefiniteLengthInputStream;
    .end local v3    # "sp":Lorg/bouncycastle/asn1/ASN1StreamParser;
    :cond_6
    invoke-virtual {p0, v4, v5, v2}, Lorg/bouncycastle/asn1/ASN1InputStream;->buildObject(III)Lorg/bouncycastle/asn1/DERObject;

    move-result-object v6

    goto/16 :goto_0

    .line 227
    nop

    :sswitch_data_0
    .sparse-switch
        0x4 -> :sswitch_0
        0x8 -> :sswitch_3
        0x10 -> :sswitch_1
        0x11 -> :sswitch_2
    .end sparse-switch
.end method
