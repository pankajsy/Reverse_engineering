.class public abstract Lcom/keepassdroid/GroupBaseActivity;
.super Lcom/keepassdroid/LockCloseListActivity;
.source "GroupBaseActivity.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/keepassdroid/GroupBaseActivity$AfterDeleteGroup;,
        Lcom/keepassdroid/GroupBaseActivity$RefreshTask;
    }
.end annotation


# static fields
.field public static final KEY_ENTRY:Ljava/lang/String; = "entry"

.field public static final KEY_MODE:Ljava/lang/String; = "mode"


# instance fields
.field protected mGroup:Lcom/keepassdroid/database/PwGroup;

.field private prefs:Landroid/content/SharedPreferences;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 52
    invoke-direct {p0}, Lcom/keepassdroid/LockCloseListActivity;-><init>()V

    return-void
.end method

.method private setPassword()V
    .locals 1

    .prologue
    .line 243
    new-instance v0, Lcom/keepassdroid/SetPasswordDialog;

    invoke-direct {v0, p0}, Lcom/keepassdroid/SetPasswordDialog;-><init>(Landroid/content/Context;)V

    .line 245
    .local v0, "dialog":Lcom/keepassdroid/SetPasswordDialog;
    invoke-virtual {v0}, Lcom/keepassdroid/SetPasswordDialog;->show()V

    .line 246
    return-void
.end method

.method private setSortMenuText(Landroid/view/Menu;)V
    .locals 6
    .param p1, "menu"    # Landroid/view/Menu;

    .prologue
    .line 151
    const/4 v1, 0x0

    .line 154
    .local v1, "sortByName":Z
    iget-object v2, p0, Lcom/keepassdroid/GroupBaseActivity;->prefs:Landroid/content/SharedPreferences;

    if-eqz v2, :cond_0

    .line 155
    iget-object v2, p0, Lcom/keepassdroid/GroupBaseActivity;->prefs:Landroid/content/SharedPreferences;

    const v3, 0x7f0600ca

    invoke-virtual {p0, v3}, Lcom/keepassdroid/GroupBaseActivity;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0}, Lcom/keepassdroid/GroupBaseActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const v5, 0x7f080005

    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v4

    invoke-interface {v2, v3, v4}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    .line 159
    :cond_0
    if-eqz v1, :cond_1

    .line 160
    const v0, 0x7f06008b

    .line 165
    .local v0, "resId":I
    :goto_0
    const v2, 0x7f0b007c

    invoke-interface {p1, v2}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v2

    invoke-interface {v2, v0}, Landroid/view/MenuItem;->setTitle(I)Landroid/view/MenuItem;

    .line 167
    return-void

    .line 162
    .end local v0    # "resId":I
    :cond_1
    const v0, 0x7f06008c

    .restart local v0    # "resId":I
    goto :goto_0
.end method

