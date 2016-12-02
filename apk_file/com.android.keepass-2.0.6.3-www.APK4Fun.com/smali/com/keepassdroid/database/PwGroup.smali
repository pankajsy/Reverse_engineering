.class public abstract Lcom/keepassdroid/database/PwGroup;
.super Ljava/lang/Object;
.source "PwGroup.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/keepassdroid/database/PwGroup$GroupNameComparator;
    }
.end annotation


# instance fields
.field public childEntries:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/keepassdroid/database/PwEntry;",
            ">;"
        }
    .end annotation
.end field

.field public childGroups:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/keepassdroid/database/PwGroup;",
            ">;"
        }
    .end annotation
.end field

.field public icon:Lcom/keepassdroid/database/PwIconStandard;

.field public name:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 31
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/keepassdroid/database/PwGroup;->childGroups:Ljava/util/List;

    .line 32
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/keepassdroid/database/PwGroup;->childEntries:Ljava/util/List;

    .line 33
    const-string v0, ""

    iput-object v0, p0, Lcom/keepassdroid/database/PwGroup;->name:Ljava/lang/String;

    return-void
.end method

.method private searchEntriesSingle(Lcom/keepassdroid/database/SearchParameters;Ljava/util/List;)Z
    .locals 3
    .param p1, "spIn"    # Lcom/keepassdroid/database/SearchParameters;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/keepassdroid/database/SearchParameters;",
            "Ljava/util/List",
            "<",
            "Lcom/keepassdroid/database/PwEntry;",
            ">;)Z"
        }
    .end annotation

    .prologue
    .line 166
    .local p2, "listStorage":Ljava/util/List;, "Ljava/util/List<Lcom/keepassdroid/database/PwEntry;>;"
    invoke-virtual {p1}, Lcom/keepassdroid/database/SearchParameters;->clone()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/keepassdroid/database/SearchParameters;

    .line 169
    .local v1, "sp":Lcom/keepassdroid/database/SearchParameters;
    iget-object v2, v1, Lcom/keepassdroid/database/SearchParameters;->searchString:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    if-gtz v2, :cond_0

    .line 170
    new-instance v0, Lcom/keepassdroid/database/EntrySearchHandlerAll;

    invoke-direct {v0, v1, p2}, Lcom/keepassdroid/database/EntrySearchHandlerAll;-><init>(Lcom/keepassdroid/database/SearchParameters;Ljava/util/List;)V

    .line 175
    .local v0, "eh":Lcom/keepassdroid/database/EntryHandler;, "Lcom/keepassdroid/database/EntryHandler<Lcom/keepassdroid/database/PwEntry;>;"
    :goto_0
    const/4 v2, 0x0

    invoke-virtual {p0, v2, v0}, Lcom/keepassdroid/database/PwGroup;->preOrderTraverseTree(Lcom/keepassdroid/database/GroupHandler;Lcom/keepassdroid/database/EntryHandler;)Z

    move-result v2

    if-nez v2, :cond_1

    const/4 v2, 0x0

    .line 177
    :goto_1
    return v2

    .line 172
    .end local v0    # "eh":Lcom/keepassdroid/database/EntryHandler;, "Lcom/keepassdroid/database/EntryHandler<Lcom/keepassdroid/database/PwEntry;>;"
    :cond_0
    invoke-static {p0, v1, p2}, Lcom/keepassdroid/database/EntrySearchHandler;->getInstance(Lcom/keepassdroid/database/PwGroup;Lcom/keepassdroid/database/SearchParameters;Ljava/util/List;)Lcom/keepassdroid/database/EntrySearchHandler;

    move-result-object v0

    .restart local v0    # "eh":Lcom/keepassdroid/database/EntryHandler;, "Lcom/keepassdroid/database/EntryHandler<Lcom/keepassdroid/database/PwEntry;>;"
    goto :goto_0

    .line 177
    :cond_1
    const/4 v2, 0x1

    goto :goto_1
.end method


# virtual methods
.method public getIcon()Lcom/keepassdroid/database/PwIcon;
    .locals 1

    .prologue
    .line 47
    iget-object v0, p0, Lcom/keepassdroid/database/PwGroup;->icon:Lcom/keepassdroid/database/PwIconStandard;

    return-object v0
