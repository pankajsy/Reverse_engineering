.class public Lcom/keepassdroid/utils/UuidUtil;
.super Ljava/lang/Object;
.source "UuidUtil.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static byteToChar(C)C
    .locals 1
    .param p0, "bt"    # C

    .prologue
    .line 58
    const/16 v0, 0xa

    if-lt p0, v0, :cond_0

    .line 59
    add-int/lit8 v0, p0, 0x41

    add-int/lit8 v0, v0, -0xa

    int-to-char v0, v0

    .line 62
    :goto_0
    return v0

    :cond_0
    add-int/lit8 v0, p0, 0x30

    int-to-char v0, v0

    goto :goto_0
.end method

.method public static toHexString(Ljava/util/UUID;)Ljava/lang/String;
    .locals 10
    .param p0, "uuid"    # Ljava/util/UUID;

    .prologue
    const/4 v9, 0x0

    .line 26
    if-nez p0, :cond_1

    .line 53
    :cond_0
    :goto_0
    return-object v9

    .line 28
    :cond_1
    invoke-static {p0}, Lcom/keepassdroid/utils/Types;->UUIDtoBytes(Ljava/util/UUID;)[B

    move-result-object v1

    .line 29
    .local v1, "buf":[B
    if-eqz v1, :cond_0

    .line 31
    array-length v6, v1

    .line 32
    .local v6, "len":I
    if-nez v6, :cond_2

    const-string v9, ""

    goto :goto_0

    .line 34
    :cond_2
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    .line 38
    .local v8, "sb":Ljava/lang/StringBuilder;
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_1
    if-ge v4, v6, :cond_3

    .line 39
    aget-byte v9, v1, v4

    and-int/lit16 v9, v9, 0xff

    int-to-short v0, v9

    .line 40
    .local v0, "bt":S
    ushr-int/lit8 v9, v0, 0x4

    int-to-char v3, v9

    .line 43
    .local v3, "high":C
    and-int/lit8 v9, v0, 0xf

    int-to-char v7, v9

    .line 46
    .local v7, "low":C
    invoke-static {v3}, Lcom/keepassdroid/utils/UuidUtil;->byteToChar(C)C

    move-result v2

    .line 47
    .local v2, "h":C
    invoke-static {v7}, Lcom/keepassdroid/utils/UuidUtil;->byteToChar(C)C

    move-result v5

    .line 49
    .local v5, "l":C
    invoke-static {v3}, Lcom/keepassdroid/utils/UuidUtil;->byteToChar(C)C

    move-result v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 50
    invoke-static {v7}, Lcom/keepassdroid/utils/UuidUtil;->byteToChar(C)C

    move-result v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 38
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .line 53
    .end local v0    # "bt":S
    .end local v2    # "h":C
    .end local v3    # "high":C
    .end local v5    # "l":C
    .end local v7    # "low":C
    :cond_3
    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    goto :goto_0
.end method
