.class public Lcom/keepassdroid/search/SearchResults;
.super Lcom/keepassdroid/GroupBaseActivity;
.source "SearchResults.java"


# instance fields
.field private mDb:Lcom/keepassdroid/Database;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 34
    invoke-direct {p0}, Lcom/keepassdroid/GroupBaseActivity;-><init>()V

    return-void
.end method

.method private getSearchStr(Landroid/content/Intent;)Ljava/lang/String;
    .locals 2
    .param p1, "queryIntent"    # Landroid/content/Intent;

    .prologue
    .line 92
    invoke-virtual {p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    .line 93
    .local v0, "queryAction":Ljava/lang/String;
    const-string v1, "android.intent.action.SEARCH"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 94
    const-string v1, "query"

    invoke-virtual {p1, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 97
    :goto_0
    return-object v1

    :cond_0
    const-string v1, ""

    goto :goto_0
.end method

.method private performSearch(Ljava/lang/String;)V
    .locals 1
    .param p1, "query"    # Ljava/lang/String;

    .prologue
    .line 61
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/keepassdroid/search/SearchResults;->query(Ljava/lang/String;)V

    .line 62
    return-void
.end method

.method private query(Ljava/lang/String;)V
    .locals 2
    .param p1, "query"    # Ljava/lang/String;

    .prologue
    .line 65
    iget-object v0, p0, Lcom/keepassdroid/search/SearchResults;->mDb:Lcom/keepassdroid/Database;

    invoke-virtual {v0, p1}, Lcom/keepassdroid/Database;->Search(Ljava/lang/String;)Lcom/keepassdroid/database/PwGroup;

    move-result-object v0

    iput-object v0, p0, Lcom/keepassdroid/search/SearchResults;->mGroup:Lcom/keepassdroid/database/PwGroup;

    .line 67
    iget-object v0, p0, Lcom/keepassdroid/search/SearchResults;->mGroup:Lcom/keepassdroid/database/PwGroup;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/keepassdroid/search/SearchResults;->mGroup:Lcom/keepassdroid/database/PwGroup;

    iget-object v0, v0, Lcom/keepassdroid/database/PwGroup;->childEntries:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    const/4 v1, 0x1

    if-ge v0, v1, :cond_1

    .line 68
    :cond_0
    new-instance v0, Lcom/keepassdroid/view/GroupEmptyView;

    invoke-direct {v0, p0}, Lcom/keepassdroid/view/GroupEmptyView;-><init>(Landroid/content/Context;)V

    invoke-virtual {p0, v0}, Lcom/keepassdroid/search/SearchResults;->setContentView(Landroid/view/View;)V

    .line 73
    :goto_0
    invoke-virtual {p0}, Lcom/keepassdroid/search/SearchResults;->setGroupTitle()V

    .line 75
    new-instance v0, Lcom/keepassdroid/PwGroupListAdapter;

    iget-object v1, p0, Lcom/keepassdroid/search/SearchResults;->mGroup:Lcom/keepassdroid/database/PwGroup;

    invoke-direct {v0, p0, v1}, Lcom/keepassdroid/PwGroupListAdapter;-><init>(Lcom/keepassdroid/GroupBaseActivity;Lcom/keepassdroid/database/PwGroup;)V

    invoke-virtual {p0, v0}, Lcom/keepassdroid/search/SearchResults;->setListAdapter(Landroid/widget/ListAdapter;)V

    .line 76
    return-void

    .line 70
    :cond_1
    new-instance v0, Lcom/keepassdroid/view/GroupViewOnlyView;

    invoke-direct {v0, p0}, Lcom/keepassdroid/view/GroupViewOnlyView;-><init>(Landroid/content/Context;)V

    invoke-virtual {p0, v0}, Lcom/keepassdroid/search/SearchResults;->setContentView(Landroid/view/View;)V

    goto :goto_0
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 1
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 41
    invoke-super {p0, p1}, Lcom/keepassdroid/GroupBaseActivity;->onCreate(Landroid/os/Bundle;)V

    .line 43
    invoke-virtual {p0}, Lcom/keepassdroid/search/SearchResults;->isFinishing()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 58
    :goto_0
    return-void

    .line 47
    :cond_0
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/keepassdroid/search/SearchResults;->setResult(I)V

    .line 49
    invoke-static {}, Lcom/keepassdroid/app/App;->getDB()Lcom/keepassdroid/Database;

    move-result-object v0

    iput-object v0, p0, Lcom/keepassdroid/search/SearchResults;->mDb:Lcom/keepassdroid/Database;

    .line 52
    iget-object v0, p0, Lcom/keepassdroid/search/SearchResults;->mDb:Lcom/keepassdroid/Database;

    invoke-virtual {v0}, Lcom/keepassdroid/Database;->Loaded()Z

    move-result v0

    if-nez v0, :cond_1

    .line 53
    invoke-virtual {p0}, Lcom/keepassdroid/search/SearchResults;->finish()V

    .line 56
    :cond_1
    invoke-virtual {p0}, Lcom/keepassdroid/search/SearchResults;->getIntent()Landroid/content/Intent;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/keepassdroid/search/SearchResults;->getSearchStr(Landroid/content/Intent;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/keepassdroid/search/SearchResults;->performSearch(Ljava/lang/String;)V

    goto :goto_0
.end method
