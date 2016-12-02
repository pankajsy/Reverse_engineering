.class public Lcom/keepassdroid/database/SearchParameters;
.super Ljava/lang/Object;
.source "SearchParameters.java"

# interfaces
.implements Ljava/lang/Cloneable;


# static fields
.field public static final DEFAULT:Lcom/keepassdroid/database/SearchParameters;


# instance fields
.field public excludeExpired:Z

.field public ignoreCase:Z

.field public ignoreExpired:Z

.field public regularExpression:Z

.field public respectEntrySearchingDisabled:Z

.field public searchInGroupNames:Z

.field public searchInNotes:Z

.field public searchInPasswords:Z

.field public searchInTitles:Z

.field public searchInUrls:Z

.field public searchInUserNames:Z

.field public searchString:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 28
    new-instance v0, Lcom/keepassdroid/database/SearchParameters;

    invoke-direct {v0}, Lcom/keepassdroid/database/SearchParameters;-><init>()V

    sput-object v0, Lcom/keepassdroid/database/SearchParameters;->DEFAULT:Lcom/keepassdroid/database/SearchParameters;

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    const/4 v0, 0x1

    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 32
    iput-boolean v1, p0, Lcom/keepassdroid/database/SearchParameters;->regularExpression:Z

    .line 33
    iput-boolean v0, p0, Lcom/keepassdroid/database/SearchParameters;->searchInTitles:Z

    .line 34
    iput-boolean v0, p0, Lcom/keepassdroid/database/SearchParameters;->searchInUserNames:Z

    .line 35
    iput-boolean v1, p0, Lcom/keepassdroid/database/SearchParameters;->searchInPasswords:Z

    .line 36
    iput-boolean v0, p0, Lcom/keepassdroid/database/SearchParameters;->searchInUrls:Z

    .line 37
    iput-boolean v1, p0, Lcom/keepassdroid/database/SearchParameters;->searchInGroupNames:Z

    .line 38
    iput-boolean v0, p0, Lcom/keepassdroid/database/SearchParameters;->searchInNotes:Z

    .line 39
    iput-boolean v0, p0, Lcom/keepassdroid/database/SearchParameters;->ignoreCase:Z

    .line 40
    iput-boolean v1, p0, Lcom/keepassdroid/database/SearchParameters;->ignoreExpired:Z

    .line 41
    iput-boolean v0, p0, Lcom/keepassdroid/database/SearchParameters;->respectEntrySearchingDisabled:Z

    .line 42
    iput-boolean v1, p0, Lcom/keepassdroid/database/SearchParameters;->excludeExpired:Z

    return-void
.end method


# virtual methods
.method public clone()Ljava/lang/Object;
    .locals 2

    .prologue
    .line 47
    :try_start_0
    invoke-super {p0}, Ljava/lang/Object;->clone()Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/CloneNotSupportedException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 49
    :goto_0
    return-object v1

    .line 48
    :catch_0
    move-exception v0

    .line 49
    .local v0, "e":Ljava/lang/CloneNotSupportedException;
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public setupNone()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 54
    iput-boolean v0, p0, Lcom/keepassdroid/database/SearchParameters;->searchInTitles:Z

    .line 55
    iput-boolean v0, p0, Lcom/keepassdroid/database/SearchParameters;->searchInUserNames:Z

    .line 56
    iput-boolean v0, p0, Lcom/keepassdroid/database/SearchParameters;->searchInPasswords:Z

    .line 57
    iput-boolean v0, p0, Lcom/keepassdroid/database/SearchParameters;->searchInUrls:Z

    .line 58
    iput-boolean v0, p0, Lcom/keepassdroid/database/SearchParameters;->searchInGroupNames:Z

    .line 59
    iput-boolean v0, p0, Lcom/keepassdroid/database/SearchParameters;->searchInNotes:Z

    .line 60
    return-void
.end method
