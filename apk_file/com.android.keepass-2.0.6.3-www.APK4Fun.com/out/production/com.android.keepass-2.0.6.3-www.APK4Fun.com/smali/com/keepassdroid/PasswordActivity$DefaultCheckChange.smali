.class Lcom/keepassdroid/PasswordActivity$DefaultCheckChange;
.super Ljava/lang/Object;
.source "PasswordActivity.java"

# interfaces
.implements Landroid/widget/CompoundButton$OnCheckedChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/keepassdroid/PasswordActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "DefaultCheckChange"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/keepassdroid/PasswordActivity;


# direct methods
.method private constructor <init>(Lcom/keepassdroid/PasswordActivity;)V
    .locals 0

    .prologue
    .line 231
    iput-object p1, p0, Lcom/keepassdroid/PasswordActivity$DefaultCheckChange;->this$0:Lcom/keepassdroid/PasswordActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/keepassdroid/PasswordActivity;Lcom/keepassdroid/PasswordActivity$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/keepassdroid/PasswordActivity;
    .param p2, "x1"    # Lcom/keepassdroid/PasswordActivity$1;

    .prologue
    .line 231
    invoke-direct {p0, p1}, Lcom/keepassdroid/PasswordActivity$DefaultCheckChange;-><init>(Lcom/keepassdroid/PasswordActivity;)V

    return-void
.end method


# virtual methods
.method public onCheckedChanged(Landroid/widget/CompoundButton;Z)V
    .locals 4
    .param p1, "buttonView"    # Landroid/widget/CompoundButton;
    .param p2, "isChecked"    # Z

    .prologue
    .line 239
    if-eqz p2, :cond_0

    .line 240
    iget-object v3, p0, Lcom/keepassdroid/PasswordActivity$DefaultCheckChange;->this$0:Lcom/keepassdroid/PasswordActivity;

    # getter for: Lcom/keepassdroid/PasswordActivity;->mDbUri:Landroid/net/Uri;
    invoke-static {v3}, Lcom/keepassdroid/PasswordActivity;->access$100(Lcom/keepassdroid/PasswordActivity;)Landroid/net/Uri;

    move-result-object v3

    invoke-virtual {v3}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v2

    .line 245
    .local v2, "newDefaultFileName":Ljava/lang/String;
    :goto_0
    iget-object v3, p0, Lcom/keepassdroid/PasswordActivity$DefaultCheckChange;->this$0:Lcom/keepassdroid/PasswordActivity;

    iget-object v3, v3, Lcom/keepassdroid/PasswordActivity;->prefs:Landroid/content/SharedPreferences;

    invoke-interface {v3}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    .line 246
    .local v1, "editor":Landroid/content/SharedPreferences$Editor;
    const-string v3, "defaultFileName"

    invoke-interface {v1, v3, v2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 247
    invoke-static {v1}, Lcom/keepassdroid/compat/EditorCompat;->apply(Landroid/content/SharedPreferences$Editor;)V

    .line 249
    new-instance v0, Lcom/keepassdroid/compat/BackupManagerCompat;

    iget-object v3, p0, Lcom/keepassdroid/PasswordActivity$DefaultCheckChange;->this$0:Lcom/keepassdroid/PasswordActivity;

    invoke-direct {v0, v3}, Lcom/keepassdroid/compat/BackupManagerCompat;-><init>(Landroid/content/Context;)V

    .line 250
    .local v0, "backupManager":Lcom/keepassdroid/compat/BackupManagerCompat;
    invoke-virtual {v0}, Lcom/keepassdroid/compat/BackupManagerCompat;->dataChanged()V

    .line 252
    return-void

    .line 242
    .end local v0    # "backupManager":Lcom/keepassdroid/compat/BackupManagerCompat;
    .end local v1    # "editor":Landroid/content/SharedPreferences$Editor;
    .end local v2    # "newDefaultFileName":Ljava/lang/String;
    :cond_0
    const-string v2, ""

    .restart local v2    # "newDefaultFileName":Ljava/lang/String;
    goto :goto_0
.end method
