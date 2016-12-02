.class public Lcom/keepassdroid/dialog/WarningDialog;
.super Landroid/app/AlertDialog;
.source "WarningDialog.java"


# instance fields
.field private showKey:I

.field protected warning:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/content/Context;I)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "dontShowKey"    # I

    .prologue
    .line 37
    invoke-direct {p0, p1}, Landroid/app/AlertDialog;-><init>(Landroid/content/Context;)V

    .line 39
    iput p2, p0, Lcom/keepassdroid/dialog/WarningDialog;->showKey:I

    .line 40
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;II)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "warningKey"    # I
    .param p3, "dontShowKey"    # I

    .prologue
    .line 43
    invoke-direct {p0, p1, p3}, Lcom/keepassdroid/dialog/WarningDialog;-><init>(Landroid/content/Context;I)V

    .line 45
    invoke-virtual {p1, p2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/keepassdroid/dialog/WarningDialog;->warning:Ljava/lang/String;

    .line 46
    return-void
.end method

.method static synthetic access$000(Lcom/keepassdroid/dialog/WarningDialog;)I
    .locals 1
    .param p0, "x0"    # Lcom/keepassdroid/dialog/WarningDialog;

    .prologue
    .line 31
    iget v0, p0, Lcom/keepassdroid/dialog/WarningDialog;->showKey:I

    return v0
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 4
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 50
    invoke-virtual {p0}, Lcom/keepassdroid/dialog/WarningDialog;->getContext()Landroid/content/Context;

    move-result-object v0

    .line 51
    .local v0, "ctx":Landroid/content/Context;
    iget-object v1, p0, Lcom/keepassdroid/dialog/WarningDialog;->warning:Ljava/lang/String;

    invoke-virtual {p0, v1}, Lcom/keepassdroid/dialog/WarningDialog;->setMessage(Ljava/lang/CharSequence;)V

    .line 53
    const/4 v1, -0x1

    const v2, 0x104000a

    invoke-virtual {v0, v2}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    move-result-object v2

    new-instance v3, Lcom/keepassdroid/dialog/WarningDialog$1;

    invoke-direct {v3, p0}, Lcom/keepassdroid/dialog/WarningDialog$1;-><init>(Lcom/keepassdroid/dialog/WarningDialog;)V

    invoke-virtual {p0, v1, v2, v3}, Lcom/keepassdroid/dialog/WarningDialog;->setButton(ILjava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)V

    .line 61
    const/4 v1, -0x2

    const v2, 0x7f060096

    invoke-virtual {v0, v2}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    move-result-object v2

    new-instance v3, Lcom/keepassdroid/dialog/WarningDialog$2;

    invoke-direct {v3, p0}, Lcom/keepassdroid/dialog/WarningDialog$2;-><init>(Lcom/keepassdroid/dialog/WarningDialog;)V

    invoke-virtual {p0, v1, v2, v3}, Lcom/keepassdroid/dialog/WarningDialog;->setButton(ILjava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)V

    .line 75
    invoke-super {p0, p1}, Landroid/app/AlertDialog;->onCreate(Landroid/os/Bundle;)V

    .line 76
    return-void
.end method
