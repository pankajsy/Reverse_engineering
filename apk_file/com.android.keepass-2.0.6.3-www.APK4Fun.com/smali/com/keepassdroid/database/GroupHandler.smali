.class public abstract Lcom/keepassdroid/database/GroupHandler;
.super Ljava/lang/Object;
.source "GroupHandler.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 28
    .local p0, "this":Lcom/keepassdroid/database/GroupHandler;, "Lcom/keepassdroid/database/GroupHandler<TT;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public abstract operate(Ljava/lang/Object;)Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)Z"
        }
    .end annotation
.end method
