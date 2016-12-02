.class public abstract Lcom/keepassdroid/database/iterator/EntrySearchStringIterator;
.super Ljava/lang/Object;
.source "EntrySearchStringIterator.java"

# interfaces
.implements Ljava/util/Iterator;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Iterator",
        "<",
        "Ljava/lang/String;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getInstance(Lcom/keepassdroid/database/PwEntry;)Lcom/keepassdroid/database/iterator/EntrySearchStringIterator;
    .locals 2
    .param p0, "e"    # Lcom/keepassdroid/database/PwEntry;

    .prologue
    .line 33
    instance-of v0, p0, Lcom/keepassdroid/database/PwEntryV3;

    if-eqz v0, :cond_0

    .line 34
    new-instance v0, Lcom/keepassdroid/database/iterator/EntrySearchStringIteratorV3;

    check-cast p0, Lcom/keepassdroid/database/PwEntryV3;

    .end local p0    # "e":Lcom/keepassdroid/database/PwEntry;
    invoke-direct {v0, p0}, Lcom/keepassdroid/database/iterator/EntrySearchStringIteratorV3;-><init>(Lcom/keepassdroid/database/PwEntryV3;)V

    .line 36
    :goto_0
    return-object v0

    .line 35
    .restart local p0    # "e":Lcom/keepassdroid/database/PwEntry;
    :cond_0
    instance-of v0, p0, Lcom/keepassdroid/database/PwEntryV4;

    if-eqz v0, :cond_1

    .line 36
    new-instance v0, Lcom/keepassdroid/database/iterator/EntrySearchStringIteratorV4;

    check-cast p0, Lcom/keepassdroid/database/PwEntryV4;

    .end local p0    # "e":Lcom/keepassdroid/database/PwEntry;
    invoke-direct {v0, p0}, Lcom/keepassdroid/database/iterator/EntrySearchStringIteratorV4;-><init>(Lcom/keepassdroid/database/PwEntryV4;)V

    goto :goto_0

    .line 38
    .restart local p0    # "e":Lcom/keepassdroid/database/PwEntry;
    :cond_1
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "This should not be possible"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static getInstance(Lcom/keepassdroid/database/PwEntry;Lcom/keepassdroid/database/SearchParameters;)Lcom/keepassdroid/database/iterator/EntrySearchStringIterator;
    .locals 2
    .param p0, "e"    # Lcom/keepassdroid/database/PwEntry;
    .param p1, "sp"    # Lcom/keepassdroid/database/SearchParameters;

    .prologue
    .line 43
    instance-of v0, p0, Lcom/keepassdroid/database/PwEntryV3;

    if-eqz v0, :cond_0

    .line 44
    new-instance v0, Lcom/keepassdroid/database/iterator/EntrySearchStringIteratorV3;

    check-cast p0, Lcom/keepassdroid/database/PwEntryV3;

    .end local p0    # "e":Lcom/keepassdroid/database/PwEntry;
    invoke-direct {v0, p0, p1}, Lcom/keepassdroid/database/iterator/EntrySearchStringIteratorV3;-><init>(Lcom/keepassdroid/database/PwEntryV3;Lcom/keepassdroid/database/SearchParameters;)V

    .line 46
    .end local p1    # "sp":Lcom/keepassdroid/database/SearchParameters;
    :goto_0
    return-object v0

    .line 45
    .restart local p0    # "e":Lcom/keepassdroid/database/PwEntry;
    .restart local p1    # "sp":Lcom/keepassdroid/database/SearchParameters;
    :cond_0
    instance-of v0, p0, Lcom/keepassdroid/database/PwEntryV4;

    if-eqz v0, :cond_1

    .line 46
    new-instance v0, Lcom/keepassdroid/database/iterator/EntrySearchStringIteratorV4;

    check-cast p0, Lcom/keepassdroid/database/PwEntryV4;

    .end local p0    # "e":Lcom/keepassdroid/database/PwEntry;
    check-cast p1, Lcom/keepassdroid/database/SearchParametersV4;

    .end local p1    # "sp":Lcom/keepassdroid/database/SearchParameters;
    invoke-direct {v0, p0, p1}, Lcom/keepassdroid/database/iterator/EntrySearchStringIteratorV4;-><init>(Lcom/keepassdroid/database/PwEntryV4;Lcom/keepassdroid/database/SearchParametersV4;)V

    goto :goto_0

    .line 48
    .restart local p0    # "e":Lcom/keepassdroid/database/PwEntry;
    .restart local p1    # "sp":Lcom/keepassdroid/database/SearchParameters;
    :cond_1
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "This should not be possible"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method


# virtual methods
.method public abstract hasNext()Z
.end method

.method public bridge synthetic next()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 30
    invoke-virtual {p0}, Lcom/keepassdroid/database/iterator/EntrySearchStringIterator;->next()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public abstract next()Ljava/lang/String;
.end method

.method public remove()V
    .locals 2

    .prologue
    .line 60
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "This iterator cannot be used to remove strings."

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
