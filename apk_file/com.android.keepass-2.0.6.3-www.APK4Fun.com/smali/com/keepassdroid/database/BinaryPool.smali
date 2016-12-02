.class public Lcom/keepassdroid/database/BinaryPool;
.super Ljava/lang/Object;
.source "BinaryPool.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/keepassdroid/database/BinaryPool$AddBinaries;
    }
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z


# instance fields
.field private pool:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Lcom/keepassdroid/database/security/ProtectedBinary;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 29
    const-class v0, Lcom/keepassdroid/database/BinaryPool;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    sput-boolean v0, Lcom/keepassdroid/database/BinaryPool;->$assertionsDisabled:Z

    return-void

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 30
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/keepassdroid/database/BinaryPool;->pool:Ljava/util/HashMap;

    .line 34
    return-void
.end method

.method public constructor <init>(Lcom/keepassdroid/database/PwGroupV4;)V
    .locals 1
    .param p1, "rootGroup"    # Lcom/keepassdroid/database/PwGroupV4;

    .prologue
    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 30
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/keepassdroid/database/BinaryPool;->pool:Ljava/util/HashMap;

    .line 37
    invoke-direct {p0, p1}, Lcom/keepassdroid/database/BinaryPool;->build(Lcom/keepassdroid/database/PwGroupV4;)V

    .line 38
    return-void
.end method

.method static synthetic access$000(Lcom/keepassdroid/database/BinaryPool;Ljava/util/Map;)V
    .locals 0
    .param p0, "x0"    # Lcom/keepassdroid/database/BinaryPool;
    .param p1, "x1"    # Ljava/util/Map;

    .prologue
    .line 29
    invoke-direct {p0, p1}, Lcom/keepassdroid/database/BinaryPool;->poolAdd(Ljava/util/Map;)V

    return-void
.end method

.method private build(Lcom/keepassdroid/database/PwGroupV4;)V
    .locals 2
    .param p1, "rootGroup"    # Lcom/keepassdroid/database/PwGroupV4;

    .prologue
    const/4 v1, 0x0

    .line 91
    new-instance v0, Lcom/keepassdroid/database/BinaryPool$AddBinaries;

    invoke-direct {v0, p0, v1}, Lcom/keepassdroid/database/BinaryPool$AddBinaries;-><init>(Lcom/keepassdroid/database/BinaryPool;Lcom/keepassdroid/database/BinaryPool$1;)V

    .line 92
    .local v0, "eh":Lcom/keepassdroid/database/EntryHandler;
    invoke-virtual {p1, v1, v0}, Lcom/keepassdroid/database/PwGroupV4;->preOrderTraverseTree(Lcom/keepassdroid/database/GroupHandler;Lcom/keepassdroid/database/EntryHandler;)Z

    .line 93
    return-void
.end method

.method private poolAdd(Lcom/keepassdroid/database/security/ProtectedBinary;)V
    .locals 2
    .param p1, "pb"    # Lcom/keepassdroid/database/security/ProtectedBinary;

    .prologue
    .line 75
    sget-boolean v0, Lcom/keepassdroid/database/BinaryPool;->$assertionsDisabled:Z

    if-nez v0, :cond_0

    if-nez p1, :cond_0

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 77
    :cond_0
    invoke-virtual {p0, p1}, Lcom/keepassdroid/database/BinaryPool;->poolFind(Lcom/keepassdroid/database/security/ProtectedBinary;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 80
    :goto_0
    return-void

    .line 79
    :cond_1
    iget-object v0, p0, Lcom/keepassdroid/database/BinaryPool;->pool:Ljava/util/HashMap;

    iget-object v1, p0, Lcom/keepassdroid/database/BinaryPool;->pool:Ljava/util/HashMap;

    invoke-virtual {v1}, Ljava/util/HashMap;->size()I

    move-result v1

    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0
.end method

.method private poolAdd(Ljava/util/Map;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lcom/keepassdroid/database/security/ProtectedBinary;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 68
    .local p1, "dict":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lcom/keepassdroid/database/security/ProtectedBinary;>;"
    invoke-interface {p1}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/keepassdroid/database/security/ProtectedBinary;

    .line 69
    .local v0, "pb":Lcom/keepassdroid/database/security/ProtectedBinary;
    invoke-direct {p0, v0}, Lcom/keepassdroid/database/BinaryPool;->poolAdd(Lcom/keepassdroid/database/security/ProtectedBinary;)V

    goto :goto_0

    .line 72
    .end local v0    # "pb":Lcom/keepassdroid/database/security/ProtectedBinary;
    :cond_0
    return-void
.end method


# virtual methods
.method public entrySet()Ljava/util/Set;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<",
            "Ljava/util/Map$Entry",
            "<",
            "Ljava/lang/String;",
            "Lcom/keepassdroid/database/security/ProtectedBinary;",
            ">;>;"
        }
    .end annotation

    .prologue
    .line 49
    iget-object v0, p0, Lcom/keepassdroid/database/BinaryPool;->pool:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method public get(Ljava/lang/String;)Lcom/keepassdroid/database/security/ProtectedBinary;
    .locals 1
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 41
    iget-object v0, p0, Lcom/keepassdroid/database/BinaryPool;->pool:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/keepassdroid/database/security/ProtectedBinary;

    return-object v0
.end method

.method public poolFind(Lcom/keepassdroid/database/security/ProtectedBinary;)Ljava/lang/String;
    .locals 3
    .param p1, "pb"    # Lcom/keepassdroid/database/security/ProtectedBinary;

    .prologue
    .line 83
    iget-object v1, p0, Lcom/keepassdroid/database/BinaryPool;->pool:Ljava/util/HashMap;

    invoke-virtual {v1}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 84
    .local v0, "pair":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Lcom/keepassdroid/database/security/ProtectedBinary;>;"
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/keepassdroid/database/security/ProtectedBinary;

    invoke-virtual {v1, p1}, Lcom/keepassdroid/database/security/ProtectedBinary;->equals(Lcom/keepassdroid/database/security/ProtectedBinary;)Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 87
    .end local v0    # "pair":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Lcom/keepassdroid/database/security/ProtectedBinary;>;"
    :goto_0
    return-object v1

    :cond_1
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public put(Ljava/lang/String;Lcom/keepassdroid/database/security/ProtectedBinary;)Lcom/keepassdroid/database/security/ProtectedBinary;
    .locals 1
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "value"    # Lcom/keepassdroid/database/security/ProtectedBinary;

    .prologue
    .line 45
    iget-object v0, p0, Lcom/keepassdroid/database/BinaryPool;->pool:Ljava/util/HashMap;

    invoke-virtual {v0, p1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/keepassdroid/database/security/ProtectedBinary;

    return-object v0
.end method
