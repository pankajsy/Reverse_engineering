.class public Lcom/keepassdroid/database/PwEntryV4;
.super Lcom/keepassdroid/database/PwEntry;
.source "PwEntryV4.java"

# interfaces
.implements Lcom/keepassdroid/database/ITimeLogger;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/keepassdroid/database/PwEntryV4$AutoType;
    }
.end annotation


# static fields
.field private static final FIXED_LENGTH_SIZE:J = 0x80L

.field public static final STR_NOTES:Ljava/lang/String; = "Notes"

.field public static final STR_PASSWORD:Ljava/lang/String; = "Password"

.field public static final STR_TITLE:Ljava/lang/String; = "Title"

.field public static final STR_URL:Ljava/lang/String; = "URL"

.field public static final STR_USERNAME:Ljava/lang/String; = "UserName"


# instance fields
.field public additional:Ljava/lang/String;

.field public autoType:Lcom/keepassdroid/database/PwEntryV4$AutoType;

.field public backgroupColor:Ljava/lang/String;

.field public binaries:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Lcom/keepassdroid/database/security/ProtectedBinary;",
            ">;"
        }
    .end annotation
.end field

.field private creation:Ljava/util/Date;

.field public customIcon:Lcom/keepassdroid/database/PwIconCustom;

.field private expireDate:Ljava/util/Date;

.field private expires:Z

.field public foregroundColor:Ljava/lang/String;

.field public history:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/keepassdroid/database/PwEntryV4;",
            ">;"
        }
    .end annotation
.end field

.field private lastAccess:Ljava/util/Date;

.field private lastMod:Ljava/util/Date;

.field public overrideURL:Ljava/lang/String;

.field public parent:Lcom/keepassdroid/database/PwGroupV4;

.field private parentGroupLastMod:Ljava/util/Date;

.field public strings:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Lcom/keepassdroid/database/security/ProtectedString;",
            ">;"
        }
    .end annotation
.end field

.field public tags:Ljava/lang/String;

.field public url:Ljava/lang/String;

.field private usageCount:J

.field public uuid:Ljava/util/UUID;


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    .line 99
    invoke-direct {p0}, Lcom/keepassdroid/database/PwEntry;-><init>()V

    .line 42
    sget-object v0, Lcom/keepassdroid/database/PwDatabaseV4;->UUID_ZERO:Ljava/util/UUID;

    iput-object v0, p0, Lcom/keepassdroid/database/PwEntryV4;->uuid:Ljava/util/UUID;

    .line 43
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/keepassdroid/database/PwEntryV4;->strings:Ljava/util/HashMap;

    .line 44
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/keepassdroid/database/PwEntryV4;->binaries:Ljava/util/HashMap;

    .line 45
    sget-object v0, Lcom/keepassdroid/database/PwIconCustom;->ZERO:Lcom/keepassdroid/database/PwIconCustom;

    iput-object v0, p0, Lcom/keepassdroid/database/PwEntryV4;->customIcon:Lcom/keepassdroid/database/PwIconCustom;

    .line 46
    const-string v0, ""

    iput-object v0, p0, Lcom/keepassdroid/database/PwEntryV4;->foregroundColor:Ljava/lang/String;

    .line 47
    const-string v0, ""

    iput-object v0, p0, Lcom/keepassdroid/database/PwEntryV4;->backgroupColor:Ljava/lang/String;

    .line 48
    const-string v0, ""

    iput-object v0, p0, Lcom/keepassdroid/database/PwEntryV4;->overrideURL:Ljava/lang/String;

    .line 49
    new-instance v0, Lcom/keepassdroid/database/PwEntryV4$AutoType;

    invoke-direct {v0, p0}, Lcom/keepassdroid/database/PwEntryV4$AutoType;-><init>(Lcom/keepassdroid/database/PwEntryV4;)V

    iput-object v0, p0, Lcom/keepassdroid/database/PwEntryV4;->autoType:Lcom/keepassdroid/database/PwEntryV4$AutoType;

    .line 50
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/keepassdroid/database/PwEntryV4;->history:Ljava/util/ArrayList;

    .line 52
    sget-object v0, Lcom/keepassdroid/database/PwDatabaseV4;->DEFAULT_NOW:Ljava/util/Date;

    iput-object v0, p0, Lcom/keepassdroid/database/PwEntryV4;->parentGroupLastMod:Ljava/util/Date;

    .line 53
    sget-object v0, Lcom/keepassdroid/database/PwDatabaseV4;->DEFAULT_NOW:Ljava/util/Date;

    iput-object v0, p0, Lcom/keepassdroid/database/PwEntryV4;->creation:Ljava/util/Date;

    .line 54
    sget-object v0, Lcom/keepassdroid/database/PwDatabaseV4;->DEFAULT_NOW:Ljava/util/Date;

    iput-object v0, p0, Lcom/keepassdroid/database/PwEntryV4;->lastMod:Ljava/util/Date;

    .line 55
    sget-object v0, Lcom/keepassdroid/database/PwDatabaseV4;->DEFAULT_NOW:Ljava/util/Date;

    iput-object v0, p0, Lcom/keepassdroid/database/PwEntryV4;->lastAccess:Ljava/util/Date;

    .line 56
    sget-object v0, Lcom/keepassdroid/database/PwDatabaseV4;->DEFAULT_NOW:Ljava/util/Date;

    iput-object v0, p0, Lcom/keepassdroid/database/PwEntryV4;->expireDate:Ljava/util/Date;

    .line 57
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/keepassdroid/database/PwEntryV4;->expires:Z

    .line 58
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/keepassdroid/database/PwEntryV4;->usageCount:J

    .line 59
    const-string v0, ""

    iput-object v0, p0, Lcom/keepassdroid/database/PwEntryV4;->url:Ljava/lang/String;

    .line 60
    const-string v0, ""

    iput-object v0, p0, Lcom/keepassdroid/database/PwEntryV4;->additional:Ljava/lang/String;

    .line 61
    const-string v0, ""

    iput-object v0, p0, Lcom/keepassdroid/database/PwEntryV4;->tags:Ljava/lang/String;

    .line 101
    return-void
.end method

.method public constructor <init>(Lcom/keepassdroid/database/PwGroupV4;)V
    .locals 1
    .param p1, "p"    # Lcom/keepassdroid/database/PwGroupV4;

    .prologue
    const/4 v0, 0x1

    .line 104
    invoke-direct {p0, p1, v0, v0}, Lcom/keepassdroid/database/PwEntryV4;-><init>(Lcom/keepassdroid/database/PwGroupV4;ZZ)V

    .line 105
    return-void
