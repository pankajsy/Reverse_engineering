.class public Lcom/keepassdroid/stream/LEDataInputStream;
.super Ljava/io/InputStream;
.source "LEDataInputStream.java"


# static fields
.field public static final INT_TO_LONG_MASK:J = 0xffffffffL


# instance fields
.field private baseStream:Ljava/io/InputStream;


# direct methods
.method public constructor <init>(Ljava/io/InputStream;)V
    .locals 0
    .param p1, "in"    # Ljava/io/InputStream;

    .prologue
    .line 36
    invoke-direct {p0}, Ljava/io/InputStream;-><init>()V

    .line 37
    iput-object p1, p0, Lcom/keepassdroid/stream/LEDataInputStream;->baseStream:Ljava/io/InputStream;

    .line 38
    return-void
.end method

.method public static readInt(Ljava/io/InputStream;)I
    .locals 3
    .param p0, "is"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x4

    const/4 v1, 0x0

    .line 161
    new-array v0, v2, [B

    .line 163
    .local v0, "buf":[B
    invoke-virtual {p0, v0, v1, v2}, Ljava/io/InputStream;->read([BII)I

    .line 165
    invoke-static {v0, v1}, Lcom/keepassdroid/stream/LEDataInputStream;->readInt([BI)I

    move-result v1

    return v1
.end method

.method public static readInt([BI)I
    .locals 2
    .param p0, "buf"    # [B
    .param p1, "offset"    # I

    .prologue
    .line 180
    add-int/lit8 v0, p1, 0x0

    aget-byte v0, p0, v0

    and-int/lit16 v0, v0, 0xff

    add-int/lit8 v1, p1, 0x1

    aget-byte v1, p0, v1

    and-int/lit16 v1, v1, 0xff

    shl-int/lit8 v1, v1, 0x8

    add-int/2addr v0, v1

    add-int/lit8 v1, p1, 0x2

    aget-byte v1, p0, v1

    and-int/lit16 v1, v1, 0xff

    shl-int/lit8 v1, v1, 0x10

    add-int/2addr v0, v1

    add-int/lit8 v1, p1, 0x3

    aget-byte v1, p0, v1

    and-int/lit16 v1, v1, 0xff

    shl-int/lit8 v1, v1, 0x18

    add-int/2addr v0, v1

    return v0
.end method

.method public static readLong([BI)J
    .locals 8
    .param p0, "buf"    # [B
    .param p1, "offset"    # I

    .prologue
    const-wide/16 v6, 0xff

    .line 150
    add-int/lit8 v0, p1, 0x0

    aget-byte v0, p0, v0

    int-to-long v0, v0

    and-long/2addr v0, v6

    add-int/lit8 v2, p1, 0x1

    aget-byte v2, p0, v2

    int-to-long v2, v2

    and-long/2addr v2, v6

    const/16 v4, 0x8

    shl-long/2addr v2, v4

    add-long/2addr v0, v2

    add-int/lit8 v2, p1, 0x2

    aget-byte v2, p0, v2

    int-to-long v2, v2

    and-long/2addr v2, v6

    const/16 v4, 0x10

    shl-long/2addr v2, v4

    add-long/2addr v0, v2

    add-int/lit8 v2, p1, 0x3

    aget-byte v2, p0, v2

    int-to-long v2, v2

    and-long/2addr v2, v6

    const/16 v4, 0x18

    shl-long/2addr v2, v4

    add-long/2addr v0, v2

    add-int/lit8 v2, p1, 0x4

    aget-byte v2, p0, v2

    int-to-long v2, v2

    and-long/2addr v2, v6

    const/16 v4, 0x20

    shl-long/2addr v2, v4

    add-long/2addr v0, v2

    add-int/lit8 v2, p1, 0x5

    aget-byte v2, p0, v2

    int-to-long v2, v2

    and-long/2addr v2, v6

    const/16 v4, 0x28

    shl-long/2addr v2, v4

    add-long/2addr v0, v2

    add-int/lit8 v2, p1, 0x6

    aget-byte v2, p0, v2

    int-to-long v2, v2

    and-long/2addr v2, v6

    const/16 v4, 0x30

    shl-long/2addr v2, v4

    add-long/2addr v0, v2

    add-int/lit8 v2, p1, 0x7

    aget-byte v2, p0, v2

    int-to-long v2, v2

    and-long/2addr v2, v6

    const/16 v4, 0x38

    shl-long/2addr v2, v4

    add-long/2addr v0, v2

    return-wide v0
.end method

.method public static readUInt(Ljava/io/InputStream;)J
    .locals 4
    .param p0, "is"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 169
    invoke-static {p0}, Lcom/keepassdroid/stream/LEDataInputStream;->readInt(Ljava/io/InputStream;)I

    move-result v0

    int-to-long v0, v0

    const-wide v2, 0xffffffffL

    and-long/2addr v0, v2

    return-wide v0
.end method

.method public static readUInt([BI)J
    .locals 4
    .param p0, "buf"    # [B
    .param p1, "offset"    # I

    .prologue
    .line 157
    invoke-static {p0, p1}, Lcom/keepassdroid/stream/LEDataInputStream;->readInt([BI)I

    move-result v0

    int-to-long v0, v0

    const-wide v2, 0xffffffffL

    and-long/2addr v0, v2

    return-wide v0
.end method

.method public static readUShort(Ljava/io/InputStream;)I
    .locals 3
    .param p0, "is"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x2

    const/4 v1, 0x0

    .line 127
    new-array v0, v2, [B

    .line 129
    .local v0, "buf":[B
    invoke-virtual {p0, v0, v1, v2}, Ljava/io/InputStream;->read([BII)I

    .line 131
    invoke-static {v0, v1}, Lcom/keepassdroid/stream/LEDataInputStream;->readUShort([BI)I

    move-result v1

    return v1
.end method

.method public static readUShort([BI)I
    .locals 2
    .param p0, "buf"    # [B
    .param p1, "offset"    # I

    .prologue
    .line 146
    add-int/lit8 v0, p1, 0x0

    aget-byte v0, p0, v0

    and-int/lit16 v0, v0, 0xff

    add-int/lit8 v1, p1, 0x1

    aget-byte v1, p0, v1

    and-int/lit16 v1, v1, 0xff

    shl-int/lit8 v1, v1, 0x8

    add-int/2addr v0, v1

    return v0
.end method


# virtual methods
.method public available()I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 61
    iget-object v0, p0, Lcom/keepassdroid/stream/LEDataInputStream;->baseStream:Ljava/io/InputStream;

    invoke-virtual {v0}, Ljava/io/InputStream;->available()I

    move-result v0

    return v0
.end method

.method public close()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 66
    iget-object v0, p0, Lcom/keepassdroid/stream/LEDataInputStream;->baseStream:Ljava/io/InputStream;

    invoke-virtual {v0}, Ljava/io/InputStream;->close()V

    .line 67
    return-void
.end method

.method public mark(I)V
    .locals 1
    .param p1, "readlimit"    # I

    .prologue
    .line 71
    iget-object v0, p0, Lcom/keepassdroid/stream/LEDataInputStream;->baseStream:Ljava/io/InputStream;

    invoke-virtual {v0, p1}, Ljava/io/InputStream;->mark(I)V

    .line 72
    return-void
.end method

.method public markSupported()Z
    .locals 1

    .prologue
    .line 76
    iget-object v0, p0, Lcom/keepassdroid/stream/LEDataInputStream;->baseStream:Ljava/io/InputStream;

    invoke-virtual {v0}, Ljava/io/InputStream;->markSupported()Z

    move-result v0

    return v0
.end method

.method public read()I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 81
    iget-object v0, p0, Lcom/keepassdroid/stream/LEDataInputStream;->baseStream:Ljava/io/InputStream;

    invoke-virtual {v0}, Ljava/io/InputStream;->read()I

    move-result v0

    return v0
.end method

.method public read([B)I
    .locals 1
    .param p1, "b"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 92
    invoke-super {p0, p1}, Ljava/io/InputStream;->read([B)I

    move-result v0

    return v0
.end method

.method public read([BII)I
    .locals 1
    .param p1, "b"    # [B
    .param p2, "offset"    # I
    .param p3, "length"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 86
    iget-object v0, p0, Lcom/keepassdroid/stream/LEDataInputStream;->baseStream:Ljava/io/InputStream;

    invoke-virtual {v0, p1, p2, p3}, Ljava/io/InputStream;->read([BII)I

    move-result v0

    return v0
.end method

.method public readBytes(I)[B
    .locals 6
    .param p1, "length"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v5, 0x0

    .line 106
    new-array v0, p1, [B

    .line 108
    .local v0, "buf":[B
    const/4 v1, 0x0

    .line 109
    .local v1, "count":I
    :goto_0
    if-ge v1, p1, :cond_1

    .line 110
    sub-int v4, p1, v1

    invoke-virtual {p0, v0, v1, v4}, Lcom/keepassdroid/stream/LEDataInputStream;->read([BII)I

    move-result v3

    .line 113
    .local v3, "read":I
    const/4 v4, -0x1

    if-ne v3, v4, :cond_0

    .line 115
    new-array v2, v1, [B

    .line 116
    .local v2, "early":[B
    invoke-static {v0, v5, v2, v5, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 123
    .end local v2    # "early":[B
    .end local v3    # "read":I
    :goto_1
    return-object v2

    .line 120
    .restart local v3    # "read":I
    :cond_0
    add-int/2addr v1, v3

    .line 121
    goto :goto_0

    .end local v3    # "read":I
    :cond_1
    move-object v2, v0

    .line 123
    goto :goto_1
.end method

.method public readInt()I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 50
    iget-object v0, p0, Lcom/keepassdroid/stream/LEDataInputStream;->baseStream:Ljava/io/InputStream;

    invoke-static {v0}, Lcom/keepassdroid/stream/LEDataInputStream;->readInt(Ljava/io/InputStream;)I

    move-result v0

    return v0
.end method

.method public readLong()J
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 54
    const/16 v1, 0x8

    invoke-virtual {p0, v1}, Lcom/keepassdroid/stream/LEDataInputStream;->readBytes(I)[B

    move-result-object v0

    .line 56
    .local v0, "buf":[B
    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/keepassdroid/stream/LEDataInputStream;->readLong([BI)J

    move-result-wide v2

    return-wide v2
.end method

.method public readUInt()J
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 46
    iget-object v0, p0, Lcom/keepassdroid/stream/LEDataInputStream;->baseStream:Ljava/io/InputStream;

    invoke-static {v0}, Lcom/keepassdroid/stream/LEDataInputStream;->readUInt(Ljava/io/InputStream;)J

    move-result-wide v0

    return-wide v0
.end method

.method public readUShort()I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 135
    iget-object v0, p0, Lcom/keepassdroid/stream/LEDataInputStream;->baseStream:Ljava/io/InputStream;

    invoke-static {v0}, Lcom/keepassdroid/stream/LEDataInputStream;->readUShort(Ljava/io/InputStream;)I

    move-result v0

    return v0
.end method

.method public declared-synchronized reset()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 97
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/keepassdroid/stream/LEDataInputStream;->baseStream:Ljava/io/InputStream;

    invoke-virtual {v0}, Ljava/io/InputStream;->reset()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 98
    monitor-exit p0

    return-void

    .line 97
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public skip(J)J
    .locals 3
    .param p1, "n"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 102
    iget-object v0, p0, Lcom/keepassdroid/stream/LEDataInputStream;->baseStream:Ljava/io/InputStream;

    invoke-virtual {v0, p1, p2}, Ljava/io/InputStream;->skip(J)J

    move-result-wide v0

    return-wide v0
.end method
