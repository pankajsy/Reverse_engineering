.class public Lcom/keepassdroid/services/TimeoutService$TimeoutBinder;
.super Landroid/os/Binder;
.source "TimeoutService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/keepassdroid/services/TimeoutService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "TimeoutBinder"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/keepassdroid/services/TimeoutService;


# direct methods
.method public constructor <init>(Lcom/keepassdroid/services/TimeoutService;)V
    .locals 0
    .param p1, "this$0"    # Lcom/keepassdroid/services/TimeoutService;

    .prologue
    .line 86
    iput-object p1, p0, Lcom/keepassdroid/services/TimeoutService$TimeoutBinder;->this$0:Lcom/keepassdroid/services/TimeoutService;

    invoke-direct {p0}, Landroid/os/Binder;-><init>()V

    return-void
.end method


# virtual methods
.method public getService()Lcom/keepassdroid/services/TimeoutService;
    .locals 1

    .prologue
    .line 88
    iget-object v0, p0, Lcom/keepassdroid/services/TimeoutService$TimeoutBinder;->this$0:Lcom/keepassdroid/services/TimeoutService;

    return-object v0
.end method
