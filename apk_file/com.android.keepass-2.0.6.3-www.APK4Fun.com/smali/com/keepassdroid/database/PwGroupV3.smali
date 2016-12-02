.class public Lcom/keepassdroid/database/PwGroupV3;
.super Lcom/keepassdroid/database/PwGroup;
.source "PwGroupV3.java"


# static fields
.field public static final BUF_SIZE:I = 0x7c

.field public static final NEVER_EXPIRE:Ljava/util/Date;


# instance fields
.field public flags:I

.field public groupId:I

.field public level:I

.field public parent:Lcom/keepassdroid/database/PwGroupV3;

.field public tCreation:Lcom/keepassdroid/database/PwDate;

.field public tExpire:Lcom/keepassdroid/database/PwDate;

.field public tLastAccess:Lcom/keepassdroid/database/PwDate;

.field public tLastMod:Lcom/keepassdroid/database/PwDate;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 54
    sget-object v0, Lcom/keepassdroid/database/PwEntryV3;->NEVER_EXPIRE:Ljava/util/Date;

    sput-object v0, Lcom/keepassdroid/database/PwGroupV3;->NEVER_EXPIRE:Ljava/util/Date;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 47
    invoke-direct {p0}, Lcom/keepassdroid/database/PwGroup;-><init>()V

    .line 60
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/keepassdroid/database/PwGroupV3;->parent:Lcom/keepassdroid/database/PwGroupV3;

    .line 48
    return-void
.end method


# virtual methods
.method public getId()Lcom/keepassdroid/database/PwGroupId;
    .locals 2

    .prologue
    .line 85
    new-instance v0, Lcom/keepassdroid/database/PwGroupIdV3;

    iget v1, p0, Lcom/keepassdroid/database/PwGroupV3;->groupId:I

    invoke-direct {v0, v1}, Lcom/keepassdroid/database/PwGroupIdV3;-><init>(I)V

    return-object v0
.end method

.method public getLastMod()Ljava/util/Date;
    .locals 1

    .prologue
    .line 101
    iget-object v0, p0, Lcom/keepassdroid/database/PwGroupV3;->tLastMod:Lcom/keepassdroid/database/PwDate;

    invoke-virtual {v0}, Lcom/keepassdroid/database/PwDate;->getJDate()Ljava/util/Date;

    move-result-object v0

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 96
    iget-object v0, p0, Lcom/keepassdroid/database/PwGroupV3;->name:Ljava/lang/String;

    return-object v0
.end method

.method public getParent()Lcom/keepassdroid/database/PwGroup;
    .locals 1

    .prologue
    .line 80
    iget-object v0, p0, Lcom/keepassdroid/database/PwGroupV3;->parent:Lcom/keepassdroid/database/PwGroupV3;

    return-object v0
.end method

