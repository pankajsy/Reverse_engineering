.class Lcom/keepassdroid/EntryActivity$ClearClipboardTask;
.super Ljava/util/TimerTask;
.source "EntryActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/keepassdroid/EntryActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ClearClipboardTask"
.end annotation


# instance fields
.field private final mClearText:Ljava/lang/String;

.field private final mCtx:Landroid/content/Context;

.field final synthetic this$0:Lcom/keepassdroid/EntryActivity;


# direct methods
.method constructor <init>(Lcom/keepassdroid/EntryActivity;Landroid/content/Context;Ljava/lang/String;)V
    .locals 0
    .param p2, "ctx"    # Landroid/content/Context;
    .param p3, "clearText"    # Ljava/lang/String;

    .prologue
    .line 437
    iput-object p1, p0, Lcom/keepassdroid/EntryActivity$ClearClipboardTask;->this$0:Lcom/keepassdroid/EntryActivity;

    invoke-direct {p0}, Ljava/util/TimerTask;-><init>()V

    .line 438
    iput-object p3, p0, Lcom/keepassdroid/EntryActivity$ClearClipboardTask;->mClearText:Ljava/lang/String;

    .line 439
    iput-object p2, p0, Lcom/keepassdroid/EntryActivity$ClearClipboardTask;->mCtx:Landroid/content/Context;

    .line 440
    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    .prologue
    .line 444
    iget-object v2, p0, Lcom/keepassdroid/EntryActivity$ClearClipboardTask;->mCtx:Landroid/content/Context;

    invoke-static {v2}, Lcom/keepassdroid/utils/Util;->getClipboard(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    .line 446
    .local v0, "currentClip":Ljava/lang/String;
    iget-object v2, p0, Lcom/keepassdroid/EntryActivity$ClearClipboardTask;->mClearText:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 448
    :try_start_0
    iget-object v2, p0, Lcom/keepassdroid/EntryActivity$ClearClipboardTask;->mCtx:Landroid/content/Context;

    const-string v3, ""

    invoke-static {v2, v3}, Lcom/keepassdroid/utils/Util;->copyToClipboard(Landroid/content/Context;Ljava/lang/String;)V

    .line 449
    iget-object v2, p0, Lcom/keepassdroid/EntryActivity$ClearClipboardTask;->this$0:Lcom/keepassdroid/EntryActivity;

    iget-object v2, v2, Lcom/keepassdroid/EntryActivity;->uiThreadCallback:Landroid/os/Handler;

    new-instance v3, Lcom/keepassdroid/UIToastTask;

    iget-object v4, p0, Lcom/keepassdroid/EntryActivity$ClearClipboardTask;->mCtx:Landroid/content/Context;

    const v5, 0x7f060001

    invoke-direct {v3, v4, v5}, Lcom/keepassdroid/UIToastTask;-><init>(Landroid/content/Context;I)V

    invoke-virtual {v2, v3}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
    :try_end_0
    .catch Lcom/keepassdroid/database/exception/SamsungClipboardException; {:try_start_0 .. :try_end_0} :catch_0

    .line 454
    :cond_0
    :goto_0
    return-void

    .line 450
    :catch_0
    move-exception v1

    .line 451
    .local v1, "e":Lcom/keepassdroid/database/exception/SamsungClipboardException;
    iget-object v2, p0, Lcom/keepassdroid/EntryActivity$ClearClipboardTask;->this$0:Lcom/keepassdroid/EntryActivity;

    iget-object v2, v2, Lcom/keepassdroid/EntryActivity;->uiThreadCallback:Landroid/os/Handler;

    new-instance v3, Lcom/keepassdroid/UIToastTask;

    iget-object v4, p0, Lcom/keepassdroid/EntryActivity$ClearClipboardTask;->mCtx:Landroid/content/Context;

    const v5, 0x7f060099

    invoke-direct {v3, v4, v5}, Lcom/keepassdroid/UIToastTask;-><init>(Landroid/content/Context;I)V

    invoke-virtual {v2, v3}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    goto :goto_0
.end method
