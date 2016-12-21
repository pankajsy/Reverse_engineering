.class public Lcom/keepassdroid/database/PwDbHeaderV4$PwDbHeaderV4Fields;
.super Ljava/lang/Object;
.source "PwDbHeaderV4.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/keepassdroid/database/PwDbHeaderV4;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "PwDbHeaderV4Fields"
.end annotation


# static fields
.field public static final CipherID:B = 0x2t

.field public static final Comment:B = 0x1t

.field public static final CompressionFlags:B = 0x3t

.field public static final EncryptionIV:B = 0x7t

.field public static final EndOfHeader:B = 0x0t

.field public static final InnerRandomStreamID:B = 0xat

.field public static final MasterSeed:B = 0x4t

.field public static final ProtectedStreamKey:B = 0x8t

.field public static final StreamStartBytes:B = 0x9t

.field public static final TransformRounds:B = 0x6t

.field public static final TransformSeed:B = 0x5t


# instance fields
.field final synthetic this$0:Lcom/keepassdroid/database/PwDbHeaderV4;


# direct methods
.method public constructor <init>(Lcom/keepassdroid/database/PwDbHeaderV4;)V
    .locals 0
    .param p1, "this$0"    # Lcom/keepassdroid/database/PwDbHeaderV4;

    .prologue
    .line 39
    iput-object p1, p0, Lcom/keepassdroid/database/PwDbHeaderV4$PwDbHeaderV4Fields;->this$0:Lcom/keepassdroid/database/PwDbHeaderV4;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
