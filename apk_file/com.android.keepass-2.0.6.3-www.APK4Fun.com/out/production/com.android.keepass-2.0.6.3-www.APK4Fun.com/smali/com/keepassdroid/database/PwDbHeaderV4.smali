.class public Lcom/keepassdroid/database/PwDbHeaderV4;
.super Lcom/keepassdroid/database/PwDbHeader;
.source "PwDbHeaderV4.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/keepassdroid/database/PwDbHeaderV4$PwDbHeaderV4Fields;
    }
.end annotation


# static fields
.field public static final DBSIG_2:I = -0x4ab40499

.field public static final DBSIG_PRE2:I = -0x4ab4049a

.field public static final FILE_VERSION_32:I = 0x30001

.field private static final FILE_VERSION_CRITICAL_MASK:I = -0x10000


# instance fields
.field private db:Lcom/keepassdroid/database/PwDatabaseV4;

.field public innerRandomStream:Lcom/keepassdroid/database/CrsAlgorithm;

.field public protectedStreamKey:[B

.field public streamStartBytes:[B


# direct methods
.method public constructor <init>(Lcom/keepassdroid/database/PwDatabaseV4;)V
    .locals 2
    .param p1, "d"    # Lcom/keepassdroid/database/PwDatabaseV4;

    .prologue
    const/16 v1, 0x20

    .line 59
    invoke-direct {p0}, Lcom/keepassdroid/database/PwDbHeader;-><init>()V

    .line 55
    new-array v0, v1, [B

    iput-object v0, p0, Lcom/keepassdroid/database/PwDbHeaderV4;->protectedStreamKey:[B

    .line 56
    new-array v0, v1, [B

    iput-object v0, p0, Lcom/keepassdroid/database/PwDbHeaderV4;->streamStartBytes:[B

    .line 60
    iput-object p1, p0, Lcom/keepassdroid/database/PwDbHeaderV4;->db:Lcom/keepassdroid/database/PwDatabaseV4;

    .line 62
    new-array v0, v1, [B

    iput-object v0, p0, Lcom/keepassdroid/database/PwDbHeaderV4;->masterSeed:[B

    .line 63
    return-void
.end method

.method public static matchesHeader(II)Z
    .locals 2
    .param p0, "sig1"    # I
    .param p1, "sig2"    # I

    .prologue
    const v1, -0x4ab40499

    .line 229
    const v0, -0x655d26fd

    if-ne p0, v0, :cond_1

    if-eq p1, v1, :cond_0

    if-ne p1, v1, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private readHeaderField(Lcom/keepassdroid/stream/LEDataInputStream;)Z
    .locals 6
    .param p1, "dis"    # Lcom/keepassdroid/stream/LEDataInputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 102
    invoke-virtual {p1}, Lcom/keepassdroid/stream/LEDataInputStream;->read()I

    move-result v4

    int-to-byte v1, v4

    .line 104
    .local v1, "fieldID":B
    invoke-virtual {p1}, Lcom/keepassdroid/stream/LEDataInputStream;->readUShort()I

    move-result v2

    .line 106
    .local v2, "fieldSize":I
    const/4 v0, 0x0

    .line 107
    .local v0, "fieldData":[B
    if-lez v2, :cond_0

    .line 108
    new-array v0, v2, [B

    .line 110
    invoke-virtual {p1, v0}, Lcom/keepassdroid/stream/LEDataInputStream;->read([B)I

    move-result v3

    .line 111
    .local v3, "readSize":I
    if-eq v3, v2, :cond_0

    .line 112
    new-instance v4, Ljava/io/IOException;

    const-string v5, "Header ended early."

    invoke-direct {v4, v5}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 116
    .end local v3    # "readSize":I
    :cond_0
    packed-switch v1, :pswitch_data_0

    .line 157
    :pswitch_0
    new-instance v4, Ljava/io/IOException;

    const-string v5, "Invalid header type."

    invoke-direct {v4, v5}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 118
    :pswitch_1
    const/4 v4, 0x1

    .line 161
    :goto_0
    return v4

    .line 121
    :pswitch_2
    invoke-direct {p0, v0}, Lcom/keepassdroid/database/PwDbHeaderV4;->setCipher([B)V

    .line 161
    :goto_1
    const/4 v4, 0x0

    goto :goto_0

    .line 125
    :pswitch_3
    invoke-direct {p0, v0}, Lcom/keepassdroid/database/PwDbHeaderV4;->setCompressionFlags([B)V

    goto :goto_1

    .line 129
    :pswitch_4
    iput-object v0, p0, Lcom/keepassdroid/database/PwDbHeaderV4;->masterSeed:[B

    goto :goto_1

    .line 133
    :pswitch_5
    iput-object v0, p0, Lcom/keepassdroid/database/PwDbHeaderV4;->transformSeed:[B

    goto :goto_1

    .line 137
    :pswitch_6
    invoke-direct {p0, v0}, Lcom/keepassdroid/database/PwDbHeaderV4;->setTransformRounds([B)V

    goto :goto_1

    .line 141
    :pswitch_7
    iput-object v0, p0, Lcom/keepassdroid/database/PwDbHeaderV4;->encryptionIV:[B

    goto :goto_1

    .line 145
    :pswitch_8
    iput-object v0, p0, Lcom/keepassdroid/database/PwDbHeaderV4;->protectedStreamKey:[B

    goto :goto_1

    .line 149
    :pswitch_9
    iput-object v0, p0, Lcom/keepassdroid/database/PwDbHeaderV4;->streamStartBytes:[B

    goto :goto_1

    .line 153
    :pswitch_a
    invoke-direct {p0, v0}, Lcom/keepassdroid/database/PwDbHeaderV4;->setRandomStreamID([B)V

    goto :goto_1

    .line 116
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_5
        :pswitch_6
        :pswitch_7
        :pswitch_8
        :pswitch_9
        :pswitch_a
    .end packed-switch
.end method

.method private setCipher([B)V
    .locals 2
    .param p1, "pbId"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 165
    if-eqz p1, :cond_0

    array-length v0, p1

    const/16 v1, 0x10

    if-eq v0, v1, :cond_1

    .line 166
    :cond_0
    new-instance v0, Ljava/io/IOException;

    const-string v1, "Invalid cipher ID."

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 169
    :cond_1
    iget-object v0, p0, Lcom/keepassdroid/database/PwDbHeaderV4;->db:Lcom/keepassdroid/database/PwDatabaseV4;

    invoke-static {p1}, Lcom/keepassdroid/utils/Types;->bytestoUUID([B)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/keepassdroid/database/PwDatabaseV4;->dataCipher:Ljava/util/UUID;

    .line 170
    return-void
.end method

.method private setCompressionFlags([B)V
    .locals 3
    .param p1, "pbFlags"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 173
    if-eqz p1, :cond_0

    array-length v1, p1

    const/4 v2, 0x4

    if-eq v1, v2, :cond_1

    .line 174
    :cond_0
    new-instance v1, Ljava/io/IOException;

    const-string v2, "Invalid compression flags."

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 177
    :cond_1
    const/4 v1, 0x0

    invoke-static {p1, v1}, Lcom/keepassdroid/stream/LEDataInputStream;->readInt([BI)I

    move-result v0

    .line 178
    .local v0, "flag":I
    if-ltz v0, :cond_2

    const/4 v1, 0x2

    if-lt v0, v1, :cond_3

    .line 179
    :cond_2
    new-instance v1, Ljava/io/IOException;

    const-string v2, "Unrecognized compression flag."

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 182
    :cond_3
    iget-object v1, p0, Lcom/keepassdroid/database/PwDbHeaderV4;->db:Lcom/keepassdroid/database/PwDatabaseV4;

    invoke-static {v0}, Lcom/keepassdroid/database/PwCompressionAlgorithm;->fromId(I)Lcom/keepassdroid/database/PwCompressionAlgorithm;

    move-result-object v2

    iput-object v2, v1, Lcom/keepassdroid/database/PwDatabaseV4;->compressionAlgorithm:Lcom/keepassdroid/database/PwCompressionAlgorithm;

    .line 184
    return-void
.end method

.method private setRandomStreamID([B)V
    .locals 3
    .param p1, "streamID"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 203
    if-eqz p1, :cond_0

    array-length v1, p1

    const/4 v2, 0x4

    if-eq v1, v2, :cond_1

    .line 204
    :cond_0
    new-instance v1, Ljava/io/IOException;

    const-string v2, "Invalid stream id."

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 207
    :cond_1
    const/4 v1, 0x0

    invoke-static {p1, v1}, Lcom/keepassdroid/stream/LEDataInputStream;->readInt([BI)I

    move-result v0

    .line 208
    .local v0, "id":I
    if-ltz v0, :cond_2

    const/4 v1, 0x3

    if-lt v0, v1, :cond_3

    .line 209
    :cond_2
    new-instance v1, Ljava/io/IOException;

    const-string v2, "Invalid stream id."

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 212
    :cond_3
    invoke-static {v0}, Lcom/keepassdroid/database/CrsAlgorithm;->fromId(I)Lcom/keepassdroid/database/CrsAlgorithm;

    move-result-object v1

    iput-object v1, p0, Lcom/keepassdroid/database/PwDbHeaderV4;->innerRandomStream:Lcom/keepassdroid/database/CrsAlgorithm;

    .line 213
    return-void
.end method

.method private setTransformRounds([B)V
    .locals 4
    .param p1, "rounds"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 187
    if-eqz p1, :cond_0

    array-length v2, p1

    const/16 v3, 0x8

    if-eq v2, v3, :cond_1

    .line 188
    :cond_0
    new-instance v2, Ljava/io/IOException;

    const-string v3, "Invalid rounds."

    invoke-direct {v2, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 191
    :cond_1
    const/4 v2, 0x0

    invoke-static {p1, v2}, Lcom/keepassdroid/stream/LEDataInputStream;->readLong([BI)J

    move-result-wide v0

    .line 193
    .local v0, "rnd":J
    const-wide/16 v2, 0x0

    cmp-long v2, v0, v2

    if-ltz v2, :cond_2

    const-wide/32 v2, 0x7fffffff

    cmp-long v2, v0, v2

    if-lez v2, :cond_3

    .line 195
    :cond_2
    new-instance v2, Ljava/io/IOException;

    const-string v3, "Rounds higher than 2147483647 are not currently supported."

    invoke-direct {v2, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 198
    :cond_3
    iget-object v2, p0, Lcom/keepassdroid/database/PwDbHeaderV4;->db:Lcom/keepassdroid/database/PwDatabaseV4;

    iput-wide v0, v2, Lcom/keepassdroid/database/PwDatabaseV4;->numKeyEncRounds:J

    .line 200
    return-void
.end method

.method private validVersion(J)Z
    .locals 5
    .param p1, "version"    # J

    .prologue
    .line 224
    const-wide/32 v0, -0x10000

    and-long/2addr v0, p1

    const-wide/32 v2, 0x30000

    cmp-long v0, v0, v2

    if-gtz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method


# virtual methods
.method public loadFromFile(Ljava/io/InputStream;)[B
    .locals 11
    .param p1, "is"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/keepassdroid/database/exception/InvalidDBVersionException;
        }
    .end annotation

    .prologue
    .line 73
    :try_start_0
    const-string v7, "SHA-256"

    invoke-static {v7}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;
    :try_end_0
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v4

    .line 78
    .local v4, "md":Ljava/security/MessageDigest;
    new-instance v0, Ljava/security/DigestInputStream;

    invoke-direct {v0, p1, v4}, Ljava/security/DigestInputStream;-><init>(Ljava/io/InputStream;Ljava/security/MessageDigest;)V

    .line 79
    .local v0, "dis":Ljava/security/DigestInputStream;
    new-instance v3, Lcom/keepassdroid/stream/LEDataInputStream;

    invoke-direct {v3, v0}, Lcom/keepassdroid/stream/LEDataInputStream;-><init>(Ljava/io/InputStream;)V

    .line 81
    .local v3, "lis":Lcom/keepassdroid/stream/LEDataInputStream;
    invoke-virtual {v3}, Lcom/keepassdroid/stream/LEDataInputStream;->readInt()I

    move-result v5

    .line 82
    .local v5, "sig1":I
    invoke-virtual {v3}, Lcom/keepassdroid/stream/LEDataInputStream;->readInt()I

    move-result v6

    .line 84
    .local v6, "sig2":I
    invoke-static {v5, v6}, Lcom/keepassdroid/database/PwDbHeaderV4;->matchesHeader(II)Z

    move-result v7

    if-nez v7, :cond_0

    .line 85
    new-instance v7, Lcom/keepassdroid/database/exception/InvalidDBVersionException;

    invoke-direct {v7}, Lcom/keepassdroid/database/exception/InvalidDBVersionException;-><init>()V

    throw v7

    .line 74
    .end local v0    # "dis":Ljava/security/DigestInputStream;
    .end local v3    # "lis":Lcom/keepassdroid/stream/LEDataInputStream;
    .end local v4    # "md":Ljava/security/MessageDigest;
    .end local v5    # "sig1":I
    .end local v6    # "sig2":I
    :catch_0
    move-exception v2

    .line 75
    .local v2, "e":Ljava/security/NoSuchAlgorithmException;
    new-instance v7, Ljava/io/IOException;

    const-string v10, "No SHA-256 implementation"

    invoke-direct {v7, v10}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 88
    .end local v2    # "e":Ljava/security/NoSuchAlgorithmException;
    .restart local v0    # "dis":Ljava/security/DigestInputStream;
    .restart local v3    # "lis":Lcom/keepassdroid/stream/LEDataInputStream;
    .restart local v4    # "md":Ljava/security/MessageDigest;
    .restart local v5    # "sig1":I
    .restart local v6    # "sig2":I
    :cond_0
    invoke-virtual {v3}, Lcom/keepassdroid/stream/LEDataInputStream;->readUInt()J

    move-result-wide v8

    .line 89
    .local v8, "version":J
    invoke-direct {p0, v8, v9}, Lcom/keepassdroid/database/PwDbHeaderV4;->validVersion(J)Z

    move-result v7

    if-nez v7, :cond_1

    .line 90
    new-instance v7, Lcom/keepassdroid/database/exception/InvalidDBVersionException;

    invoke-direct {v7}, Lcom/keepassdroid/database/exception/InvalidDBVersionException;-><init>()V

    throw v7

    .line 93
    :cond_1
    const/4 v1, 0x0

    .line 94
    .local v1, "done":Z
    :goto_0
    if-nez v1, :cond_2

    .line 95
    invoke-direct {p0, v3}, Lcom/keepassdroid/database/PwDbHeaderV4;->readHeaderField(Lcom/keepassdroid/stream/LEDataInputStream;)Z

    move-result v1

    goto :goto_0

    .line 98
    :cond_2
    invoke-virtual {v4}, Ljava/security/MessageDigest;->digest()[B

    move-result-object v7

    return-object v7
.end method
