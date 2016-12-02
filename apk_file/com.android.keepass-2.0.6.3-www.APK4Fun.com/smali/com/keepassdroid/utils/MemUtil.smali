.class public Lcom/keepassdroid/utils/MemUtil;
.super Ljava/lang/Object;
.source "MemUtil.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static compress([B)[B
    .locals 4
    .param p0, "input"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 40
    new-instance v0, Ljava/io/ByteArrayInputStream;

    invoke-direct {v0, p0}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    .line 42
    .local v0, "bais":Ljava/io/ByteArrayInputStream;
    new-instance v1, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v1}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 43
    .local v1, "baos":Ljava/io/ByteArrayOutputStream;
    new-instance v2, Ljava/util/zip/GZIPOutputStream;

    invoke-direct {v2, v1}, Ljava/util/zip/GZIPOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 44
    .local v2, "gzos":Ljava/util/zip/GZIPOutputStream;
    invoke-static {v0, v2}, Lcom/keepassdroid/utils/Util;->copyStream(Ljava/io/InputStream;Ljava/io/OutputStream;)V

    .line 45
    invoke-virtual {v2}, Ljava/util/zip/GZIPOutputStream;->close()V

    .line 47
    invoke-virtual {v1}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v3

    return-object v3
.end method

.method public static decompress([B)[B
    .locals 4
    .param p0, "input"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 30
    new-instance v0, Ljava/io/ByteArrayInputStream;

    invoke-direct {v0, p0}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    .line 31
    .local v0, "bais":Ljava/io/ByteArrayInputStream;
    new-instance v2, Ljava/util/zip/GZIPInputStream;

    invoke-direct {v2, v0}, Ljava/util/zip/GZIPInputStream;-><init>(Ljava/io/InputStream;)V

    .line 33
    .local v2, "gzis":Ljava/util/zip/GZIPInputStream;
    new-instance v1, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v1}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 34
    .local v1, "baos":Ljava/io/ByteArrayOutputStream;
    invoke-static {v2, v1}, Lcom/keepassdroid/utils/Util;->copyStream(Ljava/io/InputStream;Ljava/io/OutputStream;)V

    .line 36
    invoke-virtual {v1}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v3

    return-object v3
.end method
