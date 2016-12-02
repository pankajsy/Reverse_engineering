.class public Lcom/keepassdroid/crypto/CipherFactory;
.super Ljava/lang/Object;
.source "CipherFactory.java"


# static fields
.field public static final AES_CIPHER:Ljava/util/UUID;

.field public static final TWOFISH_CIPHER:Ljava/util/UUID;

.field private static blacklistInit:Z

.field private static blacklisted:Z


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    const/16 v1, 0x10

    .line 37
    const/4 v0, 0x0

    sput-boolean v0, Lcom/keepassdroid/crypto/CipherFactory;->blacklistInit:Z

    .line 75
    new-array v0, v1, [B

    fill-array-data v0, :array_0

    invoke-static {v0}, Lcom/keepassdroid/utils/Types;->bytestoUUID([B)Ljava/util/UUID;

    move-result-object v0

    sput-object v0, Lcom/keepassdroid/crypto/CipherFactory;->AES_CIPHER:Ljava/util/UUID;

    .line 79
    new-array v0, v1, [B

    fill-array-data v0, :array_1

    invoke-static {v0}, Lcom/keepassdroid/utils/Types;->bytestoUUID([B)Ljava/util/UUID;

    move-result-object v0

    sput-object v0, Lcom/keepassdroid/crypto/CipherFactory;->TWOFISH_CIPHER:Ljava/util/UUID;

    return-void

    .line 75
    :array_0
    .array-data 1
        0x31t
        -0x3ft
        -0xet
        -0x1at
        -0x41t
        0x71t
        0x43t
        0x50t
        -0x42t
        0x58t
        0x5t
        0x21t
        0x6at
        -0x4t
        0x5at
        -0x1t
    .end array-data

    .line 79
    :array_1
    .array-data 1
        -0x53t
        0x68t
        -0xet
        -0x61t
        0x57t
        0x6ft
        0x4bt
        -0x47t
        -0x5dt
        0x6at
        -0x2ct
        0x7at
        -0x7t
        0x65t
        0x34t
        0x6ct
    .end array-data
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static deviceBlacklisted()Z
    .locals 2

    .prologue
    .line 61
    sget-boolean v0, Lcom/keepassdroid/crypto/CipherFactory;->blacklistInit:Z

    if-nez v0, :cond_0

    .line 62
    const/4 v0, 0x1

    sput-boolean v0, Lcom/keepassdroid/crypto/CipherFactory;->blacklistInit:Z

    .line 65
    sget-object v0, Landroid/os/Build;->MODEL:Ljava/lang/String;

    const-string v1, "A500"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    sput-boolean v0, Lcom/keepassdroid/crypto/CipherFactory;->blacklisted:Z

    .line 67
    :cond_0
    sget-boolean v0, Lcom/keepassdroid/crypto/CipherFactory;->blacklisted:Z

    return v0
.end method

.method public static getInstance(Ljava/lang/String;)Ljavax/crypto/Cipher;
    .locals 1
    .param p0, "transformation"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/NoSuchAlgorithmException;,
            Ljavax/crypto/NoSuchPaddingException;
        }
    .end annotation

    .prologue
    .line 41
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lcom/keepassdroid/crypto/CipherFactory;->getInstance(Ljava/lang/String;Z)Ljavax/crypto/Cipher;

    move-result-object v0

    return-object v0
.end method

.method public static getInstance(Ljava/lang/String;Z)Ljavax/crypto/Cipher;
    .locals 1
    .param p0, "transformation"    # Ljava/lang/String;
    .param p1, "androidOverride"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/NoSuchAlgorithmException;,
            Ljavax/crypto/NoSuchPaddingException;
        }
    .end annotation

    .prologue
    .line 46
    invoke-static {}, Lcom/keepassdroid/crypto/CipherFactory;->deviceBlacklisted()Z

    move-result v0

    if-nez v0, :cond_0

    if-nez p1, :cond_0

    invoke-static {p0}, Lcom/keepassdroid/crypto/CipherFactory;->hasNativeImplementation(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/keepassdroid/crypto/NativeLib;->loaded()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 47
    new-instance v0, Lcom/keepassdroid/crypto/AESProvider;

    invoke-direct {v0}, Lcom/keepassdroid/crypto/AESProvider;-><init>()V

    invoke-static {p0, v0}, Ljavax/crypto/Cipher;->getInstance(Ljava/lang/String;Ljava/security/Provider;)Ljavax/crypto/Cipher;

    move-result-object v0

    .line 56
    :goto_0
    return-object v0

    .line 50
    :cond_0
    :try_start_0
    new-instance v0, Lcom/keepassdroid/crypto/BouncyCastleProvider;

    invoke-direct {v0}, Lcom/keepassdroid/crypto/BouncyCastleProvider;-><init>()V

    invoke-static {p0, v0}, Ljavax/crypto/Cipher;->getInstance(Ljava/lang/String;Ljava/security/Provider;)Ljavax/crypto/Cipher;
    :try_end_0
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljavax/crypto/NoSuchPaddingException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    goto :goto_0

    .line 53
    :catch_0
    move-exception v0

    .line 56
    :goto_1
    invoke-static {p0}, Ljavax/crypto/Cipher;->getInstance(Ljava/lang/String;)Ljavax/crypto/Cipher;

    move-result-object v0

    goto :goto_0

    .line 51
    :catch_1
    move-exception v0

    goto :goto_1
.end method

.method public static getInstance(Ljava/util/UUID;I[B[B)Ljavax/crypto/Cipher;
    .locals 1
    .param p0, "uuid"    # Ljava/util/UUID;
    .param p1, "opmode"    # I
    .param p2, "key"    # [B
    .param p3, "IV"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/NoSuchAlgorithmException;,
            Ljavax/crypto/NoSuchPaddingException;,
            Ljava/security/InvalidKeyException;,
            Ljava/security/InvalidAlgorithmParameterException;
        }
    .end annotation

    .prologue
    .line 93
    const/4 v0, 0x0

    invoke-static {p0, p1, p2, p3, v0}, Lcom/keepassdroid/crypto/CipherFactory;->getInstance(Ljava/util/UUID;I[B[BZ)Ljavax/crypto/Cipher;

    move-result-object v0

    return-object v0
.end method

.method public static getInstance(Ljava/util/UUID;I[B[BZ)Ljavax/crypto/Cipher;
    .locals 4
    .param p0, "uuid"    # Ljava/util/UUID;
    .param p1, "opmode"    # I
    .param p2, "key"    # [B
    .param p3, "IV"    # [B
    .param p4, "androidOverride"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/NoSuchAlgorithmException;,
            Ljavax/crypto/NoSuchPaddingException;,
            Ljava/security/InvalidKeyException;,
            Ljava/security/InvalidAlgorithmParameterException;
        }
    .end annotation

    .prologue
    .line 97
    sget-object v2, Lcom/keepassdroid/crypto/CipherFactory;->AES_CIPHER:Ljava/util/UUID;

    invoke-virtual {p0, v2}, Ljava/util/UUID;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 98
    const-string v2, "AES/CBC/PKCS5Padding"

    invoke-static {v2, p4}, Lcom/keepassdroid/crypto/CipherFactory;->getInstance(Ljava/lang/String;Z)Ljavax/crypto/Cipher;

    move-result-object v0

    .line 100
    .local v0, "cipher":Ljavax/crypto/Cipher;
    new-instance v2, Ljavax/crypto/spec/SecretKeySpec;

    const-string v3, "AES"

    invoke-direct {v2, p2, v3}, Ljavax/crypto/spec/SecretKeySpec;-><init>([BLjava/lang/String;)V

    new-instance v3, Ljavax/crypto/spec/IvParameterSpec;

    invoke-direct {v3, p3}, Ljavax/crypto/spec/IvParameterSpec;-><init>([B)V

    invoke-virtual {v0, p1, v2, v3}, Ljavax/crypto/Cipher;->init(ILjava/security/Key;Ljava/security/spec/AlgorithmParameterSpec;)V

    move-object v1, v0

    .line 113
    .end local v0    # "cipher":Ljavax/crypto/Cipher;
    .local v1, "cipher":Ljavax/crypto/Cipher;
    :goto_0
    return-object v1

    .line 103
    .end local v1    # "cipher":Ljavax/crypto/Cipher;
    :cond_0
    sget-object v2, Lcom/keepassdroid/crypto/CipherFactory;->TWOFISH_CIPHER:Ljava/util/UUID;

    invoke-virtual {p0, v2}, Ljava/util/UUID;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 105
    const/4 v2, 0x1

    if-ne p1, v2, :cond_1

    .line 106
    const-string v2, "TWOFISH/CBC/ZeroBytePadding"

    invoke-static {v2, p4}, Lcom/keepassdroid/crypto/CipherFactory;->getInstance(Ljava/lang/String;Z)Ljavax/crypto/Cipher;

    move-result-object v0

    .line 111
    .restart local v0    # "cipher":Ljavax/crypto/Cipher;
    :goto_1
    new-instance v2, Ljavax/crypto/spec/SecretKeySpec;

    const-string v3, "AES"

    invoke-direct {v2, p2, v3}, Ljavax/crypto/spec/SecretKeySpec;-><init>([BLjava/lang/String;)V

    new-instance v3, Ljavax/crypto/spec/IvParameterSpec;

    invoke-direct {v3, p3}, Ljavax/crypto/spec/IvParameterSpec;-><init>([B)V

    invoke-virtual {v0, p1, v2, v3}, Ljavax/crypto/Cipher;->init(ILjava/security/Key;Ljava/security/spec/AlgorithmParameterSpec;)V

    move-object v1, v0

    .line 113
    .end local v0    # "cipher":Ljavax/crypto/Cipher;
    .restart local v1    # "cipher":Ljavax/crypto/Cipher;
    goto :goto_0

    .line 108
    .end local v1    # "cipher":Ljavax/crypto/Cipher;
    :cond_1
    const-string v2, "TWOFISH/CBC/NoPadding"

    invoke-static {v2, p4}, Lcom/keepassdroid/crypto/CipherFactory;->getInstance(Ljava/lang/String;Z)Ljavax/crypto/Cipher;

    move-result-object v0

    .restart local v0    # "cipher":Ljavax/crypto/Cipher;
    goto :goto_1

    .line 116
    .end local v0    # "cipher":Ljavax/crypto/Cipher;
    :cond_2
    new-instance v2, Ljava/security/NoSuchAlgorithmException;

    const-string v3, "UUID unrecognized."

    invoke-direct {v2, v3}, Ljava/security/NoSuchAlgorithmException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method private static hasNativeImplementation(Ljava/lang/String;)Z
    .locals 1
    .param p0, "transformation"    # Ljava/lang/String;

    .prologue
    .line 71
    const-string v0, "AES/CBC/PKCS5Padding"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method
