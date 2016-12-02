.class public Lcom/keepassdroid/view/EntrySection;
.super Landroid/widget/LinearLayout;
.source "EntrySection.java"


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 33
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/keepassdroid/view/EntrySection;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 34
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    const/4 v0, 0x0

    .line 37
    invoke-direct {p0, p1, p2, v0, v0}, Lcom/keepassdroid/view/EntrySection;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;Ljava/lang/String;Ljava/lang/String;)V

    .line 38
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "title"    # Ljava/lang/String;
    .param p4, "value"    # Ljava/lang/String;

    .prologue
    .line 41
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 43
    const-string v1, "layout_inflater"

    invoke-virtual {p1, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/LayoutInflater;

    .line 44
    .local v0, "inflater":Landroid/view/LayoutInflater;
    invoke-virtual {p0, v0, p1, p3, p4}, Lcom/keepassdroid/view/EntrySection;->inflate(Landroid/view/LayoutInflater;Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    .line 45
    return-void
.end method

.method private setText(ILjava/lang/String;)V
    .locals 1
    .param p1, "resId"    # I
    .param p2, "str"    # Ljava/lang/String;

    .prologue
    .line 59
    if-eqz p2, :cond_0

    .line 60
    invoke-virtual {p0, p1}, Lcom/keepassdroid/view/EntrySection;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    .line 61
    .local v0, "tvTitle":Landroid/widget/TextView;
    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 64
    .end local v0    # "tvTitle":Landroid/widget/TextView;
    :cond_0
    return-void
.end method


# virtual methods
.method protected getLayout()I
    .locals 1

    .prologue
    .line 48
    const v0, 0x7f030006

    return v0
.end method

.method protected inflate(Landroid/view/LayoutInflater;Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "context"    # Landroid/content/Context;
    .param p3, "title"    # Ljava/lang/String;
    .param p4, "value"    # Ljava/lang/String;

    .prologue
    .line 52
    invoke-virtual {p0}, Lcom/keepassdroid/view/EntrySection;->getLayout()I

    move-result v0

    invoke-virtual {p1, v0, p0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 54
    const v0, 0x7f0b002b

    invoke-direct {p0, v0, p3}, Lcom/keepassdroid/view/EntrySection;->setText(ILjava/lang/String;)V

    .line 55
    const v0, 0x7f0b002e

    invoke-direct {p0, v0, p4}, Lcom/keepassdroid/view/EntrySection;->setText(ILjava/lang/String;)V

    .line 56
    return-void
.end method
