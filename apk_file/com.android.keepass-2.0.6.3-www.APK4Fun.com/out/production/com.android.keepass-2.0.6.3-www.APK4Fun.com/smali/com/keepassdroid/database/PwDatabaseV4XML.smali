.class public Lcom/keepassdroid/database/PwDatabaseV4XML;
.super Ljava/lang/Object;
.source "PwDatabaseV4XML.java"


# annotations
.annotation build Landroid/annotation/SuppressLint;
    value = {
        "SimpleDateFormat"
    }
.end annotation


# static fields
.field public static final AttrCompressed:Ljava/lang/String; = "Compressed"

.field public static final AttrId:Ljava/lang/String; = "ID"

.field public static final AttrProtected:Ljava/lang/String; = "Protected"

.field public static final AttrRef:Ljava/lang/String; = "Ref"

.field public static final ElemAutoType:Ljava/lang/String; = "AutoType"

.field public static final ElemAutoTypeDefaultSeq:Ljava/lang/String; = "DefaultSequence"

.field public static final ElemAutoTypeEnabled:Ljava/lang/String; = "Enabled"

.field public static final ElemAutoTypeItem:Ljava/lang/String; = "Association"

.field public static final ElemAutoTypeObfuscation:Ljava/lang/String; = "DataTransferObfuscation"

.field public static final ElemBgColor:Ljava/lang/String; = "BackgroundColor"

.field public static final ElemBinaries:Ljava/lang/String; = "Binaries"

.field public static final ElemBinary:Ljava/lang/String; = "Binary"

.field public static final ElemCreationTime:Ljava/lang/String; = "CreationTime"

.field public static final ElemCustomData:Ljava/lang/String; = "CustomData"

.field public static final ElemCustomIconID:Ljava/lang/String; = "CustomIconUUID"

.field public static final ElemCustomIconItem:Ljava/lang/String; = "Icon"

.field public static final ElemCustomIconItemData:Ljava/lang/String; = "Data"

.field public static final ElemCustomIconItemID:Ljava/lang/String; = "UUID"

.field public static final ElemCustomIcons:Ljava/lang/String; = "CustomIcons"

.field public static final ElemDbColor:Ljava/lang/String; = "Color"

.field public static final ElemDbDefaultUser:Ljava/lang/String; = "DefaultUserName"

.field public static final ElemDbDefaultUserChanged:Ljava/lang/String; = "DefaultUserNameChanged"

.field public static final ElemDbDesc:Ljava/lang/String; = "DatabaseDescription"

.field public static final ElemDbDescChanged:Ljava/lang/String; = "DatabaseDescriptionChanged"

.field public static final ElemDbKeyChangeForce:Ljava/lang/String; = "MasterKeyChangeForce"

.field public static final ElemDbKeyChangeRec:Ljava/lang/String; = "MasterKeyChangeRec"

.field public static final ElemDbKeyChanged:Ljava/lang/String; = "MasterKeyChanged"

.field public static final ElemDbMntncHistoryDays:Ljava/lang/String; = "MaintenanceHistoryDays"

.field public static final ElemDbName:Ljava/lang/String; = "DatabaseName"

.field public static final ElemDbNameChanged:Ljava/lang/String; = "DatabaseNameChanged"

.field public static final ElemDeletedObject:Ljava/lang/String; = "DeletedObject"

.field public static final ElemDeletedObjects:Ljava/lang/String; = "DeletedObjects"

.field public static final ElemDeletionTime:Ljava/lang/String; = "DeletionTime"

.field public static final ElemDocNode:Ljava/lang/String; = "KeePassFile"

.field public static final ElemEnableAutoType:Ljava/lang/String; = "EnableAutoType"

.field public static final ElemEnableSearching:Ljava/lang/String; = "EnableSearching"

.field public static final ElemEntry:Ljava/lang/String; = "Entry"

.field public static final ElemEntryTemplatesGroup:Ljava/lang/String; = "EntryTemplatesGroup"

.field public static final ElemEntryTemplatesGroupChanged:Ljava/lang/String; = "EntryTemplatesGroupChanged"

.field public static final ElemExpires:Ljava/lang/String; = "Expires"

.field public static final ElemExpiryTime:Ljava/lang/String; = "ExpiryTime"

.field public static final ElemFgColor:Ljava/lang/String; = "ForegroundColor"

.field public static final ElemGenerator:Ljava/lang/String; = "Generator"

