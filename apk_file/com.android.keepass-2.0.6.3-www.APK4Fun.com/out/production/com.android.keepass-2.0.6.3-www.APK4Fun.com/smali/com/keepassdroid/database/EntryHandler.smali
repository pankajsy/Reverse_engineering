.class public abstract Lcom/keepassdroid/database/EntryHandler;
.super Ljava/lang/Object;
.source "EntryHandler.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Lcom/keepassdroid/database/PwEntry;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 27
    .local p0, "this":Lcom/keepassdroid/database/EntryHandler;, "Lcom/keepassdroid/database/EntryHandler<TT;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public abstract operate(Lcom/keepassdroid/database/PwEntry;)Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)Z"
        }
    .end annotation
.end method
