.class public Lcom/keepassdroid/database/iterator/EntrySearchStringIteratorV4;
.super Lcom/keepassdroid/database/iterator/EntrySearchStringIterator;
.source "EntrySearchStringIteratorV4.java"


# instance fields
.field private current:Ljava/lang/String;

.field private setIterator:Ljava/util/Iterator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Iterator",
            "<",
            "Ljava/util/Map$Entry",
            "<",
            "Ljava/lang/String;",
            "Lcom/keepassdroid/database/security/ProtectedString;",
            ">;>;"
        }
    .end annotation
.end field

.field private sp:Lcom/keepassdroid/database/SearchParametersV4;


# direct methods
.method public constructor <init>(Lcom/keepassdroid/database/PwEntryV4;)V
    .locals 1
    .param p1, "entry"    # Lcom/keepassdroid/database/PwEntryV4;

    .prologue
    .line 36
    invoke-direct {p0}, Lcom/keepassdroid/database/iterator/EntrySearchStringIterator;-><init>()V

    .line 37
    sget-object v0, Lcom/keepassdroid/database/SearchParametersV4;->DEFAULT:Lcom/keepassdroid/database/SearchParametersV4;

    iput-object v0, p0, Lcom/keepassdroid/database/iterator/EntrySearchStringIteratorV4;->sp:Lcom/keepassdroid/database/SearchParametersV4;

    .line 38
    iget-object v0, p1, Lcom/keepassdroid/database/PwEntryV4;->strings:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    iput-object v0, p0, Lcom/keepassdroid/database/iterator/EntrySearchStringIteratorV4;->setIterator:Ljava/util/Iterator;

    .line 39
    invoke-direct {p0}, Lcom/keepassdroid/database/iterator/EntrySearchStringIteratorV4;->advance()V

    .line 41
    return-void
.end method

.method public constructor <init>(Lcom/keepassdroid/database/PwEntryV4;Lcom/keepassdroid/database/SearchParametersV4;)V
    .locals 1
    .param p1, "entry"    # Lcom/keepassdroid/database/PwEntryV4;
    .param p2, "sp"    # Lcom/keepassdroid/database/SearchParametersV4;

    .prologue
    .line 43
    invoke-direct {p0}, Lcom/keepassdroid/database/iterator/EntrySearchStringIterator;-><init>()V

    .line 44
    iput-object p2, p0, Lcom/keepassdroid/database/iterator/EntrySearchStringIteratorV4;->sp:Lcom/keepassdroid/database/SearchParametersV4;

    .line 45
    iget-object v0, p1, Lcom/keepassdroid/database/PwEntryV4;->strings:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    iput-object v0, p0, Lcom/keepassdroid/database/iterator/EntrySearchStringIteratorV4;->setIterator:Ljava/util/Iterator;

    .line 46
    invoke-direct {p0}, Lcom/keepassdroid/database/iterator/EntrySearchStringIteratorV4;->advance()V

    .line 47
    return-void
.end method

