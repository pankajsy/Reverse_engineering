.class public Lcom/keepassdroid/database/PwGroupV4;
.super Lcom/keepassdroid/database/PwGroup;
.source "PwGroupV4.java"

# interfaces
.implements Lcom/keepassdroid/database/ITimeLogger;


# static fields
.field static final synthetic $assertionsDisabled:Z

.field public static final DEFAULT_SEARCHING_ENABLED:Z = true


# instance fields
.field private creation:Ljava/util/Date;

.field public customIcon:Lcom/keepassdroid/database/PwIconCustom;

.field public defaultAutoTypeSequence:Ljava/lang/String;

.field public enableAutoType:Ljava/lang/Boolean;

.field public enableSearching:Ljava/lang/Boolean;

.field private expireDate:Ljava/util/Date;

.field private expires:Z

.field public isExpanded:Z

.field private lastAccess:Ljava/util/Date;

.field private lastMod:Ljava/util/Date;

.field public lastTopVisibleEntry:Ljava/util/UUID;

.field public notes:Ljava/lang/String;

.field public parent:Lcom/keepassdroid/database/PwGroupV4;

.field private parentGroupLastMod:Ljava/util/Date;

.field private usageCount:J

.field public uuid:Ljava/util/UUID;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 26
    const-class v0, Lcom/keepassdroid/database/PwGroupV4;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    sput-boolean v0, Lcom/keepassdroid/database/PwGroupV4;->$assertionsDisabled:Z

    return-void

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 48
    invoke-direct {p0}, Lcom/keepassdroid/database/PwGroup;-><init>()V

    .line 31
    iput-object v1, p0, Lcom/keepassdroid/database/PwGroupV4;->parent:Lcom/keepassdroid/database/PwGroupV4;

    .line 32
    sget-object v0, Lcom/keepassdroid/database/PwDatabaseV4;->UUID_ZERO:Ljava/util/UUID;

    iput-object v0, p0, Lcom/keepassdroid/database/PwGroupV4;->uuid:Ljava/util/UUID;

    .line 33
    const-string v0, ""

    iput-object v0, p0, Lcom/keepassdroid/database/PwGroupV4;->notes:Ljava/lang/String;

    .line 34
    sget-object v0, Lcom/keepassdroid/database/PwIconCustom;->ZERO:Lcom/keepassdroid/database/PwIconCustom;

    iput-object v0, p0, Lcom/keepassdroid/database/PwGroupV4;->customIcon:Lcom/keepassdroid/database/PwIconCustom;

    .line 35
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/keepassdroid/database/PwGroupV4;->isExpanded:Z

    .line 36
    const-string v0, ""

    iput-object v0, p0, Lcom/keepassdroid/database/PwGroupV4;->defaultAutoTypeSequence:Ljava/lang/String;

    .line 37
    iput-object v1, p0, Lcom/keepassdroid/database/PwGroupV4;->enableAutoType:Ljava/lang/Boolean;

    .line 38
    iput-object v1, p0, Lcom/keepassdroid/database/PwGroupV4;->enableSearching:Ljava/lang/Boolean;

    .line 39
    sget-object v0, Lcom/keepassdroid/database/PwDatabaseV4;->UUID_ZERO:Ljava/util/UUID;

    iput-object v0, p0, Lcom/keepassdroid/database/PwGroupV4;->lastTopVisibleEntry:Ljava/util/UUID;

    .line 40
    sget-object v0, Lcom/keepassdroid/database/PwDatabaseV4;->DEFAULT_NOW:Ljava/util/Date;

    iput-object v0, p0, Lcom/keepassdroid/database/PwGroupV4;->parentGroupLastMod:Ljava/util/Date;

    .line 41
    sget-object v0, Lcom/keepassdroid/database/PwDatabaseV4;->DEFAULT_NOW:Ljava/util/Date;

    iput-object v0, p0, Lcom/keepassdroid/database/PwGroupV4;->creation:Ljava/util/Date;

    .line 42
    sget-object v0, Lcom/keepassdroid/database/PwDatabaseV4;->DEFAULT_NOW:Ljava/util/Date;

    iput-object v0, p0, Lcom/keepassdroid/database/PwGroupV4;->lastMod:Ljava/util/Date;

    .line 43
    sget-object v0, Lcom/keepassdroid/database/PwDatabaseV4;->DEFAULT_NOW:Ljava/util/Date;

    iput-object v0, p0, Lcom/keepassdroid/database/PwGroupV4;->lastAccess:Ljava/util/Date;

    .line 44
    sget-object v0, Lcom/keepassdroid/database/PwDatabaseV4;->DEFAULT_NOW:Ljava/util/Date;

    iput-object v0, p0, Lcom/keepassdroid/database/PwGroupV4;->expireDate:Ljava/util/Date;

    .line 45
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/keepassdroid/database/PwGroupV4;->expires:Z

    .line 46
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/keepassdroid/database/PwGroupV4;->usageCount:J

    .line 50
    return-void
