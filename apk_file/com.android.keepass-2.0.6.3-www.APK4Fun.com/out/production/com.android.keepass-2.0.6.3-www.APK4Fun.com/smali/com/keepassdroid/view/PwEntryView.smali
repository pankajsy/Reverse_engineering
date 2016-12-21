.class public Lcom/keepassdroid/view/PwEntryView;
.super Lcom/keepassdroid/view/ClickView;
.source "PwEntryView.java"


# static fields
.field private static final MENU_DELETE:I = 0x2

.field protected static final MENU_OPEN:I = 0x1


# instance fields
.field protected mAct:Lcom/keepassdroid/GroupBaseActivity;

.field private mPos:I

.field protected mPw:Lcom/keepassdroid/database/PwEntry;

.field private mTv:Landroid/widget/TextView;


# direct methods
.method protected constructor <init>(Lcom/keepassdroid/GroupBaseActivity;Lcom/keepassdroid/database/PwEntry;I)V
    .locals 5
    .param p1, "act"    # Lcom/keepassdroid/GroupBaseActivity;
    .param p2, "pw"    # Lcom/keepassdroid/database/PwEntry;
    .param p3, "pos"    # I

    .prologue
    .line 56
    invoke-direct {p0, p1}, Lcom/keepassdroid/view/ClickView;-><init>(Landroid/content/Context;)V

    .line 57
    iput-object p1, p0, Lcom/keepassdroid/view/PwEntryView;->mAct:Lcom/keepassdroid/GroupBaseActivity;

    .line 59
    iget-object v2, p0, Lcom/keepassdroid/view/PwEntryView;->mAct:Lcom/keepassdroid/GroupBaseActivity;

    const v3, 0x7f030005

    const/4 v4, 0x0

    invoke-static {v2, v3, v4}, Landroid/view/View;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    .line 60
    .local v0, "ev":Landroid/view/View;
    const v2, 0x7f0b0030

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    iput-object v2, p0, Lcom/keepassdroid/view/PwEntryView;->mTv:Landroid/widget/TextView;

    .line 61
    iget-object v2, p0, Lcom/keepassdroid/view/PwEntryView;->mTv:Landroid/widget/TextView;

    invoke-static {p1}, Lcom/keepassdroid/settings/PrefsUtil;->getListTextSize(Landroid/content/Context;)F

    move-result v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setTextSize(F)V

    .line 63
    invoke-direct {p0, v0, p2, p3}, Lcom/keepassdroid/view/PwEntryView;->populateView(Landroid/view/View;Lcom/keepassdroid/database/PwEntry;I)V

    .line 65
    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v2, -0x1

    const/4 v3, -0x2

    invoke-direct {v1, v2, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 67
    .local v1, "lp":Landroid/widget/LinearLayout$LayoutParams;
    invoke-virtual {p0, v0, v1}, Lcom/keepassdroid/view/PwEntryView;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 69
    return-void
.end method

.method private deleteEntry()V
    .locals 8

    .prologue
    .line 99
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    .line 100
    .local v0, "handler":Landroid/os/Handler;
    new-instance v2, Lcom/keepassdroid/database/edit/DeleteEntry;

    iget-object v3, p0, Lcom/keepassdroid/view/PwEntryView;->mAct:Lcom/keepassdroid/GroupBaseActivity;

    invoke-static {}, Lcom/keepassdroid/app/App;->getDB()Lcom/keepassdroid/Database;

    move-result-object v4

    iget-object v5, p0, Lcom/keepassdroid/view/PwEntryView;->mPw:Lcom/keepassdroid/database/PwEntry;

    new-instance v6, Lcom/keepassdroid/GroupBaseActivity$RefreshTask;

    iget-object v7, p0, Lcom/keepassdroid/view/PwEntryView;->mAct:Lcom/keepassdroid/GroupBaseActivity;

    invoke-virtual {v7}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-direct {v6, v7, v0}, Lcom/keepassdroid/GroupBaseActivity$RefreshTask;-><init>(Lcom/keepassdroid/GroupBaseActivity;Landroid/os/Handler;)V

    invoke-direct {v2, v3, v4, v5, v6}, Lcom/keepassdroid/database/edit/DeleteEntry;-><init>(Landroid/content/Context;Lcom/keepassdroid/Database;Lcom/keepassdroid/database/PwEntry;Lcom/keepassdroid/database/edit/OnFinish;)V

    .line 101
    .local v2, "task":Lcom/keepassdroid/database/edit/DeleteEntry;
    new-instance v1, Lcom/keepassdroid/ProgressTask;

    iget-object v3, p0, Lcom/keepassdroid/view/PwEntryView;->mAct:Lcom/keepassdroid/GroupBaseActivity;

    const v4, 0x7f060086

    invoke-direct {v1, v3, v2, v4}, Lcom/keepassdroid/ProgressTask;-><init>(Landroid/content/Context;Lcom/keepassdroid/database/edit/RunnableOnFinish;I)V

    .line 102
    .local v1, "pt":Lcom/keepassdroid/ProgressTask;
    invoke-virtual {v1}, Lcom/keepassdroid/ProgressTask;->run()V

    .line 104
    return-void
.end method

.method public static getInstance(Lcom/keepassdroid/GroupBaseActivity;Lcom/keepassdroid/database/PwEntry;I)Lcom/keepassdroid/view/PwEntryView;
    .locals 1
    .param p0, "act"    # Lcom/keepassdroid/GroupBaseActivity;
    .param p1, "pw"    # Lcom/keepassdroid/database/PwEntry;
    .param p2, "pos"    # I

    .prologue
    .line 52
    new-instance v0, Lcom/keepassdroid/view/PwEntryView;

    invoke-direct {v0, p0, p1, p2}, Lcom/keepassdroid/view/PwEntryView;-><init>(Lcom/keepassdroid/GroupBaseActivity;Lcom/keepassdroid/database/PwEntry;I)V

    return-object v0
.end method

.method private launchEntry()V
    .locals 3

    .prologue
    .line 94
    iget-object v0, p0, Lcom/keepassdroid/view/PwEntryView;->mAct:Lcom/keepassdroid/GroupBaseActivity;

    iget-object v1, p0, Lcom/keepassdroid/view/PwEntryView;->mPw:Lcom/keepassdroid/database/PwEntry;

    iget v2, p0, Lcom/keepassdroid/view/PwEntryView;->mPos:I

    invoke-static {v0, v1, v2}, Lcom/keepassdroid/EntryActivity;->Launch(Landroid/app/Activity;Lcom/keepassdroid/database/PwEntry;I)V

    .line 96
    return-void
.end method

.method private populateView(Landroid/view/View;Lcom/keepassdroid/database/PwEntry;I)V
    .locals 4
    .param p1, "ev"    # Landroid/view/View;
    .param p2, "pw"    # Lcom/keepassdroid/database/PwEntry;
    .param p3, "pos"    # I

    .prologue
    .line 72
    iput-object p2, p0, Lcom/keepassdroid/view/PwEntryView;->mPw:Lcom/keepassdroid/database/PwEntry;

    .line 73
    iput p3, p0, Lcom/keepassdroid/view/PwEntryView;->mPos:I

    .line 75
    const v1, 0x7f0b002f

    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    .line 76
    .local v0, "iv":Landroid/widget/ImageView;
    invoke-static {}, Lcom/keepassdroid/app/App;->getDB()Lcom/keepassdroid/Database;

    move-result-object v1

    iget-object v1, v1, Lcom/keepassdroid/Database;->drawFactory:Lcom/keepassdroid/icons/DrawableFactory;

    invoke-virtual {p0}, Lcom/keepassdroid/view/PwEntryView;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {p2}, Lcom/keepassdroid/database/PwEntry;->getIcon()Lcom/keepassdroid/database/PwIcon;

    move-result-object v3

    invoke-virtual {v1, v0, v2, v3}, Lcom/keepassdroid/icons/DrawableFactory;->assignDrawableTo(Landroid/widget/ImageView;Landroid/content/res/Resources;Lcom/keepassdroid/database/PwIcon;)V

    .line 78
    iget-object v1, p0, Lcom/keepassdroid/view/PwEntryView;->mTv:Landroid/widget/TextView;

    iget-object v2, p0, Lcom/keepassdroid/view/PwEntryView;->mPw:Lcom/keepassdroid/database/PwEntry;

    invoke-virtual {v2}, Lcom/keepassdroid/database/PwEntry;->getDisplayTitle()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 79
    return-void
.end method


# virtual methods
.method public convertView(Lcom/keepassdroid/database/PwEntry;I)V
    .locals 0
    .param p1, "pw"    # Lcom/keepassdroid/database/PwEntry;
    .param p2, "pos"    # I

    .prologue
    .line 82
    invoke-direct {p0, p0, p1, p2}, Lcom/keepassdroid/view/PwEntryView;->populateView(Landroid/view/View;Lcom/keepassdroid/database/PwEntry;I)V

    .line 83
    return-void
.end method

.method public onClick()V
    .locals 0

    .prologue
    .line 90
    invoke-direct {p0}, Lcom/keepassdroid/view/PwEntryView;->launchEntry()V

    .line 91
    return-void
.end method

.method public onContextItemSelected(Landroid/view/MenuItem;)Z
    .locals 2
    .param p1, "item"    # Landroid/view/MenuItem;

    .prologue
    const/4 v0, 0x1

    .line 116
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v1

    packed-switch v1, :pswitch_data_0

    .line 126
    const/4 v0, 0x0

    :goto_0
    return v0

    .line 119
    :pswitch_0
    invoke-direct {p0}, Lcom/keepassdroid/view/PwEntryView;->launchEntry()V

    goto :goto_0

    .line 122
    :pswitch_1
    invoke-direct {p0}, Lcom/keepassdroid/view/PwEntryView;->deleteEntry()V

    goto :goto_0

    .line 116
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public onCreateMenu(Landroid/view/ContextMenu;Landroid/view/ContextMenu$ContextMenuInfo;)V
    .locals 3
    .param p1, "menu"    # Landroid/view/ContextMenu;
    .param p2, "menuInfo"    # Landroid/view/ContextMenu$ContextMenuInfo;

    .prologue
    const/4 v2, 0x0

    .line 108
    const/4 v0, 0x1

    const v1, 0x7f06006d

    invoke-interface {p1, v2, v0, v2, v1}, Landroid/view/ContextMenu;->add(IIII)Landroid/view/MenuItem;

    .line 109
    iget-boolean v0, p0, Lcom/keepassdroid/view/PwEntryView;->readOnly:Z

    if-nez v0, :cond_0

    .line 110
    const/4 v0, 0x2

    const v1, 0x7f060067

    invoke-interface {p1, v2, v0, v2, v1}, Landroid/view/ContextMenu;->add(IIII)Landroid/view/MenuItem;

    .line 112
    :cond_0
    return-void
.end method

.method public refreshTitle()V
    .locals 2

    .prologue
    .line 86
    iget-object v0, p0, Lcom/keepassdroid/view/PwEntryView;->mTv:Landroid/widget/TextView;

    iget-object v1, p0, Lcom/keepassdroid/view/PwEntryView;->mPw:Lcom/keepassdroid/database/PwEntry;

    invoke-virtual {v1}, Lcom/keepassdroid/database/PwEntry;->getDisplayTitle()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 87
    return-void
.end method
