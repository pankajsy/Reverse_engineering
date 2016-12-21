.class public Lcom/keepassdroid/view/EntryEditSection;
.super Landroid/widget/RelativeLayout;
.source "EntryEditSection.java"


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 35
    invoke-direct {p0, p1}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    .line 36
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 39
    invoke-direct {p0, p1, p2}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 40
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyle"    # I

    .prologue
    .line 43
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 44
    return-void
.end method

.method private setText(ILjava/lang/String;)V
    .locals 1
    .param p1, "resId"    # I
    .param p2, "str"    # Ljava/lang/String;

    .prologue
    .line 77
    if-eqz p2, :cond_0

    .line 78
    invoke-virtual {p0, p1}, Lcom/keepassdroid/view/EntryEditSection;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    .line 79
    .local v0, "tvTitle":Landroid/widget/TextView;
    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 82
    .end local v0    # "tvTitle":Landroid/widget/TextView;
    :cond_0
    return-void
.end method


# virtual methods
.method public setData(Ljava/lang/String;Lcom/keepassdroid/database/security/ProtectedString;)V
    .locals 3
    .param p1, "title"    # Ljava/lang/String;
    .param p2, "value"    # Lcom/keepassdroid/database/security/ProtectedString;

    .prologue
    .line 69
    const v1, 0x7f0b002b

    invoke-direct {p0, v1, p1}, Lcom/keepassdroid/view/EntryEditSection;->setText(ILjava/lang/String;)V

    .line 70
    const v1, 0x7f0b002e

    invoke-virtual {p2}, Lcom/keepassdroid/database/security/ProtectedString;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v1, v2}, Lcom/keepassdroid/view/EntryEditSection;->setText(ILjava/lang/String;)V

    .line 72
    const v1, 0x7f0b002c

    invoke-virtual {p0, v1}, Lcom/keepassdroid/view/EntryEditSection;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/CheckBox;

    .line 73
    .local v0, "cb":Landroid/widget/CheckBox;
    invoke-virtual {p2}, Lcom/keepassdroid/database/security/ProtectedString;->isProtected()Z

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 74
    return-void
.end method
