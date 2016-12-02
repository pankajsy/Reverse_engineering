.class public Lcom/keepassdroid/stream/HashedBlockInputStream;
.super Ljava/io/InputStream;
.source "HashedBlockInputStream.java"


# static fields
.field private static final HASH_SIZE:I = 0x20


# instance fields
.field private atEnd:Z

.field private baseStream:Lcom/keepassdroid/stream/LEDataInputStream;

.field private buffer:[B

.field private bufferIndex:J

.field private bufferPos:I


# direct methods
.method public constructor <init>(Ljava/io/InputStream;)V
    .locals 3
    .param p1, "is"    # Ljava/io/InputStream;

    .prologue
    const/4 v2, 0x0

    .line 47
    invoke-direct {p0}, Ljava/io/InputStream;-><init>()V

    .line 36
    iput v2, p0, Lcom/keepassdroid/stream/HashedBlockInputStream;->bufferPos:I

    .line 37
    new-array v0, v2, [B

    iput-object v0, p0, Lcom/keepassdroid/stream/HashedBlockInputStream;->buffer:[B

    .line 38
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/keepassdroid/stream/HashedBlockInputStream;->bufferIndex:J

    .line 39
    iput-boolean v2, p0, Lcom/keepassdroid/stream/HashedBlockInputStream;->atEnd:Z

    .line 48
    new-instance v0, Lcom/keepassdroid/stream/LEDataInputStream;

    invoke-direct {v0, p1}, Lcom/keepassdroid/stream/LEDataInputStream;-><init>(Ljava/io/InputStream;)V

    iput-object v0, p0, Lcom/keepassdroid/stream/HashedBlockInputStream;->baseStream:Lcom/keepassdroid/stream/LEDataInputStream;

    .line 49
    return-void
.end method

.method private ReadHashedBlock()Z
    .locals 15
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v9, 0x1

    const/16 v14, 0x20

    const/4 v8, 0x0

    .line 85
    iget-boolean v10, p0, Lcom/keepassdroid/stream/HashedBlockInputStream;->atEnd:Z

    if-eqz v10, :cond_0

    .line 138
    :goto_0
    return v8

    .line 87
    :cond_0
    iput v8, p0, Lcom/keepassdroid/stream/HashedBlockInputStream;->bufferPos:I

    .line 89
    iget-object v10, p0, Lcom/keepassdroid/stream/HashedBlockInputStream;->baseStream:Lcom/keepassdroid/stream/LEDataInputStream;

    invoke-virtual {v10}, Lcom/keepassdroid/stream/LEDataInputStream;->readUInt()J

    move-result-wide v4

    .line 90
    .local v4, "index":J
    iget-wide v10, p0, Lcom/keepassdroid/stream/HashedBlockInputStream;->bufferIndex:J

    cmp-long v10, v4, v10

    if-eqz v10, :cond_1

    .line 91
    new-instance v8, Ljava/io/IOException;

    const-string v9, "Invalid data format"

    invoke-direct {v8, v9}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v8

    .line 93
    :cond_1
    iget-wide v10, p0, Lcom/keepassdroid/stream/HashedBlockInputStream;->bufferIndex:J

    const-wide/16 v12, 0x1

    add-long/2addr v10, v12

    iput-wide v10, p0, Lcom/keepassdroid/stream/HashedBlockInputStream;->bufferIndex:J

    .line 95
    iget-object v10, p0, Lcom/keepassdroid/stream/HashedBlockInputStream;->baseStream:Lcom/keepassdroid/stream/LEDataInputStream;

    invoke-virtual {v10, v14}, Lcom/keepassdroid/stream/LEDataInputStream;->readBytes(I)[B

    move-result-object v7

    .line 96
    .local v7, "storedHash":[B
    if-eqz v7, :cond_2

    array-length v10, v7

    if-eq v10, v14, :cond_3

    .line 97
    :cond_2
    new-instance v8, Ljava/io/IOException;

    const-string v9, "Invalid data format"

    invoke-direct {v8, v9}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v8

    .line 100
    :cond_3
    iget-object v10, p0, Lcom/keepassdroid/stream/HashedBlockInputStream;->baseStream:Lcom/keepassdroid/stream/LEDataInputStream;

    invoke-static {v10}, Lcom/keepassdroid/stream/LEDataInputStream;->readInt(Ljava/io/InputStream;)I

    move-result v0

    .line 101
    .local v0, "bufferSize":I
    if-gez v0, :cond_4

    .line 102
    new-instance v8, Ljava/io/IOException;

    const-string v9, "Invalid data format"

    invoke-direct {v8, v9}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v8

    .line 105
    :cond_4
    if-nez v0, :cond_7

    .line 106
    const/4 v3, 0x0

    .local v3, "hash":I
    :goto_1
    if-ge v3, v14, :cond_6

    .line 107
    aget-byte v10, v7, v3

    if-eqz v10, :cond_5

    .line 108
    new-instance v8, Ljava/io/IOException;

    const-string v9, "Invalid data format"

    invoke-direct {v8, v9}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v8

    .line 106
    :cond_5
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 112
    :cond_6
    iput-boolean v9, p0, Lcom/keepassdroid/stream/HashedBlockInputStream;->atEnd:Z

    .line 113
    new-array v9, v8, [B

    iput-object v9, p0, Lcom/keepassdroid/stream/HashedBlockInputStream;->buffer:[B

    goto :goto_0

    .line 117
    .end local v3    # "hash":I
    :cond_7
    iget-object v8, p0, Lcom/keepassdroid/stream/HashedBlockInputStream;->baseStream:Lcom/keepassdroid/stream/LEDataInputStream;

    invoke-virtual {v8, v0}, Lcom/keepassdroid/stream/LEDataInputStream;->readBytes(I)[B

    move-result-object v8

    iput-object v8, p0, Lcom/keepassdroid/stream/HashedBlockInputStream;->buffer:[B

    .line 118
    iget-object v8, p0, Lcom/keepassdroid/stream/HashedBlockInputStream;->buffer:[B

    if-eqz v8, :cond_8

    iget-object v8, p0, Lcom/keepassdroid/stream/HashedBlockInputStream;->buffer:[B

    array-length v8, v8

    if-eq v8, v0, :cond_9

    .line 119
    :cond_8
    new-instance v8, Ljava/io/IOException;

    const-string v9, "Invalid data format"

    invoke-direct {v8, v9}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v8

    .line 122
    :cond_9
    const/4 v6, 0x0

    .line 124
    .local v6, "md":Ljava/security/MessageDigest;
    :try_start_0
    const-string v8, "SHA-256"

    invoke-static {v8}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;
    :try_end_0
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v6

    .line 129
    iget-object v8, p0, Lcom/keepassdroid/stream/HashedBlockInputStream;->buffer:[B

    invoke-virtual {v6, v8}, Ljava/security/MessageDigest;->digest([B)[B

    move-result-object v1

    .line 130
    .local v1, "computedHash":[B
    if-eqz v1, :cond_a

    array-length v8, v1

    if-eq v8, v14, :cond_b

    .line 131
    :cond_a
    new-instance v8, Ljava/io/IOException;

    const-string v9, "Hash wrong size"

    invoke-direct {v8, v9}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v8

    .line 125
    .end local v1    # "computedHash":[B
    :catch_0
    move-exception v2

    .line 126
    .local v2, "e":Ljava/security/NoSuchAlgorithmException;
    new-instance v8, Ljava/io/IOException;

    const-string v9, "SHA-256 not implemented here."

    invoke-direct {v8, v9}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v8

    .line 134
    .end local v2    # "e":Ljava/security/NoSuchAlgorithmException;
    .restart local v1    # "computedHash":[B
    :cond_b
    invoke-static {v7, v1}, Ljava/util/Arrays;->equals([B[B)Z

    move-result v8

    if-nez v8, :cond_c

    .line 135
    new-instance v8, Ljava/io/IOException;

    const-string v9, "Hashes didn\'t match."

    invoke-direct {v8, v9}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v8

    :cond_c
    move v8, v9

    .line 138
    goto/16 :goto_0
.end method


# virtual methods
.method public close()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 162
    iget-object v0, p0, Lcom/keepassdroid/stream/HashedBlockInputStream;->baseStream:Lcom/keepassdroid/stream/LEDataInputStream;

    invoke-virtual {v0}, Lcom/keepassdroid/stream/LEDataInputStream;->close()V

    .line 163
    return-void
.end method

.method public read()I
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v0, -0x1

    .line 148
    iget-boolean v1, p0, Lcom/keepassdroid/stream/HashedBlockInputStream;->atEnd:Z

    if-eqz v1, :cond_1

    .line 157
    :cond_0
    :goto_0
    return v0

    .line 150
    :cond_1
    iget v1, p0, Lcom/keepassdroid/stream/HashedBlockInputStream;->bufferPos:I

    iget-object v2, p0, Lcom/keepassdroid/stream/HashedBlockInputStream;->buffer:[B

    array-length v2, v2

    if-ne v1, v2, :cond_2

    .line 151
    invoke-direct {p0}, Lcom/keepassdroid/stream/HashedBlockInputStream;->ReadHashedBlock()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 154
    :cond_2
    iget-object v1, p0, Lcom/keepassdroid/stream/HashedBlockInputStream;->buffer:[B

    iget v2, p0, Lcom/keepassdroid/stream/HashedBlockInputStream;->bufferPos:I

    invoke-static {v1, v2}, Lcom/keepassdroid/utils/Types;->readUByte([BI)I

    move-result v0

    .line 155
    .local v0, "output":I
    iget v1, p0, Lcom/keepassdroid/stream/HashedBlockInputStream;->bufferPos:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/keepassdroid/stream/HashedBlockInputStream;->bufferPos:I

    goto :goto_0
.end method

.method public read([B)I
    .locals 2
    .param p1, "b"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 44
    const/4 v0, 0x0

    array-length v1, p1

    invoke-virtual {p0, p1, v0, v1}, Lcom/keepassdroid/stream/HashedBlockInputStream;->read([BII)I

    move-result v0

    return v0
.end method

.method public read([BII)I
    .locals 4
    .param p1, "b"    # [B
    .param p2, "offset"    # I
    .param p3, "length"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 53
    iget-boolean v2, p0, Lcom/keepassdroid/stream/HashedBlockInputStream;->atEnd:Z

    if-eqz v2, :cond_1

    const/4 p3, -0x1

    .line 77
    .end local p3    # "length":I
    :cond_0
    :goto_0
    return p3

    .line 55
    .restart local p3    # "length":I
    :cond_1
    move v1, p3

    .line 57
    .local v1, "remaining":I
    :goto_1
    if-lez v1, :cond_0

    .line 58
    iget v2, p0, Lcom/keepassdroid/stream/HashedBlockInputStream;->bufferPos:I

    iget-object v3, p0, Lcom/keepassdroid/stream/HashedBlockInputStream;->buffer:[B

    array-length v3, v3

    if-ne v2, v3, :cond_2

    .line 60
    invoke-direct {p0}, Lcom/keepassdroid/stream/HashedBlockInputStream;->ReadHashedBlock()Z

    move-result v2

    if-nez v2, :cond_2

    .line 61
    sub-int/2addr p3, v1

    goto :goto_0

    .line 67
    :cond_2
    iget-object v2, p0, Lcom/keepassdroid/stream/HashedBlockInputStream;->buffer:[B

    array-length v2, v2

    iget v3, p0, Lcom/keepassdroid/stream/HashedBlockInputStream;->bufferPos:I

    sub-int/2addr v2, v3

    invoke-static {v2, v1}, Ljava/lang/Math;->min(II)I

    move-result v0

    .line 69
    .local v0, "copyLen":I
    iget-object v2, p0, Lcom/keepassdroid/stream/HashedBlockInputStream;->buffer:[B

    iget v3, p0, Lcom/keepassdroid/stream/HashedBlockInputStream;->bufferPos:I

    invoke-static {v2, v3, p1, p2, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 71
    add-int/2addr p2, v0

    .line 72
    iget v2, p0, Lcom/keepassdroid/stream/HashedBlockInputStream;->bufferPos:I

    add-int/2addr v2, v0

    iput v2, p0, Lcom/keepassdroid/stream/HashedBlockInputStream;->bufferPos:I

    .line 74
    sub-int/2addr v1, v0

    .line 75
    goto :goto_1
.end method

.method public skip(J)J
    .locals 2
    .param p1, "n"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 143
    const-wide/16 v0, 0x0

    return-wide v0
.end method
