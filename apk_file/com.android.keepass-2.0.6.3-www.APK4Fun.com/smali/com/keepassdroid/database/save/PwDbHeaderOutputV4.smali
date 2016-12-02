.class public Lcom/keepassdroid/database/save/PwDbHeaderOutputV4;
.super Lcom/keepassdroid/database/save/PwDbHeaderOutput;
.source "PwDbHeaderOutputV4.java"


# static fields
.field private static EndHeaderValue:[B


# instance fields
.field private db:Lcom/keepassdroid/database/PwDatabaseV4;

.field private dos:Ljava/security/DigestOutputStream;

.field private header:Lcom/keepassdroid/database/PwDbHeaderV4;

.field private los:Lcom/keepassdroid/stream/LEDataOutputStream;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 42
    const/4 v0, 0x4

    new-array v0, v0, [B

    fill-array-data v0, :array_0

    sput-object v0, Lcom/keepassdroid/database/save/PwDbHeaderOutputV4;->EndHeaderValue:[B

    return-void

    nop

    :array_0
    .array-data 1
        0xdt
        0xat
        0xdt
        0xat
    .end array-data
.end method

.method public constructor <init>(Lcom/keepassdroid/database/PwDatabaseV4;Lcom/keepassdroid/database/PwDbHeaderV4;Ljava/io/OutputStream;)V
    .locals 4
    .param p1, "d"    # Lcom/keepassdroid/database/PwDatabaseV4;
    .param p2, "h"    # Lcom/keepassdroid/database/PwDbHeaderV4;
    .param p3, "os"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/keepassdroid/database/exception/PwDbOutputException;
        }
    .end annotation

    .prologue
    .line 44
    invoke-direct {p0}, Lcom/keepassdroid/database/save/PwDbHeaderOutput;-><init>()V

    .line 45
    iput-object p1, p0, Lcom/keepassdroid/database/save/PwDbHeaderOutputV4;->db:Lcom/keepassdroid/database/PwDatabaseV4;

    .line 46
    iput-object p2, p0, Lcom/keepassdroid/database/save/PwDbHeaderOutputV4;->header:Lcom/keepassdroid/database/PwDbHeaderV4;

    .line 48
    const/4 v1, 0x0

    .line 50
    .local v1, "md":Ljava/security/MessageDigest;
    :try_start_0
    const-string v2, "SHA-256"

    invoke-static {v2}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;
    :try_end_0
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 55
    new-instance v2, Ljava/security/DigestOutputStream;

    invoke-direct {v2, p3, v1}, Ljava/security/DigestOutputStream;-><init>(Ljava/io/OutputStream;Ljava/security/MessageDigest;)V

    iput-object v2, p0, Lcom/keepassdroid/database/save/PwDbHeaderOutputV4;->dos:Ljava/security/DigestOutputStream;

    .line 56
    new-instance v2, Lcom/keepassdroid/stream/LEDataOutputStream;

    iget-object v3, p0, Lcom/keepassdroid/database/save/PwDbHeaderOutputV4;->dos:Ljava/security/DigestOutputStream;

    invoke-direct {v2, v3}, Lcom/keepassdroid/stream/LEDataOutputStream;-><init>(Ljava/io/OutputStream;)V

    iput-object v2, p0, Lcom/keepassdroid/database/save/PwDbHeaderOutputV4;->los:Lcom/keepassdroid/stream/LEDataOutputStream;

    .line 57
    return-void

    .line 51
    :catch_0
    move-exception v0

    .line 52
    .local v0, "e":Ljava/security/NoSuchAlgorithmException;
    new-instance v2, Lcom/keepassdroid/database/exception/PwDbOutputException;

    const-string v3, "SHA-256 not implemented here."

    invoke-direct {v2, v3}, Lcom/keepassdroid/database/exception/PwDbOutputException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method private writeHeaderField(B[B)V
    .locals 2
    .param p1, "fieldId"    # B
    .param p2, "pbData"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 81
    iget-object v0, p0, Lcom/keepassdroid/database/save/PwDbHeaderOutputV4;->los:Lcom/keepassdroid/stream/LEDataOutputStream;

    invoke-virtual {v0, p1}, Lcom/keepassdroid/stream/LEDataOutputStream;->write(I)V

    .line 83
    if-eqz p2, :cond_0

    .line 84
    iget-object v0, p0, Lcom/keepassdroid/database/save/PwDbHeaderOutputV4;->los:Lcom/keepassdroid/stream/LEDataOutputStream;

    array-length v1, p2

    invoke-virtual {v0, v1}, Lcom/keepassdroid/stream/LEDataOutputStream;->writeUShort(I)V

    .line 85
    iget-object v0, p0, Lcom/keepassdroid/database/save/PwDbHeaderOutputV4;->los:Lcom/keepassdroid/stream/LEDataOutputStream;

    invoke-virtual {v0, p2}, Lcom/keepassdroid/stream/LEDataOutputStream;->write([B)V

    .line 89
    :goto_0
    return-void

    .line 87
    :cond_0
    iget-object v0, p0, Lcom/keepassdroid/database/save/PwDbHeaderOutputV4;->los:Lcom/keepassdroid/stream/LEDataOutputStream;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/keepassdroid/stream/LEDataOutputStream;->writeUShort(I)V

    goto :goto_0
.end method


# virtual methods
.method public output()V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 60
    iget-object v0, p0, Lcom/keepassdroid/database/save/PwDbHeaderOutputV4;->los:Lcom/keepassdroid/stream/LEDataOutputStream;

    const-wide/32 v2, -0x655d26fd

    invoke-virtual {v0, v2, v3}, Lcom/keepassdroid/stream/LEDataOutputStream;->writeUInt(J)V

    .line 61
    iget-object v0, p0, Lcom/keepassdroid/database/save/PwDbHeaderOutputV4;->los:Lcom/keepassdroid/stream/LEDataOutputStream;

    const-wide/32 v2, -0x4ab40499

    invoke-virtual {v0, v2, v3}, Lcom/keepassdroid/stream/LEDataOutputStream;->writeUInt(J)V

    .line 62
    iget-object v0, p0, Lcom/keepassdroid/database/save/PwDbHeaderOutputV4;->los:Lcom/keepassdroid/stream/LEDataOutputStream;

    const-wide/32 v2, 0x30001

    invoke-virtual {v0, v2, v3}, Lcom/keepassdroid/stream/LEDataOutputStream;->writeUInt(J)V

    .line 64
    const/4 v0, 0x2

    iget-object v1, p0, Lcom/keepassdroid/database/save/PwDbHeaderOutputV4;->db:Lcom/keepassdroid/database/PwDatabaseV4;

    iget-object v1, v1, Lcom/keepassdroid/database/PwDatabaseV4;->dataCipher:Ljava/util/UUID;

    invoke-static {v1}, Lcom/keepassdroid/utils/Types;->UUIDtoBytes(Ljava/util/UUID;)[B

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lcom/keepassdroid/database/save/PwDbHeaderOutputV4;->writeHeaderField(B[B)V

    .line 65
    const/4 v0, 0x3

    iget-object v1, p0, Lcom/keepassdroid/database/save/PwDbHeaderOutputV4;->db:Lcom/keepassdroid/database/PwDatabaseV4;

    iget-object v1, v1, Lcom/keepassdroid/database/PwDatabaseV4;->compressionAlgorithm:Lcom/keepassdroid/database/PwCompressionAlgorithm;

    iget v1, v1, Lcom/keepassdroid/database/PwCompressionAlgorithm;->id:I

    invoke-static {v1}, Lcom/keepassdroid/stream/LEDataOutputStream;->writeIntBuf(I)[B

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lcom/keepassdroid/database/save/PwDbHeaderOutputV4;->writeHeaderField(B[B)V

    .line 66
    const/4 v0, 0x4

    iget-object v1, p0, Lcom/keepassdroid/database/save/PwDbHeaderOutputV4;->header:Lcom/keepassdroid/database/PwDbHeaderV4;

    iget-object v1, v1, Lcom/keepassdroid/database/PwDbHeaderV4;->masterSeed:[B

    invoke-direct {p0, v0, v1}, Lcom/keepassdroid/database/save/PwDbHeaderOutputV4;->writeHeaderField(B[B)V

    .line 67
    const/4 v0, 0x5

    iget-object v1, p0, Lcom/keepassdroid/database/save/PwDbHeaderOutputV4;->header:Lcom/keepassdroid/database/PwDbHeaderV4;

    iget-object v1, v1, Lcom/keepassdroid/database/PwDbHeaderV4;->transformSeed:[B

    invoke-direct {p0, v0, v1}, Lcom/keepassdroid/database/save/PwDbHeaderOutputV4;->writeHeaderField(B[B)V

    .line 68
    const/4 v0, 0x6

    iget-object v1, p0, Lcom/keepassdroid/database/save/PwDbHeaderOutputV4;->db:Lcom/keepassdroid/database/PwDatabaseV4;

    iget-wide v2, v1, Lcom/keepassdroid/database/PwDatabaseV4;->numKeyEncRounds:J

    invoke-static {v2, v3}, Lcom/keepassdroid/stream/LEDataOutputStream;->writeLongBuf(J)[B

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lcom/keepassdroid/database/save/PwDbHeaderOutputV4;->writeHeaderField(B[B)V

    .line 69
    const/4 v0, 0x7

    iget-object v1, p0, Lcom/keepassdroid/database/save/PwDbHeaderOutputV4;->header:Lcom/keepassdroid/database/PwDbHeaderV4;

    iget-object v1, v1, Lcom/keepassdroid/database/PwDbHeaderV4;->encryptionIV:[B

    invoke-direct {p0, v0, v1}, Lcom/keepassdroid/database/save/PwDbHeaderOutputV4;->writeHeaderField(B[B)V

    .line 70
    const/16 v0, 0x8

    iget-object v1, p0, Lcom/keepassdroid/database/save/PwDbHeaderOutputV4;->header:Lcom/keepassdroid/database/PwDbHeaderV4;

    iget-object v1, v1, Lcom/keepassdroid/database/PwDbHeaderV4;->protectedStreamKey:[B

    invoke-direct {p0, v0, v1}, Lcom/keepassdroid/database/save/PwDbHeaderOutputV4;->writeHeaderField(B[B)V

    .line 71
    const/16 v0, 0x9

    iget-object v1, p0, Lcom/keepassdroid/database/save/PwDbHeaderOutputV4;->header:Lcom/keepassdroid/database/PwDbHeaderV4;

    iget-object v1, v1, Lcom/keepassdroid/database/PwDbHeaderV4;->streamStartBytes:[B

    invoke-direct {p0, v0, v1}, Lcom/keepassdroid/database/save/PwDbHeaderOutputV4;->writeHeaderField(B[B)V

    .line 72
    const/16 v0, 0xa

    iget-object v1, p0, Lcom/keepassdroid/database/save/PwDbHeaderOutputV4;->header:Lcom/keepassdroid/database/PwDbHeaderV4;

    iget-object v1, v1, Lcom/keepassdroid/database/PwDbHeaderV4;->innerRandomStream:Lcom/keepassdroid/database/CrsAlgorithm;

    iget v1, v1, Lcom/keepassdroid/database/CrsAlgorithm;->id:I

    invoke-static {v1}, Lcom/keepassdroid/stream/LEDataOutputStream;->writeIntBuf(I)[B

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lcom/keepassdroid/database/save/PwDbHeaderOutputV4;->writeHeaderField(B[B)V

    .line 73
    const/4 v0, 0x0

    sget-object v1, Lcom/keepassdroid/database/save/PwDbHeaderOutputV4;->EndHeaderValue:[B

    invoke-direct {p0, v0, v1}, Lcom/keepassdroid/database/save/PwDbHeaderOutputV4;->writeHeaderField(B[B)V

    .line 75
    iget-object v0, p0, Lcom/keepassdroid/database/save/PwDbHeaderOutputV4;->los:Lcom/keepassdroid/stream/LEDataOutputStream;

    invoke-virtual {v0}, Lcom/keepassdroid/stream/LEDataOutputStream;->flush()V

    .line 76
    iget-object v0, p0, Lcom/keepassdroid/database/save/PwDbHeaderOutputV4;->dos:Ljava/security/DigestOutputStream;

    invoke-virtual {v0}, Ljava/security/DigestOutputStream;->getMessageDigest()Ljava/security/MessageDigest;

    move-result-object v0

    invoke-virtual {v0}, Ljava/security/MessageDigest;->digest()[B

    move-result-object v0

    iput-object v0, p0, Lcom/keepassdroid/database/save/PwDbHeaderOutputV4;->hashOfHeader:[B

    .line 77
    return-void
.end method
