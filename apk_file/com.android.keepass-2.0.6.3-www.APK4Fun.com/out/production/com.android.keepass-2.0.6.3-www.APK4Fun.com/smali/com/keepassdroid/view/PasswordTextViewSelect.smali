.class public Lcom/keepassdroid/view/PasswordTextViewSelect;
.super Lcom/keepassdroid/view/TextViewSelect;
.source "PasswordTextViewSelect.java"


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 40
    invoke-direct {p0, p1}, Lcom/keepassdroid/view/TextViewSelect;-><init>(Landroid/content/Context;)V

    .line 41
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 36
    invoke-direct {p0, p1, p2}, Lcom/keepassdroid/view/TextViewSelect;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 37
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyle"    # I

    .prologue
    .line 32
    invoke-direct {p0, p1, p2, p3}, Lcom/keepassdroid/view/TextViewSelect;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 33
    return-void
.end method

.method private getTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;
    .locals 3
    .param p1, "tf"    # Landroid/graphics/Typeface;

    .prologue
    .line 44
    invoke-virtual {p0}, Lcom/keepassdroid/view/PasswordTextViewSelect;->getContext()Landroid/content/Context;

    move-result-object v1

    const-string v2, "fonts/DejaVuSansMono.ttf"

    invoke-static {v1, v2}, Lcom/keepassdroid/assets/TypefaceFactory;->getTypeface(Landroid/content/Context;Ljava/lang/String;)Landroid/graphics/Typeface;

    move-result-object v0

    .line 46
    .local v0, "tfOverride":Landroid/graphics/Typeface;
    if-eqz v0, :cond_0

    .line 50
    .end local v0    # "tfOverride":Landroid/graphics/Typeface;
    :goto_0
    return-object v0

    .restart local v0    # "tfOverride":Landroid/graphics/Typeface;
    :cond_0
    move-object v0, p1

    goto :goto_0
.end method


# virtual methods
.method public setTypeface(Landroid/graphics/Typeface;)V
    .locals 1
    .param p1, "tf"    # Landroid/graphics/Typeface;

    .prologue
    .line 60
    invoke-direct {p0, p1}, Lcom/keepassdroid/view/PasswordTextViewSelect;->getTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    move-result-object v0

    invoke-super {p0, v0}, Lcom/keepassdroid/view/TextViewSelect;->setTypeface(Landroid/graphics/Typeface;)V

    .line 61
    return-void
.end method

.method public setTypeface(Landroid/graphics/Typeface;I)V
    .locals 1
    .param p1, "tf"    # Landroid/graphics/Typeface;
    .param p2, "style"    # I

    .prologue
    .line 55
    invoke-direct {p0, p1}, Lcom/keepassdroid/view/PasswordTextViewSelect;->getTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    move-result-object v0

    invoke-super {p0, v0, p2}, Lcom/keepassdroid/view/TextViewSelect;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 56
    return-void
.end method
