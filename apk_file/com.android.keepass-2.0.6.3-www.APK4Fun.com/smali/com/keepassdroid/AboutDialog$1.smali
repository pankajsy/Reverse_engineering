.class Lcom/keepassdroid/AboutDialog$1;
.super Ljava/lang/Object;
.source "AboutDialog.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/keepassdroid/AboutDialog;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/keepassdroid/AboutDialog;


# direct methods
.method constructor <init>(Lcom/keepassdroid/AboutDialog;)V
    .locals 0
    .param p1, "this$0"    # Lcom/keepassdroid/AboutDialog;

    .prologue
    .line 48
    iput-object p1, p0, Lcom/keepassdroid/AboutDialog$1;->this$0:Lcom/keepassdroid/AboutDialog;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 50
    iget-object v0, p0, Lcom/keepassdroid/AboutDialog$1;->this$0:Lcom/keepassdroid/AboutDialog;

    invoke-virtual {v0}, Lcom/keepassdroid/AboutDialog;->dismiss()V

    .line 51
    return-void
.end method
