.class Lcom/keepassdroid/PasswordActivity$InitTask$1;
.super Ljava/lang/Object;
.source "PasswordActivity.java"

# interfaces
.implements Landroid/widget/CompoundButton$OnCheckedChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/keepassdroid/PasswordActivity$InitTask;->onPostExecute(Ljava/lang/Integer;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/keepassdroid/PasswordActivity$InitTask;


# direct methods
.method constructor <init>(Lcom/keepassdroid/PasswordActivity$InitTask;)V
    .locals 0
    .param p1, "this$1"    # Lcom/keepassdroid/PasswordActivity$InitTask;

    .prologue
    .line 428
    iput-object p1, p0, Lcom/keepassdroid/PasswordActivity$InitTask$1;->this$1:Lcom/keepassdroid/PasswordActivity$InitTask;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCheckedChanged(Landroid/widget/CompoundButton;Z)V
    .locals 3
    .param p1, "buttonView"    # Landroid/widget/CompoundButton;
    .param p2, "isChecked"    # Z

    .prologue
    .line 432
    iget-object v1, p0, Lcom/keepassdroid/PasswordActivity$InitTask$1;->this$1:Lcom/keepassdroid/PasswordActivity$InitTask;

    iget-object v1, v1, Lcom/keepassdroid/PasswordActivity$InitTask;->this$0:Lcom/keepassdroid/PasswordActivity;

    const v2, 0x7f0b004c

    invoke-virtual {v1, v2}, Lcom/keepassdroid/PasswordActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    .line 434
    .local v0, "password":Landroid/widget/TextView;
    if-eqz p2, :cond_0

    .line 435
    const/16 v1, 0x91

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setInputType(I)V

    .line 439
    :goto_0
    return-void

    .line 437
    :cond_0
    const/16 v1, 0x81

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setInputType(I)V

    goto :goto_0
.end method