.method private advance()V
    .locals 3

    .prologue
    .line 66
    :cond_0
    iget-object v2, p0, Lcom/keepassdroid/database/iterator/EntrySearchStringIteratorV4;->setIterator:Ljava/util/Iterator;

    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 67
    iget-object v2, p0, Lcom/keepassdroid/database/iterator/EntrySearchStringIteratorV4;->setIterator:Ljava/util/Iterator;

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 69
    .local v0, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Lcom/keepassdroid/database/security/ProtectedString;>;"
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 71
    .local v1, "key":Ljava/lang/String;
    invoke-direct {p0, v1}, Lcom/keepassdroid/database/iterator/EntrySearchStringIteratorV4;->searchInField(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 72
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/keepassdroid/database/security/ProtectedString;

    invoke-virtual {v2}, Lcom/keepassdroid/database/security/ProtectedString;->toString()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/keepassdroid/database/iterator/EntrySearchStringIteratorV4;->current:Ljava/lang/String;

    .line 79
    .end local v0    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Lcom/keepassdroid/database/security/ProtectedString;>;"
    .end local v1    # "key":Ljava/lang/String;
    :goto_0
    return-void

    .line 78
    :cond_1
    const/4 v2, 0x0

    iput-object v2, p0, Lcom/keepassdroid/database/iterator/EntrySearchStringIteratorV4;->current:Ljava/lang/String;

    goto :goto_0
.end method

.method private searchInField(Ljava/lang/String;)Z
    .locals 1
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 82
    const-string v0, "Title"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 83
    iget-object v0, p0, Lcom/keepassdroid/database/iterator/EntrySearchStringIteratorV4;->sp:Lcom/keepassdroid/database/SearchParametersV4;

    iget-boolean v0, v0, Lcom/keepassdroid/database/SearchParametersV4;->searchInTitles:Z

    .line 93
    :goto_0
    return v0

    .line 84
    :cond_0
    const-string v0, "UserName"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 85
    iget-object v0, p0, Lcom/keepassdroid/database/iterator/EntrySearchStringIteratorV4;->sp:Lcom/keepassdroid/database/SearchParametersV4;

    iget-boolean v0, v0, Lcom/keepassdroid/database/SearchParametersV4;->searchInUserNames:Z

    goto :goto_0

    .line 86
    :cond_1
    const-string v0, "Password"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 87
    iget-object v0, p0, Lcom/keepassdroid/database/iterator/EntrySearchStringIteratorV4;->sp:Lcom/keepassdroid/database/SearchParametersV4;

    iget-boolean v0, v0, Lcom/keepassdroid/database/SearchParametersV4;->searchInPasswords:Z

    goto :goto_0

    .line 88
    :cond_2
    const-string v0, "URL"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 89
    iget-object v0, p0, Lcom/keepassdroid/database/iterator/EntrySearchStringIteratorV4;->sp:Lcom/keepassdroid/database/SearchParametersV4;

    iget-boolean v0, v0, Lcom/keepassdroid/database/SearchParametersV4;->searchInUrls:Z

    goto :goto_0

    .line 90
    :cond_3
    const-string v0, "Notes"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 91
    iget-object v0, p0, Lcom/keepassdroid/database/iterator/EntrySearchStringIteratorV4;->sp:Lcom/keepassdroid/database/SearchParametersV4;

    iget-boolean v0, v0, Lcom/keepassdroid/database/SearchParametersV4;->searchInNotes:Z

    goto :goto_0

    .line 93
    :cond_4
    iget-object v0, p0, Lcom/keepassdroid/database/iterator/EntrySearchStringIteratorV4;->sp:Lcom/keepassdroid/database/SearchParametersV4;

    iget-boolean v0, v0, Lcom/keepassdroid/database/SearchParametersV4;->searchInOther:Z

    goto :goto_0
.end method


# virtual methods
.method public hasNext()Z
    .locals 1

    .prologue
    .line 51
    iget-object v0, p0, Lcom/keepassdroid/database/iterator/EntrySearchStringIteratorV4;->current:Ljava/lang/String;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public bridge synthetic next()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 30
    invoke-virtual {p0}, Lcom/keepassdroid/database/iterator/EntrySearchStringIteratorV4;->next()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public next()Ljava/lang/String;
    .locals 3

    .prologue
    .line 56
    iget-object v1, p0, Lcom/keepassdroid/database/iterator/EntrySearchStringIteratorV4;->current:Ljava/lang/String;

    if-nez v1, :cond_0

    .line 57
    new-instance v1, Ljava/util/NoSuchElementException;

    const-string v2, "Past the end of the list."

    invoke-direct {v1, v2}, Ljava/util/NoSuchElementException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 60
    :cond_0
    iget-object v0, p0, Lcom/keepassdroid/database/iterator/EntrySearchStringIteratorV4;->current:Ljava/lang/String;

    .line 61
    .local v0, "next":Ljava/lang/String;
    invoke-direct {p0}, Lcom/keepassdroid/database/iterator/EntrySearchStringIteratorV4;->advance()V

    .line 62
    return-object v0
.end method
