.class public Lcom/keepassdroid/PwGroupListAdapter;
.super Landroid/widget/BaseAdapter;
.source "PwGroupListAdapter.java"


# instance fields
.field private entriesForViewing:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/keepassdroid/database/PwEntry;",
            ">;"
        }
    .end annotation
.end field

.field private entryComp:Ljava/util/Comparator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Comparator",
            "<",
            "Lcom/keepassdroid/database/PwEntry;",
            ">;"
        }
    .end annotation
.end field

.field private groupComp:Ljava/util/Comparator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Comparator",
            "<",
            "Lcom/keepassdroid/database/PwGroup;",
            ">;"
        }
    .end annotation
.end field

.field private groupsForViewing:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/keepassdroid/database/PwGroup;",
            ">;"
        }
    .end annotation
.end field

.field private mAct:Lcom/keepassdroid/GroupBaseActivity;

.field private mGroup:Lcom/keepassdroid/database/PwGroup;

.field private prefs:Landroid/content/SharedPreferences;


# direct methods
.method public constructor <init>(Lcom/keepassdroid/GroupBaseActivity;Lcom/keepassdroid/database/PwGroup;)V
    .locals 1
    .param p1, "act"    # Lcom/keepassdroid/GroupBaseActivity;
    .param p2, "group"    # Lcom/keepassdroid/database/PwGroup;

    .prologue
    .line 49
    invoke-direct {p0}, Landroid/widget/BaseAdapter;-><init>()V

    .line 45
    new-instance v0, Lcom/keepassdroid/database/PwEntry$EntryNameComparator;

    invoke-direct {v0}, Lcom/keepassdroid/database/PwEntry$EntryNameComparator;-><init>()V

    iput-object v0, p0, Lcom/keepassdroid/PwGroupListAdapter;->entryComp:Ljava/util/Comparator;

    .line 46
    new-instance v0, Lcom/keepassdroid/database/PwGroup$GroupNameComparator;

    invoke-direct {v0}, Lcom/keepassdroid/database/PwGroup$GroupNameComparator;-><init>()V

    iput-object v0, p0, Lcom/keepassdroid/PwGroupListAdapter;->groupComp:Ljava/util/Comparator;

    .line 50
    iput-object p1, p0, Lcom/keepassdroid/PwGroupListAdapter;->mAct:Lcom/keepassdroid/GroupBaseActivity;

    .line 51
    iput-object p2, p0, Lcom/keepassdroid/PwGroupListAdapter;->mGroup:Lcom/keepassdroid/database/PwGroup;

    .line 52
    invoke-static {p1}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    iput-object v0, p0, Lcom/keepassdroid/PwGroupListAdapter;->prefs:Landroid/content/SharedPreferences;

    .line 54
    invoke-direct {p0}, Lcom/keepassdroid/PwGroupListAdapter;->filterAndSort()V

    .line 56
    return-void
.end method

