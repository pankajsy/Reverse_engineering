.class Lcom/keepassdroid/dialog/WarningDialog$1;
.super Ljava/lang/Object;
.source "WarningDialog.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/keepassdroid/dialog/WarningDialog;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/keepassdroid/dialog/WarningDialog;


# direct methods
.method constructor <init>(Lcom/keepassdroid/dialog/WarningDialog;)V
    .locals 0
    .param p1, "this$0"    # Lcom/keepassdroid/dialog/WarningDialog;

    .prologue
    .line 53
    iput-object p1, p0, Lcom/keepassdroid/dialog/WarningDialog$1;->this$0:Lcom/keepassdroid/dialog/WarningDialog;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 1
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 57
    iget-object v0, p0, Lcom/keepassdroid/dialog/WarningDialog$1;->this$0:Lcom/keepassdroid/dialog/WarningDialog;

    invoke-virtual {v0}, Lcom/keepassdroid/dialog/WarningDialog;->dismiss()V

    .line 58
    return-void
.end method