.method private toggleSort()V
    .locals 8

    .prologue
    .line 221
    const v5, 0x7f0600ca

    invoke-virtual {p0, v5}, Lcom/keepassdroid/GroupBaseActivity;->getString(I)Ljava/lang/String;

    move-result-object v4

    .line 222
    .local v4, "sortKey":Ljava/lang/String;
    iget-object v5, p0, Lcom/keepassdroid/GroupBaseActivity;->prefs:Landroid/content/SharedPreferences;

    invoke-virtual {p0}, Lcom/keepassdroid/GroupBaseActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    const v7, 0x7f080005

    invoke-virtual {v6, v7}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v6

    invoke-interface {v5, v4, v6}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v3

    .line 223
    .local v3, "sortByName":Z
    iget-object v5, p0, Lcom/keepassdroid/GroupBaseActivity;->prefs:Landroid/content/SharedPreferences;

    invoke-interface {v5}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    .line 224
    .local v2, "editor":Landroid/content/SharedPreferences$Editor;
    if-nez v3, :cond_0

    const/4 v5, 0x1

    :goto_0
    invoke-interface {v2, v4, v5}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    .line 225
    invoke-static {v2}, Lcom/keepassdroid/compat/EditorCompat;->apply(Landroid/content/SharedPreferences$Editor;)V

    .line 228
    invoke-static {p0}, Lcom/keepassdroid/compat/ActivityCompat;->invalidateOptionsMenu(Landroid/app/Activity;)V

    .line 231
    invoke-static {}, Lcom/keepassdroid/app/App;->getDB()Lcom/keepassdroid/Database;

    move-result-object v1

    .line 232
    .local v1, "db":Lcom/keepassdroid/Database;
    invoke-virtual {v1}, Lcom/keepassdroid/Database;->markAllGroupsAsDirty()V

    .line 234
    iget-object v5, v1, Lcom/keepassdroid/Database;->dirty:Ljava/util/Set;

    iget-object v6, p0, Lcom/keepassdroid/GroupBaseActivity;->mGroup:Lcom/keepassdroid/database/PwGroup;

    invoke-interface {v5, v6}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 237
    invoke-virtual {p0}, Lcom/keepassdroid/GroupBaseActivity;->getListAdapter()Landroid/widget/ListAdapter;

    move-result-object v0

    check-cast v0, Landroid/widget/BaseAdapter;

    .line 238
    .local v0, "adapter":Landroid/widget/BaseAdapter;
    invoke-virtual {v0}, Landroid/widget/BaseAdapter;->notifyDataSetChanged()V

    .line 240
    return-void

    .line 224
    .end local v0    # "adapter":Landroid/widget/BaseAdapter;
    .end local v1    # "db":Lcom/keepassdroid/Database;
    :cond_0
    const/4 v5, 0x0

    goto :goto_0
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 1
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 89
    invoke-super {p0, p1}, Lcom/keepassdroid/LockCloseListActivity;->onCreate(Landroid/os/Bundle;)V

    .line 92
    invoke-static {}, Lcom/keepassdroid/app/App;->getDB()Lcom/keepassdroid/Database;

    move-result-object v0

    invoke-virtual {v0}, Lcom/keepassdroid/Database;->Loaded()Z

    move-result v0

    if-nez v0, :cond_0

    .line 93
    invoke-virtual {p0}, Lcom/keepassdroid/GroupBaseActivity;->finish()V

    .line 106
    :goto_0
    return-void

    .line 97
    :cond_0
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    iput-object v0, p0, Lcom/keepassdroid/GroupBaseActivity;->prefs:Landroid/content/SharedPreferences;

    .line 99
    invoke-static {p0}, Lcom/keepassdroid/compat/ActivityCompat;->invalidateOptionsMenu(Landroid/app/Activity;)V

    .line 101
    new-instance v0, Lcom/keepassdroid/view/GroupViewOnlyView;

    invoke-direct {v0, p0}, Lcom/keepassdroid/view/GroupViewOnlyView;-><init>(Landroid/content/Context;)V

    invoke-virtual {p0, v0}, Lcom/keepassdroid/GroupBaseActivity;->setContentView(Landroid/view/View;)V

    .line 102
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/keepassdroid/GroupBaseActivity;->setResult(I)V

    .line 104
    invoke-virtual {p0}, Lcom/keepassdroid/GroupBaseActivity;->styleScrollBars()V

    goto :goto_0
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;)Z
    .locals 2
    .param p1, "menu"    # Landroid/view/Menu;

    .prologue
    .line 142
    invoke-super {p0, p1}, Lcom/keepassdroid/LockCloseListActivity;->onCreateOptionsMenu(Landroid/view/Menu;)Z

    .line 144
    invoke-virtual {p0}, Lcom/keepassdroid/GroupBaseActivity;->getMenuInflater()Landroid/view/MenuInflater;

    move-result-object v0

    .line 145
    .local v0, "inflater":Landroid/view/MenuInflater;
    const v1, 0x7f0a0003

    invoke-virtual {v0, v1, p1}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    .line 147
    const/4 v1, 0x1

    return v1
.end method