.field public static final ElemGroup:Ljava/lang/String; = "Group"

.field public static final ElemGroupDefaultAutoTypeSeq:Ljava/lang/String; = "DefaultAutoTypeSequence"

.field public static final ElemHeaderHash:Ljava/lang/String; = "HeaderHash"

.field public static final ElemHistory:Ljava/lang/String; = "History"

.field public static final ElemHistoryMaxItems:Ljava/lang/String; = "HistoryMaxItems"

.field public static final ElemHistoryMaxSize:Ljava/lang/String; = "HistoryMaxSize"

.field public static final ElemIcon:Ljava/lang/String; = "IconID"

.field public static final ElemIsExpanded:Ljava/lang/String; = "IsExpanded"

.field public static final ElemKey:Ljava/lang/String; = "Key"

.field public static final ElemKeystrokeSequence:Ljava/lang/String; = "KeystrokeSequence"

.field public static final ElemLastAccessTime:Ljava/lang/String; = "LastAccessTime"

.field public static final ElemLastModTime:Ljava/lang/String; = "LastModificationTime"

.field public static final ElemLastSelectedGroup:Ljava/lang/String; = "LastSelectedGroup"

.field public static final ElemLastTopVisibleEntry:Ljava/lang/String; = "LastTopVisibleEntry"

.field public static final ElemLastTopVisibleGroup:Ljava/lang/String; = "LastTopVisibleGroup"

.field public static final ElemLocationChanged:Ljava/lang/String; = "LocationChanged"

.field public static final ElemMemoryProt:Ljava/lang/String; = "MemoryProtection"

.field public static final ElemMeta:Ljava/lang/String; = "Meta"

.field public static final ElemName:Ljava/lang/String; = "Name"

.field public static final ElemNotes:Ljava/lang/String; = "Notes"

.field public static final ElemOverrideUrl:Ljava/lang/String; = "OverrideURL"

.field public static final ElemProtAutoHide:Ljava/lang/String; = "AutoEnableVisualHiding"

.field public static final ElemProtNotes:Ljava/lang/String; = "ProtectNotes"

.field public static final ElemProtPassword:Ljava/lang/String; = "ProtectPassword"

.field public static final ElemProtTitle:Ljava/lang/String; = "ProtectTitle"

.field public static final ElemProtURL:Ljava/lang/String; = "ProtectURL"

.field public static final ElemProtUserName:Ljava/lang/String; = "ProtectUserName"

.field public static final ElemRecycleBinChanged:Ljava/lang/String; = "RecycleBinChanged"

.field public static final ElemRecycleBinEnabled:Ljava/lang/String; = "RecycleBinEnabled"

.field public static final ElemRecycleBinUuid:Ljava/lang/String; = "RecycleBinUUID"

.field public static final ElemRoot:Ljava/lang/String; = "Root"

.field public static final ElemString:Ljava/lang/String; = "String"

.field public static final ElemStringDictExItem:Ljava/lang/String; = "Item"

.field public static final ElemTags:Ljava/lang/String; = "Tags"

.field public static final ElemTimes:Ljava/lang/String; = "Times"

.field public static final ElemUsageCount:Ljava/lang/String; = "UsageCount"

.field public static final ElemUuid:Ljava/lang/String; = "UUID"

.field public static final ElemValue:Ljava/lang/String; = "Value"

.field public static final ElemWindow:Ljava/lang/String; = "Window"

.field public static final ValFalse:Ljava/lang/String; = "False"

.field public static final ValTrue:Ljava/lang/String; = "True"

.field public static final dateFormat:Ljava/text/SimpleDateFormat;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 32
    new-instance v0, Ljava/text/SimpleDateFormat;

    const-string v1, "yyyy-MM-dd\'T\'HH:mm:ss\'Z\'"

    invoke-direct {v0, v1}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/keepassdroid/database/PwDatabaseV4XML;->dateFormat:Ljava/text/SimpleDateFormat;

    .line 33
    sget-object v0, Lcom/keepassdroid/database/PwDatabaseV4XML;->dateFormat:Ljava/text/SimpleDateFormat;

    const-string v1, "UTC"

    invoke-static {v1}, Ljava/util/TimeZone;->getTimeZone(Ljava/lang/String;)Ljava/util/TimeZone;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/text/SimpleDateFormat;->setTimeZone(Ljava/util/TimeZone;)V

    .line 34
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
