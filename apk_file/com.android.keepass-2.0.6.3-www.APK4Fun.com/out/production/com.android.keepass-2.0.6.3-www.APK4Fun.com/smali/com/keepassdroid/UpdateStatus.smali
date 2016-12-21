.class public Lcom/keepassdroid/UpdateStatus;
.super Ljava/lang/Object;
.source "UpdateStatus.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/keepassdroid/UpdateStatus$UpdateMessage;
    }
.end annotation


# instance fields
.field private mCtx:Landroid/content/Context;

.field private mHandler:Landroid/os/Handler;

.field private mPD:Landroid/app/ProgressDialog;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 33
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/os/Handler;Landroid/app/ProgressDialog;)V
    .locals 0
    .param p1, "ctx"    # Landroid/content/Context;
    .param p2, "handler"    # Landroid/os/Handler;
    .param p3, "pd"    # Landroid/app/ProgressDialog;

    .prologue
    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 36
    iput-object p1, p0, Lcom/keepassdroid/UpdateStatus;->mCtx:Landroid/content/Context;

    .line 37
    iput-object p3, p0, Lcom/keepassdroid/UpdateStatus;->mPD:Landroid/app/ProgressDialog;

    .line 38
    iput-object p2, p0, Lcom/keepassdroid/UpdateStatus;->mHandler:Landroid/os/Handler;

    .line 39
    return-void
.end method

.method static synthetic access$000(Lcom/keepassdroid/UpdateStatus;)Landroid/content/Context;
    .locals 1
    .param p0, "x0"    # Lcom/keepassdroid/UpdateStatus;

    .prologue
    .line 26
    iget-object v0, p0, Lcom/keepassdroid/UpdateStatus;->mCtx:Landroid/content/Context;

    return-object v0
.end method

.method static synthetic access$100(Lcom/keepassdroid/UpdateStatus;)Landroid/app/ProgressDialog;
    .locals 1
    .param p0, "x0"    # Lcom/keepassdroid/UpdateStatus;

    .prologue
    .line 26
    iget-object v0, p0, Lcom/keepassdroid/UpdateStatus;->mPD:Landroid/app/ProgressDialog;

    return-object v0
.end method


# virtual methods
.method public updateMessage(I)V
    .locals 2
    .param p1, "resId"    # I

    .prologue
    .line 42
    iget-object v0, p0, Lcom/keepassdroid/UpdateStatus;->mCtx:Landroid/content/Context;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/keepassdroid/UpdateStatus;->mPD:Landroid/app/ProgressDialog;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/keepassdroid/UpdateStatus;->mHandler:Landroid/os/Handler;

    if-eqz v0, :cond_0

    .line 43
    iget-object v0, p0, Lcom/keepassdroid/UpdateStatus;->mHandler:Landroid/os/Handler;

    new-instance v1, Lcom/keepassdroid/UpdateStatus$UpdateMessage;

    invoke-direct {v1, p0, p1}, Lcom/keepassdroid/UpdateStatus$UpdateMessage;-><init>(Lcom/keepassdroid/UpdateStatus;I)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 45
    :cond_0
    return-void
.end method
