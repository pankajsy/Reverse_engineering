.class public Lcom/keepassdroid/GroupBaseActivity$AfterDeleteGroup;
.super Lcom/keepassdroid/database/edit/OnFinish;
.source "GroupBaseActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/keepassdroid/GroupBaseActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "AfterDeleteGroup"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/keepassdroid/GroupBaseActivity;


# direct methods
.method public constructor <init>(Lcom/keepassdroid/GroupBaseActivity;Landroid/os/Handler;)V
    .locals 0
    .param p1, "this$0"    # Lcom/keepassdroid/GroupBaseActivity;
    .param p2, "handler"    # Landroid/os/Handler;

    .prologue
    .line 264
    iput-object p1, p0, Lcom/keepassdroid/GroupBaseActivity$AfterDeleteGroup;->this$0:Lcom/keepassdroid/GroupBaseActivity;

    .line 265
    invoke-direct {p0, p2}, Lcom/keepassdroid/database/edit/OnFinish;-><init>(Landroid/os/Handler;)V

    .line 266
    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .prologue
    .line 270
    iget-boolean v0, p0, Lcom/keepassdroid/GroupBaseActivity$AfterDeleteGroup;->mSuccess:Z

    if-eqz v0, :cond_0

    .line 271
    iget-object v0, p0, Lcom/keepassdroid/GroupBaseActivity$AfterDeleteGroup;->this$0:Lcom/keepassdroid/GroupBaseActivity;

    invoke-virtual {v0}, Lcom/keepassdroid/GroupBaseActivity;->refreshIfDirty()V

    .line 277
    :goto_0
    return-void

    .line 273
    :cond_0
    iget-object v0, p0, Lcom/keepassdroid/GroupBaseActivity$AfterDeleteGroup;->mHandler:Landroid/os/Handler;

    new-instance v1, Lcom/keepassdroid/UIToastTask;

    iget-object v2, p0, Lcom/keepassdroid/GroupBaseActivity$AfterDeleteGroup;->this$0:Lcom/keepassdroid/GroupBaseActivity;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Unrecoverable error: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/keepassdroid/GroupBaseActivity$AfterDeleteGroup;->mMessage:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Lcom/keepassdroid/UIToastTask;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 274
    invoke-static {}, Lcom/keepassdroid/app/App;->setShutdown()V

    .line 275
    iget-object v0, p0, Lcom/keepassdroid/GroupBaseActivity$AfterDeleteGroup;->this$0:Lcom/keepassdroid/GroupBaseActivity;

    invoke-virtual {v0}, Lcom/keepassdroid/GroupBaseActivity;->finish()V

    goto :goto_0
.end method