.end method

.method public constructor <init>(ZZLjava/lang/String;Lcom/keepassdroid/database/PwIconStandard;)V
    .locals 2
    .param p1, "createUUID"    # Z
    .param p2, "setTimes"    # Z
    .param p3, "name"    # Ljava/lang/String;
    .param p4, "icon"    # Lcom/keepassdroid/database/PwIconStandard;

    .prologue
    const/4 v1, 0x0

    .line 52
    invoke-direct {p0}, Lcom/keepassdroid/database/PwGroup;-><init>()V

    .line 31
    iput-object v1, p0, Lcom/keepassdroid/database/PwGroupV4;->parent:Lcom/keepassdroid/database/PwGroupV4;

    .line 32
    sget-object v0, Lcom/keepassdroid/database/PwDatabaseV4;->UUID_ZERO:Ljava/util/UUID;

    iput-object v0, p0, Lcom/keepassdroid/database/PwGroupV4;->uuid:Ljava/util/UUID;

    .line 33
    const-string v0, ""

    iput-object v0, p0, Lcom/keepassdroid/database/PwGroupV4;->notes:Ljava/lang/String;

    .line 34
    sget-object v0, Lcom/keepassdroid/database/PwIconCustom;->ZERO:Lcom/keepassdroid/database/PwIconCustom;

    iput-object v0, p0, Lcom/keepassdroid/database/PwGroupV4;->customIcon:Lcom/keepassdroid/database/PwIconCustom;

    .line 35
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/keepassdroid/database/PwGroupV4;->isExpanded:Z

    .line 36
    const-string v0, ""

    iput-object v0, p0, Lcom/keepassdroid/database/PwGroupV4;->defaultAutoTypeSequence:Ljava/lang/String;

    .line 37
    iput-object v1, p0, Lcom/keepassdroid/database/PwGroupV4;->enableAutoType:Ljava/lang/Boolean;

    .line 38
    iput-object v1, p0, Lcom/keepassdroid/database/PwGroupV4;->enableSearching:Ljava/lang/Boolean;

    .line 39
    sget-object v0, Lcom/keepassdroid/database/PwDatabaseV4;->UUID_ZERO:Ljava/util/UUID;

    iput-object v0, p0, Lcom/keepassdroid/database/PwGroupV4;->lastTopVisibleEntry:Ljava/util/UUID;

    .line 40
    sget-object v0, Lcom/keepassdroid/database/PwDatabaseV4;->DEFAULT_NOW:Ljava/util/Date;

    iput-object v0, p0, Lcom/keepassdroid/database/PwGroupV4;->parentGroupLastMod:Ljava/util/Date;

    .line 41
    sget-object v0, Lcom/keepassdroid/database/PwDatabaseV4;->DEFAULT_NOW:Ljava/util/Date;

    iput-object v0, p0, Lcom/keepassdroid/database/PwGroupV4;->creation:Ljava/util/Date;

    .line 42
    sget-object v0, Lcom/keepassdroid/database/PwDatabaseV4;->DEFAULT_NOW:Ljava/util/Date;

    iput-object v0, p0, Lcom/keepassdroid/database/PwGroupV4;->lastMod:Ljava/util/Date;

    .line 43
    sget-object v0, Lcom/keepassdroid/database/PwDatabaseV4;->DEFAULT_NOW:Ljava/util/Date;

    iput-object v0, p0, Lcom/keepassdroid/database/PwGroupV4;->lastAccess:Ljava/util/Date;

    .line 44
    sget-object v0, Lcom/keepassdroid/database/PwDatabaseV4;->DEFAULT_NOW:Ljava/util/Date;

    iput-object v0, p0, Lcom/keepassdroid/database/PwGroupV4;->expireDate:Ljava/util/Date;

    .line 45
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/keepassdroid/database/PwGroupV4;->expires:Z

    .line 46
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/keepassdroid/database/PwGroupV4;->usageCount:J

    .line 53
    if-eqz p1, :cond_0

    .line 54
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v0

    iput-object v0, p0, Lcom/keepassdroid/database/PwGroupV4;->uuid:Ljava/util/UUID;

    .line 57
    :cond_0
    if-eqz p2, :cond_1

    .line 58
    new-instance v0, Ljava/util/Date;

    invoke-direct {v0}, Ljava/util/Date;-><init>()V

    iput-object v0, p0, Lcom/keepassdroid/database/PwGroupV4;->lastAccess:Ljava/util/Date;

    iput-object v0, p0, Lcom/keepassdroid/database/PwGroupV4;->lastMod:Ljava/util/Date;

    iput-object v0, p0, Lcom/keepassdroid/database/PwGroupV4;->creation:Ljava/util/Date;

    .line 61
    :cond_1
    iput-object p3, p0, Lcom/keepassdroid/database/PwGroupV4;->name:Ljava/lang/String;

    .line 62
    iput-object p4, p0, Lcom/keepassdroid/database/PwGroupV4;->icon:Lcom/keepassdroid/database/PwIconStandard;

    .line 63
    return-void
