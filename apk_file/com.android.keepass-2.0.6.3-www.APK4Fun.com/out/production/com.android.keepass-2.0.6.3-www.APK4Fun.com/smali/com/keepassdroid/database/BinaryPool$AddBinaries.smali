.class Lcom/keepassdroid/database/BinaryPool$AddBinaries;
.super Lcom/keepassdroid/database/EntryHandler;
.source "BinaryPool.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/keepassdroid/database/BinaryPool;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "AddBinaries"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/keepassdroid/database/EntryHandler",
        "<",
        "Lcom/keepassdroid/database/PwEntryV4;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/keepassdroid/database/BinaryPool;


# direct methods
.method private constructor <init>(Lcom/keepassdroid/database/BinaryPool;)V
    .locals 0

    .prologue
    .line 52
    iput-object p1, p0, Lcom/keepassdroid/database/BinaryPool$AddBinaries;->this$0:Lcom/keepassdroid/database/BinaryPool;

    invoke-direct {p0}, Lcom/keepassdroid/database/EntryHandler;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/keepassdroid/database/BinaryPool;Lcom/keepassdroid/database/BinaryPool$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/keepassdroid/database/BinaryPool;
    .param p2, "x1"    # Lcom/keepassdroid/database/BinaryPool$1;

    .prologue
    .line 52
    invoke-direct {p0, p1}, Lcom/keepassdroid/database/BinaryPool$AddBinaries;-><init>(Lcom/keepassdroid/database/BinaryPool;)V

    return-void
.end method


# virtual methods
.method public bridge synthetic operate(Lcom/keepassdroid/database/PwEntry;)Z
    .locals 1

    .prologue
    .line 52
    check-cast p1, Lcom/keepassdroid/database/PwEntryV4;

    invoke-virtual {p0, p1}, Lcom/keepassdroid/database/BinaryPool$AddBinaries;->operate(Lcom/keepassdroid/database/PwEntryV4;)Z

    move-result v0

    return v0
.end method

.method public operate(Lcom/keepassdroid/database/PwEntryV4;)Z
    .locals 4
    .param p1, "entry"    # Lcom/keepassdroid/database/PwEntryV4;

    .prologue
    .line 56
    iget-object v1, p1, Lcom/keepassdroid/database/PwEntryV4;->history:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/keepassdroid/database/PwEntryV4;

    .line 57
    .local v0, "histEntry":Lcom/keepassdroid/database/PwEntryV4;
    iget-object v2, p0, Lcom/keepassdroid/database/BinaryPool$AddBinaries;->this$0:Lcom/keepassdroid/database/BinaryPool;

    iget-object v3, v0, Lcom/keepassdroid/database/PwEntryV4;->binaries:Ljava/util/HashMap;

    # invokes: Lcom/keepassdroid/database/BinaryPool;->poolAdd(Ljava/util/Map;)V
    invoke-static {v2, v3}, Lcom/keepassdroid/database/BinaryPool;->access$000(Lcom/keepassdroid/database/BinaryPool;Ljava/util/Map;)V

    goto :goto_0

    .line 61
    .end local v0    # "histEntry":Lcom/keepassdroid/database/PwEntryV4;
    :cond_0
    iget-object v1, p0, Lcom/keepassdroid/database/BinaryPool$AddBinaries;->this$0:Lcom/keepassdroid/database/BinaryPool;

    iget-object v2, p1, Lcom/keepassdroid/database/PwEntryV4;->binaries:Ljava/util/HashMap;

    # invokes: Lcom/keepassdroid/database/BinaryPool;->poolAdd(Ljava/util/Map;)V
    invoke-static {v1, v2}, Lcom/keepassdroid/database/BinaryPool;->access$000(Lcom/keepassdroid/database/BinaryPool;Ljava/util/Map;)V

    .line 62
    const/4 v1, 0x1

    return v1
.end method
