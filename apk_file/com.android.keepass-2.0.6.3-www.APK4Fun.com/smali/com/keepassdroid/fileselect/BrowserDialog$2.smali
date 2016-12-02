.class Lcom/keepassdroid/fileselect/BrowserDialog$2;
.super Ljava/lang/Object;
.source "BrowserDialog.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/keepassdroid/fileselect/BrowserDialog;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/keepassdroid/fileselect/BrowserDialog;


# direct methods
.method constructor <init>(Lcom/keepassdroid/fileselect/BrowserDialog;)V
    .locals 0
    .param p1, "this$0"    # Lcom/keepassdroid/fileselect/BrowserDialog;

    .prologue
    .line 56
    iput-object p1, p0, Lcom/keepassdroid/fileselect/BrowserDialog$2;->this$0:Lcom/keepassdroid/fileselect/BrowserDialog;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 59
    iget-object v0, p0, Lcom/keepassdroid/fileselect/BrowserDialog$2;->this$0:Lcom/keepassdroid/fileselect/BrowserDialog;

    invoke-virtual {v0}, Lcom/keepassdroid/fileselect/BrowserDialog;->getContext()Landroid/content/Context;

    move-result-object v0

    const v1, 0x7f0600c2

    invoke-static {v0, v1}, Lcom/keepassdroid/utils/Util;->gotoUrl(Landroid/content/Context;I)V

    .line 60
    iget-object v0, p0, Lcom/keepassdroid/fileselect/BrowserDialog$2;->this$0:Lcom/keepassdroid/fileselect/BrowserDialog;

    invoke-virtual {v0}, Lcom/keepassdroid/fileselect/BrowserDialog;->cancel()V

    .line 61
    return-void
.end method
