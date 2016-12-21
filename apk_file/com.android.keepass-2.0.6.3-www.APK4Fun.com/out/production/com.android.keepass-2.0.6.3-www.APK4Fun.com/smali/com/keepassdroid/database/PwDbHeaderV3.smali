.class public Lcom/keepassdroid/database/PwDbHeaderV3;
.super Lcom/keepassdroid/database/PwDbHeader;
.source "PwDbHeaderV3.java"


# static fields
.field public static final BUF_SIZE:I = 0x7c

.field public static final DBSIG_2:I = -0x4ab4049b

.field public static final DBVER_DW:I = 0x30003

.field public static final FLAG_ARCFOUR:I = 0x4

.field public static final FLAG_RIJNDAEL:I = 0x2

.field public static final FLAG_SHA2:I = 0x1

.field public static final FLAG_TWOFISH:I = 0x8


# instance fields
.field public contentsHash:[B

.field public flags:I

.field public numEntries:I

.field public numGroups:I

.field public numKeyEncRounds:I

.field public signature1:I

.field public signature2:I

.field public version:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 112
    invoke-direct {p0}, Lcom/keepassdroid/database/PwDbHeader;-><init>()V

    .line 81
    const/16 v0, 0x20

    new-array v0, v0, [B

    iput-object v0, p0, Lcom/keepassdroid/database/PwDbHeaderV3;->contentsHash:[B

    .line 113
    const/16 v0, 0x10

    new-array v0, v0, [B

    iput-object v0, p0, Lcom/keepassdroid/database/PwDbHeaderV3;->masterSeed:[B

    .line 114
    return-void
.end method

.method public static compatibleHeaders(II)Z
    .locals 2
    .param p0, "one"    # I
    .param p1, "two"    # I

    .prologue
    .line 129
    and-int/lit16 v0, p0, -0x100

    and-int/lit16 v1, p1, -0x100

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static matchesHeader(II)Z
    .locals 1
    .param p0, "sig1"    # I
    .param p1, "sig2"    # I

    .prologue
    .line 117
    const v0, -0x655d26fd

    if-ne p0, v0, :cond_0

    const v0, -0x4ab4049b

    if-ne p1, v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method


# virtual methods
.method public loadFromFile([BI)V
    .locals 5
    .param p1, "buf"    # [B
    .param p2, "offset"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v4, 0x20

    const/16 v3, 0x10

    const/4 v2, 0x0

    .line 91
    add-int/lit8 v0, p2, 0x0

    invoke-static {p1, v0}, Lcom/keepassdroid/stream/LEDataInputStream;->readInt([BI)I

    move-result v0

    iput v0, p0, Lcom/keepassdroid/database/PwDbHeaderV3;->signature1:I

    .line 92
    add-int/lit8 v0, p2, 0x4

    invoke-static {p1, v0}, Lcom/keepassdroid/stream/LEDataInputStream;->readInt([BI)I

    move-result v0

    iput v0, p0, Lcom/keepassdroid/database/PwDbHeaderV3;->signature2:I

    .line 93
    add-int/lit8 v0, p2, 0x8

    invoke-static {p1, v0}, Lcom/keepassdroid/stream/LEDataInputStream;->readInt([BI)I

    move-result v0

    iput v0, p0, Lcom/keepassdroid/database/PwDbHeaderV3;->flags:I

    .line 94
    add-int/lit8 v0, p2, 0xc

    invoke-static {p1, v0}, Lcom/keepassdroid/stream/LEDataInputStream;->readInt([BI)I

    move-result v0

    iput v0, p0, Lcom/keepassdroid/database/PwDbHeaderV3;->version:I

    .line 96
    add-int/lit8 v0, p2, 0x10

    iget-object v1, p0, Lcom/keepassdroid/database/PwDbHeaderV3;->masterSeed:[B

    invoke-static {p1, v0, v1, v2, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 97
    add-int/lit8 v0, p2, 0x20

    iget-object v1, p0, Lcom/keepassdroid/database/PwDbHeaderV3;->encryptionIV:[B

    invoke-static {p1, v0, v1, v2, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 99
    add-int/lit8 v0, p2, 0x30

    invoke-static {p1, v0}, Lcom/keepassdroid/stream/LEDataInputStream;->readInt([BI)I

    move-result v0

    iput v0, p0, Lcom/keepassdroid/database/PwDbHeaderV3;->numGroups:I

    .line 100
    add-int/lit8 v0, p2, 0x34

    invoke-static {p1, v0}, Lcom/keepassdroid/stream/LEDataInputStream;->readInt([BI)I

    move-result v0

    iput v0, p0, Lcom/keepassdroid/database/PwDbHeaderV3;->numEntries:I

    .line 102
    add-int/lit8 v0, p2, 0x38

    iget-object v1, p0, Lcom/keepassdroid/database/PwDbHeaderV3;->contentsHash:[B

    invoke-static {p1, v0, v1, v2, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 104
    add-int/lit8 v0, p2, 0x58

    iget-object v1, p0, Lcom/keepassdroid/database/PwDbHeaderV3;->transformSeed:[B

    invoke-static {p1, v0, v1, v2, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 105
    add-int/lit8 v0, p2, 0x78

    invoke-static {p1, v0}, Lcom/keepassdroid/stream/LEDataInputStream;->readInt([BI)I

    move-result v0

    iput v0, p0, Lcom/keepassdroid/database/PwDbHeaderV3;->numKeyEncRounds:I

    .line 106
    iget v0, p0, Lcom/keepassdroid/database/PwDbHeaderV3;->numKeyEncRounds:I

    if-gez v0, :cond_0

    .line 108
    new-instance v0, Ljava/io/IOException;

    const-string v1, "Does not support more than 2147483647 rounds."

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 110
    :cond_0
    return-void
.end method

.method public matchesVersion()Z
    .locals 2

    .prologue
    .line 125
    iget v0, p0, Lcom/keepassdroid/database/PwDbHeaderV3;->version:I

    const v1, 0x30003

    invoke-static {v0, v1}, Lcom/keepassdroid/database/PwDbHeaderV3;->compatibleHeaders(II)Z

    move-result v0

    return v0
.end method
