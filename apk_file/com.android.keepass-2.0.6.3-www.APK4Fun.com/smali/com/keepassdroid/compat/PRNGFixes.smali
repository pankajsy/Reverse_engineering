.class public final Lcom/keepassdroid/compat/PRNGFixes;
.super Ljava/lang/Object;
.source "PRNGFixes.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/keepassdroid/compat/PRNGFixes$LinuxPRNGSecureRandom;,
        Lcom/keepassdroid/compat/PRNGFixes$LinuxPRNGSecureRandomProvider;
    }
.end annotation


# static fields
.field private static final BUILD_FINGERPRINT_AND_DEVICE_SERIAL:[B

.field private static sdkVersion:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 46
    invoke-static {}, Lcom/keepassdroid/compat/PRNGFixes;->getBuildFingerprintAndDeviceSerial()[B

    move-result-object v0

    sput-object v0, Lcom/keepassdroid/compat/PRNGFixes;->BUILD_FINGERPRINT_AND_DEVICE_SERIAL:[B

    .line 47
    invoke-static {}, Lcom/keepassdroid/compat/BuildCompat;->getSdkVersion()I

    move-result v0

    sput v0, Lcom/keepassdroid/compat/PRNGFixes;->sdkVersion:I

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .prologue
    .line 50
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000()[B
    .locals 1

    .prologue
    .line 43
    invoke-static {}, Lcom/keepassdroid/compat/PRNGFixes;->generateSeed()[B

    move-result-object v0

    return-object v0
.end method

.method public static apply()V
    .locals 1

    .prologue
    .line 59
    :try_start_0
    invoke-static {}, Lcom/keepassdroid/compat/PRNGFixes;->supportedOnThisDevice()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 60
    invoke-static {}, Lcom/keepassdroid/compat/PRNGFixes;->applyOpenSSLFix()V

    .line 61
    invoke-static {}, Lcom/keepassdroid/compat/PRNGFixes;->installLinuxPRNGSecureRandom()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 66
    :cond_0
    :goto_0
    return-void

    .line 63
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method private static applyOpenSSLFix()V
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/SecurityException;
        }
    .end annotation

    .prologue
    const/16 v7, 0x400

    .line 129
    sget v2, Lcom/keepassdroid/compat/PRNGFixes;->sdkVersion:I

    const/16 v3, 0x10

    if-lt v2, v3, :cond_0

    sget v2, Lcom/keepassdroid/compat/PRNGFixes;->sdkVersion:I

    const/16 v3, 0x12

    if-le v2, v3, :cond_1

    .line 154
    .local v0, "bytesRead":I
    :cond_0
    return-void

    .line 137
    .end local v0    # "bytesRead":I
    :cond_1
    :try_start_0
    const-string v2, "org.apache.harmony.xnet.provider.jsse.NativeCrypto"

    invoke-static {v2}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    const-string v3, "RAND_seed"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Class;

    const/4 v5, 0x0

    const-class v6, [B

    aput-object v6, v4, v5

    .line 138
    invoke-virtual {v2, v3, v4}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    const/4 v3, 0x0

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    .line 139
    invoke-static {}, Lcom/keepassdroid/compat/PRNGFixes;->generateSeed()[B

    move-result-object v6

    aput-object v6, v4, v5

    invoke-virtual {v2, v3, v4}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 142
    const-string v2, "org.apache.harmony.xnet.provider.jsse.NativeCrypto"

    invoke-static {v2}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    const-string v3, "RAND_load_file"

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Class;

    const/4 v5, 0x0

    const-class v6, Ljava/lang/String;

    aput-object v6, v4, v5

    const/4 v5, 0x1

    sget-object v6, Ljava/lang/Long;->TYPE:Ljava/lang/Class;

    aput-object v6, v4, v5

    .line 144
    invoke-virtual {v2, v3, v4}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    const/4 v3, 0x0

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    const-string v6, "/dev/urandom"

    aput-object v6, v4, v5

    const/4 v5, 0x1

    const/16 v6, 0x400

    .line 145
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v4, v5

    invoke-virtual {v2, v3, v4}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    .line 142
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .line 146
    .restart local v0    # "bytesRead":I
    if-eq v0, v7, :cond_0

    .line 147
    new-instance v2, Ljava/io/IOException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Unexpected number of bytes read from Linux PRNG: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v2
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 151
    :catch_0
    move-exception v1

    .line 152
    .local v1, "e":Ljava/lang/Exception;
    new-instance v2, Ljava/lang/SecurityException;

    const-string v3, "Failed to seed OpenSSL PRNG"

    invoke-direct {v2, v3, v1}, Ljava/lang/SecurityException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2
.end method

.method private static generateSeed()[B
    .locals 6

    .prologue
    .line 356
    :try_start_0
    new-instance v1, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v1}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 357
    .local v1, "seedBuffer":Ljava/io/ByteArrayOutputStream;
    new-instance v2, Ljava/io/DataOutputStream;

    invoke-direct {v2, v1}, Ljava/io/DataOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 359
    .local v2, "seedBufferOut":Ljava/io/DataOutputStream;
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    invoke-virtual {v2, v4, v5}, Ljava/io/DataOutputStream;->writeLong(J)V

    .line 360
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v4

    invoke-virtual {v2, v4, v5}, Ljava/io/DataOutputStream;->writeLong(J)V

    .line 361
    invoke-static {}, Landroid/os/Process;->myPid()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/io/DataOutputStream;->writeInt(I)V

    .line 362
    invoke-static {}, Landroid/os/Process;->myUid()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/io/DataOutputStream;->writeInt(I)V

    .line 363
    sget-object v3, Lcom/keepassdroid/compat/PRNGFixes;->BUILD_FINGERPRINT_AND_DEVICE_SERIAL:[B

    invoke-virtual {v2, v3}, Ljava/io/DataOutputStream;->write([B)V

    .line 364
    invoke-virtual {v2}, Ljava/io/DataOutputStream;->close()V

    .line 365
    invoke-virtual {v1}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v3

    return-object v3

    .line 366
    .end local v2    # "seedBufferOut":Ljava/io/DataOutputStream;
    :catch_0
    move-exception v0

    .line 367
    .local v0, "e":Ljava/io/IOException;
    new-instance v3, Ljava/lang/SecurityException;

    const-string v4, "Failed to generate seed"

    invoke-direct {v3, v4, v0}, Ljava/lang/SecurityException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3
.end method

.method private static getBuildFingerprintAndDeviceSerial()[B
    .locals 6

    .prologue
    .line 387
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 388
    .local v2, "result":Ljava/lang/StringBuilder;
    sget-object v1, Landroid/os/Build;->FINGERPRINT:Ljava/lang/String;

    .line 389
    .local v1, "fingerprint":Ljava/lang/String;
    if-eqz v1, :cond_0

    .line 390
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 392
    :cond_0
    invoke-static {}, Lcom/keepassdroid/compat/PRNGFixes;->getDeviceSerialNumber()Ljava/lang/String;

    move-result-object v3

    .line 393
    .local v3, "serial":Ljava/lang/String;
    if-eqz v3, :cond_1

    .line 394
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 397
    :cond_1
    :try_start_0
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    const-string v5, "UTF-8"

    invoke-virtual {v4, v5}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v4

    return-object v4

    .line 398
    :catch_0
    move-exception v0

    .line 399
    .local v0, "e":Ljava/io/UnsupportedEncodingException;
    new-instance v4, Ljava/lang/RuntimeException;

    const-string v5, "UTF-8 encoding not supported"

    invoke-direct {v4, v5}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v4
.end method

.method private static getDeviceSerialNumber()Ljava/lang/String;
    .locals 4

    .prologue
    const/4 v2, 0x0

    .line 380
    :try_start_0
    const-class v1, Landroid/os/Build;

    const-string v3, "SERIAL"

    invoke-virtual {v1, v3}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    const/4 v3, 0x0

    invoke-virtual {v1, v3}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 382
    .local v0, "ignored":Ljava/lang/Exception;
    :goto_0
    return-object v1

    .line 381
    .end local v0    # "ignored":Ljava/lang/Exception;
    :catch_0
    move-exception v0

    .restart local v0    # "ignored":Ljava/lang/Exception;
    move-object v1, v2

    .line 382
    goto :goto_0
.end method

.method private static installLinuxPRNGSecureRandom()V
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/SecurityException;
        }
    .end annotation

    .prologue
    const/4 v6, 0x1

    .line 165
    sget v4, Lcom/keepassdroid/compat/PRNGFixes;->sdkVersion:I

    const/16 v5, 0x12

    if-le v4, v5, :cond_1

    .line 204
    .local v1, "rng1":Ljava/security/SecureRandom;
    .local v2, "rng2":Ljava/security/SecureRandom;
    .local v3, "secureRandomProviders":[Ljava/security/Provider;
    :cond_0
    return-void

    .line 172
    .end local v1    # "rng1":Ljava/security/SecureRandom;
    .end local v2    # "rng2":Ljava/security/SecureRandom;
    .end local v3    # "secureRandomProviders":[Ljava/security/Provider;
    :cond_1
    const-string v4, "SecureRandom.SHA1PRNG"

    .line 173
    invoke-static {v4}, Ljava/security/Security;->getProviders(Ljava/lang/String;)[Ljava/security/Provider;

    move-result-object v3

    .line 174
    .restart local v3    # "secureRandomProviders":[Ljava/security/Provider;
    if-eqz v3, :cond_2

    array-length v4, v3

    if-lt v4, v6, :cond_2

    const-class v4, Lcom/keepassdroid/compat/PRNGFixes$LinuxPRNGSecureRandomProvider;

    const/4 v5, 0x0

    aget-object v5, v3, v5

    .line 177
    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v5

    .line 176
    invoke-virtual {v4, v5}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_3

    .line 178
    :cond_2
    new-instance v4, Lcom/keepassdroid/compat/PRNGFixes$LinuxPRNGSecureRandomProvider;

    invoke-direct {v4}, Lcom/keepassdroid/compat/PRNGFixes$LinuxPRNGSecureRandomProvider;-><init>()V

    invoke-static {v4, v6}, Ljava/security/Security;->insertProviderAt(Ljava/security/Provider;I)I

    .line 184
    :cond_3
    new-instance v1, Ljava/security/SecureRandom;

    invoke-direct {v1}, Ljava/security/SecureRandom;-><init>()V

    .line 185
    .restart local v1    # "rng1":Ljava/security/SecureRandom;
    const-class v4, Lcom/keepassdroid/compat/PRNGFixes$LinuxPRNGSecureRandomProvider;

    .line 186
    invoke-virtual {v1}, Ljava/security/SecureRandom;->getProvider()Ljava/security/Provider;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v5

    .line 185
    invoke-virtual {v4, v5}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_4

    .line 187
    new-instance v4, Ljava/lang/SecurityException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "new SecureRandom() backed by wrong Provider: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    .line 189
    invoke-virtual {v1}, Ljava/security/SecureRandom;->getProvider()Ljava/security/Provider;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/SecurityException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 194
    :cond_4
    :try_start_0
    const-string v4, "SHA1PRNG"

    invoke-static {v4}, Ljava/security/SecureRandom;->getInstance(Ljava/lang/String;)Ljava/security/SecureRandom;
    :try_end_0
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    .line 198
    .restart local v2    # "rng2":Ljava/security/SecureRandom;
    const-class v4, Lcom/keepassdroid/compat/PRNGFixes$LinuxPRNGSecureRandomProvider;

    .line 199
    invoke-virtual {v2}, Ljava/security/SecureRandom;->getProvider()Ljava/security/Provider;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v5

    .line 198
    invoke-virtual {v4, v5}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_0

    .line 200
    new-instance v4, Ljava/lang/SecurityException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "SecureRandom.getInstance(\"SHA1PRNG\") backed by wrong Provider: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    .line 202
    invoke-virtual {v2}, Ljava/security/SecureRandom;->getProvider()Ljava/security/Provider;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/SecurityException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 195
    .end local v2    # "rng2":Ljava/security/SecureRandom;
    :catch_0
    move-exception v0

    .line 196
    .local v0, "e":Ljava/security/NoSuchAlgorithmException;
    new-instance v4, Ljava/lang/SecurityException;

    const-string v5, "SHA1PRNG not available"

    invoke-direct {v4, v5, v0}, Ljava/lang/SecurityException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v4
.end method

.method private static onSELinuxEnforce()Z
    .locals 9

    .prologue
    const/4 v5, 0x0

    .line 104
    :try_start_0
    new-instance v0, Ljava/lang/ProcessBuilder;

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/String;

    const/4 v7, 0x0

    const-string v8, "getenforce"

    aput-object v8, v6, v7

    invoke-direct {v0, v6}, Ljava/lang/ProcessBuilder;-><init>([Ljava/lang/String;)V

    .line 105
    .local v0, "builder":Ljava/lang/ProcessBuilder;
    const/4 v6, 0x1

    invoke-virtual {v0, v6}, Ljava/lang/ProcessBuilder;->redirectErrorStream(Z)Ljava/lang/ProcessBuilder;

    .line 106
    invoke-virtual {v0}, Ljava/lang/ProcessBuilder;->start()Ljava/lang/Process;

    move-result-object v3

    .line 107
    .local v3, "process":Ljava/lang/Process;
    new-instance v4, Ljava/io/BufferedReader;

    new-instance v6, Ljava/io/InputStreamReader;

    invoke-virtual {v3}, Ljava/lang/Process;->getInputStream()Ljava/io/InputStream;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    invoke-direct {v4, v6}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 108
    .local v4, "reader":Ljava/io/BufferedReader;
    invoke-virtual {v3}, Ljava/lang/Process;->waitFor()I

    .line 110
    invoke-virtual {v4}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v2

    .line 112
    .local v2, "output":Ljava/lang/String;
    if-nez v2, :cond_0

    .line 118
    .end local v2    # "output":Ljava/lang/String;
    .end local v3    # "process":Ljava/lang/Process;
    .end local v4    # "reader":Ljava/io/BufferedReader;
    :goto_0
    return v5

    .line 116
    .restart local v2    # "output":Ljava/lang/String;
    .restart local v3    # "process":Ljava/lang/Process;
    .restart local v4    # "reader":Ljava/io/BufferedReader;
    :cond_0
    sget-object v6, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {v2, v6}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v6

    const-string v7, "enforcing"

    invoke-virtual {v6, v7}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v5

    goto :goto_0

    .line 117
    .end local v2    # "output":Ljava/lang/String;
    .end local v3    # "process":Ljava/lang/Process;
    .end local v4    # "reader":Ljava/io/BufferedReader;
    :catch_0
    move-exception v1

    .line 118
    .local v1, "e":Ljava/lang/Exception;
    goto :goto_0
.end method

.method private static supportedOnThisDevice()Z
    .locals 7

    .prologue
    const/4 v3, 0x0

    .line 70
    invoke-static {}, Lcom/keepassdroid/compat/BuildCompat;->getManufacturer()Ljava/lang/String;

    move-result-object v4

    const-string v5, "samsung"

    sget-object v6, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-static {v4, v5, v6}, Lcom/keepassdroid/utils/StrUtil;->indexOfIgnoreCase(Ljava/lang/String;Ljava/lang/String;Ljava/util/Locale;)I

    move-result v4

    if-ltz v4, :cond_1

    .line 98
    .local v2, "urandom":Ljava/io/File;
    :cond_0
    :goto_0
    return v3

    .line 74
    .end local v2    # "urandom":Ljava/io/File;
    :cond_1
    sget v4, Lcom/keepassdroid/compat/PRNGFixes;->sdkVersion:I

    const/16 v5, 0x12

    if-gt v4, v5, :cond_0

    .line 78
    invoke-static {}, Lcom/keepassdroid/compat/PRNGFixes;->onSELinuxEnforce()Z

    move-result v4

    if-nez v4, :cond_0

    .line 82
    new-instance v2, Ljava/io/File;

    const-string v4, "/dev/urandom"

    invoke-direct {v2, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 85
    .restart local v2    # "urandom":Ljava/io/File;
    invoke-virtual {v2}, Ljava/io/File;->canRead()Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-virtual {v2}, Ljava/io/File;->canWrite()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 92
    :try_start_0
    new-instance v1, Ljava/io/FileOutputStream;

    invoke-direct {v1, v2}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 93
    .local v1, "fos":Ljava/io/FileOutputStream;
    const/4 v4, 0x0

    invoke-virtual {v1, v4}, Ljava/io/FileOutputStream;->write(I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 98
    const/4 v3, 0x1

    goto :goto_0

    .line 94
    .end local v1    # "fos":Ljava/io/FileOutputStream;
    :catch_0
    move-exception v0

    .line 95
    .local v0, "e":Ljava/lang/Exception;
    goto :goto_0
.end method
