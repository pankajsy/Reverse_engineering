.class Lcom/keepassdroid/PasswordActivity$AfterLoad$1;
.super Ljava/lang/Object;
.source "PasswordActivity.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/keepassdroid/PasswordActivity$AfterLoad;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/keepassdroid/PasswordActivity$AfterLoad;


# direct methods
.method constructor <init>(Lcom/keepassdroid/PasswordActivity$AfterLoad;)V
    .locals 0
    .param p1, "this$1"    # Lcom/keepassdroid/PasswordActivity$AfterLoad;

    .prologue
    .line 341
    iput-object p1, p0, Lcom/keepassdroid/PasswordActivity$AfterLoad$1;->this$1:Lcom/keepassdroid/PasswordActivity$AfterLoad;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 1
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 345
    iget-object v0, p0, Lcom/keepassdroid/PasswordActivity$AfterLoad$1;->this$1:Lcom/keepassdroid/PasswordActivity$AfterLoad;

    iget-object v0, v0, Lcom/keepassdroid/PasswordActivity$AfterLoad;->this$0:Lcom/keepassdroid/PasswordActivity;

    invoke-static {v0}, Lcom/keepassdroid/GroupActivity;->Launch(Landroid/app/Activity;)V

    .line 346
    return-void
.end method
