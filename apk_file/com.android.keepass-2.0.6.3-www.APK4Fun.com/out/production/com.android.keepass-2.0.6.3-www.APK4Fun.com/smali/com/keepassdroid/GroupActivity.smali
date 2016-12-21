.class public abstract Lcom/keepassdroid/GroupActivity;
.super Lcom/keepassdroid/GroupBaseActivity;
.source "GroupActivity.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "Group Activity:"

.field public static final UNINIT:I = -0x1


# instance fields
.field protected addEntryEnabled:Z

.field protected addGroupEnabled:Z

.field protected isRoot:Z

.field protected readOnly:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 54
    invoke-direct {p0}, Lcom/keepassdroid/GroupBaseActivity;-><init>()V

    .line 58
    iput-boolean v0, p0, Lcom/keepassdroid/GroupActivity;->addGroupEnabled:Z

    .line 59
    iput-boolean v0, p0, Lcom/keepassdroid/GroupActivity;->addEntryEnabled:Z

    .line 60
    iput-boolean v0, p0, Lcom/keepassdroid/GroupActivity;->isRoot:Z

    .line 61
    iput-boolean v0, p0, Lcom/keepassdroid/GroupActivity;->readOnly:Z

    return-void
.end method

.method public static Launch(Landroid/app/Activity;)V
    .locals 1
    .param p0, "act"    # Landroid/app/Activity;

    .prologue
    .line 66
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lcom/keepassdroid/GroupActivity;->Launch(Landroid/app/Activity;Lcom/keepassdroid/database/PwGroup;)V

    .line 67
    return-void
.end method

