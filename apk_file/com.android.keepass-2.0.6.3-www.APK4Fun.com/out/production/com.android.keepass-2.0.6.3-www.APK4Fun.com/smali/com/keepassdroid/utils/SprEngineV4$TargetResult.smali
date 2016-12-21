.class public Lcom/keepassdroid/utils/SprEngineV4$TargetResult;
.super Ljava/lang/Object;
.source "SprEngineV4.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/keepassdroid/utils/SprEngineV4;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "TargetResult"
.end annotation


# instance fields
.field public entry:Lcom/keepassdroid/database/PwEntryV4;

.field final synthetic this$0:Lcom/keepassdroid/utils/SprEngineV4;

.field public wanted:C


# direct methods
.method public constructor <init>(Lcom/keepassdroid/utils/SprEngineV4;Lcom/keepassdroid/database/PwEntryV4;C)V
    .locals 0
    .param p1, "this$0"    # Lcom/keepassdroid/utils/SprEngineV4;
    .param p2, "entry"    # Lcom/keepassdroid/database/PwEntryV4;
    .param p3, "wanted"    # C

    .prologue
    .line 42
    iput-object p1, p0, Lcom/keepassdroid/utils/SprEngineV4$TargetResult;->this$0:Lcom/keepassdroid/utils/SprEngineV4;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 43
    iput-object p2, p0, Lcom/keepassdroid/utils/SprEngineV4$TargetResult;->entry:Lcom/keepassdroid/database/PwEntryV4;

    .line 44
    iput-char p3, p0, Lcom/keepassdroid/utils/SprEngineV4$TargetResult;->wanted:C

    .line 45
    return-void
.end method
