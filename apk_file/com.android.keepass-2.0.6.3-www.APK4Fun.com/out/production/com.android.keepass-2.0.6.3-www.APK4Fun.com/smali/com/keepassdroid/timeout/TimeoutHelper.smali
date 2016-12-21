.class public Lcom/keepassdroid/timeout/TimeoutHelper;
.super Ljava/lang/Object;
.source "TimeoutHelper.java"


# static fields
.field private static final DEFAULT_TIMEOUT:J = 0x493e0L


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static checkShutdown(Landroid/app/Activity;)V
    .locals 1
    .param p0, "act"    # Landroid/app/Activity;

    .prologue
    .line 90
    invoke-static {}, Lcom/keepassdroid/app/App;->isShutdown()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/keepassdroid/app/App;->getDB()Lcom/keepassdroid/Database;

    move-result-object v0

    invoke-virtual {v0}, Lcom/keepassdroid/Database;->Loaded()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 91
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Landroid/app/Activity;->setResult(I)V

    .line 92
    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    .line 94
    :cond_0
    return-void
.end method

.method public static pause(Landroid/app/Activity;)V
    .locals 5
    .param p0, "act"    # Landroid/app/Activity;

    .prologue
    .line 38
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    .line 40
    .local v2, "time":J
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v1

    .line 41
    .local v1, "prefs":Landroid/content/SharedPreferences;
    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 42
    .local v0, "edit":Landroid/content/SharedPreferences$Editor;
    const v4, 0x7f0600cb

    invoke-virtual {p0, v4}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-interface {v0, v4, v2, v3}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    .line 44
    invoke-static {v0}, Lcom/keepassdroid/compat/EditorCompat;->apply(Landroid/content/SharedPreferences$Editor;)V

    .line 46
    invoke-static {}, Lcom/keepassdroid/app/App;->getDB()Lcom/keepassdroid/Database;

    move-result-object v4

    invoke-virtual {v4}, Lcom/keepassdroid/Database;->Loaded()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 47
    invoke-static {p0}, Lcom/keepassdroid/timers/Timeout;->start(Landroid/content/Context;)V

    .line 50
    :cond_0
    return-void
.end method

.method public static resume(Landroid/app/Activity;)V
    .locals 14
    .param p0, "act"    # Landroid/app/Activity;

    .prologue
    .line 53
    invoke-static {}, Lcom/keepassdroid/app/App;->getDB()Lcom/keepassdroid/Database;

    move-result-object v7

    invoke-virtual {v7}, Lcom/keepassdroid/Database;->Loaded()Z

    move-result v7

    if-eqz v7, :cond_0

    .line 54
    invoke-static {p0}, Lcom/keepassdroid/timers/Timeout;->cancel(Landroid/content/Context;)V

    .line 59
    :cond_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    .line 61
    .local v0, "cur_time":J
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v5

    .line 62
    .local v5, "prefs":Landroid/content/SharedPreferences;
    const v7, 0x7f0600cb

    invoke-virtual {p0, v7}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v7

    const-wide/16 v12, -0x1

    invoke-interface {v5, v7, v12, v13}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v10

    .line 64
    .local v10, "timeout_start":J
    const-wide/16 v12, -0x1

    cmp-long v7, v10, v12

    if-nez v7, :cond_2

    .line 87
    :cond_1
    :goto_0
    return-void

    .line 69
    :cond_2
    const v7, 0x7f0600b0

    invoke-virtual {p0, v7}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v7

    const v12, 0x7f0600b2

    invoke-virtual {p0, v12}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v12

    invoke-interface {v5, v7, v12}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 72
    .local v6, "sTimeout":Ljava/lang/String;
    :try_start_0
    invoke-static {v6}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-wide v8

    .line 78
    .local v8, "timeout":J
    :goto_1
    const-wide/16 v12, -0x1

    cmp-long v7, v8, v12

    if-eqz v7, :cond_1

    .line 82
    sub-long v2, v0, v10

    .line 83
    .local v2, "diff":J
    cmp-long v7, v2, v8

    if-ltz v7, :cond_1

    .line 85
    invoke-static {}, Lcom/keepassdroid/app/App;->setShutdown()V

    goto :goto_0

    .line 73
    .end local v2    # "diff":J
    .end local v8    # "timeout":J
    :catch_0
    move-exception v4

    .line 74
    .local v4, "e":Ljava/lang/NumberFormatException;
    const-wide/32 v8, 0x493e0

    .restart local v8    # "timeout":J
    goto :goto_1
.end method
