.class public Lcom/keepassdroid/database/PwDatabaseV4;
.super Lcom/keepassdroid/database/PwDatabase;
.source "PwDatabaseV4.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/keepassdroid/database/PwDatabaseV4$MemoryProtectionConfig;
    }
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z

.field private static final DEFAULT_HISTORY_MAX_ITEMS:I = 0xa

.field private static final DEFAULT_HISTORY_MAX_SIZE:J = 0x600000L

.field public static final DEFAULT_NOW:Ljava/util/Date;

.field private static final KeyDataElementName:Ljava/lang/String; = "Data"

.field private static final KeyElementName:Ljava/lang/String; = "Key"

.field private static final RECYCLEBIN_NAME:Ljava/lang/String; = "RecycleBin"

.field private static final RootElementName:Ljava/lang/String; = "KeyFile"

.field public static final UUID_ZERO:Ljava/util/UUID;


# instance fields
.field public color:Ljava/lang/String;

.field public compressionAlgorithm:Lcom/keepassdroid/database/PwCompressionAlgorithm;

.field public customData:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public customIcons:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/keepassdroid/database/PwIconCustom;",
            ">;"
        }
    .end annotation
.end field

.field public dataCipher:Ljava/util/UUID;

.field public defaultUserName:Ljava/lang/String;

.field public defaultUserNameChanged:Ljava/util/Date;

.field public deletedObjects:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/keepassdroid/database/PwDeletedObject;",
            ">;"
        }
    .end annotation
.end field

.field public description:Ljava/lang/String;

.field public descriptionChanged:Ljava/util/Date;

.field public entryTemplatesGroup:Ljava/util/UUID;

.field public entryTemplatesGroupChanged:Ljava/util/Date;

.field public historyMaxItems:I

.field public historyMaxSize:J

.field public keyChangeForceDays:J

.field public keyChangeRecDays:J

.field public keyLastChanged:Ljava/util/Date;

.field public lastSelectedGroup:Ljava/util/UUID;

.field public lastTopVisibleGroup:Ljava/util/UUID;

.field public localizedAppName:Ljava/lang/String;

.field public maintenanceHistoryDays:J

.field public memoryProtection:Lcom/keepassdroid/database/PwDatabaseV4$MemoryProtectionConfig;

.field public nameChanged:Ljava/util/Date;

.field public numKeyEncRounds:J

.field public recycleBinChanged:Ljava/util/Date;

.field public recycleBinEnabled:Z

