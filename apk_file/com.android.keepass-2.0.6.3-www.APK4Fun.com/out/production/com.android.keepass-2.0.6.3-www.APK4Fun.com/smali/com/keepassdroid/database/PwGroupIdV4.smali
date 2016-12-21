.class public Lcom/keepassdroid/database/PwGroupIdV4;
.super Lcom/keepassdroid/database/PwGroupId;
.source "PwGroupIdV4.java"


# instance fields
.field private uuid:Ljava/util/UUID;


# direct methods
.method public constructor <init>(Ljava/util/UUID;)V
    .locals 0
    .param p1, "u"    # Ljava/util/UUID;

    .prologue
    .line 8
    invoke-direct {p0}, Lcom/keepassdroid/database/PwGroupId;-><init>()V

    .line 9
    iput-object p1, p0, Lcom/keepassdroid/database/PwGroupIdV4;->uuid:Ljava/util/UUID;

    .line 10
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 3
    .param p1, "id"    # Ljava/lang/Object;

    .prologue
    .line 14
    instance-of v1, p1, Lcom/keepassdroid/database/PwGroupIdV4;

    if-nez v1, :cond_0

    .line 15
    const/4 v1, 0x0

    .line 20
    :goto_0
    return v1

    :cond_0
    move-object v0, p1

    .line 18
    check-cast v0, Lcom/keepassdroid/database/PwGroupIdV4;

    .line 20
    .local v0, "v4":Lcom/keepassdroid/database/PwGroupIdV4;
    iget-object v1, p0, Lcom/keepassdroid/database/PwGroupIdV4;->uuid:Ljava/util/UUID;

    iget-object v2, v0, Lcom/keepassdroid/database/PwGroupIdV4;->uuid:Ljava/util/UUID;

    invoke-virtual {v1, v2}, Ljava/util/UUID;->equals(Ljava/lang/Object;)Z

    move-result v1

    goto :goto_0
.end method

.method public getId()Ljava/util/UUID;
    .locals 1

    .prologue
    .line 29
    iget-object v0, p0, Lcom/keepassdroid/database/PwGroupIdV4;->uuid:Ljava/util/UUID;

    return-object v0
.end method

.method public hashCode()I
    .locals 1

    .prologue
    .line 25
    iget-object v0, p0, Lcom/keepassdroid/database/PwGroupIdV4;->uuid:Ljava/util/UUID;

    invoke-virtual {v0}, Ljava/util/UUID;->hashCode()I

    move-result v0

    return v0
.end method
