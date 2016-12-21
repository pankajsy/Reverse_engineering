.class public Lcom/keepassdroid/database/exception/InvalidDBException;
.super Ljava/lang/Exception;
.source "InvalidDBException.java"


# static fields
.field private static final serialVersionUID:J = 0x480d908011a37e4bL


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 29
    invoke-direct {p0}, Ljava/lang/Exception;-><init>()V

    .line 30
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 0
    .param p1, "str"    # Ljava/lang/String;

    .prologue
    .line 25
    invoke-direct {p0, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 26
    return-void
.end method
