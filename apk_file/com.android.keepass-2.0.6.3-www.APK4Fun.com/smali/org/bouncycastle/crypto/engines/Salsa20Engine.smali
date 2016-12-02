.class public Lorg/bouncycastle/crypto/engines/Salsa20Engine;
.super Ljava/lang/Object;
.source "Salsa20Engine.java"

# interfaces
.implements Lorg/bouncycastle/crypto/StreamCipher;


# static fields
.field private static final sigma:[B

.field private static final stateSize:I = 0x10

.field private static final tau:[B


# instance fields
.field private cW0:I

.field private cW1:I

.field private cW2:I

.field private engineState:[I

.field private index:I

.field private initialised:Z

.field private keyStream:[B

.field private workingIV:[B

.field private workingKey:[B

.field private x:[I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 21
    const-string v0, "expand 32-byte k"

    invoke-static {v0}, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->toByteArray(Ljava/lang/String;)[B

    move-result-object v0

    sput-object v0, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->sigma:[B

    .line 22
    const-string v0, "expand 16-byte k"

    invoke-static {v0}, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->toByteArray(Ljava/lang/String;)[B

    move-result-object v0

    sput-object v0, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->tau:[B

    return-void
.end method

.method public constructor <init>()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    const/16 v2, 0x10

    const/4 v1, 0x0

    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 44
    iput v1, p0, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->index:I

    .line 45
    new-array v0, v2, [I

    iput-object v0, p0, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->engineState:[I

    .line 46
    new-array v0, v2, [I

    iput-object v0, p0, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->x:[I

    .line 47
    const/16 v0, 0x40

    new-array v0, v0, [B

    iput-object v0, p0, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->keyStream:[B

    iput-object v3, p0, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->workingKey:[B

    iput-object v3, p0, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->workingIV:[B

    .line 50
    iput-boolean v1, p0, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->initialised:Z

    return-void
.end method

.method private byteToIntLittle([BI)I
    .locals 2
    .param p1, "x"    # [B
    .param p2, "offset"    # I

    .prologue
    .line 323
    aget-byte v0, p1, p2

    and-int/lit16 v0, v0, 0xff

    add-int/lit8 v1, p2, 0x1

    aget-byte v1, p1, v1

    and-int/lit16 v1, v1, 0xff

    shl-int/lit8 v1, v1, 0x8

    or-int/2addr v0, v1

    add-int/lit8 v1, p2, 0x2

    aget-byte v1, p1, v1

    and-int/lit16 v1, v1, 0xff

    shl-int/lit8 v1, v1, 0x10

    or-int/2addr v0, v1

    add-int/lit8 v1, p2, 0x3

    aget-byte v1, p1, v1

    shl-int/lit8 v1, v1, 0x18

    or-int/2addr v0, v1

    return v0
.end method

.method private intToByteLittle(I[BI)[B
    .locals 2
    .param p1, "x"    # I
    .param p2, "out"    # [B
    .param p3, "off"    # I

    .prologue
    .line 293
    int-to-byte v0, p1

    aput-byte v0, p2, p3

    .line 294
    add-int/lit8 v0, p3, 0x1

    ushr-int/lit8 v1, p1, 0x8

    int-to-byte v1, v1

    aput-byte v1, p2, v0

    .line 295
    add-int/lit8 v0, p3, 0x2

    ushr-int/lit8 v1, p1, 0x10

    int-to-byte v1, v1

    aput-byte v1, p2, v0

    .line 296
    add-int/lit8 v0, p3, 0x3

    ushr-int/lit8 v1, p1, 0x18

    int-to-byte v1, v1

    aput-byte v1, p2, v0

    .line 297
    return-object p2
.end method

.method private limitExceeded()Z
    .locals 2

    .prologue
    const/4 v0, 0x0

    .line 338
    iget v1, p0, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->cW0:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->cW0:I

    .line 339
    iget v1, p0, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->cW0:I

    if-nez v1, :cond_0

    .line 341
    iget v1, p0, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->cW1:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->cW1:I

    .line 342
    iget v1, p0, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->cW1:I

    if-nez v1, :cond_0

    .line 344
    iget v1, p0, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->cW2:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->cW2:I

    .line 345
    iget v1, p0, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->cW2:I

    and-int/lit8 v1, v1, 0x20

    if-eqz v1, :cond_0

    const/4 v0, 0x1

    .line 349
    :cond_0
    return v0
.end method

.method private limitExceeded(I)Z
    .locals 2
    .param p1, "len"    # I

    .prologue
    const/4 v0, 0x0

    .line 357
    iget v1, p0, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->cW0:I

    if-ltz v1, :cond_1

    .line 359
    iget v1, p0, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->cW0:I

    add-int/2addr v1, p1

    iput v1, p0, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->cW0:I

    .line 375
    :cond_0
    :goto_0
    return v0

    .line 363
    :cond_1
    iget v1, p0, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->cW0:I

    add-int/2addr v1, p1

    iput v1, p0, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->cW0:I

    .line 364
    iget v1, p0, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->cW0:I

    if-ltz v1, :cond_0

    .line 366
    iget v1, p0, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->cW1:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->cW1:I

    .line 367
    iget v1, p0, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->cW1:I

    if-nez v1, :cond_0

    .line 369
    iget v1, p0, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->cW2:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->cW2:I

    .line 370
    iget v1, p0, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->cW2:I

    and-int/lit8 v1, v1, 0x20

    if-eqz v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0
.end method

.method private resetCounter()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 331
    iput v0, p0, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->cW0:I

    .line 332
    iput v0, p0, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->cW1:I

    .line 333
    iput v0, p0, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->cW2:I

    .line 334
    return-void
.end method

.method private rotl(II)I
    .locals 2
    .param p1, "x"    # I
    .param p2, "y"    # I

    .prologue
    .line 310
    shl-int v0, p1, p2

    neg-int v1, p2

    ushr-int v1, p1, v1

    or-int/2addr v0, v1

    return v0
.end method

.method private salsa20WordToByte([I[B)V
    .locals 13
    .param p1, "input"    # [I
    .param p2, "output"    # [B

    .prologue
    const/16 v12, 0x12

    const/4 v11, 0x0

    const/16 v10, 0xd

    const/16 v9, 0x9

    const/4 v8, 0x7

    .line 232
    iget-object v2, p0, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->x:[I

    array-length v3, p1

    invoke-static {p1, v11, v2, v11, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 234
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    const/16 v2, 0xa

    if-ge v0, v2, :cond_0

    .line 236
    iget-object v2, p0, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->x:[I

    const/4 v3, 0x4

    aget v4, v2, v3

    iget-object v5, p0, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->x:[I

    aget v5, v5, v11

    iget-object v6, p0, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->x:[I

    const/16 v7, 0xc

    aget v6, v6, v7

    add-int/2addr v5, v6

    invoke-direct {p0, v5, v8}, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->rotl(II)I

    move-result v5

    xor-int/2addr v4, v5

    aput v4, v2, v3

    .line 237
    iget-object v2, p0, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->x:[I

    const/16 v3, 0x8

    aget v4, v2, v3

    iget-object v5, p0, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->x:[I

    const/4 v6, 0x4

    aget v5, v5, v6

    iget-object v6, p0, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->x:[I

    aget v6, v6, v11

    add-int/2addr v5, v6

    invoke-direct {p0, v5, v9}, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->rotl(II)I

    move-result v5

    xor-int/2addr v4, v5

    aput v4, v2, v3

    .line 238
    iget-object v2, p0, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->x:[I

    const/16 v3, 0xc

    aget v4, v2, v3

    iget-object v5, p0, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->x:[I

    const/16 v6, 0x8

    aget v5, v5, v6

    iget-object v6, p0, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->x:[I

    const/4 v7, 0x4

    aget v6, v6, v7

    add-int/2addr v5, v6

    invoke-direct {p0, v5, v10}, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->rotl(II)I

    move-result v5

    xor-int/2addr v4, v5

    aput v4, v2, v3

    .line 239
    iget-object v2, p0, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->x:[I

    aget v3, v2, v11

    iget-object v4, p0, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->x:[I

    const/16 v5, 0xc

    aget v4, v4, v5

    iget-object v5, p0, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->x:[I

    const/16 v6, 0x8

    aget v5, v5, v6

    add-int/2addr v4, v5

    invoke-direct {p0, v4, v12}, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->rotl(II)I

    move-result v4

    xor-int/2addr v3, v4

    aput v3, v2, v11

    .line 240
    iget-object v2, p0, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->x:[I

    aget v3, v2, v9

    iget-object v4, p0, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->x:[I

    const/4 v5, 0x5

    aget v4, v4, v5

    iget-object v5, p0, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->x:[I

    const/4 v6, 0x1

    aget v5, v5, v6

    add-int/2addr v4, v5

    invoke-direct {p0, v4, v8}, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->rotl(II)I

    move-result v4

    xor-int/2addr v3, v4

    aput v3, v2, v9

    .line 241
    iget-object v2, p0, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->x:[I

    aget v3, v2, v10

    iget-object v4, p0, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->x:[I

    aget v4, v4, v9

    iget-object v5, p0, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->x:[I

    const/4 v6, 0x5

    aget v5, v5, v6

    add-int/2addr v4, v5

    invoke-direct {p0, v4, v9}, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->rotl(II)I

    move-result v4

    xor-int/2addr v3, v4

    aput v3, v2, v10

    .line 242
    iget-object v2, p0, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->x:[I

    const/4 v3, 0x1

    aget v4, v2, v3

    iget-object v5, p0, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->x:[I

    aget v5, v5, v10

    iget-object v6, p0, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->x:[I

    aget v6, v6, v9

    add-int/2addr v5, v6

    invoke-direct {p0, v5, v10}, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->rotl(II)I

    move-result v5

    xor-int/2addr v4, v5

    aput v4, v2, v3

    .line 243
    iget-object v2, p0, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->x:[I

    const/4 v3, 0x5

    aget v4, v2, v3

    iget-object v5, p0, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->x:[I

    const/4 v6, 0x1

    aget v5, v5, v6

    iget-object v6, p0, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->x:[I

    aget v6, v6, v10

    add-int/2addr v5, v6

    invoke-direct {p0, v5, v12}, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->rotl(II)I

    move-result v5

    xor-int/2addr v4, v5

    aput v4, v2, v3

    .line 244
    iget-object v2, p0, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->x:[I

    const/16 v3, 0xe

    aget v4, v2, v3

    iget-object v5, p0, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->x:[I

    const/16 v6, 0xa

    aget v5, v5, v6

    iget-object v6, p0, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->x:[I

    const/4 v7, 0x6

    aget v6, v6, v7

    add-int/2addr v5, v6

    invoke-direct {p0, v5, v8}, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->rotl(II)I

    move-result v5

    xor-int/2addr v4, v5

    aput v4, v2, v3

    .line 245
    iget-object v2, p0, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->x:[I

    const/4 v3, 0x2

    aget v4, v2, v3

    iget-object v5, p0, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->x:[I

    const/16 v6, 0xe

    aget v5, v5, v6

    iget-object v6, p0, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->x:[I

    const/16 v7, 0xa

    aget v6, v6, v7

    add-int/2addr v5, v6

    invoke-direct {p0, v5, v9}, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->rotl(II)I

    move-result v5

    xor-int/2addr v4, v5

    aput v4, v2, v3

    .line 246
    iget-object v2, p0, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->x:[I

    const/4 v3, 0x6

    aget v4, v2, v3

    iget-object v5, p0, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->x:[I

    const/4 v6, 0x2

    aget v5, v5, v6

    iget-object v6, p0, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->x:[I

    const/16 v7, 0xe

    aget v6, v6, v7

    add-int/2addr v5, v6

    invoke-direct {p0, v5, v10}, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->rotl(II)I

    move-result v5

    xor-int/2addr v4, v5

    aput v4, v2, v3

    .line 247
    iget-object v2, p0, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->x:[I

    const/16 v3, 0xa

    aget v4, v2, v3

    iget-object v5, p0, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->x:[I

    const/4 v6, 0x6

    aget v5, v5, v6

    iget-object v6, p0, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->x:[I

    const/4 v7, 0x2

    aget v6, v6, v7

    add-int/2addr v5, v6

    invoke-direct {p0, v5, v12}, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->rotl(II)I

    move-result v5

    xor-int/2addr v4, v5

    aput v4, v2, v3

    .line 248
    iget-object v2, p0, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->x:[I

    const/4 v3, 0x3

    aget v4, v2, v3

    iget-object v5, p0, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->x:[I

    const/16 v6, 0xf

    aget v5, v5, v6

    iget-object v6, p0, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->x:[I

    const/16 v7, 0xb

    aget v6, v6, v7

    add-int/2addr v5, v6

    invoke-direct {p0, v5, v8}, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->rotl(II)I

    move-result v5

    xor-int/2addr v4, v5

    aput v4, v2, v3

    .line 249
    iget-object v2, p0, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->x:[I

    aget v3, v2, v8

    iget-object v4, p0, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->x:[I

    const/4 v5, 0x3

    aget v4, v4, v5

    iget-object v5, p0, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->x:[I

    const/16 v6, 0xf

    aget v5, v5, v6

    add-int/2addr v4, v5

    invoke-direct {p0, v4, v9}, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->rotl(II)I

    move-result v4

    xor-int/2addr v3, v4

    aput v3, v2, v8

    .line 250
    iget-object v2, p0, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->x:[I

    const/16 v3, 0xb

    aget v4, v2, v3

    iget-object v5, p0, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->x:[I

    aget v5, v5, v8

    iget-object v6, p0, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->x:[I

    const/4 v7, 0x3

    aget v6, v6, v7

    add-int/2addr v5, v6

    invoke-direct {p0, v5, v10}, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->rotl(II)I

    move-result v5

    xor-int/2addr v4, v5

    aput v4, v2, v3

    .line 251
    iget-object v2, p0, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->x:[I

    const/16 v3, 0xf

    aget v4, v2, v3

    iget-object v5, p0, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->x:[I

    const/16 v6, 0xb

    aget v5, v5, v6

    iget-object v6, p0, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->x:[I

    aget v6, v6, v8

    add-int/2addr v5, v6

    invoke-direct {p0, v5, v12}, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->rotl(II)I

    move-result v5

    xor-int/2addr v4, v5

    aput v4, v2, v3

    .line 252
    iget-object v2, p0, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->x:[I

    const/4 v3, 0x1

    aget v4, v2, v3

    iget-object v5, p0, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->x:[I

    aget v5, v5, v11

    iget-object v6, p0, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->x:[I

    const/4 v7, 0x3

    aget v6, v6, v7

    add-int/2addr v5, v6

    invoke-direct {p0, v5, v8}, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->rotl(II)I

    move-result v5

    xor-int/2addr v4, v5

    aput v4, v2, v3

    .line 253
    iget-object v2, p0, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->x:[I

    const/4 v3, 0x2

    aget v4, v2, v3

    iget-object v5, p0, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->x:[I

    const/4 v6, 0x1

    aget v5, v5, v6

    iget-object v6, p0, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->x:[I

    aget v6, v6, v11

    add-int/2addr v5, v6

    invoke-direct {p0, v5, v9}, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->rotl(II)I

    move-result v5

    xor-int/2addr v4, v5

    aput v4, v2, v3

    .line 254
    iget-object v2, p0, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->x:[I

    const/4 v3, 0x3

    aget v4, v2, v3

    iget-object v5, p0, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->x:[I

    const/4 v6, 0x2

    aget v5, v5, v6

    iget-object v6, p0, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->x:[I

    const/4 v7, 0x1

    aget v6, v6, v7

    add-int/2addr v5, v6

    invoke-direct {p0, v5, v10}, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->rotl(II)I

    move-result v5

    xor-int/2addr v4, v5

    aput v4, v2, v3

    .line 255
    iget-object v2, p0, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->x:[I

    aget v3, v2, v11

    iget-object v4, p0, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->x:[I

    const/4 v5, 0x3

    aget v4, v4, v5

    iget-object v5, p0, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->x:[I

    const/4 v6, 0x2

    aget v5, v5, v6

    add-int/2addr v4, v5

    invoke-direct {p0, v4, v12}, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->rotl(II)I

    move-result v4

    xor-int/2addr v3, v4

    aput v3, v2, v11

    .line 256
    iget-object v2, p0, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->x:[I

    const/4 v3, 0x6

    aget v4, v2, v3

    iget-object v5, p0, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->x:[I

    const/4 v6, 0x5

    aget v5, v5, v6

    iget-object v6, p0, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->x:[I

    const/4 v7, 0x4

    aget v6, v6, v7

    add-int/2addr v5, v6

    invoke-direct {p0, v5, v8}, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->rotl(II)I

    move-result v5

    xor-int/2addr v4, v5

    aput v4, v2, v3

    .line 257
    iget-object v2, p0, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->x:[I

    aget v3, v2, v8

    iget-object v4, p0, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->x:[I

    const/4 v5, 0x6

    aget v4, v4, v5

    iget-object v5, p0, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->x:[I

    const/4 v6, 0x5

    aget v5, v5, v6

    add-int/2addr v4, v5

    invoke-direct {p0, v4, v9}, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->rotl(II)I

    move-result v4

    xor-int/2addr v3, v4

    aput v3, v2, v8

    .line 258
    iget-object v2, p0, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->x:[I

    const/4 v3, 0x4

    aget v4, v2, v3

    iget-object v5, p0, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->x:[I

    aget v5, v5, v8

    iget-object v6, p0, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->x:[I

    const/4 v7, 0x6

    aget v6, v6, v7

    add-int/2addr v5, v6

    invoke-direct {p0, v5, v10}, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->rotl(II)I

    move-result v5

    xor-int/2addr v4, v5

    aput v4, v2, v3

    .line 259
    iget-object v2, p0, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->x:[I

    const/4 v3, 0x5

    aget v4, v2, v3

    iget-object v5, p0, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->x:[I

    const/4 v6, 0x4

    aget v5, v5, v6

    iget-object v6, p0, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->x:[I

    aget v6, v6, v8

    add-int/2addr v5, v6

    invoke-direct {p0, v5, v12}, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->rotl(II)I

    move-result v5

    xor-int/2addr v4, v5

    aput v4, v2, v3

    .line 260
    iget-object v2, p0, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->x:[I

    const/16 v3, 0xb

    aget v4, v2, v3

    iget-object v5, p0, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->x:[I

    const/16 v6, 0xa

    aget v5, v5, v6

    iget-object v6, p0, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->x:[I

    aget v6, v6, v9

    add-int/2addr v5, v6

    invoke-direct {p0, v5, v8}, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->rotl(II)I

    move-result v5

    xor-int/2addr v4, v5

    aput v4, v2, v3

    .line 261
    iget-object v2, p0, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->x:[I

    const/16 v3, 0x8

    aget v4, v2, v3

    iget-object v5, p0, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->x:[I

    const/16 v6, 0xb

    aget v5, v5, v6

    iget-object v6, p0, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->x:[I

    const/16 v7, 0xa

    aget v6, v6, v7

    add-int/2addr v5, v6

    invoke-direct {p0, v5, v9}, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->rotl(II)I

    move-result v5

    xor-int/2addr v4, v5

    aput v4, v2, v3

    .line 262
    iget-object v2, p0, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->x:[I

    aget v3, v2, v9

    iget-object v4, p0, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->x:[I

    const/16 v5, 0x8

    aget v4, v4, v5

    iget-object v5, p0, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->x:[I

    const/16 v6, 0xb

    aget v5, v5, v6

    add-int/2addr v4, v5

    invoke-direct {p0, v4, v10}, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->rotl(II)I

    move-result v4

    xor-int/2addr v3, v4

    aput v3, v2, v9

    .line 263
    iget-object v2, p0, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->x:[I

    const/16 v3, 0xa

    aget v4, v2, v3

    iget-object v5, p0, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->x:[I

    aget v5, v5, v9

    iget-object v6, p0, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->x:[I

    const/16 v7, 0x8

    aget v6, v6, v7

    add-int/2addr v5, v6

    invoke-direct {p0, v5, v12}, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->rotl(II)I

    move-result v5

    xor-int/2addr v4, v5

    aput v4, v2, v3

    .line 264
    iget-object v2, p0, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->x:[I

    const/16 v3, 0xc

    aget v4, v2, v3

    iget-object v5, p0, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->x:[I

    const/16 v6, 0xf

    aget v5, v5, v6

    iget-object v6, p0, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->x:[I

    const/16 v7, 0xe

    aget v6, v6, v7

    add-int/2addr v5, v6

    invoke-direct {p0, v5, v8}, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->rotl(II)I

    move-result v5

    xor-int/2addr v4, v5

    aput v4, v2, v3

    .line 265
    iget-object v2, p0, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->x:[I

    aget v3, v2, v10

    iget-object v4, p0, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->x:[I

    const/16 v5, 0xc

    aget v4, v4, v5

    iget-object v5, p0, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->x:[I

    const/16 v6, 0xf

    aget v5, v5, v6

    add-int/2addr v4, v5

    invoke-direct {p0, v4, v9}, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->rotl(II)I

    move-result v4

    xor-int/2addr v3, v4

    aput v3, v2, v10

    .line 266
    iget-object v2, p0, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->x:[I

    const/16 v3, 0xe

    aget v4, v2, v3

    iget-object v5, p0, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->x:[I

    aget v5, v5, v10

    iget-object v6, p0, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->x:[I

    const/16 v7, 0xc

    aget v6, v6, v7

    add-int/2addr v5, v6

    invoke-direct {p0, v5, v10}, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->rotl(II)I

    move-result v5

    xor-int/2addr v4, v5

    aput v4, v2, v3

    .line 267
    iget-object v2, p0, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->x:[I

    const/16 v3, 0xf

    aget v4, v2, v3

    iget-object v5, p0, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->x:[I

    const/16 v6, 0xe

    aget v5, v5, v6

    iget-object v6, p0, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->x:[I

    aget v6, v6, v10

    add-int/2addr v5, v6

    invoke-direct {p0, v5, v12}, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->rotl(II)I

    move-result v5

    xor-int/2addr v4, v5

    aput v4, v2, v3

    .line 234
    add-int/lit8 v0, v0, 0x1

    goto/16 :goto_0

    .line 270
    :cond_0
    const/4 v1, 0x0

    .line 271
    .local v1, "offset":I
    const/4 v0, 0x0

    :goto_1
    const/16 v2, 0x10

    if-ge v0, v2, :cond_1

    .line 273
    iget-object v2, p0, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->x:[I

    aget v2, v2, v0

    aget v3, p1, v0

    add-int/2addr v2, v3

    invoke-direct {p0, v2, p2, v1}, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->intToByteLittle(I[BI)[B

    .line 274
    add-int/lit8 v1, v1, 0x4

    .line 271
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 277
    :cond_1
    const/16 v0, 0x10

    :goto_2
    iget-object v2, p0, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->x:[I

    array-length v2, v2

    if-ge v0, v2, :cond_2

    .line 279
    iget-object v2, p0, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->x:[I

    aget v2, v2, v0

    invoke-direct {p0, v2, p2, v1}, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->intToByteLittle(I[BI)[B

    .line 280
    add-int/lit8 v1, v1, 0x4

    .line 277
    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    .line 282
    :cond_2
    return-void
.end method

.method private setKey([B[B)V
    .locals 11
    .param p1, "keyBytes"    # [B
    .param p2, "ivBytes"    # [B

    .prologue
    const/4 v10, 0x1

    const/16 v9, 0xc

    const/16 v8, 0x8

    const/4 v7, 0x4

    const/4 v6, 0x0

    .line 182
    iput-object p1, p0, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->workingKey:[B

    .line 183
    iput-object p2, p0, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->workingIV:[B

    .line 185
    iput v6, p0, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->index:I

    .line 186
    invoke-direct {p0}, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->resetCounter()V

    .line 187
    const/4 v1, 0x0

    .line 191
    .local v1, "offset":I
    iget-object v2, p0, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->engineState:[I

    iget-object v3, p0, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->workingKey:[B

    invoke-direct {p0, v3, v6}, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->byteToIntLittle([BI)I

    move-result v3

    aput v3, v2, v10

    .line 192
    iget-object v2, p0, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->engineState:[I

    const/4 v3, 0x2

    iget-object v4, p0, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->workingKey:[B

    invoke-direct {p0, v4, v7}, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->byteToIntLittle([BI)I

    move-result v4

    aput v4, v2, v3

    .line 193
    iget-object v2, p0, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->engineState:[I

    const/4 v3, 0x3

    iget-object v4, p0, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->workingKey:[B

    invoke-direct {p0, v4, v8}, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->byteToIntLittle([BI)I

    move-result v4

    aput v4, v2, v3

    .line 194
    iget-object v2, p0, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->engineState:[I

    iget-object v3, p0, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->workingKey:[B

    invoke-direct {p0, v3, v9}, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->byteToIntLittle([BI)I

    move-result v3

    aput v3, v2, v7

    .line 196
    iget-object v2, p0, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->workingKey:[B

    array-length v2, v2

    const/16 v3, 0x20

    if-ne v2, v3, :cond_0

    .line 198
    sget-object v0, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->sigma:[B

    .line 199
    .local v0, "constants":[B
    const/16 v1, 0x10

    .line 206
    :goto_0
    iget-object v2, p0, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->engineState:[I

    const/16 v3, 0xb

    iget-object v4, p0, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->workingKey:[B

    invoke-direct {p0, v4, v1}, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->byteToIntLittle([BI)I

    move-result v4

    aput v4, v2, v3

    .line 207
    iget-object v2, p0, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->engineState:[I

    iget-object v3, p0, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->workingKey:[B

    add-int/lit8 v4, v1, 0x4

    invoke-direct {p0, v3, v4}, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->byteToIntLittle([BI)I

    move-result v3

    aput v3, v2, v9

    .line 208
    iget-object v2, p0, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->engineState:[I

    const/16 v3, 0xd

    iget-object v4, p0, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->workingKey:[B

    add-int/lit8 v5, v1, 0x8

    invoke-direct {p0, v4, v5}, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->byteToIntLittle([BI)I

    move-result v4

    aput v4, v2, v3

    .line 209
    iget-object v2, p0, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->engineState:[I

    const/16 v3, 0xe

    iget-object v4, p0, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->workingKey:[B

    add-int/lit8 v5, v1, 0xc

    invoke-direct {p0, v4, v5}, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->byteToIntLittle([BI)I

    move-result v4

    aput v4, v2, v3

    .line 210
    iget-object v2, p0, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->engineState:[I

    invoke-direct {p0, v0, v6}, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->byteToIntLittle([BI)I

    move-result v3

    aput v3, v2, v6

    .line 211
    iget-object v2, p0, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->engineState:[I

    const/4 v3, 0x5

    invoke-direct {p0, v0, v7}, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->byteToIntLittle([BI)I

    move-result v4

    aput v4, v2, v3

    .line 212
    iget-object v2, p0, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->engineState:[I

    const/16 v3, 0xa

    invoke-direct {p0, v0, v8}, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->byteToIntLittle([BI)I

    move-result v4

    aput v4, v2, v3

    .line 213
    iget-object v2, p0, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->engineState:[I

    const/16 v3, 0xf

    invoke-direct {p0, v0, v9}, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->byteToIntLittle([BI)I

    move-result v4

    aput v4, v2, v3

    .line 216
    iget-object v2, p0, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->engineState:[I

    const/4 v3, 0x6

    iget-object v4, p0, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->workingIV:[B

    invoke-direct {p0, v4, v6}, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->byteToIntLittle([BI)I

    move-result v4

    aput v4, v2, v3

    .line 217
    iget-object v2, p0, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->engineState:[I

    const/4 v3, 0x7

    iget-object v4, p0, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->workingIV:[B

    invoke-direct {p0, v4, v7}, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->byteToIntLittle([BI)I

    move-result v4

    aput v4, v2, v3

    .line 218
    iget-object v2, p0, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->engineState:[I

    iget-object v3, p0, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->engineState:[I

    const/16 v4, 0x9

    aput v6, v3, v4

    aput v6, v2, v8

    .line 220
    iput-boolean v10, p0, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->initialised:Z

    .line 221
    return-void

    .line 203
    .end local v0    # "constants":[B
    :cond_0
    sget-object v0, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->tau:[B

    .restart local v0    # "constants":[B
    goto :goto_0
.end method

.method private static toByteArray(Ljava/lang/String;)[B
    .locals 4
    .param p0, "string"    # Ljava/lang/String;

    .prologue
    .line 27
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    new-array v0, v3, [B

    .line 29
    .local v0, "bytes":[B
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    array-length v3, v0

    if-eq v2, v3, :cond_0

    .line 31
    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 33
    .local v1, "ch":C
    int-to-byte v3, v1

    aput-byte v3, v0, v2

    .line 29
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 36
    .end local v1    # "ch":C
    :cond_0
    return-object v0
.end method


# virtual methods
.method public getAlgorithmName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 105
    const-string v0, "Salsa20"

    return-object v0
.end method

.method public init(ZLorg/bouncycastle/crypto/CipherParameters;)V
    .locals 5
    .param p1, "forEncryption"    # Z
    .param p2, "params"    # Lorg/bouncycastle/crypto/CipherParameters;

    .prologue
    .line 76
    instance-of v3, p2, Lorg/bouncycastle/crypto/params/ParametersWithIV;

    if-nez v3, :cond_0

    .line 78
    new-instance v3, Ljava/lang/IllegalArgumentException;

    const-string v4, "Salsa20 Init parameters must include an IV"

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    :cond_0
    move-object v1, p2

    .line 81
    check-cast v1, Lorg/bouncycastle/crypto/params/ParametersWithIV;

    .line 83
    .local v1, "ivParams":Lorg/bouncycastle/crypto/params/ParametersWithIV;
    invoke-virtual {v1}, Lorg/bouncycastle/crypto/params/ParametersWithIV;->getIV()[B

    move-result-object v0

    .line 85
    .local v0, "iv":[B
    if-eqz v0, :cond_1

    array-length v3, v0

    const/16 v4, 0x8

    if-eq v3, v4, :cond_2

    .line 87
    :cond_1
    new-instance v3, Ljava/lang/IllegalArgumentException;

    const-string v4, "Salsa20 requires exactly 8 bytes of IV"

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 90
    :cond_2
    invoke-virtual {v1}, Lorg/bouncycastle/crypto/params/ParametersWithIV;->getParameters()Lorg/bouncycastle/crypto/CipherParameters;

    move-result-object v3

    instance-of v3, v3, Lorg/bouncycastle/crypto/params/KeyParameter;

    if-nez v3, :cond_3

    .line 92
    new-instance v3, Ljava/lang/IllegalArgumentException;

    const-string v4, "Salsa20 Init parameters must include a key"

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 95
    :cond_3
    invoke-virtual {v1}, Lorg/bouncycastle/crypto/params/ParametersWithIV;->getParameters()Lorg/bouncycastle/crypto/CipherParameters;

    move-result-object v2

    check-cast v2, Lorg/bouncycastle/crypto/params/KeyParameter;

    .line 97
    .local v2, "key":Lorg/bouncycastle/crypto/params/KeyParameter;
    invoke-virtual {v2}, Lorg/bouncycastle/crypto/params/KeyParameter;->getKey()[B

    move-result-object v3

    iput-object v3, p0, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->workingKey:[B

    .line 98
    iput-object v0, p0, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->workingIV:[B

    .line 100
    iget-object v3, p0, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->workingKey:[B

    iget-object v4, p0, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->workingIV:[B

    invoke-direct {p0, v3, v4}, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->setKey([B[B)V

    .line 101
    return-void
.end method

.method public processBytes([BII[BI)V
    .locals 5
    .param p1, "in"    # [B
    .param p2, "inOff"    # I
    .param p3, "len"    # I
    .param p4, "out"    # [B
    .param p5, "outOff"    # I

    .prologue
    const/16 v4, 0x8

    .line 137
    iget-boolean v1, p0, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->initialised:Z

    if-nez v1, :cond_0

    .line 139
    new-instance v1, Ljava/lang/IllegalStateException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->getAlgorithmName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " not initialised"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 142
    :cond_0
    add-int v1, p2, p3

    array-length v2, p1

    if-le v1, v2, :cond_1

    .line 144
    new-instance v1, Lorg/bouncycastle/crypto/DataLengthException;

    const-string v2, "input buffer too short"

    invoke-direct {v1, v2}, Lorg/bouncycastle/crypto/DataLengthException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 147
    :cond_1
    add-int v1, p5, p3

    array-length v2, p4

    if-le v1, v2, :cond_2

    .line 149
    new-instance v1, Lorg/bouncycastle/crypto/DataLengthException;

    const-string v2, "output buffer too short"

    invoke-direct {v1, v2}, Lorg/bouncycastle/crypto/DataLengthException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 152
    :cond_2
    invoke-direct {p0, p3}, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->limitExceeded(I)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 154
    new-instance v1, Lorg/bouncycastle/crypto/MaxBytesExceededException;

    const-string v2, "2^70 byte limit per IV would be exceeded; Change IV"

    invoke-direct {v1, v2}, Lorg/bouncycastle/crypto/MaxBytesExceededException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 157
    :cond_3
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    if-ge v0, p3, :cond_5

    .line 159
    iget v1, p0, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->index:I

    if-nez v1, :cond_4

    .line 161
    iget-object v1, p0, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->engineState:[I

    iget-object v2, p0, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->keyStream:[B

    invoke-direct {p0, v1, v2}, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->salsa20WordToByte([I[B)V

    .line 162
    iget-object v1, p0, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->engineState:[I

    aget v2, v1, v4

    add-int/lit8 v2, v2, 0x1

    aput v2, v1, v4

    .line 163
    iget-object v1, p0, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->engineState:[I

    aget v1, v1, v4

    if-nez v1, :cond_4

    .line 165
    iget-object v1, p0, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->engineState:[I

    const/16 v2, 0x9

    aget v3, v1, v2

    add-int/lit8 v3, v3, 0x1

    aput v3, v1, v2

    .line 168
    :cond_4
    add-int v1, v0, p5

    iget-object v2, p0, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->keyStream:[B

    iget v3, p0, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->index:I

    aget-byte v2, v2, v3

    add-int v3, v0, p2

    aget-byte v3, p1, v3

    xor-int/2addr v2, v3

    int-to-byte v2, v2

    aput-byte v2, p4, v1

    .line 169
    iget v1, p0, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->index:I

    add-int/lit8 v1, v1, 0x1

    and-int/lit8 v1, v1, 0x3f

    iput v1, p0, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->index:I

    .line 157
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 171
    :cond_5
    return-void
.end method

.method public reset()V
    .locals 2

    .prologue
    .line 175
    iget-object v0, p0, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->workingKey:[B

    iget-object v1, p0, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->workingIV:[B

    invoke-direct {p0, v0, v1}, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->setKey([B[B)V

    .line 176
    return-void
.end method

.method public returnByte(B)B
    .locals 4
    .param p1, "in"    # B

    .prologue
    const/16 v3, 0x8

    .line 110
    invoke-direct {p0}, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->limitExceeded()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 112
    new-instance v1, Lorg/bouncycastle/crypto/MaxBytesExceededException;

    const-string v2, "2^70 byte limit per IV; Change IV"

    invoke-direct {v1, v2}, Lorg/bouncycastle/crypto/MaxBytesExceededException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 115
    :cond_0
    iget v1, p0, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->index:I

    if-nez v1, :cond_1

    .line 117
    iget-object v1, p0, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->engineState:[I

    iget-object v2, p0, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->keyStream:[B

    invoke-direct {p0, v1, v2}, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->salsa20WordToByte([I[B)V

    .line 118
    iget-object v1, p0, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->engineState:[I

    aget v2, v1, v3

    add-int/lit8 v2, v2, 0x1

    aput v2, v1, v3

    .line 119
    iget-object v1, p0, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->engineState:[I

    aget v1, v1, v3

    if-nez v1, :cond_1

    .line 121
    iget-object v1, p0, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->engineState:[I

    const/16 v2, 0x9

    aget v3, v1, v2

    add-int/lit8 v3, v3, 0x1

    aput v3, v1, v2

    .line 124
    :cond_1
    iget-object v1, p0, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->keyStream:[B

    iget v2, p0, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->index:I

    aget-byte v1, v1, v2

    xor-int/2addr v1, p1

    int-to-byte v0, v1

    .line 125
    .local v0, "out":B
    iget v1, p0, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->index:I

    add-int/lit8 v1, v1, 0x1

    and-int/lit8 v1, v1, 0x3f

    iput v1, p0, Lorg/bouncycastle/crypto/engines/Salsa20Engine;->index:I

    .line 127
    return v0
.end method
