.class public Lcom/keepassdroid/view/GroupViewOnlyView;
.super Landroid/widget/RelativeLayout;
.source "GroupViewOnlyView.java"


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 33
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/keepassdroid/view/GroupViewOnlyView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 34
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 37
    invoke-direct {p0, p1, p2}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 39
    invoke-direct {p0, p1}, Lcom/keepassdroid/view/GroupViewOnlyView;->inflate(Landroid/content/Context;)V

    .line 40
    return-void
.end method

.method private inflate(Landroid/content/Context;)V
    .locals 8
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/4 v7, 0x4

    .line 43
    const-string v6, "layout_inflater"

    invoke-virtual {p1, v6}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/view/LayoutInflater;

    .line 44
    .local v3, "inflater":Landroid/view/LayoutInflater;
    const v6, 0x7f03000f

    invoke-virtual {v3, v6, p0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 47
    const v6, 0x7f0b005d

    invoke-virtual {p0, v6}, Lcom/keepassdroid/view/GroupViewOnlyView;->findViewById(I)Landroid/view/View;

    move-result-object v1

    .line 48
    .local v1, "addGroup":Landroid/view/View;
    invoke-virtual {v1, v7}, Landroid/view/View;->setVisibility(I)V

    .line 50
    const v6, 0x7f0b005e

    invoke-virtual {p0, v6}, Lcom/keepassdroid/view/GroupViewOnlyView;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .line 51
    .local v0, "addEntry":Landroid/view/View;
    invoke-virtual {v0, v7}, Landroid/view/View;->setVisibility(I)V

    .line 53
    const v6, 0x7f0b0004

    invoke-virtual {p0, v6}, Lcom/keepassdroid/view/GroupViewOnlyView;->findViewById(I)Landroid/view/View;

    move-result-object v2

    .line 54
    .local v2, "divider2":Landroid/view/View;
    invoke-virtual {v2, v7}, Landroid/view/View;->setVisibility(I)V

    .line 56
    const v6, 0x102000a

    invoke-virtual {p0, v6}, Lcom/keepassdroid/view/GroupViewOnlyView;->findViewById(I)Landroid/view/View;

    move-result-object v4

    .line 57
    .local v4, "list":Landroid/view/View;
    invoke-virtual {v4}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v5

    check-cast v5, Landroid/widget/RelativeLayout$LayoutParams;

    .line 58
    .local v5, "lp":Landroid/widget/RelativeLayout$LayoutParams;
    const/16 v6, 0xc

    const/4 v7, -0x1

    invoke-virtual {v5, v6, v7}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    .line 61
    return-void
.end method
