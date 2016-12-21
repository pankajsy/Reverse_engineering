.class public Lorg/bouncycastle/crypto/macs/HMac;
.super Ljava/lang/Object;
.source "HMac.java"

# interfaces
.implements Lorg/bouncycastle/crypto/Mac;


# static fields
.field private static final IPAD:B = 0x36t

.field private static final OPAD:B = 0x5ct

.field private static blockLengths:Ljava/util/Hashtable;


# instance fields
.field private blockLength:I

.field private digest:Lorg/bouncycastle/crypto/Digest;

.field private digestSize:I

.field private inputPad:[B

.field private outputPad:[B


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .prologue
    const/16 v4, 0x80

    const/16 v3, 0x40

    .line 34
    new-instance v0, Ljava/util/Hashtable;

    invoke-direct {v0}, Ljava/util/Hashtable;-><init>()V

    sput-object v0, Lorg/bouncycastle/crypto/macs/HMac;->blockLengths:Ljava/util/Hashtable;

    .line 36
    sget-object v0, Lorg/bouncycastle/crypto/macs/HMac;->blockLengths:Ljava/util/Hashtable;

    const-string v1, "GOST3411"

    const/16 v2, 0x20

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 38
    sget-object v0, Lorg/bouncycastle/crypto/macs/HMac;->blockLengths:Ljava/util/Hashtable;

    const-string v1, "MD2"

    const/16 v2, 0x10

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 39
    sget-object v0, Lorg/bouncycastle/crypto/macs/HMac;->blockLengths:Ljava/util/Hashtable;

    const-string v1, "MD4"

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 40
    sget-object v0, Lorg/bouncycastle/crypto/macs/HMac;->blockLengths:Ljava/util/Hashtable;

    const-string v1, "MD5"

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 42
    sget-object v0, Lorg/bouncycastle/crypto/macs/HMac;->blockLengths:Ljava/util/Hashtable;

    const-string v1, "RIPEMD128"

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 43
    sget-object v0, Lorg/bouncycastle/crypto/macs/HMac;->blockLengths:Ljava/util/Hashtable;

    const-string v1, "RIPEMD160"

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 45
    sget-object v0, Lorg/bouncycastle/crypto/macs/HMac;->blockLengths:Ljava/util/Hashtable;

    const-string v1, "SHA-1"

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 46
    sget-object v0, Lorg/bouncycastle/crypto/macs/HMac;->blockLengths:Ljava/util/Hashtable;

    const-string v1, "SHA-224"

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 47
    sget-object v0, Lorg/bouncycastle/crypto/macs/HMac;->blockLengths:Ljava/util/Hashtable;

    const-string v1, "SHA-256"

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 48
    sget-object v0, Lorg/bouncycastle/crypto/macs/HMac;->blockLengths:Ljava/util/Hashtable;

    const-string v1, "SHA-384"

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 49
    sget-object v0, Lorg/bouncycastle/crypto/macs/HMac;->blockLengths:Ljava/util/Hashtable;

    const-string v1, "SHA-512"

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 51
    sget-object v0, Lorg/bouncycastle/crypto/macs/HMac;->blockLengths:Ljava/util/Hashtable;

    const-string v1, "Tiger"

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 52
    sget-object v0, Lorg/bouncycastle/crypto/macs/HMac;->blockLengths:Ljava/util/Hashtable;

    const-string v1, "Whirlpool"

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 53
    return-void
.end method

.method public constructor <init>(Lorg/bouncycastle/crypto/Digest;)V
    .locals 1
    .param p1, "digest"    # Lorg/bouncycastle/crypto/Digest;

    .prologue
    .line 82
    invoke-static {p1}, Lorg/bouncycastle/crypto/macs/HMac;->getByteLength(Lorg/bouncycastle/crypto/Digest;)I

    move-result v0

    invoke-direct {p0, p1, v0}, Lorg/bouncycastle/crypto/macs/HMac;-><init>(Lorg/bouncycastle/crypto/Digest;I)V

    .line 83
    return-void
.end method

.method private constructor <init>(Lorg/bouncycastle/crypto/Digest;I)V
    .locals 1
    .param p1, "digest"    # Lorg/bouncycastle/crypto/Digest;
    .param p2, "byteLength"    # I

    .prologue
    .line 88
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 89
    iput-object p1, p0, Lorg/bouncycastle/crypto/macs/HMac;->digest:Lorg/bouncycastle/crypto/Digest;

    .line 90
    invoke-interface {p1}, Lorg/bouncycastle/crypto/Digest;->getDigestSize()I

    move-result v0

    iput v0, p0, Lorg/bouncycastle/crypto/macs/HMac;->digestSize:I

    .line 92
    iput p2, p0, Lorg/bouncycastle/crypto/macs/HMac;->blockLength:I

    .line 94
    iget v0, p0, Lorg/bouncycastle/crypto/macs/HMac;->blockLength:I

    new-array v0, v0, [B

    iput-object v0, p0, Lorg/bouncycastle/crypto/macs/HMac;->inputPad:[B

    .line 95
    iget v0, p0, Lorg/bouncycastle/crypto/macs/HMac;->blockLength:I

    new-array v0, v0, [B

    iput-object v0, p0, Lorg/bouncycastle/crypto/macs/HMac;->outputPad:[B

    .line 96
    return-void
.end method

.method private static getByteLength(Lorg/bouncycastle/crypto/Digest;)I
    .locals 4
    .param p0, "digest"    # Lorg/bouncycastle/crypto/Digest;

    .prologue
    .line 58
    instance-of v1, p0, Lorg/bouncycastle/crypto/ExtendedDigest;

    if-eqz v1, :cond_0

    .line 60
    check-cast p0, Lorg/bouncycastle/crypto/ExtendedDigest;

    .end local p0    # "digest":Lorg/bouncycastle/crypto/Digest;
    invoke-interface {p0}, Lorg/bouncycastle/crypto/ExtendedDigest;->getByteLength()I

    move-result v1

    .line 70
    .local v0, "b":Ljava/lang/Integer;
    .restart local p0    # "digest":Lorg/bouncycastle/crypto/Digest;
    :goto_0
    return v1

    .line 63
    .end local v0    # "b":Ljava/lang/Integer;
    :cond_0
    sget-object v1, Lorg/bouncycastle/crypto/macs/HMac;->blockLengths:Ljava/util/Hashtable;

    invoke-interface {p0}, Lorg/bouncycastle/crypto/Digest;->getAlgorithmName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    .line 65
    .restart local v0    # "b":Ljava/lang/Integer;
    if-nez v0, :cond_1

    .line 67
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "unknown digest passed: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-interface {p0}, Lorg/bouncycastle/crypto/Digest;->getAlgorithmName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 70
    :cond_1
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v1

    goto :goto_0
.end method


# virtual methods
.method public doFinal([BI)I
    .locals 6
    .param p1, "out"    # [B
    .param p2, "outOff"    # I

    .prologue
    const/4 v5, 0x0

    .line 172
    iget v2, p0, Lorg/bouncycastle/crypto/macs/HMac;->digestSize:I

    new-array v1, v2, [B

    .line 173
    .local v1, "tmp":[B
    iget-object v2, p0, Lorg/bouncycastle/crypto/macs/HMac;->digest:Lorg/bouncycastle/crypto/Digest;

    invoke-interface {v2, v1, v5}, Lorg/bouncycastle/crypto/Digest;->doFinal([BI)I

    .line 175
    iget-object v2, p0, Lorg/bouncycastle/crypto/macs/HMac;->digest:Lorg/bouncycastle/crypto/Digest;

    iget-object v3, p0, Lorg/bouncycastle/crypto/macs/HMac;->outputPad:[B

    iget-object v4, p0, Lorg/bouncycastle/crypto/macs/HMac;->outputPad:[B

    array-length v4, v4

    invoke-interface {v2, v3, v5, v4}, Lorg/bouncycastle/crypto/Digest;->update([BII)V

    .line 176
    iget-object v2, p0, Lorg/bouncycastle/crypto/macs/HMac;->digest:Lorg/bouncycastle/crypto/Digest;

    array-length v3, v1

    invoke-interface {v2, v1, v5, v3}, Lorg/bouncycastle/crypto/Digest;->update([BII)V

    .line 178
    iget-object v2, p0, Lorg/bouncycastle/crypto/macs/HMac;->digest:Lorg/bouncycastle/crypto/Digest;

    invoke-interface {v2, p1, p2}, Lorg/bouncycastle/crypto/Digest;->doFinal([BI)I

    move-result v0

    .line 180
    .local v0, "len":I
    invoke-virtual {p0}, Lorg/bouncycastle/crypto/macs/HMac;->reset()V

    .line 182
    return v0
.end method

.method public getAlgorithmName()Ljava/lang/String;
    .locals 2

    .prologue
    .line 100
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lorg/bouncycastle/crypto/macs/HMac;->digest:Lorg/bouncycastle/crypto/Digest;

    invoke-interface {v1}, Lorg/bouncycastle/crypto/Digest;->getAlgorithmName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "/HMAC"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getMacSize()I
    .locals 1

    .prologue
    .line 151
    iget v0, p0, Lorg/bouncycastle/crypto/macs/HMac;->digestSize:I

    return v0
.end method

.method public getUnderlyingDigest()Lorg/bouncycastle/crypto/Digest;
    .locals 1

    .prologue
    .line 105
    iget-object v0, p0, Lorg/bouncycastle/crypto/macs/HMac;->digest:Lorg/bouncycastle/crypto/Digest;

    return-object v0
.end method

.method public init(Lorg/bouncycastle/crypto/CipherParameters;)V
    .locals 6
    .param p1, "params"    # Lorg/bouncycastle/crypto/CipherParameters;

    .prologue
    const/4 v5, 0x0

    .line 111
    iget-object v2, p0, Lorg/bouncycastle/crypto/macs/HMac;->digest:Lorg/bouncycastle/crypto/Digest;

    invoke-interface {v2}, Lorg/bouncycastle/crypto/Digest;->reset()V

    .line 113
    check-cast p1, Lorg/bouncycastle/crypto/params/KeyParameter;

    .end local p1    # "params":Lorg/bouncycastle/crypto/CipherParameters;
    invoke-virtual {p1}, Lorg/bouncycastle/crypto/params/KeyParameter;->getKey()[B

    move-result-object v1

    .line 115
    .local v1, "key":[B
    array-length v2, v1

    iget v3, p0, Lorg/bouncycastle/crypto/macs/HMac;->blockLength:I

    if-le v2, v3, :cond_0

    .line 117
    iget-object v2, p0, Lorg/bouncycastle/crypto/macs/HMac;->digest:Lorg/bouncycastle/crypto/Digest;

    array-length v3, v1

    invoke-interface {v2, v1, v5, v3}, Lorg/bouncycastle/crypto/Digest;->update([BII)V

    .line 118
    iget-object v2, p0, Lorg/bouncycastle/crypto/macs/HMac;->digest:Lorg/bouncycastle/crypto/Digest;

    iget-object v3, p0, Lorg/bouncycastle/crypto/macs/HMac;->inputPad:[B

    invoke-interface {v2, v3, v5}, Lorg/bouncycastle/crypto/Digest;->doFinal([BI)I

    .line 119
    iget v0, p0, Lorg/bouncycastle/crypto/macs/HMac;->digestSize:I

    .local v0, "i":I
    :goto_0
    iget-object v2, p0, Lorg/bouncycastle/crypto/macs/HMac;->inputPad:[B

    array-length v2, v2

    if-ge v0, v2, :cond_1

    .line 121
    iget-object v2, p0, Lorg/bouncycastle/crypto/macs/HMac;->inputPad:[B

    aput-byte v5, v2, v0

    .line 119
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 126
    .end local v0    # "i":I
    :cond_0
    iget-object v2, p0, Lorg/bouncycastle/crypto/macs/HMac;->inputPad:[B

    array-length v3, v1

    invoke-static {v1, v5, v2, v5, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 127
    array-length v0, v1

    .restart local v0    # "i":I
    :goto_1
    iget-object v2, p0, Lorg/bouncycastle/crypto/macs/HMac;->inputPad:[B

    array-length v2, v2

    if-ge v0, v2, :cond_1

    .line 129
    iget-object v2, p0, Lorg/bouncycastle/crypto/macs/HMac;->inputPad:[B

    aput-byte v5, v2, v0

    .line 127
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 133
    :cond_1
    iget-object v2, p0, Lorg/bouncycastle/crypto/macs/HMac;->inputPad:[B

    array-length v2, v2

    new-array v2, v2, [B

    iput-object v2, p0, Lorg/bouncycastle/crypto/macs/HMac;->outputPad:[B

    .line 134
    iget-object v2, p0, Lorg/bouncycastle/crypto/macs/HMac;->inputPad:[B

    iget-object v3, p0, Lorg/bouncycastle/crypto/macs/HMac;->outputPad:[B

    iget-object v4, p0, Lorg/bouncycastle/crypto/macs/HMac;->inputPad:[B

    array-length v4, v4

    invoke-static {v2, v5, v3, v5, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 136
    const/4 v0, 0x0

    :goto_2
    iget-object v2, p0, Lorg/bouncycastle/crypto/macs/HMac;->inputPad:[B

    array-length v2, v2

    if-ge v0, v2, :cond_2

    .line 138
    iget-object v2, p0, Lorg/bouncycastle/crypto/macs/HMac;->inputPad:[B

    aget-byte v3, v2, v0

    xor-int/lit8 v3, v3, 0x36

    int-to-byte v3, v3

    aput-byte v3, v2, v0

    .line 136
    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    .line 141
    :cond_2
    const/4 v0, 0x0

    :goto_3
    iget-object v2, p0, Lorg/bouncycastle/crypto/macs/HMac;->outputPad:[B

    array-length v2, v2

    if-ge v0, v2, :cond_3

    .line 143
    iget-object v2, p0, Lorg/bouncycastle/crypto/macs/HMac;->outputPad:[B

    aget-byte v3, v2, v0

    xor-int/lit8 v3, v3, 0x5c

    int-to-byte v3, v3

    aput-byte v3, v2, v0

    .line 141
    add-int/lit8 v0, v0, 0x1

    goto :goto_3

    .line 146
    :cond_3
    iget-object v2, p0, Lorg/bouncycastle/crypto/macs/HMac;->digest:Lorg/bouncycastle/crypto/Digest;

    iget-object v3, p0, Lorg/bouncycastle/crypto/macs/HMac;->inputPad:[B

    iget-object v4, p0, Lorg/bouncycastle/crypto/macs/HMac;->inputPad:[B

    array-length v4, v4

    invoke-interface {v2, v3, v5, v4}, Lorg/bouncycastle/crypto/Digest;->update([BII)V

    .line 147
    return-void
.end method

.method public reset()V
    .locals 4

    .prologue
    .line 193
    iget-object v0, p0, Lorg/bouncycastle/crypto/macs/HMac;->digest:Lorg/bouncycastle/crypto/Digest;

    invoke-interface {v0}, Lorg/bouncycastle/crypto/Digest;->reset()V

    .line 198
    iget-object v0, p0, Lorg/bouncycastle/crypto/macs/HMac;->digest:Lorg/bouncycastle/crypto/Digest;

    iget-object v1, p0, Lorg/bouncycastle/crypto/macs/HMac;->inputPad:[B

    const/4 v2, 0x0

    iget-object v3, p0, Lorg/bouncycastle/crypto/macs/HMac;->inputPad:[B

    array-length v3, v3

    invoke-interface {v0, v1, v2, v3}, Lorg/bouncycastle/crypto/Digest;->update([BII)V

    .line 199
    return-void
.end method

.method public update(B)V
    .locals 1
    .param p1, "in"    # B

    .prologue
    .line 157
    iget-object v0, p0, Lorg/bouncycastle/crypto/macs/HMac;->digest:Lorg/bouncycastle/crypto/Digest;

    invoke-interface {v0, p1}, Lorg/bouncycastle/crypto/Digest;->update(B)V

    .line 158
    return-void
.end method

.method public update([BII)V
    .locals 1
    .param p1, "in"    # [B
    .param p2, "inOff"    # I
    .param p3, "len"    # I

    .prologue
    .line 165
    iget-object v0, p0, Lorg/bouncycastle/crypto/macs/HMac;->digest:Lorg/bouncycastle/crypto/Digest;

    invoke-interface {v0, p1, p2, p3}, Lorg/bouncycastle/crypto/Digest;->update([BII)V

    .line 166
    return-void
.end method
