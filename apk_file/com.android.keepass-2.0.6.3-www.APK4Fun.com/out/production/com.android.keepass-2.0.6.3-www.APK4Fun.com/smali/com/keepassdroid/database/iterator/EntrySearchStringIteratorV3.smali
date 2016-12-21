.class public Lcom/keepassdroid/database/iterator/EntrySearchStringIteratorV3;
.super Lcom/keepassdroid/database/iterator/EntrySearchStringIterator;
.source "EntrySearchStringIteratorV3.java"


# static fields
.field private static final comment:I = 0x3

.field private static final maxEntries:I = 0x4

.field private static final title:I = 0x0

.field private static final url:I = 0x1

.field private static final username:I = 0x2


# instance fields
.field private current:I

.field private entry:Lcom/keepassdroid/database/PwEntryV3;

.field private sp:Lcom/keepassdroid/database/SearchParameters;


# direct methods
.method public constructor <init>(Lcom/keepassdroid/database/PwEntryV3;)V
    .locals 1
    .param p1, "entry"    # Lcom/keepassdroid/database/PwEntryV3;

    .prologue
    .line 32
    invoke-direct {p0}, Lcom/keepassdroid/database/iterator/EntrySearchStringIterator;-><init>()V

    .line 48
    const/4 v0, 0x0

    iput v0, p0, Lcom/keepassdroid/database/iterator/EntrySearchStringIteratorV3;->current:I

    .line 33
    iput-object p1, p0, Lcom/keepassdroid/database/iterator/EntrySearchStringIteratorV3;->entry:Lcom/keepassdroid/database/PwEntryV3;

    .line 34
    sget-object v0, Lcom/keepassdroid/database/SearchParameters;->DEFAULT:Lcom/keepassdroid/database/SearchParameters;

    iput-object v0, p0, Lcom/keepassdroid/database/iterator/EntrySearchStringIteratorV3;->sp:Lcom/keepassdroid/database/SearchParameters;

    .line 35
    return-void
.end method

.method public constructor <init>(Lcom/keepassdroid/database/PwEntryV3;Lcom/keepassdroid/database/SearchParameters;)V
    .locals 1
    .param p1, "entry"    # Lcom/keepassdroid/database/PwEntryV3;
    .param p2, "sp"    # Lcom/keepassdroid/database/SearchParameters;

    .prologue
    .line 37
    invoke-direct {p0}, Lcom/keepassdroid/database/iterator/EntrySearchStringIterator;-><init>()V

    .line 48
    const/4 v0, 0x0

    iput v0, p0, Lcom/keepassdroid/database/iterator/EntrySearchStringIteratorV3;->current:I

    .line 38
    iput-object p1, p0, Lcom/keepassdroid/database/iterator/EntrySearchStringIteratorV3;->entry:Lcom/keepassdroid/database/PwEntryV3;

    .line 39
    iput-object p2, p0, Lcom/keepassdroid/database/iterator/EntrySearchStringIteratorV3;->sp:Lcom/keepassdroid/database/SearchParameters;

    .line 40
    return-void
.end method

.method private getCurrentString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 98
    iget v0, p0, Lcom/keepassdroid/database/iterator/EntrySearchStringIteratorV3;->current:I

    packed-switch v0, :pswitch_data_0

    .line 112
    const-string v0, ""

    :goto_0
    return-object v0

    .line 100
    :pswitch_0
    iget-object v0, p0, Lcom/keepassdroid/database/iterator/EntrySearchStringIteratorV3;->entry:Lcom/keepassdroid/database/PwEntryV3;

    invoke-virtual {v0}, Lcom/keepassdroid/database/PwEntryV3;->getTitle()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 103
    :pswitch_1
    iget-object v0, p0, Lcom/keepassdroid/database/iterator/EntrySearchStringIteratorV3;->entry:Lcom/keepassdroid/database/PwEntryV3;

    invoke-virtual {v0}, Lcom/keepassdroid/database/PwEntryV3;->getUrl()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 106
    :pswitch_2
    iget-object v0, p0, Lcom/keepassdroid/database/iterator/EntrySearchStringIteratorV3;->entry:Lcom/keepassdroid/database/PwEntryV3;

    invoke-virtual {v0}, Lcom/keepassdroid/database/PwEntryV3;->getUsername()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 109
    :pswitch_3
    iget-object v0, p0, Lcom/keepassdroid/database/iterator/EntrySearchStringIteratorV3;->entry:Lcom/keepassdroid/database/PwEntryV3;

    invoke-virtual {v0}, Lcom/keepassdroid/database/PwEntryV3;->getNotes()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 98
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method

