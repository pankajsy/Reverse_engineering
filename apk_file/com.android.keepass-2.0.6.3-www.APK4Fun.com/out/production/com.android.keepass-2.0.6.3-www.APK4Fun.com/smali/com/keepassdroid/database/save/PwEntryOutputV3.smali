.class public Lcom/keepassdroid/database/save/PwEntryOutputV3;
.super Ljava/lang/Object;
.source "PwEntryOutputV3.java"


# static fields
.field public static final ACCESS_FIELD_TYPE:[B

.field public static final ADDITIONAL_FIELD_TYPE:[B

.field public static final BINARY_DATA_FIELD_TYPE:[B

.field public static final BINARY_DESC_FIELD_TYPE:[B

.field public static final CREATE_FIELD_TYPE:[B

.field public static final DATE_FIELD_SIZE:[B

.field public static final END_FIELD_TYPE:[B

.field public static final EXPIRE_FIELD_TYPE:[B

.field public static final FLAGS_FIELD_SIZE:[B

.field public static final GROUPID_FIELD_TYPE:[B

.field public static final IMAGEID_FIELD_SIZE:[B

.field public static final IMAGEID_FIELD_TYPE:[B

.field public static final LEVEL_FIELD_SIZE:[B

.field public static final LONG_FOUR:[B

.field public static final MOD_FIELD_TYPE:[B

.field public static final PASSWORD_FIELD_TYPE:[B

.field public static final TEST:[B

.field public static final TITLE_FIELD_TYPE:[B

.field public static final URL_FIELD_TYPE:[B

.field public static final USERNAME_FIELD_TYPE:[B

.field public static final UUID_FIELD_SIZE:[B

.field public static final UUID_FIELD_TYPE:[B

.field public static final ZERO_FIELD_SIZE:[B

.field public static final ZERO_FIVE:[B


# instance fields
.field private mOS:Ljava/io/OutputStream;

.field private mPE:Lcom/keepassdroid/database/PwEntryV3;

.field private outputBytes:J


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    const/4 v2, 0x5

    const/4 v1, 0x4

    .line 31
    const/4 v0, 0x1

    invoke-static {v0}, Lcom/keepassdroid/stream/LEDataOutputStream;->writeUShortBuf(I)[B

    move-result-object v0

    sput-object v0, Lcom/keepassdroid/database/save/PwEntryOutputV3;->UUID_FIELD_TYPE:[B

    .line 32
    const/4 v0, 0x2

    invoke-static {v0}, Lcom/keepassdroid/stream/LEDataOutputStream;->writeUShortBuf(I)[B

    move-result-object v0

    sput-object v0, Lcom/keepassdroid/database/save/PwEntryOutputV3;->GROUPID_FIELD_TYPE:[B

    .line 33
    const/4 v0, 0x3

    invoke-static {v0}, Lcom/keepassdroid/stream/LEDataOutputStream;->writeUShortBuf(I)[B

    move-result-object v0

    sput-object v0, Lcom/keepassdroid/database/save/PwEntryOutputV3;->IMAGEID_FIELD_TYPE:[B

    .line 34
    invoke-static {v1}, Lcom/keepassdroid/stream/LEDataOutputStream;->writeUShortBuf(I)[B

    move-result-object v0

    sput-object v0, Lcom/keepassdroid/database/save/PwEntryOutputV3;->TITLE_FIELD_TYPE:[B

    .line 35
    invoke-static {v2}, Lcom/keepassdroid/stream/LEDataOutputStream;->writeUShortBuf(I)[B

    move-result-object v0

    sput-object v0, Lcom/keepassdroid/database/save/PwEntryOutputV3;->URL_FIELD_TYPE:[B

    .line 36
    const/4 v0, 0x6

    invoke-static {v0}, Lcom/keepassdroid/stream/LEDataOutputStream;->writeUShortBuf(I)[B

    move-result-object v0

    sput-object v0, Lcom/keepassdroid/database/save/PwEntryOutputV3;->USERNAME_FIELD_TYPE:[B

    .line 37
    const/4 v0, 0x7

    invoke-static {v0}, Lcom/keepassdroid/stream/LEDataOutputStream;->writeUShortBuf(I)[B

    move-result-object v0

    sput-object v0, Lcom/keepassdroid/database/save/PwEntryOutputV3;->PASSWORD_FIELD_TYPE:[B

    .line 38
    const/16 v0, 0x8

    invoke-static {v0}, Lcom/keepassdroid/stream/LEDataOutputStream;->writeUShortBuf(I)[B

    move-result-object v0

    sput-object v0, Lcom/keepassdroid/database/save/PwEntryOutputV3;->ADDITIONAL_FIELD_TYPE:[B

    .line 39
    const/16 v0, 0x9

    invoke-static {v0}, Lcom/keepassdroid/stream/LEDataOutputStream;->writeUShortBuf(I)[B

    move-result-object v0

    sput-object v0, Lcom/keepassdroid/database/save/PwEntryOutputV3;->CREATE_FIELD_TYPE:[B

    .line 40
    const/16 v0, 0xa

    invoke-static {v0}, Lcom/keepassdroid/stream/LEDataOutputStream;->writeUShortBuf(I)[B

    move-result-object v0

    sput-object v0, Lcom/keepassdroid/database/save/PwEntryOutputV3;->MOD_FIELD_TYPE:[B

    .line 41
    const/16 v0, 0xb

    invoke-static {v0}, Lcom/keepassdroid/stream/LEDataOutputStream;->writeUShortBuf(I)[B

    move-result-object v0

    sput-object v0, Lcom/keepassdroid/database/save/PwEntryOutputV3;->ACCESS_FIELD_TYPE:[B

    .line 42
    const/16 v0, 0xc

    invoke-static {v0}, Lcom/keepassdroid/stream/LEDataOutputStream;->writeUShortBuf(I)[B

    move-result-object v0

    sput-object v0, Lcom/keepassdroid/database/save/PwEntryOutputV3;->EXPIRE_FIELD_TYPE:[B

    .line 43
    const/16 v0, 0xd

    invoke-static {v0}, Lcom/keepassdroid/stream/LEDataOutputStream;->writeUShortBuf(I)[B

    move-result-object v0

    sput-object v0, Lcom/keepassdroid/database/save/PwEntryOutputV3;->BINARY_DESC_FIELD_TYPE:[B

    .line 44
    const/16 v0, 0xe

    invoke-static {v0}, Lcom/keepassdroid/stream/LEDataOutputStream;->writeUShortBuf(I)[B

    move-result-object v0

    sput-object v0, Lcom/keepassdroid/database/save/PwEntryOutputV3;->BINARY_DATA_FIELD_TYPE:[B

    .line 45
    const v0, 0xffff

    invoke-static {v0}, Lcom/keepassdroid/stream/LEDataOutputStream;->writeUShortBuf(I)[B

    move-result-object v0

    sput-object v0, Lcom/keepassdroid/database/save/PwEntryOutputV3;->END_FIELD_TYPE:[B

    .line 46
    invoke-static {v1}, Lcom/keepassdroid/stream/LEDataOutputStream;->writeIntBuf(I)[B

    move-result-object v0

    sput-object v0, Lcom/keepassdroid/database/save/PwEntryOutputV3;->LONG_FOUR:[B

    .line 47
    const/16 v0, 0x10

    invoke-static {v0}, Lcom/keepassdroid/stream/LEDataOutputStream;->writeIntBuf(I)[B

    move-result-object v0

    sput-object v0, Lcom/keepassdroid/database/save/PwEntryOutputV3;->UUID_FIELD_SIZE:[B

    .line 48
    invoke-static {v2}, Lcom/keepassdroid/stream/LEDataOutputStream;->writeIntBuf(I)[B

    move-result-object v0

    sput-object v0, Lcom/keepassdroid/database/save/PwEntryOutputV3;->DATE_FIELD_SIZE:[B

    .line 49
    sget-object v0, Lcom/keepassdroid/database/save/PwEntryOutputV3;->LONG_FOUR:[B

    sput-object v0, Lcom/keepassdroid/database/save/PwEntryOutputV3;->IMAGEID_FIELD_SIZE:[B

    .line 50
    sget-object v0, Lcom/keepassdroid/database/save/PwEntryOutputV3;->LONG_FOUR:[B

    sput-object v0, Lcom/keepassdroid/database/save/PwEntryOutputV3;->LEVEL_FIELD_SIZE:[B

    .line 51
    sget-object v0, Lcom/keepassdroid/database/save/PwEntryOutputV3;->LONG_FOUR:[B

    sput-object v0, Lcom/keepassdroid/database/save/PwEntryOutputV3;->FLAGS_FIELD_SIZE:[B

    .line 52
    const/4 v0, 0x0

    invoke-static {v0}, Lcom/keepassdroid/stream/LEDataOutputStream;->writeIntBuf(I)[B

    move-result-object v0

    sput-object v0, Lcom/keepassdroid/database/save/PwEntryOutputV3;->ZERO_FIELD_SIZE:[B

    .line 53
    new-array v0, v2, [B

    fill-array-data v0, :array_0

    sput-object v0, Lcom/keepassdroid/database/save/PwEntryOutputV3;->ZERO_FIVE:[B

    .line 54
    new-array v0, v1, [B

    fill-array-data v0, :array_1

    sput-object v0, Lcom/keepassdroid/database/save/PwEntryOutputV3;->TEST:[B

    return-void

    .line 53
    :array_0
    .array-data 1
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
    .end array-data

    .line 54
    nop

    :array_1
    .array-data 1
        0x33t
        0x33t
        0x33t
        0x33t
    .end array-data
.end method

.method public constructor <init>(Lcom/keepassdroid/database/PwEntryV3;Ljava/io/OutputStream;)V
    .locals 2
    .param p1, "pe"    # Lcom/keepassdroid/database/PwEntryV3;
    .param p2, "os"    # Ljava/io/OutputStream;

    .prologue
    .line 64
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 58
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/keepassdroid/database/save/PwEntryOutputV3;->outputBytes:J

    .line 65
    iput-object p1, p0, Lcom/keepassdroid/database/save/PwEntryOutputV3;->mPE:Lcom/keepassdroid/database/PwEntryV3;

    .line 66
    iput-object p2, p0, Lcom/keepassdroid/database/save/PwEntryOutputV3;->mOS:Ljava/io/OutputStream;

    .line 67
    return-void
.end method

.method private writeByteArray([B)I
    .locals 3
    .param p1, "data"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 146
    if-eqz p1, :cond_1

    .line 147
    array-length v0, p1

    .line 151
    .local v0, "dataLen":I
    :goto_0
    iget-object v1, p0, Lcom/keepassdroid/database/save/PwEntryOutputV3;->mOS:Ljava/io/OutputStream;

    sget-object v2, Lcom/keepassdroid/database/save/PwEntryOutputV3;->BINARY_DATA_FIELD_TYPE:[B

    invoke-virtual {v1, v2}, Ljava/io/OutputStream;->write([B)V

    .line 152
    iget-object v1, p0, Lcom/keepassdroid/database/save/PwEntryOutputV3;->mOS:Ljava/io/OutputStream;

    invoke-static {v0}, Lcom/keepassdroid/stream/LEDataOutputStream;->writeIntBuf(I)[B

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/io/OutputStream;->write([B)V

    .line 153
    if-eqz p1, :cond_0

    .line 154
    iget-object v1, p0, Lcom/keepassdroid/database/save/PwEntryOutputV3;->mOS:Ljava/io/OutputStream;

    invoke-virtual {v1, p1}, Ljava/io/OutputStream;->write([B)V

    .line 157
    :cond_0
    return v0

    .line 149
    .end local v0    # "dataLen":I
    :cond_1
    const/4 v0, 0x0

    .restart local v0    # "dataLen":I
    goto :goto_0
.end method

.method private writeDate([B[B)V
    .locals 2
    .param p1, "type"    # [B
    .param p2, "date"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 162
    iget-object v0, p0, Lcom/keepassdroid/database/save/PwEntryOutputV3;->mOS:Ljava/io/OutputStream;

    invoke-virtual {v0, p1}, Ljava/io/OutputStream;->write([B)V

    .line 163
    iget-object v0, p0, Lcom/keepassdroid/database/save/PwEntryOutputV3;->mOS:Ljava/io/OutputStream;

    sget-object v1, Lcom/keepassdroid/database/save/PwEntryOutputV3;->DATE_FIELD_SIZE:[B

    invoke-virtual {v0, v1}, Ljava/io/OutputStream;->write([B)V

    .line 164
    if-eqz p2, :cond_0

    .line 165
    iget-object v0, p0, Lcom/keepassdroid/database/save/PwEntryOutputV3;->mOS:Ljava/io/OutputStream;

    invoke-virtual {v0, p2}, Ljava/io/OutputStream;->write([B)V

    .line 169
    :goto_0
    return-void

    .line 167
    :cond_0
    iget-object v0, p0, Lcom/keepassdroid/database/save/PwEntryOutputV3;->mOS:Ljava/io/OutputStream;

    sget-object v1, Lcom/keepassdroid/database/save/PwEntryOutputV3;->ZERO_FIVE:[B

    invoke-virtual {v0, v1}, Ljava/io/OutputStream;->write([B)V

    goto :goto_0
.end method


# virtual methods
.method public getLength()J
    .locals 2

    .prologue
    .line 175
    iget-wide v0, p0, Lcom/keepassdroid/database/save/PwEntryOutputV3;->outputBytes:J

    return-wide v0
.end method

.method public output()V
    .locals 12
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 72
    iget-wide v8, p0, Lcom/keepassdroid/database/save/PwEntryOutputV3;->outputBytes:J

    const-wide/16 v10, 0x86

    add-long/2addr v8, v10

    iput-wide v8, p0, Lcom/keepassdroid/database/save/PwEntryOutputV3;->outputBytes:J

    .line 75
    iget-object v7, p0, Lcom/keepassdroid/database/save/PwEntryOutputV3;->mOS:Ljava/io/OutputStream;

    sget-object v8, Lcom/keepassdroid/database/save/PwEntryOutputV3;->UUID_FIELD_TYPE:[B

    invoke-virtual {v7, v8}, Ljava/io/OutputStream;->write([B)V

    .line 76
    iget-object v7, p0, Lcom/keepassdroid/database/save/PwEntryOutputV3;->mOS:Ljava/io/OutputStream;

    sget-object v8, Lcom/keepassdroid/database/save/PwEntryOutputV3;->UUID_FIELD_SIZE:[B

    invoke-virtual {v7, v8}, Ljava/io/OutputStream;->write([B)V

    .line 77
    iget-object v7, p0, Lcom/keepassdroid/database/save/PwEntryOutputV3;->mOS:Ljava/io/OutputStream;

    iget-object v8, p0, Lcom/keepassdroid/database/save/PwEntryOutputV3;->mPE:Lcom/keepassdroid/database/PwEntryV3;

    invoke-virtual {v8}, Lcom/keepassdroid/database/PwEntryV3;->getUUID()Ljava/util/UUID;

    move-result-object v8

    invoke-static {v8}, Lcom/keepassdroid/utils/Types;->UUIDtoBytes(Ljava/util/UUID;)[B

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/io/OutputStream;->write([B)V

    .line 80
    iget-object v7, p0, Lcom/keepassdroid/database/save/PwEntryOutputV3;->mOS:Ljava/io/OutputStream;

    sget-object v8, Lcom/keepassdroid/database/save/PwEntryOutputV3;->GROUPID_FIELD_TYPE:[B

    invoke-virtual {v7, v8}, Ljava/io/OutputStream;->write([B)V

    .line 81
    iget-object v7, p0, Lcom/keepassdroid/database/save/PwEntryOutputV3;->mOS:Ljava/io/OutputStream;

    sget-object v8, Lcom/keepassdroid/database/save/PwEntryOutputV3;->LONG_FOUR:[B

    invoke-virtual {v7, v8}, Ljava/io/OutputStream;->write([B)V

    .line 82
    iget-object v7, p0, Lcom/keepassdroid/database/save/PwEntryOutputV3;->mOS:Ljava/io/OutputStream;

    iget-object v8, p0, Lcom/keepassdroid/database/save/PwEntryOutputV3;->mPE:Lcom/keepassdroid/database/PwEntryV3;

    iget v8, v8, Lcom/keepassdroid/database/PwEntryV3;->groupId:I

    invoke-static {v8}, Lcom/keepassdroid/stream/LEDataOutputStream;->writeIntBuf(I)[B

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/io/OutputStream;->write([B)V

    .line 85
    iget-object v7, p0, Lcom/keepassdroid/database/save/PwEntryOutputV3;->mOS:Ljava/io/OutputStream;

    sget-object v8, Lcom/keepassdroid/database/save/PwEntryOutputV3;->IMAGEID_FIELD_TYPE:[B

    invoke-virtual {v7, v8}, Ljava/io/OutputStream;->write([B)V

    .line 86
    iget-object v7, p0, Lcom/keepassdroid/database/save/PwEntryOutputV3;->mOS:Ljava/io/OutputStream;

    sget-object v8, Lcom/keepassdroid/database/save/PwEntryOutputV3;->LONG_FOUR:[B

    invoke-virtual {v7, v8}, Ljava/io/OutputStream;->write([B)V

    .line 87
    iget-object v7, p0, Lcom/keepassdroid/database/save/PwEntryOutputV3;->mOS:Ljava/io/OutputStream;

    iget-object v8, p0, Lcom/keepassdroid/database/save/PwEntryOutputV3;->mPE:Lcom/keepassdroid/database/PwEntryV3;

    iget-object v8, v8, Lcom/keepassdroid/database/PwEntryV3;->icon:Lcom/keepassdroid/database/PwIconStandard;

    iget v8, v8, Lcom/keepassdroid/database/PwIconStandard;->iconId:I

    invoke-static {v8}, Lcom/keepassdroid/stream/LEDataOutputStream;->writeIntBuf(I)[B

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/io/OutputStream;->write([B)V

    .line 91
    iget-object v7, p0, Lcom/keepassdroid/database/save/PwEntryOutputV3;->mOS:Ljava/io/OutputStream;

    sget-object v8, Lcom/keepassdroid/database/save/PwEntryOutputV3;->TITLE_FIELD_TYPE:[B

    invoke-virtual {v7, v8}, Ljava/io/OutputStream;->write([B)V

    .line 92
    iget-object v7, p0, Lcom/keepassdroid/database/save/PwEntryOutputV3;->mPE:Lcom/keepassdroid/database/PwEntryV3;

    iget-object v7, v7, Lcom/keepassdroid/database/PwEntryV3;->title:Ljava/lang/String;

    iget-object v8, p0, Lcom/keepassdroid/database/save/PwEntryOutputV3;->mOS:Ljava/io/OutputStream;

    invoke-static {v7, v8}, Lcom/keepassdroid/utils/Types;->writeCString(Ljava/lang/String;Ljava/io/OutputStream;)I

    move-result v4

    .line 93
    .local v4, "titleLen":I
    iget-wide v8, p0, Lcom/keepassdroid/database/save/PwEntryOutputV3;->outputBytes:J

    int-to-long v10, v4

    add-long/2addr v8, v10

    iput-wide v8, p0, Lcom/keepassdroid/database/save/PwEntryOutputV3;->outputBytes:J

    .line 96
    iget-object v7, p0, Lcom/keepassdroid/database/save/PwEntryOutputV3;->mOS:Ljava/io/OutputStream;

    sget-object v8, Lcom/keepassdroid/database/save/PwEntryOutputV3;->URL_FIELD_TYPE:[B

    invoke-virtual {v7, v8}, Ljava/io/OutputStream;->write([B)V

    .line 97
    iget-object v7, p0, Lcom/keepassdroid/database/save/PwEntryOutputV3;->mPE:Lcom/keepassdroid/database/PwEntryV3;

    iget-object v7, v7, Lcom/keepassdroid/database/PwEntryV3;->url:Ljava/lang/String;

    iget-object v8, p0, Lcom/keepassdroid/database/save/PwEntryOutputV3;->mOS:Ljava/io/OutputStream;

    invoke-static {v7, v8}, Lcom/keepassdroid/utils/Types;->writeCString(Ljava/lang/String;Ljava/io/OutputStream;)I

    move-result v5

    .line 98
    .local v5, "urlLen":I
    iget-wide v8, p0, Lcom/keepassdroid/database/save/PwEntryOutputV3;->outputBytes:J

    int-to-long v10, v5

    add-long/2addr v8, v10

    iput-wide v8, p0, Lcom/keepassdroid/database/save/PwEntryOutputV3;->outputBytes:J

    .line 101
    iget-object v7, p0, Lcom/keepassdroid/database/save/PwEntryOutputV3;->mOS:Ljava/io/OutputStream;

    sget-object v8, Lcom/keepassdroid/database/save/PwEntryOutputV3;->USERNAME_FIELD_TYPE:[B

    invoke-virtual {v7, v8}, Ljava/io/OutputStream;->write([B)V

    .line 102
    iget-object v7, p0, Lcom/keepassdroid/database/save/PwEntryOutputV3;->mPE:Lcom/keepassdroid/database/PwEntryV3;

    iget-object v7, v7, Lcom/keepassdroid/database/PwEntryV3;->username:Ljava/lang/String;

    iget-object v8, p0, Lcom/keepassdroid/database/save/PwEntryOutputV3;->mOS:Ljava/io/OutputStream;

    invoke-static {v7, v8}, Lcom/keepassdroid/utils/Types;->writeCString(Ljava/lang/String;Ljava/io/OutputStream;)I

    move-result v6

    .line 103
    .local v6, "userLen":I
    iget-wide v8, p0, Lcom/keepassdroid/database/save/PwEntryOutputV3;->outputBytes:J

    int-to-long v10, v6

    add-long/2addr v8, v10

    iput-wide v8, p0, Lcom/keepassdroid/database/save/PwEntryOutputV3;->outputBytes:J

    .line 106
    iget-object v7, p0, Lcom/keepassdroid/database/save/PwEntryOutputV3;->mPE:Lcom/keepassdroid/database/PwEntryV3;

    invoke-virtual {v7}, Lcom/keepassdroid/database/PwEntryV3;->getPasswordBytes()[B

    move-result-object v3

    .line 107
    .local v3, "password":[B
    iget-object v7, p0, Lcom/keepassdroid/database/save/PwEntryOutputV3;->mOS:Ljava/io/OutputStream;

    sget-object v8, Lcom/keepassdroid/database/save/PwEntryOutputV3;->PASSWORD_FIELD_TYPE:[B

    invoke-virtual {v7, v8}, Ljava/io/OutputStream;->write([B)V

    .line 108
    iget-object v7, p0, Lcom/keepassdroid/database/save/PwEntryOutputV3;->mOS:Ljava/io/OutputStream;

    array-length v8, v3

    add-int/lit8 v8, v8, 0x1

    invoke-static {v8}, Lcom/keepassdroid/stream/LEDataOutputStream;->writeIntBuf(I)[B

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/io/OutputStream;->write([B)V

    .line 109
    iget-object v7, p0, Lcom/keepassdroid/database/save/PwEntryOutputV3;->mOS:Ljava/io/OutputStream;

    invoke-virtual {v7, v3}, Ljava/io/OutputStream;->write([B)V

    .line 110
    iget-object v7, p0, Lcom/keepassdroid/database/save/PwEntryOutputV3;->mOS:Ljava/io/OutputStream;

    const/4 v8, 0x0

    invoke-virtual {v7, v8}, Ljava/io/OutputStream;->write(I)V

    .line 111
    iget-wide v8, p0, Lcom/keepassdroid/database/save/PwEntryOutputV3;->outputBytes:J

    array-length v7, v3

    add-int/lit8 v7, v7, 0x1

    int-to-long v10, v7

    add-long/2addr v8, v10

    iput-wide v8, p0, Lcom/keepassdroid/database/save/PwEntryOutputV3;->outputBytes:J

    .line 114
    iget-object v7, p0, Lcom/keepassdroid/database/save/PwEntryOutputV3;->mOS:Ljava/io/OutputStream;

    sget-object v8, Lcom/keepassdroid/database/save/PwEntryOutputV3;->ADDITIONAL_FIELD_TYPE:[B

    invoke-virtual {v7, v8}, Ljava/io/OutputStream;->write([B)V

    .line 115
    iget-object v7, p0, Lcom/keepassdroid/database/save/PwEntryOutputV3;->mPE:Lcom/keepassdroid/database/PwEntryV3;

    iget-object v7, v7, Lcom/keepassdroid/database/PwEntryV3;->additional:Ljava/lang/String;

    iget-object v8, p0, Lcom/keepassdroid/database/save/PwEntryOutputV3;->mOS:Ljava/io/OutputStream;

    invoke-static {v7, v8}, Lcom/keepassdroid/utils/Types;->writeCString(Ljava/lang/String;Ljava/io/OutputStream;)I

    move-result v0

    .line 116
    .local v0, "addlLen":I
    iget-wide v8, p0, Lcom/keepassdroid/database/save/PwEntryOutputV3;->outputBytes:J

    int-to-long v10, v0

    add-long/2addr v8, v10

    iput-wide v8, p0, Lcom/keepassdroid/database/save/PwEntryOutputV3;->outputBytes:J

    .line 119
    sget-object v7, Lcom/keepassdroid/database/save/PwEntryOutputV3;->CREATE_FIELD_TYPE:[B

    iget-object v8, p0, Lcom/keepassdroid/database/save/PwEntryOutputV3;->mPE:Lcom/keepassdroid/database/PwEntryV3;

    iget-object v8, v8, Lcom/keepassdroid/database/PwEntryV3;->tCreation:Lcom/keepassdroid/database/PwDate;

    invoke-virtual {v8}, Lcom/keepassdroid/database/PwDate;->getCDate()[B

    move-result-object v8

    invoke-direct {p0, v7, v8}, Lcom/keepassdroid/database/save/PwEntryOutputV3;->writeDate([B[B)V

    .line 122
    sget-object v7, Lcom/keepassdroid/database/save/PwEntryOutputV3;->MOD_FIELD_TYPE:[B

    iget-object v8, p0, Lcom/keepassdroid/database/save/PwEntryOutputV3;->mPE:Lcom/keepassdroid/database/PwEntryV3;

    iget-object v8, v8, Lcom/keepassdroid/database/PwEntryV3;->tLastMod:Lcom/keepassdroid/database/PwDate;

    invoke-virtual {v8}, Lcom/keepassdroid/database/PwDate;->getCDate()[B

    move-result-object v8

    invoke-direct {p0, v7, v8}, Lcom/keepassdroid/database/save/PwEntryOutputV3;->writeDate([B[B)V

    .line 125
    sget-object v7, Lcom/keepassdroid/database/save/PwEntryOutputV3;->ACCESS_FIELD_TYPE:[B

    iget-object v8, p0, Lcom/keepassdroid/database/save/PwEntryOutputV3;->mPE:Lcom/keepassdroid/database/PwEntryV3;

    iget-object v8, v8, Lcom/keepassdroid/database/PwEntryV3;->tLastAccess:Lcom/keepassdroid/database/PwDate;

    invoke-virtual {v8}, Lcom/keepassdroid/database/PwDate;->getCDate()[B

    move-result-object v8

    invoke-direct {p0, v7, v8}, Lcom/keepassdroid/database/save/PwEntryOutputV3;->writeDate([B[B)V

    .line 128
    sget-object v7, Lcom/keepassdroid/database/save/PwEntryOutputV3;->EXPIRE_FIELD_TYPE:[B

    iget-object v8, p0, Lcom/keepassdroid/database/save/PwEntryOutputV3;->mPE:Lcom/keepassdroid/database/PwEntryV3;

    iget-object v8, v8, Lcom/keepassdroid/database/PwEntryV3;->tExpire:Lcom/keepassdroid/database/PwDate;

    invoke-virtual {v8}, Lcom/keepassdroid/database/PwDate;->getCDate()[B

    move-result-object v8

    invoke-direct {p0, v7, v8}, Lcom/keepassdroid/database/save/PwEntryOutputV3;->writeDate([B[B)V

    .line 131
    iget-object v7, p0, Lcom/keepassdroid/database/save/PwEntryOutputV3;->mOS:Ljava/io/OutputStream;

    sget-object v8, Lcom/keepassdroid/database/save/PwEntryOutputV3;->BINARY_DESC_FIELD_TYPE:[B

    invoke-virtual {v7, v8}, Ljava/io/OutputStream;->write([B)V

    .line 132
    iget-object v7, p0, Lcom/keepassdroid/database/save/PwEntryOutputV3;->mPE:Lcom/keepassdroid/database/PwEntryV3;

    iget-object v7, v7, Lcom/keepassdroid/database/PwEntryV3;->binaryDesc:Ljava/lang/String;

    iget-object v8, p0, Lcom/keepassdroid/database/save/PwEntryOutputV3;->mOS:Ljava/io/OutputStream;

    invoke-static {v7, v8}, Lcom/keepassdroid/utils/Types;->writeCString(Ljava/lang/String;Ljava/io/OutputStream;)I

    move-result v2

    .line 133
    .local v2, "descLen":I
    iget-wide v8, p0, Lcom/keepassdroid/database/save/PwEntryOutputV3;->outputBytes:J

    int-to-long v10, v2

    add-long/2addr v8, v10

    iput-wide v8, p0, Lcom/keepassdroid/database/save/PwEntryOutputV3;->outputBytes:J

    .line 136
    iget-object v7, p0, Lcom/keepassdroid/database/save/PwEntryOutputV3;->mPE:Lcom/keepassdroid/database/PwEntryV3;

    invoke-virtual {v7}, Lcom/keepassdroid/database/PwEntryV3;->getBinaryData()[B

    move-result-object v7

    invoke-direct {p0, v7}, Lcom/keepassdroid/database/save/PwEntryOutputV3;->writeByteArray([B)I

    move-result v1

    .line 137
    .local v1, "dataLen":I
    iget-wide v8, p0, Lcom/keepassdroid/database/save/PwEntryOutputV3;->outputBytes:J

    int-to-long v10, v1

    add-long/2addr v8, v10

    iput-wide v8, p0, Lcom/keepassdroid/database/save/PwEntryOutputV3;->outputBytes:J

    .line 140
    iget-object v7, p0, Lcom/keepassdroid/database/save/PwEntryOutputV3;->mOS:Ljava/io/OutputStream;

    sget-object v8, Lcom/keepassdroid/database/save/PwEntryOutputV3;->END_FIELD_TYPE:[B

    invoke-virtual {v7, v8}, Ljava/io/OutputStream;->write([B)V

    .line 141
    iget-object v7, p0, Lcom/keepassdroid/database/save/PwEntryOutputV3;->mOS:Ljava/io/OutputStream;

    sget-object v8, Lcom/keepassdroid/database/save/PwEntryOutputV3;->ZERO_FIELD_SIZE:[B

    invoke-virtual {v7, v8}, Ljava/io/OutputStream;->write([B)V

    .line 142
    return-void
.end method
