.class public Lcom/keepassdroid/GroupActivityV3;
.super Lcom/keepassdroid/GroupActivity;
.source "GroupActivityV3.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 26
    invoke-direct {p0}, Lcom/keepassdroid/GroupActivity;-><init>()V

    return-void
.end method


# virtual methods
.method protected bridge synthetic retrieveGroupId(Landroid/content/Intent;)Lcom/keepassdroid/database/PwGroupId;
    .locals 1

    .prologue
    .line 26
    invoke-virtual {p0, p1}, Lcom/keepassdroid/GroupActivityV3;->retrieveGroupId(Landroid/content/Intent;)Lcom/keepassdroid/database/PwGroupIdV3;

    move-result-object v0

    return-object v0
.end method

.method protected retrieveGroupId(Landroid/content/Intent;)Lcom/keepassdroid/database/PwGroupIdV3;
    .locals 3
    .param p1, "i"    # Landroid/content/Intent;

    .prologue
    const/4 v2, -0x1

    .line 30
    const-string v1, "entry"

    invoke-virtual {p1, v1, v2}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v0

    .line 32
    .local v0, "id":I
    if-ne v0, v2, :cond_0

    .line 33
    const/4 v1, 0x0

    .line 36
    :goto_0
    return-object v1

    :cond_0
    new-instance v1, Lcom/keepassdroid/database/PwGroupIdV3;

    invoke-direct {v1, v0}, Lcom/keepassdroid/database/PwGroupIdV3;-><init>(I)V

    goto :goto_0
.end method

.method protected setupButtons()V
    .locals 1

    .prologue
    .line 41
    invoke-super {p0}, Lcom/keepassdroid/GroupActivity;->setupButtons()V

    .line 42
    iget-boolean v0, p0, Lcom/keepassdroid/GroupActivityV3;->isRoot:Z

    if-nez v0, :cond_0

    iget-boolean v0, p0, Lcom/keepassdroid/GroupActivityV3;->readOnly:Z

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    iput-boolean v0, p0, Lcom/keepassdroid/GroupActivityV3;->addEntryEnabled:Z

    .line 43
    return-void

    .line 42
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
