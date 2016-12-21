.class public Lcom/keepassdroid/EntryEditActivityV3;
.super Lcom/keepassdroid/EntryEditActivity;
.source "EntryEditActivityV3.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 30
    invoke-direct {p0}, Lcom/keepassdroid/EntryEditActivity;-><init>()V

    return-void
.end method

.method protected static putParentId(Landroid/content/Intent;Ljava/lang/String;Lcom/keepassdroid/database/PwGroupV3;)V
    .locals 1
    .param p0, "i"    # Landroid/content/Intent;
    .param p1, "parentKey"    # Ljava/lang/String;
    .param p2, "parent"    # Lcom/keepassdroid/database/PwGroupV3;

    .prologue
    .line 53
    iget v0, p2, Lcom/keepassdroid/database/PwGroupV3;->groupId:I

    invoke-virtual {p0, p1, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 54
    return-void
.end method


# virtual methods
.method protected getParentGroupId(Landroid/content/Intent;Ljava/lang/String;)Lcom/keepassdroid/database/PwGroupId;
    .locals 2
    .param p1, "i"    # Landroid/content/Intent;
    .param p2, "key"    # Ljava/lang/String;

    .prologue
    .line 58
    const/4 v1, -0x1

    invoke-virtual {p1, p2, v1}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v0

    .line 60
    .local v0, "groupId":I
    new-instance v1, Lcom/keepassdroid/database/PwGroupIdV3;

    invoke-direct {v1, v0}, Lcom/keepassdroid/database/PwGroupIdV3;-><init>(I)V

    return-object v1
.end method

.method protected populateNewEntry(Lcom/keepassdroid/database/PwEntry;)Lcom/keepassdroid/database/PwEntry;
    .locals 3
    .param p1, "entry"    # Lcom/keepassdroid/database/PwEntry;

    .prologue
    .line 34
    invoke-super {p0, p1}, Lcom/keepassdroid/EntryEditActivity;->populateNewEntry(Lcom/keepassdroid/database/PwEntry;)Lcom/keepassdroid/database/PwEntry;

    move-result-object v0

    .line 36
    .local v0, "newEntry":Lcom/keepassdroid/database/PwEntry;
    iget v1, p0, Lcom/keepassdroid/EntryEditActivityV3;->mSelectedIconID:I

    const/4 v2, -0x1

    if-ne v1, v2, :cond_1

    .line 37
    iget-boolean v1, p0, Lcom/keepassdroid/EntryEditActivityV3;->mIsNew:Z

    if-eqz v1, :cond_0

    .line 38
    invoke-static {}, Lcom/keepassdroid/app/App;->getDB()Lcom/keepassdroid/Database;

    move-result-object v1

    iget-object v1, v1, Lcom/keepassdroid/Database;->pm:Lcom/keepassdroid/database/PwDatabase;

    iget-object v1, v1, Lcom/keepassdroid/database/PwDatabase;->iconFactory:Lcom/keepassdroid/database/PwIconFactory;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lcom/keepassdroid/database/PwIconFactory;->getIcon(I)Lcom/keepassdroid/database/PwIconStandard;

    move-result-object v1

    iput-object v1, v0, Lcom/keepassdroid/database/PwEntry;->icon:Lcom/keepassdroid/database/PwIconStandard;

    .line 49
    :goto_0
    return-object v0

    .line 42
    :cond_0
    iget-object v1, p0, Lcom/keepassdroid/EntryEditActivityV3;->mEntry:Lcom/keepassdroid/database/PwEntry;

    iget-object v1, v1, Lcom/keepassdroid/database/PwEntry;->icon:Lcom/keepassdroid/database/PwIconStandard;

    iput-object v1, v0, Lcom/keepassdroid/database/PwEntry;->icon:Lcom/keepassdroid/database/PwIconStandard;

    goto :goto_0

    .line 46
    :cond_1
    invoke-static {}, Lcom/keepassdroid/app/App;->getDB()Lcom/keepassdroid/Database;

    move-result-object v1

    iget-object v1, v1, Lcom/keepassdroid/Database;->pm:Lcom/keepassdroid/database/PwDatabase;

    iget-object v1, v1, Lcom/keepassdroid/database/PwDatabase;->iconFactory:Lcom/keepassdroid/database/PwIconFactory;

    iget v2, p0, Lcom/keepassdroid/EntryEditActivityV3;->mSelectedIconID:I

    invoke-virtual {v1, v2}, Lcom/keepassdroid/database/PwIconFactory;->getIcon(I)Lcom/keepassdroid/database/PwIconStandard;

    move-result-object v1

    iput-object v1, v0, Lcom/keepassdroid/database/PwEntry;->icon:Lcom/keepassdroid/database/PwIconStandard;

    goto :goto_0
.end method
