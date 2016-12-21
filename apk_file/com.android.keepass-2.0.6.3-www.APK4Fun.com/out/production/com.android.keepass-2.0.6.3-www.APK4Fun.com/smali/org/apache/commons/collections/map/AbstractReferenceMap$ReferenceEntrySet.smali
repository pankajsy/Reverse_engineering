.class Lorg/apache/commons/collections/map/AbstractReferenceMap$ReferenceEntrySet;
.super Lorg/apache/commons/collections/map/AbstractHashedMap$EntrySet;
.source "AbstractReferenceMap.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/commons/collections/map/AbstractReferenceMap;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "ReferenceEntrySet"
.end annotation


# direct methods
.method protected constructor <init>(Lorg/apache/commons/collections/map/AbstractHashedMap;)V
    .locals 0
    .param p1, "parent"    # Lorg/apache/commons/collections/map/AbstractHashedMap;

    .prologue
    .line 484
    invoke-direct {p0, p1}, Lorg/apache/commons/collections/map/AbstractHashedMap$EntrySet;-><init>(Lorg/apache/commons/collections/map/AbstractHashedMap;)V

    .line 485
    return-void
.end method


# virtual methods
.method public toArray()[Ljava/lang/Object;
    .locals 1

    .prologue
    .line 488
    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/Object;

    invoke-virtual {p0, v0}, Lorg/apache/commons/collections/map/AbstractReferenceMap$ReferenceEntrySet;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public toArray([Ljava/lang/Object;)[Ljava/lang/Object;
    .locals 6
    .param p1, "arr"    # [Ljava/lang/Object;

    .prologue
    .line 493
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 494
    .local v2, "list":Ljava/util/ArrayList;
    invoke-virtual {p0}, Lorg/apache/commons/collections/map/AbstractReferenceMap$ReferenceEntrySet;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 495
    .local v1, "iterator":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 496
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 497
    .local v0, "e":Ljava/util/Map$Entry;
    new-instance v3, Lorg/apache/commons/collections/keyvalue/DefaultMapEntry;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v4

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v5

    invoke-direct {v3, v4, v5}, Lorg/apache/commons/collections/keyvalue/DefaultMapEntry;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 499
    .end local v0    # "e":Ljava/util/Map$Entry;
    :cond_0
    invoke-virtual {v2, p1}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v3

    return-object v3
.end method
