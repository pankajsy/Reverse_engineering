.class public Lcom/keepassdroid/timers/Timeout;
.super Ljava/lang/Object;
.source "Timeout.java"


# static fields
.field private static final DEFAULT_TIMEOUT:J = 0x493e0L

.field private static final REQUEST_ID:I

.field private static TAG:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 18
    const-string v0, "KeePass Timeout"

    sput-object v0, Lcom/keepassdroid/timers/Timeout;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static buildIntent(Landroid/content/Context;)Landroid/app/PendingIntent;
    .locals 4
    .param p0, "ctx"    # Landroid/content/Context;

    .prologue
    .line 21
    new-instance v0, Landroid/content/Intent;

    const-string v2, "com.keepassdroid.timeout"

    invoke-direct {v0, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 22
    .local v0, "intent":Landroid/content/Intent;
    const/4 v2, 0x0

    const/high16 v3, 0x10000000

    invoke-static {p0, v2, v0, v3}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v1

    .line 24
    .local v1, "sender":Landroid/app/PendingIntent;
    return-object v1
.end method

.method public static cancel(Landroid/content/Context;)V
    .locals 3
    .param p0, "ctx"    # Landroid/content/Context;

    .prologue
    .line 55
    const-string v1, "alarm"

    invoke-virtual {p0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/AlarmManager;

    .line 57
    .local v0, "am":Landroid/app/AlarmManager;
    sget-object v1, Lcom/keepassdroid/timers/Timeout;->TAG:Ljava/lang/String;

    const-string v2, "Timeout cancel"

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 58
    invoke-static {p0}, Lcom/keepassdroid/timers/Timeout;->buildIntent(Landroid/content/Context;)Landroid/app/PendingIntent;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/AlarmManager;->cancel(Landroid/app/PendingIntent;)V

    .line 60
    new-instance v1, Landroid/content/Intent;

    const-class v2, Lcom/keepassdroid/services/TimeoutService;

    invoke-direct {v1, p0, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {p0, v1}, Landroid/content/Context;->stopService(Landroid/content/Intent;)Z

    .line 62
    return-void
.end method

.method public static start(Landroid/content/Context;)V
    .locals 10
    .param p0, "ctx"    # Landroid/content/Context;

    .prologue
    .line 30
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v2

    .line 31
    .local v2, "prefs":Landroid/content/SharedPreferences;
    const v8, 0x7f0600b0

    invoke-virtual {p0, v8}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v8

    const v9, 0x7f0600b2

    invoke-virtual {p0, v9}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v9

    invoke-interface {v2, v8, v9}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 35
    .local v3, "sTimeout":Ljava/lang/String;
    :try_start_0
    invoke-static {v3}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-wide v4

    .line 40
    .local v4, "timeout":J
    :goto_0
    const-wide/16 v8, -0x1

    cmp-long v8, v4, v8

    if-nez v8, :cond_0

    .line 52
    :goto_1
    return-void

    .line 36
    .end local v4    # "timeout":J
    :catch_0
    move-exception v1

    .line 37
    .local v1, "e":Ljava/lang/NumberFormatException;
    const-wide/32 v4, 0x493e0

    .restart local v4    # "timeout":J
    goto :goto_0

    .line 45
    .end local v1    # "e":Ljava/lang/NumberFormatException;
    :cond_0
    new-instance v8, Landroid/content/Intent;

    const-class v9, Lcom/keepassdroid/services/TimeoutService;

    invoke-direct {v8, p0, v9}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {p0, v8}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    .line 47
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v8

    add-long v6, v8, v4

    .line 48
    .local v6, "triggerTime":J
    const-string v8, "alarm"

    invoke-virtual {p0, v8}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/AlarmManager;

    .line 50
    .local v0, "am":Landroid/app/AlarmManager;
    sget-object v8, Lcom/keepassdroid/timers/Timeout;->TAG:Ljava/lang/String;

    const-string v9, "Timeout start"

    invoke-static {v8, v9}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 51
    const/4 v8, 0x1

    invoke-static {p0}, Lcom/keepassdroid/timers/Timeout;->buildIntent(Landroid/content/Context;)Landroid/app/PendingIntent;

    move-result-object v9

    invoke-virtual {v0, v8, v6, v7, v9}, Landroid/app/AlarmManager;->set(IJLandroid/app/PendingIntent;)V

    goto :goto_1
.end method
