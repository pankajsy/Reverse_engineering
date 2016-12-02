.class public Lcom/keepassdroid/utils/EmptyUtils;
.super Ljava/lang/Object;
.source "EmptyUtils.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static isNullOrEmpty(Landroid/net/Uri;)Z
    .locals 1
    .param p0, "uri"    # Landroid/net/Uri;

    .prologue
    .line 41
    if-eqz p0, :cond_0

    invoke-virtual {p0}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static isNullOrEmpty(Lcom/keepassdroid/database/PwDate;)Z
    .locals 1
    .param p0, "date"    # Lcom/keepassdroid/database/PwDate;

    .prologue
    .line 37
    if-eqz p0, :cond_0

    sget-object v0, Lcom/keepassdroid/database/PwEntryV3;->DEFAULT_PWDATE:Lcom/keepassdroid/database/PwDate;

    invoke-virtual {p0, v0}, Lcom/keepassdroid/database/PwDate;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static isNullOrEmpty(Ljava/lang/String;)Z
    .locals 1
    .param p0, "str"    # Ljava/lang/String;

    .prologue
    .line 29
    if-eqz p0, :cond_0

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static isNullOrEmpty([B)Z
    .locals 1
    .param p0, "buf"    # [B

    .prologue
    .line 33
    if-eqz p0, :cond_0

    array-length v0, p0

    if-nez v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method
