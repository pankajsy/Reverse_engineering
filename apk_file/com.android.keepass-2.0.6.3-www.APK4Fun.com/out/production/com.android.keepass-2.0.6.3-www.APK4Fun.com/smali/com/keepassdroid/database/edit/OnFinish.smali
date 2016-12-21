.class public Lcom/keepassdroid/database/edit/OnFinish;
.super Ljava/lang/Object;
.source "OnFinish.java"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field protected mHandler:Landroid/os/Handler;

.field protected mMessage:Ljava/lang/String;

.field protected mOnFinish:Lcom/keepassdroid/database/edit/OnFinish;

.field protected mSuccess:Z


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 39
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 40
    return-void
.end method

.method public constructor <init>(Landroid/os/Handler;)V
    .locals 1
    .param p1, "handler"    # Landroid/os/Handler;

    .prologue
    .line 42
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 43
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/keepassdroid/database/edit/OnFinish;->mOnFinish:Lcom/keepassdroid/database/edit/OnFinish;

    .line 44
    iput-object p1, p0, Lcom/keepassdroid/database/edit/OnFinish;->mHandler:Landroid/os/Handler;

    .line 45
    return-void
.end method

.method public constructor <init>(Lcom/keepassdroid/database/edit/OnFinish;)V
    .locals 1
    .param p1, "finish"    # Lcom/keepassdroid/database/edit/OnFinish;

    .prologue
    .line 52
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 53
    iput-object p1, p0, Lcom/keepassdroid/database/edit/OnFinish;->mOnFinish:Lcom/keepassdroid/database/edit/OnFinish;

    .line 54
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/keepassdroid/database/edit/OnFinish;->mHandler:Landroid/os/Handler;

    .line 55
    return-void
.end method

.method public constructor <init>(Lcom/keepassdroid/database/edit/OnFinish;Landroid/os/Handler;)V
    .locals 0
    .param p1, "finish"    # Lcom/keepassdroid/database/edit/OnFinish;
    .param p2, "handler"    # Landroid/os/Handler;

    .prologue
    .line 47
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 48
    iput-object p1, p0, Lcom/keepassdroid/database/edit/OnFinish;->mOnFinish:Lcom/keepassdroid/database/edit/OnFinish;

    .line 49
    iput-object p2, p0, Lcom/keepassdroid/database/edit/OnFinish;->mHandler:Landroid/os/Handler;

    .line 50
    return-void
.end method


# virtual methods
.method protected displayMessage(Landroid/content/Context;)V
    .locals 2
    .param p1, "ctx"    # Landroid/content/Context;

    .prologue
    .line 80
    iget-object v0, p0, Lcom/keepassdroid/database/edit/OnFinish;->mMessage:Ljava/lang/String;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/keepassdroid/database/edit/OnFinish;->mMessage:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_0

    .line 81
    iget-object v0, p0, Lcom/keepassdroid/database/edit/OnFinish;->mMessage:Ljava/lang/String;

    const/4 v1, 0x1

    invoke-static {p1, v0, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 83
    :cond_0
    return-void
.end method

.method public run()V
    .locals 3

    .prologue
    .line 67
    iget-object v0, p0, Lcom/keepassdroid/database/edit/OnFinish;->mOnFinish:Lcom/keepassdroid/database/edit/OnFinish;

    if-eqz v0, :cond_0

    .line 69
    iget-object v0, p0, Lcom/keepassdroid/database/edit/OnFinish;->mOnFinish:Lcom/keepassdroid/database/edit/OnFinish;

    iget-boolean v1, p0, Lcom/keepassdroid/database/edit/OnFinish;->mSuccess:Z

    iget-object v2, p0, Lcom/keepassdroid/database/edit/OnFinish;->mMessage:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lcom/keepassdroid/database/edit/OnFinish;->setResult(ZLjava/lang/String;)V

    .line 71
    iget-object v0, p0, Lcom/keepassdroid/database/edit/OnFinish;->mHandler:Landroid/os/Handler;

    if-eqz v0, :cond_1

    .line 72
    iget-object v0, p0, Lcom/keepassdroid/database/edit/OnFinish;->mHandler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/keepassdroid/database/edit/OnFinish;->mOnFinish:Lcom/keepassdroid/database/edit/OnFinish;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 77
    :cond_0
    :goto_0
    return-void

    .line 74
    :cond_1
    iget-object v0, p0, Lcom/keepassdroid/database/edit/OnFinish;->mOnFinish:Lcom/keepassdroid/database/edit/OnFinish;

    invoke-virtual {v0}, Lcom/keepassdroid/database/edit/OnFinish;->run()V

    goto :goto_0
.end method

.method public setResult(Z)V
    .locals 0
    .param p1, "success"    # Z

    .prologue
    .line 63
    iput-boolean p1, p0, Lcom/keepassdroid/database/edit/OnFinish;->mSuccess:Z

    .line 64
    return-void
.end method

.method public setResult(ZLjava/lang/String;)V
    .locals 0
    .param p1, "success"    # Z
    .param p2, "message"    # Ljava/lang/String;

    .prologue
    .line 58
    iput-boolean p1, p0, Lcom/keepassdroid/database/edit/OnFinish;->mSuccess:Z

    .line 59
    iput-object p2, p0, Lcom/keepassdroid/database/edit/OnFinish;->mMessage:Ljava/lang/String;

    .line 60
    return-void
.end method
