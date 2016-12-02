.class Lcom/keepassdroid/services/TimeoutService$1;
.super Landroid/content/BroadcastReceiver;
.source "TimeoutService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/keepassdroid/services/TimeoutService;->onCreate()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/keepassdroid/services/TimeoutService;


# direct methods
.method constructor <init>(Lcom/keepassdroid/services/TimeoutService;)V
    .locals 0
    .param p1, "this$0"    # Lcom/keepassdroid/services/TimeoutService;

    .prologue
    .line 43
    iput-object p1, p0, Lcom/keepassdroid/services/TimeoutService$1;->this$0:Lcom/keepassdroid/services/TimeoutService;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    .line 46
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    .line 48
    .local v0, "action":Ljava/lang/String;
    const-string v1, "com.keepassdroid.timeout"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 49
    iget-object v1, p0, Lcom/keepassdroid/services/TimeoutService$1;->this$0:Lcom/keepassdroid/services/TimeoutService;

    # invokes: Lcom/keepassdroid/services/TimeoutService;->timeout(Landroid/content/Context;)V
    invoke-static {v1, p1}, Lcom/keepassdroid/services/TimeoutService;->access$000(Lcom/keepassdroid/services/TimeoutService;Landroid/content/Context;)V

    .line 51
    :cond_0
    return-void
.end method
