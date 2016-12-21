.class public final enum Lcom/keepassdroid/database/CrsAlgorithm;
.super Ljava/lang/Enum;
.source "CrsAlgorithm.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/keepassdroid/database/CrsAlgorithm;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/keepassdroid/database/CrsAlgorithm;

.field public static final enum ArcFourVariant:Lcom/keepassdroid/database/CrsAlgorithm;

.field public static final enum Null:Lcom/keepassdroid/database/CrsAlgorithm;

.field public static final enum Salsa20:Lcom/keepassdroid/database/CrsAlgorithm;

.field public static final count:I = 0x3


# instance fields
.field public final id:I


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .prologue
    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 24
    new-instance v0, Lcom/keepassdroid/database/CrsAlgorithm;

    const-string v1, "Null"

    invoke-direct {v0, v1, v2, v2}, Lcom/keepassdroid/database/CrsAlgorithm;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/keepassdroid/database/CrsAlgorithm;->Null:Lcom/keepassdroid/database/CrsAlgorithm;

    .line 25
    new-instance v0, Lcom/keepassdroid/database/CrsAlgorithm;

    const-string v1, "ArcFourVariant"

    invoke-direct {v0, v1, v3, v3}, Lcom/keepassdroid/database/CrsAlgorithm;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/keepassdroid/database/CrsAlgorithm;->ArcFourVariant:Lcom/keepassdroid/database/CrsAlgorithm;

    .line 26
    new-instance v0, Lcom/keepassdroid/database/CrsAlgorithm;

    const-string v1, "Salsa20"

    invoke-direct {v0, v1, v4, v4}, Lcom/keepassdroid/database/CrsAlgorithm;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/keepassdroid/database/CrsAlgorithm;->Salsa20:Lcom/keepassdroid/database/CrsAlgorithm;

    .line 22
    const/4 v0, 0x3

    new-array v0, v0, [Lcom/keepassdroid/database/CrsAlgorithm;

    sget-object v1, Lcom/keepassdroid/database/CrsAlgorithm;->Null:Lcom/keepassdroid/database/CrsAlgorithm;

    aput-object v1, v0, v2

    sget-object v1, Lcom/keepassdroid/database/CrsAlgorithm;->ArcFourVariant:Lcom/keepassdroid/database/CrsAlgorithm;

    aput-object v1, v0, v3

    sget-object v1, Lcom/keepassdroid/database/CrsAlgorithm;->Salsa20:Lcom/keepassdroid/database/CrsAlgorithm;

    aput-object v1, v0, v4

    sput-object v0, Lcom/keepassdroid/database/CrsAlgorithm;->$VALUES:[Lcom/keepassdroid/database/CrsAlgorithm;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;II)V
    .locals 0
    .param p3, "num"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)V"
        }
    .end annotation

    .prologue
    .line 31
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 32
    iput p3, p0, Lcom/keepassdroid/database/CrsAlgorithm;->id:I

    .line 33
    return-void
.end method

.method public static fromId(I)Lcom/keepassdroid/database/CrsAlgorithm;
    .locals 5
    .param p0, "num"    # I

    .prologue
    .line 36
    invoke-static {}, Lcom/keepassdroid/database/CrsAlgorithm;->values()[Lcom/keepassdroid/database/CrsAlgorithm;

    move-result-object v2

    array-length v3, v2

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v3, :cond_1

    aget-object v0, v2, v1

    .line 37
    .local v0, "e":Lcom/keepassdroid/database/CrsAlgorithm;
    iget v4, v0, Lcom/keepassdroid/database/CrsAlgorithm;->id:I

    if-ne v4, p0, :cond_0

    .line 42
    .end local v0    # "e":Lcom/keepassdroid/database/CrsAlgorithm;
    :goto_1
    return-object v0

    .line 36
    .restart local v0    # "e":Lcom/keepassdroid/database/CrsAlgorithm;
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 42
    .end local v0    # "e":Lcom/keepassdroid/database/CrsAlgorithm;
    :cond_1
    const/4 v0, 0x0

    goto :goto_1
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/keepassdroid/database/CrsAlgorithm;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 22
    const-class v0, Lcom/keepassdroid/database/CrsAlgorithm;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/keepassdroid/database/CrsAlgorithm;

    return-object v0
.end method

.method public static values()[Lcom/keepassdroid/database/CrsAlgorithm;
    .locals 1

    .prologue
    .line 22
    sget-object v0, Lcom/keepassdroid/database/CrsAlgorithm;->$VALUES:[Lcom/keepassdroid/database/CrsAlgorithm;

    invoke-virtual {v0}, [Lcom/keepassdroid/database/CrsAlgorithm;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/keepassdroid/database/CrsAlgorithm;

    return-object v0
.end method
