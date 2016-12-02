.class public Lcom/keepassdroid/crypto/NativeLib;
.super Ljava/lang/Object;
.source "NativeLib.java"


# static fields
.field private static isLoaded:Z

.field private static loadSuccess:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 23
    sput-boolean v0, Lcom/keepassdroid/crypto/NativeLib;->isLoaded:Z

    .line 24
    sput-boolean v0, Lcom/keepassdroid/crypto/NativeLib;->loadSuccess:Z

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static init()Z
    .locals 3

    .prologue
    const/4 v2, 0x1

    .line 31
    sget-boolean v1, Lcom/keepassdroid/crypto/NativeLib;->isLoaded:Z

    if-nez v1, :cond_0

    .line 33
    :try_start_0
    const-string v1, "final-key"

    invoke-static {v1}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/UnsatisfiedLinkError; {:try_start_0 .. :try_end_0} :catch_0

    .line 37
    sput-boolean v2, Lcom/keepassdroid/crypto/NativeLib;->isLoaded:Z

    .line 38
    sput-boolean v2, Lcom/keepassdroid/crypto/NativeLib;->loadSuccess:Z

    .line 41
    :cond_0
    sget-boolean v1, Lcom/keepassdroid/crypto/NativeLib;->loadSuccess:Z

    .local v0, "e":Ljava/lang/UnsatisfiedLinkError;
    :goto_0
    return v1

    .line 34
    .end local v0    # "e":Ljava/lang/UnsatisfiedLinkError;
    :catch_0
    move-exception v0

    .line 35
    .restart local v0    # "e":Ljava/lang/UnsatisfiedLinkError;
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public static loaded()Z
    .locals 1

    .prologue
    .line 27
    invoke-static {}, Lcom/keepassdroid/crypto/NativeLib;->init()Z

    move-result v0

    return v0
.end method
