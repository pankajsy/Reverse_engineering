.class public Lcom/keepassdroid/compat/PRNGFixes$LinuxPRNGSecureRandom;
.super Ljava/security/SecureRandomSpi;
.source "PRNGFixes.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/keepassdroid/compat/PRNGFixes;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "LinuxPRNGSecureRandom"
.end annotation


# static fields
.field private static final URANDOM_FILE:Ljava/io/File;

.field private static final sLock:Ljava/lang/Object;

.field private static sUrandomIn:Ljava/io/DataInputStream;

.field private static sUrandomOut:Ljava/io/OutputStream;


# instance fields
.field private mSeeded:Z


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 244
    new-instance v0, Ljava/io/File;

    const-string v1, "/dev/urandom"

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/keepassdroid/compat/PRNGFixes$LinuxPRNGSecureRandom;->URANDOM_FILE:Ljava/io/File;

    .line 247
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcom/keepassdroid/compat/PRNGFixes$LinuxPRNGSecureRandom;->sLock:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 230
    invoke-direct {p0}, Ljava/security/SecureRandomSpi;-><init>()V

    return-void
.end method

.method private getUrandomInputStream()Ljava/io/DataInputStream;
    .locals 5

    .prologue
    .line 317
    sget-object v2, Lcom/keepassdroid/compat/PRNGFixes$LinuxPRNGSecureRandom;->sLock:Ljava/lang/Object;

    monitor-enter v2

    .line 318
    :try_start_0
    sget-object v1, Lcom/keepassdroid/compat/PRNGFixes$LinuxPRNGSecureRandom;->sUrandomIn:Ljava/io/DataInputStream;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v1, :cond_0

    .line 324
    :try_start_1
    new-instance v1, Ljava/io/DataInputStream;

    new-instance v3, Ljava/io/FileInputStream;

    sget-object v4, Lcom/keepassdroid/compat/PRNGFixes$LinuxPRNGSecureRandom;->URANDOM_FILE:Ljava/io/File;

    invoke-direct {v3, v4}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    invoke-direct {v1, v3}, Ljava/io/DataInputStream;-><init>(Ljava/io/InputStream;)V

    sput-object v1, Lcom/keepassdroid/compat/PRNGFixes$LinuxPRNGSecureRandom;->sUrandomIn:Ljava/io/DataInputStream;
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 331
    :cond_0
    :try_start_2
    sget-object v1, Lcom/keepassdroid/compat/PRNGFixes$LinuxPRNGSecureRandom;->sUrandomIn:Ljava/io/DataInputStream;

    monitor-exit v2

    return-object v1

    .line 326
    :catch_0
    move-exception v0

    .line 327
    .local v0, "e":Ljava/io/IOException;
    new-instance v1, Ljava/lang/SecurityException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Failed to open "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    sget-object v4, Lcom/keepassdroid/compat/PRNGFixes$LinuxPRNGSecureRandom;->URANDOM_FILE:Ljava/io/File;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " for reading"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, v3, v0}, Ljava/lang/SecurityException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1

    .line 332
    .end local v0    # "e":Ljava/io/IOException;
    :catchall_0
    move-exception v1

    monitor-exit v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v1
.end method

.method private getUrandomOutputStream()Ljava/io/OutputStream;
    .locals 5

    .prologue
    .line 336
    sget-object v2, Lcom/keepassdroid/compat/PRNGFixes$LinuxPRNGSecureRandom;->sLock:Ljava/lang/Object;

    monitor-enter v2

    .line 337
    :try_start_0
    sget-object v1, Lcom/keepassdroid/compat/PRNGFixes$LinuxPRNGSecureRandom;->sUrandomOut:Ljava/io/OutputStream;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v1, :cond_0

    .line 339
    :try_start_1
    new-instance v1, Ljava/io/FileOutputStream;

    sget-object v3, Lcom/keepassdroid/compat/PRNGFixes$LinuxPRNGSecureRandom;->URANDOM_FILE:Ljava/io/File;

    invoke-direct {v1, v3}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    sput-object v1, Lcom/keepassdroid/compat/PRNGFixes$LinuxPRNGSecureRandom;->sUrandomOut:Ljava/io/OutputStream;
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 345
    :cond_0
    :try_start_2
    sget-object v1, Lcom/keepassdroid/compat/PRNGFixes$LinuxPRNGSecureRandom;->sUrandomOut:Ljava/io/OutputStream;

    monitor-exit v2

    return-object v1

    .line 340
    :catch_0
    move-exception v0

    .line 341
    .local v0, "e":Ljava/io/IOException;
    new-instance v1, Ljava/lang/SecurityException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Failed to open "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    sget-object v4, Lcom/keepassdroid/compat/PRNGFixes$LinuxPRNGSecureRandom;->URANDOM_FILE:Ljava/io/File;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " for writing"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, v3, v0}, Ljava/lang/SecurityException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1

    .line 346
    .end local v0    # "e":Ljava/io/IOException;
    :catchall_0
    move-exception v1

    monitor-exit v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v1