.method protected onListItemClick(Landroid/widget/ListView;Landroid/view/View;IJ)V
    .locals 4
    .param p1, "l"    # Landroid/widget/ListView;
    .param p2, "v"    # Landroid/view/View;
    .param p3, "position"    # I
    .param p4, "id"    # J

    .prologue
    const/4 v2, 0x0

    .line 79
    invoke-super/range {p0 .. p5}, Lcom/keepassdroid/LockCloseListActivity;->onListItemClick(Landroid/widget/ListView;Landroid/view/View;IJ)V

    .line 81
    invoke-virtual {p0}, Lcom/keepassdroid/GroupBaseActivity;->getListAdapter()Landroid/widget/ListAdapter;

    move-result-object v0

    .line 82
    .local v0, "adapt":Landroid/widget/ListAdapter;
    invoke-interface {v0, p3, v2, v2}, Landroid/widget/ListAdapter;->getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/keepassdroid/view/ClickView;

    .line 83
    .local v1, "cv":Lcom/keepassdroid/view/ClickView;
    invoke-virtual {v1}, Lcom/keepassdroid/view/ClickView;->onClick()V

    .line 85
    return-void
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 3
    .param p1, "item"    # Landroid/view/MenuItem;

    .prologue
    const/4 v1, 0x1

    .line 182
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v2

    packed-switch v2, :pswitch_data_0

    .line 216
    :pswitch_0
    invoke-super {p0, p1}, Lcom/keepassdroid/LockCloseListActivity;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result v1

    :goto_0
    return v1

    .line 185
    :pswitch_1
    const v2, 0x7f0600b6

    :try_start_0
    invoke-static {p0, v2}, Lcom/keepassdroid/utils/Util;->gotoUrl(Landroid/content/Context;I)V
    :try_end_0
    .catch Landroid/content/ActivityNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 186
    :catch_0
    move-exception v0

    .line 187
    .local v0, "e":Landroid/content/ActivityNotFoundException;
    const v2, 0x7f06003a

    invoke-static {p0, v2, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    .line 188
    const/4 v1, 0x0

    goto :goto_0

    .line 193
    .end local v0    # "e":Landroid/content/ActivityNotFoundException;
    :pswitch_2
    invoke-static {}, Lcom/keepassdroid/app/App;->setShutdown()V

    .line 194
    invoke-virtual {p0, v1}, Lcom/keepassdroid/GroupBaseActivity;->setResult(I)V

    .line 195
    invoke-virtual {p0}, Lcom/keepassdroid/GroupBaseActivity;->finish()V

    goto :goto_0

    .line 199
    :pswitch_3
    invoke-virtual {p0}, Lcom/keepassdroid/GroupBaseActivity;->onSearchRequested()Z

    goto :goto_0

    .line 203
    :pswitch_4
    invoke-static {p0}, Lcom/keepassdroid/settings/AppSettingsActivity;->Launch(Landroid/content/Context;)V

    goto :goto_0

    .line 207
    :pswitch_5
    invoke-direct {p0}, Lcom/keepassdroid/GroupBaseActivity;->setPassword()V

    goto :goto_0

    .line 211
    :pswitch_6
    invoke-direct {p0}, Lcom/keepassdroid/GroupBaseActivity;->toggleSort()V

    goto :goto_0

    .line 182
    nop

    :pswitch_data_0
    .packed-switch 0x7f0b0072
        :pswitch_1
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_2
        :pswitch_4
        :pswitch_0
        :pswitch_3
        :pswitch_5
        :pswitch_6
    .end packed-switch
.end method

.method public onPrepareOptionsMenu(Landroid/view/Menu;)Z
    .locals 1
    .param p1, "menu"    # Landroid/view/Menu;

    .prologue
    .line 171
    invoke-super {p0, p1}, Lcom/keepassdroid/LockCloseListActivity;->onPrepareOptionsMenu(Landroid/view/Menu;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 172
    const/4 v0, 0x0

    .line 177
    :goto_0
    return v0

    .line 175
    :cond_0
    invoke-direct {p0, p1}, Lcom/keepassdroid/GroupBaseActivity;->setSortMenuText(Landroid/view/Menu;)V

    .line 177
    const/4 v0, 0x1

    goto :goto_0
.end method

.method protected onResume()V
    .locals 0

    .prologue
    .line 62
    invoke-super {p0}, Lcom/keepassdroid/LockCloseListActivity;->onResume()V

    .line 64
    invoke-virtual {p0}, Lcom/keepassdroid/GroupBaseActivity;->refreshIfDirty()V

    .line 65
    return-void
.end method

.method public refreshIfDirty()V
    .locals 4

    .prologue
    .line 68
    invoke-static {}, Lcom/keepassdroid/app/App;->getDB()Lcom/keepassdroid/Database;

    move-result-object v1

    .line 69
    .local v1, "db":Lcom/keepassdroid/Database;
    iget-object v2, v1, Lcom/keepassdroid/Database;->dirty:Ljava/util/Set;

    iget-object v3, p0, Lcom/keepassdroid/GroupBaseActivity;->mGroup:Lcom/keepassdroid/database/PwGroup;

    invoke-interface {v2, v3}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 70
    iget-object v2, v1, Lcom/keepassdroid/Database;->dirty:Ljava/util/Set;

    iget-object v3, p0, Lcom/keepassdroid/GroupBaseActivity;->mGroup:Lcom/keepassdroid/database/PwGroup;

    invoke-interface {v2, v3}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 71
    invoke-virtual {p0}, Lcom/keepassdroid/GroupBaseActivity;->getListAdapter()Landroid/widget/ListAdapter;

    move-result-object v0

    check-cast v0, Landroid/widget/BaseAdapter;

    .line 72
    .local v0, "adapter":Landroid/widget/BaseAdapter;
    invoke-virtual {v0}, Landroid/widget/BaseAdapter;->notifyDataSetChanged()V

    .line 75
    .end local v0    # "adapter":Landroid/widget/BaseAdapter;
    :cond_0
    return-void
.end method

.method protected setGroupIcon()V
    .locals 4

    .prologue
    .line 134
    iget-object v1, p0, Lcom/keepassdroid/GroupBaseActivity;->mGroup:Lcom/keepassdroid/database/PwGroup;

    if-eqz v1, :cond_0

    .line 135
    const v1, 0x7f0b0062

    invoke-virtual {p0, v1}, Lcom/keepassdroid/GroupBaseActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    .line 136
    .local v0, "iv":Landroid/widget/ImageView;
    invoke-static {}, Lcom/keepassdroid/app/App;->getDB()Lcom/keepassdroid/Database;

    move-result-object v1

    iget-object v1, v1, Lcom/keepassdroid/Database;->drawFactory:Lcom/keepassdroid/icons/DrawableFactory;

    invoke-virtual {p0}, Lcom/keepassdroid/GroupBaseActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    iget-object v3, p0, Lcom/keepassdroid/GroupBaseActivity;->mGroup:Lcom/keepassdroid/database/PwGroup;

    invoke-virtual {v3}, Lcom/keepassdroid/database/PwGroup;->getIcon()Lcom/keepassdroid/database/PwIcon;

    move-result-object v3

    invoke-virtual {v1, v0, v2, v3}, Lcom/keepassdroid/icons/DrawableFactory;->assignDrawableTo(Landroid/widget/ImageView;Landroid/content/res/Resources;Lcom/keepassdroid/database/PwIcon;)V

    .line 138
    .end local v0    # "iv":Landroid/widget/ImageView;
    :cond_0
    return-void
.end method

.method protected setGroupTitle()V
    .locals 4

    .prologue
    const v3, 0x7f0b005f

    .line 116
    iget-object v2, p0, Lcom/keepassdroid/GroupBaseActivity;->mGroup:Lcom/keepassdroid/database/PwGroup;

    if-eqz v2, :cond_0

    .line 117
    iget-object v2, p0, Lcom/keepassdroid/GroupBaseActivity;->mGroup:Lcom/keepassdroid/database/PwGroup;

    invoke-virtual {v2}, Lcom/keepassdroid/database/PwGroup;->getName()Ljava/lang/String;

    move-result-object v0

    .line 118
    .local v0, "name":Ljava/lang/String;
    if-eqz v0, :cond_1

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v2

    if-lez v2, :cond_1

    .line 119
    invoke-virtual {p0, v3}, Lcom/keepassdroid/GroupBaseActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    .line 120
    .local v1, "tv":Landroid/widget/TextView;
    if-eqz v1, :cond_0

    .line 121
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 131
    .end local v0    # "name":Ljava/lang/String;
    .end local v1    # "tv":Landroid/widget/TextView;
    :cond_0
    :goto_0
    return-void

    .line 124
    .restart local v0    # "name":Ljava/lang/String;
    :cond_1
    invoke-virtual {p0, v3}, Lcom/keepassdroid/GroupBaseActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    .line 125
    .restart local v1    # "tv":Landroid/widget/TextView;
    if-eqz v1, :cond_0

    .line 126
    const v2, 0x7f060082

    invoke-virtual {p0, v2}, Lcom/keepassdroid/GroupBaseActivity;->getText(I)Ljava/lang/CharSequence;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0
.end method

.method protected styleScrollBars()V
    .locals 2

    .prologue
    .line 109
    invoke-virtual {p0}, Lcom/keepassdroid/GroupBaseActivity;->getListView()Landroid/widget/ListView;

    move-result-object v0

    .line 110
    .local v0, "lv":Landroid/widget/ListView;
    const/high16 v1, 0x1000000

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setScrollBarStyle(I)V

    .line 111
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setTextFilterEnabled(Z)V

    .line 113
    return-void
.end method
