.class public Lcom/keepassdroid/utils/Types;
.super Ljava/lang/Object;
.source "Types.java"


# static fields
.field private static final CRLF:Ljava/lang/String;

.field private static final CRLFbuf:[B

.field private static final REPLACE:Z

.field private static final SEP:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 115
    const/4 v0, 0x2

    new-array v0, v0, [B

    fill-array-data v0, :array_0

    sput-object v0, Lcom/keepassdroid/utils/Types;->CRLFbuf:[B

    .line 116
    new-instance v0, Ljava/lang/String;

    sget-object v1, Lcom/keepassdroid/utils/Types;->CRLFbuf:[B

    invoke-direct {v0, v1}, Ljava/lang/String;-><init>([B)V

    sput-object v0, Lcom/keepassdroid/utils/Types;->CRLF:Ljava/lang/String;

    .line 117
    const-string v0, "line.separator"

    invoke-static {v0}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/keepassdroid/utils/Types;->SEP:Ljava/lang/String;

    .line 118
    sget-object v0, Lcom/keepassdroid/utils/Types;->SEP:Ljava/lang/String;

    sget-object v1, Lcom/keepassdroid/utils/Types;->CRLF:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    sput-boolean v0, Lcom/keepassdroid/utils/Types;->REPLACE:Z

    return-void

    :cond_0
    const/4 v0, 0x0

    goto :goto_0

    .line 115
    nop

    :array_0
    .array-data 1
        0xdt
        0xat
    .end array-data
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 58
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static UUIDtoBytes(Ljava/util/UUID;)[B
    .locals 4
    .param p0, "uuid"    # Ljava/util/UUID;

    .prologue
    .line 172
    const/16 v1, 0x10

    new-array v0, v1, [B

    .line 174
    .local v0, "buf":[B
    invoke-virtual {p0}, Ljava/util/UUID;->getMostSignificantBits()J

    move-result-wide v2

    const/4 v1, 0x0

    invoke-static {v2, v3, v0, v1}, Lcom/keepassdroid/stream/LEDataOutputStream;->writeLong(J[BI)V

    .line 175
    invoke-virtual {p0}, Ljava/util/UUID;->getLeastSignificantBits()J

    move-result-wide v2

    const/16 v1, 0x8

    invoke-static {v2, v3, v0, v1}, Lcom/keepassdroid/stream/LEDataOutputStream;->writeLong(J[BI)V

    .line 177
    return-object v0
.end method

.method public static bytestoUUID([B)Ljava/util/UUID;
    .locals 1
    .param p0, "buf"    # [B

    .prologue
    .line 153
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lcom/keepassdroid/utils/Types;->bytestoUUID([BI)Ljava/util/UUID;

    move-result-object v0

    return-object v0
.end method

.method public static bytestoUUID([BI)Ljava/util/UUID;
    .locals 11
    .param p0, "buf"    # [B
    .param p1, "offset"    # I

    .prologue
    const/16 v10, 0x8

    .line 157
    const-wide/16 v2, 0x0

    .line 158
    .local v2, "lsb":J
    const/16 v0, 0xf

    .local v0, "i":I
    :goto_0
    if-lt v0, v10, :cond_0

    .line 159
    shl-long v6, v2, v10

    add-int v1, v0, p1

    aget-byte v1, p0, v1

    and-int/lit16 v1, v1, 0xff

    int-to-long v8, v1

    or-long v2, v6, v8

    .line 158
    add-int/lit8 v0, v0, -0x1

    goto :goto_0

    .line 162
    :cond_0
    const-wide/16 v4, 0x0

    .line 163
    .local v4, "msb":J
    const/4 v0, 0x7

    :goto_1
    if-ltz v0, :cond_1

    .line 164
    shl-long v6, v4, v10

    add-int v1, v0, p1

    aget-byte v1, p0, v1

    and-int/lit16 v1, v1, 0xff

    int-to-long v8, v1

    or-long v4, v6, v8

    .line 163
    add-int/lit8 v0, v0, -0x1

    goto :goto_1

    .line 167
    :cond_1
    new-instance v1, Ljava/util/UUID;

    invoke-direct {v1, v4, v5, v2, v3}, Ljava/util/UUID;-><init>(JJ)V

    return-object v1
.end method

.method public static extract([BII)[B
    .locals 2
    .param p0, "b"    # [B
    .param p1, "offset"    # I
    .param p2, "len"    # I

    .prologue
    .line 109
    new-array v0, p2, [B

    .line 110
    .local v0, "b2":[B
    const/4 v1, 0x0

    invoke-static {p0, p1, v0, v1, p2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 111
    return-object v0
.end method

.method public static readCString([BI)Ljava/lang/String;
    .locals 3
    .param p0, "buf"    # [B
    .param p1, "offset"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/UnsupportedEncodingException;
        }
    .end annotation

    .prologue
    .line 121
    new-instance v0, Ljava/lang/String;

    invoke-static {p0, p1}, Lcom/keepassdroid/utils/Types;->strlen([BI)I

    move-result v1

    const-string v2, "UTF-8"

    invoke-direct {v0, p0, p1, v1, v2}, Ljava/lang/String;-><init>([BIILjava/lang/String;)V

    .line 123
    .local v0, "jstring":Ljava/lang/String;
    sget-boolean v1, Lcom/keepassdroid/utils/Types;->REPLACE:Z

    if-eqz v1, :cond_0

    .line 124
    sget-object v1, Lcom/keepassdroid/utils/Types;->CRLF:Ljava/lang/String;

    sget-object v2, Lcom/keepassdroid/utils/Types;->SEP:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    .line 127
    :cond_0
    return-object v0
.end method

.method public static readUByte([BI)I
    .locals 1
    .param p0, "buf"    # [B
    .param p1, "offset"    # I

    .prologue
    .line 62
    aget-byte v0, p0, p1

    and-int/lit16 v0, v0, 0xff

    return v0
.end method

.method public static strlen([BI)I
    .locals 2
    .param p0, "buf"    # [B
    .param p1, "offset"    # I

    .prologue
    .line 92
    const/4 v0, 0x0

    .line 93
    .local v0, "len":I
    :goto_0
    add-int v1, p1, v0

    aget-byte v1, p0, v1

    if-eqz v1, :cond_0

    .line 94
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 95
    :cond_0
    return v0
.end method

.method public static writeCString(Ljava/lang/String;Ljava/io/OutputStream;)I
    .locals 5
    .param p0, "str"    # Ljava/lang/String;
    .param p1, "os"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 131
    if-nez p0, :cond_0

    .line 133
    const/4 v3, 0x1

    invoke-static {v3}, Lcom/keepassdroid/stream/LEDataOutputStream;->writeIntBuf(I)[B

    move-result-object v3

    invoke-virtual {p1, v3}, Ljava/io/OutputStream;->write([B)V

    .line 134
    invoke-virtual {p1, v2}, Ljava/io/OutputStream;->write(I)V

    move v1, v2

    .line 149
    :goto_0
    return v1

    .line 138
    :cond_0
    sget-boolean v3, Lcom/keepassdroid/utils/Types;->REPLACE:Z

    if-eqz v3, :cond_1

    .line 139
    sget-object v3, Lcom/keepassdroid/utils/Types;->SEP:Ljava/lang/String;

    sget-object v4, Lcom/keepassdroid/utils/Types;->CRLF:Ljava/lang/String;

    invoke-virtual {p0, v3, v4}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p0

    .line 142
    :cond_1
    const-string v3, "UTF-8"

    invoke-virtual {p0, v3}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v0

    .line 144
    .local v0, "initial":[B
    array-length v3, v0

    add-int/lit8 v1, v3, 0x1

    .line 145
    .local v1, "length":I
    invoke-static {v1}, Lcom/keepassdroid/stream/LEDataOutputStream;->writeIntBuf(I)[B

    move-result-object v3

    invoke-virtual {p1, v3}, Ljava/io/OutputStream;->write([B)V

    .line 146
    invoke-virtual {p1, v0}, Ljava/io/OutputStream;->write([B)V

    .line 147
    invoke-virtual {p1, v2}, Ljava/io/OutputStream;->write(I)V

    goto :goto_0
.end method

.method public static writeUByte(I)B
    .locals 3
    .param p0, "val"    # I

    .prologue
    const/4 v2, 0x0

    .line 76
    const/4 v1, 0x1

    new-array v0, v1, [B

    .line 78
    .local v0, "buf":[B
    invoke-static {p0, v0, v2}, Lcom/keepassdroid/utils/Types;->writeUByte(I[BI)V

    .line 80
    aget-byte v1, v0, v2

    return v1
.end method

.method public static writeUByte(I[BI)V
    .locals 1
    .param p0, "val"    # I
    .param p1, "buf"    # [B
    .param p2, "offset"    # I

    .prologue
    .line 72
    and-int/lit16 v0, p0, 0xff

    int-to-byte v0, v0

    aput-byte v0, p1, p2

    .line 73
    return-void
.end method
