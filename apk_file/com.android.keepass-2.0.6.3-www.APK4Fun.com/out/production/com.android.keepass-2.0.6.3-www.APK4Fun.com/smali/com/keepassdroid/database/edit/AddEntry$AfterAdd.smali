.class Lcom/keepassdroid/database/edit/AddEntry$AfterAdd;
.super Lcom/keepassdroid/database/edit/OnFinish;
.source "AddEntry.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/keepassdroid/database/edit/AddEntry;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "AfterAdd"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/keepassdroid/database/edit/AddEntry;


# direct methods
.method public constructor <init>(Lcom/keepassdroid/database/edit/AddEntry;Lcom/keepassdroid/database/edit/OnFinish;)V
    .locals 0
    .param p2, "finish"    # Lcom/keepassdroid/database/edit/OnFinish;

    .prologue
    .line 59
    iput-object p1, p0, Lcom/keepassdroid/database/edit/AddEntry$AfterAdd;->this$0:Lcom/keepassdroid/database/edit/AddEntry;

    .line 60
    invoke-direct {p0, p2}, Lcom/keepassdroid/database/edit/OnFinish;-><init>(Lcom/keepassdroid/database/edit/OnFinish;)V

    .line 61
    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .prologue
    .line 65
    iget-object v2, p0, Lcom/keepassdroid/database/edit/AddEntry$AfterAdd;->this$0:Lcom/keepassdroid/database/edit/AddEntry;

    iget-object v2, v2, Lcom/keepassdroid/database/edit/AddEntry;->mDb:Lcom/keepassdroid/Database;

    iget-object v1, v2, Lcom/keepassdroid/Database;->pm:Lcom/keepassdroid/database/PwDatabase;

    .line 66
    .local v1, "pm":Lcom/keepassdroid/database/PwDatabase;
    iget-boolean v2, p0, Lcom/keepassdroid/database/edit/AddEntry$AfterAdd;->mSuccess:Z

    if-eqz v2, :cond_0

    .line 68
    iget-object v2, p0, Lcom/keepassdroid/database/edit/AddEntry$AfterAdd;->this$0:Lcom/keepassdroid/database/edit/AddEntry;

    # getter for: Lcom/keepassdroid/database/edit/AddEntry;->mEntry:Lcom/keepassdroid/database/PwEntry;
    invoke-static {v2}, Lcom/keepassdroid/database/edit/AddEntry;->access$000(Lcom/keepassdroid/database/edit/AddEntry;)Lcom/keepassdroid/database/PwEntry;

    move-result-object v2

    invoke-virtual {v2}, Lcom/keepassdroid/database/PwEntry;->getParent()Lcom/keepassdroid/database/PwGroup;

    move-result-object v0

    .line 71
    .local v0, "parent":Lcom/keepassdroid/database/PwGroup;
    iget-object v2, p0, Lcom/keepassdroid/database/edit/AddEntry$AfterAdd;->this$0:Lcom/keepassdroid/database/edit/AddEntry;

    iget-object v2, v2, Lcom/keepassdroid/database/edit/AddEntry;->mDb:Lcom/keepassdroid/Database;

    iget-object v2, v2, Lcom/keepassdroid/Database;->dirty:Ljava/util/Set;

    invoke-interface {v2, v0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 77
    .end local v0    # "parent":Lcom/keepassdroid/database/PwGroup;
    :goto_0
    invoke-super {p0}, Lcom/keepassdroid/database/edit/OnFinish;->run()V

    .line 78
    return-void

    .line 74
    :cond_0
    iget-object v2, p0, Lcom/keepassdroid/database/edit/AddEntry$AfterAdd;->this$0:Lcom/keepassdroid/database/edit/AddEntry;

    # getter for: Lcom/keepassdroid/database/edit/AddEntry;->mEntry:Lcom/keepassdroid/database/PwEntry;
    invoke-static {v2}, Lcom/keepassdroid/database/edit/AddEntry;->access$000(Lcom/keepassdroid/database/edit/AddEntry;)Lcom/keepassdroid/database/PwEntry;

    move-result-object v2

    iget-object v3, p0, Lcom/keepassdroid/database/edit/AddEntry$AfterAdd;->this$0:Lcom/keepassdroid/database/edit/AddEntry;

    # getter for: Lcom/keepassdroid/database/edit/AddEntry;->mEntry:Lcom/keepassdroid/database/PwEntry;
    invoke-static {v3}, Lcom/keepassdroid/database/edit/AddEntry;->access$000(Lcom/keepassdroid/database/edit/AddEntry;)Lcom/keepassdroid/database/PwEntry;

    move-result-object v3

    invoke-virtual {v3}, Lcom/keepassdroid/database/PwEntry;->getParent()Lcom/keepassdroid/database/PwGroup;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lcom/keepassdroid/database/PwDatabase;->removeEntryFrom(Lcom/keepassdroid/database/PwEntry;Lcom/keepassdroid/database/PwGroup;)V

    goto :goto_0
.end method
