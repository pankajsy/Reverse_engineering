.class Lcom/keepassdroid/SetPasswordDialog$1$1;
.super Ljava/lang/Object;
.source "SetPasswordDialog.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/keepassdroid/SetPasswordDialog$1;->onClick(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/keepassdroid/SetPasswordDialog$1;

.field final synthetic val$pt:Lcom/keepassdroid/ProgressTask;


# direct methods
.method constructor <init>(Lcom/keepassdroid/SetPasswordDialog$1;Lcom/keepassdroid/ProgressTask;)V
    .locals 0
    .param p1, "this$1"    # Lcom/keepassdroid/SetPasswordDialog$1;

    .prologue
    .line 101
    iput-object p1, p0, Lcom/keepassdroid/SetPasswordDialog$1$1;->this$1:Lcom/keepassdroid/SetPasswordDialog$1;

    iput-object p2, p0, Lcom/keepassdroid/SetPasswordDialog$1$1;->val$pt:Lcom/keepassdroid/ProgressTask;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 1
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 105
    iget-object v0, p0, Lcom/keepassdroid/SetPasswordDialog$1$1;->val$pt:Lcom/keepassdroid/ProgressTask;

    invoke-virtual {v0}, Lcom/keepassdroid/ProgressTask;->run()V

    .line 106
    return-void
.end method
