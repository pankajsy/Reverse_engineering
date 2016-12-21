.class Lcom/keepassdroid/dialog/PasswordEncodingDialogHelper$1;
.super Ljava/lang/Object;
.source "PasswordEncodingDialogHelper.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/keepassdroid/dialog/PasswordEncodingDialogHelper;->show(Landroid/content/Context;Landroid/content/DialogInterface$OnClickListener;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/keepassdroid/dialog/PasswordEncodingDialogHelper;


# direct methods
.method constructor <init>(Lcom/keepassdroid/dialog/PasswordEncodingDialogHelper;)V
    .locals 0
    .param p1, "this$0"    # Lcom/keepassdroid/dialog/PasswordEncodingDialogHelper;

    .prologue
    .line 43
    iput-object p1, p0, Lcom/keepassdroid/dialog/PasswordEncodingDialogHelper$1;->this$0:Lcom/keepassdroid/dialog/PasswordEncodingDialogHelper;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 0
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 47
    invoke-interface {p1}, Landroid/content/DialogInterface;->cancel()V

    .line 48
    return-void
.end method
