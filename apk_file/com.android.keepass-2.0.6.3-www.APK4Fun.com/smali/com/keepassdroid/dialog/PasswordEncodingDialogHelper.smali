.class public Lcom/keepassdroid/dialog/PasswordEncodingDialogHelper;
.super Ljava/lang/Object;
.source "PasswordEncodingDialogHelper.java"


# instance fields
.field private dialog:Landroid/app/AlertDialog;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public show(Landroid/content/Context;Landroid/content/DialogInterface$OnClickListener;)V
    .locals 1
    .param p1, "ctx"    # Landroid/content/Context;
    .param p2, "onclick"    # Landroid/content/DialogInterface$OnClickListener;

    .prologue
    .line 33
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Lcom/keepassdroid/dialog/PasswordEncodingDialogHelper;->show(Landroid/content/Context;Landroid/content/DialogInterface$OnClickListener;Z)V

    .line 34
    return-void
.end method

.method public show(Landroid/content/Context;Landroid/content/DialogInterface$OnClickListener;Z)V
    .locals 3
    .param p1, "ctx"    # Landroid/content/Context;
    .param p2, "onclick"    # Landroid/content/DialogInterface$OnClickListener;
    .param p3, "showCancel"    # Z

    .prologue
    .line 37
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 38
    .local v0, "builder":Landroid/app/AlertDialog$Builder;
    const v1, 0x7f0600ad

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const v2, 0x7f0600ac

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    .line 39
    const v1, 0x104000a

    invoke-virtual {v0, v1, p2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 42
    if-eqz p3, :cond_0

    .line 43
    const/high16 v1, 0x1040000

    new-instance v2, Lcom/keepassdroid/dialog/PasswordEncodingDialogHelper$1;

    invoke-direct {v2, p0}, Lcom/keepassdroid/dialog/PasswordEncodingDialogHelper$1;-><init>(Lcom/keepassdroid/dialog/PasswordEncodingDialogHelper;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 53
    :cond_0
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v1

    iput-object v1, p0, Lcom/keepassdroid/dialog/PasswordEncodingDialogHelper;->dialog:Landroid/app/AlertDialog;

    .line 55
    iget-object v1, p0, Lcom/keepassdroid/dialog/PasswordEncodingDialogHelper;->dialog:Landroid/app/AlertDialog;

    invoke-virtual {v1}, Landroid/app/AlertDialog;->show()V

    .line 56
    return-void
.end method
