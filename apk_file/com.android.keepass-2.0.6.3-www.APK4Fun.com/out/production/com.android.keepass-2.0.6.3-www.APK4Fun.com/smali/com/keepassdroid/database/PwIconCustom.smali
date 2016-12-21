.class public Lcom/keepassdroid/database/PwIconCustom;
.super Lcom/keepassdroid/database/PwIcon;
.source "PwIconCustom.java"


# static fields
.field public static final ZERO:Lcom/keepassdroid/database/PwIconCustom;


# instance fields
.field public imageData:[B

.field public final uuid:Ljava/util/UUID;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 25
    new-instance v0, Lcom/keepassdroid/database/PwIconCustom;

    sget-object v1, Lcom/keepassdroid/database/PwDatabaseV4;->UUID_ZERO:Ljava/util/UUID;

    const/4 v2, 0x0

    new-array v2, v2, [B

    invoke-direct {v0, v1, v2}, Lcom/keepassdroid/database/PwIconCustom;-><init>(Ljava/util/UUID;[B)V

    sput-object v0, Lcom/keepassdroid/database/PwIconCustom;->ZERO:Lcom/keepassdroid/database/PwIconCustom;

    return-void
.end method

.method public constructor <init>(Ljava/util/UUID;[B)V
    .locals 0
    .param p1, "u"    # Ljava/util/UUID;
    .param p2, "data"    # [B

    .prologue
    .line 30
    invoke-direct {p0}, Lcom/keepassdroid/database/PwIcon;-><init>()V

    .line 31
    iput-object p1, p0, Lcom/keepassdroid/database/PwIconCustom;->uuid:Ljava/util/UUID;

    .line 32
    iput-object p2, p0, Lcom/keepassdroid/database/PwIconCustom;->imageData:[B

    .line 33
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 5
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 45
    if-ne p0, p1, :cond_1

    .line 57
    :cond_0
    :goto_0
    return v1

    .line 47
    :cond_1
    if-nez p1, :cond_2

    move v1, v2

    .line 48
    goto :goto_0

    .line 49
    :cond_2
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    if-eq v3, v4, :cond_3

    move v1, v2

    .line 50
    goto :goto_0

    :cond_3
    move-object v0, p1

    .line 51
    check-cast v0, Lcom/keepassdroid/database/PwIconCustom;

    .line 52
    .local v0, "other":Lcom/keepassdroid/database/PwIconCustom;
    iget-object v3, p0, Lcom/keepassdroid/database/PwIconCustom;->uuid:Ljava/util/UUID;

    if-nez v3, :cond_4

    .line 53
    iget-object v3, v0, Lcom/keepassdroid/database/PwIconCustom;->uuid:Ljava/util/UUID;

    if-eqz v3, :cond_0

    move v1, v2

    .line 54
    goto :goto_0

    .line 55
    :cond_4
    iget-object v3, p0, Lcom/keepassdroid/database/PwIconCustom;->uuid:Ljava/util/UUID;

    iget-object v4, v0, Lcom/keepassdroid/database/PwIconCustom;->uuid:Ljava/util/UUID;

    invoke-virtual {v3, v4}, Ljava/util/UUID;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    move v1, v2

    .line 56
    goto :goto_0
.end method

.method public hashCode()I
    .locals 3

    .prologue
    .line 37
    const/16 v0, 0x1f

    .line 38
    .local v0, "prime":I
    const/4 v1, 0x1

    .line 39
    .local v1, "result":I
    iget-object v2, p0, Lcom/keepassdroid/database/PwIconCustom;->uuid:Ljava/util/UUID;

    if-nez v2, :cond_0

    const/4 v2, 0x0

    :goto_0
    add-int/lit8 v1, v2, 0x1f

    .line 40
    return v1

    .line 39
    :cond_0
    iget-object v2, p0, Lcom/keepassdroid/database/PwIconCustom;->uuid:Ljava/util/UUID;

    invoke-virtual {v2}, Ljava/util/UUID;->hashCode()I

    move-result v2

    goto :goto_0
.end method
