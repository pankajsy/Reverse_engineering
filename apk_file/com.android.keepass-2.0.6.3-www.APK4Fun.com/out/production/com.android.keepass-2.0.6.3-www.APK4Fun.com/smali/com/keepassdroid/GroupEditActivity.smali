.class public Lcom/keepassdroid/GroupEditActivity;
.super Landroid/app/Activity;
.source "GroupEditActivity.java"


# static fields
.field public static final KEY_ICON_ID:Ljava/lang/String; = "icon_id"

.field public static final KEY_NAME:Ljava/lang/String; = "name"


# instance fields
.field private mSelectedIconID:I


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 34
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    return-void
.end method

.method public static Launch(Landroid/app/Activity;)V
    .locals 2
    .param p0, "act"    # Landroid/app/Activity;

    .prologue
    .line 42
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/keepassdroid/GroupEditActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 43
    .local v0, "i":Landroid/content/Intent;
    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Landroid/app/Activity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 44
    return-void
.end method

.method static synthetic access$000(Lcom/keepassdroid/GroupEditActivity;)I
    .locals 1
    .param p0, "x0"    # Lcom/keepassdroid/GroupEditActivity;

    .prologue
    .line 34
    iget v0, p0, Lcom/keepassdroid/GroupEditActivity;->mSelectedIconID:I

    return v0
.end method


# virtual methods
.method protected onActivityResult(IILandroid/content/Intent;)V
    .locals 3
    .param p1, "requestCode"    # I
    .param p2, "resultCode"    # I
    .param p3, "data"    # Landroid/content/Intent;

    .prologue
    .line 102
    packed-switch p2, :pswitch_data_0

    .line 114
    :goto_0
    return-void

    .line 105
    :pswitch_0
    invoke-virtual {p3}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v1

    const-string v2, "icon_id"

    invoke-virtual {v1, v2}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v1

    iput v1, p0, Lcom/keepassdroid/GroupEditActivity;->mSelectedIconID:I

    .line 106
    const v1, 0x7f0b0016

    invoke-virtual {p0, v1}, Lcom/keepassdroid/GroupEditActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageButton;

    .line 107
    .local v0, "currIconButton":Landroid/widget/ImageButton;
    iget v1, p0, Lcom/keepassdroid/GroupEditActivity;->mSelectedIconID:I

    invoke-static {v1}, Lcom/keepassdroid/icons/Icons;->iconToResId(I)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setImageResource(I)V

    goto :goto_0

    .line 102
    nop

    :pswitch_data_0
    .packed-switch 0x3e8
        :pswitch_0
    .end packed-switch
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 4
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 48
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 49
    const v3, 0x7f030010

    invoke-virtual {p0, v3}, Lcom/keepassdroid/GroupEditActivity;->setContentView(I)V

    .line 50
    const v3, 0x7f06000b

    invoke-virtual {p0, v3}, Lcom/keepassdroid/GroupEditActivity;->setTitle(I)V

    .line 52
    const v3, 0x7f0b0016

    invoke-virtual {p0, v3}, Lcom/keepassdroid/GroupEditActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageButton;

    .line 53
    .local v1, "iconButton":Landroid/widget/ImageButton;
    new-instance v3, Lcom/keepassdroid/GroupEditActivity$1;

    invoke-direct {v3, p0}, Lcom/keepassdroid/GroupEditActivity$1;-><init>(Lcom/keepassdroid/GroupEditActivity;)V

    invoke-virtual {v1, v3}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 61
    const v3, 0x7f0b0060

    invoke-virtual {p0, v3}, Lcom/keepassdroid/GroupEditActivity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/Button;

    .line 62
    .local v2, "okButton":Landroid/widget/Button;
    new-instance v3, Lcom/keepassdroid/GroupEditActivity$2;

    invoke-direct {v3, p0}, Lcom/keepassdroid/GroupEditActivity$2;-><init>(Lcom/keepassdroid/GroupEditActivity;)V

    invoke-virtual {v2, v3}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 86
    const v3, 0x7f0b000e

    invoke-virtual {p0, v3}, Lcom/keepassdroid/GroupEditActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    .line 87
    .local v0, "cancel":Landroid/widget/Button;
    new-instance v3, Lcom/keepassdroid/GroupEditActivity$3;

    invoke-direct {v3, p0}, Lcom/keepassdroid/GroupEditActivity$3;-><init>(Lcom/keepassdroid/GroupEditActivity;)V

    invoke-virtual {v0, v3}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 97
    return-void
.end method
