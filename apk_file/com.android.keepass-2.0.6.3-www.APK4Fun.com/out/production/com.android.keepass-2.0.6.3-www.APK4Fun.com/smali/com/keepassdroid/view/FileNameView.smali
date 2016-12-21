.class public Lcom/keepassdroid/view/FileNameView;
.super Landroid/widget/RelativeLayout;
.source "FileNameView.java"


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 34
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/keepassdroid/view/FileNameView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 35
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 38
    invoke-direct {p0, p1, p2}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 40
    invoke-direct {p0, p1}, Lcom/keepassdroid/view/FileNameView;->inflate(Landroid/content/Context;)V

    .line 41
    return-void
.end method

.method private inflate(Landroid/content/Context;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 46
    const-string v1, "layout_inflater"

    invoke-virtual {p1, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/LayoutInflater;

    .line 47
    .local v0, "inflater":Landroid/view/LayoutInflater;
    const v1, 0x7f03000c

    invoke-virtual {v0, v1, p0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 48
    return-void
.end method


# virtual methods
.method public updateExternalStorageWarning()V
    .locals 8

    .prologue
    const v7, 0x7f0b0043

    const/4 v6, -0x1

    .line 51
    const/4 v4, -0x1

    .line 52
    .local v4, "warning":I
    invoke-static {}, Landroid/os/Environment;->getExternalStorageState()Ljava/lang/String;

    move-result-object v2

    .line 53
    .local v2, "state":Ljava/lang/String;
    const-string v5, "mounted_ro"

    invoke-virtual {v2, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 54
    const v4, 0x7f060094

    .line 59
    :cond_0
    :goto_0
    invoke-virtual {p0, v7}, Lcom/keepassdroid/view/FileNameView;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    .line 60
    .local v3, "tv":Landroid/widget/TextView;
    const v5, 0x7f0b0044

    invoke-virtual {p0, v5}, Lcom/keepassdroid/view/FileNameView;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    .line 61
    .local v0, "label":Landroid/widget/TextView;
    new-instance v1, Landroid/widget/RelativeLayout$LayoutParams;

    const/4 v5, -0x2

    invoke-direct {v1, v6, v5}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 63
    .local v1, "lp":Landroid/widget/RelativeLayout$LayoutParams;
    if-eq v4, v6, :cond_2

    .line 64
    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(I)V

    .line 65
    const/4 v5, 0x0

    invoke-virtual {v3, v5}, Landroid/widget/TextView;->setVisibility(I)V

    .line 67
    const/4 v5, 0x3

    invoke-virtual {v1, v5, v7}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    .line 72
    :goto_1
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 73
    return-void

    .line 55
    .end local v0    # "label":Landroid/widget/TextView;
    .end local v1    # "lp":Landroid/widget/RelativeLayout$LayoutParams;
    .end local v3    # "tv":Landroid/widget/TextView;
    :cond_1
    const-string v5, "mounted"

    invoke-virtual {v2, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_0

    .line 56
    const v4, 0x7f060095

    goto :goto_0

    .line 69
    .restart local v0    # "label":Landroid/widget/TextView;
    .restart local v1    # "lp":Landroid/widget/RelativeLayout$LayoutParams;
    .restart local v3    # "tv":Landroid/widget/TextView;
    :cond_2
    const/4 v5, 0x4

    invoke-virtual {v3, v5}, Landroid/widget/TextView;->setVisibility(I)V

    goto :goto_1
.end method
