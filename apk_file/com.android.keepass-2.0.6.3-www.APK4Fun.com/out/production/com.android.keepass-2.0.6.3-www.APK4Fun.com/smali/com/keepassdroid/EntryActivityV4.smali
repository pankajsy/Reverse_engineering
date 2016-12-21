.class public Lcom/keepassdroid/EntryActivityV4;
.super Lcom/keepassdroid/EntryActivity;
.source "EntryActivityV4.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 37
    invoke-direct {p0}, Lcom/keepassdroid/EntryActivity;-><init>()V

    return-void
.end method


# virtual methods
.method protected fillData(Z)V
    .locals 11
    .param p1, "trimList"    # Z

    .prologue
    .line 46
    invoke-super {p0, p1}, Lcom/keepassdroid/EntryActivity;->fillData(Z)V

    .line 48
    const v8, 0x7f0b0036

    invoke-virtual {p0, v8}, Lcom/keepassdroid/EntryActivityV4;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/view/ViewGroup;

    .line 50
    .local v1, "group":Landroid/view/ViewGroup;
    if-eqz p1, :cond_0

    .line 51
    invoke-virtual {v1}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 54
    :cond_0
    iget-object v0, p0, Lcom/keepassdroid/EntryActivityV4;->mEntry:Lcom/keepassdroid/database/PwEntry;

    check-cast v0, Lcom/keepassdroid/database/PwEntryV4;

    .line 56
    .local v0, "entry":Lcom/keepassdroid/database/PwEntryV4;
    invoke-static {}, Lcom/keepassdroid/app/App;->getDB()Lcom/keepassdroid/Database;

    move-result-object v8

    iget-object v4, v8, Lcom/keepassdroid/Database;->pm:Lcom/keepassdroid/database/PwDatabase;

    .line 57
    .local v4, "pm":Lcom/keepassdroid/database/PwDatabase;
    invoke-static {v4}, Lcom/keepassdroid/utils/SprEngineV4;->getInstance(Lcom/keepassdroid/database/PwDatabase;)Lcom/keepassdroid/utils/SprEngine;

    move-result-object v5

    .line 60
    .local v5, "spr":Lcom/keepassdroid/utils/SprEngine;
    iget-object v8, v0, Lcom/keepassdroid/database/PwEntryV4;->strings:Ljava/util/HashMap;

    invoke-virtual {v8}, Ljava/util/HashMap;->size()I

    move-result v8

    if-lez v8, :cond_2

    .line 61
    iget-object v8, v0, Lcom/keepassdroid/database/PwEntryV4;->strings:Ljava/util/HashMap;

    invoke-virtual {v8}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object v8

    invoke-interface {v8}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v9

    :cond_1
    :goto_0
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_2

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Map$Entry;

    .line 62
    .local v3, "pair":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Lcom/keepassdroid/database/security/ProtectedString;>;"
    invoke-interface {v3}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 64
    .local v2, "key":Ljava/lang/String;
    invoke-static {v2}, Lcom/keepassdroid/database/PwEntryV4;->IsStandardString(Ljava/lang/String;)Z

    move-result v8

    if-nez v8, :cond_1

    .line 65
    invoke-interface {v3}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/keepassdroid/database/security/ProtectedString;

    invoke-virtual {v8}, Lcom/keepassdroid/database/security/ProtectedString;->toString()Ljava/lang/String;

    move-result-object v6

    .line 66
    .local v6, "text":Ljava/lang/String;
    new-instance v7, Lcom/keepassdroid/view/EntrySection;

    const/4 v8, 0x0

    invoke-virtual {v5, v6, v0, v4}, Lcom/keepassdroid/utils/SprEngine;->compile(Ljava/lang/String;Lcom/keepassdroid/database/PwEntry;Lcom/keepassdroid/database/PwDatabase;)Ljava/lang/String;

    move-result-object v10

    invoke-direct {v7, p0, v8, v2, v10}, Lcom/keepassdroid/view/EntrySection;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;Ljava/lang/String;Ljava/lang/String;)V

    .line 67
    .local v7, "view":Landroid/view/View;
    invoke-virtual {v1, v7}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    goto :goto_0

    .line 72
    .end local v2    # "key":Ljava/lang/String;
    .end local v3    # "pair":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Lcom/keepassdroid/database/security/ProtectedString;>;"
    .end local v6    # "text":Ljava/lang/String;
    .end local v7    # "view":Landroid/view/View;
    :cond_2
    return-void
.end method

.method protected setEntryView()V
    .locals 1

    .prologue
    .line 41
    const v0, 0x7f030009

    invoke-virtual {p0, v0}, Lcom/keepassdroid/EntryActivityV4;->setContentView(I)V

    .line 42
    return-void
.end method
