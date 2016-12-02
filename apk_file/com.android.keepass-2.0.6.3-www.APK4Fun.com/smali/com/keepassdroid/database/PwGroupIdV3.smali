.class public Lcom/keepassdroid/database/PwGroupIdV3;
.super Lcom/keepassdroid/database/PwGroupId;
.source "PwGroupIdV3.java"


# instance fields
.field private id:I


# direct methods
.method public constructor <init>(I)V
    .locals 0
    .param p1, "i"    # I

    .prologue
    .line 26
    invoke-direct {p0}, Lcom/keepassdroid/database/PwGroupId;-><init>()V

    .line 27
    iput p1, p0, Lcom/keepassdroid/database/PwGroupIdV3;->id:I

    .line 28
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 4
    .param p1, "compare"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x0

    .line 32
    instance-of v2, p1, Lcom/keepassdroid/database/PwGroupIdV3;

    if-nez v2, :cond_1

    .line 37
    :cond_0
    :goto_0
    return v1

    :cond_1
    move-object v0, p1

    .line 36
    check-cast v0, Lcom/keepassdroid/database/PwGroupIdV3;

    .line 37
    .local v0, "cmp":Lcom/keepassdroid/database/PwGroupIdV3;
    iget v2, p0, Lcom/keepassdroid/database/PwGroupIdV3;->id:I

    iget v3, v0, Lcom/keepassdroid/database/PwGroupIdV3;->id:I

    if-ne v2, v3, :cond_0

    const/4 v1, 0x1

    goto :goto_0
.end method

.method public getId()I
    .locals 1

    .prologue
    .line 47
    iget v0, p0, Lcom/keepassdroid/database/PwGroupIdV3;->id:I

    return v0
.end method

.method public hashCode()I
    .locals 2

    .prologue
    .line 42
    iget v1, p0, Lcom/keepassdroid/database/PwGroupIdV3;->id:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    .line 43
    .local v0, "i":Ljava/lang/Integer;
    invoke-virtual {v0}, Ljava/lang/Integer;->hashCode()I

    move-result v1

    return v1
.end method
