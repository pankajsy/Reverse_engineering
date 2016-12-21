.class Lcom/keepassdroid/SetPasswordDialog$2;
.super Ljava/lang/Object;
.source "SetPasswordDialog.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/keepassdroid/SetPasswordDialog;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/keepassdroid/SetPasswordDialog;


# direct methods
.method constructor <init>(Lcom/keepassdroid/SetPasswordDialog;)V
    .locals 0
    .param p1, "this$0"    # Lcom/keepassdroid/SetPasswordDialog;

    .prologue
    .line 118
    iput-object p1, p0, Lcom/keepassdroid/SetPasswordDialog$2;->this$0:Lcom/keepassdroid/SetPasswordDialog;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 121
    iget-object v0, p0, Lcom/keepassdroid/SetPasswordDialog$2;->this$0:Lcom/keepassdroid/SetPasswordDialog;

    invoke-virtual {v0}, Lcom/keepassdroid/SetPasswordDialog;->cancel()V

    .line 122
    iget-object v0, p0, Lcom/keepassdroid/SetPasswordDialog$2;->this$0:Lcom/keepassdroid/SetPasswordDialog;

    # getter for: Lcom/keepassdroid/SetPasswordDialog;->mFinish:Lcom/keepassdroid/database/edit/FileOnFinish;
    invoke-static {v0}, Lcom/keepassdroid/SetPasswordDialog;->access$100(Lcom/keepassdroid/SetPasswordDialog;)Lcom/keepassdroid/database/edit/FileOnFinish;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 123
    iget-object v0, p0, Lcom/keepassdroid/SetPasswordDialog$2;->this$0:Lcom/keepassdroid/SetPasswordDialog;

    # getter for: Lcom/keepassdroid/SetPasswordDialog;->mFinish:Lcom/keepassdroid/database/edit/FileOnFinish;
    invoke-static {v0}, Lcom/keepassdroid/SetPasswordDialog;->access$100(Lcom/keepassdroid/SetPasswordDialog;)Lcom/keepassdroid/database/edit/FileOnFinish;

    move-result-object v0

    invoke-virtual {v0}, Lcom/keepassdroid/database/edit/FileOnFinish;->run()V

    .line 125
    :cond_0
    return-void
.end method
