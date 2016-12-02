.class public Lcom/keepassdroid/GroupBaseActivity$RefreshTask;
.super Lcom/keepassdroid/database/edit/OnFinish;
.source "GroupBaseActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/keepassdroid/GroupBaseActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "RefreshTask"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/keepassdroid/GroupBaseActivity;


# direct methods
.method public constructor <init>(Lcom/keepassdroid/GroupBaseActivity;Landroid/os/Handler;)V
    .locals 0
    .param p1, "this$0"    # Lcom/keepassdroid/GroupBaseActivity;
    .param p2, "handler"    # Landroid/os/Handler;

    .prologue
    .line 249
    iput-object p1, p0, Lcom/keepassdroid/GroupBaseActivity$RefreshTask;->this$0:Lcom/keepassdroid/GroupBaseActivity;

    .line 250
    invoke-direct {p0, p2}, Lcom/keepassdroid/database/edit/OnFinish;-><init>(Landroid/os/Handler;)V

    .line 251
    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .prologue
    .line 255
    iget-boolean v0, p0, Lcom/keepassdroid/GroupBaseActivity$RefreshTask;->mSuccess:Z

    if-eqz v0, :cond_0

    .line 256
    iget-object v0, p0, Lcom/keepassdroid/GroupBaseActivity$RefreshTask;->this$0:Lcom/keepassdroid/GroupBaseActivity;

    invoke-virtual {v0}, Lcom/keepassdroid/GroupBaseActivity;->refreshIfDirty()V

    .line 260
    :goto_0
    return-void

    .line 258
    :cond_0
    iget-object v0, p0, Lcom/keepassdroid/GroupBaseActivity$RefreshTask;->this$0:Lcom/keepassdroid/GroupBaseActivity;

    invoke-virtual {p0, v0}, Lcom/keepassdroid/GroupBaseActivity$RefreshTask;->displayMessage(Landroid/content/Context;)V

    goto :goto_0
.end method
