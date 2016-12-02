.class public abstract Lcom/keepassdroid/database/PwEntry;
.super Ljava/lang/Object;
.source "PwEntry.java"

# interfaces
.implements Ljava/lang/Cloneable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/keepassdroid/database/PwEntry$EntryNameComparator;
    }
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z

.field protected static final PMS_TAN_ENTRY:Ljava/lang/String; = "<TAN>"


# instance fields
.field public icon:Lcom/keepassdroid/database/PwIconStandard;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 29
    const-class v0, Lcom/keepassdroid/database/PwEntry;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    sput-boolean v0, Lcom/keepassdroid/database/PwEntry;->$assertionsDisabled:Z

    return-void

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 43
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 41
    sget-object v0, Lcom/keepassdroid/database/PwIconStandard;->FIRST:Lcom/keepassdroid/database/PwIconStandard;

    iput-object v0, p0, Lcom/keepassdroid/database/PwEntry;->icon:Lcom/keepassdroid/database/PwIconStandard;

    .line 45
    return-void
.end method

.method public static getInstance(Lcom/keepassdroid/database/PwGroup;)Lcom/keepassdroid/database/PwEntry;
    .locals 1
    .param p0, "parent"    # Lcom/keepassdroid/database/PwGroup;

    .prologue
    const/4 v0, 0x1

    .line 48
    invoke-static {p0, v0, v0}, Lcom/keepassdroid/database/PwEntry;->getInstance(Lcom/keepassdroid/database/PwGroup;ZZ)Lcom/keepassdroid/database/PwEntry;

    move-result-object v0

    return-object v0
.end method

.method public static getInstance(Lcom/keepassdroid/database/PwGroup;ZZ)Lcom/keepassdroid/database/PwEntry;
    .locals 2
    .param p0, "parent"    # Lcom/keepassdroid/database/PwGroup;
    .param p1, "initId"    # Z
    .param p2, "initDates"    # Z

    .prologue
    .line 52
    instance-of v0, p0, Lcom/keepassdroid/database/PwGroupV3;

    if-eqz v0, :cond_0

    .line 53
    new-instance v0, Lcom/keepassdroid/database/PwEntryV3;

    check-cast p0, Lcom/keepassdroid/database/PwGroupV3;

    .end local p0    # "parent":Lcom/keepassdroid/database/PwGroup;
    invoke-direct {v0, p0}, Lcom/keepassdroid/database/PwEntryV3;-><init>(Lcom/keepassdroid/database/PwGroupV3;)V

    .line 56
    :goto_0
    return-object v0

    .line 55
    .restart local p0    # "parent":Lcom/keepassdroid/database/PwGroup;
    :cond_0
    instance-of v0, p0, Lcom/keepassdroid/database/PwGroupV4;

    if-eqz v0, :cond_1

    .line 56
    new-instance v0, Lcom/keepassdroid/database/PwEntryV4;

    check-cast p0, Lcom/keepassdroid/database/PwGroupV4;

    .end local p0    # "parent":Lcom/keepassdroid/database/PwGroup;
    invoke-direct {v0, p0}, Lcom/keepassdroid/database/PwEntryV4;-><init>(Lcom/keepassdroid/database/PwGroupV4;)V

    goto :goto_0

    .line 59
    .restart local p0    # "parent":Lcom/keepassdroid/database/PwGroup;
    :cond_1
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "Unknown PwGroup instance."

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method


# virtual methods
.method public assign(Lcom/keepassdroid/database/PwEntry;)V
    .locals 1
    .param p1, "source"    # Lcom/keepassdroid/database/PwEntry;

    .prologue
    .line 81
    iget-object v0, p1, Lcom/keepassdroid/database/PwEntry;->icon:Lcom/keepassdroid/database/PwIconStandard;

    iput-object v0, p0, Lcom/keepassdroid/database/PwEntry;->icon:Lcom/keepassdroid/database/PwIconStandard;

    .line 82
    return-void
.end method

