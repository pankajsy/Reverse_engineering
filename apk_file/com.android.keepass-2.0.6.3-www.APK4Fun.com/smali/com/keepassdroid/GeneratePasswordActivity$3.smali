.class Lcom/keepassdroid/GeneratePasswordActivity$3;
.super Ljava/lang/Object;
.source "GeneratePasswordActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/keepassdroid/GeneratePasswordActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/keepassdroid/GeneratePasswordActivity;


# direct methods
.method constructor <init>(Lcom/keepassdroid/GeneratePasswordActivity;)V
    .locals 0
    .param p1, "this$0"    # Lcom/keepassdroid/GeneratePasswordActivity;

    .prologue
    .line 73
    iput-object p1, p0, Lcom/keepassdroid/GeneratePasswordActivity$3;->this$0:Lcom/keepassdroid/GeneratePasswordActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 4
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 76
    iget-object v2, p0, Lcom/keepassdroid/GeneratePasswordActivity$3;->this$0:Lcom/keepassdroid/GeneratePasswordActivity;

    const v3, 0x7f0b004c

    invoke-virtual {v2, v3}, Lcom/keepassdroid/GeneratePasswordActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/EditText;

    .line 78
    .local v1, "password":Landroid/widget/EditText;
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 79
    .local v0, "intent":Landroid/content/Intent;
    const-string v2, "com.keepassdroid.password.generated_password"

    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 81
    iget-object v2, p0, Lcom/keepassdroid/GeneratePasswordActivity$3;->this$0:Lcom/keepassdroid/GeneratePasswordActivity;

    const/16 v3, 0x3e9

    invoke-virtual {v2, v3, v0}, Lcom/keepassdroid/GeneratePasswordActivity;->setResult(ILandroid/content/Intent;)V

    .line 83
    iget-object v2, p0, Lcom/keepassdroid/GeneratePasswordActivity$3;->this$0:Lcom/keepassdroid/GeneratePasswordActivity;

    invoke-virtual {v2}, Lcom/keepassdroid/GeneratePasswordActivity;->finish()V

    .line 84
    return-void
.end method
