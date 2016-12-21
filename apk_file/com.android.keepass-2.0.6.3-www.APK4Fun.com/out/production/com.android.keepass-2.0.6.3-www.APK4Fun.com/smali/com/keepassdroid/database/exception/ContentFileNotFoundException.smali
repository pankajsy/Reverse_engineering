.class public Lcom/keepassdroid/database/exception/ContentFileNotFoundException;
.super Ljava/io/FileNotFoundException;
.source "ContentFileNotFoundException.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 45
    invoke-direct {p0}, Ljava/io/FileNotFoundException;-><init>()V

    .line 46
    return-void
.end method

.method public static getInstance(Landroid/net/Uri;)Ljava/io/FileNotFoundException;
    .locals 2
    .param p0, "uri"    # Landroid/net/Uri;

    .prologue
    .line 33
    if-nez p0, :cond_0

    new-instance v1, Ljava/io/FileNotFoundException;

    invoke-direct {v1}, Ljava/io/FileNotFoundException;-><init>()V

    .line 41
    :goto_0
    return-object v1

    .line 35
    :cond_0
    invoke-virtual {p0}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v0

    .line 37
    .local v0, "scheme":Ljava/lang/String;
    invoke-static {v0}, Lcom/keepassdroid/utils/EmptyUtils;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_1

    const-string v1, "content"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 38
    new-instance v1, Lcom/keepassdroid/database/exception/ContentFileNotFoundException;

    invoke-direct {v1}, Lcom/keepassdroid/database/exception/ContentFileNotFoundException;-><init>()V

    goto :goto_0

    .line 41
    :cond_1
    new-instance v1, Ljava/io/FileNotFoundException;

    invoke-direct {v1}, Ljava/io/FileNotFoundException;-><init>()V

    goto :goto_0
.end method
