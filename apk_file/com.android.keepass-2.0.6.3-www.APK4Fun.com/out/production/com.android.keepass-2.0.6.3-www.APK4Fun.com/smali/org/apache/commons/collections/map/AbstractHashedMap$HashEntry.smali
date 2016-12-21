.class public Lorg/apache/commons/collections/map/AbstractHashedMap$HashEntry;
.super Ljava/lang/Object;
.source "AbstractHashedMap.java"

# interfaces
.implements Ljava/util/Map$Entry;
.implements Lorg/apache/commons/collections/KeyValue;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/commons/collections/map/AbstractHashedMap;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xc
    name = "HashEntry"
.end annotation


# instance fields
.field protected hashCode:I

.field protected key:Ljava/lang/Object;

.field protected next:Lorg/apache/commons/collections/map/AbstractHashedMap$HashEntry;

.field protected value:Ljava/lang/Object;


# direct methods
.method protected constructor <init>(Lorg/apache/commons/collections/map/AbstractHashedMap$HashEntry;ILjava/lang/Object;Ljava/lang/Object;)V
    .locals 0
    .param p1, "next"    # Lorg/apache/commons/collections/map/AbstractHashedMap$HashEntry;
    .param p2, "hashCode"    # I
    .param p3, "key"    # Ljava/lang/Object;
    .param p4, "value"    # Ljava/lang/Object;

    .prologue
    .line 1033
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1034
    iput-object p1, p0, Lorg/apache/commons/collections/map/AbstractHashedMap$HashEntry;->next:Lorg/apache/commons/collections/map/AbstractHashedMap$HashEntry;

    .line 1035
    iput p2, p0, Lorg/apache/commons/collections/map/AbstractHashedMap$HashEntry;->hashCode:I

    .line 1036
    iput-object p3, p0, Lorg/apache/commons/collections/map/AbstractHashedMap$HashEntry;->key:Ljava/lang/Object;

    .line 1037
    iput-object p4, p0, Lorg/apache/commons/collections/map/AbstractHashedMap$HashEntry;->value:Ljava/lang/Object;

    .line 1038
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 5
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 1055
    if-ne p1, p0, :cond_1

    .line 1064
    :cond_0
    :goto_0
    return v1

    .line 1058
    :cond_1
    instance-of v3, p1, Ljava/util/Map$Entry;

    if-nez v3, :cond_2

    move v1, v2

    .line 1059
    goto :goto_0

    :cond_2
    move-object v0, p1

    .line 1061
    check-cast v0, Ljava/util/Map$Entry;

    .line 1063
    .local v0, "other":Ljava/util/Map$Entry;
    invoke-virtual {p0}, Lorg/apache/commons/collections/map/AbstractHashedMap$HashEntry;->getKey()Ljava/lang/Object;

    move-result-object v3

    if-nez v3, :cond_4

    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    if-nez v3, :cond_3

    .line 1064
    :goto_1
    invoke-virtual {p0}, Lorg/apache/commons/collections/map/AbstractHashedMap$HashEntry;->getValue()Ljava/lang/Object;

    move-result-object v3

    if-nez v3, :cond_5

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    if-eqz v3, :cond_0

    :cond_3
    move v1, v2

    goto :goto_0

    .line 1063
    :cond_4
    invoke-virtual {p0}, Lorg/apache/commons/collections/map/AbstractHashedMap$HashEntry;->getKey()Ljava/lang/Object;

    move-result-object v3

    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3

    goto :goto_1

    .line 1064
    :cond_5
    invoke-virtual {p0}, Lorg/apache/commons/collections/map/AbstractHashedMap$HashEntry;->getValue()Ljava/lang/Object;

    move-result-object v3

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3

    goto :goto_0
.end method

.method public getKey()Ljava/lang/Object;
    .locals 2

    .prologue
    .line 1041
    iget-object v0, p0, Lorg/apache/commons/collections/map/AbstractHashedMap$HashEntry;->key:Ljava/lang/Object;

    sget-object v1, Lorg/apache/commons/collections/map/AbstractHashedMap;->NULL:Ljava/lang/Object;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x0

    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lorg/apache/commons/collections/map/AbstractHashedMap$HashEntry;->key:Ljava/lang/Object;

    goto :goto_0
.end method

.method public getValue()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 1045
    iget-object v0, p0, Lorg/apache/commons/collections/map/AbstractHashedMap$HashEntry;->value:Ljava/lang/Object;

    return-object v0
.end method

.method public hashCode()I
    .locals 3

    .prologue
    const/4 v1, 0x0

    .line 1068
    invoke-virtual {p0}, Lorg/apache/commons/collections/map/AbstractHashedMap$HashEntry;->getKey()Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_0

    move v0, v1

    .line 1069
    :goto_0
    invoke-virtual {p0}, Lorg/apache/commons/collections/map/AbstractHashedMap$HashEntry;->getValue()Ljava/lang/Object;

    move-result-object v2

    if-nez v2, :cond_1

    :goto_1
    xor-int/2addr v0, v1

    return v0

    .line 1068
    :cond_0
    invoke-virtual {p0}, Lorg/apache/commons/collections/map/AbstractHashedMap$HashEntry;->getKey()Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    goto :goto_0

    .line 1069
    :cond_1
    invoke-virtual {p0}, Lorg/apache/commons/collections/map/AbstractHashedMap$HashEntry;->getValue()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    move-result v1

    goto :goto_1
.end method

.method public setValue(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .param p1, "value"    # Ljava/lang/Object;

    .prologue
    .line 1049
    iget-object v0, p0, Lorg/apache/commons/collections/map/AbstractHashedMap$HashEntry;->value:Ljava/lang/Object;

    .line 1050
    .local v0, "old":Ljava/lang/Object;
    iput-object p1, p0, Lorg/apache/commons/collections/map/AbstractHashedMap$HashEntry;->value:Ljava/lang/Object;

    .line 1051
    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 1073
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {p0}, Lorg/apache/commons/collections/map/AbstractHashedMap$HashEntry;->getKey()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v0

    const/16 v1, 0x3d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {p0}, Lorg/apache/commons/collections/map/AbstractHashedMap$HashEntry;->getValue()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
