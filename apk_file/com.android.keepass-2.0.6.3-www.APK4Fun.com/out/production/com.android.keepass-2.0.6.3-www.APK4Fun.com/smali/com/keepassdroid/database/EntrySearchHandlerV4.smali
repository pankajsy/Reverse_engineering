.class public Lcom/keepassdroid/database/EntrySearchHandlerV4;
.super Lcom/keepassdroid/database/EntrySearchHandler;
.source "EntrySearchHandlerV4.java"


# instance fields
.field private sp:Lcom/keepassdroid/database/SearchParametersV4;


# direct methods
.method protected constructor <init>(Lcom/keepassdroid/database/SearchParameters;Ljava/util/List;)V
    .locals 0
    .param p1, "sp"    # Lcom/keepassdroid/database/SearchParameters;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/keepassdroid/database/SearchParameters;",
            "Ljava/util/List",
            "<",
            "Lcom/keepassdroid/database/PwEntry;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 32
    .local p2, "listStorage":Ljava/util/List;, "Ljava/util/List<Lcom/keepassdroid/database/PwEntry;>;"
    invoke-direct {p0, p1, p2}, Lcom/keepassdroid/database/EntrySearchHandler;-><init>(Lcom/keepassdroid/database/SearchParameters;Ljava/util/List;)V

    .line 33
    check-cast p1, Lcom/keepassdroid/database/SearchParametersV4;

    .end local p1    # "sp":Lcom/keepassdroid/database/SearchParameters;
    iput-object p1, p0, Lcom/keepassdroid/database/EntrySearchHandlerV4;->sp:Lcom/keepassdroid/database/SearchParametersV4;

    .line 34
    return-void
.end method


# virtual methods
.method protected searchID(Lcom/keepassdroid/database/PwEntry;)Z
    .locals 5
    .param p1, "e"    # Lcom/keepassdroid/database/PwEntry;

    .prologue
    const/4 v2, 0x0

    .line 38
    move-object v0, p1

    check-cast v0, Lcom/keepassdroid/database/PwEntryV4;

    .line 39
    .local v0, "entry":Lcom/keepassdroid/database/PwEntryV4;
    iget-object v3, p0, Lcom/keepassdroid/database/EntrySearchHandlerV4;->sp:Lcom/keepassdroid/database/SearchParametersV4;

    iget-boolean v3, v3, Lcom/keepassdroid/database/SearchParametersV4;->searchInUUIDs:Z

    if-eqz v3, :cond_0

    .line 40
    iget-object v3, v0, Lcom/keepassdroid/database/PwEntryV4;->uuid:Ljava/util/UUID;

    invoke-static {v3}, Lcom/keepassdroid/utils/UuidUtil;->toHexString(Ljava/util/UUID;)Ljava/lang/String;

    move-result-object v1

    .line 41
    .local v1, "hex":Ljava/lang/String;
    iget-object v3, p0, Lcom/keepassdroid/database/EntrySearchHandlerV4;->sp:Lcom/keepassdroid/database/SearchParametersV4;

    iget-object v3, v3, Lcom/keepassdroid/database/SearchParametersV4;->searchString:Ljava/lang/String;

    sget-object v4, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-static {v1, v3, v4}, Lcom/keepassdroid/utils/StrUtil;->indexOfIgnoreCase(Ljava/lang/String;Ljava/lang/String;Ljava/util/Locale;)I

    move-result v3

    if-ltz v3, :cond_0

    const/4 v2, 0x1

    .line 44
    .end local v1    # "hex":Ljava/lang/String;
    :cond_0
    return v2
.end method
