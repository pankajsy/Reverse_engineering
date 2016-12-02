.class public abstract Lorg/apache/commons/collections/keyvalue/AbstractMapEntry;
.super Lorg/apache/commons/collections/keyvalue/AbstractKeyValue;
.source "AbstractMapEntry.java"

# interfaces
.implements Ljava/util/Map$Entry;


# direct methods
.method protected constructor <init>(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 0
    .param p1, "key"    # Ljava/lang/Object;
    .param p2, "value"    # Ljava/lang/Object;

    .prologue
    .line 42
    invoke-direct {p0, p1, p2}, Lorg/apache/commons/collections/keyvalue/AbstractKeyValue;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 43
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 5
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 71
    if-ne p1, p0, :cond_1

    .line 80
    :cond_0
    :goto_0
    return v1

    .line 74
    :cond_1
    instance-of v3, p1, Ljava/util/Map$Entry;

    if-nez v3, :cond_2

    move v1, v2

    .line 75
    goto :goto_0

    :cond_2
    move-object v0, p1

    .line 77
    check-cast v0, Ljava/util/Map$Entry;

    .line 79
    .local v0, "other":Ljava/util/Map$Entry;
    invoke-virtual {p0}, Lorg/apache/commons/collections/keyvalue/AbstractMapEntry;->getKey()Ljava/lang/Object;

    move-result-object v3

    if-nez v3, :cond_4

    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    if-nez v3, :cond_3

    .line 80
    :goto_1
    invoke-virtual {p0}, Lorg/apache/commons/collections/keyvalue/AbstractMapEntry;->getValue()Ljava/lang/Object;

    move-result-object v3

    if-nez v3, :cond_5

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    if-eqz v3, :cond_0

    :cond_3
    move v1, v2

    goto :goto_0

    .line 79
    :cond_4
    invoke-virtual {p0}, Lorg/apache/commons/collections/keyvalue/AbstractMapEntry;->getKey()Ljava/lang/Object;

    move-result-object v3

    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3

    goto :goto_1

    .line 80
    :cond_5
    invoke-virtual {p0}, Lorg/apache/commons/collections/keyvalue/AbstractMapEntry;->getValue()Ljava/lang/Object;

    move-result-object v3

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3

    goto :goto_0
.end method

.method public hashCode()I
    .locals 3

    .prologue
    const/4 v1, 0x0

    .line 91
    invoke-virtual {p0}, Lorg/apache/commons/collections/keyvalue/AbstractMapEntry;->getKey()Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_0

    move v0, v1

    .line 92
    :goto_0
    invoke-virtual {p0}, Lorg/apache/commons/collections/keyvalue/AbstractMapEntry;->getValue()Ljava/lang/Object;

    move-result-object v2

    if-nez v2, :cond_1

    :goto_1
    xor-int/2addr v0, v1

    return v0

    .line 91
    :cond_0
    invoke-virtual {p0}, Lorg/apache/commons/collections/keyvalue/AbstractMapEntry;->getKey()Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    goto :goto_0

    .line 92
    :cond_1
    invoke-virtual {p0}, Lorg/apache/commons/collections/keyvalue/AbstractMapEntry;->getValue()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    move-result v1

    goto :goto_1
.end method

.method public setValue(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .param p1, "value"    # Ljava/lang/Object;

    .prologue
    .line 57
    iget-object v0, p0, Lorg/apache/commons/collections/keyvalue/AbstractMapEntry;->value:Ljava/lang/Object;

    .line 58
    .local v0, "answer":Ljava/lang/Object;
    iput-object p1, p0, Lorg/apache/commons/collections/keyvalue/AbstractMapEntry;->value:Ljava/lang/Object;

    .line 59
    return-object v0
.end method
