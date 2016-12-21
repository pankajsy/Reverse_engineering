.class public abstract Lcom/keepassdroid/database/EntrySearchHandler;
.super Lcom/keepassdroid/database/EntryHandler;
.source "EntrySearchHandler.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/keepassdroid/database/EntryHandler",
        "<",
        "Lcom/keepassdroid/database/PwEntry;",
        ">;"
    }
.end annotation


# instance fields
.field private listStorage:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/keepassdroid/database/PwEntry;",
            ">;"
        }
    .end annotation
.end field

.field private now:Ljava/util/Date;

.field private sp:Lcom/keepassdroid/database/SearchParameters;


# direct methods
.method protected constructor <init>(Lcom/keepassdroid/database/SearchParameters;Ljava/util/List;)V
    .locals 1
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
    .line 43
    .local p2, "listStorage":Ljava/util/List;, "Ljava/util/List<Lcom/keepassdroid/database/PwEntry;>;"
    invoke-direct {p0}, Lcom/keepassdroid/database/EntryHandler;-><init>()V

    .line 44
    iput-object p1, p0, Lcom/keepassdroid/database/EntrySearchHandler;->sp:Lcom/keepassdroid/database/SearchParameters;

    .line 45
    iput-object p2, p0, Lcom/keepassdroid/database/EntrySearchHandler;->listStorage:Ljava/util/List;

    .line 46
    new-instance v0, Ljava/util/Date;

    invoke-direct {v0}, Ljava/util/Date;-><init>()V

    iput-object v0, p0, Lcom/keepassdroid/database/EntrySearchHandler;->now:Ljava/util/Date;

    .line 47
    return-void
.end method

