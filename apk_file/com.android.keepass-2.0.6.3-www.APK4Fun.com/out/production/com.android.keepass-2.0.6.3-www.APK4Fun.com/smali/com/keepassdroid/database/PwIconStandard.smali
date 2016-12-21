.class public Lcom/keepassdroid/database/PwIconStandard;
.super Lcom/keepassdroid/database/PwIcon;
.source "PwIconStandard.java"


# static fields
.field public static FIRST:Lcom/keepassdroid/database/PwIconStandard; = null

.field public static final FOLDER:I = 0x30

.field public static final TRASH_BIN:I = 0x2b


# instance fields
.field public final iconId:I


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 25
    new-instance v0, Lcom/keepassdroid/database/PwIconStandard;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Lcom/keepassdroid/database/PwIconStandard;-><init>(I)V

    sput-object v0, Lcom/keepassdroid/database/PwIconStandard;->FIRST:Lcom/keepassdroid/database/PwIconStandard;

    return-void
.end method

.method public constructor <init>(I)V
    .locals 0
    .param p1, "iconId"    # I

    .prologue
    .line 30
    invoke-direct {p0}, Lcom/keepassdroid/database/PwIcon;-><init>()V

    .line 31
    iput p1, p0, Lcom/keepassdroid/database/PwIconStandard;->iconId:I

    .line 32
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 5
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 49
    if-ne p0, p1, :cond_1

    .line 58
    :cond_0
    :goto_0
    return v1

    .line 51
    :cond_1
    if-nez p1, :cond_2

    move v1, v2

    .line 52
    goto :goto_0

    .line 53
    :cond_2
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    if-eq v3, v4, :cond_3

    move v1, v2

    .line 54
    goto :goto_0

    :cond_3
    move-object v0, p1

    .line 55
    check-cast v0, Lcom/keepassdroid/database/PwIconStandard;

    .line 56
    .local v0, "other":Lcom/keepassdroid/database/PwIconStandard;
    iget v3, p0, Lcom/keepassdroid/database/PwIconStandard;->iconId:I

    iget v4, v0, Lcom/keepassdroid/database/PwIconStandard;->iconId:I

    if-eq v3, v4, :cond_0

    move v1, v2

    .line 57
    goto :goto_0
.end method

.method public hashCode()I
    .locals 3

    .prologue
    .line 41
    const/16 v0, 0x1f

    .line 42
    .local v0, "prime":I
    const/4 v1, 0x1

    .line 43
    .local v1, "result":I
    iget v2, p0, Lcom/keepassdroid/database/PwIconStandard;->iconId:I

    add-int/lit8 v1, v2, 0x1f

    .line 44
    return v1
.end method

.method public isMetaStreamIcon()Z
    .locals 1

    .prologue
    .line 36
    iget v0, p0, Lcom/keepassdroid/database/PwIconStandard;->iconId:I

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
