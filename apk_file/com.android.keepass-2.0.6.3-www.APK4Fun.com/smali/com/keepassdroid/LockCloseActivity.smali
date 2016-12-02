.class public abstract Lcom/keepassdroid/LockCloseActivity;
.super Lcom/keepassdroid/LockingActivity;
.source "LockCloseActivity.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 28
    invoke-direct {p0}, Lcom/keepassdroid/LockingActivity;-><init>()V

    return-void
.end method

.method private checkShutdown()V
    .locals 1

    .prologue
    .line 38
    invoke-static {}, Lcom/keepassdroid/app/App;->isShutdown()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/keepassdroid/app/App;->getDB()Lcom/keepassdroid/Database;

    move-result-object v0

    invoke-virtual {v0}, Lcom/keepassdroid/Database;->Loaded()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 39
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/keepassdroid/LockCloseActivity;->setResult(I)V

    .line 40
    invoke-virtual {p0}, Lcom/keepassdroid/LockCloseActivity;->finish()V

    .line 43
    :cond_0
    return-void
.end method


# virtual methods
.method protected onResume()V
    .locals 0

    .prologue
    .line 32
    invoke-super {p0}, Lcom/keepassdroid/LockingActivity;->onResume()V

    .line 34
    invoke-direct {p0}, Lcom/keepassdroid/LockCloseActivity;->checkShutdown()V

    .line 35
    return-void
.end method

.method public startActivity(Landroid/content/Intent;)V
    .locals 4
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    const/4 v3, 0x0

    .line 51
    :try_start_0
    invoke-virtual {p1}, Landroid/content/Intent;->getComponent()Landroid/content/ComponentName;

    move-result-object v1

    if-eqz v1, :cond_0

    invoke-virtual {p1}, Landroid/content/Intent;->getComponent()Landroid/content/ComponentName;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/ComponentName;->getShortClassName()Ljava/lang/String;

    move-result-object v1

    const-string v2, ".HtcLinkifyDispatcherActivity"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 52
    const/4 v1, 0x0

    invoke-virtual {p1, v1}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    .line 54
    :cond_0
    invoke-super {p0, p1}, Lcom/keepassdroid/LockingActivity;->startActivity(Landroid/content/Intent;)V
    :try_end_0
    .catch Landroid/content/ActivityNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 59
    :goto_0
    return-void

    .line 55
    :catch_0
    move-exception v0

    .line 57
    .local v0, "e":Landroid/content/ActivityNotFoundException;
    invoke-static {p1, v3}, Landroid/content/Intent;->createChooser(Landroid/content/Intent;Ljava/lang/CharSequence;)Landroid/content/Intent;

    move-result-object v1

    invoke-super {p0, v1}, Lcom/keepassdroid/LockingActivity;->startActivity(Landroid/content/Intent;)V

    goto :goto_0
.end method
