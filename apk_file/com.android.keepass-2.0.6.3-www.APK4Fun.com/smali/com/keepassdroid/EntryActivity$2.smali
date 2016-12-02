.class Lcom/keepassdroid/EntryActivity$2;
.super Landroid/content/BroadcastReceiver;
.source "EntryActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/keepassdroid/EntryActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/keepassdroid/EntryActivity;


# direct methods
.method constructor <init>(Lcom/keepassdroid/EntryActivity;)V
    .locals 0
    .param p1, "this$0"    # Lcom/keepassdroid/EntryActivity;

    .prologue
    .line 184
    iput-object p1, p0, Lcom/keepassdroid/EntryActivity$2;->this$0:Lcom/keepassdroid/EntryActivity;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 6
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    .line 188
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    .line 190
    .local v0, "action":Ljava/lang/String;
    const-string v3, "com.keepassdroid.copy_username"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 191
    iget-object v3, p0, Lcom/keepassdroid/EntryActivity$2;->this$0:Lcom/keepassdroid/EntryActivity;

    iget-object v3, v3, Lcom/keepassdroid/EntryActivity;->mEntry:Lcom/keepassdroid/database/PwEntry;

    invoke-virtual {v3}, Lcom/keepassdroid/database/PwEntry;->getUsername()Ljava/lang/String;

    move-result-object v2

    .line 192
    .local v2, "username":Ljava/lang/String;
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v3

    if-lez v3, :cond_0

    .line 193
    iget-object v3, p0, Lcom/keepassdroid/EntryActivity$2;->this$0:Lcom/keepassdroid/EntryActivity;

    # invokes: Lcom/keepassdroid/EntryActivity;->timeoutCopyToClipboard(Ljava/lang/String;)V
    invoke-static {v3, v2}, Lcom/keepassdroid/EntryActivity;->access$000(Lcom/keepassdroid/EntryActivity;Ljava/lang/String;)V

    .line 201
    .end local v2    # "username":Ljava/lang/String;
    :cond_0
    :goto_0
    return-void

    .line 195
    :cond_1
    const-string v3, "com.keepassdroid.copy_password"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 196
    new-instance v1, Ljava/lang/String;

    iget-object v3, p0, Lcom/keepassdroid/EntryActivity$2;->this$0:Lcom/keepassdroid/EntryActivity;

    iget-object v3, v3, Lcom/keepassdroid/EntryActivity;->mEntry:Lcom/keepassdroid/database/PwEntry;

    invoke-virtual {v3}, Lcom/keepassdroid/database/PwEntry;->getPassword()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, v3}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    .line 197
    .local v1, "password":Ljava/lang/String;
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v3

    if-lez v3, :cond_0

    .line 198
    iget-object v3, p0, Lcom/keepassdroid/EntryActivity$2;->this$0:Lcom/keepassdroid/EntryActivity;

    new-instance v4, Ljava/lang/String;

    iget-object v5, p0, Lcom/keepassdroid/EntryActivity$2;->this$0:Lcom/keepassdroid/EntryActivity;

    iget-object v5, v5, Lcom/keepassdroid/EntryActivity;->mEntry:Lcom/keepassdroid/database/PwEntry;

    invoke-virtual {v5}, Lcom/keepassdroid/database/PwEntry;->getPassword()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    # invokes: Lcom/keepassdroid/EntryActivity;->timeoutCopyToClipboard(Ljava/lang/String;)V
    invoke-static {v3, v4}, Lcom/keepassdroid/EntryActivity;->access$000(Lcom/keepassdroid/EntryActivity;Ljava/lang/String;)V

    goto :goto_0
.end method
