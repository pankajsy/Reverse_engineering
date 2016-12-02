.class public Lcom/keepassdroid/view/PwGroupViewV3;
.super Lcom/keepassdroid/view/PwGroupView;
.source "PwGroupViewV3.java"


# static fields
.field private static final MENU_DELETE:I = 0x2


# direct methods
.method protected constructor <init>(Lcom/keepassdroid/GroupBaseActivity;Lcom/keepassdroid/database/PwGroup;)V
    .locals 0
    .param p1, "act"    # Lcom/keepassdroid/GroupBaseActivity;
    .param p2, "pw"    # Lcom/keepassdroid/database/PwGroup;

    .prologue
    .line 39
    invoke-direct {p0, p1, p2}, Lcom/keepassdroid/view/PwGroupView;-><init>(Lcom/keepassdroid/GroupBaseActivity;Lcom/keepassdroid/database/PwGroup;)V

    .line 40
    return-void
.end method


# virtual methods
.method public onContextItemSelected(Landroid/view/MenuItem;)Z
    .locals 8
    .param p1, "item"    # Landroid/view/MenuItem;

    .prologue
    .line 54
    invoke-super {p0, p1}, Lcom/keepassdroid/view/PwGroupView;->onContextItemSelected(Landroid/view/MenuItem;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 55
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v3

    packed-switch v3, :pswitch_data_0

    .line 66
    :cond_0
    const/4 v3, 0x0

    :goto_0
    return v3

    .line 57
    :pswitch_0
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    .line 58
    .local v0, "handler":Landroid/os/Handler;
    new-instance v2, Lcom/keepassdroid/database/edit/DeleteGroup;

    invoke-static {}, Lcom/keepassdroid/app/App;->getDB()Lcom/keepassdroid/Database;

    move-result-object v3

    iget-object v4, p0, Lcom/keepassdroid/view/PwGroupViewV3;->mPw:Lcom/keepassdroid/database/PwGroup;

    iget-object v5, p0, Lcom/keepassdroid/view/PwGroupViewV3;->mAct:Lcom/keepassdroid/GroupBaseActivity;

    new-instance v6, Lcom/keepassdroid/GroupBaseActivity$AfterDeleteGroup;

    iget-object v7, p0, Lcom/keepassdroid/view/PwGroupViewV3;->mAct:Lcom/keepassdroid/GroupBaseActivity;

    invoke-virtual {v7}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-direct {v6, v7, v0}, Lcom/keepassdroid/GroupBaseActivity$AfterDeleteGroup;-><init>(Lcom/keepassdroid/GroupBaseActivity;Landroid/os/Handler;)V

    invoke-direct {v2, v3, v4, v5, v6}, Lcom/keepassdroid/database/edit/DeleteGroup;-><init>(Lcom/keepassdroid/Database;Lcom/keepassdroid/database/PwGroup;Lcom/keepassdroid/GroupBaseActivity;Lcom/keepassdroid/database/edit/OnFinish;)V

    .line 59
    .local v2, "task":Lcom/keepassdroid/database/edit/DeleteGroup;
    new-instance v1, Lcom/keepassdroid/ProgressTask;

    iget-object v3, p0, Lcom/keepassdroid/view/PwGroupViewV3;->mAct:Lcom/keepassdroid/GroupBaseActivity;

    const v4, 0x7f060086

    invoke-direct {v1, v3, v2, v4}, Lcom/keepassdroid/ProgressTask;-><init>(Landroid/content/Context;Lcom/keepassdroid/database/edit/RunnableOnFinish;I)V

    .line 60
    .local v1, "pt":Lcom/keepassdroid/ProgressTask;
    invoke-virtual {v1}, Lcom/keepassdroid/ProgressTask;->run()V

    .line 61
    const/4 v3, 0x1

    goto :goto_0

    .line 55
    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_0
    .end packed-switch
.end method

.method public onCreateMenu(Landroid/view/ContextMenu;Landroid/view/ContextMenu$ContextMenuInfo;)V
    .locals 3
    .param p1, "menu"    # Landroid/view/ContextMenu;
    .param p2, "menuInfo"    # Landroid/view/ContextMenu$ContextMenuInfo;

    .prologue
    const/4 v2, 0x0

    .line 44
    invoke-super {p0, p1, p2}, Lcom/keepassdroid/view/PwGroupView;->onCreateMenu(Landroid/view/ContextMenu;Landroid/view/ContextMenu$ContextMenuInfo;)V

    .line 46
    iget-boolean v0, p0, Lcom/keepassdroid/view/PwGroupViewV3;->readOnly:Z

    if-nez v0, :cond_0

    .line 47
    const/4 v0, 0x2

    const v1, 0x7f060067

    invoke-interface {p1, v2, v0, v2, v1}, Landroid/view/ContextMenu;->add(IIII)Landroid/view/MenuItem;

    .line 50
    :cond_0
    return-void
.end method
