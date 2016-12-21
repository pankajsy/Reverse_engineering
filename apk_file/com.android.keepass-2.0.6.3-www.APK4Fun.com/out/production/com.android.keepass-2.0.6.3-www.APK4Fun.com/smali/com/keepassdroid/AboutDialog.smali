.class public Lcom/keepassdroid/AboutDialog;
.super Landroid/app/Dialog;
.source "AboutDialog.java"


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 36
    invoke-direct {p0, p1}, Landroid/app/Dialog;-><init>(Landroid/content/Context;)V

    .line 37
    return-void
.end method

.method private setVersion()V
    .locals 8

    .prologue
    .line 56
    invoke-virtual {p0}, Lcom/keepassdroid/AboutDialog;->getContext()Landroid/content/Context;

    move-result-object v0

    .line 60
    .local v0, "ctx":Landroid/content/Context;
    :try_start_0
    invoke-virtual {v0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v5

    invoke-virtual {v0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v6

    const/4 v7, 0x0

    invoke-virtual {v5, v6, v7}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v2

    .line 61
    .local v2, "packageInfo":Landroid/content/pm/PackageInfo;
    iget-object v4, v2, Landroid/content/pm/PackageInfo;->versionName:Ljava/lang/String;
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 68
    .end local v2    # "packageInfo":Landroid/content/pm/PackageInfo;
    .local v4, "version":Ljava/lang/String;
    :goto_0
    const v5, 0x7f0b0003

    invoke-virtual {p0, v5}, Lcom/keepassdroid/AboutDialog;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    .line 69
    .local v3, "tv":Landroid/widget/TextView;
    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 71
    return-void

    .line 63
    .end local v3    # "tv":Landroid/widget/TextView;
    .end local v4    # "version":Ljava/lang/String;
    :catch_0
    move-exception v1

    .line 64
    .local v1, "e":Landroid/content/pm/PackageManager$NameNotFoundException;
    invoke-virtual {v1}, Landroid/content/pm/PackageManager$NameNotFoundException;->printStackTrace()V

    .line 65
    const-string v4, ""

    .restart local v4    # "version":Ljava/lang/String;
    goto :goto_0
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 2
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 41
    invoke-super {p0, p1}, Landroid/app/Dialog;->onCreate(Landroid/os/Bundle;)V

    .line 42
    const/high16 v1, 0x7f030000

    invoke-virtual {p0, v1}, Lcom/keepassdroid/AboutDialog;->setContentView(I)V

    .line 43
    const v1, 0x7f06000e

    invoke-virtual {p0, v1}, Lcom/keepassdroid/AboutDialog;->setTitle(I)V

    .line 45
    invoke-direct {p0}, Lcom/keepassdroid/AboutDialog;->setVersion()V

    .line 47
    const v1, 0x7f0b000a

    invoke-virtual {p0, v1}, Lcom/keepassdroid/AboutDialog;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    .line 48
    .local v0, "okButton":Landroid/widget/Button;
    new-instance v1, Lcom/keepassdroid/AboutDialog$1;

    invoke-direct {v1, p0}, Lcom/keepassdroid/AboutDialog$1;-><init>(Lcom/keepassdroid/AboutDialog;)V

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 53
    return-void
.end method
