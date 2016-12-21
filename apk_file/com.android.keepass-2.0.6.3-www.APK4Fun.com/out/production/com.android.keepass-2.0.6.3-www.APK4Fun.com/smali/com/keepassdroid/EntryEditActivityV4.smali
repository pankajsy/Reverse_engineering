.class public Lcom/keepassdroid/EntryEditActivityV4;
.super Lcom/keepassdroid/EntryEditActivity;
.source "EntryEditActivityV4.java"


# instance fields
.field private inflater:Landroid/view/LayoutInflater;

.field private scroll:Landroid/widget/ScrollView;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 53
    invoke-direct {p0}, Lcom/keepassdroid/EntryEditActivity;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/keepassdroid/EntryEditActivityV4;)Landroid/view/LayoutInflater;
    .locals 1
    .param p0, "x0"    # Lcom/keepassdroid/EntryEditActivityV4;

    .prologue
    .line 53
    iget-object v0, p0, Lcom/keepassdroid/EntryEditActivityV4;->inflater:Landroid/view/LayoutInflater;

    return-object v0
.end method

.method static synthetic access$100(Lcom/keepassdroid/EntryEditActivityV4;)Landroid/widget/ScrollView;
    .locals 1
    .param p0, "x0"    # Lcom/keepassdroid/EntryEditActivityV4;

    .prologue
    .line 53
    iget-object v0, p0, Lcom/keepassdroid/EntryEditActivityV4;->scroll:Landroid/widget/ScrollView;

    return-object v0
.end method

