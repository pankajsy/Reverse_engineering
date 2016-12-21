.class public abstract Lcom/keepassdroid/database/edit/RunnableOnFinish;
.super Ljava/lang/Object;
.source "RunnableOnFinish.java"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public mFinish:Lcom/keepassdroid/database/edit/OnFinish;

.field public mStatus:Lcom/keepassdroid/UpdateStatus;


# direct methods
.method public constructor <init>(Lcom/keepassdroid/database/edit/OnFinish;)V
    .locals 0
    .param p1, "finish"    # Lcom/keepassdroid/database/edit/OnFinish;

    .prologue
    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 31
    iput-object p1, p0, Lcom/keepassdroid/database/edit/RunnableOnFinish;->mFinish:Lcom/keepassdroid/database/edit/OnFinish;

    .line 32
    return-void
.end method


# virtual methods
.method protected finish(Z)V
    .locals 1
    .param p1, "result"    # Z

    .prologue
    .line 42
    iget-object v0, p0, Lcom/keepassdroid/database/edit/RunnableOnFinish;->mFinish:Lcom/keepassdroid/database/edit/OnFinish;

    if-eqz v0, :cond_0

    .line 43
    iget-object v0, p0, Lcom/keepassdroid/database/edit/RunnableOnFinish;->mFinish:Lcom/keepassdroid/database/edit/OnFinish;

    invoke-virtual {v0, p1}, Lcom/keepassdroid/database/edit/OnFinish;->setResult(Z)V

    .line 44
    iget-object v0, p0, Lcom/keepassdroid/database/edit/RunnableOnFinish;->mFinish:Lcom/keepassdroid/database/edit/OnFinish;

    invoke-virtual {v0}, Lcom/keepassdroid/database/edit/OnFinish;->run()V

    .line 46
    :cond_0
    return-void
.end method

.method protected finish(ZLjava/lang/String;)V
    .locals 1
    .param p1, "result"    # Z
    .param p2, "message"    # Ljava/lang/String;

    .prologue
    .line 35
    iget-object v0, p0, Lcom/keepassdroid/database/edit/RunnableOnFinish;->mFinish:Lcom/keepassdroid/database/edit/OnFinish;

    if-eqz v0, :cond_0

    .line 36
    iget-object v0, p0, Lcom/keepassdroid/database/edit/RunnableOnFinish;->mFinish:Lcom/keepassdroid/database/edit/OnFinish;

    invoke-virtual {v0, p1, p2}, Lcom/keepassdroid/database/edit/OnFinish;->setResult(ZLjava/lang/String;)V

    .line 37
    iget-object v0, p0, Lcom/keepassdroid/database/edit/RunnableOnFinish;->mFinish:Lcom/keepassdroid/database/edit/OnFinish;

    invoke-virtual {v0}, Lcom/keepassdroid/database/edit/OnFinish;->run()V

    .line 39
    :cond_0
    return-void
.end method

.method public abstract run()V
.end method

.method public setStatus(Lcom/keepassdroid/UpdateStatus;)V
    .locals 0
    .param p1, "status"    # Lcom/keepassdroid/UpdateStatus;

    .prologue
    .line 49
    iput-object p1, p0, Lcom/keepassdroid/database/edit/RunnableOnFinish;->mStatus:Lcom/keepassdroid/UpdateStatus;

    .line 50
    return-void
.end method
