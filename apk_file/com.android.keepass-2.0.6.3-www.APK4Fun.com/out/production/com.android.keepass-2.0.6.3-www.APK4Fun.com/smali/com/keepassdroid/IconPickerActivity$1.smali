.class Lcom/keepassdroid/IconPickerActivity$1;
.super Ljava/lang/Object;
.source "IconPickerActivity.java"

# interfaces
.implements Landroid/widget/AdapterView$OnItemClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/keepassdroid/IconPickerActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/keepassdroid/IconPickerActivity;


# direct methods
.method constructor <init>(Lcom/keepassdroid/IconPickerActivity;)V
    .locals 0
    .param p1, "this$0"    # Lcom/keepassdroid/IconPickerActivity;

    .prologue
    .line 59
    iput-object p1, p0, Lcom/keepassdroid/IconPickerActivity$1;->this$0:Lcom/keepassdroid/IconPickerActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 3
    .param p2, "v"    # Landroid/view/View;
    .param p3, "position"    # I
    .param p4, "id"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView",
            "<*>;",
            "Landroid/view/View;",
            "IJ)V"
        }
    .end annotation

    .prologue
    .line 62
    .local p1, "parent":Landroid/widget/AdapterView;, "Landroid/widget/AdapterView<*>;"
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 64
    .local v0, "intent":Landroid/content/Intent;
    const-string v1, "icon_id"

    invoke-virtual {v0, v1, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 65
    iget-object v1, p0, Lcom/keepassdroid/IconPickerActivity$1;->this$0:Lcom/keepassdroid/IconPickerActivity;

    const/16 v2, 0x3e8

    invoke-virtual {v1, v2, v0}, Lcom/keepassdroid/IconPickerActivity;->setResult(ILandroid/content/Intent;)V

    .line 67
    iget-object v1, p0, Lcom/keepassdroid/IconPickerActivity$1;->this$0:Lcom/keepassdroid/IconPickerActivity;

    invoke-virtual {v1}, Lcom/keepassdroid/IconPickerActivity;->finish()V

    .line 68
    return-void
.end method