.method public static getInstance(Lcom/keepassdroid/database/PwGroup;Lcom/keepassdroid/database/SearchParameters;Ljava/util/List;)Lcom/keepassdroid/database/EntrySearchHandler;
    .locals 2
    .param p0, "group"    # Lcom/keepassdroid/database/PwGroup;
    .param p1, "sp"    # Lcom/keepassdroid/database/SearchParameters;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/keepassdroid/database/PwGroup;",
            "Lcom/keepassdroid/database/SearchParameters;",
            "Ljava/util/List",
            "<",
            "Lcom/keepassdroid/database/PwEntry;",
            ">;)",
            "Lcom/keepassdroid/database/EntrySearchHandler;"
        }
    .end annotation

    .prologue
    .line 33
    .local p2, "listStorage":Ljava/util/List;, "Ljava/util/List<Lcom/keepassdroid/database/PwEntry;>;"
    instance-of v0, p0, Lcom/keepassdroid/database/PwGroupV3;

    if-eqz v0, :cond_0

    .line 34
    new-instance v0, Lcom/keepassdroid/database/EntrySearchHandlerV4;

    invoke-direct {v0, p1, p2}, Lcom/keepassdroid/database/EntrySearchHandlerV4;-><init>(Lcom/keepassdroid/database/SearchParameters;Ljava/util/List;)V

    .line 36
    :goto_0
    return-object v0

    .line 35
    :cond_0
    instance-of v0, p0, Lcom/keepassdroid/database/PwGroupV4;

    if-eqz v0, :cond_1

    .line 36
    new-instance v0, Lcom/keepassdroid/database/EntrySearchHandlerV4;

    invoke-direct {v0, p1, p2}, Lcom/keepassdroid/database/EntrySearchHandlerV4;-><init>(Lcom/keepassdroid/database/SearchParameters;Ljava/util/List;)V

    goto :goto_0

    .line 38
    :cond_1
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "Not implemented."

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private searchStrings(Lcom/keepassdroid/database/PwEntry;Ljava/lang/String;)Z
    .locals 6
    .param p1, "entry"    # Lcom/keepassdroid/database/PwEntry;
    .param p2, "term"    # Ljava/lang/String;

    .prologue
    const/4 v3, 0x1

    const/4 v4, 0x0

    .line 99
    iget-object v2, p0, Lcom/keepassdroid/database/EntrySearchHandler;->sp:Lcom/keepassdroid/database/SearchParameters;

    invoke-static {p1, v2}, Lcom/keepassdroid/database/iterator/EntrySearchStringIterator;->getInstance(Lcom/keepassdroid/database/PwEntry;Lcom/keepassdroid/database/SearchParameters;)Lcom/keepassdroid/database/iterator/EntrySearchStringIterator;

    move-result-object v0

    .line 100
    .local v0, "iter":Lcom/keepassdroid/database/iterator/EntrySearchStringIterator;
    :cond_0
    invoke-virtual {v0}, Lcom/keepassdroid/database/iterator/EntrySearchStringIterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_4

    .line 101
    invoke-virtual {v0}, Lcom/keepassdroid/database/iterator/EntrySearchStringIterator;->next()Ljava/lang/String;

    move-result-object v1

    .line 102
    .local v1, "str":Ljava/lang/String;
    if-eqz v1, :cond_2

    move v2, v3

    :goto_0
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v5

    if-lez v5, :cond_3

    move v5, v3

    :goto_1
    and-int/2addr v2, v5

    if-eqz v2, :cond_0

    .line 103
    iget-object v2, p0, Lcom/keepassdroid/database/EntrySearchHandler;->sp:Lcom/keepassdroid/database/SearchParameters;

    iget-boolean v2, v2, Lcom/keepassdroid/database/SearchParameters;->ignoreCase:Z

    if-eqz v2, :cond_1

    .line 104
    invoke-virtual {v1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    .line 107
    :cond_1
    invoke-virtual {v1, p2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v2

    if-ltz v2, :cond_0

    .line 113
    .end local v1    # "str":Ljava/lang/String;
    :goto_2
    return v3

    .restart local v1    # "str":Ljava/lang/String;
    :cond_2
    move v2, v4

    .line 102
    goto :goto_0

    :cond_3
    move v5, v4

    goto :goto_1

    .end local v1    # "str":Ljava/lang/String;
    :cond_4
    move v3, v4

    .line 113
    goto :goto_2
.end method


# virtual methods
.method public operate(Lcom/keepassdroid/database/PwEntry;)Z
    .locals 6
    .param p1, "entry"    # Lcom/keepassdroid/database/PwEntry;

    .prologue
    const/4 v5, 0x1

    .line 51
    iget-object v3, p0, Lcom/keepassdroid/database/EntrySearchHandler;->sp:Lcom/keepassdroid/database/SearchParameters;

    iget-boolean v3, v3, Lcom/keepassdroid/database/SearchParameters;->respectEntrySearchingDisabled:Z

    if-eqz v3, :cond_1

    invoke-virtual {p1}, Lcom/keepassdroid/database/PwEntry;->isSearchingEnabled()Z

    move-result v3

    if-nez v3, :cond_1

    .line 91
    :cond_0
    :goto_0
    return v5

    .line 55
    :cond_1
    iget-object v3, p0, Lcom/keepassdroid/database/EntrySearchHandler;->sp:Lcom/keepassdroid/database/SearchParameters;

    iget-boolean v3, v3, Lcom/keepassdroid/database/SearchParameters;->excludeExpired:Z

    if-eqz v3, :cond_2

    invoke-virtual {p1}, Lcom/keepassdroid/database/PwEntry;->expires()Z

    move-result v3

    if-eqz v3, :cond_2

    iget-object v3, p0, Lcom/keepassdroid/database/EntrySearchHandler;->now:Ljava/util/Date;

    invoke-virtual {p1}, Lcom/keepassdroid/database/PwEntry;->getExpiryTime()Ljava/util/Date;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/util/Date;->after(Ljava/util/Date;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 59
    :cond_2
    iget-object v3, p0, Lcom/keepassdroid/database/EntrySearchHandler;->sp:Lcom/keepassdroid/database/SearchParameters;

    iget-object v2, v3, Lcom/keepassdroid/database/SearchParameters;->searchString:Ljava/lang/String;

    .line 60
    .local v2, "term":Ljava/lang/String;
    iget-object v3, p0, Lcom/keepassdroid/database/EntrySearchHandler;->sp:Lcom/keepassdroid/database/SearchParameters;

    iget-boolean v3, v3, Lcom/keepassdroid/database/SearchParameters;->ignoreCase:Z

    if-eqz v3, :cond_3

    .line 61
    invoke-virtual {v2}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v2

    .line 64
    :cond_3
    invoke-direct {p0, p1, v2}, Lcom/keepassdroid/database/EntrySearchHandler;->searchStrings(Lcom/keepassdroid/database/PwEntry;Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_4

    .line 65
    iget-object v3, p0, Lcom/keepassdroid/database/EntrySearchHandler;->listStorage:Ljava/util/List;

    invoke-interface {v3, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 69
    :cond_4
    iget-object v3, p0, Lcom/keepassdroid/database/EntrySearchHandler;->sp:Lcom/keepassdroid/database/SearchParameters;

    iget-boolean v3, v3, Lcom/keepassdroid/database/SearchParameters;->searchInGroupNames:Z

    if-eqz v3, :cond_6

    .line 70
    invoke-virtual {p1}, Lcom/keepassdroid/database/PwEntry;->getParent()Lcom/keepassdroid/database/PwGroup;

    move-result-object v1

    .line 71
    .local v1, "parent":Lcom/keepassdroid/database/PwGroup;
    if-eqz v1, :cond_6

    .line 72
    invoke-virtual {v1}, Lcom/keepassdroid/database/PwGroup;->getName()Ljava/lang/String;

    move-result-object v0

    .line 73
    .local v0, "groupName":Ljava/lang/String;
    if-eqz v0, :cond_6

    .line 74
    iget-object v3, p0, Lcom/keepassdroid/database/EntrySearchHandler;->sp:Lcom/keepassdroid/database/SearchParameters;

    iget-boolean v3, v3, Lcom/keepassdroid/database/SearchParameters;->ignoreCase:Z

    if-eqz v3, :cond_5

    .line 75
    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    .line 78
    :cond_5
    invoke-virtual {v0, v2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v3

    if-ltz v3, :cond_6

    .line 79
    iget-object v3, p0, Lcom/keepassdroid/database/EntrySearchHandler;->listStorage:Ljava/util/List;

    invoke-interface {v3, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 86
    .end local v0    # "groupName":Ljava/lang/String;
    .end local v1    # "parent":Lcom/keepassdroid/database/PwGroup;
    :cond_6
    invoke-virtual {p0, p1}, Lcom/keepassdroid/database/EntrySearchHandler;->searchID(Lcom/keepassdroid/database/PwEntry;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 87
    iget-object v3, p0, Lcom/keepassdroid/database/EntrySearchHandler;->listStorage:Ljava/util/List;

    invoke-interface {v3, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0
.end method

.method protected searchID(Lcom/keepassdroid/database/PwEntry;)Z
    .locals 1
    .param p1, "entry"    # Lcom/keepassdroid/database/PwEntry;

    .prologue
    .line 95
    const/4 v0, 0x0

    return v0
.end method