.method public static Launch(Landroid/app/Activity;Lcom/keepassdroid/database/PwGroup;)V
    .locals 5
    .param p0, "act"    # Landroid/app/Activity;
    .param p1, "group"    # Lcom/keepassdroid/database/PwGroup;

    .prologue
    .line 73
    invoke-static {}, Lcom/keepassdroid/app/App;->getDB()Lcom/keepassdroid/Database;

    move-result-object v3

    iget-object v0, v3, Lcom/keepassdroid/Database;->pm:Lcom/keepassdroid/database/PwDatabase;

    .line 74
    .local v0, "db":Lcom/keepassdroid/database/PwDatabase;
    instance-of v3, v0, Lcom/keepassdroid/database/PwDatabaseV3;

    if-eqz v3, :cond_1

    .line 75
    new-instance v2, Landroid/content/Intent;

    const-class v3, Lcom/keepassdroid/GroupActivityV3;

    invoke-direct {v2, p0, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 77
    .local v2, "i":Landroid/content/Intent;
    if-eqz p1, :cond_0

    move-object v1, p1

    .line 78
    check-cast v1, Lcom/keepassdroid/database/PwGroupV3;

    .line 79
    .local v1, "g":Lcom/keepassdroid/database/PwGroupV3;
    const-string v3, "entry"

    iget v4, v1, Lcom/keepassdroid/database/PwGroupV3;->groupId:I

    invoke-virtual {v2, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 94
    .end local v1    # "g":Lcom/keepassdroid/database/PwGroupV3;
    :cond_0
    :goto_0
    const/4 v3, 0x0

    invoke-virtual {p0, v2, v3}, Landroid/app/Activity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 95
    .end local v2    # "i":Landroid/content/Intent;
    :goto_1
    return-void

    .line 81
    :cond_1
    instance-of v3, v0, Lcom/keepassdroid/database/PwDatabaseV4;

    if-eqz v3, :cond_2

    .line 82
    new-instance v2, Landroid/content/Intent;

    const-class v3, Lcom/keepassdroid/GroupActivityV4;

    invoke-direct {v2, p0, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 84
    .restart local v2    # "i":Landroid/content/Intent;
    if-eqz p1, :cond_0

    move-object v1, p1

    .line 85
    check-cast v1, Lcom/keepassdroid/database/PwGroupV4;

    .line 86
    .local v1, "g":Lcom/keepassdroid/database/PwGroupV4;
    const-string v3, "entry"

    iget-object v4, v1, Lcom/keepassdroid/database/PwGroupV4;->uuid:Ljava/util/UUID;

    invoke-virtual {v4}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    goto :goto_0

    .line 90
    .end local v1    # "g":Lcom/keepassdroid/database/PwGroupV4;
    .end local v2    # "i":Landroid/content/Intent;
    :cond_2
    const-string v3, "Group Activity:"

    const-string v4, "Tried to launch with null db"

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1
.end method


# virtual methods
.method protected onActivityResult(IILandroid/content/Intent;)V
    .locals 11
    .param p1, "requestCode"    # I
    .param p2, "resultCode"    # I
    .param p3, "data"    # Landroid/content/Intent;

    .prologue
    .line 206
    packed-switch p2, :pswitch_data_0

    .line 222
    :goto_0
    return-void

    .line 209
    :pswitch_0
    invoke-virtual {p3}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v0

    const-string v1, "name"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 210
    .local v2, "GroupName":Ljava/lang/String;
    invoke-virtual {p3}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v0

    const-string v1, "icon_id"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v3

    .line 211
    .local v3, "GroupIconID":I
    move-object v7, p0

    .line 212
    .local v7, "act":Lcom/keepassdroid/GroupActivity;
    new-instance v8, Landroid/os/Handler;

    invoke-direct {v8}, Landroid/os/Handler;-><init>()V

    .line 213
    .local v8, "handler":Landroid/os/Handler;
    invoke-static {}, Lcom/keepassdroid/app/App;->getDB()Lcom/keepassdroid/Database;

    move-result-object v1

    iget-object v4, p0, Lcom/keepassdroid/GroupActivity;->mGroup:Lcom/keepassdroid/database/PwGroup;

    new-instance v5, Lcom/keepassdroid/GroupBaseActivity$RefreshTask;

    invoke-virtual {v7}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-direct {v5, v7, v8}, Lcom/keepassdroid/GroupBaseActivity$RefreshTask;-><init>(Lcom/keepassdroid/GroupBaseActivity;Landroid/os/Handler;)V

    const/4 v6, 0x0

    move-object v0, p0

    invoke-static/range {v0 .. v6}, Lcom/keepassdroid/database/edit/AddGroup;->getInstance(Landroid/content/Context;Lcom/keepassdroid/Database;Ljava/lang/String;ILcom/keepassdroid/database/PwGroup;Lcom/keepassdroid/database/edit/OnFinish;Z)Lcom/keepassdroid/database/edit/AddGroup;

    move-result-object v10

    .line 214
    .local v10, "task":Lcom/keepassdroid/database/edit/AddGroup;
    new-instance v9, Lcom/keepassdroid/ProgressTask;

    const v0, 0x7f060086

    invoke-direct {v9, v7, v10, v0}, Lcom/keepassdroid/ProgressTask;-><init>(Landroid/content/Context;Lcom/keepassdroid/database/edit/RunnableOnFinish;I)V

    .line 215
    .local v9, "pt":Lcom/keepassdroid/ProgressTask;
    invoke-virtual {v9}, Lcom/keepassdroid/ProgressTask;->run()V

    goto :goto_0

    .line 206
    :pswitch_data_0
    .packed-switch -0x1
        :pswitch_0
    .end packed-switch
.end method

.method public onContextItemSelected(Landroid/view/MenuItem;)Z
    .locals 3
    .param p1, "item"    # Landroid/view/MenuItem;

    .prologue
    .line 197
    invoke-interface {p1}, Landroid/view/MenuItem;->getMenuInfo()Landroid/view/ContextMenu$ContextMenuInfo;

    move-result-object v0

    check-cast v0, Landroid/widget/AdapterView$AdapterContextMenuInfo;

    .line 198
    .local v0, "acmi":Landroid/widget/AdapterView$AdapterContextMenuInfo;
    iget-object v1, v0, Landroid/widget/AdapterView$AdapterContextMenuInfo;->targetView:Landroid/view/View;

    check-cast v1, Lcom/keepassdroid/view/ClickView;

    .line 200
    .local v1, "cv":Lcom/keepassdroid/view/ClickView;
    invoke-virtual {v1, p1}, Lcom/keepassdroid/view/ClickView;->onContextItemSelected(Landroid/view/MenuItem;)Z

    move-result v2

    return v2
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 10
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const v9, 0x7f0b005d

    const/4 v7, 0x0

    .line 105
    invoke-super {p0, p1}, Lcom/keepassdroid/GroupBaseActivity;->onCreate(Landroid/os/Bundle;)V

    .line 107
    invoke-virtual {p0}, Lcom/keepassdroid/GroupActivity;->isFinishing()Z

    move-result v6

    if-eqz v6, :cond_1

    .line 182
    :cond_0
    :goto_0
    return-void

    .line 111
    :cond_1
    invoke-virtual {p0, v7}, Lcom/keepassdroid/GroupActivity;->setResult(I)V

    .line 113
    const-string v6, "Group Activity:"

    const-string v8, "Creating group view"

    invoke-static {v6, v8}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 114
    invoke-virtual {p0}, Lcom/keepassdroid/GroupActivity;->getIntent()Landroid/content/Intent;

    move-result-object v4

    .line 116
    .local v4, "intent":Landroid/content/Intent;
    invoke-virtual {p0, v4}, Lcom/keepassdroid/GroupActivity;->retrieveGroupId(Landroid/content/Intent;)Lcom/keepassdroid/database/PwGroupId;

    move-result-object v3

    .line 118
    .local v3, "id":Lcom/keepassdroid/database/PwGroupId;
    invoke-static {}, Lcom/keepassdroid/app/App;->getDB()Lcom/keepassdroid/Database;

    move-result-object v2

    .line 119
    .local v2, "db":Lcom/keepassdroid/Database;
    iget-boolean v6, v2, Lcom/keepassdroid/Database;->readOnly:Z

    iput-boolean v6, p0, Lcom/keepassdroid/GroupActivity;->readOnly:Z

    .line 120
    iget-object v6, v2, Lcom/keepassdroid/Database;->pm:Lcom/keepassdroid/database/PwDatabase;

    iget-object v5, v6, Lcom/keepassdroid/database/PwDatabase;->rootGroup:Lcom/keepassdroid/database/PwGroup;

    .line 121
    .local v5, "root":Lcom/keepassdroid/database/PwGroup;
    if-nez v3, :cond_2

    .line 122
    iput-object v5, p0, Lcom/keepassdroid/GroupActivity;->mGroup:Lcom/keepassdroid/database/PwGroup;

    .line 127
    :goto_1
    const-string v6, "Group Activity:"

    const-string v8, "Retrieved group"

    invoke-static {v6, v8}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 128
    iget-object v6, p0, Lcom/keepassdroid/GroupActivity;->mGroup:Lcom/keepassdroid/database/PwGroup;

    if-nez v6, :cond_3

    .line 129
    const-string v6, "Group Activity:"

    const-string v7, "Group was null"

    invoke-static {v6, v7}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 124
    :cond_2
    iget-object v6, v2, Lcom/keepassdroid/Database;->pm:Lcom/keepassdroid/database/PwDatabase;

    iget-object v6, v6, Lcom/keepassdroid/database/PwDatabase;->groups:Ljava/util/Map;

    invoke-interface {v6, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/keepassdroid/database/PwGroup;

    iput-object v6, p0, Lcom/keepassdroid/GroupActivity;->mGroup:Lcom/keepassdroid/database/PwGroup;

    goto :goto_1

    .line 133
    :cond_3
    iget-object v6, p0, Lcom/keepassdroid/GroupActivity;->mGroup:Lcom/keepassdroid/database/PwGroup;

    if-ne v6, v5, :cond_6

    const/4 v6, 0x1

    :goto_2
    iput-boolean v6, p0, Lcom/keepassdroid/GroupActivity;->isRoot:Z

    .line 135
    invoke-virtual {p0}, Lcom/keepassdroid/GroupActivity;->setupButtons()V

    .line 137
    iget-boolean v6, p0, Lcom/keepassdroid/GroupActivity;->addGroupEnabled:Z

    if-eqz v6, :cond_7

    iget-boolean v6, p0, Lcom/keepassdroid/GroupActivity;->addEntryEnabled:Z

    if-eqz v6, :cond_7

    .line 138
    new-instance v6, Lcom/keepassdroid/view/GroupAddEntryView;

    invoke-direct {v6, p0}, Lcom/keepassdroid/view/GroupAddEntryView;-><init>(Landroid/content/Context;)V

    invoke-virtual {p0, v6}, Lcom/keepassdroid/GroupActivity;->setContentView(Landroid/view/View;)V

    .line 148
    :goto_3
    const-string v6, "Group Activity:"

    const-string v7, "Set view"

    invoke-static {v6, v7}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 150
    iget-boolean v6, p0, Lcom/keepassdroid/GroupActivity;->addGroupEnabled:Z

    if-eqz v6, :cond_4

    .line 152
    invoke-virtual {p0, v9}, Lcom/keepassdroid/GroupActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/Button;

    .line 153
    .local v1, "addGroup":Landroid/widget/Button;
    new-instance v6, Lcom/keepassdroid/GroupActivity$1;

    invoke-direct {v6, p0}, Lcom/keepassdroid/GroupActivity$1;-><init>(Lcom/keepassdroid/GroupActivity;)V

    invoke-virtual {v1, v6}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 161
    .end local v1    # "addGroup":Landroid/widget/Button;
    :cond_4
    iget-boolean v6, p0, Lcom/keepassdroid/GroupActivity;->addEntryEnabled:Z

    if-eqz v6, :cond_5

    .line 163
    const v6, 0x7f0b005e

    invoke-virtual {p0, v6}, Lcom/keepassdroid/GroupActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    .line 164
    .local v0, "addEntry":Landroid/widget/Button;
    new-instance v6, Lcom/keepassdroid/GroupActivity$2;

    invoke-direct {v6, p0}, Lcom/keepassdroid/GroupActivity$2;-><init>(Lcom/keepassdroid/GroupActivity;)V

    invoke-virtual {v0, v6}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 172
    .end local v0    # "addEntry":Landroid/widget/Button;
    :cond_5
    invoke-virtual {p0}, Lcom/keepassdroid/GroupActivity;->setGroupTitle()V

    .line 173
    invoke-virtual {p0}, Lcom/keepassdroid/GroupActivity;->setGroupIcon()V

    .line 175
    new-instance v6, Lcom/keepassdroid/PwGroupListAdapter;

    iget-object v7, p0, Lcom/keepassdroid/GroupActivity;->mGroup:Lcom/keepassdroid/database/PwGroup;

    invoke-direct {v6, p0, v7}, Lcom/keepassdroid/PwGroupListAdapter;-><init>(Lcom/keepassdroid/GroupBaseActivity;Lcom/keepassdroid/database/PwGroup;)V

    invoke-virtual {p0, v6}, Lcom/keepassdroid/GroupActivity;->setListAdapter(Landroid/widget/ListAdapter;)V

    .line 176
    invoke-virtual {p0}, Lcom/keepassdroid/GroupActivity;->getListView()Landroid/widget/ListView;

    move-result-object v6

    invoke-virtual {p0, v6}, Lcom/keepassdroid/GroupActivity;->registerForContextMenu(Landroid/view/View;)V

    .line 177
    const-string v6, "Group Activity:"

    const-string v7, "Finished creating group"

    invoke-static {v6, v7}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 179
    iget-boolean v6, p0, Lcom/keepassdroid/GroupActivity;->isRoot:Z

    if-eqz v6, :cond_0

    .line 180
    invoke-virtual {p0}, Lcom/keepassdroid/GroupActivity;->showWarnings()V

    goto/16 :goto_0

    :cond_6
    move v6, v7

    .line 133
    goto :goto_2

    .line 139
    :cond_7
    iget-boolean v6, p0, Lcom/keepassdroid/GroupActivity;->addGroupEnabled:Z

    if-eqz v6, :cond_8

    .line 140
    new-instance v6, Lcom/keepassdroid/view/GroupRootView;

    invoke-direct {v6, p0}, Lcom/keepassdroid/view/GroupRootView;-><init>(Landroid/content/Context;)V

    invoke-virtual {p0, v6}, Lcom/keepassdroid/GroupActivity;->setContentView(Landroid/view/View;)V

    goto :goto_3

    .line 141
    :cond_8
    iget-boolean v6, p0, Lcom/keepassdroid/GroupActivity;->addEntryEnabled:Z

    if-eqz v6, :cond_9

    .line 142
    new-instance v6, Lcom/keepassdroid/view/GroupAddEntryView;

    invoke-direct {v6, p0}, Lcom/keepassdroid/view/GroupAddEntryView;-><init>(Landroid/content/Context;)V

    invoke-virtual {p0, v6}, Lcom/keepassdroid/GroupActivity;->setContentView(Landroid/view/View;)V

    .line 143
    invoke-virtual {p0, v9}, Lcom/keepassdroid/GroupActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/Button;

    .line 144
    .restart local v1    # "addGroup":Landroid/widget/Button;
    const/16 v6, 0x8

    invoke-virtual {v1, v6}, Landroid/widget/Button;->setVisibility(I)V

    goto :goto_3

    .line 146
    .end local v1    # "addGroup":Landroid/widget/Button;
    :cond_9
    new-instance v6, Lcom/keepassdroid/view/GroupViewOnlyView;

    invoke-direct {v6, p0}, Lcom/keepassdroid/view/GroupViewOnlyView;-><init>(Landroid/content/Context;)V

    invoke-virtual {p0, v6}, Lcom/keepassdroid/GroupActivity;->setContentView(Landroid/view/View;)V

    goto/16 :goto_3
.end method

.method public onCreateContextMenu(Landroid/view/ContextMenu;Landroid/view/View;Landroid/view/ContextMenu$ContextMenuInfo;)V
    .locals 2
    .param p1, "menu"    # Landroid/view/ContextMenu;
    .param p2, "v"    # Landroid/view/View;
    .param p3, "menuInfo"    # Landroid/view/ContextMenu$ContextMenuInfo;

    .prologue
    .line 188
    move-object v0, p3

    check-cast v0, Landroid/widget/AdapterView$AdapterContextMenuInfo;

    .line 189
    .local v0, "acmi":Landroid/widget/AdapterView$AdapterContextMenuInfo;
    iget-object v1, v0, Landroid/widget/AdapterView$AdapterContextMenuInfo;->targetView:Landroid/view/View;

    check-cast v1, Lcom/keepassdroid/view/ClickView;

    .line 190
    .local v1, "cv":Lcom/keepassdroid/view/ClickView;
    invoke-virtual {v1, p1, p3}, Lcom/keepassdroid/view/ClickView;->onCreateMenu(Landroid/view/ContextMenu;Landroid/view/ContextMenu$ContextMenuInfo;)V

    .line 191
    return-void
.end method

.method protected abstract retrieveGroupId(Landroid/content/Intent;)Lcom/keepassdroid/database/PwGroupId;
.end method

.method protected setupButtons()V
    .locals 1

    .prologue
    .line 100
    iget-boolean v0, p0, Lcom/keepassdroid/GroupActivity;->readOnly:Z

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    iput-boolean v0, p0, Lcom/keepassdroid/GroupActivity;->addGroupEnabled:Z

    .line 101
    return-void

    .line 100
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method protected showWarnings()V
    .locals 4

    .prologue
    .line 225
    invoke-static {}, Lcom/keepassdroid/app/App;->getDB()Lcom/keepassdroid/Database;

    move-result-object v2

    iget-boolean v2, v2, Lcom/keepassdroid/Database;->readOnly:Z

    if-eqz v2, :cond_0

    .line 226
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v1

    .line 228
    .local v1, "prefs":Landroid/content/SharedPreferences;
    const v2, 0x7f0600c9

    invoke-virtual {p0, v2}, Lcom/keepassdroid/GroupActivity;->getString(I)Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x1

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 229
    new-instance v0, Lcom/keepassdroid/dialog/ReadOnlyDialog;

    invoke-direct {v0, p0}, Lcom/keepassdroid/dialog/ReadOnlyDialog;-><init>(Landroid/content/Context;)V

    .line 230
    .local v0, "dialog":Landroid/app/Dialog;
    invoke-virtual {v0}, Landroid/app/Dialog;->show()V

    .line 233
    .end local v0    # "dialog":Landroid/app/Dialog;
    .end local v1    # "prefs":Landroid/content/SharedPreferences;
    :cond_0
    return-void
.end method