.method public initNewGroup(Ljava/lang/String;Lcom/keepassdroid/database/PwGroupId;)V
    .locals 3
    .param p1, "nm"    # Ljava/lang/String;
    .param p2, "newId"    # Lcom/keepassdroid/database/PwGroupId;

    .prologue
    .line 113
    invoke-super {p0, p1, p2}, Lcom/keepassdroid/database/PwGroup;->initNewGroup(Ljava/lang/String;Lcom/keepassdroid/database/PwGroupId;)V

    .line 115
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/Calendar;->getTime()Ljava/util/Date;

    move-result-object v0

    .line 116
    .local v0, "now":Ljava/util/Date;
    new-instance v1, Lcom/keepassdroid/database/PwDate;

    invoke-direct {v1, v0}, Lcom/keepassdroid/database/PwDate;-><init>(Ljava/util/Date;)V

    iput-object v1, p0, Lcom/keepassdroid/database/PwGroupV3;->tCreation:Lcom/keepassdroid/database/PwDate;

    .line 117
    new-instance v1, Lcom/keepassdroid/database/PwDate;

    invoke-direct {v1, v0}, Lcom/keepassdroid/database/PwDate;-><init>(Ljava/util/Date;)V

    iput-object v1, p0, Lcom/keepassdroid/database/PwGroupV3;->tLastAccess:Lcom/keepassdroid/database/PwDate;

    .line 118
    new-instance v1, Lcom/keepassdroid/database/PwDate;

    invoke-direct {v1, v0}, Lcom/keepassdroid/database/PwDate;-><init>(Ljava/util/Date;)V

    iput-object v1, p0, Lcom/keepassdroid/database/PwGroupV3;->tLastMod:Lcom/keepassdroid/database/PwDate;

    .line 119
    new-instance v1, Lcom/keepassdroid/database/PwDate;

    sget-object v2, Lcom/keepassdroid/database/PwGroupV3;->NEVER_EXPIRE:Ljava/util/Date;

    invoke-direct {v1, v2}, Lcom/keepassdroid/database/PwDate;-><init>(Ljava/util/Date;)V

    iput-object v1, p0, Lcom/keepassdroid/database/PwGroupV3;->tExpire:Lcom/keepassdroid/database/PwDate;

    .line 121
    return-void
.end method

.method public populateBlankFields(Lcom/keepassdroid/database/PwDatabaseV3;)V
    .locals 2
    .param p1, "db"    # Lcom/keepassdroid/database/PwDatabaseV3;

    .prologue
    .line 124
    iget-object v0, p0, Lcom/keepassdroid/database/PwGroupV3;->icon:Lcom/keepassdroid/database/PwIconStandard;

    if-nez v0, :cond_0

    .line 125
    iget-object v0, p1, Lcom/keepassdroid/database/PwDatabaseV3;->iconFactory:Lcom/keepassdroid/database/PwIconFactory;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/keepassdroid/database/PwIconFactory;->getIcon(I)Lcom/keepassdroid/database/PwIconStandard;

    move-result-object v0

    iput-object v0, p0, Lcom/keepassdroid/database/PwGroupV3;->icon:Lcom/keepassdroid/database/PwIconStandard;

    .line 128
    :cond_0
    iget-object v0, p0, Lcom/keepassdroid/database/PwGroupV3;->name:Ljava/lang/String;

    if-nez v0, :cond_1

    .line 129
    const-string v0, ""

    iput-object v0, p0, Lcom/keepassdroid/database/PwGroupV3;->name:Ljava/lang/String;

    .line 132
    :cond_1
    iget-object v0, p0, Lcom/keepassdroid/database/PwGroupV3;->tCreation:Lcom/keepassdroid/database/PwDate;

    if-nez v0, :cond_2

    .line 133
    sget-object v0, Lcom/keepassdroid/database/PwEntryV3;->DEFAULT_PWDATE:Lcom/keepassdroid/database/PwDate;

    iput-object v0, p0, Lcom/keepassdroid/database/PwGroupV3;->tCreation:Lcom/keepassdroid/database/PwDate;

    .line 136
    :cond_2
    iget-object v0, p0, Lcom/keepassdroid/database/PwGroupV3;->tLastMod:Lcom/keepassdroid/database/PwDate;

    if-nez v0, :cond_3

    .line 137
    sget-object v0, Lcom/keepassdroid/database/PwEntryV3;->DEFAULT_PWDATE:Lcom/keepassdroid/database/PwDate;

    iput-object v0, p0, Lcom/keepassdroid/database/PwGroupV3;->tLastMod:Lcom/keepassdroid/database/PwDate;

    .line 140
    :cond_3
    iget-object v0, p0, Lcom/keepassdroid/database/PwGroupV3;->tLastAccess:Lcom/keepassdroid/database/PwDate;

    if-nez v0, :cond_4

    .line 141
    sget-object v0, Lcom/keepassdroid/database/PwEntryV3;->DEFAULT_PWDATE:Lcom/keepassdroid/database/PwDate;

    iput-object v0, p0, Lcom/keepassdroid/database/PwGroupV3;->tLastAccess:Lcom/keepassdroid/database/PwDate;

    .line 144
    :cond_4
    iget-object v0, p0, Lcom/keepassdroid/database/PwGroupV3;->tExpire:Lcom/keepassdroid/database/PwDate;

    if-nez v0, :cond_5

    .line 145
    sget-object v0, Lcom/keepassdroid/database/PwEntryV3;->DEFAULT_PWDATE:Lcom/keepassdroid/database/PwDate;

    iput-object v0, p0, Lcom/keepassdroid/database/PwGroupV3;->tExpire:Lcom/keepassdroid/database/PwDate;

    .line 147
    :cond_5
    return-void