.end method

.method public constructor <init>(Lcom/keepassdroid/database/PwGroupV4;ZZ)V
    .locals 5
    .param p1, "p"    # Lcom/keepassdroid/database/PwGroupV4;
    .param p2, "initId"    # Z
    .param p3, "initDates"    # Z

    .prologue
    const/4 v4, 0x0

    .line 107
    invoke-direct {p0}, Lcom/keepassdroid/database/PwEntry;-><init>()V

    .line 42
    sget-object v2, Lcom/keepassdroid/database/PwDatabaseV4;->UUID_ZERO:Ljava/util/UUID;

    iput-object v2, p0, Lcom/keepassdroid/database/PwEntryV4;->uuid:Ljava/util/UUID;

    .line 43
    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    iput-object v2, p0, Lcom/keepassdroid/database/PwEntryV4;->strings:Ljava/util/HashMap;

    .line 44
    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    iput-object v2, p0, Lcom/keepassdroid/database/PwEntryV4;->binaries:Ljava/util/HashMap;

    .line 45
    sget-object v2, Lcom/keepassdroid/database/PwIconCustom;->ZERO:Lcom/keepassdroid/database/PwIconCustom;

    iput-object v2, p0, Lcom/keepassdroid/database/PwEntryV4;->customIcon:Lcom/keepassdroid/database/PwIconCustom;

    .line 46
    const-string v2, ""

    iput-object v2, p0, Lcom/keepassdroid/database/PwEntryV4;->foregroundColor:Ljava/lang/String;

    .line 47
    const-string v2, ""

    iput-object v2, p0, Lcom/keepassdroid/database/PwEntryV4;->backgroupColor:Ljava/lang/String;

    .line 48
    const-string v2, ""

    iput-object v2, p0, Lcom/keepassdroid/database/PwEntryV4;->overrideURL:Ljava/lang/String;

    .line 49
    new-instance v2, Lcom/keepassdroid/database/PwEntryV4$AutoType;

    invoke-direct {v2, p0}, Lcom/keepassdroid/database/PwEntryV4$AutoType;-><init>(Lcom/keepassdroid/database/PwEntryV4;)V

    iput-object v2, p0, Lcom/keepassdroid/database/PwEntryV4;->autoType:Lcom/keepassdroid/database/PwEntryV4$AutoType;

    .line 50
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    iput-object v2, p0, Lcom/keepassdroid/database/PwEntryV4;->history:Ljava/util/ArrayList;

    .line 52
    sget-object v2, Lcom/keepassdroid/database/PwDatabaseV4;->DEFAULT_NOW:Ljava/util/Date;

    iput-object v2, p0, Lcom/keepassdroid/database/PwEntryV4;->parentGroupLastMod:Ljava/util/Date;

    .line 53
    sget-object v2, Lcom/keepassdroid/database/PwDatabaseV4;->DEFAULT_NOW:Ljava/util/Date;

    iput-object v2, p0, Lcom/keepassdroid/database/PwEntryV4;->creation:Ljava/util/Date;

    .line 54
    sget-object v2, Lcom/keepassdroid/database/PwDatabaseV4;->DEFAULT_NOW:Ljava/util/Date;

    iput-object v2, p0, Lcom/keepassdroid/database/PwEntryV4;->lastMod:Ljava/util/Date;

    .line 55
    sget-object v2, Lcom/keepassdroid/database/PwDatabaseV4;->DEFAULT_NOW:Ljava/util/Date;

    iput-object v2, p0, Lcom/keepassdroid/database/PwEntryV4;->lastAccess:Ljava/util/Date;

    .line 56
    sget-object v2, Lcom/keepassdroid/database/PwDatabaseV4;->DEFAULT_NOW:Ljava/util/Date;

    iput-object v2, p0, Lcom/keepassdroid/database/PwEntryV4;->expireDate:Ljava/util/Date;

    .line 57
    iput-boolean v4, p0, Lcom/keepassdroid/database/PwEntryV4;->expires:Z

    .line 58
    const-wide/16 v2, 0x0

    iput-wide v2, p0, Lcom/keepassdroid/database/PwEntryV4;->usageCount:J

    .line 59
    const-string v2, ""

    iput-object v2, p0, Lcom/keepassdroid/database/PwEntryV4;->url:Ljava/lang/String;

    .line 60
    const-string v2, ""

    iput-object v2, p0, Lcom/keepassdroid/database/PwEntryV4;->additional:Ljava/lang/String;

    .line 61
    const-string v2, ""

    iput-object v2, p0, Lcom/keepassdroid/database/PwEntryV4;->tags:Ljava/lang/String;

    .line 108
    iput-object p1, p0, Lcom/keepassdroid/database/PwEntryV4;->parent:Lcom/keepassdroid/database/PwGroupV4;

    .line 110
    if-eqz p2, :cond_0

    .line 111
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v2

    iput-object v2, p0, Lcom/keepassdroid/database/PwEntryV4;->uuid:Ljava/util/UUID;

    .line 114
    :cond_0
    if-eqz p3, :cond_1

    .line 115
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v0

    .line 116
    .local v0, "cal":Ljava/util/Calendar;
    invoke-virtual {v0}, Ljava/util/Calendar;->getTime()Ljava/util/Date;

    move-result-object v1

    .line 117
    .local v1, "now":Ljava/util/Date;
    iput-object v1, p0, Lcom/keepassdroid/database/PwEntryV4;->creation:Ljava/util/Date;

    .line 118
    iput-object v1, p0, Lcom/keepassdroid/database/PwEntryV4;->lastAccess:Ljava/util/Date;

    .line 119
    iput-object v1, p0, Lcom/keepassdroid/database/PwEntryV4;->lastMod:Ljava/util/Date;

    .line 120
    iput-boolean v4, p0, Lcom/keepassdroid/database/PwEntryV4;->expires:Z

    .line 122
    .end local v0    # "cal":Ljava/util/Calendar;
    .end local v1    # "now":Ljava/util/Date;
    :cond_1
    return-void
.end method

