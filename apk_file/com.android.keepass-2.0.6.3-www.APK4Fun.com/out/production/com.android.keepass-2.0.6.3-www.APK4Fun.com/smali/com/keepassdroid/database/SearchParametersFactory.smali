.class public Lcom/keepassdroid/database/SearchParametersFactory;
.super Ljava/lang/Object;
.source "SearchParametersFactory.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getInstance(Lcom/keepassdroid/database/PwDatabase;)Lcom/keepassdroid/database/SearchParameters;
    .locals 1
    .param p0, "db"    # Lcom/keepassdroid/database/PwDatabase;

    .prologue
    .line 31
    instance-of v0, p0, Lcom/keepassdroid/database/PwDatabase;

    if-eqz v0, :cond_0

    .line 32
    new-instance v0, Lcom/keepassdroid/database/SearchParametersV4;

    invoke-direct {v0}, Lcom/keepassdroid/database/SearchParametersV4;-><init>()V

    .line 35
    :goto_0
    return-object v0

    :cond_0
    new-instance v0, Lcom/keepassdroid/database/SearchParameters;

    invoke-direct {v0}, Lcom/keepassdroid/database/SearchParameters;-><init>()V

    goto :goto_0
.end method

.method public static getInstance(Lcom/keepassdroid/database/PwGroup;)Lcom/keepassdroid/database/SearchParameters;
    .locals 1
    .param p0, "group"    # Lcom/keepassdroid/database/PwGroup;

    .prologue
    .line 40
    instance-of v0, p0, Lcom/keepassdroid/database/PwGroupV4;

    if-eqz v0, :cond_0

    .line 41
    new-instance v0, Lcom/keepassdroid/database/SearchParametersV4;

    invoke-direct {v0}, Lcom/keepassdroid/database/SearchParametersV4;-><init>()V

    .line 44
    :goto_0
    return-object v0

    :cond_0
    new-instance v0, Lcom/keepassdroid/database/SearchParameters;

    invoke-direct {v0}, Lcom/keepassdroid/database/SearchParameters;-><init>()V

    goto :goto_0
.end method

.method public static getNone(Lcom/keepassdroid/database/PwDatabase;)Lcom/keepassdroid/database/SearchParameters;
    .locals 1
    .param p0, "db"    # Lcom/keepassdroid/database/PwDatabase;

    .prologue
    .line 24
    invoke-static {p0}, Lcom/keepassdroid/database/SearchParametersFactory;->getInstance(Lcom/keepassdroid/database/PwDatabase;)Lcom/keepassdroid/database/SearchParameters;

    move-result-object v0

    .line 25
    .local v0, "sp":Lcom/keepassdroid/database/SearchParameters;
    invoke-virtual {v0}, Lcom/keepassdroid/database/SearchParameters;->setupNone()V

    .line 27
    return-object v0
.end method
