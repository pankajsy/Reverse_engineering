.class public Lcom/keepassdroid/database/PwDatabaseV3;
.super Lcom/keepassdroid/database/PwDatabase;
.source "PwDatabaseV3.java"


# static fields
.field static final synthetic $assertionsDisabled:Z


# instance fields
.field private final DEFAULT_ENCRYPTION_ROUNDS:I

.field public algorithm:Lcom/keepassdroid/database/PwEncryptionAlgorithm;

.field public entries:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/keepassdroid/database/PwEntry;",
            ">;"
        }
    .end annotation
.end field

.field public groups:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/keepassdroid/database/PwGroup;",
            ">;"
        }
    .end annotation
.end field

.field public metaInfo:Lcom/keepassdroid/database/PwEntry;

.field public numKeyEncRounds:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 63
    const-class v0, Lcom/keepassdroid/database/PwDatabaseV3;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    sput-boolean v0, Lcom/keepassdroid/database/PwDatabaseV3;->$assertionsDisabled:Z

    return-void

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 63
    invoke-direct {p0}, Lcom/keepassdroid/database/PwDatabase;-><init>()V

    .line 67
    const/16 v0, 0x12c

    iput v0, p0, Lcom/keepassdroid/database/PwDatabaseV3;->DEFAULT_ENCRYPTION_ROUNDS:I

    .line 73
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/keepassdroid/database/PwDatabaseV3;->entries:Ljava/util/List;

    .line 75
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/keepassdroid/database/PwDatabaseV3;->groups:Ljava/util/List;

    return-void
.end method

.method private initAndAddGroup(Ljava/lang/String;ILcom/keepassdroid/database/PwGroup;)V
    .locals 2
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "iconId"    # I
    .param p3, "parent"    # Lcom/keepassdroid/database/PwGroup;

    .prologue
    .line 342
    invoke-virtual {p0}, Lcom/keepassdroid/database/PwDatabaseV3;->createGroup()Lcom/keepassdroid/database/PwGroup;

    move-result-object v0

    .line 343
    .local v0, "group":Lcom/keepassdroid/database/PwGroup;
    invoke-virtual {p0}, Lcom/keepassdroid/database/PwDatabaseV3;->newGroupId()Lcom/keepassdroid/database/PwGroupIdV3;

    move-result-object v1

    invoke-virtual {v0, p1, v1}, Lcom/keepassdroid/database/PwGroup;->initNewGroup(Ljava/lang/String;Lcom/keepassdroid/database/PwGroupId;)V

    .line 344
    iget-object v1, p0, Lcom/keepassdroid/database/PwDatabaseV3;->iconFactory:Lcom/keepassdroid/database/PwIconFactory;

    invoke-virtual {v1, p2}, Lcom/keepassdroid/database/PwIconFactory;->getIcon(I)Lcom/keepassdroid/database/PwIconStandard;

    move-result-object v1

    iput-object v1, v0, Lcom/keepassdroid/database/PwGroup;->icon:Lcom/keepassdroid/database/PwIconStandard;

    .line 345
    invoke-virtual {p0, v0, p3}, Lcom/keepassdroid/database/PwDatabaseV3;->addGroupTo(Lcom/keepassdroid/database/PwGroup;Lcom/keepassdroid/database/PwGroup;)V

    .line 346
    return-void
.end method


# virtual methods
.method public addEntryTo(Lcom/keepassdroid/database/PwEntry;Lcom/keepassdroid/database/PwGroup;)V
    .locals 1
    .param p1, "newEntry"    # Lcom/keepassdroid/database/PwEntry;
    .param p2, "parent"    # Lcom/keepassdroid/database/PwGroup;

    .prologue
    .line 272
    invoke-super {p0, p1, p2}, Lcom/keepassdroid/database/PwDatabase;->addEntryTo(Lcom/keepassdroid/database/PwEntry;Lcom/keepassdroid/database/PwGroup;)V

    .line 275
    iget-object v0, p0, Lcom/keepassdroid/database/PwDatabaseV3;->entries:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 277
    return-void
.end method

