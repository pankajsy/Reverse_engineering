.class public Lcom/keepassdroid/fileselect/BrowserDialog;
.super Landroid/app/Dialog;
.source "BrowserDialog.java"


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 38
    invoke-direct {p0, p1}, Landroid/app/Dialog;-><init>(Landroid/content/Context;)V

    .line 39
    return-void
.end method

.method private isMarketInstalled()Z
    .locals 5

    .prologue
    const/4 v2, 0x0

    .line 78
    invoke-virtual {p0}, Lcom/keepassdroid/fileselect/BrowserDialog;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    .line 81
    .local v1, "pm":Landroid/content/pm/PackageManager;
    :try_start_0
    const-string v3, "com.android.vending"

    const/4 v4, 0x0

    invoke-virtual {v1, v3, v4}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 86
    const/4 v2, 0x1

    :goto_0
    return v2

    .line 82
    :catch_0
    move-exception v0

    .line 83
    .local v0, "e":Landroid/content/pm/PackageManager$NameNotFoundException;
    goto :goto_0
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 4
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 43
    invoke-super {p0, p1}, Landroid/app/Dialog;->onCreate(Landroid/os/Bundle;)V

    .line 44
    const v3, 0x7f030001

    invoke-virtual {p0, v3}, Lcom/keepassdroid/fileselect/BrowserDialog;->setContentView(I)V

    .line 45
    const v3, 0x7f060048

    invoke-virtual {p0, v3}, Lcom/keepassdroid/fileselect/BrowserDialog;->setTitle(I)V

    .line 47
    const v3, 0x7f0b000e

    invoke-virtual {p0, v3}, Lcom/keepassdroid/fileselect/BrowserDialog;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    .line 48
    .local v0, "cancel":Landroid/widget/Button;
    new-instance v3, Lcom/keepassdroid/fileselect/BrowserDialog$1;

    invoke-direct {v3, p0}, Lcom/keepassdroid/fileselect/BrowserDialog$1;-><init>(Lcom/keepassdroid/fileselect/BrowserDialog;)V

    invoke-virtual {v0, v3}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 55
    const v3, 0x7f0b000c

    invoke-virtual {p0, v3}, Lcom/keepassdroid/fileselect/BrowserDialog;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/Button;

    .line 56
    .local v1, "market":Landroid/widget/Button;
    new-instance v3, Lcom/keepassdroid/fileselect/BrowserDialog$2;

    invoke-direct {v3, p0}, Lcom/keepassdroid/fileselect/BrowserDialog$2;-><init>(Lcom/keepassdroid/fileselect/BrowserDialog;)V

    invoke-virtual {v1, v3}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 63
    invoke-direct {p0}, Lcom/keepassdroid/fileselect/BrowserDialog;->isMarketInstalled()Z

    move-result v3

    if-nez v3, :cond_0

    .line 64
    const/16 v3, 0x8

    invoke-virtual {v1, v3}, Landroid/widget/Button;->setVisibility(I)V

    .line 67
    :cond_0
    const v3, 0x7f0b000d

    invoke-virtual {p0, v3}, Lcom/keepassdroid/fileselect/BrowserDialog;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/Button;

    .line 68
    .local v2, "web":Landroid/widget/Button;
    new-instance v3, Lcom/keepassdroid/fileselect/BrowserDialog$3;

    invoke-direct {v3, p0}, Lcom/keepassdroid/fileselect/BrowserDialog$3;-><init>(Lcom/keepassdroid/fileselect/BrowserDialog;)V

    invoke-virtual {v2, v3}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 75
    return-void
.end method
