.class Lcom/keepassdroid/GeneratePasswordActivity$1;
.super Ljava/lang/Object;
.source "GeneratePasswordActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/keepassdroid/GeneratePasswordActivity;
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
    .line 45
    iput-object p1, p0, Lcom/keepassdroid/GeneratePasswordActivity$1;->this$0:Lcom/keepassdroid/GeneratePasswordActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 4
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 47
    move-object v0, p1

    check-cast v0, Landroid/widget/Button;

    .line 49
    .local v0, "button":Landroid/widget/Button;
    iget-object v2, p0, Lcom/keepassdroid/GeneratePasswordActivity$1;->this$0:Lcom/keepassdroid/GeneratePasswordActivity;

    const v3, 0x7f0b0053

    invoke-virtual {v2, v3}, Lcom/keepassdroid/GeneratePasswordActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/EditText;

    .line 50
    .local v1, "editText":Landroid/widget/EditText;
    invoke-virtual {v0}, Landroid/widget/Button;->getText()Ljava/lang/CharSequence;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 51
    return-void
.end method