.method public addGroupTo(Lcom/keepassdroid/database/PwGroup;Lcom/keepassdroid/database/PwGroup;)V
    .locals 1
    .param p1, "newGroup"    # Lcom/keepassdroid/database/PwGroup;
    .param p2, "parent"    # Lcom/keepassdroid/database/PwGroup;

    .prologue
    .line 281
    invoke-super {p0, p1, p2}, Lcom/keepassdroid/database/PwDatabase;->addGroupTo(Lcom/keepassdroid/database/PwGroup;Lcom/keepassdroid/database/PwGroup;)V

    .line 284
    iget-object v0, p0, Lcom/keepassdroid/database/PwDatabaseV3;->groups:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 286
    return-void
.end method

.method public appSettingsEnabled()Z
    .locals 1

    .prologue
    .line 267
    const/4 v0, 0x1

    return v0
.end method

.method public constructTree(Lcom/keepassdroid/database/PwGroupV3;)V
    .locals 6
    .param p1, "currentGroup"    # Lcom/keepassdroid/database/PwGroupV3;

    .prologue
    .line 161
    if-nez p1, :cond_0

    .line 162
    new-instance v3, Lcom/keepassdroid/database/PwGroupV3;

    invoke-direct {v3}, Lcom/keepassdroid/database/PwGroupV3;-><init>()V

    .line 163
    .local v3, "root":Lcom/keepassdroid/database/PwGroupV3;
    iput-object v3, p0, Lcom/keepassdroid/database/PwDatabaseV3;->rootGroup:Lcom/keepassdroid/database/PwGroup;

    .line 165
    invoke-virtual {p0}, Lcom/keepassdroid/database/PwDatabaseV3;->getGrpRoots()Ljava/util/List;

    move-result-object v4

    .line 166
    .local v4, "rootChildGroups":Ljava/util/List;, "Ljava/util/List<Lcom/keepassdroid/database/PwGroup;>;"
    invoke-virtual {v3, v4}, Lcom/keepassdroid/database/PwGroupV3;->setGroups(Ljava/util/List;)V

    .line 167
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    iput-object v5, v3, Lcom/keepassdroid/database/PwGroupV3;->childEntries:Ljava/util/List;

    .line 168
    const/4 v5, -0x1

    iput v5, v3, Lcom/keepassdroid/database/PwGroupV3;->level:I

    .line 169
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v5

    if-ge v2, v5, :cond_2

    .line 170
    invoke-interface {v4, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/keepassdroid/database/PwGroupV3;

    .line 171
    .local v1, "grp":Lcom/keepassdroid/database/PwGroupV3;
    iput-object v3, v1, Lcom/keepassdroid/database/PwGroupV3;->parent:Lcom/keepassdroid/database/PwGroupV3;

    .line 172
    invoke-virtual {p0, v1}, Lcom/keepassdroid/database/PwDatabaseV3;->constructTree(Lcom/keepassdroid/database/PwGroupV3;)V

    .line 169
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 179
    .end local v1    # "grp":Lcom/keepassdroid/database/PwGroupV3;
    .end local v2    # "i":I
    .end local v3    # "root":Lcom/keepassdroid/database/PwGroupV3;
    .end local v4    # "rootChildGroups":Ljava/util/List;, "Ljava/util/List<Lcom/keepassdroid/database/PwGroup;>;"
    :cond_0
    invoke-virtual {p0, p1}, Lcom/keepassdroid/database/PwDatabaseV3;->getGrpChildren(Lcom/keepassdroid/database/PwGroupV3;)Ljava/util/List;

    move-result-object v5

    invoke-virtual {p1, v5}, Lcom/keepassdroid/database/PwGroupV3;->setGroups(Ljava/util/List;)V

    .line 180
    invoke-virtual {p0, p1}, Lcom/keepassdroid/database/PwDatabaseV3;->getEntries(Lcom/keepassdroid/database/PwGroupV3;)Ljava/util/List;

    move-result-object v5

    iput-object v5, p1, Lcom/keepassdroid/database/PwGroupV3;->childEntries:Ljava/util/List;

    .line 183
    const/4 v2, 0x0

    .restart local v2    # "i":I
    :goto_1
    iget-object v5, p1, Lcom/keepassdroid/database/PwGroupV3;->childEntries:Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v5

    if-ge v2, v5, :cond_1

    .line 184
    iget-object v5, p1, Lcom/keepassdroid/database/PwGroupV3;->childEntries:Ljava/util/List;

    invoke-interface {v5, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/keepassdroid/database/PwEntryV3;

    .line 185
    .local v0, "entry":Lcom/keepassdroid/database/PwEntryV3;
    iput-object p1, v0, Lcom/keepassdroid/database/PwEntryV3;->parent:Lcom/keepassdroid/database/PwGroupV3;

    .line 183
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 188
    .end local v0    # "entry":Lcom/keepassdroid/database/PwEntryV3;
    :cond_1
    const/4 v2, 0x0

    :goto_2
    iget-object v5, p1, Lcom/keepassdroid/database/PwGroupV3;->childGroups:Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v5

    if-ge v2, v5, :cond_2

    .line 189
    iget-object v5, p1, Lcom/keepassdroid/database/PwGroupV3;->childGroups:Ljava/util/List;

    invoke-interface {v5, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/keepassdroid/database/PwGroupV3;

    .line 190
    .restart local v1    # "grp":Lcom/keepassdroid/database/PwGroupV3;
    iput-object p1, v1, Lcom/keepassdroid/database/PwGroupV3;->parent:Lcom/keepassdroid/database/PwGroupV3;

    .line 191
    iget-object v5, p1, Lcom/keepassdroid/database/PwGroupV3;->childGroups:Ljava/util/List;

    invoke-interface {v5, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/keepassdroid/database/PwGroupV3;

    invoke-virtual {p0, v5}, Lcom/keepassdroid/database/PwDatabaseV3;->constructTree(Lcom/keepassdroid/database/PwGroupV3;)V

    .line 188
    add-int/lit8 v2, v2, 0x1

    goto :goto_2

    .line 193
    .end local v1    # "grp":Lcom/keepassdroid/database/PwGroupV3;
    :cond_2
    return-void
.end method

.method public copyEncrypted([BII)V
    .locals 0
    .param p1, "buf"    # [B
    .param p2, "offset"    # I
    .param p3, "size"    # I

    .prologue
    .line 312
    return-void
.end method

.method public copyHeader(Lcom/keepassdroid/database/PwDbHeaderV3;)V
    .locals 0
    .param p1, "header"    # Lcom/keepassdroid/database/PwDbHeaderV3;

    .prologue
    .line 317
    return-void
.end method

.method public createGroup()Lcom/keepassdroid/database/PwGroup;
    .locals 1

    .prologue
    .line 306
    new-instance v0, Lcom/keepassdroid/database/PwGroupV3;

    invoke-direct {v0}, Lcom/keepassdroid/database/PwGroupV3;-><init>()V

    return-object v0
.end method

.method public getEncAlgorithm()Lcom/keepassdroid/database/PwEncryptionAlgorithm;
    .locals 1

    .prologue
    .line 82
    iget-object v0, p0, Lcom/keepassdroid/database/PwDatabaseV3;->algorithm:Lcom/keepassdroid/database/PwEncryptionAlgorithm;

    return-object v0
.end method

.method public getEntries()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/keepassdroid/database/PwEntry;",
            ">;"
        }
    .end annotation

    .prologue
    .line 96
    iget-object v0, p0, Lcom/keepassdroid/database/PwDatabaseV3;->entries:Ljava/util/List;

    return-object v0
.end method

.method public getEntries(Lcom/keepassdroid/database/PwGroupV3;)Ljava/util/List;
    .locals 5
    .param p1, "parent"    # Lcom/keepassdroid/database/PwGroupV3;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/keepassdroid/database/PwGroupV3;",
            ")",
            "Ljava/util/List",
            "<",
            "Lcom/keepassdroid/database/PwEntry;",
            ">;"
        }
    .end annotation

    .prologue
    .line 141
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 147
    .local v2, "kids":Ljava/util/List;, "Ljava/util/List<Lcom/keepassdroid/database/PwEntry;>;"
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    iget-object v3, p0, Lcom/keepassdroid/database/PwDatabaseV3;->entries:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    if-ge v1, v3, :cond_1

    .line 148
    iget-object v3, p0, Lcom/keepassdroid/database/PwDatabaseV3;->entries:Ljava/util/List;

    invoke-interface {v3, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/keepassdroid/database/PwEntryV3;

    .line 149
    .local v0, "ent":Lcom/keepassdroid/database/PwEntryV3;
    iget v3, v0, Lcom/keepassdroid/database/PwEntryV3;->groupId:I

    iget v4, p1, Lcom/keepassdroid/database/PwGroupV3;->groupId:I

    if-ne v3, v4, :cond_0

    .line 150
    invoke-interface {v2, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 147
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 152
    .end local v0    # "ent":Lcom/keepassdroid/database/PwEntryV3;
    :cond_1
    return-object v2
.end method

.method public getGroups()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/keepassdroid/database/PwGroup;",
            ">;"
        }
    .end annotation

    .prologue
    .line 91
    iget-object v0, p0, Lcom/keepassdroid/database/PwDatabaseV3;->groups:Ljava/util/List;

    return-object v0
.end method

.method public getGrpChildren(Lcom/keepassdroid/database/PwGroupV3;)Ljava/util/List;
    .locals 5
    .param p1, "parent"    # Lcom/keepassdroid/database/PwGroupV3;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/keepassdroid/database/PwGroupV3;",
            ")",
            "Ljava/util/List",
            "<",
            "Lcom/keepassdroid/database/PwGroup;",
            ">;"
        }
    .end annotation

    .prologue
    .line 127
    iget-object v4, p0, Lcom/keepassdroid/database/PwDatabaseV3;->groups:Ljava/util/List;

    invoke-interface {v4, p1}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v1

    .line 128
    .local v1, "idx":I
    iget v4, p1, Lcom/keepassdroid/database/PwGroupV3;->level:I

    add-int/lit8 v3, v4, 0x1

    .line 129
    .local v3, "target":I
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 130
    .local v2, "kids":Ljava/util/List;, "Ljava/util/List<Lcom/keepassdroid/database/PwGroup;>;"
    :cond_0
    :goto_0
    add-int/lit8 v1, v1, 0x1

    iget-object v4, p0, Lcom/keepassdroid/database/PwDatabaseV3;->groups:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v4

    if-ge v1, v4, :cond_1

    .line 131
    iget-object v4, p0, Lcom/keepassdroid/database/PwDatabaseV3;->groups:Ljava/util/List;

    invoke-interface {v4, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/keepassdroid/database/PwGroupV3;

    .line 132
    .local v0, "grp":Lcom/keepassdroid/database/PwGroupV3;
    iget v4, v0, Lcom/keepassdroid/database/PwGroupV3;->level:I

    if-ge v4, v3, :cond_2

    .line 137
    .end local v0    # "grp":Lcom/keepassdroid/database/PwGroupV3;
    :cond_1
    return-object v2

    .line 134
    .restart local v0    # "grp":Lcom/keepassdroid/database/PwGroupV3;
    :cond_2
    iget v4, v0, Lcom/keepassdroid/database/PwGroupV3;->level:I

    if-ne v4, v3, :cond_0

    .line 135
    invoke-interface {v2, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0
.end method

.method public getGrpRoots()Ljava/util/List;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/keepassdroid/database/PwGroup;",
            ">;"
        }
    .end annotation

    .prologue
    .line 105
    const/4 v3, 0x0

    .line 106
    .local v3, "target":I
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 107
    .local v2, "kids":Ljava/util/List;, "Ljava/util/List<Lcom/keepassdroid/database/PwGroup;>;"
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    iget-object v4, p0, Lcom/keepassdroid/database/PwDatabaseV3;->groups:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v4

    if-ge v1, v4, :cond_1

    .line 108
    iget-object v4, p0, Lcom/keepassdroid/database/PwDatabaseV3;->groups:Ljava/util/List;

    invoke-interface {v4, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/keepassdroid/database/PwGroupV3;

    .line 109
    .local v0, "grp":Lcom/keepassdroid/database/PwGroupV3;
    iget v4, v0, Lcom/keepassdroid/database/PwGroupV3;->level:I

    if-ne v4, v3, :cond_0

    .line 110
    invoke-interface {v2, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 107
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 112
    .end local v0    # "grp":Lcom/keepassdroid/database/PwGroupV3;
    :cond_1
    return-object v2
.end method

.method public getMasterKey(Ljava/lang/String;Ljava/io/InputStream;)[B
    .locals 2
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "keyInputStream"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/keepassdroid/database/exception/InvalidKeyFileException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 225
    sget-boolean v0, Lcom/keepassdroid/database/PwDatabaseV3;->$assertionsDisabled:Z

    if-nez v0, :cond_0

    if-nez p1, :cond_0

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 227
    :cond_0
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_1

    if-eqz p2, :cond_1

    .line 228
    invoke-virtual {p0, p1, p2}, Lcom/keepassdroid/database/PwDatabaseV3;->getCompositeKey(Ljava/lang/String;Ljava/io/InputStream;)[B

    move-result-object v0

    .line 232
    :goto_0
    return-object v0

    .line 229
    :cond_1
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_2

    .line 230
    invoke-virtual {p0, p1}, Lcom/keepassdroid/database/PwDatabaseV3;->getPasswordKey(Ljava/lang/String;)[B

    move-result-object v0

    goto :goto_0

    .line 231
    :cond_2
    if-eqz p2, :cond_3

    .line 232
    invoke-virtual {p0, p2}, Lcom/keepassdroid/database/PwDatabaseV3;->getFileKey(Ljava/io/InputStream;)[B

    move-result-object v0

    goto :goto_0

    .line 234
    :cond_3
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Key cannot be empty."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getNumKeyEncRecords()I
    .locals 1

    .prologue
    .line 86
    iget v0, p0, Lcom/keepassdroid/database/PwDatabaseV3;->numKeyEncRounds:I

    return v0
.end method

.method public getNumRounds()J
    .locals 2

    .prologue
    .line 253
    iget v0, p0, Lcom/keepassdroid/database/PwDatabaseV3;->numKeyEncRounds:I

    int-to-long v0, v0

    return-wide v0
.end method

.method protected getPasswordEncoding()Ljava/lang/String;
    .locals 1

    .prologue
    .line 241
    const-string v0, "ISO-8859-1"

    return-object v0
.end method

.method public getRootGroupId()I
    .locals 3

    .prologue
    .line 116
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    iget-object v2, p0, Lcom/keepassdroid/database/PwDatabaseV3;->groups:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-ge v1, v2, :cond_1

    .line 117
    iget-object v2, p0, Lcom/keepassdroid/database/PwDatabaseV3;->groups:Ljava/util/List;

    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/keepassdroid/database/PwGroupV3;

    .line 118
    .local v0, "grp":Lcom/keepassdroid/database/PwGroupV3;
    iget v2, v0, Lcom/keepassdroid/database/PwGroupV3;->level:I

    if-nez v2, :cond_0

    .line 119
    iget v2, v0, Lcom/keepassdroid/database/PwGroupV3;->groupId:I

    .line 123
    .end local v0    # "grp":Lcom/keepassdroid/database/PwGroupV3;
    :goto_1
    return v2

    .line 116
    .restart local v0    # "grp":Lcom/keepassdroid/database/PwGroupV3;
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 123
    .end local v0    # "grp":Lcom/keepassdroid/database/PwGroupV3;
    :cond_1
    const/4 v2, -0x1

    goto :goto_1
.end method

.method public initNew(Ljava/lang/String;)V
    .locals 3
    .param p1, "dbPath"    # Ljava/lang/String;

    .prologue
    .line 350
    sget-object v0, Lcom/keepassdroid/database/PwEncryptionAlgorithm;->Rjindal:Lcom/keepassdroid/database/PwEncryptionAlgorithm;

    iput-object v0, p0, Lcom/keepassdroid/database/PwDatabaseV3;->algorithm:Lcom/keepassdroid/database/PwEncryptionAlgorithm;

    .line 351
    const/16 v0, 0x12c

    iput v0, p0, Lcom/keepassdroid/database/PwDatabaseV3;->numKeyEncRounds:I

    .line 352
    const-string v0, "KeePass Password Manager"

    iput-object v0, p0, Lcom/keepassdroid/database/PwDatabaseV3;->name:Ljava/lang/String;

    .line 354
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/keepassdroid/database/PwDatabaseV3;->constructTree(Lcom/keepassdroid/database/PwGroupV3;)V

    .line 357
    const-string v0, "Internet"

    const/4 v1, 0x1

    iget-object v2, p0, Lcom/keepassdroid/database/PwDatabaseV3;->rootGroup:Lcom/keepassdroid/database/PwGroup;

    invoke-direct {p0, v0, v1, v2}, Lcom/keepassdroid/database/PwDatabaseV3;->initAndAddGroup(Ljava/lang/String;ILcom/keepassdroid/database/PwGroup;)V

    .line 358
    const-string v0, "eMail"

    const/16 v1, 0x13

    iget-object v2, p0, Lcom/keepassdroid/database/PwDatabaseV3;->rootGroup:Lcom/keepassdroid/database/PwGroup;

    invoke-direct {p0, v0, v1, v2}, Lcom/keepassdroid/database/PwDatabaseV3;->initAndAddGroup(Ljava/lang/String;ILcom/keepassdroid/database/PwGroup;)V

    .line 359
    return-void
.end method

.method public isBackup(Lcom/keepassdroid/database/PwGroup;)Z
    .locals 3
    .param p1, "group"    # Lcom/keepassdroid/database/PwGroup;

    .prologue
    .line 320
    move-object v0, p1

    check-cast v0, Lcom/keepassdroid/database/PwGroupV3;

    .line 321
    .local v0, "g":Lcom/keepassdroid/database/PwGroupV3;
    :goto_0
    if-eqz v0, :cond_1

    .line 322
    iget v1, v0, Lcom/keepassdroid/database/PwGroupV3;->level:I

    if-nez v1, :cond_0

    iget-object v1, v0, Lcom/keepassdroid/database/PwGroupV3;->name:Ljava/lang/String;

    const-string v2, "Backup"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 323
    const/4 v1, 0x1

    .line 329
    :goto_1
    return v1

    .line 326
    :cond_0
    iget-object v0, v0, Lcom/keepassdroid/database/PwGroupV3;->parent:Lcom/keepassdroid/database/PwGroupV3;

    goto :goto_0

    .line 329
    :cond_1
    const/4 v1, 0x0

    goto :goto_1
.end method

.method public isGroupSearchable(Lcom/keepassdroid/database/PwGroup;Z)Z
    .locals 2
    .param p1, "group"    # Lcom/keepassdroid/database/PwGroup;
    .param p2, "omitBackup"    # Z

    .prologue
    const/4 v0, 0x0

    .line 334
    invoke-super {p0, p1, p2}, Lcom/keepassdroid/database/PwDatabase;->isGroupSearchable(Lcom/keepassdroid/database/PwGroup;Z)Z

    move-result v1

    if-nez v1, :cond_1

    .line 338
    :cond_0
    :goto_0
    return v0

    :cond_1
    if-eqz p2, :cond_2

    invoke-virtual {p0, p1}, Lcom/keepassdroid/database/PwDatabaseV3;->isBackup(Lcom/keepassdroid/database/PwGroup;)Z

    move-result v1

    if-nez v1, :cond_0

    :cond_2
    const/4 v0, 0x1

    goto :goto_0
.end method

.method protected loadXmlKeyFile(Ljava/io/InputStream;)[B
    .locals 1
    .param p1, "keyInputStream"    # Ljava/io/InputStream;

    .prologue
    .line 246
    const/4 v0, 0x0

    return-object v0
.end method

.method public bridge synthetic newGroupId()Lcom/keepassdroid/database/PwGroupId;
    .locals 1

    .prologue
    .line 63
    invoke-virtual {p0}, Lcom/keepassdroid/database/PwDatabaseV3;->newGroupId()Lcom/keepassdroid/database/PwGroupIdV3;

    move-result-object v0

    return-object v0
.end method

.method public newGroupId()Lcom/keepassdroid/database/PwGroupIdV3;
    .locals 3

    .prologue
    .line 210
    new-instance v0, Lcom/keepassdroid/database/PwGroupIdV3;

    const/4 v2, 0x0

    invoke-direct {v0, v2}, Lcom/keepassdroid/database/PwGroupIdV3;-><init>(I)V

    .line 212
    .local v0, "newId":Lcom/keepassdroid/database/PwGroupIdV3;
    new-instance v1, Ljava/util/Random;

    invoke-direct {v1}, Ljava/util/Random;-><init>()V

    .line 215
    .local v1, "random":Ljava/util/Random;
    :cond_0
    new-instance v0, Lcom/keepassdroid/database/PwGroupIdV3;

    .end local v0    # "newId":Lcom/keepassdroid/database/PwGroupIdV3;
    invoke-virtual {v1}, Ljava/util/Random;->nextInt()I

    move-result v2

    invoke-direct {v0, v2}, Lcom/keepassdroid/database/PwGroupIdV3;-><init>(I)V

    .line 217
    .restart local v0    # "newId":Lcom/keepassdroid/database/PwGroupIdV3;
    invoke-virtual {p0, v0}, Lcom/keepassdroid/database/PwDatabaseV3;->isGroupIdUsed(Lcom/keepassdroid/database/PwGroupId;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 220
    return-object v0
.end method

.method public removeEntryFrom(Lcom/keepassdroid/database/PwEntry;Lcom/keepassdroid/database/PwGroup;)V
    .locals 1
    .param p1, "remove"    # Lcom/keepassdroid/database/PwEntry;
    .param p2, "parent"    # Lcom/keepassdroid/database/PwGroup;

    .prologue
    .line 290
    invoke-super {p0, p1, p2}, Lcom/keepassdroid/database/PwDatabase;->removeEntryFrom(Lcom/keepassdroid/database/PwEntry;Lcom/keepassdroid/database/PwGroup;)V

    .line 293
    iget-object v0, p0, Lcom/keepassdroid/database/PwDatabaseV3;->entries:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 294
    return-void
.end method

.method public removeGroupFrom(Lcom/keepassdroid/database/PwGroup;Lcom/keepassdroid/database/PwGroup;)V
    .locals 1
    .param p1, "remove"    # Lcom/keepassdroid/database/PwGroup;
    .param p2, "parent"    # Lcom/keepassdroid/database/PwGroup;

    .prologue
    .line 298
    invoke-super {p0, p1, p2}, Lcom/keepassdroid/database/PwDatabase;->removeGroupFrom(Lcom/keepassdroid/database/PwGroup;Lcom/keepassdroid/database/PwGroup;)V

    .line 301
    iget-object v0, p0, Lcom/keepassdroid/database/PwDatabaseV3;->groups:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 302
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
    .line 100
    .local p1, "grp":Ljava/util/List;, "Ljava/util/List<Lcom/keepassdroid/database/PwGroup;>;"
    iput-object p1, p0, Lcom/keepassdroid/database/PwDatabaseV3;->groups:Ljava/util/List;

    .line 101
    return-void
.end method

.method public setNumRounds(J)V
    .locals 3
    .param p1, "rounds"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/NumberFormatException;
        }
    .end annotation

    .prologue
    .line 258
    const-wide/32 v0, 0x7fffffff

    cmp-long v0, p1, v0

    if-gtz v0, :cond_0

    const-wide/32 v0, -0x80000000

    cmp-long v0, p1, v0

    if-gez v0, :cond_1

    .line 259
    :cond_0
    new-instance v0, Ljava/lang/NumberFormatException;

    invoke-direct {v0}, Ljava/lang/NumberFormatException;-><init>()V

    throw v0

    .line 262
    :cond_1
    long-to-int v0, p1

    iput v0, p0, Lcom/keepassdroid/database/PwDatabaseV3;->numKeyEncRounds:I

    .line 263
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 156
    iget-object v0, p0, Lcom/keepassdroid/database/PwDatabaseV3;->name:Ljava/lang/String;

    return-object v0
.end method