.method public static IsStandardString(Ljava/lang/String;)Z
    .locals 1
    .param p0, "key"    # Ljava/lang/String;

    .prologue
    .line 372
    const-string v0, "Title"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "UserName"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "Password"

    .line 373
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "URL"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "Notes"

    .line 374
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private assign(Lcom/keepassdroid/database/PwEntryV4;)V
    .locals 2
    .param p1, "source"    # Lcom/keepassdroid/database/PwEntryV4;

    .prologue
    .line 161
    iget-object v0, p1, Lcom/keepassdroid/database/PwEntryV4;->parent:Lcom/keepassdroid/database/PwGroupV4;

    iput-object v0, p0, Lcom/keepassdroid/database/PwEntryV4;->parent:Lcom/keepassdroid/database/PwGroupV4;

    .line 162
    iget-object v0, p1, Lcom/keepassdroid/database/PwEntryV4;->uuid:Ljava/util/UUID;

    iput-object v0, p0, Lcom/keepassdroid/database/PwEntryV4;->uuid:Ljava/util/UUID;

    .line 163
    iget-object v0, p1, Lcom/keepassdroid/database/PwEntryV4;->strings:Ljava/util/HashMap;

    iput-object v0, p0, Lcom/keepassdroid/database/PwEntryV4;->strings:Ljava/util/HashMap;

    .line 164
    iget-object v0, p1, Lcom/keepassdroid/database/PwEntryV4;->binaries:Ljava/util/HashMap;

    iput-object v0, p0, Lcom/keepassdroid/database/PwEntryV4;->binaries:Ljava/util/HashMap;

    .line 165
    iget-object v0, p1, Lcom/keepassdroid/database/PwEntryV4;->customIcon:Lcom/keepassdroid/database/PwIconCustom;

    iput-object v0, p0, Lcom/keepassdroid/database/PwEntryV4;->customIcon:Lcom/keepassdroid/database/PwIconCustom;

    .line 166
    iget-object v0, p1, Lcom/keepassdroid/database/PwEntryV4;->foregroundColor:Ljava/lang/String;

    iput-object v0, p0, Lcom/keepassdroid/database/PwEntryV4;->foregroundColor:Ljava/lang/String;

    .line 167
    iget-object v0, p1, Lcom/keepassdroid/database/PwEntryV4;->backgroupColor:Ljava/lang/String;

    iput-object v0, p0, Lcom/keepassdroid/database/PwEntryV4;->backgroupColor:Ljava/lang/String;

    .line 168
    iget-object v0, p1, Lcom/keepassdroid/database/PwEntryV4;->overrideURL:Ljava/lang/String;

    iput-object v0, p0, Lcom/keepassdroid/database/PwEntryV4;->overrideURL:Ljava/lang/String;

    .line 169
    iget-object v0, p1, Lcom/keepassdroid/database/PwEntryV4;->autoType:Lcom/keepassdroid/database/PwEntryV4$AutoType;

    iput-object v0, p0, Lcom/keepassdroid/database/PwEntryV4;->autoType:Lcom/keepassdroid/database/PwEntryV4$AutoType;

    .line 170
    iget-object v0, p1, Lcom/keepassdroid/database/PwEntryV4;->history:Ljava/util/ArrayList;

    iput-object v0, p0, Lcom/keepassdroid/database/PwEntryV4;->history:Ljava/util/ArrayList;

    .line 171
    iget-object v0, p1, Lcom/keepassdroid/database/PwEntryV4;->parentGroupLastMod:Ljava/util/Date;

    iput-object v0, p0, Lcom/keepassdroid/database/PwEntryV4;->parentGroupLastMod:Ljava/util/Date;

    .line 172
    iget-object v0, p1, Lcom/keepassdroid/database/PwEntryV4;->creation:Ljava/util/Date;

    iput-object v0, p0, Lcom/keepassdroid/database/PwEntryV4;->creation:Ljava/util/Date;

    .line 173
    iget-object v0, p1, Lcom/keepassdroid/database/PwEntryV4;->lastMod:Ljava/util/Date;

    iput-object v0, p0, Lcom/keepassdroid/database/PwEntryV4;->lastMod:Ljava/util/Date;

    .line 174
    iget-object v0, p1, Lcom/keepassdroid/database/PwEntryV4;->lastAccess:Ljava/util/Date;

    iput-object v0, p0, Lcom/keepassdroid/database/PwEntryV4;->lastAccess:Ljava/util/Date;

    .line 175
    iget-object v0, p1, Lcom/keepassdroid/database/PwEntryV4;->expireDate:Ljava/util/Date;

    iput-object v0, p0, Lcom/keepassdroid/database/PwEntryV4;->expireDate:Ljava/util/Date;

    .line 176
    iget-boolean v0, p1, Lcom/keepassdroid/database/PwEntryV4;->expires:Z

    iput-boolean v0, p0, Lcom/keepassdroid/database/PwEntryV4;->expires:Z

    .line 177
    iget-wide v0, p1, Lcom/keepassdroid/database/PwEntryV4;->usageCount:J

    iput-wide v0, p0, Lcom/keepassdroid/database/PwEntryV4;->usageCount:J

    .line 178
    iget-object v0, p1, Lcom/keepassdroid/database/PwEntryV4;->url:Ljava/lang/String;

    iput-object v0, p0, Lcom/keepassdroid/database/PwEntryV4;->url:Ljava/lang/String;

    .line 179
    iget-object v0, p1, Lcom/keepassdroid/database/PwEntryV4;->additional:Ljava/lang/String;

    iput-object v0, p0, Lcom/keepassdroid/database/PwEntryV4;->additional:Ljava/lang/String;

    .line 181
    return-void
.end method

.method private decodeRef(Ljava/lang/String;Lcom/keepassdroid/database/PwDatabase;)Ljava/lang/String;
    .locals 1
    .param p1, "text"    # Ljava/lang/String;
    .param p2, "db"    # Lcom/keepassdroid/database/PwDatabase;

    .prologue
    .line 200
    if-nez p2, :cond_0

    .line 203
    .end local p1    # "text":Ljava/lang/String;
    :goto_0
    return-object p1

    .line 202
    .restart local p1    # "text":Ljava/lang/String;
    :cond_0
    invoke-static {p2}, Lcom/keepassdroid/utils/SprEngine;->getInstance(Lcom/keepassdroid/database/PwDatabase;)Lcom/keepassdroid/utils/SprEngine;

    move-result-object v0

    .line 203
    .local v0, "spr":Lcom/keepassdroid/utils/SprEngine;
    invoke-virtual {v0, p1, p0, p2}, Lcom/keepassdroid/utils/SprEngine;->compile(Ljava/lang/String;Lcom/keepassdroid/database/PwEntry;Lcom/keepassdroid/database/PwDatabase;)Ljava/lang/String;

    move-result-object p1

    goto :goto_0
