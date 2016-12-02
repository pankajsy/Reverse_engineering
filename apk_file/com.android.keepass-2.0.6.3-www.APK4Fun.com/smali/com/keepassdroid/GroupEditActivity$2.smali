.class Lcom/keepassdroid/GroupEditActivity$2;
.super Ljava/lang/Object;
.source "GroupEditActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/keepassdroid/GroupEditActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/keepassdroid/GroupEditActivity;


# direct methods
.method constructor <init>(Lcom/keepassdroid/GroupEditActivity;)V
    .locals 0
    .param p1, "this$0"    # Lcom/keepassdroid/GroupEditActivity;

    .prologue
    .line 63
    iput-object p1, p0, Lcom/keepassdroid/GroupEditActivity$2;->this$0:Lcom/keepassdroid/GroupEditActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 6
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 66
    iget-object v3, p0, Lcom/keepassdroid/GroupEditActivity$2;->this$0:Lcom/keepassdroid/GroupEditActivity;

    const v4, 0x7f0b005f

    invoke-virtual {v3, v4}, Lcom/keepassdroid/GroupEditActivity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    .line 67
    .local v2, "nameField":Landroid/widget/TextView;
    invoke-virtual {v2}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v3

    invoke-interface {v3}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v1

    .line 69
    .local v1, "name":Ljava/lang/String;
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v3

    if-lez v3, :cond_0

    .line 71
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 73
    .local v0, "intent":Landroid/content/Intent;
    const-string v3, "name"

    invoke-virtual {v0, v3, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 74
    const-string v3, "icon_id"

    iget-object v4, p0, Lcom/keepassdroid/GroupEditActivity$2;->this$0:Lcom/keepassdroid/GroupEditActivity;

    # getter for: Lcom/keepassdroid/GroupEditActivity;->mSelectedIconID:I
    invoke-static {v4}, Lcom/keepassdroid/GroupEditActivity;->access$000(Lcom/keepassdroid/GroupEditActivity;)I

    move-result v4

    invoke-virtual {v0, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 75
    iget-object v3, p0, Lcom/keepassdroid/GroupEditActivity$2;->this$0:Lcom/keepassdroid/GroupEditActivity;

    const/4 v4, -0x1

    invoke-virtual {v3, v4, v0}, Lcom/keepassdroid/GroupEditActivity;->setResult(ILandroid/content/Intent;)V

    .line 77
    iget-object v3, p0, Lcom/keepassdroid/GroupEditActivity$2;->this$0:Lcom/keepassdroid/GroupEditActivity;

    invoke-virtual {v3}, Lcom/keepassdroid/GroupEditActivity;->finish()V

    .line 83
    .end local v0    # "intent":Landroid/content/Intent;
    :goto_0
    return-void

    .line 81
    :cond_0
    iget-object v3, p0, Lcom/keepassdroid/GroupEditActivity$2;->this$0:Lcom/keepassdroid/GroupEditActivity;

    const v4, 0x7f06003f

    const/4 v5, 0x1

    invoke-static {v3, v4, v5}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v3

    invoke-virtual {v3}, Landroid/widget/Toast;->show()V

    goto :goto_0
.end method
