.class public Lcom/keepassdroid/stream/BetterCipherInputStream;
.super Ljava/io/FilterInputStream;
.source "BetterCipherInputStream.java"


# static fields
.field private static final I_DEFAULT_BUFFER_SIZE:I = 0x2000


# instance fields
.field private final cipher:Ljavax/crypto/Cipher;

.field private finished:Z

.field private final i_buffer:[B

.field private index:I

.field private o_buffer:[B


# direct methods
.method protected constructor <init>(Ljava/io/InputStream;)V
    .locals 1
    .param p1, "is"    # Ljava/io/InputStream;

    .prologue
    .line 87
    new-instance v0, Ljavax/crypto/NullCipher;

    invoke-direct {v0}, Ljavax/crypto/NullCipher;-><init>()V

    invoke-direct {p0, p1, v0}, Lcom/keepassdroid/stream/BetterCipherInputStream;-><init>(Ljava/io/InputStream;Ljavax/crypto/Cipher;)V

    .line 88
    return-void
.end method

.method public constructor <init>(Ljava/io/InputStream;Ljavax/crypto/Cipher;)V
    .locals 1
    .param p1, "is"    # Ljava/io/InputStream;
    .param p2, "c"    # Ljavax/crypto/Cipher;

    .prologue
    .line 57
    const/16 v0, 0x2000

    invoke-direct {p0, p1, p2, v0}, Lcom/keepassdroid/stream/BetterCipherInputStream;-><init>(Ljava/io/InputStream;Ljavax/crypto/Cipher;I)V

    .line 58
    return-void
.end method

.method public constructor <init>(Ljava/io/InputStream;Ljavax/crypto/Cipher;I)V
    .locals 1
    .param p1, "is"    # Ljava/io/InputStream;
    .param p2, "c"    # Ljavax/crypto/Cipher;
    .param p3, "bufferSize"    # I

    .prologue
    .line 72
    invoke-direct {p0, p1}, Ljava/io/FilterInputStream;-><init>(Ljava/io/InputStream;)V

    .line 73
    iput-object p2, p0, Lcom/keepassdroid/stream/BetterCipherInputStream;->cipher:Ljavax/crypto/Cipher;

    .line 74
    new-array v0, p3, [B

    iput-object v0, p0, Lcom/keepassdroid/stream/BetterCipherInputStream;->i_buffer:[B

    .line 75
    return-void
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
    .line 215
    const/4 v0, 0x0

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
    .line 227
    iget-object v0, p0, Lcom/keepassdroid/stream/BetterCipherInputStream;->in:Ljava/io/InputStream;

    invoke-virtual {v0}, Ljava/io/InputStream;->close()V

    .line 229
    :try_start_0
    iget-object v0, p0, Lcom/keepassdroid/stream/BetterCipherInputStream;->cipher:Ljavax/crypto/Cipher;

    invoke-virtual {v0}, Ljavax/crypto/Cipher;->doFinal()[B
    :try_end_0
    .catch Ljava/security/GeneralSecurityException; {:try_start_0 .. :try_end_0} :catch_0

    .line 234
    :goto_0
    return-void

    .line 230
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method public markSupported()Z
    .locals 1

    .prologue
    .line 245
    const/4 v0, 0x0

    return v0
.end method

.method public read()I
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v5, 0x0

    const/4 v2, -0x1

    .line 99
    iget-boolean v3, p0, Lcom/keepassdroid/stream/BetterCipherInputStream;->finished:Z

    if-eqz v3, :cond_2

    .line 100
    iget-object v3, p0, Lcom/keepassdroid/stream/BetterCipherInputStream;->o_buffer:[B

    if-eqz v3, :cond_0

    iget v3, p0, Lcom/keepassdroid/stream/BetterCipherInputStream;->index:I

    iget-object v4, p0, Lcom/keepassdroid/stream/BetterCipherInputStream;->o_buffer:[B

    array-length v4, v4

    if-ne v3, v4, :cond_1

    .line 122
    :cond_0
    :goto_0
    return v2

    .line 100
    :cond_1
    iget-object v2, p0, Lcom/keepassdroid/stream/BetterCipherInputStream;->o_buffer:[B

    iget v3, p0, Lcom/keepassdroid/stream/BetterCipherInputStream;->index:I

    add-int/lit8 v4, v3, 0x1

    iput v4, p0, Lcom/keepassdroid/stream/BetterCipherInputStream;->index:I

    aget-byte v2, v2, v3

    and-int/lit16 v2, v2, 0xff

    goto :goto_0

    .line 104
    :cond_2
    iget-object v3, p0, Lcom/keepassdroid/stream/BetterCipherInputStream;->o_buffer:[B

    if-eqz v3, :cond_3

    iget v3, p0, Lcom/keepassdroid/stream/BetterCipherInputStream;->index:I

    iget-object v4, p0, Lcom/keepassdroid/stream/BetterCipherInputStream;->o_buffer:[B

    array-length v4, v4

    if-ge v3, v4, :cond_3

    .line 105
    iget-object v2, p0, Lcom/keepassdroid/stream/BetterCipherInputStream;->o_buffer:[B

    iget v3, p0, Lcom/keepassdroid/stream/BetterCipherInputStream;->index:I

    add-int/lit8 v4, v3, 0x1

    iput v4, p0, Lcom/keepassdroid/stream/BetterCipherInputStream;->index:I

    aget-byte v2, v2, v3

    and-int/lit16 v2, v2, 0xff

    goto :goto_0

    .line 107
    :cond_3
    iput v5, p0, Lcom/keepassdroid/stream/BetterCipherInputStream;->index:I

    .line 108
    const/4 v3, 0x0

    iput-object v3, p0, Lcom/keepassdroid/stream/BetterCipherInputStream;->o_buffer:[B

    .line 110
    :goto_1
    iget-object v3, p0, Lcom/keepassdroid/stream/BetterCipherInputStream;->o_buffer:[B

    if-nez v3, :cond_4

    .line 111
    iget-object v3, p0, Lcom/keepassdroid/stream/BetterCipherInputStream;->in:Ljava/io/InputStream;

    iget-object v4, p0, Lcom/keepassdroid/stream/BetterCipherInputStream;->i_buffer:[B

    invoke-virtual {v3, v4}, Ljava/io/InputStream;->read([B)I

    move-result v1

    .local v1, "num_read":I
    if-ne v1, v2, :cond_5

    .line 113
    :try_start_0
    iget-object v2, p0, Lcom/keepassdroid/stream/BetterCipherInputStream;->cipher:Ljavax/crypto/Cipher;

    invoke-virtual {v2}, Ljavax/crypto/Cipher;->doFinal()[B

    move-result-object v2

    iput-object v2, p0, Lcom/keepassdroid/stream/BetterCipherInputStream;->o_buffer:[B
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 117
    const/4 v2, 0x1

    iput-boolean v2, p0, Lcom/keepassdroid/stream/BetterCipherInputStream;->finished:Z

    .line 122
    .end local v1    # "num_read":I
    :cond_4
    invoke-virtual {p0}, Lcom/keepassdroid/stream/BetterCipherInputStream;->read()I

    move-result v2

    goto :goto_0

    .line 114
    .restart local v1    # "num_read":I
    :catch_0
    move-exception v0

    .line 115
    .local v0, "e":Ljava/lang/Exception;
    new-instance v2, Ljava/io/IOException;

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 120
    .end local v0    # "e":Ljava/lang/Exception;
    :cond_5
    iget-object v3, p0, Lcom/keepassdroid/stream/BetterCipherInputStream;->cipher:Ljavax/crypto/Cipher;

    iget-object v4, p0, Lcom/keepassdroid/stream/BetterCipherInputStream;->i_buffer:[B

    invoke-virtual {v3, v4, v5, v1}, Ljavax/crypto/Cipher;->update([BII)[B

    move-result-object v3

    iput-object v3, p0, Lcom/keepassdroid/stream/BetterCipherInputStream;->o_buffer:[B

    goto :goto_1
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
    .line 138
    const/4 v0, 0x0

    array-length v1, p1

    invoke-virtual {p0, p1, v0, v1}, Lcom/keepassdroid/stream/BetterCipherInputStream;->read([BII)I

    move-result v0

    return v0
.end method

.method public read([BII)I
    .locals 5
    .param p1, "b"    # [B
    .param p2, "off"    # I
    .param p3, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v2, -0x1

    .line 163
    iget-object v3, p0, Lcom/keepassdroid/stream/BetterCipherInputStream;->in:Ljava/io/InputStream;

    if-nez v3, :cond_0

    .line 164
    new-instance v2, Ljava/lang/NullPointerException;

    const-string v3, "Underlying input stream is null"

    invoke-direct {v2, v3}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 169
    :cond_0
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    if-ge v0, p3, :cond_1

    .line 170
    invoke-virtual {p0}, Lcom/keepassdroid/stream/BetterCipherInputStream;->read()I

    move-result v1

    .local v1, "read_b":I
    if-ne v1, v2, :cond_2

    .line 171
    if-nez v0, :cond_1

    move v0, v2

    .line 177
    .end local v0    # "i":I
    .end local v1    # "read_b":I
    :cond_1
    return v0

    .line 173
    .restart local v0    # "i":I
    .restart local v1    # "read_b":I
    :cond_2
    if-eqz p1, :cond_3

    .line 174
    add-int v3, p2, v0

    int-to-byte v4, v1

    aput-byte v4, p1, v3

    .line 169
    :cond_3
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method public skip(J)J
    .locals 7
    .param p1, "n"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 195
    const-wide/16 v2, 0x0

    .line 196
    .local v2, "i":J
    invoke-virtual {p0}, Lcom/keepassdroid/stream/BetterCipherInputStream;->available()I

    move-result v0

    .line 197
    .local v0, "available":I
    int-to-long v4, v0

    cmp-long v1, v4, p1

    if-gez v1, :cond_0

    .line 198
    int-to-long p1, v0

    .line 200
    :cond_0
    :goto_0
    cmp-long v1, v2, p1

    if-gez v1, :cond_1

    invoke-virtual {p0}, Lcom/keepassdroid/stream/BetterCipherInputStream;->read()I

    move-result v1

    const/4 v4, -0x1

    if-eq v1, v4, :cond_1

    .line 201
    const-wide/16 v4, 0x1

    add-long/2addr v2, v4

    goto :goto_0

    .line 203
    :cond_1
    return-wide v2
.end method
