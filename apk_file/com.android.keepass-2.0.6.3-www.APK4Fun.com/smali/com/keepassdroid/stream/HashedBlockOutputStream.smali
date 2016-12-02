.class public Lcom/keepassdroid/stream/HashedBlockOutputStream;
.super Ljava/io/OutputStream;
.source "HashedBlockOutputStream.java"


# static fields
.field private static final DEFAULT_BUFFER_SIZE:I = 0x100000


# instance fields
.field private baseStream:Lcom/keepassdroid/stream/LEDataOutputStream;

.field private buffer:[B

.field private bufferIndex:J

.field private bufferPos:I


# direct methods
.method public constructor <init>(Ljava/io/OutputStream;)V
    .locals 2
    .param p1, "os"    # Ljava/io/OutputStream;

    .prologue
    .line 36
    invoke-direct {p0}, Ljava/io/OutputStream;-><init>()V

    .line 32
    const/4 v0, 0x0

    iput v0, p0, Lcom/keepassdroid/stream/HashedBlockOutputStream;->bufferPos:I

    .line 34
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/keepassdroid/stream/HashedBlockOutputStream;->bufferIndex:J

    .line 37
    const/high16 v0, 0x100000

    invoke-direct {p0, p1, v0}, Lcom/keepassdroid/stream/HashedBlockOutputStream;->init(Ljava/io/OutputStream;I)V

    .line 38
    return-void
.end method

.method public constructor <init>(Ljava/io/OutputStream;I)V
    .locals 2
    .param p1, "os"    # Ljava/io/OutputStream;
    .param p2, "bufferSize"    # I

    .prologue
    .line 40
    invoke-direct {p0}, Ljava/io/OutputStream;-><init>()V

    .line 32
    const/4 v0, 0x0

    iput v0, p0, Lcom/keepassdroid/stream/HashedBlockOutputStream;->bufferPos:I

    .line 34
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/keepassdroid/stream/HashedBlockOutputStream;->bufferIndex:J

    .line 41
    if-gtz p2, :cond_0

    .line 42
    const/high16 p2, 0x100000

    .line 45
    :cond_0
    invoke-direct {p0, p1, p2}, Lcom/keepassdroid/stream/HashedBlockOutputStream;->init(Ljava/io/OutputStream;I)V

    .line 46
    return-void
.end method

.method private WriteHashedBlock()V
    .locals 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v10, 0x0

    const-wide/16 v8, 0x0

    .line 99
    iget-object v3, p0, Lcom/keepassdroid/stream/HashedBlockOutputStream;->baseStream:Lcom/keepassdroid/stream/LEDataOutputStream;

    iget-wide v4, p0, Lcom/keepassdroid/stream/HashedBlockOutputStream;->bufferIndex:J

    invoke-virtual {v3, v4, v5}, Lcom/keepassdroid/stream/LEDataOutputStream;->writeUInt(J)V

    .line 100
    iget-wide v4, p0, Lcom/keepassdroid/stream/HashedBlockOutputStream;->bufferIndex:J

    const-wide/16 v6, 0x1

    add-long/2addr v4, v6

    iput-wide v4, p0, Lcom/keepassdroid/stream/HashedBlockOutputStream;->bufferIndex:J

    .line 102
    iget v3, p0, Lcom/keepassdroid/stream/HashedBlockOutputStream;->bufferPos:I

    if-lez v3, :cond_1

    .line 103
    const/4 v2, 0x0

    .line 105
    .local v2, "md":Ljava/security/MessageDigest;
    :try_start_0
    const-string v3, "SHA-256"

    invoke-static {v3}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;
    :try_end_0
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    .line 111
    iget-object v3, p0, Lcom/keepassdroid/stream/HashedBlockOutputStream;->buffer:[B

    iget v4, p0, Lcom/keepassdroid/stream/HashedBlockOutputStream;->bufferPos:I

    invoke-virtual {v2, v3, v10, v4}, Ljava/security/MessageDigest;->update([BII)V

    .line 112
    invoke-virtual {v2}, Ljava/security/MessageDigest;->digest()[B

    move-result-object v1

    .line 123
    .local v1, "hash":[B
    iget-object v3, p0, Lcom/keepassdroid/stream/HashedBlockOutputStream;->baseStream:Lcom/keepassdroid/stream/LEDataOutputStream;

    invoke-virtual {v3, v1}, Lcom/keepassdroid/stream/LEDataOutputStream;->write([B)V

    .line 133
    .end local v1    # "hash":[B
    .end local v2    # "md":Ljava/security/MessageDigest;
    :goto_0
    iget-object v3, p0, Lcom/keepassdroid/stream/HashedBlockOutputStream;->baseStream:Lcom/keepassdroid/stream/LEDataOutputStream;

    iget v4, p0, Lcom/keepassdroid/stream/HashedBlockOutputStream;->bufferPos:I

    invoke-virtual {v3, v4}, Lcom/keepassdroid/stream/LEDataOutputStream;->writeInt(I)V

    .line 135
    iget v3, p0, Lcom/keepassdroid/stream/HashedBlockOutputStream;->bufferPos:I

    if-lez v3, :cond_0

    .line 136
    iget-object v3, p0, Lcom/keepassdroid/stream/HashedBlockOutputStream;->baseStream:Lcom/keepassdroid/stream/LEDataOutputStream;

    iget-object v4, p0, Lcom/keepassdroid/stream/HashedBlockOutputStream;->buffer:[B

    iget v5, p0, Lcom/keepassdroid/stream/HashedBlockOutputStream;->bufferPos:I

    invoke-virtual {v3, v4, v10, v5}, Lcom/keepassdroid/stream/LEDataOutputStream;->write([BII)V

    .line 139
    :cond_0
    iput v10, p0, Lcom/keepassdroid/stream/HashedBlockOutputStream;->bufferPos:I

    .line 141
    return-void

    .line 106
    .restart local v2    # "md":Ljava/security/MessageDigest;
    :catch_0
    move-exception v0

    .line 107
    .local v0, "e":Ljava/security/NoSuchAlgorithmException;
    new-instance v3, Ljava/io/IOException;

    const-string v4, "SHA-256 not implemented here."

    invoke-direct {v3, v4}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 127
    .end local v0    # "e":Ljava/security/NoSuchAlgorithmException;
    .end local v2    # "md":Ljava/security/MessageDigest;
    :cond_1
    iget-object v3, p0, Lcom/keepassdroid/stream/HashedBlockOutputStream;->baseStream:Lcom/keepassdroid/stream/LEDataOutputStream;

    invoke-virtual {v3, v8, v9}, Lcom/keepassdroid/stream/LEDataOutputStream;->writeLong(J)V

    .line 128
    iget-object v3, p0, Lcom/keepassdroid/stream/HashedBlockOutputStream;->baseStream:Lcom/keepassdroid/stream/LEDataOutputStream;

    invoke-virtual {v3, v8, v9}, Lcom/keepassdroid/stream/LEDataOutputStream;->writeLong(J)V

    .line 129
    iget-object v3, p0, Lcom/keepassdroid/stream/HashedBlockOutputStream;->baseStream:Lcom/keepassdroid/stream/LEDataOutputStream;

    invoke-virtual {v3, v8, v9}, Lcom/keepassdroid/stream/LEDataOutputStream;->writeLong(J)V

    .line 130
    iget-object v3, p0, Lcom/keepassdroid/stream/HashedBlockOutputStream;->baseStream:Lcom/keepassdroid/stream/LEDataOutputStream;

    invoke-virtual {v3, v8, v9}, Lcom/keepassdroid/stream/LEDataOutputStream;->writeLong(J)V

    goto :goto_0
.end method

.method private init(Ljava/io/OutputStream;I)V
    .locals 1
    .param p1, "os"    # Ljava/io/OutputStream;
    .param p2, "bufferSize"    # I

    .prologue
    .line 49
    new-instance v0, Lcom/keepassdroid/stream/LEDataOutputStream;

    invoke-direct {v0, p1}, Lcom/keepassdroid/stream/LEDataOutputStream;-><init>(Ljava/io/OutputStream;)V

    iput-object v0, p0, Lcom/keepassdroid/stream/HashedBlockOutputStream;->baseStream:Lcom/keepassdroid/stream/LEDataOutputStream;

    .line 50
    new-array v0, p2, [B

    iput-object v0, p0, Lcom/keepassdroid/stream/HashedBlockOutputStream;->buffer:[B

    .line 52
    return-void
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
    .line 63
    iget v0, p0, Lcom/keepassdroid/stream/HashedBlockOutputStream;->bufferPos:I

    if-eqz v0, :cond_0

    .line 65
    invoke-direct {p0}, Lcom/keepassdroid/stream/HashedBlockOutputStream;->WriteHashedBlock()V

    .line 69
    :cond_0
    invoke-direct {p0}, Lcom/keepassdroid/stream/HashedBlockOutputStream;->WriteHashedBlock()V

    .line 71
    invoke-virtual {p0}, Lcom/keepassdroid/stream/HashedBlockOutputStream;->flush()V

    .line 72
    iget-object v0, p0, Lcom/keepassdroid/stream/HashedBlockOutputStream;->baseStream:Lcom/keepassdroid/stream/LEDataOutputStream;

    invoke-virtual {v0}, Lcom/keepassdroid/stream/LEDataOutputStream;->close()V

    .line 73
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
    .line 77
    iget-object v0, p0, Lcom/keepassdroid/stream/HashedBlockOutputStream;->baseStream:Lcom/keepassdroid/stream/LEDataOutputStream;

    invoke-virtual {v0}, Lcom/keepassdroid/stream/LEDataOutputStream;->flush()V

    .line 78
    return-void
.end method

.method public write(I)V
    .locals 4
    .param p1, "oneByte"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 56
    new-array v0, v3, [B

    .line 57
    .local v0, "buf":[B
    int-to-byte v1, p1

    aput-byte v1, v0, v2

    .line 58
    invoke-virtual {p0, v0, v2, v3}, Lcom/keepassdroid/stream/HashedBlockOutputStream;->write([BII)V

    .line 59
    return-void
.end method

.method public write([B)V
    .locals 2
    .param p1, "buffer"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 145
    const/4 v0, 0x0

    array-length v1, p1

    invoke-virtual {p0, p1, v0, v1}, Lcom/keepassdroid/stream/HashedBlockOutputStream;->write([BII)V

    .line 146
    return-void
.end method

.method public write([BII)V
    .locals 3
    .param p1, "b"    # [B
    .param p2, "offset"    # I
    .param p3, "count"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 82
    :goto_0
    if-lez p3, :cond_1

    .line 83
    iget v1, p0, Lcom/keepassdroid/stream/HashedBlockOutputStream;->bufferPos:I

    iget-object v2, p0, Lcom/keepassdroid/stream/HashedBlockOutputStream;->buffer:[B

    array-length v2, v2

    if-ne v1, v2, :cond_0

    .line 84
    invoke-direct {p0}, Lcom/keepassdroid/stream/HashedBlockOutputStream;->WriteHashedBlock()V

    .line 87
    :cond_0
    iget-object v1, p0, Lcom/keepassdroid/stream/HashedBlockOutputStream;->buffer:[B

    array-length v1, v1

    iget v2, p0, Lcom/keepassdroid/stream/HashedBlockOutputStream;->bufferPos:I

    sub-int/2addr v1, v2

    invoke-static {v1, p3}, Ljava/lang/Math;->min(II)I

    move-result v0

    .line 89
    .local v0, "copyLen":I
    iget-object v1, p0, Lcom/keepassdroid/stream/HashedBlockOutputStream;->buffer:[B

    iget v2, p0, Lcom/keepassdroid/stream/HashedBlockOutputStream;->bufferPos:I

    invoke-static {p1, p2, v1, v2, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 91
    add-int/2addr p2, v0

    .line 92
    iget v1, p0, Lcom/keepassdroid/stream/HashedBlockOutputStream;->bufferPos:I

    add-int/2addr v1, v0

    iput v1, p0, Lcom/keepassdroid/stream/HashedBlockOutputStream;->bufferPos:I

    .line 94
    sub-int/2addr p3, v0

    .line 95
    goto :goto_0

    .line 96
    .end local v0    # "copyLen":I
    :cond_1
    return-void
.end method
