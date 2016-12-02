.class public Lcom/keepassdroid/ProgressTask;
.super Ljava/lang/Object;
.source "ProgressTask.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/keepassdroid/ProgressTask$CloseProcessDialog;,
        Lcom/keepassdroid/ProgressTask$AfterTask;
    }
.end annotation


# instance fields
.field private mCtx:Landroid/content/Context;

.field private mHandler:Landroid/os/Handler;

.field private mPd:Landroid/app/ProgressDialog;

.field private mTask:Lcom/keepassdroid/database/edit/RunnableOnFinish;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/keepassdroid/database/edit/RunnableOnFinish;I)V
    .locals 4
    .param p1, "ctx"    # Landroid/content/Context;
    .param p2, "task"    # Lcom/keepassdroid/database/edit/RunnableOnFinish;
    .param p3, "messageId"    # I

    .prologue
    .line 43
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 44
    iput-object p1, p0, Lcom/keepassdroid/ProgressTask;->mCtx:Landroid/content/Context;

    .line 45
    iput-object p2, p0, Lcom/keepassdroid/ProgressTask;->mTask:Lcom/keepassdroid/database/edit/RunnableOnFinish;

    .line 46
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    iput-object v0, p0, Lcom/keepassdroid/ProgressTask;->mHandler:Landroid/os/Handler;

    .line 49
    new-instance v0, Landroid/app/ProgressDialog;

    iget-object v1, p0, Lcom/keepassdroid/ProgressTask;->mCtx:Landroid/content/Context;

    invoke-direct {v0, v1}, Landroid/app/ProgressDialog;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/keepassdroid/ProgressTask;->mPd:Landroid/app/ProgressDialog;

    .line 50
    iget-object v0, p0, Lcom/keepassdroid/ProgressTask;->mPd:Landroid/app/ProgressDialog;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/app/ProgressDialog;->setCanceledOnTouchOutside(Z)V

    .line 51
    iget-object v0, p0, Lcom/keepassdroid/ProgressTask;->mPd:Landroid/app/ProgressDialog;

    const v1, 0x7f06007d

    invoke-virtual {p1, v1}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/ProgressDialog;->setTitle(Ljava/lang/CharSequence;)V

    .line 52
    iget-object v0, p0, Lcom/keepassdroid/ProgressTask;->mPd:Landroid/app/ProgressDialog;

    invoke-virtual {p1, p3}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/ProgressDialog;->setMessage(Ljava/lang/CharSequence;)V

    .line 55
    iget-object v0, p0, Lcom/keepassdroid/ProgressTask;->mTask:Lcom/keepassdroid/database/edit/RunnableOnFinish;

    new-instance v1, Lcom/keepassdroid/UpdateStatus;

    iget-object v2, p0, Lcom/keepassdroid/ProgressTask;->mHandler:Landroid/os/Handler;

    iget-object v3, p0, Lcom/keepassdroid/ProgressTask;->mPd:Landroid/app/ProgressDialog;

    invoke-direct {v1, p1, v2, v3}, Lcom/keepassdroid/UpdateStatus;-><init>(Landroid/content/Context;Landroid/os/Handler;Landroid/app/ProgressDialog;)V

    invoke-virtual {v0, v1}, Lcom/keepassdroid/database/edit/RunnableOnFinish;->setStatus(Lcom/keepassdroid/UpdateStatus;)V

    .line 56
    iget-object v0, p0, Lcom/keepassdroid/ProgressTask;->mTask:Lcom/keepassdroid/database/edit/RunnableOnFinish;

    new-instance v1, Lcom/keepassdroid/ProgressTask$AfterTask;

    iget-object v2, p2, Lcom/keepassdroid/database/edit/RunnableOnFinish;->mFinish:Lcom/keepassdroid/database/edit/OnFinish;

    iget-object v3, p0, Lcom/keepassdroid/ProgressTask;->mHandler:Landroid/os/Handler;

    invoke-direct {v1, p0, v2, v3}, Lcom/keepassdroid/ProgressTask$AfterTask;-><init>(Lcom/keepassdroid/ProgressTask;Lcom/keepassdroid/database/edit/OnFinish;Landroid/os/Handler;)V

    iput-object v1, v0, Lcom/keepassdroid/database/edit/RunnableOnFinish;->mFinish:Lcom/keepassdroid/database/edit/OnFinish;

    .line 58
    return-void
.end method

.method static synthetic access$100(Lcom/keepassdroid/ProgressTask;)Landroid/app/ProgressDialog;
    .locals 1
    .param p0, "x0"    # Lcom/keepassdroid/ProgressTask;

    .prologue
    .line 37
    iget-object v0, p0, Lcom/keepassdroid/ProgressTask;->mPd:Landroid/app/ProgressDialog;

    return-object v0
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 62
    iget-object v1, p0, Lcom/keepassdroid/ProgressTask;->mPd:Landroid/app/ProgressDialog;

    invoke-virtual {v1}, Landroid/app/ProgressDialog;->show()V

    .line 66
    new-instance v0, Ljava/lang/Thread;

    iget-object v1, p0, Lcom/keepassdroid/ProgressTask;->mTask:Lcom/keepassdroid/database/edit/RunnableOnFinish;

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 67
    .local v0, "t":Ljava/lang/Thread;
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 69
    return-void
.end method