.end method

.method public abstract getId()Lcom/keepassdroid/database/PwGroupId;
.end method

.method public abstract getLastMod()Ljava/util/Date;
.end method

.method public abstract getName()Ljava/lang/String;
.end method

.method public abstract getParent()Lcom/keepassdroid/database/PwGroup;
.end method

.method public initNewGroup(Ljava/lang/String;Lcom/keepassdroid/database/PwGroupId;)V
    .locals 0
    .param p1, "nm"    # Ljava/lang/String;
    .param p2, "newId"    # Lcom/keepassdroid/database/PwGroupId;

    .prologue
    .line 71
    invoke-virtual {p0, p2}, Lcom/keepassdroid/database/PwGroup;->setId(Lcom/keepassdroid/database/PwGroupId;)V

    .line 72
    iput-object p1, p0, Lcom/keepassdroid/database/PwGroup;->name:Ljava/lang/String;

    .line 73
    return-void
.end method

.method public isContainedIn(Lcom/keepassdroid/database/PwGroup;)Z
    .locals 2
    .param p1, "container"    # Lcom/keepassdroid/database/PwGroup;

    .prologue
    .line 76
    move-object v0, p0

    .line 77
    .local v0, "cur":Lcom/keepassdroid/database/PwGroup;
    :goto_0
    if-eqz v0, :cond_1

    .line 78
    if-ne v0, p1, :cond_0

    .line 79
    const/4 v1, 0x1

    .line 85
    :goto_1
    return v1

    .line 82
    :cond_0
    invoke-virtual {v0}, Lcom/keepassdroid/database/PwGroup;->getParent()Lcom/keepassdroid/database/PwGroup;

    move-result-object v0

    goto :goto_0

    .line 85
    :cond_1
    const/4 v1, 0x0

    goto :goto_1
.end method

