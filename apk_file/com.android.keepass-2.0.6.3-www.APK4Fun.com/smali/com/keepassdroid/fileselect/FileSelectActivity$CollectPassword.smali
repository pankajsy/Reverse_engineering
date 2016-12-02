.class Lcom/keepassdroid/fileselect/FileSelectActivity$CollectPassword;
.super Lcom/keepassdroid/database/edit/FileOnFinish;
.source "FileSelectActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/keepassdroid/fileselect/FileSelectActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "CollectPassword"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/keepassdroid/fileselect/FileSelectActivity;


# direct methods
.method public constructor <init>(Lcom/keepassdroid/fileselect/FileSelectActivity;Lcom/keepassdroid/database/edit/FileOnFinish;)V
    .locals 0
    .param p2, "finish"    # Lcom/keepassdroid/database/edit/FileOnFinish;

    .prologue
    .line 293
    iput-object p1, p0, Lcom/keepassdroid/fileselect/FileSelectActivity$CollectPassword;->this$0:Lcom/keepassdroid/fileselect/FileSelectActivity;

    .line 294
    invoke-direct {p0, p2}, Lcom/keepassdroid/database/edit/FileOnFinish;-><init>(Lcom/keepassdroid/database/edit/FileOnFinish;)V

    .line 295
    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 299
    new-instance v0, Lcom/keepassdroid/SetPasswordDialog;

    iget-object v1, p0, Lcom/keepassdroid/fileselect/FileSelectActivity$CollectPassword;->this$0:Lcom/keepassdroid/fileselect/FileSelectActivity;

    iget-object v2, p0, Lcom/keepassdroid/fileselect/FileSelectActivity$CollectPassword;->mOnFinish:Lcom/keepassdroid/database/edit/FileOnFinish;

    invoke-direct {v0, v1, v2}, Lcom/keepassdroid/SetPasswordDialog;-><init>(Landroid/content/Context;Lcom/keepassdroid/database/edit/FileOnFinish;)V

    .line 300
    .local v0, "password":Lcom/keepassdroid/SetPasswordDialog;
    invoke-virtual {v0}, Lcom/keepassdroid/SetPasswordDialog;->show()V

    .line 301
    return-void
.end method