.method private createEntryView(ILandroid/view/View;)Lcom/keepassdroid/view/PwEntryView;
    .locals 3
    .param p1, "position"    # I
    .param p2, "convertView"    # Landroid/view/View;

    .prologue
    .line 134
    iget-object v2, p0, Lcom/keepassdroid/PwGroupListAdapter;->entriesForViewing:Ljava/util/List;

    invoke-interface {v2, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/keepassdroid/database/PwEntry;

    .line 137
    .local v0, "entry":Lcom/keepassdroid/database/PwEntry;
    if-eqz p2, :cond_0

    instance-of v2, p2, Lcom/keepassdroid/view/PwEntryView;

    if-nez v2, :cond_1

    .line 138
    :cond_0
    iget-object v2, p0, Lcom/keepassdroid/PwGroupListAdapter;->mAct:Lcom/keepassdroid/GroupBaseActivity;

    invoke-static {v2, v0, p1}, Lcom/keepassdroid/view/PwEntryView;->getInstance(Lcom/keepassdroid/GroupBaseActivity;Lcom/keepassdroid/database/PwEntry;I)Lcom/keepassdroid/view/PwEntryView;

    move-result-object v1

    .line 145
    .local v1, "ev":Lcom/keepassdroid/view/PwEntryView;
    :goto_0
    return-object v1

    .end local v1    # "ev":Lcom/keepassdroid/view/PwEntryView;
    :cond_1
    move-object v1, p2

    .line 141
    check-cast v1, Lcom/keepassdroid/view/PwEntryView;

    .line 142
    .restart local v1    # "ev":Lcom/keepassdroid/view/PwEntryView;
    invoke-virtual {v1, v0, p1}, Lcom/keepassdroid/view/PwEntryView;->convertView(Lcom/keepassdroid/database/PwEntry;I)V

    goto :goto_0
.end method

.method private createGroupView(ILandroid/view/View;)Landroid/view/View;
    .locals 3
    .param p1, "position"    # I
    .param p2, "convertView"    # Landroid/view/View;

    .prologue
    .line 117
    iget-object v2, p0, Lcom/keepassdroid/PwGroupListAdapter;->groupsForViewing:Ljava/util/List;

    invoke-interface {v2, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/keepassdroid/database/PwGroup;

    .line 120
    .local v0, "group":Lcom/keepassdroid/database/PwGroup;
    if-eqz p2, :cond_0

    instance-of v2, p2, Lcom/keepassdroid/view/PwGroupView;

    if-nez v2, :cond_1

    .line 122
    :cond_0
    iget-object v2, p0, Lcom/keepassdroid/PwGroupListAdapter;->mAct:Lcom/keepassdroid/GroupBaseActivity;

    invoke-static {v2, v0}, Lcom/keepassdroid/view/PwGroupView;->getInstance(Lcom/keepassdroid/GroupBaseActivity;Lcom/keepassdroid/database/PwGroup;)Lcom/keepassdroid/view/PwGroupView;

    move-result-object v1

    .line 130
    .local v1, "gv":Lcom/keepassdroid/view/PwGroupView;
    :goto_0
    return-object v1

    .end local v1    # "gv":Lcom/keepassdroid/view/PwGroupView;
    :cond_1
    move-object v1, p2

    .line 125
    check-cast v1, Lcom/keepassdroid/view/PwGroupView;

    .line 126
    .restart local v1    # "gv":Lcom/keepassdroid/view/PwGroupView;
    invoke-virtual {v1, v0}, Lcom/keepassdroid/view/PwGroupView;->convertView(Lcom/keepassdroid/database/PwGroup;)V

    goto :goto_0
.end method

.method private filterAndSort()V
    .locals 7

    .prologue
    .line 73
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    iput-object v3, p0, Lcom/keepassdroid/PwGroupListAdapter;->entriesForViewing:Ljava/util/List;

    .line 75
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    iget-object v3, p0, Lcom/keepassdroid/PwGroupListAdapter;->mGroup:Lcom/keepassdroid/database/PwGroup;

    iget-object v3, v3, Lcom/keepassdroid/database/PwGroup;->childEntries:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    if-ge v1, v3, :cond_1

    .line 76
    iget-object v3, p0, Lcom/keepassdroid/PwGroupListAdapter;->mGroup:Lcom/keepassdroid/database/PwGroup;

    iget-object v3, v3, Lcom/keepassdroid/database/PwGroup;->childEntries:Ljava/util/List;

    invoke-interface {v3, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/keepassdroid/database/PwEntry;

    .line 77
    .local v0, "entry":Lcom/keepassdroid/database/PwEntry;
    invoke-virtual {v0}, Lcom/keepassdroid/database/PwEntry;->isMetaStream()Z

    move-result v3

    if-nez v3, :cond_0

    .line 78
    iget-object v3, p0, Lcom/keepassdroid/PwGroupListAdapter;->entriesForViewing:Ljava/util/List;

    invoke-interface {v3, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 75
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 82
    .end local v0    # "entry":Lcom/keepassdroid/database/PwEntry;
    :cond_1
    iget-object v3, p0, Lcom/keepassdroid/PwGroupListAdapter;->prefs:Landroid/content/SharedPreferences;

    iget-object v4, p0, Lcom/keepassdroid/PwGroupListAdapter;->mAct:Lcom/keepassdroid/GroupBaseActivity;

    const v5, 0x7f0600ca

    invoke-virtual {v4, v5}, Lcom/keepassdroid/GroupBaseActivity;->getString(I)Ljava/lang/String;

    move-result-object v4

    iget-object v5, p0, Lcom/keepassdroid/PwGroupListAdapter;->mAct:Lcom/keepassdroid/GroupBaseActivity;

    invoke-virtual {v5}, Lcom/keepassdroid/GroupBaseActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    const v6, 0x7f080005

    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v5

    invoke-interface {v3, v4, v5}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v2

    .line 83
    .local v2, "sortLists":Z
    if-eqz v2, :cond_2

    .line 84
    new-instance v3, Ljava/util/ArrayList;

    iget-object v4, p0, Lcom/keepassdroid/PwGroupListAdapter;->mGroup:Lcom/keepassdroid/database/PwGroup;

    iget-object v4, v4, Lcom/keepassdroid/database/PwGroup;->childGroups:Ljava/util/List;

    invoke-direct {v3, v4}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    iput-object v3, p0, Lcom/keepassdroid/PwGroupListAdapter;->groupsForViewing:Ljava/util/List;

    .line 86
    iget-object v3, p0, Lcom/keepassdroid/PwGroupListAdapter;->entriesForViewing:Ljava/util/List;

    iget-object v4, p0, Lcom/keepassdroid/PwGroupListAdapter;->entryComp:Ljava/util/Comparator;

    invoke-static {v3, v4}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 87
    iget-object v3, p0, Lcom/keepassdroid/PwGroupListAdapter;->groupsForViewing:Ljava/util/List;

    iget-object v4, p0, Lcom/keepassdroid/PwGroupListAdapter;->groupComp:Ljava/util/Comparator;

    invoke-static {v3, v4}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 91
    :goto_1
    return-void

    .line 89
    :cond_2
    iget-object v3, p0, Lcom/keepassdroid/PwGroupListAdapter;->mGroup:Lcom/keepassdroid/database/PwGroup;

    iget-object v3, v3, Lcom/keepassdroid/database/PwGroup;->childGroups:Ljava/util/List;

    iput-object v3, p0, Lcom/keepassdroid/PwGroupListAdapter;->groupsForViewing:Ljava/util/List;

    goto :goto_1
.end method


# virtual methods
.method public getCount()I
    .locals 2

    .prologue
    .line 95
    iget-object v0, p0, Lcom/keepassdroid/PwGroupListAdapter;->groupsForViewing:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    iget-object v1, p0, Lcom/keepassdroid/PwGroupListAdapter;->entriesForViewing:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    add-int/2addr v0, v1

    return v0
.end method

.method public getItem(I)Ljava/lang/Object;
    .locals 1
    .param p1, "position"    # I

    .prologue
    .line 99
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    return-object v0
.end method

.method public getItemId(I)J
    .locals 2
    .param p1, "position"    # I

    .prologue
    .line 103
    int-to-long v0, p1

    return-wide v0
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 2
    .param p1, "position"    # I
    .param p2, "convertView"    # Landroid/view/View;
    .param p3, "parent"    # Landroid/view/ViewGroup;

    .prologue
    .line 107
    iget-object v1, p0, Lcom/keepassdroid/PwGroupListAdapter;->groupsForViewing:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v0

    .line 109
    .local v0, "size":I
    if-ge p1, v0, :cond_0

    .line 110
    invoke-direct {p0, p1, p2}, Lcom/keepassdroid/PwGroupListAdapter;->createGroupView(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    .line 112
    :goto_0
    return-object v1

    :cond_0
    sub-int v1, p1, v0

    invoke-direct {p0, v1, p2}, Lcom/keepassdroid/PwGroupListAdapter;->createEntryView(ILandroid/view/View;)Lcom/keepassdroid/view/PwEntryView;

    move-result-object v1

    goto :goto_0
.end method

.method public notifyDataSetChanged()V
    .locals 0

    .prologue
    .line 60
    invoke-super {p0}, Landroid/widget/BaseAdapter;->notifyDataSetChanged()V

    .line 62
    invoke-direct {p0}, Lcom/keepassdroid/PwGroupListAdapter;->filterAndSort()V

    .line 63
    return-void
.end method

.method public notifyDataSetInvalidated()V
    .locals 0

    .prologue
    .line 67
    invoke-super {p0}, Landroid/widget/BaseAdapter;->notifyDataSetInvalidated()V

    .line 69
    invoke-direct {p0}, Lcom/keepassdroid/PwGroupListAdapter;->filterAndSort()V

    .line 70
    return-void
.end method
