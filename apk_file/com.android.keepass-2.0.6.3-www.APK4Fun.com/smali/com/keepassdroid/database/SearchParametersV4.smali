.class public Lcom/keepassdroid/database/SearchParametersV4;
.super Lcom/keepassdroid/database/SearchParameters;
.source "SearchParametersV4.java"

# interfaces
.implements Ljava/lang/Cloneable;


# static fields
.field public static DEFAULT:Lcom/keepassdroid/database/SearchParametersV4;


# instance fields
.field public searchInOther:Z

.field public searchInTags:Z

.field public searchInUUIDs:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 23
    new-instance v0, Lcom/keepassdroid/database/SearchParametersV4;

    invoke-direct {v0}, Lcom/keepassdroid/database/SearchParametersV4;-><init>()V

    sput-object v0, Lcom/keepassdroid/database/SearchParametersV4;->DEFAULT:Lcom/keepassdroid/database/SearchParametersV4;

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x1

    .line 22
    invoke-direct {p0}, Lcom/keepassdroid/database/SearchParameters;-><init>()V

    .line 25
    iput-boolean v1, p0, Lcom/keepassdroid/database/SearchParametersV4;->searchInOther:Z

    .line 26
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/keepassdroid/database/SearchParametersV4;->searchInUUIDs:Z

    .line 27
    iput-boolean v1, p0, Lcom/keepassdroid/database/SearchParametersV4;->searchInTags:Z

    return-void
.end method


# virtual methods
.method public clone()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 31
    invoke-super {p0}, Lcom/keepassdroid/database/SearchParameters;->clone()Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public setupNone()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 36
    invoke-super {p0}, Lcom/keepassdroid/database/SearchParameters;->setupNone()V

    .line 37
    iput-boolean v0, p0, Lcom/keepassdroid/database/SearchParametersV4;->searchInOther:Z

    .line 38
    iput-boolean v0, p0, Lcom/keepassdroid/database/SearchParametersV4;->searchInUUIDs:Z

    .line 39
    iput-boolean v0, p0, Lcom/keepassdroid/database/SearchParametersV4;->searchInTags:Z

    .line 40
    return-void
.end method
