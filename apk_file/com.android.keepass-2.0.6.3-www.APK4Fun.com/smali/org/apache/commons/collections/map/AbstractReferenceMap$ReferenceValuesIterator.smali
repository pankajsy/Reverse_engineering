.class Lorg/apache/commons/collections/map/AbstractReferenceMap$ReferenceValuesIterator;
.super Lorg/apache/commons/collections/map/AbstractReferenceMap$ReferenceEntrySetIterator;
.source "AbstractReferenceMap.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/commons/collections/map/AbstractReferenceMap;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "ReferenceValuesIterator"
.end annotation


# direct methods
.method constructor <init>(Lorg/apache/commons/collections/map/AbstractReferenceMap;)V
    .locals 0
    .param p1, "parent"    # Lorg/apache/commons/collections/map/AbstractReferenceMap;

    .prologue
    .line 826
    invoke-direct {p0, p1}, Lorg/apache/commons/collections/map/AbstractReferenceMap$ReferenceEntrySetIterator;-><init>(Lorg/apache/commons/collections/map/AbstractReferenceMap;)V

    .line 827
    return-void
.end method


# virtual methods
.method public next()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 830
    invoke-virtual {p0}, Lorg/apache/commons/collections/map/AbstractReferenceMap$ReferenceValuesIterator;->nextEntry()Lorg/apache/commons/collections/map/AbstractReferenceMap$ReferenceEntry;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/commons/collections/map/AbstractReferenceMap$ReferenceEntry;->getValue()Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method