.end method

.method private decodeRefKey(ZLjava/lang/String;Lcom/keepassdroid/database/PwDatabase;)Ljava/lang/String;
    .locals 1
    .param p1, "decodeRef"    # Z
    .param p2, "key"    # Ljava/lang/String;
    .param p3, "db"    # Lcom/keepassdroid/database/PwDatabase;

    .prologue
    .line 191
    invoke-virtual {p0, p2}, Lcom/keepassdroid/database/PwEntryV4;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 192
    .local v0, "text":Ljava/lang/String;
    if-eqz p1, :cond_0

    .line 193
    invoke-direct {p0, v0, p3}, Lcom/keepassdroid/database/PwEntryV4;->decodeRef(Ljava/lang/String;Lcom/keepassdroid/database/PwDatabase;)Ljava/lang/String;

    move-result-object v0

    .line 196
    :cond_0
    return-object v0
.end method

.method private maintainBackups(Lcom/keepassdroid/database/PwDatabaseV4;)Z
    .locals 10
    .param p1, "db"    # Lcom/keepassdroid/database/PwDatabaseV4;

    .prologue
    .line 386
    const/4 v0, 0x0

    .line 388
    .local v0, "deleted":Z
    iget v4, p1, Lcom/keepassdroid/database/PwDatabaseV4;->historyMaxItems:I

    .line 389
    .local v4, "maxItems":I
    if-ltz v4, :cond_0

    .line 390
    :goto_0
    iget-object v5, p0, Lcom/keepassdroid/database/PwEntryV4;->history:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v5

    if-le v5, v4, :cond_0

    .line 391
    invoke-direct {p0}, Lcom/keepassdroid/database/PwEntryV4;->removeOldestBackup()V

    .line 392
    const/4 v0, 0x1

    goto :goto_0

    .line 396
    :cond_0
    iget-wide v6, p1, Lcom/keepassdroid/database/PwDatabaseV4;->historyMaxSize:J

    .line 397
    .local v6, "maxSize":J
    const-wide/16 v8, 0x0

    cmp-long v5, v6, v8

    if-ltz v5, :cond_2

    .line 399
    :goto_1
    const-wide/16 v2, 0x0

    .line 400
    .local v2, "histSize":J
    iget-object v5, p0, Lcom/keepassdroid/database/PwEntryV4;->history:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_2
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_1

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/keepassdroid/database/PwEntryV4;

    .line 401
    .local v1, "entry":Lcom/keepassdroid/database/PwEntryV4;
    invoke-virtual {v1}, Lcom/keepassdroid/database/PwEntryV4;->getSize()J

    move-result-wide v8

    add-long/2addr v2, v8

    .line 402
    goto :goto_2

    .line 404
    .end local v1    # "entry":Lcom/keepassdroid/database/PwEntryV4;
    :cond_1
    cmp-long v5, v2, v6

    if-lez v5, :cond_2

    .line 405
    invoke-direct {p0}, Lcom/keepassdroid/database/PwEntryV4;->removeOldestBackup()V

    .line 406
    const/4 v0, 0x1

    .line 410
    goto :goto_1

    .line 413
    .end local v2    # "histSize":J
    :cond_2
    return v0
.end method

