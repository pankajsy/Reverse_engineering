.class Lcom/keepassdroid/GeneratePasswordActivity$2;
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
    .line 66
    iput-object p1, p0, Lcom/keepassdroid/GeneratePasswordActivity$2;->this$0:Lcom/keepassdroid/GeneratePasswordActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 68
    iget-object v0, p0, Lcom/keepassdroid/GeneratePasswordActivity$2;->this$0:Lcom/keepassdroid/GeneratePasswordActivity;

    # invokes: Lcom/keepassdroid/GeneratePasswordActivity;->fillPassword()V
    invoke-static {v0}, Lcom/keepassdroid/GeneratePasswordActivity;->access$000(Lcom/keepassdroid/GeneratePasswordActivity;)V

    .line 69
    return-void
.end method