.end method


# virtual methods
.method public AddEntry(Lcom/keepassdroid/database/PwEntryV4;Z)V
    .locals 1
    .param p1, "pe"    # Lcom/keepassdroid/database/PwEntryV4;
    .param p2, "takeOwnership"    # Z

    .prologue
    .line 81
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Lcom/keepassdroid/database/PwGroupV4;->AddEntry(Lcom/keepassdroid/database/PwEntryV4;ZZ)V

    .line 82
    return-void
.end method

.method public AddEntry(Lcom/keepassdroid/database/PwEntryV4;ZZ)V
    .locals 4
    .param p1, "pe"    # Lcom/keepassdroid/database/PwEntryV4;
    .param p2, "takeOwnership"    # Z
    .param p3, "updateLocationChanged"    # Z

    .prologue
    .line 85
    sget-boolean v0, Lcom/keepassdroid/database/PwGroupV4;->$assertionsDisabled:Z

    if-nez v0, :cond_0

    if-nez p1, :cond_0

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 87
    :cond_0
    iget-object v0, p0, Lcom/keepassdroid/database/PwGroupV4;->childEntries:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 89
    if-eqz p2, :cond_1

    iput-object p0, p1, Lcom/keepassdroid/database/PwEntryV4;->parent:Lcom/keepassdroid/database/PwGroupV4;

    .line 91
    :cond_1
    if-eqz p3, :cond_2

    new-instance v0, Ljava/util/Date;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    invoke-direct {v0, v2, v3}, Ljava/util/Date;-><init>(J)V

    invoke-virtual {p1, v0}, Lcom/keepassdroid/database/PwEntryV4;->setLocationChanged(Ljava/util/Date;)V

    .line 92
    :cond_2
    return-void
.end method

.method public AddGroup(Lcom/keepassdroid/database/PwGroupV4;Z)V
    .locals 1
    .param p1, "subGroup"    # Lcom/keepassdroid/database/PwGroupV4;
    .param p2, "takeOwnership"    # Z

    .prologue
    .line 66
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Lcom/keepassdroid/database/PwGroupV4;->AddGroup(Lcom/keepassdroid/database/PwGroupV4;ZZ)V

    .line 67
    return-void
.end method

.method public AddGroup(Lcom/keepassdroid/database/PwGroupV4;ZZ)V
    .locals 4
    .param p1, "subGroup"    # Lcom/keepassdroid/database/PwGroupV4;
    .param p2, "takeOwnership"    # Z
    .param p3, "updateLocationChanged"    # Z

    .prologue
    .line 70
    if-nez p1, :cond_0

    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "subGroup"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 72
    :cond_0
    iget-object v0, p0, Lcom/keepassdroid/database/PwGroupV4;->childGroups:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 74
    if-eqz p2, :cond_1

    iput-object p0, p1, Lcom/keepassdroid/database/PwGroupV4;->parent:Lcom/keepassdroid/database/PwGroupV4;

    .line 76
    :cond_1
    if-eqz p3, :cond_2

    new-instance v0, Ljava/util/Date;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    invoke-direct {v0, v2, v3}, Ljava/util/Date;-><init>(J)V

    iput-object v0, p1, Lcom/keepassdroid/database/PwGroupV4;->parentGroupLastMod:Ljava/util/Date;

    .line 78
    :cond_2
    return-void
