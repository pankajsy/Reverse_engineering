.class public Lcom/keepassdroid/GroupActivityV4;
.super Lcom/keepassdroid/GroupActivity;
.source "GroupActivityV4.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 29
    invoke-direct {p0}, Lcom/keepassdroid/GroupActivity;-><init>()V

    return-void
.end method


# virtual methods
.method protected retrieveGroupId(Landroid/content/Intent;)Lcom/keepassdroid/database/PwGroupId;
    .locals 3
    .param p1, "i"    # Landroid/content/Intent;

    .prologue
    .line 33
    const-string v1, "entry"

    invoke-virtual {p1, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 35
    .local v0, "uuid":Ljava/lang/String;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    if-nez v1, :cond_1

    .line 36
    :cond_0
    const/4 v1, 0x0

    .line 39
    :goto_0
    return-object v1

    :cond_1
    new-instance v1, Lcom/keepassdroid/database/PwGroupIdV4;

    invoke-static {v0}, Ljava/util/UUID;->fromString(Ljava/lang/String;)Ljava/util/UUID;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/keepassdroid/database/PwGroupIdV4;-><init>(Ljava/util/UUID;)V

    goto :goto_0
.end method

.method protected setupButtons()V
    .locals 1

    .prologue
    .line 44
    invoke-super {p0}, Lcom/keepassdroid/GroupActivity;->setupButtons()V

    .line 45
    iget-boolean v0, p0, Lcom/keepassdroid/GroupActivityV4;->readOnly:Z

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    iput-boolean v0, p0, Lcom/keepassdroid/GroupActivityV4;->addEntryEnabled:Z

    .line 46
    return-void

    .line 45
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
