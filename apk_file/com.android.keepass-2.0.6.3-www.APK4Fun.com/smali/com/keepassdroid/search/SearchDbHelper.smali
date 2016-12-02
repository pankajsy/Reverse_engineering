.class public Lcom/keepassdroid/search/SearchDbHelper;
.super Ljava/lang/Object;
.source "SearchDbHelper.java"


# instance fields
.field private final mCtx:Landroid/content/Context;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1, "ctx"    # Landroid/content/Context;

    .prologue
    .line 47
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 48
    iput-object p1, p0, Lcom/keepassdroid/search/SearchDbHelper;->mCtx:Landroid/content/Context;

    .line 49
    return-void
.end method

.method private omitBackup()Z
    .locals 4

    .prologue
    .line 52
    iget-object v1, p0, Lcom/keepassdroid/search/SearchDbHelper;->mCtx:Landroid/content/Context;

    invoke-static {v1}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 53
    .local v0, "prefs":Landroid/content/SharedPreferences;
    iget-object v1, p0, Lcom/keepassdroid/search/SearchDbHelper;->mCtx:Landroid/content/Context;

    const v2, 0x7f0600c4

    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/keepassdroid/search/SearchDbHelper;->mCtx:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f080002

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v2

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    return v1
.end method


# virtual methods
.method public processEntries(Lcom/keepassdroid/database/PwEntry;Ljava/util/List;Ljava/lang/String;Ljava/util/Locale;)V
    .locals 4
    .param p1, "entry"    # Lcom/keepassdroid/database/PwEntry;
    .param p3, "qStr"    # Ljava/lang/String;
    .param p4, "loc"    # Ljava/util/Locale;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/keepassdroid/database/PwEntry;",
            "Ljava/util/List",
            "<",
            "Lcom/keepassdroid/database/PwEntry;",
            ">;",
            "Ljava/lang/String;",
            "Ljava/util/Locale;",
            ")V"
        }
    .end annotation

    .prologue
    .line 103
    .local p2, "results":Ljava/util/List;, "Ljava/util/List<Lcom/keepassdroid/database/PwEntry;>;"
    invoke-virtual {p1}, Lcom/keepassdroid/database/PwEntry;->stringIterator()Lcom/keepassdroid/database/iterator/EntrySearchStringIterator;

    move-result-object v0

    .line 104
    .local v0, "iter":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 105
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 106
    .local v2, "str":Ljava/lang/String;
    if-eqz v2, :cond_0

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v3

    if-eqz v3, :cond_0

    .line 107
    invoke-virtual {v2, p4}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v1

    .line 108
    .local v1, "lower":Ljava/lang/String;
    invoke-virtual {v1, p3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 109
    invoke-interface {p2, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 114
    .end local v1    # "lower":Ljava/lang/String;
    .end local v2    # "str":Ljava/lang/String;
    :cond_1
    return-void
.end method

.method public search(Lcom/keepassdroid/Database;Ljava/lang/String;)Lcom/keepassdroid/database/PwGroup;
    .locals 10
    .param p1, "db"    # Lcom/keepassdroid/Database;
    .param p2, "qStr"    # Ljava/lang/String;

    .prologue
    .line 58
    iget-object v5, p1, Lcom/keepassdroid/Database;->pm:Lcom/keepassdroid/database/PwDatabase;

    .line 61
    .local v5, "pm":Lcom/keepassdroid/database/PwDatabase;
    instance-of v8, v5, Lcom/keepassdroid/database/PwDatabaseV3;

    if-eqz v8, :cond_1

    .line 62
    new-instance v2, Lcom/keepassdroid/database/PwGroupV3;

    invoke-direct {v2}, Lcom/keepassdroid/database/PwGroupV3;-><init>()V

    .line 69
    .local v2, "group":Lcom/keepassdroid/database/PwGroup;
    :goto_0
    iget-object v8, p0, Lcom/keepassdroid/search/SearchDbHelper;->mCtx:Landroid/content/Context;

    const v9, 0x7f060089

    invoke-virtual {v8, v9}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v8

    iput-object v8, v2, Lcom/keepassdroid/database/PwGroup;->name:Ljava/lang/String;

    .line 70
    new-instance v8, Ljava/util/ArrayList;

    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    iput-object v8, v2, Lcom/keepassdroid/database/PwGroup;->childEntries:Ljava/util/List;

    .line 73
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v4

    .line 74
    .local v4, "loc":Ljava/util/Locale;
    invoke-virtual {p2, v4}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object p2

    .line 75
    invoke-direct {p0}, Lcom/keepassdroid/search/SearchDbHelper;->omitBackup()Z

    move-result v3

    .line 77
    .local v3, "isOmitBackup":Z
    new-instance v7, Ljava/util/LinkedList;

    invoke-direct {v7}, Ljava/util/LinkedList;-><init>()V

    .line 78
    .local v7, "worklist":Ljava/util/Queue;, "Ljava/util/Queue<Lcom/keepassdroid/database/PwGroup;>;"
    iget-object v8, v5, Lcom/keepassdroid/database/PwDatabase;->rootGroup:Lcom/keepassdroid/database/PwGroup;

    if-eqz v8, :cond_0

    .line 79
    iget-object v8, v5, Lcom/keepassdroid/database/PwDatabase;->rootGroup:Lcom/keepassdroid/database/PwGroup;

    invoke-interface {v7, v8}, Ljava/util/Queue;->add(Ljava/lang/Object;)Z

    .line 82
    :cond_0
    invoke-interface {v7}, Ljava/util/Queue;->size()I

    move-result v8

    if-eqz v8, :cond_3

    .line 83
    invoke-interface {v7}, Ljava/util/Queue;->remove()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/keepassdroid/database/PwGroup;

    .line 85
    .local v6, "top":Lcom/keepassdroid/database/PwGroup;
    invoke-virtual {v5, v6, v3}, Lcom/keepassdroid/database/PwDatabase;->isGroupSearchable(Lcom/keepassdroid/database/PwGroup;Z)Z

    move-result v8

    if-eqz v8, :cond_0

    .line 86
    iget-object v8, v6, Lcom/keepassdroid/database/PwGroup;->childEntries:Ljava/util/List;

    invoke-interface {v8}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v8

    :goto_1
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_4

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/keepassdroid/database/PwEntry;

    .line 87
    .local v1, "entry":Lcom/keepassdroid/database/PwEntry;
    iget-object v9, v2, Lcom/keepassdroid/database/PwGroup;->childEntries:Ljava/util/List;

    invoke-virtual {p0, v1, v9, p2, v4}, Lcom/keepassdroid/search/SearchDbHelper;->processEntries(Lcom/keepassdroid/database/PwEntry;Ljava/util/List;Ljava/lang/String;Ljava/util/Locale;)V

    goto :goto_1

    .line 63
    .end local v1    # "entry":Lcom/keepassdroid/database/PwEntry;
    .end local v2    # "group":Lcom/keepassdroid/database/PwGroup;
    .end local v3    # "isOmitBackup":Z
    .end local v4    # "loc":Ljava/util/Locale;
    .end local v6    # "top":Lcom/keepassdroid/database/PwGroup;
    .end local v7    # "worklist":Ljava/util/Queue;, "Ljava/util/Queue<Lcom/keepassdroid/database/PwGroup;>;"
    :cond_1
    instance-of v8, v5, Lcom/keepassdroid/database/PwDatabaseV4;

    if-eqz v8, :cond_2

    .line 64
    new-instance v2, Lcom/keepassdroid/database/PwGroupV4;

    invoke-direct {v2}, Lcom/keepassdroid/database/PwGroupV4;-><init>()V

    .restart local v2    # "group":Lcom/keepassdroid/database/PwGroup;
    goto :goto_0

    .line 66
    .end local v2    # "group":Lcom/keepassdroid/database/PwGroup;
    :cond_2
    const-string v8, "SearchDbHelper"

    const-string v9, "Tried to search with unknown db"

    invoke-static {v8, v9}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 67
    const/4 v2, 0x0

    .line 98
    :cond_3
    return-object v2

    .line 90
    .restart local v2    # "group":Lcom/keepassdroid/database/PwGroup;
    .restart local v3    # "isOmitBackup":Z
    .restart local v4    # "loc":Ljava/util/Locale;
    .restart local v6    # "top":Lcom/keepassdroid/database/PwGroup;
    .restart local v7    # "worklist":Ljava/util/Queue;, "Ljava/util/Queue<Lcom/keepassdroid/database/PwGroup;>;"
    :cond_4
    iget-object v8, v6, Lcom/keepassdroid/database/PwGroup;->childGroups:Ljava/util/List;

    invoke-interface {v8}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v8

    :cond_5
    :goto_2
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_0

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/keepassdroid/database/PwGroup;

    .line 91
    .local v0, "childGroup":Lcom/keepassdroid/database/PwGroup;
    if-eqz v0, :cond_5

    .line 92
    invoke-interface {v7, v0}, Ljava/util/Queue;->add(Ljava/lang/Object;)Z

    goto :goto_2
.end method
