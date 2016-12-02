.class public Lcom/keepassdroid/SetPasswordDialog;
.super Lcom/keepassdroid/CancelDialog;
.source "SetPasswordDialog.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/keepassdroid/SetPasswordDialog$AfterSave;
    }
.end annotation


# instance fields
.field private mFinish:Lcom/keepassdroid/database/edit/FileOnFinish;

.field private mKeyfile:Landroid/net/Uri;

.field private masterKey:[B


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 47
    invoke-direct {p0, p1}, Lcom/keepassdroid/CancelDialog;-><init>(Landroid/content/Context;)V

    .line 48
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/keepassdroid/database/edit/FileOnFinish;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "finish"    # Lcom/keepassdroid/database/edit/FileOnFinish;

    .prologue
    .line 51
    invoke-direct {p0, p1}, Lcom/keepassdroid/CancelDialog;-><init>(Landroid/content/Context;)V

    .line 53
    iput-object p2, p0, Lcom/keepassdroid/SetPasswordDialog;->mFinish:Lcom/keepassdroid/database/edit/FileOnFinish;

    .line 54
    return-void
.end method

.method static synthetic access$000(Lcom/keepassdroid/SetPasswordDialog;)Landroid/net/Uri;
    .locals 1
    .param p0, "x0"    # Lcom/keepassdroid/SetPasswordDialog;

    .prologue
    .line 40
    iget-object v0, p0, Lcom/keepassdroid/SetPasswordDialog;->mKeyfile:Landroid/net/Uri;

    return-object v0
.end method

.method static synthetic access$002(Lcom/keepassdroid/SetPasswordDialog;Landroid/net/Uri;)Landroid/net/Uri;
    .locals 0
    .param p0, "x0"    # Lcom/keepassdroid/SetPasswordDialog;
    .param p1, "x1"    # Landroid/net/Uri;

    .prologue
    .line 40
    iput-object p1, p0, Lcom/keepassdroid/SetPasswordDialog;->mKeyfile:Landroid/net/Uri;

    return-object p1
.end method

.method static synthetic access$100(Lcom/keepassdroid/SetPasswordDialog;)Lcom/keepassdroid/database/edit/FileOnFinish;
    .locals 1
    .param p0, "x0"    # Lcom/keepassdroid/SetPasswordDialog;

    .prologue
    .line 40
    iget-object v0, p0, Lcom/keepassdroid/SetPasswordDialog;->mFinish:Lcom/keepassdroid/database/edit/FileOnFinish;

    return-object v0
.end method


# virtual methods
.method public getKey()[B
    .locals 1

    .prologue
    .line 57
    iget-object v0, p0, Lcom/keepassdroid/SetPasswordDialog;->masterKey:[B

    return-object v0
.end method

.method public keyfile()Landroid/net/Uri;
    .locals 1

    .prologue
    .line 61
    iget-object v0, p0, Lcom/keepassdroid/SetPasswordDialog;->mKeyfile:Landroid/net/Uri;

    return-object v0
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 3
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 66
    invoke-super {p0, p1}, Lcom/keepassdroid/CancelDialog;->onCreate(Landroid/os/Bundle;)V

    .line 67
    const v2, 0x7f030017

    invoke-virtual {p0, v2}, Lcom/keepassdroid/SetPasswordDialog;->setContentView(I)V

    .line 69
    const v2, 0x7f06007b

    invoke-virtual {p0, v2}, Lcom/keepassdroid/SetPasswordDialog;->setTitle(I)V

    .line 72
    const v2, 0x7f0b0060

    invoke-virtual {p0, v2}, Lcom/keepassdroid/SetPasswordDialog;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/Button;

    .line 73
    .local v1, "okButton":Landroid/widget/Button;
    new-instance v2, Lcom/keepassdroid/SetPasswordDialog$1;

    invoke-direct {v2, p0}, Lcom/keepassdroid/SetPasswordDialog$1;-><init>(Lcom/keepassdroid/SetPasswordDialog;)V

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 117
    const v2, 0x7f0b000e

    invoke-virtual {p0, v2}, Lcom/keepassdroid/SetPasswordDialog;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    .line 118
    .local v0, "cancel":Landroid/widget/Button;
    new-instance v2, Lcom/keepassdroid/SetPasswordDialog$2;

    invoke-direct {v2, p0}, Lcom/keepassdroid/SetPasswordDialog$2;-><init>(Lcom/keepassdroid/SetPasswordDialog;)V

    invoke-virtual {v0, v2}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 127
    return-void
.end method
