.class public Lcom/keepassdroid/utils/StrUtil;
.super Ljava/lang/Object;
.source "StrUtil.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static indexOfIgnoreCase(Ljava/lang/String;Ljava/lang/String;ILjava/util/Locale;)I
    .locals 2
    .param p0, "text"    # Ljava/lang/String;
    .param p1, "search"    # Ljava/lang/String;
    .param p2, "start"    # I
    .param p3, "locale"    # Ljava/util/Locale;

    .prologue
    .line 62
    if-eqz p0, :cond_0

    if-nez p1, :cond_1

    :cond_0
    const/4 v0, -0x1

    .line 64
    :goto_0
    return v0

    :cond_1
    invoke-virtual {p0, p3}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, p3}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1, p2}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v0

    goto :goto_0
.end method

.method public static indexOfIgnoreCase(Ljava/lang/String;Ljava/lang/String;Ljava/util/Locale;)I
    .locals 1
    .param p0, "text"    # Ljava/lang/String;
    .param p1, "search"    # Ljava/lang/String;
    .param p2, "locale"    # Ljava/util/Locale;

    .prologue
    .line 68
    const/4 v0, 0x0

    invoke-static {p0, p1, v0, p2}, Lcom/keepassdroid/utils/StrUtil;->indexOfIgnoreCase(Ljava/lang/String;Ljava/lang/String;ILjava/util/Locale;)I

    move-result v0

    return v0
.end method

.method public static replaceAllIgnoresCase(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/Locale;)Ljava/lang/String;
    .locals 4
    .param p0, "text"    # Ljava/lang/String;
    .param p1, "find"    # Ljava/lang/String;
    .param p2, "newText"    # Ljava/lang/String;
    .param p3, "locale"    # Ljava/util/Locale;

    .prologue
    .line 72
    if-eqz p0, :cond_0

    if-eqz p1, :cond_0

    if-nez p2, :cond_1

    .line 86
    :cond_0
    return-object p0

    .line 74
    :cond_1
    const/4 v2, 0x0

    .line 75
    .local v2, "pos":I
    :goto_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    if-ge v2, v3, :cond_0

    .line 76
    invoke-static {p0, p1, v2, p3}, Lcom/keepassdroid/utils/StrUtil;->indexOfIgnoreCase(Ljava/lang/String;Ljava/lang/String;ILjava/util/Locale;)I

    move-result v2

    .line 77
    if-ltz v2, :cond_0

    .line 79
    const/4 v3, 0x0

    invoke-virtual {p0, v3, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    .line 80
    .local v1, "before":Ljava/lang/String;
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v3

    add-int/2addr v3, v2

    invoke-virtual {p0, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    .line 82
    .local v0, "after":Ljava/lang/String;
    invoke-virtual {v1, p2}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 83
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v3

    add-int/2addr v2, v3

    .line 84
    goto :goto_0
.end method

.method public static splitSearchTerms(Ljava/lang/String;)Ljava/util/List;
    .locals 8
    .param p0, "search"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    const/4 v6, 0x0

    .line 28
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 29
    .local v3, "list":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    if-nez p0, :cond_1

    .line 58
    :cond_0
    :goto_0
    return-object v3

    .line 31
    :cond_1
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 32
    .local v5, "sb":Ljava/lang/StringBuilder;
    const/4 v4, 0x0

    .line 34
    .local v4, "quoted":Z
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v7

    if-ge v1, v7, :cond_7

    .line 35
    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 37
    .local v0, "ch":C
    const/16 v7, 0x20

    if-eq v0, v7, :cond_2

    const/16 v7, 0x9

    if-eq v0, v7, :cond_2

    const/16 v7, 0xd

    if-eq v0, v7, :cond_2

    const/16 v7, 0xa

    if-ne v0, v7, :cond_3

    :cond_2
    if-nez v4, :cond_3

    .line 40
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->length()I

    move-result v2

    .line 41
    .local v2, "len":I
    if-lez v2, :cond_4

    .line 42
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-interface {v3, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 43
    invoke-virtual {v5, v6, v2}, Ljava/lang/StringBuilder;->delete(II)Ljava/lang/StringBuilder;

    .line 34
    .end local v2    # "len":I
    :cond_3
    :goto_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 45
    .restart local v2    # "len":I
    :cond_4
    const/16 v7, 0x22

    if-ne v0, v7, :cond_6

    .line 46
    if-nez v4, :cond_5

    const/4 v4, 0x1

    :goto_3
    goto :goto_2

    :cond_5
    move v4, v6

    goto :goto_3

    .line 49
    :cond_6
    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_2

    .line 54
    .end local v0    # "ch":C
    .end local v2    # "len":I
    :cond_7
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->length()I

    move-result v6

    if-lez v6, :cond_0

    .line 55
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v3, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0
.end method