.field public recycleBinUUID:Ljava/util/UUID;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    const-wide/16 v2, 0x0

    .line 51
    const-class v0, Lcom/keepassdroid/database/PwDatabaseV4;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    sput-boolean v0, Lcom/keepassdroid/database/PwDatabaseV4;->$assertionsDisabled:Z

    .line 53
    new-instance v0, Ljava/util/Date;

    invoke-direct {v0}, Ljava/util/Date;-><init>()V

    sput-object v0, Lcom/keepassdroid/database/PwDatabaseV4;->DEFAULT_NOW:Ljava/util/Date;

    .line 54
    new-instance v0, Ljava/util/UUID;

    invoke-direct {v0, v2, v3, v2, v3}, Ljava/util/UUID;-><init>(JJ)V

    sput-object v0, Lcom/keepassdroid/database/PwDatabaseV4;->UUID_ZERO:Ljava/util/UUID;

    return-void

    .line 51
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public constructor <init>()V
    .locals 2

    .prologue
    .line 51
    invoke-direct {p0}, Lcom/keepassdroid/database/PwDatabase;-><init>()V

    .line 59
    sget-object v0, Lcom/keepassdroid/crypto/CipherFactory;->AES_CIPHER:Ljava/util/UUID;

    iput-object v0, p0, Lcom/keepassdroid/database/PwDatabaseV4;->dataCipher:Ljava/util/UUID;

    .line 60
    sget-object v0, Lcom/keepassdroid/database/PwCompressionAlgorithm;->Gzip:Lcom/keepassdroid/database/PwCompressionAlgorithm;

    iput-object v0, p0, Lcom/keepassdroid/database/PwDatabaseV4;->compressionAlgorithm:Lcom/keepassdroid/database/PwCompressionAlgorithm;

    .line 61
    const-wide/16 v0, 0x1770

    iput-wide v0, p0, Lcom/keepassdroid/database/PwDatabaseV4;->numKeyEncRounds:J

    .line 62
    sget-object v0, Lcom/keepassdroid/database/PwDatabaseV4;->DEFAULT_NOW:Ljava/util/Date;

    iput-object v0, p0, Lcom/keepassdroid/database/PwDatabaseV4;->nameChanged:Ljava/util/Date;

    .line 63
    const-string v0, ""

    iput-object v0, p0, Lcom/keepassdroid/database/PwDatabaseV4;->description:Ljava/lang/String;

    .line 64
    sget-object v0, Lcom/keepassdroid/database/PwDatabaseV4;->DEFAULT_NOW:Ljava/util/Date;

    iput-object v0, p0, Lcom/keepassdroid/database/PwDatabaseV4;->descriptionChanged:Ljava/util/Date;

    .line 65
    const-string v0, ""

    iput-object v0, p0, Lcom/keepassdroid/database/PwDatabaseV4;->defaultUserName:Ljava/lang/String;

    .line 66
    sget-object v0, Lcom/keepassdroid/database/PwDatabaseV4;->DEFAULT_NOW:Ljava/util/Date;

    iput-object v0, p0, Lcom/keepassdroid/database/PwDatabaseV4;->defaultUserNameChanged:Ljava/util/Date;

    .line 68
    sget-object v0, Lcom/keepassdroid/database/PwDatabaseV4;->DEFAULT_NOW:Ljava/util/Date;

    iput-object v0, p0, Lcom/keepassdroid/database/PwDatabaseV4;->keyLastChanged:Ljava/util/Date;

    .line 69
    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lcom/keepassdroid/database/PwDatabaseV4;->keyChangeRecDays:J

    .line 70
    const-wide/16 v0, 0x1

    iput-wide v0, p0, Lcom/keepassdroid/database/PwDatabaseV4;->keyChangeForceDays:J

    .line 72
    const-wide/16 v0, 0x16d

    iput-wide v0, p0, Lcom/keepassdroid/database/PwDatabaseV4;->maintenanceHistoryDays:J

    .line 73
    const-string v0, ""

    iput-object v0, p0, Lcom/keepassdroid/database/PwDatabaseV4;->color:Ljava/lang/String;

    .line 74
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/keepassdroid/database/PwDatabaseV4;->recycleBinEnabled:Z

    .line 75
    sget-object v0, Lcom/keepassdroid/database/PwDatabaseV4;->UUID_ZERO:Ljava/util/UUID;

    iput-object v0, p0, Lcom/keepassdroid/database/PwDatabaseV4;->recycleBinUUID:Ljava/util/UUID;

    .line 76
    sget-object v0, Lcom/keepassdroid/database/PwDatabaseV4;->DEFAULT_NOW:Ljava/util/Date;

    iput-object v0, p0, Lcom/keepassdroid/database/PwDatabaseV4;->recycleBinChanged:Ljava/util/Date;

    .line 77
    sget-object v0, Lcom/keepassdroid/database/PwDatabaseV4;->UUID_ZERO:Ljava/util/UUID;

    iput-object v0, p0, Lcom/keepassdroid/database/PwDatabaseV4;->entryTemplatesGroup:Ljava/util/UUID;

    .line 78
    sget-object v0, Lcom/keepassdroid/database/PwDatabaseV4;->DEFAULT_NOW:Ljava/util/Date;

    iput-object v0, p0, Lcom/keepassdroid/database/PwDatabaseV4;->entryTemplatesGroupChanged:Ljava/util/Date;

    .line 79
    const/16 v0, 0xa

    iput v0, p0, Lcom/keepassdroid/database/PwDatabaseV4;->historyMaxItems:I

    .line 80
    const-wide/32 v0, 0x600000

    iput-wide v0, p0, Lcom/keepassdroid/database/PwDatabaseV4;->historyMaxSize:J

    .line 81
    sget-object v0, Lcom/keepassdroid/database/PwDatabaseV4;->UUID_ZERO:Ljava/util/UUID;

    iput-object v0, p0, Lcom/keepassdroid/database/PwDatabaseV4;->lastSelectedGroup:Ljava/util/UUID;

    .line 82
    sget-object v0, Lcom/keepassdroid/database/PwDatabaseV4;->UUID_ZERO:Ljava/util/UUID;

    iput-object v0, p0, Lcom/keepassdroid/database/PwDatabaseV4;->lastTopVisibleGroup:Ljava/util/UUID;

    .line 83
    new-instance v0, Lcom/keepassdroid/database/PwDatabaseV4$MemoryProtectionConfig;

    invoke-direct {v0, p0}, Lcom/keepassdroid/database/PwDatabaseV4$MemoryProtectionConfig;-><init>(Lcom/keepassdroid/database/PwDatabaseV4;)V

    iput-object v0, p0, Lcom/keepassdroid/database/PwDatabaseV4;->memoryProtection:Lcom/keepassdroid/database/PwDatabaseV4$MemoryProtectionConfig;

    .line 84
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/keepassdroid/database/PwDatabaseV4;->deletedObjects:Ljava/util/List;

    .line 85
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/keepassdroid/database/PwDatabaseV4;->customIcons:Ljava/util/List;

    .line 86
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/keepassdroid/database/PwDatabaseV4;->customData:Ljava/util/Map;

    .line 88
    const-string v0, "KeePassDroid"

    iput-object v0, p0, Lcom/keepassdroid/database/PwDatabaseV4;->localizedAppName:Ljava/lang/String;

    return-void
.end method

