.class Lorg/apache/commons/collections/map/AbstractReferenceMap$ReferenceMapIterator;
.super Lorg/apache/commons/collections/map/AbstractReferenceMap$ReferenceEntrySetIterator;
.source "AbstractReferenceMap.java"

# interfaces
.implements Lorg/apache/commons/collections/MapIterator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/commons/collections/map/AbstractReferenceMap;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "ReferenceMapIterator"
.end annotation


# direct methods
.method protected constructor <init>(Lorg/apache/commons/collections/map/AbstractReferenceMap;)V
    .locals 0
    .param p1, "parent"    # Lorg/apache/commons/collections/map/AbstractReferenceMap;

    .prologue
    .line 840
    invoke-direct {p0, p1}, Lorg/apache/commons/collections/map/AbstractReferenceMap$ReferenceEntrySetIterator;-><init>(Lorg/apache/commons/collections/map/AbstractReferenceMap;)V

    .line 841
    return-void
.end method


# virtual methods
.method public getKey()Ljava/lang/Object;
    .locals 3

    .prologue
    .line 848
    invoke-virtual {p0}, Lorg/apache/commons/collections/map/AbstractReferenceMap$ReferenceMapIterator;->currentEntry()Lorg/apache/commons/collections/map/AbstractReferenceMap$ReferenceEntry;

    move-result-object v0

    .line 849
    .local v0, "current":Lorg/apache/commons/collections/map/AbstractHashedMap$HashEntry;
    if-nez v0, :cond_0

    .line 850
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "getKey() can only be called after next() and before remove()"

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 852
    :cond_0
    invoke-virtual {v0}, Lorg/apache/commons/collections/map/AbstractHashedMap$HashEntry;->getKey()Ljava/lang/Object;

    move-result-object v1

    return-object v1
.end method

.method public getValue()Ljava/lang/Object;
    .locals 3

    .prologue
    .line 856
    invoke-virtual {p0}, Lorg/apache/commons/collections/map/AbstractReferenceMap$ReferenceMapIterator;->currentEntry()Lorg/apache/commons/collections/map/AbstractReferenceMap$ReferenceEntry;

    move-result-object v0

    .line 857
    .local v0, "current":Lorg/apache/commons/collections/map/AbstractHashedMap$HashEntry;
    if-nez v0, :cond_0

    .line 858
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "getValue() can only be called after next() and before remove()"

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 860
    :cond_0
    invoke-virtual {v0}, Lorg/apache/commons/collections/map/AbstractHashedMap$HashEntry;->getValue()Ljava/lang/Object;

    move-result-object v1

    return-object v1
.end method

.method public next()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 844
    invoke-virtual {p0}, Lorg/apache/commons/collections/map/AbstractReferenceMap$ReferenceMapIterator;->nextEntry()Lorg/apache/commons/collections/map/AbstractReferenceMap$ReferenceEntry;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/commons/collections/map/AbstractReferenceMap$ReferenceEntry;->getKey()Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public setValue(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 3
    .param p1, "value"    # Ljava/lang/Object;

    .prologue
    .line 864
    invoke-virtual {p0}, Lorg/apache/commons/collections/map/AbstractReferenceMap$ReferenceMapIterator;->currentEntry()Lorg/apache/commons/collections/map/AbstractReferenceMap$ReferenceEntry;

    move-result-object v0

    .line 865
    .local v0, "current":Lorg/apache/commons/collections/map/AbstractHashedMap$HashEntry;
    if-nez v0, :cond_0

    .line 866
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "setValue() can only be called after next() and before remove()"

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 868
    :cond_0
    invoke-virtual {v0, p1}, Lorg/apache/commons/collections/map/AbstractHashedMap$HashEntry;->setValue(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    return-object v1
.end method
