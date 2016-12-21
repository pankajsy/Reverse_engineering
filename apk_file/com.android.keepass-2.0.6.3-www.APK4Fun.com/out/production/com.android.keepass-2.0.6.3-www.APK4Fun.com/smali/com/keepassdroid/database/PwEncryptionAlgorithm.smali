.class public final enum Lcom/keepassdroid/database/PwEncryptionAlgorithm;
.super Ljava/lang/Enum;
.source "PwEncryptionAlgorithm.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/keepassdroid/database/PwEncryptionAlgorithm;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/keepassdroid/database/PwEncryptionAlgorithm;

.field public static final enum Rjindal:Lcom/keepassdroid/database/PwEncryptionAlgorithm;

.field public static final enum Twofish:Lcom/keepassdroid/database/PwEncryptionAlgorithm;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 24
    new-instance v0, Lcom/keepassdroid/database/PwEncryptionAlgorithm;

    const-string v1, "Rjindal"

    invoke-direct {v0, v1, v2}, Lcom/keepassdroid/database/PwEncryptionAlgorithm;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/keepassdroid/database/PwEncryptionAlgorithm;->Rjindal:Lcom/keepassdroid/database/PwEncryptionAlgorithm;

    .line 25
    new-instance v0, Lcom/keepassdroid/database/PwEncryptionAlgorithm;

    const-string v1, "Twofish"

    invoke-direct {v0, v1, v3}, Lcom/keepassdroid/database/PwEncryptionAlgorithm;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/keepassdroid/database/PwEncryptionAlgorithm;->Twofish:Lcom/keepassdroid/database/PwEncryptionAlgorithm;

    .line 22
    const/4 v0, 0x2

    new-array v0, v0, [Lcom/keepassdroid/database/PwEncryptionAlgorithm;

    sget-object v1, Lcom/keepassdroid/database/PwEncryptionAlgorithm;->Rjindal:Lcom/keepassdroid/database/PwEncryptionAlgorithm;

    aput-object v1, v0, v2

    sget-object v1, Lcom/keepassdroid/database/PwEncryptionAlgorithm;->Twofish:Lcom/keepassdroid/database/PwEncryptionAlgorithm;

    aput-object v1, v0, v3

    sput-object v0, Lcom/keepassdroid/database/PwEncryptionAlgorithm;->$VALUES:[Lcom/keepassdroid/database/PwEncryptionAlgorithm;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .prologue
    .line 22
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/keepassdroid/database/PwEncryptionAlgorithm;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 22
    const-class v0, Lcom/keepassdroid/database/PwEncryptionAlgorithm;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/keepassdroid/database/PwEncryptionAlgorithm;

    return-object v0
.end method

.method public static values()[Lcom/keepassdroid/database/PwEncryptionAlgorithm;
    .locals 1

    .prologue
    .line 22
    sget-object v0, Lcom/keepassdroid/database/PwEncryptionAlgorithm;->$VALUES:[Lcom/keepassdroid/database/PwEncryptionAlgorithm;

    invoke-virtual {v0}, [Lcom/keepassdroid/database/PwEncryptionAlgorithm;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/keepassdroid/database/PwEncryptionAlgorithm;

    return-object v0
.end method
