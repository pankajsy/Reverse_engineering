.class Lcom/keepassdroid/dialog/WarningDialog$2;
.super Ljava/lang/Object;
.source "WarningDialog.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/keepassdroid/dialog/WarningDialog;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/keepassdroid/dialog/WarningDialog;


# direct methods
.method constructor <init>(Lcom/keepassdroid/dialog/WarningDialog;)V
    .locals 0
    .param p1, "this$0"    # Lcom/keepassdroid/dialog/WarningDialog;

    .prologue
    .line 61
    iput-object p1, p0, Lcom/keepassdroid/dialog/WarningDialog$2;->this$0:Lcom/keepassdroid/dialog/WarningDialog;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 5
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 65
    iget-object v3, p0, Lcom/keepassdroid/dialog/WarningDialog$2;->this$0:Lcom/keepassdroid/dialog/WarningDialog;

    invoke-virtual {v3}, Lcom/keepassdroid/dialog/WarningDialog;->getContext()Landroid/content/Context;

    move-result-object v0

    .line 66
    .local v0, "ctx":Landroid/content/Context;
    invoke-static {v0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v2

    .line 67
    .local v2, "prefs":Landroid/content/SharedPreferences;
    invoke-interface {v2}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    .line 68
    .local v1, "edit":Landroid/content/SharedPreferences$Editor;
    iget-object v3, p0, Lcom/keepassdroid/dialog/WarningDialog$2;->this$0:Lcom/keepassdroid/dialog/WarningDialog;

    # getter for: Lcom/keepassdroid/dialog/WarningDialog;->showKey:I
    invoke-static {v3}, Lcom/keepassdroid/dialog/WarningDialog;->access$000(Lcom/keepassdroid/dialog/WarningDialog;)I

    move-result v3

    invoke-virtual {v0, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    invoke-interface {v1, v3, v4}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    .line 69
    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 71
    iget-object v3, p0, Lcom/keepassdroid/dialog/WarningDialog$2;->this$0:Lcom/keepassdroid/dialog/WarningDialog;

    invoke-virtual {v3}, Lcom/keepassdroid/dialog/WarningDialog;->dismiss()V

    .line 72
    return-void
.end method
