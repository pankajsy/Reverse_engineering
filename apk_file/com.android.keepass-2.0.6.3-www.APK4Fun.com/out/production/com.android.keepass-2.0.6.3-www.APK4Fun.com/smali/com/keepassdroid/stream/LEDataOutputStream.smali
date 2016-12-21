.class public Lcom/keepassdroid/stream/LEDataOutputStream;
.super Ljava/io/OutputStream;
.source "LEDataOutputStream.java"


# instance fields
.field private baseStream:Ljava/io/OutputStream;


# direct methods
.method public constructor <init>(Ljava/io/OutputStream;)V
    .locals 0
    .param p1, "out"    # Ljava/io/OutputStream;

    .prologue
    .line 34
    invoke-direct {p0}, Ljava/io/OutputStream;-><init>()V

    .line 35
    iput-object p1, p0, Lcom/keepassdroid/stream/LEDataOutputStream;->baseStream:Ljava/io/OutputStream;

    .line 36
    return-void
.end method

.method public static writeInt(I[BI)V
    .locals 2
    .param p0, "val"    # I
    .param p1, "buf"    # [B
    .param p2, "offset"    # I

    .prologue
    .line 121
    add-int/lit8 v0, p2, 0x0

    and-int/lit16 v1, p0, 0xff

    int-to-byte v1, v1

    aput-byte v1, p1, v0

    .line 122
    add-int/lit8 v0, p2, 0x1

    ushr-int/lit8 v1, p0, 0x8

    and-int/lit16 v1, v1, 0xff

    int-to-byte v1, v1

    aput-byte v1, p1, v0

    .line 123
    add-int/lit8 v0, p2, 0x2

    ushr-int/lit8 v1, p0, 0x10

    and-int/lit16 v1, v1, 0xff

    int-to-byte v1, v1

    aput-byte v1, p1, v0

    .line 124
    add-int/lit8 v0, p2, 0x3

    ushr-int/lit8 v1, p0, 0x18

    and-int/lit16 v1, v1, 0xff

    int-to-byte v1, v1

    aput-byte v1, p1, v0

    .line 125
    return-void
.end method

.method public static writeIntBuf(I)[B
    .locals 2
    .param p0, "val"    # I

    .prologue
    .line 88
    const/4 v1, 0x4

    new-array v0, v1, [B

    .line 89
    .local v0, "buf":[B
    const/4 v1, 0x0

    invoke-static {p0, v0, v1}, Lcom/keepassdroid/stream/LEDataOutputStream;->writeInt(I[BI)V

    .line 91
    return-object v0
.end method

.method public static writeLong(J[BI)V
    .locals 6
    .param p0, "val"    # J
    .param p2, "buf"    # [B
    .param p3, "offset"    # I

    .prologue
    const-wide/16 v4, 0xff

    .line 134
    add-int/lit8 v0, p3, 0x0

    and-long v2, p0, v4

    long-to-int v1, v2

    int-to-byte v1, v1

    aput-byte v1, p2, v0

    .line 135
    add-int/lit8 v0, p3, 0x1

    const/16 v1, 0x8

    ushr-long v2, p0, v1

    and-long/2addr v2, v4

    long-to-int v1, v2

    int-to-byte v1, v1

    aput-byte v1, p2, v0

    .line 136
    add-int/lit8 v0, p3, 0x2

    const/16 v1, 0x10

    ushr-long v2, p0, v1

    and-long/2addr v2, v4

    long-to-int v1, v2

    int-to-byte v1, v1

    aput-byte v1, p2, v0

    .line 137
    add-int/lit8 v0, p3, 0x3

    const/16 v1, 0x18

    ushr-long v2, p0, v1

    and-long/2addr v2, v4

    long-to-int v1, v2

    int-to-byte v1, v1

    aput-byte v1, p2, v0

    .line 138
    add-int/lit8 v0, p3, 0x4

    const/16 v1, 0x20

    ushr-long v2, p0, v1

    and-long/2addr v2, v4

    long-to-int v1, v2

    int-to-byte v1, v1

    aput-byte v1, p2, v0

    .line 139
    add-int/lit8 v0, p3, 0x5

    const/16 v1, 0x28

    ushr-long v2, p0, v1

    and-long/2addr v2, v4

    long-to-int v1, v2

    int-to-byte v1, v1

    aput-byte v1, p2, v0

    .line 140
    add-int/lit8 v0, p3, 0x6

    const/16 v1, 0x30

    ushr-long v2, p0, v1

    and-long/2addr v2, v4

    long-to-int v1, v2

    int-to-byte v1, v1

    aput-byte v1, p2, v0

    .line 141
    add-int/lit8 v0, p3, 0x7

    const/16 v1, 0x38

    ushr-long v2, p0, v1

    and-long/2addr v2, v4

    long-to-int v1, v2

    int-to-byte v1, v1

    aput-byte v1, p2, v0

    .line 142
    return-void
.end method

.method public static writeLongBuf(J)[B
    .locals 2
    .param p0, "val"    # J

    .prologue
    .line 128
    const/16 v1, 0x8

    new-array v0, v1, [B

    .line 129
    .local v0, "buf":[B
    const/4 v1, 0x0

    invoke-static {p0, p1, v0, v1}, Lcom/keepassdroid/stream/LEDataOutputStream;->writeLong(J[BI)V

    .line 130
    return-object v0
.end method

.method public static writeUShort(I[BI)V
    .locals 2
    .param p0, "val"    # I
    .param p1, "buf"    # [B
    .param p2, "offset"    # I

    .prologue
    .line 109
    add-int/lit8 v0, p2, 0x0

    and-int/lit16 v1, p0, 0xff

    int-to-byte v1, v1

    aput-byte v1, p1, v0

    .line 110
    add-int/lit8 v0, p2, 0x1

    const v1, 0xff00

    and-int/2addr v1, p0

    shr-int/lit8 v1, v1, 0x8

    int-to-byte v1, v1

    aput-byte v1, p1, v0

    .line 111
    return-void
.end method

.method public static writeUShortBuf(I)[B
    .locals 2
    .param p0, "val"    # I

    .prologue
    .line 95
    const/4 v1, 0x2

    new-array v0, v1, [B

    .line 97
    .local v0, "buf":[B
    const/4 v1, 0x0

    invoke-static {p0, v0, v1}, Lcom/keepassdroid/stream/LEDataOutputStream;->writeUShort(I[BI)V

    .line 99
    return-object v0
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
    .line 44
    iget-object v0, p0, Lcom/keepassdroid/stream/LEDataOutputStream;->baseStream:Ljava/io/OutputStream;

    invoke-virtual {v0}, Ljava/io/OutputStream;->close()V

    .line 45
    return-void
.end method

.method public flush()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 49
    iget-object v0, p0, Lcom/keepassdroid/stream/LEDataOutputStream;->baseStream:Ljava/io/OutputStream;

    invoke-virtual {v0}, Ljava/io/OutputStream;->flush()V

    .line 50
    return-void
.end method

.method public write(I)V
    .locals 1
    .param p1, "oneByte"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 64
    iget-object v0, p0, Lcom/keepassdroid/stream/LEDataOutputStream;->baseStream:Ljava/io/OutputStream;

    invoke-virtual {v0, p1}, Ljava/io/OutputStream;->write(I)V

    .line 65
    return-void
.end method

.method public write([B)V
    .locals 1
    .param p1, "buffer"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 59
    iget-object v0, p0, Lcom/keepassdroid/stream/LEDataOutputStream;->baseStream:Ljava/io/OutputStream;

    invoke-virtual {v0, p1}, Ljava/io/OutputStream;->write([B)V

    .line 60
    return-void
.end method

.method public write([BII)V
    .locals 1
    .param p1, "buffer"    # [B
    .param p2, "offset"    # I
    .param p3, "count"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 54
    iget-object v0, p0, Lcom/keepassdroid/stream/LEDataOutputStream;->baseStream:Ljava/io/OutputStream;

    invoke-virtual {v0, p1, p2, p3}, Ljava/io/OutputStream;->write([BII)V

    .line 55
    return-void
.end method

.method public writeInt(I)V
    .locals 2
    .param p1, "val"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 75
    const/4 v1, 0x4

    new-array v0, v1, [B

    .line 76
    .local v0, "buf":[B
    const/4 v1, 0x0

    invoke-static {p1, v0, v1}, Lcom/keepassdroid/stream/LEDataOutputStream;->writeInt(I[BI)V

    .line 78
    iget-object v1, p0, Lcom/keepassdroid/stream/LEDataOutputStream;->baseStream:Ljava/io/OutputStream;

    invoke-virtual {v1, v0}, Ljava/io/OutputStream;->write([B)V

    .line 79
    return-void
.end method

.method public writeLong(J)V
    .locals 3
    .param p1, "val"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 68
    const/16 v1, 0x8

    new-array v0, v1, [B

    .line 70
    .local v0, "buf":[B
    const/4 v1, 0x0

    invoke-static {p1, p2, v0, v1}, Lcom/keepassdroid/stream/LEDataOutputStream;->writeLong(J[BI)V

    .line 71
    iget-object v1, p0, Lcom/keepassdroid/stream/LEDataOutputStream;->baseStream:Ljava/io/OutputStream;

    invoke-virtual {v1, v0}, Ljava/io/OutputStream;->write([B)V

    .line 72
    return-void
.end method

.method public writeUInt(J)V
    .locals 3
    .param p1, "uint"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 39
    iget-object v0, p0, Lcom/keepassdroid/stream/LEDataOutputStream;->baseStream:Ljava/io/OutputStream;

    long-to-int v1, p1

    invoke-static {v1}, Lcom/keepassdroid/stream/LEDataOutputStream;->writeIntBuf(I)[B

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/OutputStream;->write([B)V

    .line 40
    return-void
.end method

.method public writeUShort(I)V
    .locals 2
    .param p1, "val"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 82
    const/4 v1, 0x2

    new-array v0, v1, [B

    .line 83
    .local v0, "buf":[B
    const/4 v1, 0x0

    invoke-static {p1, v0, v1}, Lcom/keepassdroid/stream/LEDataOutputStream;->writeUShort(I[BI)V

    .line 84
    iget-object v1, p0, Lcom/keepassdroid/stream/LEDataOutputStream;->baseStream:Ljava/io/OutputStream;

    invoke-virtual {v1, v0}, Ljava/io/OutputStream;->write([B)V

    .line 85
    return-void
.end method
