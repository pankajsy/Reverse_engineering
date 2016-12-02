.class Lcom/keepassdroid/GroupEditActivity$3;
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
    .line 88
    iput-object p1, p0, Lcom/keepassdroid/GroupEditActivity$3;->this$0:Lcom/keepassdroid/GroupEditActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 3
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 91
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 92
    .local v0, "intent":Landroid/content/Intent;
    iget-object v1, p0, Lcom/keepassdroid/GroupEditActivity$3;->this$0:Lcom/keepassdroid/GroupEditActivity;

    const/4 v2, 0x0

    invoke-virtual {v1, v2, v0}, Lcom/keepassdroid/GroupEditActivity;->setResult(ILandroid/content/Intent;)V

    .line 94
    iget-object v1, p0, Lcom/keepassdroid/GroupEditActivity$3;->this$0:Lcom/keepassdroid/GroupEditActivity;

    invoke-virtual {v1}, Lcom/keepassdroid/GroupEditActivity;->finish()V

    .line 95
    return-void
.end method
