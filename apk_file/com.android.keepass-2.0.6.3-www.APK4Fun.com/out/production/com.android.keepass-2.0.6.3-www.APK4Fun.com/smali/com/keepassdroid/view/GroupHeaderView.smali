.class public Lcom/keepassdroid/view/GroupHeaderView;
.super Landroid/widget/RelativeLayout;
.source "GroupHeaderView.java"


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 34
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/keepassdroid/view/GroupHeaderView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

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
    invoke-direct {p0, p1}, Lcom/keepassdroid/view/GroupHeaderView;->inflate(Landroid/content/Context;)V

    .line 41
    return-void
.end method

.method private inflate(Landroid/content/Context;)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 44
    const-string v2, "layout_inflater"

    invoke-virtual {p1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/LayoutInflater;

    .line 45
    .local v0, "inflater":Landroid/view/LayoutInflater;
    const v2, 0x7f030012

    invoke-virtual {v0, v2, p0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 47
    invoke-static {}, Lcom/keepassdroid/app/App;->getDB()Lcom/keepassdroid/Database;

    move-result-object v2

    iget-boolean v2, v2, Lcom/keepassdroid/Database;->readOnly:Z

    if-eqz v2, :cond_0

    .line 48
    const v2, 0x7f0b0061

    invoke-virtual {p0, v2}, Lcom/keepassdroid/view/GroupHeaderView;->findViewById(I)Landroid/view/View;

    move-result-object v1

    .line 49
    .local v1, "readOnlyIndicator":Landroid/view/View;
    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V

    .line 52
    .end local v1    # "readOnlyIndicator":Landroid/view/View;
    :cond_0
    return-void
.end method
