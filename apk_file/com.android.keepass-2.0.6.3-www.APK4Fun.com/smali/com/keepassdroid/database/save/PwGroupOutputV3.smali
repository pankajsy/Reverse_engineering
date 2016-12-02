.class public Lcom/keepassdroid/database/save/PwGroupOutputV3;
.super Ljava/lang/Object;
.source "PwGroupOutputV3.java"


# static fields
.field public static final ACCESS_FIELD_TYPE:[B

.field public static final CREATE_FIELD_TYPE:[B

.field public static final DATE_FIELD_SIZE:[B

.field public static final END_FIELD_TYPE:[B

.field public static final EXPIRE_FIELD_TYPE:[B

.field public static final FLAGS_FIELD_SIZE:[B

.field public static final FLAGS_FIELD_TYPE:[B

.field public static final GROUPID_FIELD_SIZE:[B

.field public static final GROUPID_FIELD_TYPE:[B

.field public static final IMAGEID_FIELD_SIZE:[B

.field public static final IMAGEID_FIELD_TYPE:[B

.field public static final LEVEL_FIELD_SIZE:[B

.field public static final LEVEL_FIELD_TYPE:[B

.field public static final LONG_FOUR:[B

.field public static final MOD_FIELD_TYPE:[B

.field public static final NAME_FIELD_TYPE:[B

.field public static final ZERO_FIELD_SIZE:[B


# instance fields
.field private mOS:Ljava/io/OutputStream;

.field private mPG:Lcom/keepassdroid/database/PwGroupV3;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    const/4 v3, 0x5

    const/4 v2, 0x4

    const/4 v1, 0x2

    .line 32
    const/4 v0, 0x1

    invoke-static {v0}, Lcom/keepassdroid/stream/LEDataOutputStream;->writeUShortBuf(I)[B

    move-result-object v0

    sput-object v0, Lcom/keepassdroid/database/save/PwGroupOutputV3;->GROUPID_FIELD_TYPE:[B

    .line 33
    invoke-static {v1}, Lcom/keepassdroid/stream/LEDataOutputStream;->writeUShortBuf(I)[B

    move-result-object v0

    sput-object v0, Lcom/keepassdroid/database/save/PwGroupOutputV3;->NAME_FIELD_TYPE:[B

    .line 34
    const/4 v0, 0x3

    invoke-static {v0}, Lcom/keepassdroid/stream/LEDataOutputStream;->writeUShortBuf(I)[B

    move-result-object v0

    sput-object v0, Lcom/keepassdroid/database/save/PwGroupOutputV3;->CREATE_FIELD_TYPE:[B

    .line 35
    invoke-static {v2}, Lcom/keepassdroid/stream/LEDataOutputStream;->writeUShortBuf(I)[B

    move-result-object v0

    sput-object v0, Lcom/keepassdroid/database/save/PwGroupOutputV3;->MOD_FIELD_TYPE:[B

    .line 36
    invoke-static {v3}, Lcom/keepassdroid/stream/LEDataOutputStream;->writeUShortBuf(I)[B

    move-result-object v0

    sput-object v0, Lcom/keepassdroid/database/save/PwGroupOutputV3;->ACCESS_FIELD_TYPE:[B

    .line 37
    const/4 v0, 0x6

    invoke-static {v0}, Lcom/keepassdroid/stream/LEDataOutputStream;->writeUShortBuf(I)[B

    move-result-object v0

    sput-object v0, Lcom/keepassdroid/database/save/PwGroupOutputV3;->EXPIRE_FIELD_TYPE:[B

    .line 38
    const/4 v0, 0x7

    invoke-static {v0}, Lcom/keepassdroid/stream/LEDataOutputStream;->writeUShortBuf(I)[B

    move-result-object v0

    sput-object v0, Lcom/keepassdroid/database/save/PwGroupOutputV3;->IMAGEID_FIELD_TYPE:[B

    .line 39
    const/16 v0, 0x8

    invoke-static {v0}, Lcom/keepassdroid/stream/LEDataOutputStream;->writeUShortBuf(I)[B

    move-result-object v0

    sput-object v0, Lcom/keepassdroid/database/save/PwGroupOutputV3;->LEVEL_FIELD_TYPE:[B

    .line 40
    const/16 v0, 0x9

    invoke-static {v0}, Lcom/keepassdroid/stream/LEDataOutputStream;->writeUShortBuf(I)[B

    move-result-object v0

    sput-object v0, Lcom/keepassdroid/database/save/PwGroupOutputV3;->FLAGS_FIELD_TYPE:[B

    .line 41
    const v0, 0xffff

    invoke-static {v0}, Lcom/keepassdroid/stream/LEDataOutputStream;->writeUShortBuf(I)[B

    move-result-object v0

    sput-object v0, Lcom/keepassdroid/database/save/PwGroupOutputV3;->END_FIELD_TYPE:[B

    .line 42
    invoke-static {v2}, Lcom/keepassdroid/stream/LEDataOutputStream;->writeIntBuf(I)[B

    move-result-object v0

    sput-object v0, Lcom/keepassdroid/database/save/PwGroupOutputV3;->LONG_FOUR:[B

    .line 43
    sget-object v0, Lcom/keepassdroid/database/save/PwGroupOutputV3;->LONG_FOUR:[B

    sput-object v0, Lcom/keepassdroid/database/save/PwGroupOutputV3;->GROUPID_FIELD_SIZE:[B

    .line 44
    invoke-static {v3}, Lcom/keepassdroid/stream/LEDataOutputStream;->writeIntBuf(I)[B

    move-result-object v0

    sput-object v0, Lcom/keepassdroid/database/save/PwGroupOutputV3;->DATE_FIELD_SIZE:[B

    .line 45
    sget-object v0, Lcom/keepassdroid/database/save/PwGroupOutputV3;->LONG_FOUR:[B

    sput-object v0, Lcom/keepassdroid/database/save/PwGroupOutputV3;->IMAGEID_FIELD_SIZE:[B

    .line 46
    invoke-static {v1}, Lcom/keepassdroid/stream/LEDataOutputStream;->writeIntBuf(I)[B

    move-result-object v0

    sput-object v0, Lcom/keepassdroid/database/save/PwGroupOutputV3;->LEVEL_FIELD_SIZE:[B

    .line 47
    sget-object v0, Lcom/keepassdroid/database/save/PwGroupOutputV3;->LONG_FOUR:[B

    sput-object v0, Lcom/keepassdroid/database/save/PwGroupOutputV3;->FLAGS_FIELD_SIZE:[B

    .line 48
    const/4 v0, 0x0

    invoke-static {v0}, Lcom/keepassdroid/stream/LEDataOutputStream;->writeIntBuf(I)[B

    move-result-object v0

    sput-object v0, Lcom/keepassdroid/database/save/PwGroupOutputV3;->ZERO_FIELD_SIZE:[B

    return-void
.end method

.method public constructor <init>(Lcom/keepassdroid/database/PwGroupV3;Ljava/io/OutputStream;)V
    .locals 0
    .param p1, "pg"    # Lcom/keepassdroid/database/PwGroupV3;
    .param p2, "os"    # Ljava/io/OutputStream;

    .prologue
    .line 57
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 58
    iput-object p1, p0, Lcom/keepassdroid/database/save/PwGroupOutputV3;->mPG:Lcom/keepassdroid/database/PwGroupV3;

    .line 59
    iput-object p2, p0, Lcom/keepassdroid/database/save/PwGroupOutputV3;->mOS:Ljava/io/OutputStream;

    .line 60
    return-void
.end method


# virtual methods
.method public output()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 66
    iget-object v0, p0, Lcom/keepassdroid/database/save/PwGroupOutputV3;->mOS:Ljava/io/OutputStream;

    sget-object v1, Lcom/keepassdroid/database/save/PwGroupOutputV3;->GROUPID_FIELD_TYPE:[B

    invoke-virtual {v0, v1}, Ljava/io/OutputStream;->write([B)V

    .line 67
    iget-object v0, p0, Lcom/keepassdroid/database/save/PwGroupOutputV3;->mOS:Ljava/io/OutputStream;

    sget-object v1, Lcom/keepassdroid/database/save/PwGroupOutputV3;->GROUPID_FIELD_SIZE:[B

    invoke-virtual {v0, v1}, Ljava/io/OutputStream;->write([B)V

    .line 68
    iget-object v0, p0, Lcom/keepassdroid/database/save/PwGroupOutputV3;->mOS:Ljava/io/OutputStream;

    iget-object v1, p0, Lcom/keepassdroid/database/save/PwGroupOutputV3;->mPG:Lcom/keepassdroid/database/PwGroupV3;

    iget v1, v1, Lcom/keepassdroid/database/PwGroupV3;->groupId:I

    invoke-static {v1}, Lcom/keepassdroid/stream/LEDataOutputStream;->writeIntBuf(I)[B

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/OutputStream;->write([B)V

    .line 71
    iget-object v0, p0, Lcom/keepassdroid/database/save/PwGroupOutputV3;->mOS:Ljava/io/OutputStream;

    sget-object v1, Lcom/keepassdroid/database/save/PwGroupOutputV3;->NAME_FIELD_TYPE:[B

    invoke-virtual {v0, v1}, Ljava/io/OutputStream;->write([B)V

    .line 72
    iget-object v0, p0, Lcom/keepassdroid/database/save/PwGroupOutputV3;->mPG:Lcom/keepassdroid/database/PwGroupV3;

    iget-object v0, v0, Lcom/keepassdroid/database/PwGroupV3;->name:Ljava/lang/String;

    iget-object v1, p0, Lcom/keepassdroid/database/save/PwGroupOutputV3;->mOS:Ljava/io/OutputStream;

    invoke-static {v0, v1}, Lcom/keepassdroid/utils/Types;->writeCString(Ljava/lang/String;Ljava/io/OutputStream;)I

    .line 75
    iget-object v0, p0, Lcom/keepassdroid/database/save/PwGroupOutputV3;->mOS:Ljava/io/OutputStream;

    sget-object v1, Lcom/keepassdroid/database/save/PwGroupOutputV3;->CREATE_FIELD_TYPE:[B

    invoke-virtual {v0, v1}, Ljava/io/OutputStream;->write([B)V

    .line 76
    iget-object v0, p0, Lcom/keepassdroid/database/save/PwGroupOutputV3;->mOS:Ljava/io/OutputStream;

    sget-object v1, Lcom/keepassdroid/database/save/PwGroupOutputV3;->DATE_FIELD_SIZE:[B

    invoke-virtual {v0, v1}, Ljava/io/OutputStream;->write([B)V

    .line 77
    iget-object v0, p0, Lcom/keepassdroid/database/save/PwGroupOutputV3;->mOS:Ljava/io/OutputStream;

    iget-object v1, p0, Lcom/keepassdroid/database/save/PwGroupOutputV3;->mPG:Lcom/keepassdroid/database/PwGroupV3;

    iget-object v1, v1, Lcom/keepassdroid/database/PwGroupV3;->tCreation:Lcom/keepassdroid/database/PwDate;

    invoke-virtual {v1}, Lcom/keepassdroid/database/PwDate;->getCDate()[B

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/OutputStream;->write([B)V

    .line 80
    iget-object v0, p0, Lcom/keepassdroid/database/save/PwGroupOutputV3;->mOS:Ljava/io/OutputStream;

    sget-object v1, Lcom/keepassdroid/database/save/PwGroupOutputV3;->MOD_FIELD_TYPE:[B

    invoke-virtual {v0, v1}, Ljava/io/OutputStream;->write([B)V

    .line 81
    iget-object v0, p0, Lcom/keepassdroid/database/save/PwGroupOutputV3;->mOS:Ljava/io/OutputStream;

    sget-object v1, Lcom/keepassdroid/database/save/PwGroupOutputV3;->DATE_FIELD_SIZE:[B

    invoke-virtual {v0, v1}, Ljava/io/OutputStream;->write([B)V

    .line 82
    iget-object v0, p0, Lcom/keepassdroid/database/save/PwGroupOutputV3;->mOS:Ljava/io/OutputStream;

    iget-object v1, p0, Lcom/keepassdroid/database/save/PwGroupOutputV3;->mPG:Lcom/keepassdroid/database/PwGroupV3;

    iget-object v1, v1, Lcom/keepassdroid/database/PwGroupV3;->tLastMod:Lcom/keepassdroid/database/PwDate;

    invoke-virtual {v1}, Lcom/keepassdroid/database/PwDate;->getCDate()[B

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/OutputStream;->write([B)V

    .line 85
    iget-object v0, p0, Lcom/keepassdroid/database/save/PwGroupOutputV3;->mOS:Ljava/io/OutputStream;

    sget-object v1, Lcom/keepassdroid/database/save/PwGroupOutputV3;->ACCESS_FIELD_TYPE:[B

    invoke-virtual {v0, v1}, Ljava/io/OutputStream;->write([B)V

    .line 86
    iget-object v0, p0, Lcom/keepassdroid/database/save/PwGroupOutputV3;->mOS:Ljava/io/OutputStream;

    sget-object v1, Lcom/keepassdroid/database/save/PwGroupOutputV3;->DATE_FIELD_SIZE:[B

    invoke-virtual {v0, v1}, Ljava/io/OutputStream;->write([B)V

    .line 87
    iget-object v0, p0, Lcom/keepassdroid/database/save/PwGroupOutputV3;->mOS:Ljava/io/OutputStream;

    iget-object v1, p0, Lcom/keepassdroid/database/save/PwGroupOutputV3;->mPG:Lcom/keepassdroid/database/PwGroupV3;

    iget-object v1, v1, Lcom/keepassdroid/database/PwGroupV3;->tLastAccess:Lcom/keepassdroid/database/PwDate;

    invoke-virtual {v1}, Lcom/keepassdroid/database/PwDate;->getCDate()[B

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/OutputStream;->write([B)V

    .line 90
    iget-object v0, p0, Lcom/keepassdroid/database/save/PwGroupOutputV3;->mOS:Ljava/io/OutputStream;

    sget-object v1, Lcom/keepassdroid/database/save/PwGroupOutputV3;->EXPIRE_FIELD_TYPE:[B

    invoke-virtual {v0, v1}, Ljava/io/OutputStream;->write([B)V

    .line 91
    iget-object v0, p0, Lcom/keepassdroid/database/save/PwGroupOutputV3;->mOS:Ljava/io/OutputStream;

    sget-object v1, Lcom/keepassdroid/database/save/PwGroupOutputV3;->DATE_FIELD_SIZE:[B

    invoke-virtual {v0, v1}, Ljava/io/OutputStream;->write([B)V

    .line 92
    iget-object v0, p0, Lcom/keepassdroid/database/save/PwGroupOutputV3;->mOS:Ljava/io/OutputStream;

    iget-object v1, p0, Lcom/keepassdroid/database/save/PwGroupOutputV3;->mPG:Lcom/keepassdroid/database/PwGroupV3;

    iget-object v1, v1, Lcom/keepassdroid/database/PwGroupV3;->tExpire:Lcom/keepassdroid/database/PwDate;

    invoke-virtual {v1}, Lcom/keepassdroid/database/PwDate;->getCDate()[B

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/OutputStream;->write([B)V

    .line 95
    iget-object v0, p0, Lcom/keepassdroid/database/save/PwGroupOutputV3;->mOS:Ljava/io/OutputStream;

    sget-object v1, Lcom/keepassdroid/database/save/PwGroupOutputV3;->IMAGEID_FIELD_TYPE:[B

    invoke-virtual {v0, v1}, Ljava/io/OutputStream;->write([B)V

    .line 96
    iget-object v0, p0, Lcom/keepassdroid/database/save/PwGroupOutputV3;->mOS:Ljava/io/OutputStream;

    sget-object v1, Lcom/keepassdroid/database/save/PwGroupOutputV3;->IMAGEID_FIELD_SIZE:[B

    invoke-virtual {v0, v1}, Ljava/io/OutputStream;->write([B)V

    .line 97
    iget-object v0, p0, Lcom/keepassdroid/database/save/PwGroupOutputV3;->mOS:Ljava/io/OutputStream;

    iget-object v1, p0, Lcom/keepassdroid/database/save/PwGroupOutputV3;->mPG:Lcom/keepassdroid/database/PwGroupV3;

    iget-object v1, v1, Lcom/keepassdroid/database/PwGroupV3;->icon:Lcom/keepassdroid/database/PwIconStandard;

    iget v1, v1, Lcom/keepassdroid/database/PwIconStandard;->iconId:I

    invoke-static {v1}, Lcom/keepassdroid/stream/LEDataOutputStream;->writeIntBuf(I)[B

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/OutputStream;->write([B)V

    .line 100
    iget-object v0, p0, Lcom/keepassdroid/database/save/PwGroupOutputV3;->mOS:Ljava/io/OutputStream;

    sget-object v1, Lcom/keepassdroid/database/save/PwGroupOutputV3;->LEVEL_FIELD_TYPE:[B

    invoke-virtual {v0, v1}, Ljava/io/OutputStream;->write([B)V

    .line 101
    iget-object v0, p0, Lcom/keepassdroid/database/save/PwGroupOutputV3;->mOS:Ljava/io/OutputStream;

    sget-object v1, Lcom/keepassdroid/database/save/PwGroupOutputV3;->LEVEL_FIELD_SIZE:[B

    invoke-virtual {v0, v1}, Ljava/io/OutputStream;->write([B)V

    .line 102
    iget-object v0, p0, Lcom/keepassdroid/database/save/PwGroupOutputV3;->mOS:Ljava/io/OutputStream;

    iget-object v1, p0, Lcom/keepassdroid/database/save/PwGroupOutputV3;->mPG:Lcom/keepassdroid/database/PwGroupV3;

    iget v1, v1, Lcom/keepassdroid/database/PwGroupV3;->level:I

    invoke-static {v1}, Lcom/keepassdroid/stream/LEDataOutputStream;->writeUShortBuf(I)[B

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/OutputStream;->write([B)V

    .line 105
    iget-object v0, p0, Lcom/keepassdroid/database/save/PwGroupOutputV3;->mOS:Ljava/io/OutputStream;

    sget-object v1, Lcom/keepassdroid/database/save/PwGroupOutputV3;->FLAGS_FIELD_TYPE:[B

    invoke-virtual {v0, v1}, Ljava/io/OutputStream;->write([B)V

    .line 106
    iget-object v0, p0, Lcom/keepassdroid/database/save/PwGroupOutputV3;->mOS:Ljava/io/OutputStream;

    sget-object v1, Lcom/keepassdroid/database/save/PwGroupOutputV3;->FLAGS_FIELD_SIZE:[B

    invoke-virtual {v0, v1}, Ljava/io/OutputStream;->write([B)V

    .line 107
    iget-object v0, p0, Lcom/keepassdroid/database/save/PwGroupOutputV3;->mOS:Ljava/io/OutputStream;

    iget-object v1, p0, Lcom/keepassdroid/database/save/PwGroupOutputV3;->mPG:Lcom/keepassdroid/database/PwGroupV3;

    iget v1, v1, Lcom/keepassdroid/database/PwGroupV3;->flags:I

    invoke-static {v1}, Lcom/keepassdroid/stream/LEDataOutputStream;->writeIntBuf(I)[B

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/OutputStream;->write([B)V

    .line 110
    iget-object v0, p0, Lcom/keepassdroid/database/save/PwGroupOutputV3;->mOS:Ljava/io/OutputStream;

    sget-object v1, Lcom/keepassdroid/database/save/PwGroupOutputV3;->END_FIELD_TYPE:[B

    invoke-virtual {v0, v1}, Ljava/io/OutputStream;->write([B)V

    .line 111
    iget-object v0, p0, Lcom/keepassdroid/database/save/PwGroupOutputV3;->mOS:Ljava/io/OutputStream;

    sget-object v1, Lcom/keepassdroid/database/save/PwGroupOutputV3;->ZERO_FIELD_SIZE:[B

    invoke-virtual {v0, v1}, Ljava/io/OutputStream;->write([B)V

    .line 112
    return-void
.end method