.method private removeOldestBackup()V
    .locals 6

    .prologue
    .line 417
    const/4 v4, 0x0

    .line 418
    .local v4, "min":Ljava/util/Date;
    const/4 v2, -0x1

    .line 420
    .local v2, "index":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    iget-object v5, p0, Lcom/keepassdroid/database/PwEntryV4;->history:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v5

    if-ge v1, v5, :cond_2

    .line 421
    iget-object v5, p0, Lcom/keepassdroid/database/PwEntryV4;->history:Ljava/util/ArrayList;

    invoke-virtual {v5, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/keepassdroid/database/PwEntry;

    .line 422
    .local v0, "entry":Lcom/keepassdroid/database/PwEntry;
    invoke-virtual {v0}, Lcom/keepassdroid/database/PwEntry;->getLastModificationTime()Ljava/util/Date;

    move-result-object v3

    .line 423
    .local v3, "lastMod":Ljava/util/Date;
    if-eqz v4, :cond_0

    invoke-virtual {v3, v4}, Ljava/util/Date;->before(Ljava/util/Date;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 424
    :cond_0
    move v2, v1

    .line 425
    move-object v4, v3

    .line 420
    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 429
    .end local v0    # "entry":Lcom/keepassdroid/database/PwEntry;
    .end local v3    # "lastMod":Ljava/util/Date;
    :cond_2
    const/4 v5, -0x1

    if-eq v2, v5, :cond_3

    .line 430
    iget-object v5, p0, Lcom/keepassdroid/database/PwEntryV4;->history:Ljava/util/ArrayList;

    invoke-virtual {v5, v2}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 432
    :cond_3
    return-void
.end method


# virtual methods
.method public assign(Lcom/keepassdroid/database/PwEntry;)V
    .locals 3
    .param p1, "source"    # Lcom/keepassdroid/database/PwEntry;

    .prologue
    .line 150
    instance-of v1, p1, Lcom/keepassdroid/database/PwEntryV4;

    if-nez v1, :cond_0

    .line 151
    new-instance v1, Ljava/lang/RuntimeException;

    const-string v2, "DB version mix."

    invoke-direct {v1, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 154
    :cond_0
    invoke-super {p0, p1}, Lcom/keepassdroid/database/PwEntry;->assign(Lcom/keepassdroid/database/PwEntry;)V

    move-object v0, p1

    .line 156
    check-cast v0, Lcom/keepassdroid/database/PwEntryV4;

    .line 157
    .local v0, "src":Lcom/keepassdroid/database/PwEntryV4;
    invoke-direct {p0, v0}, Lcom/keepassdroid/database/PwEntryV4;->assign(Lcom/keepassdroid/database/PwEntryV4;)V

    .line 158
    return-void
.end method

.method public clone(Z)Lcom/keepassdroid/database/PwEntry;
    .locals 2
    .param p1, "deepStrings"    # Z

    .prologue
    .line 127
    invoke-super {p0, p1}, Lcom/keepassdroid/database/PwEntry;->clone(Z)Lcom/keepassdroid/database/PwEntry;

    move-result-object v0

    check-cast v0, Lcom/keepassdroid/database/PwEntryV4;

    .line 129
    .local v0, "entry":Lcom/keepassdroid/database/PwEntryV4;
    if-eqz p1, :cond_0

    .line 130
    iget-object v1, p0, Lcom/keepassdroid/database/PwEntryV4;->strings:Ljava/util/HashMap;

    invoke-virtual {v1}, Ljava/util/HashMap;->clone()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/HashMap;

    iput-object v1, v0, Lcom/keepassdroid/database/PwEntryV4;->strings:Ljava/util/HashMap;

    .line 133
    :cond_0
    return-object v0
.end method

.method public clone()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 185
    invoke-super {p0}, Lcom/keepassdroid/database/PwEntry;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/keepassdroid/database/PwEntryV4;

    .line 187
    .local v0, "newEntry":Lcom/keepassdroid/database/PwEntryV4;
    return-object v0
.end method

.method public cloneDeep()Lcom/keepassdroid/database/PwEntryV4;
    .locals 2

    .prologue
    .line 138
    const/4 v1, 0x1

    invoke-virtual {p0, v1}, Lcom/keepassdroid/database/PwEntryV4;->clone(Z)Lcom/keepassdroid/database/PwEntry;

    move-result-object v0

    check-cast v0, Lcom/keepassdroid/database/PwEntryV4;

    .line 140
    .local v0, "entry":Lcom/keepassdroid/database/PwEntryV4;
    iget-object v1, p0, Lcom/keepassdroid/database/PwEntryV4;->binaries:Ljava/util/HashMap;

    invoke-virtual {v1}, Ljava/util/HashMap;->clone()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/HashMap;

    iput-object v1, v0, Lcom/keepassdroid/database/PwEntryV4;->binaries:Ljava/util/HashMap;

    .line 141
    iget-object v1, p0, Lcom/keepassdroid/database/PwEntryV4;->history:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->clone()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/ArrayList;

    iput-object v1, v0, Lcom/keepassdroid/database/PwEntryV4;->history:Ljava/util/ArrayList;

    .line 142
    iget-object v1, p0, Lcom/keepassdroid/database/PwEntryV4;->autoType:Lcom/keepassdroid/database/PwEntryV4$AutoType;

    invoke-virtual {v1}, Lcom/keepassdroid/database/PwEntryV4$AutoType;->clone()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/keepassdroid/database/PwEntryV4$AutoType;

    iput-object v1, v0, Lcom/keepassdroid/database/PwEntryV4;->autoType:Lcom/keepassdroid/database/PwEntryV4$AutoType;

    .line 144
    return-object v0
.end method

.method public createBackup(Lcom/keepassdroid/database/PwDatabaseV4;)V
    .locals 2
    .param p1, "db"    # Lcom/keepassdroid/database/PwDatabaseV4;

    .prologue
    .line 378
    invoke-virtual {p0}, Lcom/keepassdroid/database/PwEntryV4;->cloneDeep()Lcom/keepassdroid/database/PwEntryV4;

    move-result-object v0

    .line 379
    .local v0, "copy":Lcom/keepassdroid/database/PwEntryV4;
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, v0, Lcom/keepassdroid/database/PwEntryV4;->history:Ljava/util/ArrayList;

    .line 380
    iget-object v1, p0, Lcom/keepassdroid/database/PwEntryV4;->history:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 382
    if-eqz p1, :cond_0

    invoke-direct {p0, p1}, Lcom/keepassdroid/database/PwEntryV4;->maintainBackups(Lcom/keepassdroid/database/PwDatabaseV4;)Z

    .line 383
    :cond_0
    return-void
.end method

.method public expires()Z
    .locals 1

    .prologue
    .line 344
    iget-boolean v0, p0, Lcom/keepassdroid/database/PwEntryV4;->expires:Z

    return v0
.end method

.method public getCreationTime()Ljava/util/Date;
    .locals 1

    .prologue
    .line 228
    iget-object v0, p0, Lcom/keepassdroid/database/PwEntryV4;->creation:Ljava/util/Date;

    return-object v0
.end method

.method public getExpiryTime()Ljava/util/Date;
    .locals 1

    .prologue
    .line 233
    iget-object v0, p0, Lcom/keepassdroid/database/PwEntryV4;->expireDate:Ljava/util/Date;

    return-object v0
.end method

.method public getIcon()Lcom/keepassdroid/database/PwIcon;
    .locals 2

    .prologue
    .line 363
    iget-object v0, p0, Lcom/keepassdroid/database/PwEntryV4;->customIcon:Lcom/keepassdroid/database/PwIconCustom;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/keepassdroid/database/PwEntryV4;->customIcon:Lcom/keepassdroid/database/PwIconCustom;

    iget-object v0, v0, Lcom/keepassdroid/database/PwIconCustom;->uuid:Ljava/util/UUID;

    sget-object v1, Lcom/keepassdroid/database/PwDatabaseV4;->UUID_ZERO:Ljava/util/UUID;

    invoke-virtual {v0, v1}, Ljava/util/UUID;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 364
    :cond_0
    invoke-super {p0}, Lcom/keepassdroid/database/PwEntry;->getIcon()Lcom/keepassdroid/database/PwIcon;

    move-result-object v0

    .line 366
    :goto_0
    return-object v0

    :cond_1
    iget-object v0, p0, Lcom/keepassdroid/database/PwEntryV4;->customIcon:Lcom/keepassdroid/database/PwIconCustom;

    goto :goto_0
.end method

.method public getLastAccessTime()Ljava/util/Date;
    .locals 1

    .prologue
    .line 223
    iget-object v0, p0, Lcom/keepassdroid/database/PwEntryV4;->lastAccess:Ljava/util/Date;

    return-object v0
.end method

.method public getLastModificationTime()Ljava/util/Date;
    .locals 1

    .prologue
    .line 238
    iget-object v0, p0, Lcom/keepassdroid/database/PwEntryV4;->lastMod:Ljava/util/Date;

    return-object v0
.end method

.method public getLocationChanged()Ljava/util/Date;
    .locals 1

    .prologue
    .line 327
    iget-object v0, p0, Lcom/keepassdroid/database/PwEntryV4;->parentGroupLastMod:Ljava/util/Date;

    return-object v0
.end method

.method public getNotes(ZLcom/keepassdroid/database/PwDatabase;)Ljava/lang/String;
    .locals 1
    .param p1, "decodeRef"    # Z
    .param p2, "db"    # Lcom/keepassdroid/database/PwDatabase;

    .prologue
    .line 353
    const-string v0, "Notes"

    invoke-direct {p0, p1, v0, p2}, Lcom/keepassdroid/database/PwEntryV4;->decodeRefKey(ZLjava/lang/String;Lcom/keepassdroid/database/PwDatabase;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic getParent()Lcom/keepassdroid/database/PwGroup;
    .locals 1

    .prologue
    .line 34
    invoke-virtual {p0}, Lcom/keepassdroid/database/PwEntryV4;->getParent()Lcom/keepassdroid/database/PwGroupV4;

    move-result-object v0

    return-object v0
.end method

.method public getParent()Lcom/keepassdroid/database/PwGroupV4;
    .locals 1

    .prologue
    .line 299
    iget-object v0, p0, Lcom/keepassdroid/database/PwEntryV4;->parent:Lcom/keepassdroid/database/PwGroupV4;

    return-object v0
.end method

.method public getPassword(ZLcom/keepassdroid/database/PwDatabase;)Ljava/lang/String;
    .locals 1
    .param p1, "decodeRef"    # Z
    .param p2, "db"    # Lcom/keepassdroid/database/PwDatabase;

    .prologue
    .line 218
    const-string v0, "Password"

    invoke-direct {p0, p1, v0, p2}, Lcom/keepassdroid/database/PwEntryV4;->decodeRefKey(ZLjava/lang/String;Lcom/keepassdroid/database/PwDatabase;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getSize()J
    .locals 10

    .prologue
    .line 437
    const-wide/16 v4, 0x80

    .line 439
    .local v4, "size":J
    iget-object v6, p0, Lcom/keepassdroid/database/PwEntryV4;->strings:Ljava/util/HashMap;

    invoke-virtual {v6}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :goto_0
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_0

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    .line 440
    .local v2, "pair":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Lcom/keepassdroid/database/security/ProtectedString;>;"
    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v6

    int-to-long v8, v6

    add-long/2addr v4, v8

    .line 441
    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/keepassdroid/database/security/ProtectedString;

    invoke-virtual {v6}, Lcom/keepassdroid/database/security/ProtectedString;->length()I

    move-result v6

    int-to-long v8, v6

    add-long/2addr v4, v8

    .line 442
    goto :goto_0

    .line 444
    .end local v2    # "pair":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Lcom/keepassdroid/database/security/ProtectedString;>;"
    :cond_0
    iget-object v6, p0, Lcom/keepassdroid/database/PwEntryV4;->binaries:Ljava/util/HashMap;

    invoke-virtual {v6}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :goto_1
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_1

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 445
    .local v1, "pair":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Lcom/keepassdroid/database/security/ProtectedBinary;>;"
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v6

    int-to-long v8, v6

    add-long/2addr v4, v8

    .line 446
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/keepassdroid/database/security/ProtectedBinary;

    invoke-virtual {v6}, Lcom/keepassdroid/database/security/ProtectedBinary;->length()I

    move-result v6

    int-to-long v8, v6

    add-long/2addr v4, v8

    .line 447
    goto :goto_1

    .line 449
    .end local v1    # "pair":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Lcom/keepassdroid/database/security/ProtectedBinary;>;"
    :cond_1
    iget-object v6, p0, Lcom/keepassdroid/database/PwEntryV4;->autoType:Lcom/keepassdroid/database/PwEntryV4$AutoType;

    iget-object v6, v6, Lcom/keepassdroid/database/PwEntryV4$AutoType;->defaultSequence:Ljava/lang/String;

    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v6

    int-to-long v6, v6

    add-long/2addr v4, v6

    .line 450
    iget-object v6, p0, Lcom/keepassdroid/database/PwEntryV4;->autoType:Lcom/keepassdroid/database/PwEntryV4$AutoType;

    invoke-virtual {v6}, Lcom/keepassdroid/database/PwEntryV4$AutoType;->entrySet()Ljava/util/Set;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :goto_2
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_2

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Map$Entry;

    .line 451
    .local v3, "pair":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-interface {v3}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v6

    int-to-long v8, v6

    add-long/2addr v4, v8

    .line 452
    invoke-interface {v3}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v6

    int-to-long v8, v6

    add-long/2addr v4, v8

    .line 453
    goto :goto_2

    .line 455
    .end local v3    # "pair":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_2
    iget-object v6, p0, Lcom/keepassdroid/database/PwEntryV4;->history:Ljava/util/ArrayList;

    invoke-virtual {v6}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :goto_3
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_3

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/keepassdroid/database/PwEntryV4;

    .line 456
    .local v0, "entry":Lcom/keepassdroid/database/PwEntryV4;
    invoke-virtual {v0}, Lcom/keepassdroid/database/PwEntryV4;->getSize()J

    move-result-wide v8

    add-long/2addr v4, v8

    .line 457
    goto :goto_3

    .line 459
    .end local v0    # "entry":Lcom/keepassdroid/database/PwEntryV4;
    :cond_3
    iget-object v6, p0, Lcom/keepassdroid/database/PwEntryV4;->overrideURL:Ljava/lang/String;

    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v6

    int-to-long v6, v6

    add-long/2addr v4, v6

    .line 460
    iget-object v6, p0, Lcom/keepassdroid/database/PwEntryV4;->tags:Ljava/lang/String;

    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v6

    int-to-long v6, v6

    add-long/2addr v4, v6

    .line 462
    return-wide v4
.end method

.method public getString(Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 314
    iget-object v1, p0, Lcom/keepassdroid/database/PwEntryV4;->strings:Ljava/util/HashMap;

    invoke-virtual {v1, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/keepassdroid/database/security/ProtectedString;

    .line 316
    .local v0, "value":Lcom/keepassdroid/database/security/ProtectedString;
    if-nez v0, :cond_0

    new-instance v1, Ljava/lang/String;

    const-string v2, ""

    invoke-direct {v1, v2}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    .line 318
    :goto_0
    return-object v1

    :cond_0
    invoke-virtual {v0}, Lcom/keepassdroid/database/security/ProtectedString;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_0
.end method

.method public getTitle(ZLcom/keepassdroid/database/PwDatabase;)Ljava/lang/String;
    .locals 1
    .param p1, "decodeRef"    # Z
    .param p2, "db"    # Lcom/keepassdroid/database/PwDatabase;

    .prologue
    .line 213
    const-string v0, "Title"

    invoke-direct {p0, p1, v0, p2}, Lcom/keepassdroid/database/PwEntryV4;->decodeRefKey(ZLjava/lang/String;Lcom/keepassdroid/database/PwDatabase;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getUUID()Ljava/util/UUID;
    .locals 1

    .prologue
    .line 304
    iget-object v0, p0, Lcom/keepassdroid/database/PwEntryV4;->uuid:Ljava/util/UUID;

    return-object v0
.end method

.method public getUrl(ZLcom/keepassdroid/database/PwDatabase;)Ljava/lang/String;
    .locals 1
    .param p1, "decodeRef"    # Z
    .param p2, "db"    # Lcom/keepassdroid/database/PwDatabase;

    .prologue
    .line 358
    const-string v0, "URL"

    invoke-direct {p0, p1, v0, p2}, Lcom/keepassdroid/database/PwEntryV4;->decodeRefKey(ZLjava/lang/String;Lcom/keepassdroid/database/PwDatabase;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getUsageCount()J
    .locals 2

    .prologue
    .line 331
    iget-wide v0, p0, Lcom/keepassdroid/database/PwEntryV4;->usageCount:J

    return-wide v0
.end method

.method public getUsername(ZLcom/keepassdroid/database/PwDatabase;)Ljava/lang/String;
    .locals 1
    .param p1, "decodeRef"    # Z
    .param p2, "db"    # Lcom/keepassdroid/database/PwDatabase;

    .prologue
    .line 208
    const-string v0, "UserName"

    invoke-direct {p0, p1, v0, p2}, Lcom/keepassdroid/database/PwEntryV4;->decodeRefKey(ZLjava/lang/String;Lcom/keepassdroid/database/PwDatabase;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public isSearchingEnabled()Z
    .locals 1

    .prologue
    .line 483
    iget-object v0, p0, Lcom/keepassdroid/database/PwEntryV4;->parent:Lcom/keepassdroid/database/PwGroupV4;

    if-eqz v0, :cond_0

    .line 484
    iget-object v0, p0, Lcom/keepassdroid/database/PwEntryV4;->parent:Lcom/keepassdroid/database/PwGroupV4;

    invoke-virtual {v0}, Lcom/keepassdroid/database/PwGroupV4;->isSearchEnabled()Z

    move-result v0

    .line 487
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x1

    goto :goto_0
.end method

.method public setCreationTime(Ljava/util/Date;)V
    .locals 0
    .param p1, "date"    # Ljava/util/Date;

    .prologue
    .line 282
    iput-object p1, p0, Lcom/keepassdroid/database/PwEntryV4;->creation:Ljava/util/Date;

    .line 283
    return-void
.end method

.method public setExpires(Z)V
    .locals 0
    .param p1, "exp"    # Z

    .prologue
    .line 348
    iput-boolean p1, p0, Lcom/keepassdroid/database/PwEntryV4;->expires:Z

    .line 349
    return-void
.end method

.method public setExpiryTime(Ljava/util/Date;)V
    .locals 0
    .param p1, "date"    # Ljava/util/Date;

    .prologue
    .line 286
    iput-object p1, p0, Lcom/keepassdroid/database/PwEntryV4;->expireDate:Ljava/util/Date;

    .line 287
    return-void
.end method

.method public setLastAccessTime(Ljava/util/Date;)V
    .locals 0
    .param p1, "date"    # Ljava/util/Date;

    .prologue
    .line 290
    iput-object p1, p0, Lcom/keepassdroid/database/PwEntryV4;->lastAccess:Ljava/util/Date;

    .line 291
    return-void
.end method

.method public setLastModificationTime(Ljava/util/Date;)V
    .locals 0
    .param p1, "date"    # Ljava/util/Date;

    .prologue
    .line 294
    iput-object p1, p0, Lcom/keepassdroid/database/PwEntryV4;->lastMod:Ljava/util/Date;

    .line 295
    return-void
.end method

.method public setLocationChanged(Ljava/util/Date;)V
    .locals 0
    .param p1, "date"    # Ljava/util/Date;

    .prologue
    .line 335
    iput-object p1, p0, Lcom/keepassdroid/database/PwEntryV4;->parentGroupLastMod:Ljava/util/Date;

    .line 336
    return-void
.end method

.method public setNotes(Ljava/lang/String;Lcom/keepassdroid/database/PwDatabase;)V
    .locals 3
    .param p1, "notes"    # Ljava/lang/String;
    .param p2, "d"    # Lcom/keepassdroid/database/PwDatabase;

    .prologue
    .line 275
    move-object v0, p2

    check-cast v0, Lcom/keepassdroid/database/PwDatabaseV4;

    .line 276
    .local v0, "db":Lcom/keepassdroid/database/PwDatabaseV4;
    iget-object v2, v0, Lcom/keepassdroid/database/PwDatabaseV4;->memoryProtection:Lcom/keepassdroid/database/PwDatabaseV4$MemoryProtectionConfig;

    iget-boolean v1, v2, Lcom/keepassdroid/database/PwDatabaseV4$MemoryProtectionConfig;->protectNotes:Z

    .line 278
    .local v1, "protect":Z
    const-string v2, "Notes"

    invoke-virtual {p0, v2, p1, v1}, Lcom/keepassdroid/database/PwEntryV4;->setString(Ljava/lang/String;Ljava/lang/String;Z)V

    .line 279
    return-void
.end method

.method public setParent(Lcom/keepassdroid/database/PwGroup;)V
    .locals 0
    .param p1, "parent"    # Lcom/keepassdroid/database/PwGroup;

    .prologue
    .line 479
    check-cast p1, Lcom/keepassdroid/database/PwGroupV4;

    .end local p1    # "parent":Lcom/keepassdroid/database/PwGroup;
    iput-object p1, p0, Lcom/keepassdroid/database/PwEntryV4;->parent:Lcom/keepassdroid/database/PwGroupV4;

    .line 480
    return-void
.end method

.method public setPassword(Ljava/lang/String;Lcom/keepassdroid/database/PwDatabase;)V
    .locals 3
    .param p1, "pass"    # Ljava/lang/String;
    .param p2, "d"    # Lcom/keepassdroid/database/PwDatabase;

    .prologue
    .line 259
    move-object v0, p2

    check-cast v0, Lcom/keepassdroid/database/PwDatabaseV4;

    .line 260
    .local v0, "db":Lcom/keepassdroid/database/PwDatabaseV4;
    iget-object v2, v0, Lcom/keepassdroid/database/PwDatabaseV4;->memoryProtection:Lcom/keepassdroid/database/PwDatabaseV4$MemoryProtectionConfig;

    iget-boolean v1, v2, Lcom/keepassdroid/database/PwDatabaseV4$MemoryProtectionConfig;->protectPassword:Z

    .line 262
    .local v1, "protect":Z
    const-string v2, "Password"

    invoke-virtual {p0, v2, p1, v1}, Lcom/keepassdroid/database/PwEntryV4;->setString(Ljava/lang/String;Ljava/lang/String;Z)V

    .line 263
    return-void
.end method

.method public setString(Ljava/lang/String;Ljava/lang/String;Z)V
    .locals 2
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;
    .param p3, "protect"    # Z

    .prologue
    .line 322
    new-instance v0, Lcom/keepassdroid/database/security/ProtectedString;

    invoke-direct {v0, p3, p2}, Lcom/keepassdroid/database/security/ProtectedString;-><init>(ZLjava/lang/String;)V

    .line 323
    .local v0, "ps":Lcom/keepassdroid/database/security/ProtectedString;
    iget-object v1, p0, Lcom/keepassdroid/database/PwEntryV4;->strings:Ljava/util/HashMap;

    invoke-virtual {v1, p1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 324
    return-void
.end method

.method public setTitle(Ljava/lang/String;Lcom/keepassdroid/database/PwDatabase;)V
    .locals 3
    .param p1, "title"    # Ljava/lang/String;
    .param p2, "d"    # Lcom/keepassdroid/database/PwDatabase;

    .prologue
    .line 243
    move-object v0, p2

    check-cast v0, Lcom/keepassdroid/database/PwDatabaseV4;

    .line 244
    .local v0, "db":Lcom/keepassdroid/database/PwDatabaseV4;
    iget-object v2, v0, Lcom/keepassdroid/database/PwDatabaseV4;->memoryProtection:Lcom/keepassdroid/database/PwDatabaseV4$MemoryProtectionConfig;

    iget-boolean v1, v2, Lcom/keepassdroid/database/PwDatabaseV4$MemoryProtectionConfig;->protectTitle:Z

    .line 246
    .local v1, "protect":Z
    const-string v2, "Title"

    invoke-virtual {p0, v2, p1, v1}, Lcom/keepassdroid/database/PwEntryV4;->setString(Ljava/lang/String;Ljava/lang/String;Z)V

    .line 247
    return-void
.end method

.method public setUUID(Ljava/util/UUID;)V
    .locals 0
    .param p1, "u"    # Ljava/util/UUID;

    .prologue
    .line 310
    iput-object p1, p0, Lcom/keepassdroid/database/PwEntryV4;->uuid:Ljava/util/UUID;

    .line 311
    return-void
.end method

.method public setUrl(Ljava/lang/String;Lcom/keepassdroid/database/PwDatabase;)V
    .locals 3
    .param p1, "url"    # Ljava/lang/String;
    .param p2, "d"    # Lcom/keepassdroid/database/PwDatabase;

    .prologue
    .line 267
    move-object v0, p2

    check-cast v0, Lcom/keepassdroid/database/PwDatabaseV4;

    .line 268
    .local v0, "db":Lcom/keepassdroid/database/PwDatabaseV4;
    iget-object v2, v0, Lcom/keepassdroid/database/PwDatabaseV4;->memoryProtection:Lcom/keepassdroid/database/PwDatabaseV4$MemoryProtectionConfig;

    iget-boolean v1, v2, Lcom/keepassdroid/database/PwDatabaseV4$MemoryProtectionConfig;->protectUrl:Z

    .line 270
    .local v1, "protect":Z
    const-string v2, "URL"

    invoke-virtual {p0, v2, p1, v1}, Lcom/keepassdroid/database/PwEntryV4;->setString(Ljava/lang/String;Ljava/lang/String;Z)V

    .line 271
    return-void
.end method

.method public setUsageCount(J)V
    .locals 1
    .param p1, "count"    # J

    .prologue
    .line 339
    iput-wide p1, p0, Lcom/keepassdroid/database/PwEntryV4;->usageCount:J

    .line 340
    return-void
.end method

.method public setUsername(Ljava/lang/String;Lcom/keepassdroid/database/PwDatabase;)V
    .locals 3
    .param p1, "user"    # Ljava/lang/String;
    .param p2, "d"    # Lcom/keepassdroid/database/PwDatabase;

    .prologue
    .line 251
    move-object v0, p2

    check-cast v0, Lcom/keepassdroid/database/PwDatabaseV4;

    .line 252
    .local v0, "db":Lcom/keepassdroid/database/PwDatabaseV4;
    iget-object v2, v0, Lcom/keepassdroid/database/PwDatabaseV4;->memoryProtection:Lcom/keepassdroid/database/PwDatabaseV4$MemoryProtectionConfig;

    iget-boolean v1, v2, Lcom/keepassdroid/database/PwDatabaseV4$MemoryProtectionConfig;->protectUserName:Z

    .line 254
    .local v1, "protect":Z
    const-string v2, "UserName"

    invoke-virtual {p0, v2, p1, v1}, Lcom/keepassdroid/database/PwEntryV4;->setString(Ljava/lang/String;Ljava/lang/String;Z)V

    .line 255
    return-void
.end method

.method public touch(ZZ)V
    .locals 4
    .param p1, "modified"    # Z
    .param p2, "touchParents"    # Z

    .prologue
    .line 467
    invoke-super {p0, p1, p2}, Lcom/keepassdroid/database/PwEntry;->touch(ZZ)V

    .line 469
    iget-wide v0, p0, Lcom/keepassdroid/database/PwEntryV4;->usageCount:J

    const-wide/16 v2, 0x1

    add-long/2addr v0, v2

    iput-wide v0, p0, Lcom/keepassdroid/database/PwEntryV4;->usageCount:J

    .line 470
    return-void
.end method

.method public touchLocation()V
    .locals 1

    .prologue
    .line 474
    new-instance v0, Ljava/util/Date;

    invoke-direct {v0}, Ljava/util/Date;-><init>()V

    iput-object v0, p0, Lcom/keepassdroid/database/PwEntryV4;->parentGroupLastMod:Ljava/util/Date;

    .line 475
    return-void
.end method
