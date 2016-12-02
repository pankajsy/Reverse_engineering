.class final Lcom/keepassdroid/EntryEditActivity$AfterSave;
.super Lcom/keepassdroid/database/edit/OnFinish;
.source "EntryEditActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/keepassdroid/EntryEditActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "AfterSave"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/keepassdroid/EntryEditActivity;


# direct methods
.method public constructor <init>(Lcom/keepassdroid/EntryEditActivity;Landroid/os/Handler;)V
    .locals 0
    .param p2, "handler"    # Landroid/os/Handler;

    .prologue
    .line 377
    iput-object p1, p0, Lcom/keepassdroid/EntryEditActivity$AfterSave;->this$0:Lcom/keepassdroid/EntryEditActivity;

    .line 378
    invoke-direct {p0, p2}, Lcom/keepassdroid/database/edit/OnFinish;-><init>(Landroid/os/Handler;)V

    .line 379
    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .prologue
    .line 383
    iget-boolean v0, p0, Lcom/keepassdroid/EntryEditActivity$AfterSave;->mSuccess:Z

    if-eqz v0, :cond_0

    .line 384
    iget-object v0, p0, Lcom/keepassdroid/EntryEditActivity$AfterSave;->this$0:Lcom/keepassdroid/EntryEditActivity;

    invoke-virtual {v0}, Lcom/keepassdroid/EntryEditActivity;->finish()V

    .line 388
    :goto_0
    return-void

    .line 386
    :cond_0
    iget-object v0, p0, Lcom/keepassdroid/EntryEditActivity$AfterSave;->this$0:Lcom/keepassdroid/EntryEditActivity;

    invoke-virtual {p0, v0}, Lcom/keepassdroid/EntryEditActivity$AfterSave;->displayMessage(Landroid/content/Context;)V

    goto :goto_0
.end method
