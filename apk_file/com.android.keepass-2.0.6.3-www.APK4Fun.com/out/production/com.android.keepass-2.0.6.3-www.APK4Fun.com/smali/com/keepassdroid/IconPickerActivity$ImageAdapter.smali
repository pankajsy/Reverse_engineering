.class public Lcom/keepassdroid/IconPickerActivity$ImageAdapter;
.super Landroid/widget/BaseAdapter;
.source "IconPickerActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/keepassdroid/IconPickerActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "ImageAdapter"
.end annotation


# instance fields
.field mContext:Landroid/content/Context;

.field final synthetic this$0:Lcom/keepassdroid/IconPickerActivity;


# direct methods
.method public constructor <init>(Lcom/keepassdroid/IconPickerActivity;Landroid/content/Context;)V
    .locals 0
    .param p1, "this$0"    # Lcom/keepassdroid/IconPickerActivity;
    .param p2, "c"    # Landroid/content/Context;

    .prologue
    .line 77
    iput-object p1, p0, Lcom/keepassdroid/IconPickerActivity$ImageAdapter;->this$0:Lcom/keepassdroid/IconPickerActivity;

    invoke-direct {p0}, Landroid/widget/BaseAdapter;-><init>()V

    .line 78
    iput-object p2, p0, Lcom/keepassdroid/IconPickerActivity$ImageAdapter;->mContext:Landroid/content/Context;

    .line 79
    return-void
.end method


# virtual methods
.method public getCount()I
    .locals 1

    .prologue
    .line 84
    invoke-static {}, Lcom/keepassdroid/icons/Icons;->count()I

    move-result v0

    return v0
.end method

.method public getItem(I)Ljava/lang/Object;
    .locals 1
    .param p1, "position"    # I

    .prologue
    .line 89
    const/4 v0, 0x0

    return-object v0
.end method

.method public getItemId(I)J
    .locals 2
    .param p1, "position"    # I

    .prologue
    .line 94
    const-wide/16 v0, 0x0

    return-wide v0
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 6
    .param p1, "position"    # I
    .param p2, "convertView"    # Landroid/view/View;
    .param p3, "parent"    # Landroid/view/ViewGroup;

    .prologue
    .line 100
    if-nez p2, :cond_0

    .line 102
    iget-object v4, p0, Lcom/keepassdroid/IconPickerActivity$ImageAdapter;->this$0:Lcom/keepassdroid/IconPickerActivity;

    const-string v5, "layout_inflater"

    invoke-virtual {v4, v5}, Lcom/keepassdroid/IconPickerActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/view/LayoutInflater;

    .line 103
    .local v2, "li":Landroid/view/LayoutInflater;
    const v4, 0x7f030014

    const/4 v5, 0x0

    invoke-virtual {v2, v4, p3, v5}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    .line 110
    .end local v2    # "li":Landroid/view/LayoutInflater;
    .local v0, "currView":Landroid/view/View;
    :goto_0
    const v4, 0x7f0b0067

    invoke-virtual {v0, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    .line 111
    .local v3, "tv":Landroid/widget/TextView;
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, ""

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 112
    const v4, 0x7f0b0066

    invoke-virtual {v0, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    .line 113
    .local v1, "iv":Landroid/widget/ImageView;
    invoke-static {p1}, Lcom/keepassdroid/icons/Icons;->iconToResId(I)I

    move-result v4

    invoke-virtual {v1, v4}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 115
    return-object v0

    .line 107
    .end local v0    # "currView":Landroid/view/View;
    .end local v1    # "iv":Landroid/widget/ImageView;
    .end local v3    # "tv":Landroid/widget/TextView;
    :cond_0
    move-object v0, p2

    .restart local v0    # "currView":Landroid/view/View;
    goto :goto_0
.end method