.method public clone(Z)Lcom/keepassdroid/database/PwEntry;
    .locals 1
    .param p1, "deepStrings"    # Z

    .prologue
    .line 77
    invoke-virtual {p0}, Lcom/keepassdroid/database/PwEntry;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/keepassdroid/database/PwEntry;

    return-object v0
.end method

.method public clone()Ljava/lang/Object;
    .locals 4

    .prologue
    .line 67
    :try_start_0
    invoke-super {p0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/keepassdroid/database/PwEntry;
    :try_end_0
    .catch Ljava/lang/CloneNotSupportedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 73
    .local v1, "newEntry":Lcom/keepassdroid/database/PwEntry;
    return-object v1

    .line 68
    .end local v1    # "newEntry":Lcom/keepassdroid/database/PwEntry;
    :catch_0
    move-exception v0

    .line 69
    .local v0, "e":Ljava/lang/CloneNotSupportedException;
    sget-boolean v2, Lcom/keepassdroid/database/PwEntry;->$assertionsDisabled:Z

    if-nez v2, :cond_0

    new-instance v2, Ljava/lang/AssertionError;

    invoke-direct {v2}, Ljava/lang/AssertionError;-><init>()V

    throw v2

    .line 70
    :cond_0
    new-instance v2, Ljava/lang/RuntimeException;

    const-string v3, "Clone should be supported"

    invoke-direct {v2, v3}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method public abstract expires()Z
.end method

.method public abstract getCreationTime()Ljava/util/Date;
.end method

.method public getDisplayTitle()Ljava/lang/String;
    .locals 2

    .prologue
    .line 140
    invoke-virtual {p0}, Lcom/keepassdroid/database/PwEntry;->isTan()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 141
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "<TAN> "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lcom/keepassdroid/database/PwEntry;->getUsername()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 143
    :goto_0
    return-object v0

    :cond_0
    invoke-virtual {p0}, Lcom/keepassdroid/database/PwEntry;->getTitle()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public abstract getExpiryTime()Ljava/util/Date;
.end method

.method public getIcon()Lcom/keepassdroid/database/PwIcon;
    .locals 1

    .prologue
    .line 132
    iget-object v0, p0, Lcom/keepassdroid/database/PwEntry;->icon:Lcom/keepassdroid/database/PwIconStandard;

    return-object v0
.end method

.method public abstract getLastAccessTime()Ljava/util/Date;
.end method

.method public abstract getLastModificationTime()Ljava/util/Date;
.end method

.method public getNotes()Ljava/lang/String;
    .locals 2

    .prologue
    .line 104
    const/4 v0, 0x0

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/keepassdroid/database/PwEntry;->getNotes(ZLcom/keepassdroid/database/PwDatabase;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public abstract getNotes(ZLcom/keepassdroid/database/PwDatabase;)Ljava/lang/String;
.end method

.method public abstract getParent()Lcom/keepassdroid/database/PwGroup;
.end method

.method public getPassword()Ljava/lang/String;
    .locals 2

    .prologue
    .line 96
    const/4 v0, 0x0

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/keepassdroid/database/PwEntry;->getPassword(ZLcom/keepassdroid/database/PwDatabase;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public abstract getPassword(ZLcom/keepassdroid/database/PwDatabase;)Ljava/lang/String;
.end method

.method public getTitle()Ljava/lang/String;
    .locals 2

    .prologue
    .line 88
    const/4 v0, 0x0

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/keepassdroid/database/PwEntry;->getTitle(ZLcom/keepassdroid/database/PwDatabase;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public abstract getTitle(ZLcom/keepassdroid/database/PwDatabase;)Ljava/lang/String;
.end method

.method public abstract getUUID()Ljava/util/UUID;
.end method

.method public getUrl()Ljava/lang/String;
    .locals 2

    .prologue
    .line 100
    const/4 v0, 0x0

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/keepassdroid/database/PwEntry;->getUrl(ZLcom/keepassdroid/database/PwDatabase;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public abstract getUrl(ZLcom/keepassdroid/database/PwDatabase;)Ljava/lang/String;
.end method

.method public getUsername()Ljava/lang/String;
    .locals 2

    .prologue
    .line 92
    const/4 v0, 0x0

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/keepassdroid/database/PwEntry;->getUsername(ZLcom/keepassdroid/database/PwDatabase;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public abstract getUsername(ZLcom/keepassdroid/database/PwDatabase;)Ljava/lang/String;
.end method

.method public isMetaStream()Z
    .locals 1

    .prologue
    .line 149
    const/4 v0, 0x0

    return v0
.end method

.method public isSearchingEnabled()Z
    .locals 1

    .prologue
    .line 176
    const/4 v0, 0x0

    return v0
.end method

.method public isTan()Z
    .locals 2

    .prologue
    .line 136
    invoke-virtual {p0}, Lcom/keepassdroid/database/PwEntry;->getTitle()Ljava/lang/String;

    move-result-object v0

    const-string v1, "<TAN>"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/keepassdroid/database/PwEntry;->getUsername()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public abstract setCreationTime(Ljava/util/Date;)V
.end method

.method public abstract setExpires(Z)V
.end method

.method public abstract setExpiryTime(Ljava/util/Date;)V
.end method

.method public abstract setLastAccessTime(Ljava/util/Date;)V
.end method

.method public abstract setLastModificationTime(Ljava/util/Date;)V
.end method

.method public abstract setNotes(Ljava/lang/String;Lcom/keepassdroid/database/PwDatabase;)V
.end method

.method public abstract setParent(Lcom/keepassdroid/database/PwGroup;)V
.end method

.method public abstract setPassword(Ljava/lang/String;Lcom/keepassdroid/database/PwDatabase;)V
.end method

.method public abstract setTitle(Ljava/lang/String;Lcom/keepassdroid/database/PwDatabase;)V
.end method

.method public abstract setUUID(Ljava/util/UUID;)V
.end method

.method public abstract setUrl(Ljava/lang/String;Lcom/keepassdroid/database/PwDatabase;)V
.end method

.method public abstract setUsername(Ljava/lang/String;Lcom/keepassdroid/database/PwDatabase;)V
.end method

.method public stringIterator()Lcom/keepassdroid/database/iterator/EntrySearchStringIterator;
    .locals 1

    .prologue
    .line 153
    invoke-static {p0}, Lcom/keepassdroid/database/iterator/EntrySearchStringIterator;->getInstance(Lcom/keepassdroid/database/PwEntry;)Lcom/keepassdroid/database/iterator/EntrySearchStringIterator;

    move-result-object v0

    return-object v0
.end method

.method public touch(ZZ)V
    .locals 3
    .param p1, "modified"    # Z
    .param p2, "touchParents"    # Z

    .prologue
    .line 157
    new-instance v0, Ljava/util/Date;

    invoke-direct {v0}, Ljava/util/Date;-><init>()V

    .line 159
    .local v0, "now":Ljava/util/Date;
    invoke-virtual {p0, v0}, Lcom/keepassdroid/database/PwEntry;->setLastAccessTime(Ljava/util/Date;)V

    .line 161
    if-eqz p1, :cond_0

    .line 162
    invoke-virtual {p0, v0}, Lcom/keepassdroid/database/PwEntry;->setLastModificationTime(Ljava/util/Date;)V

    .line 165
    :cond_0
    invoke-virtual {p0}, Lcom/keepassdroid/database/PwEntry;->getParent()Lcom/keepassdroid/database/PwGroup;

    move-result-object v1

    .line 166
    .local v1, "parent":Lcom/keepassdroid/database/PwGroup;
    if-eqz p2, :cond_1

    if-eqz v1, :cond_1

    .line 167
    const/4 v2, 0x1

    invoke-virtual {v1, p1, v2}, Lcom/keepassdroid/database/PwGroup;->touch(ZZ)V

    .line 169
    :cond_1
    return-void
.end method

.method public touchLocation()V
    .locals 0

    .prologue
    .line 171
    return-void
.end method
