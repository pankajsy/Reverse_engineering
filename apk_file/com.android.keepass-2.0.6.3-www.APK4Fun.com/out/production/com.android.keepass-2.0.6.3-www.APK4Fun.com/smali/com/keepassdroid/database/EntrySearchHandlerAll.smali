.class public Lcom/keepassdroid/database/EntrySearchHandlerAll;
.super Lcom/keepassdroid/database/EntryHandler;
.source "EntrySearchHandlerAll.java"


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
.method public constructor <init>(Lcom/keepassdroid/database/SearchParameters;Ljava/util/List;)V
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
    .line 30
    .local p2, "listStorage":Ljava/util/List;, "Ljava/util/List<Lcom/keepassdroid/database/PwEntry;>;"
    invoke-direct {p0}, Lcom/keepassdroid/database/EntryHandler;-><init>()V

    .line 31
    iput-object p1, p0, Lcom/keepassdroid/database/EntrySearchHandlerAll;->sp:Lcom/keepassdroid/database/SearchParameters;

    .line 32
    iput-object p2, p0, Lcom/keepassdroid/database/EntrySearchHandlerAll;->listStorage:Ljava/util/List;

    .line 33
    new-instance v0, Ljava/util/Date;

    invoke-direct {v0}, Ljava/util/Date;-><init>()V

    iput-object v0, p0, Lcom/keepassdroid/database/EntrySearchHandlerAll;->now:Ljava/util/Date;

    .line 34
    return-void
.end method


# virtual methods
.method public operate(Lcom/keepassdroid/database/PwEntry;)Z
    .locals 3
    .param p1, "entry"    # Lcom/keepassdroid/database/PwEntry;

    .prologue
    const/4 v2, 0x1

    .line 38
    iget-object v0, p0, Lcom/keepassdroid/database/EntrySearchHandlerAll;->sp:Lcom/keepassdroid/database/SearchParameters;

    iget-boolean v0, v0, Lcom/keepassdroid/database/SearchParameters;->respectEntrySearchingDisabled:Z

    if-eqz v0, :cond_1

    invoke-virtual {p1}, Lcom/keepassdroid/database/PwEntry;->isSearchingEnabled()Z

    move-result v0

    if-nez v0, :cond_1

    .line 47
    :cond_0
    :goto_0
    return v2

    .line 42
    :cond_1
    iget-object v0, p0, Lcom/keepassdroid/database/EntrySearchHandlerAll;->sp:Lcom/keepassdroid/database/SearchParameters;

    iget-boolean v0, v0, Lcom/keepassdroid/database/SearchParameters;->excludeExpired:Z

    if-eqz v0, :cond_2

    invoke-virtual {p1}, Lcom/keepassdroid/database/PwEntry;->expires()Z

    move-result v0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/keepassdroid/database/EntrySearchHandlerAll;->now:Ljava/util/Date;

    invoke-virtual {p1}, Lcom/keepassdroid/database/PwEntry;->getExpiryTime()Ljava/util/Date;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/Date;->after(Ljava/util/Date;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 46
    :cond_2
    iget-object v0, p0, Lcom/keepassdroid/database/EntrySearchHandlerAll;->listStorage:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0
.end method