.method protected static putParentId(Landroid/content/Intent;Ljava/lang/String;Lcom/keepassdroid/database/PwGroupV4;)V
    .locals 3
    .param p0, "i"    # Landroid/content/Intent;
    .param p1, "parentKey"    # Ljava/lang/String;
    .param p2, "parent"    # Lcom/keepassdroid/database/PwGroupV4;

    .prologue
    .line 59
    invoke-virtual {p2}, Lcom/keepassdroid/database/PwGroupV4;->getId()Lcom/keepassdroid/database/PwGroupId;

    move-result-object v0

    .local v0, "id":Lcom/keepassdroid/database/PwGroupId;
    move-object v1, v0

    .line 60
    check-cast v1, Lcom/keepassdroid/database/PwGroupIdV4;

    .line 62
    .local v1, "id4":Lcom/keepassdroid/database/PwGroupIdV4;
    invoke-virtual {v1}, Lcom/keepassdroid/database/PwGroupIdV4;->getId()Ljava/util/UUID;

    move-result-object v2

    invoke-static {v2}, Lcom/keepassdroid/utils/Types;->UUIDtoBytes(Ljava/util/UUID;)[B

    move-result-object v2

    invoke-virtual {p0, p1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;[B)Landroid/content/Intent;

    .line 64
    return-void
.end method


# virtual methods
.method public deleteAdvancedString(Landroid/view/View;)V
    .locals 5
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 180
    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v3

    check-cast v3, Lcom/keepassdroid/view/EntryEditSection;

    .line 181
    .local v3, "section":Lcom/keepassdroid/view/EntryEditSection;
    const v4, 0x7f0b0029

    invoke-virtual {p0, v4}, Lcom/keepassdroid/EntryEditActivityV4;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    .line 183
    .local v0, "container":Landroid/widget/LinearLayout;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v4

    if-ge v2, v4, :cond_0

    .line 184
    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/keepassdroid/view/EntryEditSection;

    .line 185
    .local v1, "ees":Lcom/keepassdroid/view/EntryEditSection;
    if-ne v1, v3, :cond_1

    .line 186
    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->removeViewAt(I)V

    .line 187
    invoke-virtual {v0}, Landroid/widget/LinearLayout;->invalidate()V

    .line 191
    .end local v1    # "ees":Lcom/keepassdroid/view/EntryEditSection;
    :cond_0
    return-void

    .line 183
    .restart local v1    # "ees":Lcom/keepassdroid/view/EntryEditSection;
    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0
.end method

.method protected fillData()V
    .locals 9

    .prologue
    .line 119
    invoke-super {p0}, Lcom/keepassdroid/EntryEditActivity;->fillData()V

    .line 121
    iget-object v2, p0, Lcom/keepassdroid/EntryEditActivityV4;->mEntry:Lcom/keepassdroid/database/PwEntry;

    check-cast v2, Lcom/keepassdroid/database/PwEntryV4;

    .line 123
    .local v2, "entry":Lcom/keepassdroid/database/PwEntryV4;
    const v5, 0x7f0b0029

    invoke-virtual {p0, v5}, Lcom/keepassdroid/EntryEditActivityV4;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    .line 125
    .local v0, "container":Landroid/widget/LinearLayout;
    iget-object v5, v2, Lcom/keepassdroid/database/PwEntryV4;->strings:Ljava/util/HashMap;

    invoke-virtual {v5}, Ljava/util/HashMap;->size()I

    move-result v5

    if-lez v5, :cond_1

    .line 126
    iget-object v5, v2, Lcom/keepassdroid/database/PwEntryV4;->strings:Ljava/util/HashMap;

    invoke-virtual {v5}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :cond_0
    :goto_0
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_1

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/Map$Entry;

    .line 127
    .local v4, "pair":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Lcom/keepassdroid/database/security/ProtectedString;>;"
    invoke-interface {v4}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 129
    .local v3, "key":Ljava/lang/String;
    invoke-static {v3}, Lcom/keepassdroid/database/PwEntryV4;->IsStandardString(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_0

    .line 130
    iget-object v5, p0, Lcom/keepassdroid/EntryEditActivityV4;->inflater:Landroid/view/LayoutInflater;

    const v7, 0x7f030004

    const/4 v8, 0x0

    invoke-virtual {v5, v7, v0, v8}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/keepassdroid/view/EntryEditSection;

    .line 131
    .local v1, "ees":Lcom/keepassdroid/view/EntryEditSection;
    invoke-interface {v4}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/keepassdroid/database/security/ProtectedString;

    invoke-virtual {v1, v3, v5}, Lcom/keepassdroid/view/EntryEditSection;->setData(Ljava/lang/String;Lcom/keepassdroid/database/security/ProtectedString;)V

    .line 132
    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    goto :goto_0

    .line 138
    .end local v1    # "ees":Lcom/keepassdroid/view/EntryEditSection;
    .end local v3    # "key":Ljava/lang/String;
    .end local v4    # "pair":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Lcom/keepassdroid/database/security/ProtectedString;>;"
    :cond_1
    return-void
.end method

.method protected getParentGroupId(Landroid/content/Intent;Ljava/lang/String;)Lcom/keepassdroid/database/PwGroupId;
    .locals 3
    .param p1, "i"    # Landroid/content/Intent;
    .param p2, "key"    # Ljava/lang/String;

    .prologue
    .line 68
    invoke-virtual {p1, p2}, Landroid/content/Intent;->getByteArrayExtra(Ljava/lang/String;)[B

    move-result-object v0

    .line 69
    .local v0, "buf":[B
    invoke-static {v0}, Lcom/keepassdroid/utils/Types;->bytestoUUID([B)Ljava/util/UUID;

    move-result-object v1

    .line 71
    .local v1, "id":Ljava/util/UUID;
    new-instance v2, Lcom/keepassdroid/database/PwGroupIdV4;

    invoke-direct {v2, v1}, Lcom/keepassdroid/database/PwGroupIdV4;-><init>(Ljava/util/UUID;)V

    return-object v2
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 9
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const v8, 0x7f0b0018

    const/4 v7, 0x3

    .line 76
    const-string v6, "layout_inflater"

    invoke-virtual {p0, v6}, Lcom/keepassdroid/EntryEditActivityV4;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroid/view/LayoutInflater;

    iput-object v6, p0, Lcom/keepassdroid/EntryEditActivityV4;->inflater:Landroid/view/LayoutInflater;

    .line 78
    invoke-super {p0, p1}, Lcom/keepassdroid/EntryEditActivity;->onCreate(Landroid/os/Bundle;)V

    .line 80
    const v6, 0x7f0b0014

    invoke-virtual {p0, v6}, Lcom/keepassdroid/EntryEditActivityV4;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/ScrollView;

    iput-object v6, p0, Lcom/keepassdroid/EntryEditActivityV4;->scroll:Landroid/widget/ScrollView;

    .line 82
    const v6, 0x7f0b002a

    invoke-virtual {p0, v6}, Lcom/keepassdroid/EntryEditActivityV4;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageButton;

    .line 83
    .local v0, "add":Landroid/widget/ImageButton;
    const/4 v6, 0x0

    invoke-virtual {v0, v6}, Landroid/widget/ImageButton;->setVisibility(I)V

    .line 84
    new-instance v6, Lcom/keepassdroid/EntryEditActivityV4$1;

    invoke-direct {v6, p0}, Lcom/keepassdroid/EntryEditActivityV4$1;-><init>(Lcom/keepassdroid/EntryEditActivityV4;)V

    invoke-virtual {v0, v6}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 105
    const v6, 0x7f0b0016

    invoke-virtual {p0, v6}, Lcom/keepassdroid/EntryEditActivityV4;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/ImageButton;

    .line 106
    .local v2, "iconPicker":Landroid/widget/ImageButton;
    const/16 v6, 0x8

    invoke-virtual {v2, v6}, Landroid/widget/ImageButton;->setVisibility(I)V

    .line 108
    invoke-virtual {p0, v8}, Lcom/keepassdroid/EntryEditActivityV4;->findViewById(I)Landroid/view/View;

    move-result-object v1

    .line 109
    .local v1, "divider":Landroid/view/View;
    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v4

    check-cast v4, Landroid/widget/RelativeLayout$LayoutParams;

    .line 110
    .local v4, "lp_div":Landroid/widget/RelativeLayout$LayoutParams;
    const v6, 0x7f0b0017

    invoke-virtual {v4, v7, v6}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    .line 112
    const v6, 0x7f0b0019

    invoke-virtual {p0, v6}, Lcom/keepassdroid/EntryEditActivityV4;->findViewById(I)Landroid/view/View;

    move-result-object v5

    .line 113
    .local v5, "user_label":Landroid/view/View;
    invoke-virtual {v5}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v3

    check-cast v3, Landroid/widget/RelativeLayout$LayoutParams;

    .line 114
    .local v3, "lp":Landroid/widget/RelativeLayout$LayoutParams;
    invoke-virtual {v3, v7, v8}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    .line 115
    return-void
.end method

.method protected populateNewEntry()Lcom/keepassdroid/database/PwEntry;
    .locals 15

    .prologue
    .line 143
    iget-object v13, p0, Lcom/keepassdroid/EntryEditActivityV4;->mEntry:Lcom/keepassdroid/database/PwEntry;

    const/4 v14, 0x1

    invoke-virtual {v13, v14}, Lcom/keepassdroid/database/PwEntry;->clone(Z)Lcom/keepassdroid/database/PwEntry;

    move-result-object v6

    check-cast v6, Lcom/keepassdroid/database/PwEntryV4;

    .line 144
    .local v6, "newEntry":Lcom/keepassdroid/database/PwEntryV4;
    iget-object v13, v6, Lcom/keepassdroid/database/PwEntryV4;->history:Ljava/util/ArrayList;

    invoke-virtual {v13}, Ljava/util/ArrayList;->clone()Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Ljava/util/ArrayList;

    iput-object v13, v6, Lcom/keepassdroid/database/PwEntryV4;->history:Ljava/util/ArrayList;

    .line 145
    invoke-static {}, Lcom/keepassdroid/app/App;->getDB()Lcom/keepassdroid/Database;

    move-result-object v13

    iget-object v13, v13, Lcom/keepassdroid/Database;->pm:Lcom/keepassdroid/database/PwDatabase;

    check-cast v13, Lcom/keepassdroid/database/PwDatabaseV4;

    invoke-virtual {v6, v13}, Lcom/keepassdroid/database/PwEntryV4;->createBackup(Lcom/keepassdroid/database/PwDatabaseV4;)V

    .line 147
    invoke-super {p0, v6}, Lcom/keepassdroid/EntryEditActivity;->populateNewEntry(Lcom/keepassdroid/database/PwEntry;)Lcom/keepassdroid/database/PwEntry;

    move-result-object v6

    .end local v6    # "newEntry":Lcom/keepassdroid/database/PwEntryV4;
    check-cast v6, Lcom/keepassdroid/database/PwEntryV4;

    .line 149
    .restart local v6    # "newEntry":Lcom/keepassdroid/database/PwEntryV4;
    iget-object v9, v6, Lcom/keepassdroid/database/PwEntryV4;->strings:Ljava/util/HashMap;

    .line 152
    .local v9, "strings":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lcom/keepassdroid/database/security/ProtectedString;>;"
    invoke-interface {v9}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v13

    invoke-interface {v13}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .line 153
    .local v3, "iter":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/util/Map$Entry<Ljava/lang/String;Lcom/keepassdroid/database/security/ProtectedString;>;>;"
    :cond_0
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v13

    if-eqz v13, :cond_1

    .line 154
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/util/Map$Entry;

    .line 155
    .local v7, "pair":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Lcom/keepassdroid/database/security/ProtectedString;>;"
    invoke-interface {v7}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Ljava/lang/String;

    invoke-static {v13}, Lcom/keepassdroid/database/PwEntryV4;->IsStandardString(Ljava/lang/String;)Z

    move-result v13

    if-nez v13, :cond_0

    .line 156
    invoke-interface {v3}, Ljava/util/Iterator;->remove()V

    goto :goto_0

    .line 160
    .end local v7    # "pair":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Lcom/keepassdroid/database/security/ProtectedString;>;"
    :cond_1
    const v13, 0x7f0b0029

    invoke-virtual {p0, v13}, Lcom/keepassdroid/EntryEditActivityV4;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/LinearLayout;

    .line 161
    .local v1, "container":Landroid/widget/LinearLayout;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_1
    invoke-virtual {v1}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v13

    if-ge v2, v13, :cond_2

    .line 162
    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v12

    .line 164
    .local v12, "view":Landroid/view/View;
    const v13, 0x7f0b002b

    invoke-virtual {v12, v13}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/TextView;

    .line 165
    .local v5, "keyView":Landroid/widget/TextView;
    invoke-virtual {v5}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v13

    invoke-interface {v13}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v4

    .line 167
    .local v4, "key":Ljava/lang/String;
    const v13, 0x7f0b002e

    invoke-virtual {v12, v13}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v11

    check-cast v11, Landroid/widget/TextView;

    .line 168
    .local v11, "valueView":Landroid/widget/TextView;
    invoke-virtual {v11}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v13

    invoke-interface {v13}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v10

    .line 170
    .local v10, "value":Ljava/lang/String;
    const v13, 0x7f0b002c

    invoke-virtual {v12, v13}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/CheckBox;

    .line 171
    .local v0, "cb":Landroid/widget/CheckBox;
    invoke-virtual {v0}, Landroid/widget/CheckBox;->isChecked()Z

    move-result v8

    .line 173
    .local v8, "protect":Z
    new-instance v13, Lcom/keepassdroid/database/security/ProtectedString;

    invoke-direct {v13, v8, v10}, Lcom/keepassdroid/database/security/ProtectedString;-><init>(ZLjava/lang/String;)V

    invoke-interface {v9, v4, v13}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 161
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 176
    .end local v0    # "cb":Landroid/widget/CheckBox;
    .end local v4    # "key":Ljava/lang/String;
    .end local v5    # "keyView":Landroid/widget/TextView;
    .end local v8    # "protect":Z
    .end local v10    # "value":Ljava/lang/String;
    .end local v11    # "valueView":Landroid/widget/TextView;
    .end local v12    # "view":Landroid/view/View;
    :cond_2
    return-object v6
.end method

.method protected validateBeforeSaving()Z
    .locals 8

    .prologue
    const/4 v6, 0x1

    const/4 v5, 0x0

    .line 195
    invoke-super {p0}, Lcom/keepassdroid/EntryEditActivity;->validateBeforeSaving()Z

    move-result v7

    if-nez v7, :cond_0

    .line 213
    :goto_0
    return v5

    .line 199
    :cond_0
    const v7, 0x7f0b0029

    invoke-virtual {p0, v7}, Lcom/keepassdroid/EntryEditActivityV4;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    .line 200
    .local v0, "container":Landroid/widget/LinearLayout;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_1
    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v7

    if-ge v2, v7, :cond_3

    .line 201
    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/keepassdroid/view/EntryEditSection;

    .line 203
    .local v1, "ees":Lcom/keepassdroid/view/EntryEditSection;
    const v7, 0x7f0b002b

    invoke-virtual {v1, v7}, Lcom/keepassdroid/view/EntryEditSection;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    .line 204
    .local v4, "keyView":Landroid/widget/TextView;
    invoke-virtual {v4}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v3

    .line 206
    .local v3, "key":Ljava/lang/CharSequence;
    if-eqz v3, :cond_1

    invoke-interface {v3}, Ljava/lang/CharSequence;->length()I

    move-result v7

    if-nez v7, :cond_2

    .line 207
    :cond_1
    const v7, 0x7f06009c

    invoke-static {p0, v7, v6}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v6

    invoke-virtual {v6}, Landroid/widget/Toast;->show()V

    goto :goto_0

    .line 200
    :cond_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .end local v1    # "ees":Lcom/keepassdroid/view/EntryEditSection;
    .end local v3    # "key":Ljava/lang/CharSequence;
    .end local v4    # "keyView":Landroid/widget/TextView;
    :cond_3
    move v5, v6

    .line 213
    goto :goto_0
.end method
