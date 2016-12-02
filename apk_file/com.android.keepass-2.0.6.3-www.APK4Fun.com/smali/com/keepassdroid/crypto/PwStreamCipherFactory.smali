.class public Lcom/keepassdroid/crypto/PwStreamCipherFactory;
.super Ljava/lang/Object;
.source "PwStreamCipherFactory.java"


# static fields
.field private static final SALSA_IV:[B


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 43
    const/16 v0, 0x8

    new-array v0, v0, [B

    fill-array-data v0, :array_0

    sput-object v0, Lcom/keepassdroid/crypto/PwStreamCipherFactory;->SALSA_IV:[B

    return-void

    :array_0
    .array-data 1
        -0x18t
        0x30t
        0x9t
        0x4bt
        -0x69t
        0x20t
        0x5dt
        0x2at
    .end array-data
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getInstance(Lcom/keepassdroid/database/CrsAlgorithm;[B)Lorg/bouncycastle/crypto/StreamCipher;
    .locals 1
    .param p0, "alg"    # Lcom/keepassdroid/database/CrsAlgorithm;
    .param p1, "key"    # [B

    .prologue
    .line 34
    sget-object v0, Lcom/keepassdroid/database/CrsAlgorithm;->Salsa20:Lcom/keepassdroid/database/CrsAlgorithm;

    if-ne p0, v0, :cond_0

    .line 35
    invoke-static {p1}, Lcom/keepassdroid/crypto/PwStreamCipherFactory;->getSalsa20([B)Lorg/bouncycastle/crypto/StreamCipher;

    move-result-object v0

    .line 38
    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private static getSalsa20([B)Lorg/bouncycastle/crypto/StreamCipher;
    .locals 8
    .param p0, "key"    # [B

    .prologue
    .line 50
    :try_start_0
    const-string v6, "SHA-256"

    invoke-static {v6}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;
    :try_end_0
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v5

    .line 55
    .local v5, "md":Ljava/security/MessageDigest;
    invoke-virtual {v5, p0}, Ljava/security/MessageDigest;->digest([B)[B

    move-result-object v3

    .line 57
    .local v3, "key32":[B
    new-instance v4, Lorg/bouncycastle/crypto/params/KeyParameter;

    invoke-direct {v4, v3}, Lorg/bouncycastle/crypto/params/KeyParameter;-><init>([B)V

    .line 58
    .local v4, "keyParam":Lorg/bouncycastle/crypto/params/KeyParameter;
    new-instance v2, Lorg/bouncycastle/crypto/params/ParametersWithIV;

    sget-object v6, Lcom/keepassdroid/crypto/PwStreamCipherFactory;->SALSA_IV:[B

    invoke-direct {v2, v4, v6}, Lorg/bouncycastle/crypto/params/ParametersWithIV;-><init>(Lorg/bouncycastle/crypto/CipherParameters;[B)V

    .line 60
    .local v2, "ivParam":Lorg/bouncycastle/crypto/params/ParametersWithIV;
    new-instance v0, Lorg/bouncycastle/crypto/engines/Salsa20Engine;

    invoke-direct {v0}, Lorg/bouncycastle/crypto/engines/Salsa20Engine;-><init>()V

    .line 61
    .local v0, "cipher":Lorg/bouncycastle/crypto/StreamCipher;
    const/4 v6, 0x1

    invoke-interface {v0, v6, v2}, Lorg/bouncycastle/crypto/StreamCipher;->init(ZLorg/bouncycastle/crypto/CipherParameters;)V

    .line 63
    return-object v0

    .line 51
    .end local v0    # "cipher":Lorg/bouncycastle/crypto/StreamCipher;
    .end local v2    # "ivParam":Lorg/bouncycastle/crypto/params/ParametersWithIV;
    .end local v3    # "key32":[B
    .end local v4    # "keyParam":Lorg/bouncycastle/crypto/params/KeyParameter;
    .end local v5    # "md":Ljava/security/MessageDigest;
    :catch_0
    move-exception v1

    .line 52
    .local v1, "e":Ljava/security/NoSuchAlgorithmException;
    invoke-virtual {v1}, Ljava/security/NoSuchAlgorithmException;->printStackTrace()V

    .line 53
    new-instance v6, Ljava/lang/RuntimeException;

    const-string v7, "SHA 256 not supported"

    invoke-direct {v6, v7}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v6
.end method