.method private useSearchParameters()V
    .locals 2

    .prologue
    .line 71
    iget-object v1, p0, Lcom/keepassdroid/database/iterator/EntrySearchStringIteratorV3;->sp:Lcom/keepassdroid/database/SearchParameters;

    if-nez v1, :cond_1

    .line 95
    :cond_0
    return-void

    .line 73
    :cond_1
    const/4 v0, 0x0

    .line 75
    .local v0, "found":Z
    :cond_2
    :goto_0
    if-nez v0, :cond_0

    .line 76
    iget v1, p0, Lcom/keepassdroid/database/iterator/EntrySearchStringIteratorV3;->current:I

    packed-switch v1, :pswitch_data_0

    .line 90
    :goto_1
    const/4 v0, 0x1

    .line 93
    if-nez v0, :cond_2

    iget v1, p0, Lcom/keepassdroid/database/iterator/EntrySearchStringIteratorV3;->current:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/keepassdroid/database/iterator/EntrySearchStringIteratorV3;->current:I

    goto :goto_0

    .line 78
    :pswitch_0
    iget-object v1, p0, Lcom/keepassdroid/database/iterator/EntrySearchStringIteratorV3;->sp:Lcom/keepassdroid/database/SearchParameters;

    iget-boolean v0, v1, Lcom/keepassdroid/database/SearchParameters;->searchInTitles:Z

    .line 81
    :pswitch_1
    iget-object v1, p0, Lcom/keepassdroid/database/iterator/EntrySearchStringIteratorV3;->sp:Lcom/keepassdroid/database/SearchParameters;

    iget-boolean v0, v1, Lcom/keepassdroid/database/SearchParameters;->searchInUrls:Z

    .line 84
    :pswitch_2
    iget-object v1, p0, Lcom/keepassdroid/database/iterator/EntrySearchStringIteratorV3;->sp:Lcom/keepassdroid/database/SearchParameters;

    iget-boolean v0, v1, Lcom/keepassdroid/database/SearchParameters;->searchInUserNames:Z

    .line 87
    :pswitch_3
    iget-object v1, p0, Lcom/keepassdroid/database/iterator/EntrySearchStringIteratorV3;->sp:Lcom/keepassdroid/database/SearchParameters;

    iget-boolean v0, v1, Lcom/keepassdroid/database/SearchParameters;->searchInNotes:Z

    goto :goto_1

    .line 76
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method


# virtual methods
.method public hasNext()Z
    .locals 2

    .prologue
    .line 52
    iget v0, p0, Lcom/keepassdroid/database/iterator/EntrySearchStringIteratorV3;->current:I

    const/4 v1, 0x4

    if-ge v0, v1, :cond_0

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
    .line 27
    invoke-virtual {p0}, Lcom/keepassdroid/database/iterator/EntrySearchStringIteratorV3;->next()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public next()Ljava/lang/String;
    .locals 3

    .prologue
    .line 58
    iget v1, p0, Lcom/keepassdroid/database/iterator/EntrySearchStringIteratorV3;->current:I

    const/4 v2, 0x4

    if-ne v1, v2, :cond_0

    .line 59
    new-instance v1, Ljava/util/NoSuchElementException;

    const-string v2, "Past final string"

    invoke-direct {v1, v2}, Ljava/util/NoSuchElementException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 62
    :cond_0
    invoke-direct {p0}, Lcom/keepassdroid/database/iterator/EntrySearchStringIteratorV3;->useSearchParameters()V

    .line 64
    invoke-direct {p0}, Lcom/keepassdroid/database/iterator/EntrySearchStringIteratorV3;->getCurrentString()Ljava/lang/String;

    move-result-object v0

    .line 65
    .local v0, "str":Ljava/lang/String;
    iget v1, p0, Lcom/keepassdroid/database/iterator/EntrySearchStringIteratorV3;->current:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/keepassdroid/database/iterator/EntrySearchStringIteratorV3;->current:I

    .line 66
    return-object v0
.end method
