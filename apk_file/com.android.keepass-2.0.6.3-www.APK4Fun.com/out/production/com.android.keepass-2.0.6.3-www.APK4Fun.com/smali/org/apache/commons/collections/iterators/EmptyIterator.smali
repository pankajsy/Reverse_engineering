.class public Lorg/apache/commons/collections/iterators/EmptyIterator;
.super Lorg/apache/commons/collections/iterators/AbstractEmptyIterator;
.source "EmptyIterator.java"

# interfaces
.implements Lorg/apache/commons/collections/ResettableIterator;


# static fields
.field public static final INSTANCE:Ljava/util/Iterator;

.field public static final RESETTABLE_INSTANCE:Lorg/apache/commons/collections/ResettableIterator;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 41
    new-instance v0, Lorg/apache/commons/collections/iterators/EmptyIterator;

    invoke-direct {v0}, Lorg/apache/commons/collections/iterators/EmptyIterator;-><init>()V

    sput-object v0, Lorg/apache/commons/collections/iterators/EmptyIterator;->RESETTABLE_INSTANCE:Lorg/apache/commons/collections/ResettableIterator;

    .line 46
    sget-object v0, Lorg/apache/commons/collections/iterators/EmptyIterator;->RESETTABLE_INSTANCE:Lorg/apache/commons/collections/ResettableIterator;

    sput-object v0, Lorg/apache/commons/collections/iterators/EmptyIterator;->INSTANCE:Ljava/util/Iterator;

    return-void
.end method

.method protected constructor <init>()V
    .locals 0

    .prologue
    .line 52
    invoke-direct {p0}, Lorg/apache/commons/collections/iterators/AbstractEmptyIterator;-><init>()V

    .line 53
    return-void
.end method


# virtual methods
.method public bridge synthetic add(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 35
    invoke-super {p0, p1}, Lorg/apache/commons/collections/iterators/AbstractEmptyIterator;->add(Ljava/lang/Object;)V

    return-void
.end method

.method public bridge synthetic getKey()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 35
    invoke-super {p0}, Lorg/apache/commons/collections/iterators/AbstractEmptyIterator;->getKey()Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic getValue()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 35
    invoke-super {p0}, Lorg/apache/commons/collections/iterators/AbstractEmptyIterator;->getValue()Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic hasNext()Z
    .locals 1

    .prologue
    .line 35
    invoke-super {p0}, Lorg/apache/commons/collections/iterators/AbstractEmptyIterator;->hasNext()Z

    move-result v0

    return v0
.end method

.method public bridge synthetic hasPrevious()Z
    .locals 1

    .prologue
    .line 35
    invoke-super {p0}, Lorg/apache/commons/collections/iterators/AbstractEmptyIterator;->hasPrevious()Z

    move-result v0

    return v0
.end method

.method public bridge synthetic next()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 35
    invoke-super {p0}, Lorg/apache/commons/collections/iterators/AbstractEmptyIterator;->next()Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic nextIndex()I
    .locals 1

    .prologue
    .line 35
    invoke-super {p0}, Lorg/apache/commons/collections/iterators/AbstractEmptyIterator;->nextIndex()I

    move-result v0

    return v0
.end method

.method public bridge synthetic previous()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 35
    invoke-super {p0}, Lorg/apache/commons/collections/iterators/AbstractEmptyIterator;->previous()Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic previousIndex()I
    .locals 1

    .prologue
    .line 35
    invoke-super {p0}, Lorg/apache/commons/collections/iterators/AbstractEmptyIterator;->previousIndex()I

    move-result v0

    return v0
.end method

.method public bridge synthetic remove()V
    .locals 0

    .prologue
    .line 35
    invoke-super {p0}, Lorg/apache/commons/collections/iterators/AbstractEmptyIterator;->remove()V

    return-void
.end method

.method public bridge synthetic reset()V
    .locals 0

    .prologue
    .line 35
    invoke-super {p0}, Lorg/apache/commons/collections/iterators/AbstractEmptyIterator;->reset()V

    return-void
.end method

.method public bridge synthetic set(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 35
    invoke-super {p0, p1}, Lorg/apache/commons/collections/iterators/AbstractEmptyIterator;->set(Ljava/lang/Object;)V

    return-void
.end method

.method public bridge synthetic setValue(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 35
    invoke-super {p0, p1}, Lorg/apache/commons/collections/iterators/AbstractEmptyIterator;->setValue(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method
