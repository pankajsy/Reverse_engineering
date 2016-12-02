.class public Lcom/keepassdroid/view/PwGroupView;
.super Lcom/keepassdroid/view/ClickView;
.source "PwGroupView.java"


# static fields
.field protected static final MENU_OPEN:I = 0x1


# instance fields
.field protected mAct:Lcom/keepassdroid/GroupBaseActivity;

.field protected mPw:Lcom/keepassdroid/database/PwGroup;

.field protected mTv:Landroid/widget/TextView;


# direct methods
.method protected constructor <init>(Lcom/keepassdroid/GroupBaseActivity;Lcom/keepassdroid/database/PwGroup;)V
    .locals 6
    .param p1, "act"    # Lcom/keepassdroid/GroupBaseActivity;
    .param p2, "pw"    # Lcom/keepassdroid/database/PwGroup;

    .prologue
    .line 57
    invoke-direct {p0, p1}, Lcom/keepassdroid/view/ClickView;-><init>(Landroid/content/Context;)V

    .line 58
    iput-object p1, p0, Lcom/keepassdroid/view/PwGroupView;->mAct:Lcom/keepassdroid/GroupBaseActivity;

    .line 60
    const v4, 0x7f030013

    const/4 v5, 0x0

    invoke-static {p1, v4, v5}, Landroid/view/View;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    .line 62
    .local v0, "gv":Landroid/view/View;
    const v4, 0x7f0b0064

    invoke-virtual {v0, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    iput-object v4, p0, Lcom/keepassdroid/view/PwGroupView;->mTv:Landroid/widget/TextView;

    .line 63
    invoke-static {p1}, Lcom/keepassdroid/settings/PrefsUtil;->getListTextSize(Landroid/content/Context;)F

    move-result v3

    .line 64
    .local v3, "size":F
    iget-object v4, p0, Lcom/keepassdroid/view/PwGroupView;->mTv:Landroid/widget/TextView;

    invoke-virtual {v4, v3}, Landroid/widget/TextView;->setTextSize(F)V

    .line 66
    const v4, 0x7f0b0065

    invoke-virtual {v0, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    .line 67
    .local v1, "label":Landroid/widget/TextView;
    const/high16 v4, 0x41000000    # 8.0f

    sub-float v4, v3, v4

    invoke-virtual {v1, v4}, Landroid/widget/TextView;->setTextSize(F)V

    .line 69
    invoke-direct {p0, v0, p2}, Lcom/keepassdroid/view/PwGroupView;->populateView(Landroid/view/View;Lcom/keepassdroid/database/PwGroup;)V

    .line 71
    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v4, -0x1

    const/4 v5, -0x2

    invoke-direct {v2, v4, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 73
    .local v2, "lp":Landroid/widget/LinearLayout$LayoutParams;
    invoke-virtual {p0, v0, v2}, Lcom/keepassdroid/view/PwGroupView;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 74
    return-void
.end method

.method public static getInstance(Lcom/keepassdroid/GroupBaseActivity;Lcom/keepassdroid/database/PwGroup;)Lcom/keepassdroid/view/PwGroupView;
    .locals 1
    .param p0, "act"    # Lcom/keepassdroid/GroupBaseActivity;
    .param p1, "pw"    # Lcom/keepassdroid/database/PwGroup;

    .prologue
    .line 49
    instance-of v0, p1, Lcom/keepassdroid/database/PwGroupV3;

    if-eqz v0, :cond_0

    .line 50
    new-instance v0, Lcom/keepassdroid/view/PwGroupViewV3;

    invoke-direct {v0, p0, p1}, Lcom/keepassdroid/view/PwGroupViewV3;-><init>(Lcom/keepassdroid/GroupBaseActivity;Lcom/keepassdroid/database/PwGroup;)V

    .line 52
    :goto_0
    return-object v0

    :cond_0
    new-instance v0, Lcom/keepassdroid/view/PwGroupView;

    invoke-direct {v0, p0, p1}, Lcom/keepassdroid/view/PwGroupView;-><init>(Lcom/keepassdroid/GroupBaseActivity;Lcom/keepassdroid/database/PwGroup;)V

    goto :goto_0
.end method

.method private launchGroup()V
    .locals 2

    .prologue
    .line 94
    iget-object v0, p0, Lcom/keepassdroid/view/PwGroupView;->mAct:Lcom/keepassdroid/GroupBaseActivity;

    iget-object v1, p0, Lcom/keepassdroid/view/PwGroupView;->mPw:Lcom/keepassdroid/database/PwGroup;

    invoke-static {v0, v1}, Lcom/keepassdroid/GroupActivity;->Launch(Landroid/app/Activity;Lcom/keepassdroid/database/PwGroup;)V

    .line 95
    return-void
.end method

.method private populateView(Landroid/view/View;Lcom/keepassdroid/database/PwGroup;)V
    .locals 4
    .param p1, "gv"    # Landroid/view/View;
    .param p2, "pw"    # Lcom/keepassdroid/database/PwGroup;

    .prologue
    .line 77
    iput-object p2, p0, Lcom/keepassdroid/view/PwGroupView;->mPw:Lcom/keepassdroid/database/PwGroup;

    .line 79
    const v1, 0x7f0b0063

    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    .line 80
    .local v0, "iv":Landroid/widget/ImageView;
    invoke-static {}, Lcom/keepassdroid/app/App;->getDB()Lcom/keepassdroid/Database;

    move-result-object v1

    iget-object v1, v1, Lcom/keepassdroid/Database;->drawFactory:Lcom/keepassdroid/icons/DrawableFactory;

    invoke-virtual {p0}, Lcom/keepassdroid/view/PwGroupView;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {p2}, Lcom/keepassdroid/database/PwGroup;->getIcon()Lcom/keepassdroid/database/PwIcon;

    move-result-object v3

    invoke-virtual {v1, v0, v2, v3}, Lcom/keepassdroid/icons/DrawableFactory;->assignDrawableTo(Landroid/widget/ImageView;Landroid/content/res/Resources;Lcom/keepassdroid/database/PwIcon;)V

    .line 82
    iget-object v1, p0, Lcom/keepassdroid/view/PwGroupView;->mTv:Landroid/widget/TextView;

    invoke-virtual {p2}, Lcom/keepassdroid/database/PwGroup;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 83
    return-void
.end method


# virtual methods
.method public convertView(Lcom/keepassdroid/database/PwGroup;)V
    .locals 0
    .param p1, "pw"    # Lcom/keepassdroid/database/PwGroup;

    .prologue
    .line 86
    invoke-direct {p0, p0, p1}, Lcom/keepassdroid/view/PwGroupView;->populateView(Landroid/view/View;Lcom/keepassdroid/database/PwGroup;)V

    .line 87
    return-void
.end method

.method public onClick()V
    .locals 0

    .prologue
    .line 90
    invoke-direct {p0}, Lcom/keepassdroid/view/PwGroupView;->launchGroup()V

    .line 91
    return-void
.end method

.method public onContextItemSelected(Landroid/view/MenuItem;)Z
    .locals 1
    .param p1, "item"    # Landroid/view/MenuItem;

    .prologue
    .line 104
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    .line 111
    const/4 v0, 0x0

    :goto_0
    return v0

    .line 107
    :pswitch_0
    invoke-direct {p0}, Lcom/keepassdroid/view/PwGroupView;->launchGroup()V

    .line 108
    const/4 v0, 0x1

    goto :goto_0

    .line 104
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
    .end packed-switch
.end method

.method public onCreateMenu(Landroid/view/ContextMenu;Landroid/view/ContextMenu$ContextMenuInfo;)V
    .locals 3
    .param p1, "menu"    # Landroid/view/ContextMenu;
    .param p2, "menuInfo"    # Landroid/view/ContextMenu$ContextMenuInfo;

    .prologue
    const/4 v2, 0x0

    .line 99
    const/4 v0, 0x1

    const v1, 0x7f06006d

    invoke-interface {p1, v2, v0, v2, v1}, Landroid/view/ContextMenu;->add(IIII)Landroid/view/MenuItem;

    .line 100
    return-void
.end method
