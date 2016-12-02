.class public Lcom/keepassdroid/crypto/NativeAESCipherSpi;
.super Ljavax/crypto/CipherSpi;
.source "NativeAESCipherSpi.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/keepassdroid/crypto/NativeAESCipherSpi$Cleanup;
    }
.end annotation


# static fields
.field private static mCleanup:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/ref/PhantomReference",
            "<",
            "Lcom/keepassdroid/crypto/NativeAESCipherSpi;",
            ">;",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end field

.field private static mIsStaticInit:Z

.field private static mQueue:Ljava/lang/ref/ReferenceQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/ReferenceQueue",
            "<",
            "Lcom/keepassdroid/crypto/NativeAESCipherSpi;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final AES_BLOCK_SIZE:I

.field private mCtxPtr:J

.field private mEncrypting:Z

.field private mIV:[B

.field private mIsInited:Z

.field private mPadding:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 47
    const/4 v0, 0x0

    sput-boolean v0, Lcom/keepassdroid/crypto/NativeAESCipherSpi;->mIsStaticInit:Z

    .line 48
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/keepassdroid/crypto/NativeAESCipherSpi;->mCleanup:Ljava/util/HashMap;

    .line 49
    new-instance v0, Ljava/lang/ref/ReferenceQueue;

    invoke-direct {v0}, Ljava/lang/ref/ReferenceQueue;-><init>()V

    sput-object v0, Lcom/keepassdroid/crypto/NativeAESCipherSpi;->mQueue:Ljava/lang/ref/ReferenceQueue;

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 98
    invoke-direct {p0}, Ljavax/crypto/CipherSpi;-><init>()V

    .line 51
    const/16 v0, 0x10

    iput v0, p0, Lcom/keepassdroid/crypto/NativeAESCipherSpi;->AES_BLOCK_SIZE:I

    .line 54
    iput-boolean v1, p0, Lcom/keepassdroid/crypto/NativeAESCipherSpi;->mIsInited:Z

    .line 55
    iput-boolean v1, p0, Lcom/keepassdroid/crypto/NativeAESCipherSpi;->mEncrypting:Z

    .line 58
    iput-boolean v1, p0, Lcom/keepassdroid/crypto/NativeAESCipherSpi;->mPadding:Z

    .line 99
    sget-boolean v0, Lcom/keepassdroid/crypto/NativeAESCipherSpi;->mIsStaticInit:Z

    if-nez v0, :cond_0

    .line 100
    invoke-static {}, Lcom/keepassdroid/crypto/NativeAESCipherSpi;->staticInit()V

    .line 102
    :cond_0
    return-void
.end method

.method static synthetic access$100()Ljava/lang/ref/ReferenceQueue;
    .locals 1

    .prologue
    .line 45
    sget-object v0, Lcom/keepassdroid/crypto/NativeAESCipherSpi;->mQueue:Ljava/lang/ref/ReferenceQueue;

    return-object v0
.end method

.method static synthetic access$200()Ljava/util/HashMap;
    .locals 1

    .prologue
    .line 45
    sget-object v0, Lcom/keepassdroid/crypto/NativeAESCipherSpi;->mCleanup:Ljava/util/HashMap;

    return-object v0
.end method

.method static synthetic access$300(J)V
    .locals 0
    .param p0, "x0"    # J

    .prologue
    .line 45
    invoke-static {p0, p1}, Lcom/keepassdroid/crypto/NativeAESCipherSpi;->nCleanup(J)V

    return-void
.end method

.method private static addToCleanupQueue(Lcom/keepassdroid/crypto/NativeAESCipherSpi;J)V
    .locals 3
    .param p0, "ref"    # Lcom/keepassdroid/crypto/NativeAESCipherSpi;
    .param p1, "ptr"    # J

    .prologue
    .line 68
    const-string v0, "KeepassDroid"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "queued cipher context: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 69
    sget-object v0, Lcom/keepassdroid/crypto/NativeAESCipherSpi;->mCleanup:Ljava/util/HashMap;

    new-instance v1, Ljava/lang/ref/PhantomReference;

    sget-object v2, Lcom/keepassdroid/crypto/NativeAESCipherSpi;->mQueue:Ljava/lang/ref/ReferenceQueue;

    invoke-direct {v1, p0, v2}, Ljava/lang/ref/PhantomReference;-><init>(Ljava/lang/Object;Ljava/lang/ref/ReferenceQueue;)V

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 70
    return-void
.end method

.method private doFinal([BII[BI)I
    .locals 12
    .param p1, "input"    # [B
    .param p2, "inputOffset"    # I
    .param p3, "inputLen"    # I
    .param p4, "output"    # [B
    .param p5, "outputOffset"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/crypto/ShortBufferException;,
            Ljavax/crypto/IllegalBlockSizeException;,
            Ljavax/crypto/BadPaddingException;
        }
    .end annotation

    .prologue
    .line 146
    invoke-virtual {p0, p3}, Lcom/keepassdroid/crypto/NativeAESCipherSpi;->engineGetOutputSize(I)I

    move-result v9

    .line 149
    .local v9, "outputSize":I
    if-eqz p1, :cond_0

    if-lez p3, :cond_0

    .line 150
    iget-wide v2, p0, Lcom/keepassdroid/crypto/NativeAESCipherSpi;->mCtxPtr:J

    move-object v1, p0

    move-object v4, p1

    move v5, p2

    move v6, p3

    move-object/from16 v7, p4

    move/from16 v8, p5

    invoke-direct/range {v1 .. v9}, Lcom/keepassdroid/crypto/NativeAESCipherSpi;->nUpdate(J[BII[BII)I

    move-result v11

    .line 155
    .local v11, "updateAmt":I
    :goto_0
    iget-wide v2, p0, Lcom/keepassdroid/crypto/NativeAESCipherSpi;->mCtxPtr:J

    iget-boolean v4, p0, Lcom/keepassdroid/crypto/NativeAESCipherSpi;->mPadding:Z

    add-int v6, p5, v11

    sub-int v7, v9, v11

    move-object v1, p0

    move-object/from16 v5, p4

    invoke-direct/range {v1 .. v7}, Lcom/keepassdroid/crypto/NativeAESCipherSpi;->nFinal(JZ[BII)I

    move-result v0

    .line 157
    .local v0, "finalAmt":I
    add-int v10, v11, v0

    .line 160
    .local v10, "out":I
    return v10

    .line 152
    .end local v0    # "finalAmt":I
    .end local v10    # "out":I
    .end local v11    # "updateAmt":I
    :cond_0
    const/4 v11, 0x0

    .restart local v11    # "updateAmt":I
    goto :goto_0
.end method

.method private init(ILjava/security/Key;Ljavax/crypto/spec/IvParameterSpec;)V
    .locals 3
    .param p1, "opmode"    # I
    .param p2, "key"    # Ljava/security/Key;
    .param p3, "params"    # Ljavax/crypto/spec/IvParameterSpec;

    .prologue
    const/4 v0, 0x1

    .line 230
    iget-boolean v1, p0, Lcom/keepassdroid/crypto/NativeAESCipherSpi;->mIsInited:Z

    if-eqz v1, :cond_0

    .line 233
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "Don\'t allow multiple inits"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 235
    :cond_0
    invoke-static {}, Lcom/keepassdroid/crypto/NativeLib;->init()Z

    .line 236
    iput-boolean v0, p0, Lcom/keepassdroid/crypto/NativeAESCipherSpi;->mIsInited:Z

    .line 239
    invoke-virtual {p3}, Ljavax/crypto/spec/IvParameterSpec;->getIV()[B

    move-result-object v1

    iput-object v1, p0, Lcom/keepassdroid/crypto/NativeAESCipherSpi;->mIV:[B

    .line 240
    if-ne p1, v0, :cond_1

    :goto_0
    iput-boolean v0, p0, Lcom/keepassdroid/crypto/NativeAESCipherSpi;->mEncrypting:Z

    .line 241
    iget-boolean v0, p0, Lcom/keepassdroid/crypto/NativeAESCipherSpi;->mEncrypting:Z

    invoke-interface {p2}, Ljava/security/Key;->getEncoded()[B

    move-result-object v1

    iget-object v2, p0, Lcom/keepassdroid/crypto/NativeAESCipherSpi;->mIV:[B

    invoke-direct {p0, v0, v1, v2}, Lcom/keepassdroid/crypto/NativeAESCipherSpi;->nInit(Z[B[B)J

    move-result-wide v0

    iput-wide v0, p0, Lcom/keepassdroid/crypto/NativeAESCipherSpi;->mCtxPtr:J

    .line 242
    iget-wide v0, p0, Lcom/keepassdroid/crypto/NativeAESCipherSpi;->mCtxPtr:J

    invoke-static {p0, v0, v1}, Lcom/keepassdroid/crypto/NativeAESCipherSpi;->addToCleanupQueue(Lcom/keepassdroid/crypto/NativeAESCipherSpi;J)V

    .line 243
    return-void

    .line 240
    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private static native nCleanup(J)V
.end method

.method private native nFinal(JZ[BII)I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/crypto/ShortBufferException;,
            Ljavax/crypto/IllegalBlockSizeException;,
            Ljavax/crypto/BadPaddingException;
        }
    .end annotation
.end method

.method private native nGetCacheSize(J)I
.end method

.method private native nInit(Z[B[B)J
.end method

.method private native nUpdate(J[BII[BII)I
.end method

.method private static staticInit()V
    .locals 3

    .prologue
    .line 61
    const/4 v0, 0x1

    sput-boolean v0, Lcom/keepassdroid/crypto/NativeAESCipherSpi;->mIsStaticInit:Z

    .line 64
    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lcom/keepassdroid/crypto/NativeAESCipherSpi$Cleanup;

    const/4 v2, 0x0

    invoke-direct {v1, v2}, Lcom/keepassdroid/crypto/NativeAESCipherSpi$Cleanup;-><init>(Lcom/keepassdroid/crypto/NativeAESCipherSpi$1;)V

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 65
    return-void
.end method


# virtual methods
.method protected engineDoFinal([BII[BI)I
    .locals 2
    .param p1, "input"    # [B
    .param p2, "inputOffset"    # I
    .param p3, "inputLen"    # I
    .param p4, "output"    # [B
    .param p5, "outputOffset"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/crypto/ShortBufferException;,
            Ljavax/crypto/IllegalBlockSizeException;,
            Ljavax/crypto/BadPaddingException;
        }
    .end annotation

    .prologue
    .line 134
    invoke-direct/range {p0 .. p5}, Lcom/keepassdroid/crypto/NativeAESCipherSpi;->doFinal([BII[BI)I

    move-result v0

    .line 136
    .local v0, "result":I
    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    .line 137
    new-instance v1, Ljavax/crypto/ShortBufferException;

    invoke-direct {v1}, Ljavax/crypto/ShortBufferException;-><init>()V

    throw v1

    .line 140
    :cond_0
    return v0
.end method

.method protected engineDoFinal([BII)[B
    .locals 11
    .param p1, "input"    # [B
    .param p2, "inputOffset"    # I
    .param p3, "inputLen"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/crypto/IllegalBlockSizeException;,
            Ljavax/crypto/BadPaddingException;
        }
    .end annotation

    .prologue
    const/4 v10, 0x0

    .line 107
    invoke-virtual {p0, p3}, Lcom/keepassdroid/crypto/NativeAESCipherSpi;->engineGetOutputSize(I)I

    move-result v9

    .line 108
    .local v9, "maxSize":I
    new-array v4, v9, [B

    .line 113
    .local v4, "output":[B
    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move v3, p3

    :try_start_0
    invoke-direct/range {v0 .. v5}, Lcom/keepassdroid/crypto/NativeAESCipherSpi;->doFinal([BII[BI)I
    :try_end_0
    .catch Ljavax/crypto/ShortBufferException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v8

    .line 119
    .local v8, "finalSize":I
    if-ne v9, v8, :cond_0

    .line 125
    .end local v4    # "output":[B
    :goto_0
    return-object v4

    .line 114
    .end local v8    # "finalSize":I
    .restart local v4    # "output":[B
    :catch_0
    move-exception v6

    .line 116
    .local v6, "e":Ljavax/crypto/ShortBufferException;
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "Short buffer exception shouldn\'t be possible from here."

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 123
    .end local v6    # "e":Ljavax/crypto/ShortBufferException;
    .restart local v8    # "finalSize":I
    :cond_0
    new-array v7, v8, [B

    .line 124
    .local v7, "exact":[B
    invoke-static {v4, v10, v7, v10, v8}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    move-object v4, v7

    .line 125
    goto :goto_0
.end method

.method protected engineGetBlockSize()I
    .locals 1

    .prologue
    .line 168
    const/16 v0, 0x10

    return v0
.end method

.method protected engineGetIV()[B
    .locals 1

    .prologue
    .line 173
    iget-object v0, p0, Lcom/keepassdroid/crypto/NativeAESCipherSpi;->mIV:[B

    invoke-virtual {v0}, [B->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [B

    return-object v0
.end method

.method protected engineGetOutputSize(I)I
    .locals 2
    .param p1, "inputLen"    # I

    .prologue
    .line 178
    iget-wide v0, p0, Lcom/keepassdroid/crypto/NativeAESCipherSpi;->mCtxPtr:J

    invoke-direct {p0, v0, v1}, Lcom/keepassdroid/crypto/NativeAESCipherSpi;->nGetCacheSize(J)I

    move-result v0

    add-int/2addr v0, p1

    add-int/lit8 v0, v0, 0x10

    return v0
.end method

.method protected engineGetParameters()Ljava/security/AlgorithmParameters;
    .locals 1

    .prologue
    .line 186
    const/4 v0, 0x0

    return-object v0
.end method

.method protected engineInit(ILjava/security/Key;Ljava/security/AlgorithmParameters;Ljava/security/SecureRandom;)V
    .locals 2
    .param p1, "opmode"    # I
    .param p2, "key"    # Ljava/security/Key;
    .param p3, "params"    # Ljava/security/AlgorithmParameters;
    .param p4, "random"    # Ljava/security/SecureRandom;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/InvalidKeyException;,
            Ljava/security/InvalidAlgorithmParameterException;
        }
    .end annotation

    .prologue
    .line 222
    :try_start_0
    const-class v1, Ljava/security/spec/AlgorithmParameterSpec;

    invoke-virtual {p3, v1}, Ljava/security/AlgorithmParameters;->getParameterSpec(Ljava/lang/Class;)Ljava/security/spec/AlgorithmParameterSpec;

    move-result-object v1

    invoke-virtual {p0, p1, p2, v1, p4}, Lcom/keepassdroid/crypto/NativeAESCipherSpi;->engineInit(ILjava/security/Key;Ljava/security/spec/AlgorithmParameterSpec;Ljava/security/SecureRandom;)V
    :try_end_0
    .catch Ljava/security/spec/InvalidParameterSpecException; {:try_start_0 .. :try_end_0} :catch_0

    .line 227
    return-void

    .line 223
    :catch_0
    move-exception v0

    .line 224
    .local v0, "e":Ljava/security/spec/InvalidParameterSpecException;
    new-instance v1, Ljava/security/InvalidAlgorithmParameterException;

    invoke-direct {v1, v0}, Ljava/security/InvalidAlgorithmParameterException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method protected engineInit(ILjava/security/Key;Ljava/security/SecureRandom;)V
    .locals 2
    .param p1, "opmode"    # I
    .param p2, "key"    # Ljava/security/Key;
    .param p3, "random"    # Ljava/security/SecureRandom;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/InvalidKeyException;
        }
    .end annotation

    .prologue
    .line 193
    const/16 v1, 0x10

    new-array v0, v1, [B

    .line 194
    .local v0, "ivArray":[B
    invoke-virtual {p3, v0}, Ljava/security/SecureRandom;->nextBytes([B)V

    .line 196
    new-instance v1, Ljavax/crypto/spec/IvParameterSpec;

    invoke-direct {v1, v0}, Ljavax/crypto/spec/IvParameterSpec;-><init>([B)V

    invoke-direct {p0, p1, p2, v1}, Lcom/keepassdroid/crypto/NativeAESCipherSpi;->init(ILjava/security/Key;Ljavax/crypto/spec/IvParameterSpec;)V

    .line 197
    return-void
.end method

.method protected engineInit(ILjava/security/Key;Ljava/security/spec/AlgorithmParameterSpec;Ljava/security/SecureRandom;)V
    .locals 3
    .param p1, "opmode"    # I
    .param p2, "key"    # Ljava/security/Key;
    .param p3, "params"    # Ljava/security/spec/AlgorithmParameterSpec;
    .param p4, "random"    # Ljava/security/SecureRandom;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/InvalidKeyException;,
            Ljava/security/InvalidAlgorithmParameterException;
        }
    .end annotation

    .prologue
    .line 206
    instance-of v1, p3, Ljavax/crypto/spec/IvParameterSpec;

    if-eqz v1, :cond_0

    move-object v0, p3

    .line 207
    check-cast v0, Ljavax/crypto/spec/IvParameterSpec;

    .line 212
    .local v0, "ivparam":Ljavax/crypto/spec/IvParameterSpec;
    invoke-direct {p0, p1, p2, v0}, Lcom/keepassdroid/crypto/NativeAESCipherSpi;->init(ILjava/security/Key;Ljavax/crypto/spec/IvParameterSpec;)V

    .line 213
    return-void

    .line 209
    .end local v0    # "ivparam":Ljavax/crypto/spec/IvParameterSpec;
    :cond_0
    new-instance v1, Ljava/security/InvalidAlgorithmParameterException;

    const-string v2, "params must be an IvParameterSpec."

    invoke-direct {v1, v2}, Ljava/security/InvalidAlgorithmParameterException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method protected engineSetMode(Ljava/lang/String;)V
    .locals 2
    .param p1, "mode"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/NoSuchAlgorithmException;
        }
    .end annotation

    .prologue
    .line 249
    const-string v0, "CBC"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 250
    new-instance v0, Ljava/security/NoSuchAlgorithmException;

    const-string v1, "This only supports CBC mode"

    invoke-direct {v0, v1}, Ljava/security/NoSuchAlgorithmException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 252
    :cond_0
    return-void
.end method

.method protected engineSetPadding(Ljava/lang/String;)V
    .locals 2
    .param p1, "padding"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/crypto/NoSuchPaddingException;
        }
    .end annotation

    .prologue
    .line 258
    iget-boolean v0, p0, Lcom/keepassdroid/crypto/NativeAESCipherSpi;->mIsInited:Z

    if-nez v0, :cond_0

    .line 259
    invoke-static {}, Lcom/keepassdroid/crypto/NativeLib;->init()Z

    .line 262
    :cond_0
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_1

    .line 272
    :goto_0
    return-void

    .line 266
    :cond_1
    const-string v0, "PKCS5Padding"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2

    .line 267
    new-instance v0, Ljavax/crypto/NoSuchPaddingException;

    const-string v1, "Only supports PKCS5Padding."

    invoke-direct {v0, v1}, Ljavax/crypto/NoSuchPaddingException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 270
    :cond_2
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/keepassdroid/crypto/NativeAESCipherSpi;->mPadding:Z

    goto :goto_0
.end method

.method protected engineUpdate([BII[BI)I
    .locals 3
    .param p1, "input"    # [B
    .param p2, "inputOffset"    # I
    .param p3, "inputLen"    # I
    .param p4, "output"    # [B
    .param p5, "outputOffset"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/crypto/ShortBufferException;
        }
    .end annotation

    .prologue
    .line 296
    invoke-virtual/range {p0 .. p5}, Lcom/keepassdroid/crypto/NativeAESCipherSpi;->update([BII[BI)I

    move-result v0

    .line 298
    .local v0, "result":I
    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    .line 299
    new-instance v1, Ljavax/crypto/ShortBufferException;

    const-string v2, "Insufficient buffer."

    invoke-direct {v1, v2}, Ljavax/crypto/ShortBufferException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 302
    :cond_0
    return v0
.end method

.method protected engineUpdate([BII)[B
    .locals 9
    .param p1, "input"    # [B
    .param p2, "inputOffset"    # I
    .param p3, "inputLen"    # I

    .prologue
    const/4 v5, 0x0

    .line 276
    invoke-virtual {p0, p3}, Lcom/keepassdroid/crypto/NativeAESCipherSpi;->engineGetOutputSize(I)I

    move-result v7

    .line 277
    .local v7, "maxSize":I
    new-array v4, v7, [B

    .local v4, "output":[B
    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move v3, p3

    .line 279
    invoke-virtual/range {v0 .. v5}, Lcom/keepassdroid/crypto/NativeAESCipherSpi;->update([BII[BI)I

    move-result v8

    .line 281
    .local v8, "updateSize":I
    if-ne v8, v7, :cond_0

    .line 287
    .end local v4    # "output":[B
    :goto_0
    return-object v4

    .line 285
    .restart local v4    # "output":[B
    :cond_0
    new-array v6, v8, [B

    .line 286
    .local v6, "exact":[B
    invoke-static {v4, v5, v6, v5, v8}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    move-object v4, v6

    .line 287
    goto :goto_0
.end method

.method update([BII[BI)I
    .locals 10
    .param p1, "input"    # [B
    .param p2, "inputOffset"    # I
    .param p3, "inputLen"    # I
    .param p4, "output"    # [B
    .param p5, "outputOffset"    # I

    .prologue
    .line 307
    invoke-virtual {p0, p3}, Lcom/keepassdroid/crypto/NativeAESCipherSpi;->engineGetOutputSize(I)I

    move-result v9

    .line 309
    .local v9, "outputSize":I
    iget-wide v2, p0, Lcom/keepassdroid/crypto/NativeAESCipherSpi;->mCtxPtr:J

    move-object v1, p0

    move-object v4, p1

    move v5, p2

    move v6, p3

    move-object v7, p4

    move v8, p5

    invoke-direct/range {v1 .. v9}, Lcom/keepassdroid/crypto/NativeAESCipherSpi;->nUpdate(J[BII[BII)I

    move-result v0

    .line 312
    .local v0, "out":I
    return v0
.end method
