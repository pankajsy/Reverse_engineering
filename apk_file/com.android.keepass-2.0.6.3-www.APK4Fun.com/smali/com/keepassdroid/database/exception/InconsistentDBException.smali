.class public Lcom/keepassdroid/database/exception/InconsistentDBException;
.super Ljava/lang/Exception;
.source "InconsistentDBException.java"


# static fields
.field private static final serialVersionUID:J = 0x43b7798c7fcf8be3L


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 0
    .param p1, "msg"    # Ljava/lang/String;

    .prologue
    .line 25
    invoke-direct {p0, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 26
    return-void
.end method
