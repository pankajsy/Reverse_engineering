.class Lcom/keepassdroid/ProgressTask$CloseProcessDialog;
.super Ljava/lang/Object;
.source "ProgressTask.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/keepassdroid/ProgressTask;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "CloseProcessDialog"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/keepassdroid/ProgressTask;


# direct methods
.method private constructor <init>(Lcom/keepassdroid/ProgressTask;)V
    .locals 0

    .prologue
    .line 88
    iput-object p1, p0, Lcom/keepassdroid/ProgressTask$CloseProcessDialog;->this$0:Lcom/keepassdroid/ProgressTask;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/keepassdroid/ProgressTask;Lcom/keepassdroid/ProgressTask$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/keepassdroid/ProgressTask;
    .param p2, "x1"    # Lcom/keepassdroid/ProgressTask$1;

    .prologue
    .line 88
    invoke-direct {p0, p1}, Lcom/keepassdroid/ProgressTask$CloseProcessDialog;-><init>(Lcom/keepassdroid/ProgressTask;)V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .prologue
    .line 91
    iget-object v0, p0, Lcom/keepassdroid/ProgressTask$CloseProcessDialog;->this$0:Lcom/keepassdroid/ProgressTask;

    # getter for: Lcom/keepassdroid/ProgressTask;->mPd:Landroid/app/ProgressDialog;
    invoke-static {v0}, Lcom/keepassdroid/ProgressTask;->access$100(Lcom/keepassdroid/ProgressTask;)Landroid/app/ProgressDialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->dismiss()V

    .line 92
    return-void
.end method