.end method

.method public buildChildEntriesRecursive(Ljava/util/List;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/keepassdroid/database/PwEntry;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 110
    .local p1, "list":Ljava/util/List;, "Ljava/util/List<Lcom/keepassdroid/database/PwEntry;>;"
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    iget-object v2, p0, Lcom/keepassdroid/database/PwGroupV4;->childEntries:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-ge v1, v2, :cond_0

    .line 111
    iget-object v2, p0, Lcom/keepassdroid/database/PwGroupV4;->childEntries:Ljava/util/List;

    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    invoke-interface {p1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 110
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 114
    :cond_0
    const/4 v1, 0x0

    :goto_1
    iget-object v2, p0, Lcom/keepassdroid/database/PwGroupV4;->childGroups:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-ge v1, v2, :cond_1

    .line 115
    iget-object v2, p0, Lcom/keepassdroid/database/PwGroupV4;->childGroups:Ljava/util/List;

    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/keepassdroid/database/PwGroupV4;

    .line 116
    .local v0, "child":Lcom/keepassdroid/database/PwGroupV4;
    invoke-virtual {v0, p1}, Lcom/keepassdroid/database/PwGroupV4;->buildChildEntriesRecursive(Ljava/util/List;)V

    .line 114
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 119
    .end local v0    # "child":Lcom/keepassdroid/database/PwGroupV4;
    :cond_1
    return-void
.end method

.method public buildChildGroupsRecursive(Ljava/util/List;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/keepassdroid/database/PwGroup;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 100
    .local p1, "list":Ljava/util/List;, "Ljava/util/List<Lcom/keepassdroid/database/PwGroup;>;"
    invoke-interface {p1, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 102
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    iget-object v2, p0, Lcom/keepassdroid/database/PwGroupV4;->childGroups:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-ge v1, v2, :cond_0

    .line 103
    iget-object v2, p0, Lcom/keepassdroid/database/PwGroupV4;->childGroups:Ljava/util/List;

    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/keepassdroid/database/PwGroupV4;

    .line 104
    .local v0, "child":Lcom/keepassdroid/database/PwGroupV4;
    invoke-virtual {v0, p1}, Lcom/keepassdroid/database/PwGroupV4;->buildChildGroupsRecursive(Ljava/util/List;)V

    .line 102
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 107
    .end local v0    # "child":Lcom/keepassdroid/database/PwGroupV4;
    :cond_0
    return-void
.end method

.method public expires()Z
    .locals 1

    .prologue
    .line 194
    iget-boolean v0, p0, Lcom/keepassdroid/database/PwGroupV4;->expires:Z

    return v0
.end method

.method public getCreationTime()Ljava/util/Date;
    .locals 1

    .prologue
    .line 143
    iget-object v0, p0, Lcom/keepassdroid/database/PwGroupV4;->creation:Ljava/util/Date;

    return-object v0
.end method

.method public getExpiryTime()Ljava/util/Date;
    .locals 1

    .prologue
    .line 147
    iget-object v0, p0, Lcom/keepassdroid/database/PwGroupV4;->expireDate:Ljava/util/Date;

    return-object v0
.end method

.method public getIcon()Lcom/keepassdroid/database/PwIcon;
    .locals 2

    .prologue
    .line 209
    iget-object v0, p0, Lcom/keepassdroid/database/PwGroupV4;->customIcon:Lcom/keepassdroid/database/PwIconCustom;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/keepassdroid/database/PwGroupV4;->customIcon:Lcom/keepassdroid/database/PwIconCustom;

    iget-object v0, v0, Lcom/keepassdroid/database/PwIconCustom;->uuid:Ljava/util/UUID;

    sget-object v1, Lcom/keepassdroid/database/PwDatabaseV4;->UUID_ZERO:Ljava/util/UUID;

    invoke-virtual {v0, v1}, Ljava/util/UUID;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 210
    :cond_0
    invoke-super {p0}, Lcom/keepassdroid/database/PwGroup;->getIcon()Lcom/keepassdroid/database/PwIcon;

    move-result-object v0

    .line 212
    :goto_0
    return-object v0

    :cond_1
    iget-object v0, p0, Lcom/keepassdroid/database/PwGroupV4;->customIcon:Lcom/keepassdroid/database/PwIconCustom;

    goto :goto_0
.end method

.method public getId()Lcom/keepassdroid/database/PwGroupId;
    .locals 2

    .prologue
    .line 123
    new-instance v0, Lcom/keepassdroid/database/PwGroupIdV4;

    iget-object v1, p0, Lcom/keepassdroid/database/PwGroupV4;->uuid:Ljava/util/UUID;

    invoke-direct {v0, v1}, Lcom/keepassdroid/database/PwGroupIdV4;-><init>(Ljava/util/UUID;)V

    return-object v0
.end method

.method public getLastAccessTime()Ljava/util/Date;
    .locals 1

    .prologue
    .line 151
    iget-object v0, p0, Lcom/keepassdroid/database/PwGroupV4;->lastAccess:Ljava/util/Date;

    return-object v0
.end method

.method public getLastMod()Ljava/util/Date;
    .locals 1

    .prologue
    .line 139
    iget-object v0, p0, Lcom/keepassdroid/database/PwGroupV4;->parentGroupLastMod:Ljava/util/Date;

    return-object v0
.end method

.method public getLastModificationTime()Ljava/util/Date;
    .locals 1

    .prologue
    .line 155
    iget-object v0, p0, Lcom/keepassdroid/database/PwGroupV4;->lastMod:Ljava/util/Date;

    return-object v0
.end method

.method public getLocationChanged()Ljava/util/Date;
    .locals 1

    .prologue
    .line 159
    iget-object v0, p0, Lcom/keepassdroid/database/PwGroupV4;->parentGroupLastMod:Ljava/util/Date;

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 134
    iget-object v0, p0, Lcom/keepassdroid/database/PwGroupV4;->name:Ljava/lang/String;

    return-object v0
.end method

.method public getParent()Lcom/keepassdroid/database/PwGroup;
    .locals 1

    .prologue
    .line 96
    iget-object v0, p0, Lcom/keepassdroid/database/PwGroupV4;->parent:Lcom/keepassdroid/database/PwGroupV4;

    return-object v0
.end method

.method public getUsageCount()J
    .locals 2

    .prologue
    .line 163
    iget-wide v0, p0, Lcom/keepassdroid/database/PwGroupV4;->usageCount:J

    return-wide v0
.end method

.method public initNewGroup(Ljava/lang/String;Lcom/keepassdroid/database/PwGroupId;)V
    .locals 1
    .param p1, "nm"    # Ljava/lang/String;
    .param p2, "newId"    # Lcom/keepassdroid/database/PwGroupId;

    .prologue
    .line 218
    invoke-super {p0, p1, p2}, Lcom/keepassdroid/database/PwGroup;->initNewGroup(Ljava/lang/String;Lcom/keepassdroid/database/PwGroupId;)V

    .line 220
    new-instance v0, Ljava/util/Date;

    invoke-direct {v0}, Ljava/util/Date;-><init>()V

    iput-object v0, p0, Lcom/keepassdroid/database/PwGroupV4;->parentGroupLastMod:Ljava/util/Date;

    iput-object v0, p0, Lcom/keepassdroid/database/PwGroupV4;->creation:Ljava/util/Date;

    iput-object v0, p0, Lcom/keepassdroid/database/PwGroupV4;->lastMod:Ljava/util/Date;

    iput-object v0, p0, Lcom/keepassdroid/database/PwGroupV4;->lastAccess:Ljava/util/Date;

    .line 221
    return-void
.end method

.method public isSearchEnabled()Z
    .locals 3

    .prologue
    .line 224
    move-object v0, p0

    .line 225
    .local v0, "group":Lcom/keepassdroid/database/PwGroupV4;
    :goto_0
    if-eqz v0, :cond_1

    .line 226
    iget-object v1, v0, Lcom/keepassdroid/database/PwGroupV4;->enableSearching:Ljava/lang/Boolean;

    .line 227
    .local v1, "search":Ljava/lang/Boolean;
    if-eqz v1, :cond_0

    .line 228
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    .line 235
    .end local v1    # "search":Ljava/lang/Boolean;
    :goto_1
    return v2

    .line 231
    .restart local v1    # "search":Ljava/lang/Boolean;
    :cond_0
    iget-object v0, v0, Lcom/keepassdroid/database/PwGroupV4;->parent:Lcom/keepassdroid/database/PwGroupV4;

    .line 232
    goto :goto_0

    .line 235
    .end local v1    # "search":Ljava/lang/Boolean;
    :cond_1
    const/4 v2, 0x1

    goto :goto_1
.end method

.method public setCreationTime(Ljava/util/Date;)V
    .locals 0
    .param p1, "date"    # Ljava/util/Date;

    .prologue
    .line 167
    iput-object p1, p0, Lcom/keepassdroid/database/PwGroupV4;->creation:Ljava/util/Date;

    .line 169
    return-void
.end method

.method public setExpires(Z)V
    .locals 0
    .param p1, "exp"    # Z

    .prologue
    .line 198
    iput-boolean p1, p0, Lcom/keepassdroid/database/PwGroupV4;->expires:Z

    .line 199
    return-void
.end method

.method public setExpiryTime(Ljava/util/Date;)V
    .locals 0
    .param p1, "date"    # Ljava/util/Date;

    .prologue
    .line 172
    iput-object p1, p0, Lcom/keepassdroid/database/PwGroupV4;->expireDate:Ljava/util/Date;

    .line 173
    return-void
.end method

.method public setId(Lcom/keepassdroid/database/PwGroupId;)V
    .locals 2
    .param p1, "id"    # Lcom/keepassdroid/database/PwGroupId;

    .prologue
    .line 128
    move-object v0, p1

    check-cast v0, Lcom/keepassdroid/database/PwGroupIdV4;

    .line 129
    .local v0, "id4":Lcom/keepassdroid/database/PwGroupIdV4;
    invoke-virtual {v0}, Lcom/keepassdroid/database/PwGroupIdV4;->getId()Ljava/util/UUID;

    move-result-object v1

    iput-object v1, p0, Lcom/keepassdroid/database/PwGroupV4;->uuid:Ljava/util/UUID;

    .line 130
    return-void
.end method

.method public setLastAccessTime(Ljava/util/Date;)V
    .locals 0
    .param p1, "date"    # Ljava/util/Date;

    .prologue
    .line 177
    iput-object p1, p0, Lcom/keepassdroid/database/PwGroupV4;->lastAccess:Ljava/util/Date;

    .line 178
    return-void
.end method

.method public setLastModificationTime(Ljava/util/Date;)V
    .locals 0
    .param p1, "date"    # Ljava/util/Date;

    .prologue
    .line 182
    iput-object p1, p0, Lcom/keepassdroid/database/PwGroupV4;->lastMod:Ljava/util/Date;

    .line 183
    return-void
.end method

.method public setLocationChanged(Ljava/util/Date;)V
    .locals 0
    .param p1, "date"    # Ljava/util/Date;

    .prologue
    .line 186
    iput-object p1, p0, Lcom/keepassdroid/database/PwGroupV4;->parentGroupLastMod:Ljava/util/Date;

    .line 187
    return-void
.end method

.method public setParent(Lcom/keepassdroid/database/PwGroup;)V
    .locals 0
    .param p1, "prt"    # Lcom/keepassdroid/database/PwGroup;

    .prologue
    .line 203
    check-cast p1, Lcom/keepassdroid/database/PwGroupV4;

    .end local p1    # "prt":Lcom/keepassdroid/database/PwGroup;
    iput-object p1, p0, Lcom/keepassdroid/database/PwGroupV4;->parent:Lcom/keepassdroid/database/PwGroupV4;

    .line 205
    return-void
.end method

.method public setUsageCount(J)V
    .locals 1
    .param p1, "count"    # J

    .prologue
    .line 190
    iput-wide p1, p0, Lcom/keepassdroid/database/PwGroupV4;->usageCount:J

    .line 191
    return-void
.end method