.end method


# virtual methods
.method protected engineGenerateSeed(I)[B
    .locals 1
    .param p1, "size"    # I

    .prologue
    .line 311
    new-array v0, p1, [B

    .line 312
    .local v0, "seed":[B
    invoke-virtual {p0, v0}, Lcom/keepassdroid/compat/PRNGFixes$LinuxPRNGSecureRandom;->engineNextBytes([B)V

    .line 313
    return-object v0
.end method

.method protected engineNextBytes([B)V
    .locals 5
    .param p1, "bytes"    # [B

    .prologue
    .line 290
    iget-boolean v2, p0, Lcom/keepassdroid/compat/PRNGFixes$LinuxPRNGSecureRandom;->mSeeded:Z

    if-nez v2, :cond_0

    .line 292
    # invokes: Lcom/keepassdroid/compat/PRNGFixes;->generateSeed()[B
    invoke-static {}, Lcom/keepassdroid/compat/PRNGFixes;->access$000()[B

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/keepassdroid/compat/PRNGFixes$LinuxPRNGSecureRandom;->engineSetSeed([B)V

    .line 297
    :cond_0
    :try_start_0
    sget-object v3, Lcom/keepassdroid/compat/PRNGFixes$LinuxPRNGSecureRandom;->sLock:Ljava/lang/Object;

    monitor-enter v3
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 298
    :try_start_1
    invoke-direct {p0}, Lcom/keepassdroid/compat/PRNGFixes$LinuxPRNGSecureRandom;->getUrandomInputStream()Ljava/io/DataInputStream;

    move-result-object v1

    .line 299
    .local v1, "in":Ljava/io/DataInputStream;
    monitor-exit v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 300
    :try_start_2
    monitor-enter v1
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    .line 301
    :try_start_3
    invoke-virtual {v1, p1}, Ljava/io/DataInputStream;->readFully([B)V

    .line 302
    monitor-exit v1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 307
    return-void

    .line 299
    .end local v1    # "in":Ljava/io/DataInputStream;
    :catchall_0
    move-exception v2

    :try_start_4
    monitor-exit v3
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    :try_start_5
    throw v2
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_0

    .line 303
    :catch_0
    move-exception v0

    .line 304
    .local v0, "e":Ljava/io/IOException;
    new-instance v2, Ljava/lang/SecurityException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Failed to read from "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    sget-object v4, Lcom/keepassdroid/compat/PRNGFixes$LinuxPRNGSecureRandom;->URANDOM_FILE:Ljava/io/File;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3, v0}, Ljava/lang/SecurityException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2

    .line 302
    .end local v0    # "e":Ljava/io/IOException;
    .restart local v1    # "in":Ljava/io/DataInputStream;
    :catchall_1
    move-exception v2

    :try_start_6
    monitor-exit v1
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    :try_start_7
    throw v2
    :try_end_7
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_7} :catch_0
.end method

.method protected engineSetSeed([B)V
    .locals 5
    .param p1, "bytes"    # [B

    .prologue
    .line 276
    :try_start_0
    sget-object v3, Lcom/keepassdroid/compat/PRNGFixes$LinuxPRNGSecureRandom;->sLock:Ljava/lang/Object;

    monitor-enter v3
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 277
    :try_start_1
    invoke-direct {p0}, Lcom/keepassdroid/compat/PRNGFixes$LinuxPRNGSecureRandom;->getUrandomOutputStream()Ljava/io/OutputStream;

    move-result-object v1

    .line 278
    .local v1, "out":Ljava/io/OutputStream;
    monitor-exit v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 279
    :try_start_2
    invoke-virtual {v1, p1}, Ljava/io/OutputStream;->write([B)V

    .line 280
    invoke-virtual {v1}, Ljava/io/OutputStream;->flush()V

    .line 281
    const/4 v2, 0x1

    iput-boolean v2, p0, Lcom/keepassdroid/compat/PRNGFixes$LinuxPRNGSecureRandom;->mSeeded:Z
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    .line 286
    return-void

    .line 278
    .end local v1    # "out":Ljava/io/OutputStream;
    :catchall_0
    move-exception v2

    :try_start_3
    monitor-exit v3
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    :try_start_4
    throw v2
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_0

    .line 282
    :catch_0
    move-exception v0

    .line 283
    .local v0, "e":Ljava/io/IOException;
    new-instance v2, Ljava/lang/SecurityException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Failed to mix seed into "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    sget-object v4, Lcom/keepassdroid/compat/PRNGFixes$LinuxPRNGSecureRandom;->URANDOM_FILE:Ljava/io/File;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3, v0}, Ljava/lang/SecurityException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2
.end method