.method public preOrderTraverseTree(Lcom/keepassdroid/database/GroupHandler;Lcom/keepassdroid/database/EntryHandler;)Z
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/keepassdroid/database/GroupHandler",
            "<",
            "Lcom/keepassdroid/database/PwGroup;",
            ">;",
            "Lcom/keepassdroid/database/EntryHandler",
            "<",
            "Lcom/keepassdroid/database/PwEntry;",
            ">;)Z"
        }
    .end annotation

    .prologue
    .local p1, "groupHandler":Lcom/keepassdroid/database/GroupHandler;, "Lcom/keepassdroid/database/GroupHandler<Lcom/keepassdroid/database/PwGroup;>;"
    .local p2, "entryHandler":Lcom/keepassdroid/database/EntryHandler;, "Lcom/keepassdroid/database/EntryHandler<Lcom/keepassdroid/database/PwEntry;>;"
    const/4 v2, 0x0

    .line 181
    if-eqz p2, :cond_2

    .line 182
    iget-object v3, p0, Lcom/keepassdroid/database/PwGroup;->childEntries:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_2

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/keepassdroid/database/PwEntry;

    .line 183
    .local v0, "entry":Lcom/keepassdroid/database/PwEntry;
    invoke-virtual {p2, v0}, Lcom/keepassdroid/database/EntryHandler;->operate(Lcom/keepassdroid/database/PwEntry;)Z

    move-result v4

    if-nez v4, :cond_0

    .line 196
    .end local v0    # "entry":Lcom/keepassdroid/database/PwEntry;
    :cond_1
    :goto_0
    return v2

    .line 188
    :cond_2
    iget-object v3, p0, Lcom/keepassdroid/database/PwGroup;->childGroups:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_4

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/keepassdroid/database/PwGroup;

    .line 190
    .local v1, "group":Lcom/keepassdroid/database/PwGroup;
    if-eqz p1, :cond_3

    invoke-virtual {p1, v1}, Lcom/keepassdroid/database/GroupHandler;->operate(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 192
    :cond_3
    invoke-virtual {v1, p1, p2}, Lcom/keepassdroid/database/PwGroup;->preOrderTraverseTree(Lcom/keepassdroid/database/GroupHandler;Lcom/keepassdroid/database/EntryHandler;)Z

    goto :goto_1

    .line 196
    .end local v1    # "group":Lcom/keepassdroid/database/PwGroup;
    :cond_4
    const/4 v2, 0x1

    goto :goto_0
.end method

.method public searchEntries(Lcom/keepassdroid/database/SearchParameters;Ljava/util/List;)V
    .locals 12
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
    .local p2, "listStorage":Ljava/util/List;, "Ljava/util/List<Lcom/keepassdroid/database/PwEntry;>;"
    const/4 v10, 0x1

    .line 105
    if-nez p1, :cond_1

    .line 163
    :cond_0
    :goto_0
    return-void

    .line 106
    :cond_1
    if-eqz p2, :cond_0

    .line 108
    iget-object v9, p1, Lcom/keepassdroid/database/SearchParameters;->searchString:Ljava/lang/String;

    invoke-static {v9}, Lcom/keepassdroid/utils/StrUtil;->splitSearchTerms(Ljava/lang/String;)Ljava/util/List;

    move-result-object v8

    .line 109
    .local v8, "terms":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-interface {v8}, Ljava/util/List;->size()I

    move-result v9

    if-le v9, v10, :cond_2

    iget-boolean v9, p1, Lcom/keepassdroid/database/SearchParameters;->regularExpression:Z

    if-eqz v9, :cond_3

    .line 110
    :cond_2
    invoke-direct {p0, p1, p2}, Lcom/keepassdroid/database/PwGroup;->searchEntriesSingle(Lcom/keepassdroid/database/SearchParameters;Ljava/util/List;)Z

    goto :goto_0

    .line 115
    :cond_3
    new-instance v7, Lcom/keepassdroid/database/PwGroup$1;

    invoke-direct {v7, p0}, Lcom/keepassdroid/database/PwGroup$1;-><init>(Lcom/keepassdroid/database/PwGroup;)V

    .line 123
    .local v7, "stringLengthComparator":Ljava/util/Comparator;, "Ljava/util/Comparator<Ljava/lang/String;>;"
    invoke-static {v8, v7}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 125
    iget-object v2, p1, Lcom/keepassdroid/database/SearchParameters;->searchString:Ljava/lang/String;

    .line 126
    .local v2, "fullSearch":Ljava/lang/String;
    iget-object v5, p0, Lcom/keepassdroid/database/PwGroup;->childEntries:Ljava/util/List;

    .line 127
    .local v5, "pg":Ljava/util/List;, "Ljava/util/List<Lcom/keepassdroid/database/PwEntry;>;"
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_1
    invoke-interface {v8}, Ljava/util/List;->size()I

    move-result v9

    if-ge v3, v9, :cond_5

    .line 128
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 130
    .local v6, "pgNew":Ljava/util/List;, "Ljava/util/List<Lcom/keepassdroid/database/PwEntry;>;"
    invoke-interface {v8, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/String;

    iput-object v9, p1, Lcom/keepassdroid/database/SearchParameters;->searchString:Ljava/lang/String;

    .line 132
    const/4 v4, 0x0

    .line 133
    .local v4, "negate":Z
    iget-object v9, p1, Lcom/keepassdroid/database/SearchParameters;->searchString:Ljava/lang/String;

    const-string v11, "-"

    invoke-virtual {v9, v11}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_4

    .line 134
    iget-object v9, p1, Lcom/keepassdroid/database/SearchParameters;->searchString:Ljava/lang/String;

    invoke-virtual {v9, v10}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    .line 135
    iget-object v9, p1, Lcom/keepassdroid/database/SearchParameters;->searchString:Ljava/lang/String;

    invoke-virtual {v9}, Ljava/lang/String;->length()I

    move-result v9

    if-lez v9, :cond_7

    move v4, v10

    .line 138
    :cond_4
    :goto_2
    invoke-direct {p0, p1, v6}, Lcom/keepassdroid/database/PwGroup;->searchEntriesSingle(Lcom/keepassdroid/database/SearchParameters;Ljava/util/List;)Z

    move-result v9

    if-nez v9, :cond_8

    .line 139
    const/4 v5, 0x0

    .line 158
    .end local v4    # "negate":Z
    .end local v6    # "pgNew":Ljava/util/List;, "Ljava/util/List<Lcom/keepassdroid/database/PwEntry;>;"
    :cond_5
    if-eqz v5, :cond_6

    .line 159
    invoke-interface {p2, v5}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 161
    :cond_6
    iput-object v2, p1, Lcom/keepassdroid/database/SearchParameters;->searchString:Ljava/lang/String;

    goto :goto_0

    .line 135
    .restart local v4    # "negate":Z
    .restart local v6    # "pgNew":Ljava/util/List;, "Ljava/util/List<Lcom/keepassdroid/database/PwEntry;>;"
    :cond_7
    const/4 v4, 0x0

    goto :goto_2

    .line 143
    :cond_8
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 144
    .local v0, "complement":Ljava/util/List;, "Ljava/util/List<Lcom/keepassdroid/database/PwEntry;>;"
    if-eqz v4, :cond_b

    .line 145
    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v9

    :cond_9
    :goto_3
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v11

    if-eqz v11, :cond_a

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/keepassdroid/database/PwEntry;

    .line 146
    .local v1, "entry":Lcom/keepassdroid/database/PwEntry;
    invoke-interface {v6, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v11

    if-nez v11, :cond_9

    .line 147
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_3

    .line 151
    .end local v1    # "entry":Lcom/keepassdroid/database/PwEntry;
    :cond_a
    move-object v5, v0

    .line 127
    :goto_4
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 154
    :cond_b
    move-object v5, v6

    goto :goto_4
.end method

.method public abstract setId(Lcom/keepassdroid/database/PwGroupId;)V
.end method

.method public abstract setLastAccessTime(Ljava/util/Date;)V
.end method

.method public abstract setLastModificationTime(Ljava/util/Date;)V
.end method

.method public abstract setParent(Lcom/keepassdroid/database/PwGroup;)V
.end method

.method public sortEntriesByName()V
    .locals 2

    .prologue
    .line 67
    iget-object v0, p0, Lcom/keepassdroid/database/PwGroup;->childEntries:Ljava/util/List;

    new-instance v1, Lcom/keepassdroid/database/PwEntry$EntryNameComparator;

    invoke-direct {v1}, Lcom/keepassdroid/database/PwEntry$EntryNameComparator;-><init>()V

    invoke-static {v0, v1}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 68
    return-void
.end method

.method public sortGroupsByName()V
    .locals 2

    .prologue
    .line 51
    iget-object v0, p0, Lcom/keepassdroid/database/PwGroup;->childGroups:Ljava/util/List;

    new-instance v1, Lcom/keepassdroid/database/PwGroup$GroupNameComparator;

    invoke-direct {v1}, Lcom/keepassdroid/database/PwGroup$GroupNameComparator;-><init>()V

    invoke-static {v0, v1}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 52
    return-void
.end method

.method public touch(ZZ)V
    .locals 3
    .param p1, "modified"    # Z
    .param p2, "touchParents"    # Z

    .prologue
    .line 89
    new-instance v0, Ljava/util/Date;

    invoke-direct {v0}, Ljava/util/Date;-><init>()V

    .line 91
    .local v0, "now":Ljava/util/Date;
    invoke-virtual {p0, v0}, Lcom/keepassdroid/database/PwGroup;->setLastAccessTime(Ljava/util/Date;)V

    .line 93
    if-eqz p1, :cond_0

    .line 94
    invoke-virtual {p0, v0}, Lcom/keepassdroid/database/PwGroup;->setLastModificationTime(Ljava/util/Date;)V

    .line 97
    :cond_0
    invoke-virtual {p0}, Lcom/keepassdroid/database/PwGroup;->getParent()Lcom/keepassdroid/database/PwGroup;

    move-result-object v1

    .line 98
    .local v1, "parent":Lcom/keepassdroid/database/PwGroup;
    if-eqz p2, :cond_1

    if-eqz v1, :cond_1

    .line 99
    const/4 v2, 0x1

    invoke-virtual {v1, p1, v2}, Lcom/keepassdroid/database/PwGroup;->touch(ZZ)V

    .line 101
    :cond_1
    return-void
.end method