.method private dbNameFromPath(Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p1, "dbPath"    # Ljava/lang/String;

    .prologue
    const/4 v2, 0x0

    .line 381
    invoke-static {p1, v2, v2}, Landroid/webkit/URLUtil;->guessFileName(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 383
    .local v0, "filename":Ljava/lang/String;
    invoke-static {v0}, Lcom/keepassdroid/utils/EmptyUtils;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 384
    const-string v0, "KeePass Database"

    .line 391
    .end local v0    # "filename":Ljava/lang/String;
    :cond_0
    :goto_0
    return-object v0

    .line 386
    .restart local v0    # "filename":Ljava/lang/String;
    :cond_1
    const-string v2, "."

    invoke-virtual {v0, v2}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v1

    .line 387
    .local v1, "lastExtDot":I
    const/4 v2, -0x1

    if-eq v1, v2, :cond_0

    .line 391
    const/4 v2, 0x0

    invoke-virtual {v0, v2, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method private ensureRecycleBin()V
    .locals 6

    .prologue
    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 274
    invoke-virtual {p0}, Lcom/keepassdroid/database/PwDatabaseV4;->getRecycleBin()Lcom/keepassdroid/database/PwGroupV4;

    move-result-object v1

    if-nez v1, :cond_0

    .line 277
    new-instance v0, Lcom/keepassdroid/database/PwGroupV4;

    const-string v1, "RecycleBin"

    iget-object v2, p0, Lcom/keepassdroid/database/PwDatabaseV4;->iconFactory:Lcom/keepassdroid/database/PwIconFactory;

    const/16 v3, 0x2b

    invoke-virtual {v2, v3}, Lcom/keepassdroid/database/PwIconFactory;->getIcon(I)Lcom/keepassdroid/database/PwIconStandard;

    move-result-object v2

    invoke-direct {v0, v5, v5, v1, v2}, Lcom/keepassdroid/database/PwGroupV4;-><init>(ZZLjava/lang/String;Lcom/keepassdroid/database/PwIconStandard;)V

    .line 278
    .local v0, "recycleBin":Lcom/keepassdroid/database/PwGroupV4;
    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    iput-object v1, v0, Lcom/keepassdroid/database/PwGroupV4;->enableAutoType:Ljava/lang/Boolean;

    .line 279
    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    iput-object v1, v0, Lcom/keepassdroid/database/PwGroupV4;->enableSearching:Ljava/lang/Boolean;

    .line 280
    iput-boolean v4, v0, Lcom/keepassdroid/database/PwGroupV4;->isExpanded:Z

    .line 281
    iget-object v1, p0, Lcom/keepassdroid/database/PwDatabaseV4;->rootGroup:Lcom/keepassdroid/database/PwGroup;

    invoke-virtual {p0, v0, v1}, Lcom/keepassdroid/database/PwDatabaseV4;->addGroupTo(Lcom/keepassdroid/database/PwGroup;Lcom/keepassdroid/database/PwGroup;)V

    .line 283
    iget-object v1, v0, Lcom/keepassdroid/database/PwGroupV4;->uuid:Ljava/util/UUID;

    iput-object v1, p0, Lcom/keepassdroid/database/PwDatabaseV4;->recycleBinUUID:Ljava/util/UUID;

    .line 285
    .end local v0    # "recycleBin":Lcom/keepassdroid/database/PwGroupV4;
    :cond_0
    return-void
.end method


# virtual methods
.method public appSettingsEnabled()Z
    .locals 1

    .prologue
    .line 227
    const/4 v0, 0x0

    return v0
.end method

.method public canRecycle(Lcom/keepassdroid/database/PwEntry;)Z
    .locals 3
    .param p1, "entry"    # Lcom/keepassdroid/database/PwEntry;

    .prologue
    const/4 v1, 0x0

    .line 300
    iget-boolean v2, p0, Lcom/keepassdroid/database/PwDatabaseV4;->recycleBinEnabled:Z

    if-nez v2, :cond_1

    .line 305
    :cond_0
    :goto_0
    return v1

    .line 304
    :cond_1
    invoke-virtual {p1}, Lcom/keepassdroid/database/PwEntry;->getParent()Lcom/keepassdroid/database/PwGroup;

    move-result-object v0

    .line 305
    .local v0, "parent":Lcom/keepassdroid/database/PwGroup;
    if-eqz v0, :cond_0

    invoke-virtual {p0, v0}, Lcom/keepassdroid/database/PwDatabaseV4;->canRecycle(Lcom/keepassdroid/database/PwGroup;)Z

    move-result v2

    if-eqz v2, :cond_0

    const/4 v1, 0x1

    goto :goto_0
.end method

.method public canRecycle(Lcom/keepassdroid/database/PwGroup;)Z
    .locals 3
    .param p1, "group"    # Lcom/keepassdroid/database/PwGroup;

    .prologue
    const/4 v1, 0x0

    .line 289
    iget-boolean v2, p0, Lcom/keepassdroid/database/PwDatabaseV4;->recycleBinEnabled:Z

    if-nez v2, :cond_1

    .line 295
    :cond_0
    :goto_0
    return v1

    .line 293
    :cond_1
    invoke-virtual {p0}, Lcom/keepassdroid/database/PwDatabaseV4;->getRecycleBin()Lcom/keepassdroid/database/PwGroupV4;

    move-result-object v0

    .line 295
    .local v0, "recycle":Lcom/keepassdroid/database/PwGroup;
    if-eqz v0, :cond_2

    invoke-virtual {p1, v0}, Lcom/keepassdroid/database/PwGroup;->isContainedIn(Lcom/keepassdroid/database/PwGroup;)Z

    move-result v2

    if-nez v2, :cond_0

    :cond_2
    const/4 v1, 0x1

    goto :goto_0
.end method

.method public createGroup()Lcom/keepassdroid/database/PwGroup;
    .locals 1

    .prologue
    .line 250
    new-instance v0, Lcom/keepassdroid/database/PwGroupV4;

    invoke-direct {v0}, Lcom/keepassdroid/database/PwGroupV4;-><init>()V

    return-object v0
.end method

.method public deleteEntry(Lcom/keepassdroid/database/PwEntry;)V
    .locals 3
    .param p1, "entry"    # Lcom/keepassdroid/database/PwEntry;

    .prologue
    .line 334
    invoke-super {p0, p1}, Lcom/keepassdroid/database/PwDatabase;->deleteEntry(Lcom/keepassdroid/database/PwEntry;)V

    .line 336
    iget-object v0, p0, Lcom/keepassdroid/database/PwDatabaseV4;->deletedObjects:Ljava/util/List;

    new-instance v1, Lcom/keepassdroid/database/PwDeletedObject;

    invoke-virtual {p1}, Lcom/keepassdroid/database/PwEntry;->getUUID()Ljava/util/UUID;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/keepassdroid/database/PwDeletedObject;-><init>(Ljava/util/UUID;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 337
    return-void
.end method

.method public getEncAlgorithm()Lcom/keepassdroid/database/PwEncryptionAlgorithm;
    .locals 1

    .prologue
    .line 232
    sget-object v0, Lcom/keepassdroid/database/PwEncryptionAlgorithm;->Rjindal:Lcom/keepassdroid/database/PwEncryptionAlgorithm;

    return-object v0
.end method

.method public getEntries()Ljava/util/List;
    .locals 2
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
    .line 207
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 208
    .local v0, "list":Ljava/util/List;, "Ljava/util/List<Lcom/keepassdroid/database/PwEntry;>;"
    iget-object v1, p0, Lcom/keepassdroid/database/PwDatabaseV4;->rootGroup:Lcom/keepassdroid/database/PwGroup;

    check-cast v1, Lcom/keepassdroid/database/PwGroupV4;

    .line 209
    .local v1, "root":Lcom/keepassdroid/database/PwGroupV4;
    invoke-virtual {v1, v0}, Lcom/keepassdroid/database/PwGroupV4;->buildChildEntriesRecursive(Ljava/util/List;)V

    .line 211
    return-object v0
.end method

.method public getGroups()Ljava/util/List;
    .locals 2
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
    .line 193
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 194
    .local v0, "list":Ljava/util/List;, "Ljava/util/List<Lcom/keepassdroid/database/PwGroup;>;"
    iget-object v1, p0, Lcom/keepassdroid/database/PwDatabaseV4;->rootGroup:Lcom/keepassdroid/database/PwGroup;

    check-cast v1, Lcom/keepassdroid/database/PwGroupV4;

    .line 195
    .local v1, "root":Lcom/keepassdroid/database/PwGroupV4;
    invoke-virtual {v1, v0}, Lcom/keepassdroid/database/PwGroupV4;->buildChildGroupsRecursive(Ljava/util/List;)V

    .line 197
    return-object v0
.end method

.method public getGrpRoots()Ljava/util/List;
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
    .line 202
    iget-object v0, p0, Lcom/keepassdroid/database/PwDatabaseV4;->rootGroup:Lcom/keepassdroid/database/PwGroup;

    iget-object v0, v0, Lcom/keepassdroid/database/PwGroup;->childGroups:Ljava/util/List;

    return-object v0
.end method

.method public getMasterKey(Ljava/lang/String;Ljava/io/InputStream;)[B
    .locals 5
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "keyInputStream"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/keepassdroid/database/exception/InvalidKeyFileException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 113
    sget-boolean v3, Lcom/keepassdroid/database/PwDatabaseV4;->$assertionsDisabled:Z

    if-nez v3, :cond_0

    if-nez p1, :cond_0

    new-instance v3, Ljava/lang/AssertionError;

    invoke-direct {v3}, Ljava/lang/AssertionError;-><init>()V

    throw v3

    .line 117
    :cond_0
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v3

    if-lez v3, :cond_1

    if-eqz p2, :cond_1

    .line 118
    invoke-virtual {p0, p1, p2}, Lcom/keepassdroid/database/PwDatabaseV4;->getCompositeKey(Ljava/lang/String;Ljava/io/InputStream;)[B

    move-result-object v3

    .line 134
    :goto_0
    return-object v3

    .line 119
    :cond_1
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v3

    if-lez v3, :cond_2

    .line 120
    invoke-virtual {p0, p1}, Lcom/keepassdroid/database/PwDatabaseV4;->getPasswordKey(Ljava/lang/String;)[B

    move-result-object v1

    .line 129
    .local v1, "fKey":[B
    :goto_1
    :try_start_0
    const-string v3, "SHA-256"

    invoke-static {v3}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;
    :try_end_0
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    .line 134
    .local v2, "md":Ljava/security/MessageDigest;
    invoke-virtual {v2, v1}, Ljava/security/MessageDigest;->digest([B)[B

    move-result-object v3

    goto :goto_0

    .line 121
    .end local v1    # "fKey":[B
    .end local v2    # "md":Ljava/security/MessageDigest;
    :cond_2
    if-eqz p2, :cond_3

    .line 122
    invoke-virtual {p0, p2}, Lcom/keepassdroid/database/PwDatabaseV4;->getFileKey(Ljava/io/InputStream;)[B

    move-result-object v1

    .restart local v1    # "fKey":[B
    goto :goto_1

    .line 124
    .end local v1    # "fKey":[B
    :cond_3
    new-instance v3, Ljava/lang/IllegalArgumentException;

    const-string v4, "Key cannot be empty."

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 130
    .restart local v1    # "fKey":[B
    :catch_0
    move-exception v0

    .line 131
    .local v0, "e":Ljava/security/NoSuchAlgorithmException;
    new-instance v3, Ljava/io/IOException;

    const-string v4, "No SHA-256 implementation"

    invoke-direct {v3, v4}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v3
.end method

.method public getNumRounds()J
    .locals 2

    .prologue
    .line 216
    iget-wide v0, p0, Lcom/keepassdroid/database/PwDatabaseV4;->numKeyEncRounds:J

    return-wide v0
.end method

.method protected getPasswordEncoding()Ljava/lang/String;
    .locals 1

    .prologue
    .line 139
    const-string v0, "UTF-8"

    return-object v0
.end method

.method public bridge synthetic getRecycleBin()Lcom/keepassdroid/database/PwGroup;
    .locals 1

    .prologue
    .line 51
    invoke-virtual {p0}, Lcom/keepassdroid/database/PwDatabaseV4;->getRecycleBin()Lcom/keepassdroid/database/PwGroupV4;

    move-result-object v0

    return-object v0
.end method

.method public getRecycleBin()Lcom/keepassdroid/database/PwGroupV4;
    .locals 2

    .prologue
    .line 348
    iget-object v1, p0, Lcom/keepassdroid/database/PwDatabaseV4;->recycleBinUUID:Ljava/util/UUID;

    if-nez v1, :cond_0

    .line 349
    const/4 v1, 0x0

    .line 353
    :goto_0
    return-object v1

    .line 352
    :cond_0
    new-instance v0, Lcom/keepassdroid/database/PwGroupIdV4;

    iget-object v1, p0, Lcom/keepassdroid/database/PwDatabaseV4;->recycleBinUUID:Ljava/util/UUID;

    invoke-direct {v0, v1}, Lcom/keepassdroid/database/PwGroupIdV4;-><init>(Ljava/util/UUID;)V

    .line 353
    .local v0, "recycleId":Lcom/keepassdroid/database/PwGroupId;
    iget-object v1, p0, Lcom/keepassdroid/database/PwDatabaseV4;->groups:Ljava/util/Map;

    invoke-interface {v1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/keepassdroid/database/PwGroupV4;

    goto :goto_0
.end method

.method public initNew(Ljava/lang/String;)V
    .locals 6
    .param p1, "dbPath"    # Ljava/lang/String;

    .prologue
    const/4 v1, 0x0

    const/4 v5, 0x1

    .line 374
    invoke-static {p1, v1, v1}, Landroid/webkit/URLUtil;->guessFileName(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 376
    .local v0, "filename":Ljava/lang/String;
    new-instance v1, Lcom/keepassdroid/database/PwGroupV4;

    invoke-direct {p0, p1}, Lcom/keepassdroid/database/PwDatabaseV4;->dbNameFromPath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lcom/keepassdroid/database/PwDatabaseV4;->iconFactory:Lcom/keepassdroid/database/PwIconFactory;

    const/16 v4, 0x30

    invoke-virtual {v3, v4}, Lcom/keepassdroid/database/PwIconFactory;->getIcon(I)Lcom/keepassdroid/database/PwIconStandard;

    move-result-object v3

    invoke-direct {v1, v5, v5, v2, v3}, Lcom/keepassdroid/database/PwGroupV4;-><init>(ZZLjava/lang/String;Lcom/keepassdroid/database/PwIconStandard;)V

    iput-object v1, p0, Lcom/keepassdroid/database/PwDatabaseV4;->rootGroup:Lcom/keepassdroid/database/PwGroup;

    .line 377
    iget-object v1, p0, Lcom/keepassdroid/database/PwDatabaseV4;->groups:Ljava/util/Map;

    iget-object v2, p0, Lcom/keepassdroid/database/PwDatabaseV4;->rootGroup:Lcom/keepassdroid/database/PwGroup;

    invoke-virtual {v2}, Lcom/keepassdroid/database/PwGroup;->getId()Lcom/keepassdroid/database/PwGroupId;

    move-result-object v2

    iget-object v3, p0, Lcom/keepassdroid/database/PwDatabaseV4;->rootGroup:Lcom/keepassdroid/database/PwGroup;

    invoke-interface {v1, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 378
    return-void
.end method

.method public isBackup(Lcom/keepassdroid/database/PwGroup;)Z
    .locals 1
    .param p1, "group"    # Lcom/keepassdroid/database/PwGroup;

    .prologue
    .line 255
    iget-boolean v0, p0, Lcom/keepassdroid/database/PwDatabaseV4;->recycleBinEnabled:Z

    if-nez v0, :cond_0

    .line 256
    const/4 v0, 0x0

    .line 259
    :goto_0
    return v0

    :cond_0
    invoke-virtual {p0}, Lcom/keepassdroid/database/PwDatabaseV4;->getRecycleBin()Lcom/keepassdroid/database/PwGroupV4;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/keepassdroid/database/PwGroup;->isContainedIn(Lcom/keepassdroid/database/PwGroup;)Z

    move-result v0

    goto :goto_0
.end method

.method public isGroupSearchable(Lcom/keepassdroid/database/PwGroup;Z)Z
    .locals 2
    .param p1, "group"    # Lcom/keepassdroid/database/PwGroup;
    .param p2, "omitBackup"    # Z

    .prologue
    .line 358
    invoke-super {p0, p1, p2}, Lcom/keepassdroid/database/PwDatabase;->isGroupSearchable(Lcom/keepassdroid/database/PwGroup;Z)Z

    move-result v1

    if-nez v1, :cond_0

    .line 359
    const/4 v1, 0x0

    .line 364
    :goto_0
    return v1

    :cond_0
    move-object v0, p1

    .line 362
    check-cast v0, Lcom/keepassdroid/database/PwGroupV4;

    .line 364
    .local v0, "g":Lcom/keepassdroid/database/PwGroupV4;
    invoke-virtual {v0}, Lcom/keepassdroid/database/PwGroupV4;->isSearchEnabled()Z

    move-result v1

    goto :goto_0
.end method

.method protected loadXmlKeyFile(Ljava/io/InputStream;)[B
    .locals 19
    .param p1, "keyInputStream"    # Ljava/io/InputStream;

    .prologue
    .line 151
    :try_start_0
    invoke-static {}, Ljavax/xml/parsers/DocumentBuilderFactory;->newInstance()Ljavax/xml/parsers/DocumentBuilderFactory;

    move-result-object v6

    .line 152
    .local v6, "dbf":Ljavax/xml/parsers/DocumentBuilderFactory;
    invoke-virtual {v6}, Ljavax/xml/parsers/DocumentBuilderFactory;->newDocumentBuilder()Ljavax/xml/parsers/DocumentBuilder;

    move-result-object v5

    .line 153
    .local v5, "db":Ljavax/xml/parsers/DocumentBuilder;
    move-object/from16 v0, p1

    invoke-virtual {v5, v0}, Ljavax/xml/parsers/DocumentBuilder;->parse(Ljava/io/InputStream;)Lorg/w3c/dom/Document;

    move-result-object v7

    .line 155
    .local v7, "doc":Lorg/w3c/dom/Document;
    invoke-interface {v7}, Lorg/w3c/dom/Document;->getDocumentElement()Lorg/w3c/dom/Element;

    move-result-object v9

    .line 156
    .local v9, "el":Lorg/w3c/dom/Element;
    if-eqz v9, :cond_0

    invoke-interface {v9}, Lorg/w3c/dom/Element;->getNodeName()Ljava/lang/String;

    move-result-object v17

    const-string v18, "KeyFile"

    invoke-virtual/range {v17 .. v18}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v17

    if-nez v17, :cond_1

    .line 157
    :cond_0
    const/16 v17, 0x0

    .line 188
    .end local v5    # "db":Ljavax/xml/parsers/DocumentBuilder;
    .end local v6    # "dbf":Ljavax/xml/parsers/DocumentBuilderFactory;
    .end local v7    # "doc":Lorg/w3c/dom/Document;
    .end local v9    # "el":Lorg/w3c/dom/Element;
    :goto_0
    return-object v17

    .line 160
    .restart local v5    # "db":Ljavax/xml/parsers/DocumentBuilder;
    .restart local v6    # "dbf":Ljavax/xml/parsers/DocumentBuilderFactory;
    .restart local v7    # "doc":Lorg/w3c/dom/Document;
    .restart local v9    # "el":Lorg/w3c/dom/Element;
    :cond_1
    invoke-interface {v9}, Lorg/w3c/dom/Element;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v3

    .line 161
    .local v3, "children":Lorg/w3c/dom/NodeList;
    invoke-interface {v3}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v17

    const/16 v18, 0x2

    move/from16 v0, v17

    move/from16 v1, v18

    if-ge v0, v1, :cond_2

    .line 162
    const/16 v17, 0x0

    goto :goto_0

    .line 165
    :cond_2
    const/4 v10, 0x0

    .local v10, "i":I
    :goto_1
    invoke-interface {v3}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v17

    move/from16 v0, v17

    if-ge v10, v0, :cond_6

    .line 166
    invoke-interface {v3, v10}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v2

    .line 168
    .local v2, "child":Lorg/w3c/dom/Node;
    invoke-interface {v2}, Lorg/w3c/dom/Node;->getNodeName()Ljava/lang/String;

    move-result-object v17

    const-string v18, "Key"

    invoke-virtual/range {v17 .. v18}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v17

    if-eqz v17, :cond_5

    .line 169
    invoke-interface {v2}, Lorg/w3c/dom/Node;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v14

    .line 170
    .local v14, "keyChildren":Lorg/w3c/dom/NodeList;
    const/4 v11, 0x0

    .local v11, "j":I
    :goto_2
    invoke-interface {v14}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v17

    move/from16 v0, v17

    if-ge v11, v0, :cond_5

    .line 171
    invoke-interface {v14, v11}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v13

    .line 172
    .local v13, "keyChild":Lorg/w3c/dom/Node;
    invoke-interface {v13}, Lorg/w3c/dom/Node;->getNodeName()Ljava/lang/String;

    move-result-object v17

    const-string v18, "Data"

    invoke-virtual/range {v17 .. v18}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v17

    if-eqz v17, :cond_4

    .line 173
    invoke-interface {v13}, Lorg/w3c/dom/Node;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v4

    .line 174
    .local v4, "children2":Lorg/w3c/dom/NodeList;
    const/4 v12, 0x0

    .local v12, "k":I
    :goto_3
    invoke-interface {v4}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v17

    move/from16 v0, v17

    if-ge v12, v0, :cond_4

    .line 175
    invoke-interface {v4, v12}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v15

    .line 176
    .local v15, "text":Lorg/w3c/dom/Node;
    invoke-interface {v15}, Lorg/w3c/dom/Node;->getNodeType()S

    move-result v17

    const/16 v18, 0x3

    move/from16 v0, v17

    move/from16 v1, v18

    if-ne v0, v1, :cond_3

    .line 177
    move-object v0, v15

    check-cast v0, Lorg/w3c/dom/Text;

    move-object/from16 v16, v0

    .line 178
    .local v16, "txt":Lorg/w3c/dom/Text;
    invoke-interface/range {v16 .. v16}, Lorg/w3c/dom/Text;->getNodeValue()Ljava/lang/String;

    move-result-object v17

    invoke-static/range {v17 .. v17}, Lbiz/source_code/base64Coder/Base64Coder;->decode(Ljava/lang/String;)[B
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v17

    goto :goto_0

    .line 174
    .end local v16    # "txt":Lorg/w3c/dom/Text;
    :cond_3
    add-int/lit8 v12, v12, 0x1

    goto :goto_3

    .line 170
    .end local v4    # "children2":Lorg/w3c/dom/NodeList;
    .end local v12    # "k":I
    .end local v15    # "text":Lorg/w3c/dom/Node;
    :cond_4
    add-int/lit8 v11, v11, 0x1

    goto :goto_2

    .line 165
    .end local v11    # "j":I
    .end local v13    # "keyChild":Lorg/w3c/dom/Node;
    .end local v14    # "keyChildren":Lorg/w3c/dom/NodeList;
    :cond_5
    add-int/lit8 v10, v10, 0x1

    goto :goto_1

    .line 185
    .end local v2    # "child":Lorg/w3c/dom/Node;
    .end local v3    # "children":Lorg/w3c/dom/NodeList;
    .end local v5    # "db":Ljavax/xml/parsers/DocumentBuilder;
    .end local v6    # "dbf":Ljavax/xml/parsers/DocumentBuilderFactory;
    .end local v7    # "doc":Lorg/w3c/dom/Document;
    .end local v9    # "el":Lorg/w3c/dom/Element;
    .end local v10    # "i":I
    :catch_0
    move-exception v8

    .line 186
    .local v8, "e":Ljava/lang/Exception;
    const/16 v17, 0x0

    goto/16 :goto_0

    .line 188
    .end local v8    # "e":Ljava/lang/Exception;
    .restart local v3    # "children":Lorg/w3c/dom/NodeList;
    .restart local v5    # "db":Ljavax/xml/parsers/DocumentBuilder;
    .restart local v6    # "dbf":Ljavax/xml/parsers/DocumentBuilderFactory;
    .restart local v7    # "doc":Lorg/w3c/dom/Document;
    .restart local v9    # "el":Lorg/w3c/dom/Element;
    .restart local v10    # "i":I
    :cond_6
    const/16 v17, 0x0

    goto/16 :goto_0
.end method

.method public bridge synthetic newGroupId()Lcom/keepassdroid/database/PwGroupId;
    .locals 1

    .prologue
    .line 51
    invoke-virtual {p0}, Lcom/keepassdroid/database/PwDatabaseV4;->newGroupId()Lcom/keepassdroid/database/PwGroupIdV4;

    move-result-object v0

    return-object v0
.end method

.method public newGroupId()Lcom/keepassdroid/database/PwGroupIdV4;
    .locals 2

    .prologue
    .line 237
    new-instance v0, Lcom/keepassdroid/database/PwGroupIdV4;

    sget-object v1, Lcom/keepassdroid/database/PwDatabaseV4;->UUID_ZERO:Ljava/util/UUID;

    invoke-direct {v0, v1}, Lcom/keepassdroid/database/PwGroupIdV4;-><init>(Ljava/util/UUID;)V

    .line 240
    .local v0, "id":Lcom/keepassdroid/database/PwGroupIdV4;
    :cond_0
    new-instance v0, Lcom/keepassdroid/database/PwGroupIdV4;

    .end local v0    # "id":Lcom/keepassdroid/database/PwGroupIdV4;
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/keepassdroid/database/PwGroupIdV4;-><init>(Ljava/util/UUID;)V

    .line 242
    .restart local v0    # "id":Lcom/keepassdroid/database/PwGroupIdV4;
    invoke-virtual {p0, v0}, Lcom/keepassdroid/database/PwDatabaseV4;->isGroupIdUsed(Lcom/keepassdroid/database/PwGroupId;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 245
    return-object v0
.end method

.method public populateGlobals(Lcom/keepassdroid/database/PwGroup;)V
    .locals 3
    .param p1, "currentGroup"    # Lcom/keepassdroid/database/PwGroup;

    .prologue
    .line 264
    iget-object v0, p0, Lcom/keepassdroid/database/PwDatabaseV4;->groups:Ljava/util/Map;

    iget-object v1, p0, Lcom/keepassdroid/database/PwDatabaseV4;->rootGroup:Lcom/keepassdroid/database/PwGroup;

    invoke-virtual {v1}, Lcom/keepassdroid/database/PwGroup;->getId()Lcom/keepassdroid/database/PwGroupId;

    move-result-object v1

    iget-object v2, p0, Lcom/keepassdroid/database/PwDatabaseV4;->rootGroup:Lcom/keepassdroid/database/PwGroup;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 266
    invoke-super {p0, p1}, Lcom/keepassdroid/database/PwDatabase;->populateGlobals(Lcom/keepassdroid/database/PwGroup;)V

    .line 267
    return-void
.end method

.method public recycle(Lcom/keepassdroid/database/PwEntry;)V
    .locals 4
    .param p1, "entry"    # Lcom/keepassdroid/database/PwEntry;

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 310
    invoke-direct {p0}, Lcom/keepassdroid/database/PwDatabaseV4;->ensureRecycleBin()V

    .line 312
    invoke-virtual {p1}, Lcom/keepassdroid/database/PwEntry;->getParent()Lcom/keepassdroid/database/PwGroup;

    move-result-object v0

    .line 313
    .local v0, "parent":Lcom/keepassdroid/database/PwGroup;
    invoke-virtual {p0, p1, v0}, Lcom/keepassdroid/database/PwDatabaseV4;->removeEntryFrom(Lcom/keepassdroid/database/PwEntry;Lcom/keepassdroid/database/PwGroup;)V

    .line 314
    invoke-virtual {v0, v2, v3}, Lcom/keepassdroid/database/PwGroup;->touch(ZZ)V

    .line 316
    invoke-virtual {p0}, Lcom/keepassdroid/database/PwDatabaseV4;->getRecycleBin()Lcom/keepassdroid/database/PwGroupV4;

    move-result-object v1

    .line 317
    .local v1, "recycleBin":Lcom/keepassdroid/database/PwGroup;
    invoke-virtual {p0, p1, v1}, Lcom/keepassdroid/database/PwDatabaseV4;->addEntryTo(Lcom/keepassdroid/database/PwEntry;Lcom/keepassdroid/database/PwGroup;)V

    .line 319
    invoke-virtual {p1, v2, v3}, Lcom/keepassdroid/database/PwEntry;->touch(ZZ)V

    .line 320
    invoke-virtual {p1}, Lcom/keepassdroid/database/PwEntry;->touchLocation()V

    .line 321
    return-void
.end method

.method public setNumRounds(J)V
    .locals 1
    .param p1, "rounds"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/NumberFormatException;
        }
    .end annotation

    .prologue
    .line 221
    iput-wide p1, p0, Lcom/keepassdroid/database/PwDatabaseV4;->numKeyEncRounds:J

    .line 223
    return-void
.end method

.method public undoDeleteEntry(Lcom/keepassdroid/database/PwEntry;Lcom/keepassdroid/database/PwGroup;)V
    .locals 1
    .param p1, "entry"    # Lcom/keepassdroid/database/PwEntry;
    .param p2, "origParent"    # Lcom/keepassdroid/database/PwGroup;

    .prologue
    .line 341
    invoke-super {p0, p1, p2}, Lcom/keepassdroid/database/PwDatabase;->undoDeleteEntry(Lcom/keepassdroid/database/PwEntry;Lcom/keepassdroid/database/PwGroup;)V

    .line 343
    iget-object v0, p0, Lcom/keepassdroid/database/PwDatabaseV4;->deletedObjects:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 344
    return-void
.end method

.method public undoRecycle(Lcom/keepassdroid/database/PwEntry;Lcom/keepassdroid/database/PwGroup;)V
    .locals 1
    .param p1, "entry"    # Lcom/keepassdroid/database/PwEntry;
    .param p2, "origParent"    # Lcom/keepassdroid/database/PwGroup;

    .prologue
    .line 326
    invoke-virtual {p0}, Lcom/keepassdroid/database/PwDatabaseV4;->getRecycleBin()Lcom/keepassdroid/database/PwGroupV4;

    move-result-object v0

    .line 327
    .local v0, "recycleBin":Lcom/keepassdroid/database/PwGroup;
    invoke-virtual {p0, p1, v0}, Lcom/keepassdroid/database/PwDatabaseV4;->removeEntryFrom(Lcom/keepassdroid/database/PwEntry;Lcom/keepassdroid/database/PwGroup;)V

    .line 329
    invoke-virtual {p0, p1, p2}, Lcom/keepassdroid/database/PwDatabaseV4;->addEntryTo(Lcom/keepassdroid/database/PwEntry;Lcom/keepassdroid/database/PwGroup;)V

    .line 330
    return-void
.end method

.method public validatePasswordEncoding(Ljava/lang/String;)Z
    .locals 1
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 369
    const/4 v0, 0x1

    return v0
.end method
