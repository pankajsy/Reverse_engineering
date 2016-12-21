.class Lcom/keepassdroid/database/edit/SetPassword$AfterSave;
.super Lcom/keepassdroid/database/edit/OnFinish;
.source "SetPassword.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/keepassdroid/database/edit/SetPassword;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "AfterSave"
.end annotation


# instance fields
.field private mBackup:[B

.field final synthetic this$0:Lcom/keepassdroid/database/edit/SetPassword;


# direct methods
.method public constructor <init>(Lcom/keepassdroid/database/edit/SetPassword;[BLcom/keepassdroid/database/edit/OnFinish;)V
    .locals 0
    .param p2, "backup"    # [B
    .param p3, "finish"    # Lcom/keepassdroid/database/edit/OnFinish;

    .prologue
    .line 98
    iput-object p1, p0, Lcom/keepassdroid/database/edit/SetPassword$AfterSave;->this$0:Lcom/keepassdroid/database/edit/SetPassword;

    .line 99
    invoke-direct {p0, p3}, Lcom/keepassdroid/database/edit/OnFinish;-><init>(Lcom/keepassdroid/database/edit/OnFinish;)V

    .line 101
    iput-object p2, p0, Lcom/keepassdroid/database/edit/SetPassword$AfterSave;->mBackup:[B

    .line 102
    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 106
    iget-boolean v0, p0, Lcom/keepassdroid/database/edit/SetPassword$AfterSave;->mSuccess:Z

    if-nez v0, :cond_0

    .line 108
    iget-object v0, p0, Lcom/keepassdroid/database/edit/SetPassword$AfterSave;->this$0:Lcom/keepassdroid/database/edit/SetPassword;

    iget-object v1, p0, Lcom/keepassdroid/database/edit/SetPassword$AfterSave;->this$0:Lcom/keepassdroid/database/edit/SetPassword;

    # getter for: Lcom/keepassdroid/database/edit/SetPassword;->mDb:Lcom/keepassdroid/Database;
    invoke-static {v1}, Lcom/keepassdroid/database/edit/SetPassword;->access$000(Lcom/keepassdroid/database/edit/SetPassword;)Lcom/keepassdroid/Database;

    move-result-object v1

    iget-object v1, v1, Lcom/keepassdroid/Database;->pm:Lcom/keepassdroid/database/PwDatabase;

    iget-object v1, v1, Lcom/keepassdroid/database/PwDatabase;->masterKey:[B

    # invokes: Lcom/keepassdroid/database/edit/SetPassword;->erase([B)V
    invoke-static {v0, v1}, Lcom/keepassdroid/database/edit/SetPassword;->access$100(Lcom/keepassdroid/database/edit/SetPassword;[B)V

    .line 109
    iget-object v0, p0, Lcom/keepassdroid/database/edit/SetPassword$AfterSave;->this$0:Lcom/keepassdroid/database/edit/SetPassword;

    # getter for: Lcom/keepassdroid/database/edit/SetPassword;->mDb:Lcom/keepassdroid/Database;
    invoke-static {v0}, Lcom/keepassdroid/database/edit/SetPassword;->access$000(Lcom/keepassdroid/database/edit/SetPassword;)Lcom/keepassdroid/Database;

    move-result-object v0

    iget-object v0, v0, Lcom/keepassdroid/Database;->pm:Lcom/keepassdroid/database/PwDatabase;

    iget-object v1, p0, Lcom/keepassdroid/database/edit/SetPassword$AfterSave;->mBackup:[B

    iput-object v1, v0, Lcom/keepassdroid/database/PwDatabase;->masterKey:[B

    .line 112
    :cond_0
    invoke-super {p0}, Lcom/keepassdroid/database/edit/OnFinish;->run()V

    .line 113
    return-void
.end method
