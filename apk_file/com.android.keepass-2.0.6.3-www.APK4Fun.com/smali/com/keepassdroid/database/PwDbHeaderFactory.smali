.class public Lcom/keepassdroid/database/PwDbHeaderFactory;
.super Ljava/lang/Object;
.source "PwDbHeaderFactory.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getInstance(Lcom/keepassdroid/database/PwDatabase;)Lcom/keepassdroid/database/PwDbHeader;
    .locals 2
    .param p0, "db"    # Lcom/keepassdroid/database/PwDatabase;

    .prologue
    .line 24
    instance-of v0, p0, Lcom/keepassdroid/database/PwDatabaseV3;

    if-eqz v0, :cond_0

    .line 25
    new-instance v0, Lcom/keepassdroid/database/PwDbHeaderV3;

    invoke-direct {v0}, Lcom/keepassdroid/database/PwDbHeaderV3;-><init>()V

    .line 27
    .end local p0    # "db":Lcom/keepassdroid/database/PwDatabase;
    :goto_0
    return-object v0

    .line 26
    .restart local p0    # "db":Lcom/keepassdroid/database/PwDatabase;
    :cond_0
    instance-of v0, p0, Lcom/keepassdroid/database/PwDatabaseV4;

    if-eqz v0, :cond_1

    .line 27
    new-instance v0, Lcom/keepassdroid/database/PwDbHeaderV4;

    check-cast p0, Lcom/keepassdroid/database/PwDatabaseV4;

    .end local p0    # "db":Lcom/keepassdroid/database/PwDatabase;
    invoke-direct {v0, p0}, Lcom/keepassdroid/database/PwDbHeaderV4;-><init>(Lcom/keepassdroid/database/PwDatabaseV4;)V

    goto :goto_0

    .line 29
    .restart local p0    # "db":Lcom/keepassdroid/database/PwDatabase;
    :cond_1
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "Not implemented."

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