.end method

.method public setGroups(Ljava/util/List;)V
    .locals 0
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
    .line 75
    .local p1, "groups":Ljava/util/List;, "Ljava/util/List<Lcom/keepassdroid/database/PwGroup;>;"
    iput-object p1, p0, Lcom/keepassdroid/database/PwGroupV3;->childGroups:Ljava/util/List;

    .line 76
    return-void
.end method

.method public setId(Lcom/keepassdroid/database/PwGroupId;)V
    .locals 2
    .param p1, "id"    # Lcom/keepassdroid/database/PwGroupId;

    .prologue
    .line 90
    move-object v0, p1

    check-cast v0, Lcom/keepassdroid/database/PwGroupIdV3;

    .line 91
    .local v0, "id3":Lcom/keepassdroid/database/PwGroupIdV3;
    invoke-virtual {v0}, Lcom/keepassdroid/database/PwGroupIdV3;->getId()I

    move-result v1

    iput v1, p0, Lcom/keepassdroid/database/PwGroupV3;->groupId:I

    .line 92
    return-void
.end method

.method public setLastAccessTime(Ljava/util/Date;)V
    .locals 1
    .param p1, "date"    # Ljava/util/Date;

    .prologue
    .line 151
    new-instance v0, Lcom/keepassdroid/database/PwDate;

    invoke-direct {v0, p1}, Lcom/keepassdroid/database/PwDate;-><init>(Ljava/util/Date;)V

    iput-object v0, p0, Lcom/keepassdroid/database/PwGroupV3;->tLastAccess:Lcom/keepassdroid/database/PwDate;

    .line 152
    return-void
.end method

.method public setLastModificationTime(Ljava/util/Date;)V
    .locals 1
    .param p1, "date"    # Ljava/util/Date;

    .prologue
    .line 156
    new-instance v0, Lcom/keepassdroid/database/PwDate;

    invoke-direct {v0, p1}, Lcom/keepassdroid/database/PwDate;-><init>(Ljava/util/Date;)V

    iput-object v0, p0, Lcom/keepassdroid/database/PwGroupV3;->tLastMod:Lcom/keepassdroid/database/PwDate;

    .line 157
    return-void
.end method

.method public setParent(Lcom/keepassdroid/database/PwGroup;)V
    .locals 1
    .param p1, "prt"    # Lcom/keepassdroid/database/PwGroup;

    .prologue
    .line 106
    check-cast p1, Lcom/keepassdroid/database/PwGroupV3;

    .end local p1    # "prt":Lcom/keepassdroid/database/PwGroup;
    iput-object p1, p0, Lcom/keepassdroid/database/PwGroupV3;->parent:Lcom/keepassdroid/database/PwGroupV3;

    .line 107
    iget-object v0, p0, Lcom/keepassdroid/database/PwGroupV3;->parent:Lcom/keepassdroid/database/PwGroupV3;

    iget v0, v0, Lcom/keepassdroid/database/PwGroupV3;->level:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/keepassdroid/database/PwGroupV3;->level:I

    .line 109
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 51
    iget-object v0, p0, Lcom/keepassdroid/database/PwGroupV3;->name:Ljava/lang/String;

    return-object v0
.end method
