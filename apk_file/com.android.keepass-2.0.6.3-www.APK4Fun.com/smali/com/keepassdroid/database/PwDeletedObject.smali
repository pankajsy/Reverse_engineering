.class public Lcom/keepassdroid/database/PwDeletedObject;
.super Ljava/lang/Object;
.source "PwDeletedObject.java"


# instance fields
.field private deletionTime:Ljava/util/Date;

.field public uuid:Ljava/util/UUID;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 31
    return-void
.end method

.method public constructor <init>(Ljava/util/UUID;)V
    .locals 1
    .param p1, "u"    # Ljava/util/UUID;

    .prologue
    .line 34
    new-instance v0, Ljava/util/Date;

    invoke-direct {v0}, Ljava/util/Date;-><init>()V

    invoke-direct {p0, p1, v0}, Lcom/keepassdroid/database/PwDeletedObject;-><init>(Ljava/util/UUID;Ljava/util/Date;)V

    .line 35
    return-void
.end method

.method public constructor <init>(Ljava/util/UUID;Ljava/util/Date;)V
    .locals 0
    .param p1, "u"    # Ljava/util/UUID;
    .param p2, "d"    # Ljava/util/Date;

    .prologue
    .line 37
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 38
    iput-object p1, p0, Lcom/keepassdroid/database/PwDeletedObject;->uuid:Ljava/util/UUID;

    .line 39
    iput-object p2, p0, Lcom/keepassdroid/database/PwDeletedObject;->deletionTime:Ljava/util/Date;

    .line 40
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 3
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x0

    .line 56
    if-ne p0, p1, :cond_1

    .line 57
    const/4 v1, 0x1

    .line 68
    :cond_0
    :goto_0
    return v1

    .line 59
    :cond_1
    if-eqz p1, :cond_0

    .line 62
    instance-of v2, p1, Lcom/keepassdroid/database/PwDeletedObject;

    if-eqz v2, :cond_0

    move-object v0, p1

    .line 66
    check-cast v0, Lcom/keepassdroid/database/PwDeletedObject;

    .line 68
    .local v0, "rhs":Lcom/keepassdroid/database/PwDeletedObject;
    iget-object v1, p0, Lcom/keepassdroid/database/PwDeletedObject;->uuid:Ljava/util/UUID;

    iget-object v2, v0, Lcom/keepassdroid/database/PwDeletedObject;->uuid:Ljava/util/UUID;

    invoke-virtual {v1, v2}, Ljava/util/UUID;->equals(Ljava/lang/Object;)Z

    move-result v1

    goto :goto_0
.end method

.method public getDeletionTime()Ljava/util/Date;
    .locals 4

    .prologue
    .line 43
    iget-object v0, p0, Lcom/keepassdroid/database/PwDeletedObject;->deletionTime:Ljava/util/Date;

    if-nez v0, :cond_0

    .line 44
    new-instance v0, Ljava/util/Date;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    invoke-direct {v0, v2, v3}, Ljava/util/Date;-><init>(J)V

    .line 47
    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/keepassdroid/database/PwDeletedObject;->deletionTime:Ljava/util/Date;

    goto :goto_0
.end method

.method public setDeletionTime(Ljava/util/Date;)V
    .locals 0
    .param p1, "date"    # Ljava/util/Date;

    .prologue
    .line 51
    iput-object p1, p0, Lcom/keepassdroid/database/PwDeletedObject;->deletionTime:Ljava/util/Date;

    .line 52
    return-void
.end method
