.class public Lcom/keepassdroid/services/TimeoutService;
.super Landroid/app/Service;
.source "TimeoutService.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/keepassdroid/services/TimeoutService$TimeoutBinder;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "KeePassDroid Timer"


# instance fields
.field private final mBinder:Landroid/os/IBinder;

.field private mIntentReceiver:Landroid/content/BroadcastReceiver;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 35
    invoke-direct {p0}, Landroid/app/Service;-><init>()V

    .line 92
    new-instance v0, Lcom/keepassdroid/services/TimeoutService$TimeoutBinder;

    invoke-direct {v0, p0}, Lcom/keepassdroid/services/TimeoutService$TimeoutBinder;-><init>(Lcom/keepassdroid/services/TimeoutService;)V

    iput-object v0, p0, Lcom/keepassdroid/services/TimeoutService;->mBinder:Landroid/os/IBinder;

    return-void
.end method

.method static synthetic access$000(Lcom/keepassdroid/services/TimeoutService;Landroid/content/Context;)V
    .locals 0
    .param p0, "x0"    # Lcom/keepassdroid/services/TimeoutService;
    .param p1, "x1"    # Landroid/content/Context;

    .prologue
    .line 35
    invoke-direct {p0, p1}, Lcom/keepassdroid/services/TimeoutService;->timeout(Landroid/content/Context;)V

    return-void
.end method

.method private timeout(Landroid/content/Context;)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 68
    const-string v1, "KeePassDroid Timer"

    const-string v2, "Timeout"

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 69
    invoke-static {}, Lcom/keepassdroid/app/App;->setShutdown()V

    .line 71
    const-string v1, "notification"

    invoke-virtual {p0, v1}, Lcom/keepassdroid/services/TimeoutService;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/NotificationManager;

    .line 72
    .local v0, "nm":Landroid/app/NotificationManager;
    invoke-virtual {v0}, Landroid/app/NotificationManager;->cancelAll()V

    .line 74
    invoke-virtual {p0}, Lcom/keepassdroid/services/TimeoutService;->stopSelf()V

    .line 75
    return-void
.end method


# virtual methods
.method public onBind(Landroid/content/Intent;)Landroid/os/IBinder;
    .locals 1
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    .line 96
    iget-object v0, p0, Lcom/keepassdroid/services/TimeoutService;->mBinder:Landroid/os/IBinder;

    return-object v0
.end method

.method public onCreate()V
    .locals 2

    .prologue
    .line 41
    invoke-super {p0}, Landroid/app/Service;->onCreate()V

    .line 43
    new-instance v1, Lcom/keepassdroid/services/TimeoutService$1;

    invoke-direct {v1, p0}, Lcom/keepassdroid/services/TimeoutService$1;-><init>(Lcom/keepassdroid/services/TimeoutService;)V

    iput-object v1, p0, Lcom/keepassdroid/services/TimeoutService;->mIntentReceiver:Landroid/content/BroadcastReceiver;

    .line 54
    new-instance v0, Landroid/content/IntentFilter;

    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    .line 55
    .local v0, "filter":Landroid/content/IntentFilter;
    const-string v1, "com.keepassdroid.timeout"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 56
    iget-object v1, p0, Lcom/keepassdroid/services/TimeoutService;->mIntentReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v1, v0}, Lcom/keepassdroid/services/TimeoutService;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 58
    return-void
.end method

.method public onDestroy()V
    .locals 2

    .prologue
    .line 79
    invoke-super {p0}, Landroid/app/Service;->onDestroy()V

    .line 81
    const-string v0, "KeePassDroid Timer"

    const-string v1, "Timeout service stopped"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 83
    iget-object v0, p0, Lcom/keepassdroid/services/TimeoutService;->mIntentReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v0}, Lcom/keepassdroid/services/TimeoutService;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 84
    return-void
.end method

.method public onStart(Landroid/content/Intent;I)V
    .locals 2
    .param p1, "intent"    # Landroid/content/Intent;
    .param p2, "startId"    # I

    .prologue
    .line 62
    invoke-super {p0, p1, p2}, Landroid/app/Service;->onStart(Landroid/content/Intent;I)V

    .line 64
    const-string v0, "KeePassDroid Timer"

    const-string v1, "Timeout service started"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 65
    return-void
.end method
