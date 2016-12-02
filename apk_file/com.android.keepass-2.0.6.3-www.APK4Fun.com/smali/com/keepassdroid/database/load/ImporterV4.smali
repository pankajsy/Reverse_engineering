.class public Lcom/keepassdroid/database/load/ImporterV4;
.super Lcom/keepassdroid/database/load/Importer;
.source "ImporterV4.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/keepassdroid/database/load/ImporterV4$KdbContext;
    }
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z

.field private static final DEFAULT_HISTORY_DAYS:J = 0x16dL

.field private static final MAX_UINT:J = 0x100000000L


# instance fields
.field private binPool:Lcom/keepassdroid/database/BinaryPool;

.field private ctxATName:Ljava/lang/String;

.field private ctxATSeq:Ljava/lang/String;

.field private ctxBinaryName:Ljava/lang/String;

.field private ctxBinaryValue:Lcom/keepassdroid/database/security/ProtectedBinary;

.field private ctxDeletedObject:Lcom/keepassdroid/database/PwDeletedObject;

.field private ctxEntry:Lcom/keepassdroid/database/PwEntryV4;

.field private ctxGroup:Lcom/keepassdroid/database/PwGroupV4;

.field private ctxGroups:Ljava/util/Stack;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Stack",
            "<",
            "Lcom/keepassdroid/database/PwGroupV4;",
            ">;"
        }
    .end annotation
.end field

.field private ctxHistoryBase:Lcom/keepassdroid/database/PwEntryV4;

.field private ctxStringName:Ljava/lang/String;

.field private ctxStringValue:Lcom/keepassdroid/database/security/ProtectedString;

.field private customDataKey:Ljava/lang/String;

.field private customDataValue:Ljava/lang/String;

.field private customIconData:[B

.field private customIconID:Ljava/util/UUID;

.field private db:Lcom/keepassdroid/database/PwDatabaseV4;

.field private entryInHistory:Z

.field private hashOfHeader:[B

.field private randomStream:Lorg/bouncycastle/crypto/StreamCipher;

.field private readNextNode:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 72
    const-class v0, Lcom/keepassdroid/database/load/ImporterV4;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    sput-boolean v0, Lcom/keepassdroid/database/load/ImporterV4;->$assertionsDisabled:Z

    return-void

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 72
    invoke-direct {p0}, Lcom/keepassdroid/database/load/Importer;-><init>()V

    .line 76
    new-instance v0, Lcom/keepassdroid/database/BinaryPool;

    invoke-direct {v0}, Lcom/keepassdroid/database/BinaryPool;-><init>()V

    iput-object v0, p0, Lcom/keepassdroid/database/load/ImporterV4;->binPool:Lcom/keepassdroid/database/BinaryPool;

    .line 78
    iput-object v1, p0, Lcom/keepassdroid/database/load/ImporterV4;->hashOfHeader:[B

    .line 190
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/keepassdroid/database/load/ImporterV4;->readNextNode:Z

    .line 191
    new-instance v0, Ljava/util/Stack;

    invoke-direct {v0}, Ljava/util/Stack;-><init>()V

    iput-object v0, p0, Lcom/keepassdroid/database/load/ImporterV4;->ctxGroups:Ljava/util/Stack;

    .line 192
    iput-object v1, p0, Lcom/keepassdroid/database/load/ImporterV4;->ctxGroup:Lcom/keepassdroid/database/PwGroupV4;

    .line 193
    iput-object v1, p0, Lcom/keepassdroid/database/load/ImporterV4;->ctxEntry:Lcom/keepassdroid/database/PwEntryV4;

    .line 194
    iput-object v1, p0, Lcom/keepassdroid/database/load/ImporterV4;->ctxStringName:Ljava/lang/String;

    .line 195
    iput-object v1, p0, Lcom/keepassdroid/database/load/ImporterV4;->ctxStringValue:Lcom/keepassdroid/database/security/ProtectedString;

    .line 196
    iput-object v1, p0, Lcom/keepassdroid/database/load/ImporterV4;->ctxBinaryName:Ljava/lang/String;

    .line 197
    iput-object v1, p0, Lcom/keepassdroid/database/load/ImporterV4;->ctxBinaryValue:Lcom/keepassdroid/database/security/ProtectedBinary;

    .line 198
    iput-object v1, p0, Lcom/keepassdroid/database/load/ImporterV4;->ctxATName:Ljava/lang/String;

    .line 199
    iput-object v1, p0, Lcom/keepassdroid/database/load/ImporterV4;->ctxATSeq:Ljava/lang/String;

    .line 200
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/keepassdroid/database/load/ImporterV4;->entryInHistory:Z

    .line 201
    iput-object v1, p0, Lcom/keepassdroid/database/load/ImporterV4;->ctxHistoryBase:Lcom/keepassdroid/database/PwEntryV4;

    .line 202
    iput-object v1, p0, Lcom/keepassdroid/database/load/ImporterV4;->ctxDeletedObject:Lcom/keepassdroid/database/PwDeletedObject;

    .line 203
    sget-object v0, Lcom/keepassdroid/database/PwDatabaseV4;->UUID_ZERO:Ljava/util/UUID;

    iput-object v0, p0, Lcom/keepassdroid/database/load/ImporterV4;->customIconID:Ljava/util/UUID;

    .line 205
    iput-object v1, p0, Lcom/keepassdroid/database/load/ImporterV4;->customDataKey:Ljava/lang/String;

    .line 206
    iput-object v1, p0, Lcom/keepassdroid/database/load/ImporterV4;->customDataValue:Ljava/lang/String;

    return-void
.end method

.method private static CreatePullParser(Ljava/io/InputStream;)Lorg/xmlpull/v1/XmlPullParser;
    .locals 3
    .param p0, "readerStream"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xmlpull/v1/XmlPullParserException;
        }
    .end annotation

    .prologue
    .line 219
    invoke-static {}, Lorg/xmlpull/v1/XmlPullParserFactory;->newInstance()Lorg/xmlpull/v1/XmlPullParserFactory;

    move-result-object v1

    .line 220
    .local v1, "xppf":Lorg/xmlpull/v1/XmlPullParserFactory;
    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lorg/xmlpull/v1/XmlPullParserFactory;->setNamespaceAware(Z)V

    .line 222
    invoke-virtual {v1}, Lorg/xmlpull/v1/XmlPullParserFactory;->newPullParser()Lorg/xmlpull/v1/XmlPullParser;

    move-result-object v0

    .line 223
    .local v0, "xpp":Lorg/xmlpull/v1/XmlPullParser;
    const/4 v2, 0x0

    invoke-interface {v0, p0, v2}, Lorg/xmlpull/v1/XmlPullParser;->setInput(Ljava/io/InputStream;Ljava/lang/String;)V

    .line 225
    return-object v0
.end method

.method private EndXmlElement(Lcom/keepassdroid/database/load/ImporterV4$KdbContext;Lorg/xmlpull/v1/XmlPullParser;)Lcom/keepassdroid/database/load/ImporterV4$KdbContext;
    .locals 7
    .param p1, "ctx"    # Lcom/keepassdroid/database/load/ImporterV4$KdbContext;
    .param p2, "xpp"    # Lorg/xmlpull/v1/XmlPullParser;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xmlpull/v1/XmlPullParserException;
        }
    .end annotation

    .prologue
    const/4 v6, 0x0

    .line 630
    sget-boolean v3, Lcom/keepassdroid/database/load/ImporterV4;->$assertionsDisabled:Z

    if-nez v3, :cond_0

    invoke-interface {p2}, Lorg/xmlpull/v1/XmlPullParser;->getEventType()I

    move-result v3

    const/4 v4, 0x3

    if-eq v3, v4, :cond_0

    new-instance v3, Ljava/lang/AssertionError;

    invoke-direct {v3}, Ljava/lang/AssertionError;-><init>()V

    throw v3

    .line 632
    :cond_0
    invoke-interface {p2}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v2

    .line 633
    .local v2, "name":Ljava/lang/String;
    sget-object v3, Lcom/keepassdroid/database/load/ImporterV4$KdbContext;->KeePassFile:Lcom/keepassdroid/database/load/ImporterV4$KdbContext;

    if-ne p1, v3, :cond_1

    const-string v3, "KeePassFile"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 634
    sget-object v3, Lcom/keepassdroid/database/load/ImporterV4$KdbContext;->Null:Lcom/keepassdroid/database/load/ImporterV4$KdbContext;

    .line 723
    :goto_0
    return-object v3

    .line 635
    :cond_1
    sget-object v3, Lcom/keepassdroid/database/load/ImporterV4$KdbContext;->Meta:Lcom/keepassdroid/database/load/ImporterV4$KdbContext;

    if-ne p1, v3, :cond_2

    const-string v3, "Meta"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 636
    sget-object v3, Lcom/keepassdroid/database/load/ImporterV4$KdbContext;->KeePassFile:Lcom/keepassdroid/database/load/ImporterV4$KdbContext;

    goto :goto_0

    .line 637
    :cond_2
    sget-object v3, Lcom/keepassdroid/database/load/ImporterV4$KdbContext;->Root:Lcom/keepassdroid/database/load/ImporterV4$KdbContext;

    if-ne p1, v3, :cond_3

    const-string v3, "Root"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 638
    sget-object v3, Lcom/keepassdroid/database/load/ImporterV4$KdbContext;->KeePassFile:Lcom/keepassdroid/database/load/ImporterV4$KdbContext;

    goto :goto_0

    .line 639
    :cond_3
    sget-object v3, Lcom/keepassdroid/database/load/ImporterV4$KdbContext;->MemoryProtection:Lcom/keepassdroid/database/load/ImporterV4$KdbContext;

    if-ne p1, v3, :cond_4

    const-string v3, "MemoryProtection"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_4

    .line 640
    sget-object v3, Lcom/keepassdroid/database/load/ImporterV4$KdbContext;->Meta:Lcom/keepassdroid/database/load/ImporterV4$KdbContext;

    goto :goto_0

    .line 641
    :cond_4
    sget-object v3, Lcom/keepassdroid/database/load/ImporterV4$KdbContext;->CustomIcons:Lcom/keepassdroid/database/load/ImporterV4$KdbContext;

    if-ne p1, v3, :cond_5

    const-string v3, "CustomIcons"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_5

    .line 642
    sget-object v3, Lcom/keepassdroid/database/load/ImporterV4$KdbContext;->Meta:Lcom/keepassdroid/database/load/ImporterV4$KdbContext;

    goto :goto_0

    .line 643
    :cond_5
    sget-object v3, Lcom/keepassdroid/database/load/ImporterV4$KdbContext;->CustomIcon:Lcom/keepassdroid/database/load/ImporterV4$KdbContext;

    if-ne p1, v3, :cond_8

    const-string v3, "Icon"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_8

    .line 644
    iget-object v3, p0, Lcom/keepassdroid/database/load/ImporterV4;->customIconID:Ljava/util/UUID;

    sget-object v4, Lcom/keepassdroid/database/PwDatabaseV4;->UUID_ZERO:Ljava/util/UUID;

    invoke-virtual {v3, v4}, Ljava/util/UUID;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_7

    .line 645
    new-instance v1, Lcom/keepassdroid/database/PwIconCustom;

    iget-object v3, p0, Lcom/keepassdroid/database/load/ImporterV4;->customIconID:Ljava/util/UUID;

    iget-object v4, p0, Lcom/keepassdroid/database/load/ImporterV4;->customIconData:[B

    invoke-direct {v1, v3, v4}, Lcom/keepassdroid/database/PwIconCustom;-><init>(Ljava/util/UUID;[B)V

    .line 646
    .local v1, "icon":Lcom/keepassdroid/database/PwIconCustom;
    iget-object v3, p0, Lcom/keepassdroid/database/load/ImporterV4;->db:Lcom/keepassdroid/database/PwDatabaseV4;

    iget-object v3, v3, Lcom/keepassdroid/database/PwDatabaseV4;->customIcons:Ljava/util/List;

    invoke-interface {v3, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 647
    iget-object v3, p0, Lcom/keepassdroid/database/load/ImporterV4;->db:Lcom/keepassdroid/database/PwDatabaseV4;

    iget-object v3, v3, Lcom/keepassdroid/database/PwDatabaseV4;->iconFactory:Lcom/keepassdroid/database/PwIconFactory;

    invoke-virtual {v3, v1}, Lcom/keepassdroid/database/PwIconFactory;->put(Lcom/keepassdroid/database/PwIconCustom;)V

    .line 650
    .end local v1    # "icon":Lcom/keepassdroid/database/PwIconCustom;
    :cond_6
    sget-object v3, Lcom/keepassdroid/database/PwDatabaseV4;->UUID_ZERO:Ljava/util/UUID;

    iput-object v3, p0, Lcom/keepassdroid/database/load/ImporterV4;->customIconID:Ljava/util/UUID;

    .line 651
    iput-object v6, p0, Lcom/keepassdroid/database/load/ImporterV4;->customIconData:[B

    .line 653
    sget-object v3, Lcom/keepassdroid/database/load/ImporterV4$KdbContext;->CustomIcons:Lcom/keepassdroid/database/load/ImporterV4$KdbContext;

    goto :goto_0

    .line 648
    :cond_7
    sget-boolean v3, Lcom/keepassdroid/database/load/ImporterV4;->$assertionsDisabled:Z

    if-nez v3, :cond_6

    new-instance v3, Ljava/lang/AssertionError;

    invoke-direct {v3}, Ljava/lang/AssertionError;-><init>()V

    throw v3

    .line 654
    :cond_8
    sget-object v3, Lcom/keepassdroid/database/load/ImporterV4$KdbContext;->Binaries:Lcom/keepassdroid/database/load/ImporterV4$KdbContext;

    if-ne p1, v3, :cond_9

    const-string v3, "Binaries"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_9

    .line 655
    sget-object v3, Lcom/keepassdroid/database/load/ImporterV4$KdbContext;->Meta:Lcom/keepassdroid/database/load/ImporterV4$KdbContext;

    goto/16 :goto_0

    .line 656
    :cond_9
    sget-object v3, Lcom/keepassdroid/database/load/ImporterV4$KdbContext;->CustomData:Lcom/keepassdroid/database/load/ImporterV4$KdbContext;

    if-ne p1, v3, :cond_a

    const-string v3, "CustomData"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_a

    .line 657
    sget-object v3, Lcom/keepassdroid/database/load/ImporterV4$KdbContext;->Meta:Lcom/keepassdroid/database/load/ImporterV4$KdbContext;

    goto/16 :goto_0

    .line 658
    :cond_a
    sget-object v3, Lcom/keepassdroid/database/load/ImporterV4$KdbContext;->CustomDataItem:Lcom/keepassdroid/database/load/ImporterV4$KdbContext;

    if-ne p1, v3, :cond_d

    const-string v3, "Item"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_d

    .line 659
    iget-object v3, p0, Lcom/keepassdroid/database/load/ImporterV4;->customDataKey:Ljava/lang/String;

    if-eqz v3, :cond_c

    iget-object v3, p0, Lcom/keepassdroid/database/load/ImporterV4;->customDataValue:Ljava/lang/String;

    if-eqz v3, :cond_c

    .line 660
    iget-object v3, p0, Lcom/keepassdroid/database/load/ImporterV4;->db:Lcom/keepassdroid/database/PwDatabaseV4;

    iget-object v3, v3, Lcom/keepassdroid/database/PwDatabaseV4;->customData:Ljava/util/Map;

    iget-object v4, p0, Lcom/keepassdroid/database/load/ImporterV4;->customDataKey:Ljava/lang/String;

    iget-object v5, p0, Lcom/keepassdroid/database/load/ImporterV4;->customDataValue:Ljava/lang/String;

    invoke-interface {v3, v4, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 663
    :cond_b
    iput-object v6, p0, Lcom/keepassdroid/database/load/ImporterV4;->customDataKey:Ljava/lang/String;

    .line 664
    iput-object v6, p0, Lcom/keepassdroid/database/load/ImporterV4;->customDataValue:Ljava/lang/String;

    .line 666
    sget-object v3, Lcom/keepassdroid/database/load/ImporterV4$KdbContext;->CustomData:Lcom/keepassdroid/database/load/ImporterV4$KdbContext;

    goto/16 :goto_0

    .line 661
    :cond_c
    sget-boolean v3, Lcom/keepassdroid/database/load/ImporterV4;->$assertionsDisabled:Z

    if-nez v3, :cond_b

    new-instance v3, Ljava/lang/AssertionError;

    invoke-direct {v3}, Ljava/lang/AssertionError;-><init>()V

    throw v3

    .line 667
    :cond_d
    sget-object v3, Lcom/keepassdroid/database/load/ImporterV4$KdbContext;->Group:Lcom/keepassdroid/database/load/ImporterV4$KdbContext;

    if-ne p1, v3, :cond_11

    const-string v3, "Group"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_11

    .line 668
    iget-object v3, p0, Lcom/keepassdroid/database/load/ImporterV4;->ctxGroup:Lcom/keepassdroid/database/PwGroupV4;

    iget-object v3, v3, Lcom/keepassdroid/database/PwGroupV4;->uuid:Ljava/util/UUID;

    if-eqz v3, :cond_e

    iget-object v3, p0, Lcom/keepassdroid/database/load/ImporterV4;->ctxGroup:Lcom/keepassdroid/database/PwGroupV4;

    iget-object v3, v3, Lcom/keepassdroid/database/PwGroupV4;->uuid:Ljava/util/UUID;

    sget-object v4, Lcom/keepassdroid/database/PwDatabaseV4;->UUID_ZERO:Ljava/util/UUID;

    invoke-virtual {v3, v4}, Ljava/util/UUID;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_f

    .line 669
    :cond_e
    iget-object v3, p0, Lcom/keepassdroid/database/load/ImporterV4;->ctxGroup:Lcom/keepassdroid/database/PwGroupV4;

    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v4

    iput-object v4, v3, Lcom/keepassdroid/database/PwGroupV4;->uuid:Ljava/util/UUID;

    .line 672
    :cond_f
    iget-object v3, p0, Lcom/keepassdroid/database/load/ImporterV4;->ctxGroups:Ljava/util/Stack;

    invoke-virtual {v3}, Ljava/util/Stack;->pop()Ljava/lang/Object;

    .line 674
    iget-object v3, p0, Lcom/keepassdroid/database/load/ImporterV4;->ctxGroups:Ljava/util/Stack;

    invoke-virtual {v3}, Ljava/util/Stack;->size()I

    move-result v3

    if-nez v3, :cond_10

    .line 675
    iput-object v6, p0, Lcom/keepassdroid/database/load/ImporterV4;->ctxGroup:Lcom/keepassdroid/database/PwGroupV4;

    .line 676
    sget-object v3, Lcom/keepassdroid/database/load/ImporterV4$KdbContext;->Root:Lcom/keepassdroid/database/load/ImporterV4$KdbContext;

    goto/16 :goto_0

    .line 678
    :cond_10
    iget-object v3, p0, Lcom/keepassdroid/database/load/ImporterV4;->ctxGroups:Ljava/util/Stack;

    invoke-virtual {v3}, Ljava/util/Stack;->peek()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/keepassdroid/database/PwGroupV4;

    iput-object v3, p0, Lcom/keepassdroid/database/load/ImporterV4;->ctxGroup:Lcom/keepassdroid/database/PwGroupV4;

    .line 679
    sget-object v3, Lcom/keepassdroid/database/load/ImporterV4$KdbContext;->Group:Lcom/keepassdroid/database/load/ImporterV4$KdbContext;

    goto/16 :goto_0

    .line 681
    :cond_11
    sget-object v3, Lcom/keepassdroid/database/load/ImporterV4$KdbContext;->GroupTimes:Lcom/keepassdroid/database/load/ImporterV4$KdbContext;

    if-ne p1, v3, :cond_12

    const-string v3, "Times"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_12

    .line 682
    sget-object v3, Lcom/keepassdroid/database/load/ImporterV4$KdbContext;->Group:Lcom/keepassdroid/database/load/ImporterV4$KdbContext;

    goto/16 :goto_0

    .line 683
    :cond_12
    sget-object v3, Lcom/keepassdroid/database/load/ImporterV4$KdbContext;->Entry:Lcom/keepassdroid/database/load/ImporterV4$KdbContext;

    if-ne p1, v3, :cond_16

    const-string v3, "Entry"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_16

    .line 684
    iget-object v3, p0, Lcom/keepassdroid/database/load/ImporterV4;->ctxEntry:Lcom/keepassdroid/database/PwEntryV4;

    iget-object v3, v3, Lcom/keepassdroid/database/PwEntryV4;->uuid:Ljava/util/UUID;

    if-eqz v3, :cond_13

    iget-object v3, p0, Lcom/keepassdroid/database/load/ImporterV4;->ctxEntry:Lcom/keepassdroid/database/PwEntryV4;

    iget-object v3, v3, Lcom/keepassdroid/database/PwEntryV4;->uuid:Ljava/util/UUID;

    sget-object v4, Lcom/keepassdroid/database/PwDatabaseV4;->UUID_ZERO:Ljava/util/UUID;

    invoke-virtual {v3, v4}, Ljava/util/UUID;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_14

    .line 685
    :cond_13
    iget-object v3, p0, Lcom/keepassdroid/database/load/ImporterV4;->ctxEntry:Lcom/keepassdroid/database/PwEntryV4;

    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v4

    iput-object v4, v3, Lcom/keepassdroid/database/PwEntryV4;->uuid:Ljava/util/UUID;

    .line 688
    :cond_14
    iget-boolean v3, p0, Lcom/keepassdroid/database/load/ImporterV4;->entryInHistory:Z

    if-eqz v3, :cond_15

    .line 689
    iget-object v3, p0, Lcom/keepassdroid/database/load/ImporterV4;->ctxHistoryBase:Lcom/keepassdroid/database/PwEntryV4;

    iput-object v3, p0, Lcom/keepassdroid/database/load/ImporterV4;->ctxEntry:Lcom/keepassdroid/database/PwEntryV4;

    .line 690
    sget-object v3, Lcom/keepassdroid/database/load/ImporterV4$KdbContext;->EntryHistory:Lcom/keepassdroid/database/load/ImporterV4$KdbContext;

    goto/16 :goto_0

    .line 693
    :cond_15
    sget-object v3, Lcom/keepassdroid/database/load/ImporterV4$KdbContext;->Group:Lcom/keepassdroid/database/load/ImporterV4$KdbContext;

    goto/16 :goto_0

    .line 694
    :cond_16
    sget-object v3, Lcom/keepassdroid/database/load/ImporterV4$KdbContext;->EntryTimes:Lcom/keepassdroid/database/load/ImporterV4$KdbContext;

    if-ne p1, v3, :cond_17

    const-string v3, "Times"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_17

    .line 695
    sget-object v3, Lcom/keepassdroid/database/load/ImporterV4$KdbContext;->Entry:Lcom/keepassdroid/database/load/ImporterV4$KdbContext;

    goto/16 :goto_0

    .line 696
    :cond_17
    sget-object v3, Lcom/keepassdroid/database/load/ImporterV4$KdbContext;->EntryString:Lcom/keepassdroid/database/load/ImporterV4$KdbContext;

    if-ne p1, v3, :cond_18

    const-string v3, "String"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_18

    .line 697
    iget-object v3, p0, Lcom/keepassdroid/database/load/ImporterV4;->ctxEntry:Lcom/keepassdroid/database/PwEntryV4;

    iget-object v3, v3, Lcom/keepassdroid/database/PwEntryV4;->strings:Ljava/util/HashMap;

    iget-object v4, p0, Lcom/keepassdroid/database/load/ImporterV4;->ctxStringName:Ljava/lang/String;

    iget-object v5, p0, Lcom/keepassdroid/database/load/ImporterV4;->ctxStringValue:Lcom/keepassdroid/database/security/ProtectedString;

    invoke-virtual {v3, v4, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 698
    iput-object v6, p0, Lcom/keepassdroid/database/load/ImporterV4;->ctxStringName:Ljava/lang/String;

    .line 699
    iput-object v6, p0, Lcom/keepassdroid/database/load/ImporterV4;->ctxStringValue:Lcom/keepassdroid/database/security/ProtectedString;

    .line 701
    sget-object v3, Lcom/keepassdroid/database/load/ImporterV4$KdbContext;->Entry:Lcom/keepassdroid/database/load/ImporterV4$KdbContext;

    goto/16 :goto_0

    .line 702
    :cond_18
    sget-object v3, Lcom/keepassdroid/database/load/ImporterV4$KdbContext;->EntryBinary:Lcom/keepassdroid/database/load/ImporterV4$KdbContext;

    if-ne p1, v3, :cond_19

    const-string v3, "Binary"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_19

    .line 703
    iget-object v3, p0, Lcom/keepassdroid/database/load/ImporterV4;->ctxEntry:Lcom/keepassdroid/database/PwEntryV4;

    iget-object v3, v3, Lcom/keepassdroid/database/PwEntryV4;->binaries:Ljava/util/HashMap;

    iget-object v4, p0, Lcom/keepassdroid/database/load/ImporterV4;->ctxBinaryName:Ljava/lang/String;

    iget-object v5, p0, Lcom/keepassdroid/database/load/ImporterV4;->ctxBinaryValue:Lcom/keepassdroid/database/security/ProtectedBinary;

    invoke-virtual {v3, v4, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 704
    iput-object v6, p0, Lcom/keepassdroid/database/load/ImporterV4;->ctxBinaryName:Ljava/lang/String;

    .line 705
    iput-object v6, p0, Lcom/keepassdroid/database/load/ImporterV4;->ctxBinaryValue:Lcom/keepassdroid/database/security/ProtectedBinary;

    .line 707
    sget-object v3, Lcom/keepassdroid/database/load/ImporterV4$KdbContext;->Entry:Lcom/keepassdroid/database/load/ImporterV4$KdbContext;

    goto/16 :goto_0

    .line 708
    :cond_19
    sget-object v3, Lcom/keepassdroid/database/load/ImporterV4$KdbContext;->EntryAutoType:Lcom/keepassdroid/database/load/ImporterV4$KdbContext;

    if-ne p1, v3, :cond_1a

    const-string v3, "AutoType"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_1a

    .line 709
    sget-object v3, Lcom/keepassdroid/database/load/ImporterV4$KdbContext;->Entry:Lcom/keepassdroid/database/load/ImporterV4$KdbContext;

    goto/16 :goto_0

    .line 710
    :cond_1a
    sget-object v3, Lcom/keepassdroid/database/load/ImporterV4$KdbContext;->EntryAutoTypeItem:Lcom/keepassdroid/database/load/ImporterV4$KdbContext;

    if-ne p1, v3, :cond_1b

    const-string v3, "Association"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_1b

    .line 711
    iget-object v3, p0, Lcom/keepassdroid/database/load/ImporterV4;->ctxEntry:Lcom/keepassdroid/database/PwEntryV4;

    iget-object v3, v3, Lcom/keepassdroid/database/PwEntryV4;->autoType:Lcom/keepassdroid/database/PwEntryV4$AutoType;

    iget-object v4, p0, Lcom/keepassdroid/database/load/ImporterV4;->ctxATName:Ljava/lang/String;

    iget-object v5, p0, Lcom/keepassdroid/database/load/ImporterV4;->ctxATSeq:Ljava/lang/String;

    invoke-virtual {v3, v4, v5}, Lcom/keepassdroid/database/PwEntryV4$AutoType;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 712
    iput-object v6, p0, Lcom/keepassdroid/database/load/ImporterV4;->ctxATName:Ljava/lang/String;

    .line 713
    iput-object v6, p0, Lcom/keepassdroid/database/load/ImporterV4;->ctxATSeq:Ljava/lang/String;

    .line 715
    sget-object v3, Lcom/keepassdroid/database/load/ImporterV4$KdbContext;->EntryAutoType:Lcom/keepassdroid/database/load/ImporterV4$KdbContext;

    goto/16 :goto_0

    .line 716
    :cond_1b
    sget-object v3, Lcom/keepassdroid/database/load/ImporterV4$KdbContext;->EntryHistory:Lcom/keepassdroid/database/load/ImporterV4$KdbContext;

    if-ne p1, v3, :cond_1c

    const-string v3, "History"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_1c

    .line 717
    const/4 v3, 0x0

    iput-boolean v3, p0, Lcom/keepassdroid/database/load/ImporterV4;->entryInHistory:Z

    .line 718
    sget-object v3, Lcom/keepassdroid/database/load/ImporterV4$KdbContext;->Entry:Lcom/keepassdroid/database/load/ImporterV4$KdbContext;

    goto/16 :goto_0

    .line 719
    :cond_1c
    sget-object v3, Lcom/keepassdroid/database/load/ImporterV4$KdbContext;->RootDeletedObjects:Lcom/keepassdroid/database/load/ImporterV4$KdbContext;

    if-ne p1, v3, :cond_1d

    const-string v3, "DeletedObjects"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_1d

    .line 720
    sget-object v3, Lcom/keepassdroid/database/load/ImporterV4$KdbContext;->Root:Lcom/keepassdroid/database/load/ImporterV4$KdbContext;

    goto/16 :goto_0

    .line 721
    :cond_1d
    sget-object v3, Lcom/keepassdroid/database/load/ImporterV4$KdbContext;->DeletedObject:Lcom/keepassdroid/database/load/ImporterV4$KdbContext;

    if-ne p1, v3, :cond_1e

    const-string v3, "DeletedObject"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_1e

    .line 722
    iput-object v6, p0, Lcom/keepassdroid/database/load/ImporterV4;->ctxDeletedObject:Lcom/keepassdroid/database/PwDeletedObject;

    .line 723
    sget-object v3, Lcom/keepassdroid/database/load/ImporterV4$KdbContext;->RootDeletedObjects:Lcom/keepassdroid/database/load/ImporterV4$KdbContext;

    goto/16 :goto_0

    .line 725
    :cond_1e
    sget-boolean v3, Lcom/keepassdroid/database/load/ImporterV4;->$assertionsDisabled:Z

    if-nez v3, :cond_1f

    new-instance v3, Ljava/lang/AssertionError;

    invoke-direct {v3}, Ljava/lang/AssertionError;-><init>()V

    throw v3

    .line 727
    :cond_1f
    const-string v0, ""

    .line 728
    .local v0, "contextName":Ljava/lang/String;
    if-eqz p1, :cond_20

    .line 729
    invoke-virtual {p1}, Lcom/keepassdroid/database/load/ImporterV4$KdbContext;->name()Ljava/lang/String;

    move-result-object v0

    .line 731
    :cond_20
    new-instance v3, Ljava/lang/RuntimeException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Invalid end element: Context "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "End element: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v3
.end method

.method private ProcessNode(Lorg/xmlpull/v1/XmlPullParser;)[B
    .locals 8
    .param p1, "xpp"    # Lorg/xmlpull/v1/XmlPullParser;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xmlpull/v1/XmlPullParserException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 915
    sget-boolean v0, Lcom/keepassdroid/database/load/ImporterV4;->$assertionsDisabled:Z

    if-nez v0, :cond_0

    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getEventType()I

    move-result v0

    const/4 v3, 0x2

    if-eq v0, v3, :cond_0

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 917
    :cond_0
    const/4 v1, 0x0

    .line 919
    .local v1, "buf":[B
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeCount()I

    move-result v0

    if-lez v0, :cond_2

    .line 920
    const/4 v0, 0x0

    const-string v3, "Protected"

    invoke-interface {p1, v0, v3}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 921
    .local v7, "protect":Ljava/lang/String;
    if-eqz v7, :cond_2

    const-string v0, "True"

    invoke-virtual {v7, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 922
    invoke-direct {p0, p1}, Lcom/keepassdroid/database/load/ImporterV4;->ReadStringRaw(Lorg/xmlpull/v1/XmlPullParser;)Ljava/lang/String;

    move-result-object v6

    .line 924
    .local v6, "encrypted":Ljava/lang/String;
    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_1

    .line 925
    invoke-static {v6}, Lbiz/source_code/base64Coder/Base64Coder;->decode(Ljava/lang/String;)[B

    move-result-object v1

    .line 926
    array-length v0, v1

    new-array v4, v0, [B

    .line 928
    .local v4, "plainText":[B
    iget-object v0, p0, Lcom/keepassdroid/database/load/ImporterV4;->randomStream:Lorg/bouncycastle/crypto/StreamCipher;

    array-length v3, v1

    move v5, v2

    invoke-interface/range {v0 .. v5}, Lorg/bouncycastle/crypto/StreamCipher;->processBytes([BII[BI)V

    .line 937
    .end local v4    # "plainText":[B
    .end local v6    # "encrypted":Ljava/lang/String;
    .end local v7    # "protect":Ljava/lang/String;
    :goto_0
    return-object v4

    .line 932
    .restart local v6    # "encrypted":Ljava/lang/String;
    .restart local v7    # "protect":Ljava/lang/String;
    :cond_1
    new-array v1, v2, [B

    .end local v6    # "encrypted":Ljava/lang/String;
    .end local v7    # "protect":Ljava/lang/String;
    :cond_2
    move-object v4, v1

    .line 937
    goto :goto_0
.end method

.method private ReadBool(Lorg/xmlpull/v1/XmlPullParser;Z)Z
    .locals 2
    .param p1, "xpp"    # Lorg/xmlpull/v1/XmlPullParser;
    .param p2, "bDefault"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/xmlpull/v1/XmlPullParserException;
        }
    .end annotation

    .prologue
    .line 773
    invoke-direct {p0, p1}, Lcom/keepassdroid/database/load/ImporterV4;->ReadString(Lorg/xmlpull/v1/XmlPullParser;)Ljava/lang/String;

    move-result-object v0

    .line 775
    .local v0, "str":Ljava/lang/String;
    const-string v1, "true"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 776
    const/4 p2, 0x1

    .line 780
    .end local p2    # "bDefault":Z
    :cond_0
    :goto_0
    return p2

    .line 777
    .restart local p2    # "bDefault":Z
    :cond_1
    const-string v1, "false"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 778
    const/4 p2, 0x0

    goto :goto_0
.end method

.method private ReadDocumentStreamed(Lorg/xmlpull/v1/XmlPullParser;)V
    .locals 3
    .param p1, "xpp"    # Lorg/xmlpull/v1/XmlPullParser;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xmlpull/v1/XmlPullParserException;,
            Ljava/io/IOException;,
            Lcom/keepassdroid/database/exception/InvalidDBException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x1

    .line 230
    iget-object v1, p0, Lcom/keepassdroid/database/load/ImporterV4;->ctxGroups:Ljava/util/Stack;

    invoke-virtual {v1}, Ljava/util/Stack;->clear()V

    .line 232
    sget-object v0, Lcom/keepassdroid/database/load/ImporterV4$KdbContext;->Null:Lcom/keepassdroid/database/load/ImporterV4$KdbContext;

    .line 234
    .local v0, "ctx":Lcom/keepassdroid/database/load/ImporterV4$KdbContext;
    iput-boolean v2, p0, Lcom/keepassdroid/database/load/ImporterV4;->readNextNode:Z

    .line 237
    :cond_0
    :goto_0
    iget-boolean v1, p0, Lcom/keepassdroid/database/load/ImporterV4;->readNextNode:Z

    if-eqz v1, :cond_1

    .line 238
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v1

    if-ne v1, v2, :cond_2

    .line 261
    sget-object v1, Lcom/keepassdroid/database/load/ImporterV4$KdbContext;->Null:Lcom/keepassdroid/database/load/ImporterV4$KdbContext;

    if-eq v0, v1, :cond_3

    new-instance v1, Ljava/io/IOException;

    const-string v2, "Malformed"

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 240
    :cond_1
    iput-boolean v2, p0, Lcom/keepassdroid/database/load/ImporterV4;->readNextNode:Z

    .line 243
    :cond_2
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getEventType()I

    move-result v1

    packed-switch v1, :pswitch_data_0

    .line 253
    sget-boolean v1, Lcom/keepassdroid/database/load/ImporterV4;->$assertionsDisabled:Z

    if-nez v1, :cond_0

    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1}, Ljava/lang/AssertionError;-><init>()V

    throw v1

    .line 245
    :pswitch_0
    invoke-direct {p0, v0, p1}, Lcom/keepassdroid/database/load/ImporterV4;->ReadXmlElement(Lcom/keepassdroid/database/load/ImporterV4$KdbContext;Lorg/xmlpull/v1/XmlPullParser;)Lcom/keepassdroid/database/load/ImporterV4$KdbContext;

    move-result-object v0

    .line 246
    goto :goto_0

    .line 249
    :pswitch_1
    invoke-direct {p0, v0, p1}, Lcom/keepassdroid/database/load/ImporterV4;->EndXmlElement(Lcom/keepassdroid/database/load/ImporterV4$KdbContext;Lorg/xmlpull/v1/XmlPullParser;)Lcom/keepassdroid/database/load/ImporterV4$KdbContext;

    move-result-object v0

    .line 250
    goto :goto_0

    .line 262
    :cond_3
    iget-object v1, p0, Lcom/keepassdroid/database/load/ImporterV4;->ctxGroups:Ljava/util/Stack;

    invoke-virtual {v1}, Ljava/util/Stack;->size()I

    move-result v1

    if-eqz v1, :cond_4

    new-instance v1, Ljava/io/IOException;

    const-string v2, "Malformed"

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 263
    :cond_4
    return-void

    .line 243
    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method private ReadInt(Lorg/xmlpull/v1/XmlPullParser;I)I
    .locals 3
    .param p1, "xpp"    # Lorg/xmlpull/v1/XmlPullParser;
    .param p2, "def"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/xmlpull/v1/XmlPullParserException;
        }
    .end annotation

    .prologue
    .line 798
    invoke-direct {p0, p1}, Lcom/keepassdroid/database/load/ImporterV4;->ReadString(Lorg/xmlpull/v1/XmlPullParser;)Ljava/lang/String;

    move-result-object v1

    .line 802
    .local v1, "str":Ljava/lang/String;
    :try_start_0
    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v2

    .line 807
    .local v2, "u":I
    :goto_0
    return v2

    .line 803
    .end local v2    # "u":I
    :catch_0
    move-exception v0

    .line 804
    .local v0, "e":Ljava/lang/NumberFormatException;
    move v2, p2

    .restart local v2    # "u":I
    goto :goto_0
.end method

.method private ReadLong(Lorg/xmlpull/v1/XmlPullParser;J)J
    .locals 4
    .param p1, "xpp"    # Lorg/xmlpull/v1/XmlPullParser;
    .param p2, "def"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/xmlpull/v1/XmlPullParserException;
        }
    .end annotation

    .prologue
    .line 824
    invoke-direct {p0, p1}, Lcom/keepassdroid/database/load/ImporterV4;->ReadString(Lorg/xmlpull/v1/XmlPullParser;)Ljava/lang/String;

    move-result-object v1

    .line 828
    .local v1, "str":Ljava/lang/String;
    :try_start_0
    invoke-static {v1}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-wide v2

    .line 833
    .local v2, "u":J
    :goto_0
    return-wide v2

    .line 829
    .end local v2    # "u":J
    :catch_0
    move-exception v0

    .line 830
    .local v0, "e":Ljava/lang/NumberFormatException;
    move-wide v2, p2

    .restart local v2    # "u":J
    goto :goto_0
.end method

.method private ReadProtectedBinary(Lorg/xmlpull/v1/XmlPullParser;)Lcom/keepassdroid/database/security/ProtectedBinary;
    .locals 8
    .param p1, "xpp"    # Lorg/xmlpull/v1/XmlPullParser;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xmlpull/v1/XmlPullParserException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v7, 0x0

    .line 863
    const-string v6, "Ref"

    invoke-interface {p1, v7, v6}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 864
    .local v5, "ref":Ljava/lang/String;
    if-eqz v5, :cond_0

    .line 865
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    .line 867
    iget-object v6, p0, Lcom/keepassdroid/database/load/ImporterV4;->binPool:Lcom/keepassdroid/database/BinaryPool;

    invoke-virtual {v6, v5}, Lcom/keepassdroid/database/BinaryPool;->get(Ljava/lang/String;)Lcom/keepassdroid/database/security/ProtectedBinary;

    move-result-object v6

    .line 889
    :goto_0
    return-object v6

    .line 870
    :cond_0
    const/4 v3, 0x0

    .line 871
    .local v3, "compressed":Z
    const-string v6, "Compressed"

    invoke-interface {p1, v7, v6}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 872
    .local v2, "comp":Ljava/lang/String;
    if-eqz v2, :cond_1

    .line 873
    const-string v6, "True"

    invoke-virtual {v2, v6}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    .line 876
    :cond_1
    invoke-direct {p0, p1}, Lcom/keepassdroid/database/load/ImporterV4;->ProcessNode(Lorg/xmlpull/v1/XmlPullParser;)[B

    move-result-object v1

    .line 878
    .local v1, "buf":[B
    if-eqz v1, :cond_2

    new-instance v6, Lcom/keepassdroid/database/security/ProtectedBinary;

    const/4 v7, 0x1

    invoke-direct {v6, v7, v1}, Lcom/keepassdroid/database/security/ProtectedBinary;-><init>(Z[B)V

    goto :goto_0

    .line 880
    :cond_2
    invoke-direct {p0, p1}, Lcom/keepassdroid/database/load/ImporterV4;->ReadString(Lorg/xmlpull/v1/XmlPullParser;)Ljava/lang/String;

    move-result-object v0

    .line 881
    .local v0, "base64":Ljava/lang/String;
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v6

    if-nez v6, :cond_3

    sget-object v6, Lcom/keepassdroid/database/security/ProtectedBinary;->EMPTY:Lcom/keepassdroid/database/security/ProtectedBinary;

    goto :goto_0

    .line 883
    :cond_3
    invoke-static {v0}, Lbiz/source_code/base64Coder/Base64Coder;->decode(Ljava/lang/String;)[B

    move-result-object v4

    .line 885
    .local v4, "data":[B
    if-eqz v3, :cond_4

    .line 886
    invoke-static {v4}, Lcom/keepassdroid/utils/MemUtil;->decompress([B)[B

    move-result-object v4

    .line 889
    :cond_4
    new-instance v6, Lcom/keepassdroid/database/security/ProtectedBinary;

    const/4 v7, 0x0

    invoke-direct {v6, v7, v4}, Lcom/keepassdroid/database/security/ProtectedBinary;-><init>(Z[B)V

    goto :goto_0
.end method

.method private ReadProtectedString(Lorg/xmlpull/v1/XmlPullParser;)Lcom/keepassdroid/database/security/ProtectedString;
    .locals 6
    .param p1, "xpp"    # Lorg/xmlpull/v1/XmlPullParser;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xmlpull/v1/XmlPullParserException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 848
    invoke-direct {p0, p1}, Lcom/keepassdroid/database/load/ImporterV4;->ProcessNode(Lorg/xmlpull/v1/XmlPullParser;)[B

    move-result-object v0

    .line 850
    .local v0, "buf":[B
    if-eqz v0, :cond_0

    .line 852
    :try_start_0
    new-instance v2, Lcom/keepassdroid/database/security/ProtectedString;

    const/4 v3, 0x1

    new-instance v4, Ljava/lang/String;

    const-string v5, "UTF-8"

    invoke-direct {v4, v0, v5}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    invoke-direct {v2, v3, v4}, Lcom/keepassdroid/database/security/ProtectedString;-><init>(ZLjava/lang/String;)V
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    .line 859
    :goto_0
    return-object v2

    .line 853
    :catch_0
    move-exception v1

    .line 854
    .local v1, "e":Ljava/io/UnsupportedEncodingException;
    invoke-virtual {v1}, Ljava/io/UnsupportedEncodingException;->printStackTrace()V

    .line 855
    new-instance v2, Ljava/io/IOException;

    invoke-virtual {v1}, Ljava/io/UnsupportedEncodingException;->getLocalizedMessage()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 859
    .end local v1    # "e":Ljava/io/UnsupportedEncodingException;
    :cond_0
    new-instance v2, Lcom/keepassdroid/database/security/ProtectedString;

    const/4 v3, 0x0

    invoke-direct {p0, p1}, Lcom/keepassdroid/database/load/ImporterV4;->ReadString(Lorg/xmlpull/v1/XmlPullParser;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v2, v3, v4}, Lcom/keepassdroid/database/security/ProtectedString;-><init>(ZLjava/lang/String;)V

    goto :goto_0
.end method

.method private ReadString(Lorg/xmlpull/v1/XmlPullParser;)Ljava/lang/String;
    .locals 4
    .param p1, "xpp"    # Lorg/xmlpull/v1/XmlPullParser;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/xmlpull/v1/XmlPullParserException;
        }
    .end annotation

    .prologue
    .line 893
    invoke-direct {p0, p1}, Lcom/keepassdroid/database/load/ImporterV4;->ProcessNode(Lorg/xmlpull/v1/XmlPullParser;)[B

    move-result-object v0

    .line 895
    .local v0, "buf":[B
    if-eqz v0, :cond_0

    .line 897
    :try_start_0
    new-instance v2, Ljava/lang/String;

    const-string v3, "UTF-8"

    invoke-direct {v2, v0, v3}, Ljava/lang/String;-><init>([BLjava/lang/String;)V
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    .line 904
    :goto_0
    return-object v2

    .line 898
    :catch_0
    move-exception v1

    .line 899
    .local v1, "e":Ljava/io/UnsupportedEncodingException;
    new-instance v2, Ljava/io/IOException;

    invoke-virtual {v1}, Ljava/io/UnsupportedEncodingException;->getLocalizedMessage()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 904
    .end local v1    # "e":Ljava/io/UnsupportedEncodingException;
    :cond_0
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v2

    goto :goto_0
.end method

.method private ReadStringRaw(Lorg/xmlpull/v1/XmlPullParser;)Ljava/lang/String;
    .locals 1
    .param p1, "xpp"    # Lorg/xmlpull/v1/XmlPullParser;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xmlpull/v1/XmlPullParserException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 911
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private ReadTime(Lorg/xmlpull/v1/XmlPullParser;)Ljava/util/Date;
    .locals 4
    .param p1, "xpp"    # Lorg/xmlpull/v1/XmlPullParser;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/xmlpull/v1/XmlPullParserException;
        }
    .end annotation

    .prologue
    .line 736
    invoke-direct {p0, p1}, Lcom/keepassdroid/database/load/ImporterV4;->ReadString(Lorg/xmlpull/v1/XmlPullParser;)Ljava/lang/String;

    move-result-object v0

    .line 738
    .local v0, "sDate":Ljava/lang/String;
    const/4 v1, 0x0

    .line 740
    .local v1, "utcDate":Ljava/util/Date;
    :try_start_0
    sget-object v2, Lcom/keepassdroid/database/PwDatabaseV4XML;->dateFormat:Ljava/text/SimpleDateFormat;

    invoke-virtual {v2, v0}, Ljava/text/SimpleDateFormat;->parse(Ljava/lang/String;)Ljava/util/Date;
    :try_end_0
    .catch Ljava/text/ParseException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 745
    :goto_0
    if-nez v1, :cond_0

    .line 746
    new-instance v1, Ljava/util/Date;

    .end local v1    # "utcDate":Ljava/util/Date;
    const-wide/16 v2, 0x0

    invoke-direct {v1, v2, v3}, Ljava/util/Date;-><init>(J)V

    .line 749
    .restart local v1    # "utcDate":Ljava/util/Date;
    :cond_0
    return-object v1

    .line 741
    :catch_0
    move-exception v2

    goto :goto_0
.end method

.method private ReadUInt(Lorg/xmlpull/v1/XmlPullParser;J)J
    .locals 4
    .param p1, "xpp"    # Lorg/xmlpull/v1/XmlPullParser;
    .param p2, "uDefault"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/xmlpull/v1/XmlPullParserException;
        }
    .end annotation

    .prologue
    .line 814
    invoke-direct {p0, p1, p2, p3}, Lcom/keepassdroid/database/load/ImporterV4;->ReadULong(Lorg/xmlpull/v1/XmlPullParser;J)J

    move-result-wide v0

    .line 815
    .local v0, "u":J
    const-wide/16 v2, 0x0

    cmp-long v2, v0, v2

    if-ltz v2, :cond_0

    const-wide v2, 0x100000000L

    cmp-long v2, v0, v2

    if-lez v2, :cond_1

    .line 816
    :cond_0
    new-instance v2, Ljava/lang/NumberFormatException;

    const-string v3, "Outside of the uint size"

    invoke-direct {v2, v3}, Ljava/lang/NumberFormatException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 819
    :cond_1
    return-wide v0
.end method

.method private ReadULong(Lorg/xmlpull/v1/XmlPullParser;J)J
    .locals 4
    .param p1, "xpp"    # Lorg/xmlpull/v1/XmlPullParser;
    .param p2, "uDefault"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/xmlpull/v1/XmlPullParserException;
        }
    .end annotation

    .prologue
    .line 837
    invoke-direct {p0, p1, p2, p3}, Lcom/keepassdroid/database/load/ImporterV4;->ReadLong(Lorg/xmlpull/v1/XmlPullParser;J)J

    move-result-wide v0

    .line 839
    .local v0, "u":J
    const-wide/16 v2, 0x0

    cmp-long v2, v0, v2

    if-gez v2, :cond_0

    .line 840
    move-wide v0, p2

    .line 843
    :cond_0
    return-wide v0
.end method

.method private ReadUnknown(Lorg/xmlpull/v1/XmlPullParser;)V
    .locals 3
    .param p1, "xpp"    # Lorg/xmlpull/v1/XmlPullParser;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xmlpull/v1/XmlPullParserException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 754
    sget-boolean v1, Lcom/keepassdroid/database/load/ImporterV4;->$assertionsDisabled:Z

    if-nez v1, :cond_0

    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1}, Ljava/lang/AssertionError;-><init>()V

    throw v1

    .line 756
    :cond_0
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->isEmptyElementTag()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 770
    :cond_1
    return-void

    .line 758
    :cond_2
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v0

    .line 759
    .local v0, "unknownName":Ljava/lang/String;
    invoke-direct {p0, p1}, Lcom/keepassdroid/database/load/ImporterV4;->ProcessNode(Lorg/xmlpull/v1/XmlPullParser;)[B

    .line 761
    :cond_3
    :goto_0
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v1

    const/4 v2, 0x1

    if-eq v1, v2, :cond_4

    .line 762
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getEventType()I

    move-result v1

    const/4 v2, 0x3

    if-ne v1, v2, :cond_5

    .line 768
    :cond_4
    sget-boolean v1, Lcom/keepassdroid/database/load/ImporterV4;->$assertionsDisabled:Z

    if-nez v1, :cond_1

    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v1

    if-eq v1, v0, :cond_1

    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1}, Ljava/lang/AssertionError;-><init>()V

    throw v1

    .line 763
    :cond_5
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getEventType()I

    move-result v1

    const/4 v2, 0x2

    if-eq v1, v2, :cond_3

    .line 765
    invoke-direct {p0, p1}, Lcom/keepassdroid/database/load/ImporterV4;->ReadUnknown(Lorg/xmlpull/v1/XmlPullParser;)V

    goto :goto_0
.end method

.method private ReadUuid(Lorg/xmlpull/v1/XmlPullParser;)Ljava/util/UUID;
    .locals 3
    .param p1, "xpp"    # Lorg/xmlpull/v1/XmlPullParser;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/xmlpull/v1/XmlPullParserException;
        }
    .end annotation

    .prologue
    .line 785
    invoke-direct {p0, p1}, Lcom/keepassdroid/database/load/ImporterV4;->ReadString(Lorg/xmlpull/v1/XmlPullParser;)Ljava/lang/String;

    move-result-object v1

    .line 787
    .local v1, "encoded":Ljava/lang/String;
    if-eqz v1, :cond_0

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v2

    if-nez v2, :cond_1

    .line 788
    :cond_0
    sget-object v2, Lcom/keepassdroid/database/PwDatabaseV4;->UUID_ZERO:Ljava/util/UUID;

    .line 794
    :goto_0
    return-object v2

    .line 792
    :cond_1
    invoke-static {v1}, Lbiz/source_code/base64Coder/Base64Coder;->decode(Ljava/lang/String;)[B

    move-result-object v0

    .line 794
    .local v0, "buf":[B
    invoke-static {v0}, Lcom/keepassdroid/utils/Types;->bytestoUUID([B)Ljava/util/UUID;

    move-result-object v2

    goto :goto_0
.end method

.method private ReadXmlElement(Lcom/keepassdroid/database/load/ImporterV4$KdbContext;Lorg/xmlpull/v1/XmlPullParser;)Lcom/keepassdroid/database/load/ImporterV4$KdbContext;
    .locals 12
    .param p1, "ctx"    # Lcom/keepassdroid/database/load/ImporterV4$KdbContext;
    .param p2, "xpp"    # Lorg/xmlpull/v1/XmlPullParser;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xmlpull/v1/XmlPullParserException;,
            Ljava/io/IOException;,
            Lcom/keepassdroid/database/exception/InvalidDBException;
        }
    .end annotation

    .prologue
    .line 267
    invoke-interface {p2}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v3

    .line 268
    .local v3, "name":Ljava/lang/String;
    sget-object v7, Lcom/keepassdroid/database/load/ImporterV4$1;->$SwitchMap$com$keepassdroid$database$load$ImporterV4$KdbContext:[I

    invoke-virtual {p1}, Lcom/keepassdroid/database/load/ImporterV4$KdbContext;->ordinal()I

    move-result v8

    aget v7, v7, v8

    packed-switch v7, :pswitch_data_0

    .line 622
    invoke-direct {p0, p2}, Lcom/keepassdroid/database/load/ImporterV4;->ReadUnknown(Lorg/xmlpull/v1/XmlPullParser;)V

    .line 626
    .end local p1    # "ctx":Lcom/keepassdroid/database/load/ImporterV4$KdbContext;
    :cond_0
    :goto_0
    return-object p1

    .line 270
    .restart local p1    # "ctx":Lcom/keepassdroid/database/load/ImporterV4$KdbContext;
    :pswitch_0
    const-string v7, "KeePassFile"

    invoke-virtual {v3, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_1

    .line 271
    sget-object v7, Lcom/keepassdroid/database/load/ImporterV4$KdbContext;->KeePassFile:Lcom/keepassdroid/database/load/ImporterV4$KdbContext;

    invoke-direct {p0, p1, v7, p2}, Lcom/keepassdroid/database/load/ImporterV4;->SwitchContext(Lcom/keepassdroid/database/load/ImporterV4$KdbContext;Lcom/keepassdroid/database/load/ImporterV4$KdbContext;Lorg/xmlpull/v1/XmlPullParser;)Lcom/keepassdroid/database/load/ImporterV4$KdbContext;

    move-result-object p1

    goto :goto_0

    .line 272
    :cond_1
    invoke-direct {p0, p2}, Lcom/keepassdroid/database/load/ImporterV4;->ReadUnknown(Lorg/xmlpull/v1/XmlPullParser;)V

    goto :goto_0

    .line 276
    :pswitch_1
    const-string v7, "Meta"

    invoke-virtual {v3, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_2

    .line 277
    sget-object v7, Lcom/keepassdroid/database/load/ImporterV4$KdbContext;->Meta:Lcom/keepassdroid/database/load/ImporterV4$KdbContext;

    invoke-direct {p0, p1, v7, p2}, Lcom/keepassdroid/database/load/ImporterV4;->SwitchContext(Lcom/keepassdroid/database/load/ImporterV4$KdbContext;Lcom/keepassdroid/database/load/ImporterV4$KdbContext;Lorg/xmlpull/v1/XmlPullParser;)Lcom/keepassdroid/database/load/ImporterV4$KdbContext;

    move-result-object p1

    goto :goto_0

    .line 278
    :cond_2
    const-string v7, "Root"

    invoke-virtual {v3, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_3

    .line 279
    sget-object v7, Lcom/keepassdroid/database/load/ImporterV4$KdbContext;->Root:Lcom/keepassdroid/database/load/ImporterV4$KdbContext;

    invoke-direct {p0, p1, v7, p2}, Lcom/keepassdroid/database/load/ImporterV4;->SwitchContext(Lcom/keepassdroid/database/load/ImporterV4$KdbContext;Lcom/keepassdroid/database/load/ImporterV4$KdbContext;Lorg/xmlpull/v1/XmlPullParser;)Lcom/keepassdroid/database/load/ImporterV4$KdbContext;

    move-result-object p1

    goto :goto_0

    .line 281
    :cond_3
    invoke-direct {p0, p2}, Lcom/keepassdroid/database/load/ImporterV4;->ReadUnknown(Lorg/xmlpull/v1/XmlPullParser;)V

    goto :goto_0

    .line 286
    :pswitch_2
    const-string v7, "Generator"

    invoke-virtual {v3, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_4

    .line 287
    invoke-direct {p0, p2}, Lcom/keepassdroid/database/load/ImporterV4;->ReadString(Lorg/xmlpull/v1/XmlPullParser;)Ljava/lang/String;

    goto :goto_0

    .line 288
    :cond_4
    const-string v7, "HeaderHash"

    invoke-virtual {v3, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_5

    .line 289
    invoke-direct {p0, p2}, Lcom/keepassdroid/database/load/ImporterV4;->ReadString(Lorg/xmlpull/v1/XmlPullParser;)Ljava/lang/String;

    move-result-object v0

    .line 290
    .local v0, "encodedHash":Ljava/lang/String;
    invoke-static {v0}, Lcom/keepassdroid/utils/EmptyUtils;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v7

    if-nez v7, :cond_0

    iget-object v7, p0, Lcom/keepassdroid/database/load/ImporterV4;->hashOfHeader:[B

    if-eqz v7, :cond_0

    .line 291
    invoke-static {v0}, Lbiz/source_code/base64Coder/Base64Coder;->decode(Ljava/lang/String;)[B

    move-result-object v1

    .line 292
    .local v1, "hash":[B
    iget-object v7, p0, Lcom/keepassdroid/database/load/ImporterV4;->hashOfHeader:[B

    invoke-static {v1, v7}, Ljava/util/Arrays;->equals([B[B)Z

    move-result v7

    if-nez v7, :cond_0

    .line 293
    new-instance v7, Lcom/keepassdroid/database/exception/InvalidDBException;

    invoke-direct {v7}, Lcom/keepassdroid/database/exception/InvalidDBException;-><init>()V

    throw v7

    .line 296
    .end local v0    # "encodedHash":Ljava/lang/String;
    .end local v1    # "hash":[B
    :cond_5
    const-string v7, "DatabaseName"

    invoke-virtual {v3, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_6

    .line 297
    iget-object v7, p0, Lcom/keepassdroid/database/load/ImporterV4;->db:Lcom/keepassdroid/database/PwDatabaseV4;

    invoke-direct {p0, p2}, Lcom/keepassdroid/database/load/ImporterV4;->ReadString(Lorg/xmlpull/v1/XmlPullParser;)Ljava/lang/String;

    move-result-object v8

    iput-object v8, v7, Lcom/keepassdroid/database/PwDatabaseV4;->name:Ljava/lang/String;

    goto :goto_0

    .line 298
    :cond_6
    const-string v7, "DatabaseNameChanged"

    invoke-virtual {v3, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_7

    .line 299
    iget-object v7, p0, Lcom/keepassdroid/database/load/ImporterV4;->db:Lcom/keepassdroid/database/PwDatabaseV4;

    invoke-direct {p0, p2}, Lcom/keepassdroid/database/load/ImporterV4;->ReadTime(Lorg/xmlpull/v1/XmlPullParser;)Ljava/util/Date;

    move-result-object v8

    iput-object v8, v7, Lcom/keepassdroid/database/PwDatabaseV4;->nameChanged:Ljava/util/Date;

    goto/16 :goto_0

    .line 300
    :cond_7
    const-string v7, "DatabaseDescription"

    invoke-virtual {v3, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_8

    .line 301
    iget-object v7, p0, Lcom/keepassdroid/database/load/ImporterV4;->db:Lcom/keepassdroid/database/PwDatabaseV4;

    invoke-direct {p0, p2}, Lcom/keepassdroid/database/load/ImporterV4;->ReadString(Lorg/xmlpull/v1/XmlPullParser;)Ljava/lang/String;

    move-result-object v8

    iput-object v8, v7, Lcom/keepassdroid/database/PwDatabaseV4;->description:Ljava/lang/String;

    goto/16 :goto_0

    .line 302
    :cond_8
    const-string v7, "DatabaseDescriptionChanged"

    invoke-virtual {v3, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_9

    .line 303
    iget-object v7, p0, Lcom/keepassdroid/database/load/ImporterV4;->db:Lcom/keepassdroid/database/PwDatabaseV4;

    invoke-direct {p0, p2}, Lcom/keepassdroid/database/load/ImporterV4;->ReadTime(Lorg/xmlpull/v1/XmlPullParser;)Ljava/util/Date;

    move-result-object v8

    iput-object v8, v7, Lcom/keepassdroid/database/PwDatabaseV4;->descriptionChanged:Ljava/util/Date;

    goto/16 :goto_0

    .line 304
    :cond_9
    const-string v7, "DefaultUserName"

    invoke-virtual {v3, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_a

    .line 305
    iget-object v7, p0, Lcom/keepassdroid/database/load/ImporterV4;->db:Lcom/keepassdroid/database/PwDatabaseV4;

    invoke-direct {p0, p2}, Lcom/keepassdroid/database/load/ImporterV4;->ReadString(Lorg/xmlpull/v1/XmlPullParser;)Ljava/lang/String;

    move-result-object v8

    iput-object v8, v7, Lcom/keepassdroid/database/PwDatabaseV4;->defaultUserName:Ljava/lang/String;

    goto/16 :goto_0

    .line 306
    :cond_a
    const-string v7, "DefaultUserNameChanged"

    invoke-virtual {v3, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_b

    .line 307
    iget-object v7, p0, Lcom/keepassdroid/database/load/ImporterV4;->db:Lcom/keepassdroid/database/PwDatabaseV4;

    invoke-direct {p0, p2}, Lcom/keepassdroid/database/load/ImporterV4;->ReadTime(Lorg/xmlpull/v1/XmlPullParser;)Ljava/util/Date;

    move-result-object v8

    iput-object v8, v7, Lcom/keepassdroid/database/PwDatabaseV4;->defaultUserNameChanged:Ljava/util/Date;

    goto/16 :goto_0

    .line 308
    :cond_b
    const-string v7, "Color"

    invoke-virtual {v3, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_c

    .line 310
    iget-object v7, p0, Lcom/keepassdroid/database/load/ImporterV4;->db:Lcom/keepassdroid/database/PwDatabaseV4;

    invoke-direct {p0, p2}, Lcom/keepassdroid/database/load/ImporterV4;->ReadString(Lorg/xmlpull/v1/XmlPullParser;)Ljava/lang/String;

    move-result-object v8

    iput-object v8, v7, Lcom/keepassdroid/database/PwDatabaseV4;->color:Ljava/lang/String;

    goto/16 :goto_0

    .line 311
    :cond_c
    const-string v7, "MaintenanceHistoryDays"

    invoke-virtual {v3, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_d

    .line 312
    iget-object v7, p0, Lcom/keepassdroid/database/load/ImporterV4;->db:Lcom/keepassdroid/database/PwDatabaseV4;

    const-wide/16 v8, 0x16d

    invoke-direct {p0, p2, v8, v9}, Lcom/keepassdroid/database/load/ImporterV4;->ReadUInt(Lorg/xmlpull/v1/XmlPullParser;J)J

    move-result-wide v8

    iput-wide v8, v7, Lcom/keepassdroid/database/PwDatabaseV4;->maintenanceHistoryDays:J

    goto/16 :goto_0

    .line 313
    :cond_d
    const-string v7, "MasterKeyChanged"

    invoke-virtual {v3, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_e

    .line 314
    iget-object v7, p0, Lcom/keepassdroid/database/load/ImporterV4;->db:Lcom/keepassdroid/database/PwDatabaseV4;

    invoke-direct {p0, p2}, Lcom/keepassdroid/database/load/ImporterV4;->ReadTime(Lorg/xmlpull/v1/XmlPullParser;)Ljava/util/Date;

    move-result-object v8

    iput-object v8, v7, Lcom/keepassdroid/database/PwDatabaseV4;->keyLastChanged:Ljava/util/Date;

    goto/16 :goto_0

    .line 315
    :cond_e
    const-string v7, "MasterKeyChangeRec"

    invoke-virtual {v3, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_f

    .line 316
    iget-object v7, p0, Lcom/keepassdroid/database/load/ImporterV4;->db:Lcom/keepassdroid/database/PwDatabaseV4;

    const-wide/16 v8, -0x1

    invoke-direct {p0, p2, v8, v9}, Lcom/keepassdroid/database/load/ImporterV4;->ReadLong(Lorg/xmlpull/v1/XmlPullParser;J)J

    move-result-wide v8

    iput-wide v8, v7, Lcom/keepassdroid/database/PwDatabaseV4;->keyChangeRecDays:J

    goto/16 :goto_0

    .line 317
    :cond_f
    const-string v7, "MasterKeyChangeForce"

    invoke-virtual {v3, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_10

    .line 318
    iget-object v7, p0, Lcom/keepassdroid/database/load/ImporterV4;->db:Lcom/keepassdroid/database/PwDatabaseV4;

    const-wide/16 v8, -0x1

    invoke-direct {p0, p2, v8, v9}, Lcom/keepassdroid/database/load/ImporterV4;->ReadLong(Lorg/xmlpull/v1/XmlPullParser;J)J

    move-result-wide v8

    iput-wide v8, v7, Lcom/keepassdroid/database/PwDatabaseV4;->keyChangeForceDays:J

    goto/16 :goto_0

    .line 319
    :cond_10
    const-string v7, "MemoryProtection"

    invoke-virtual {v3, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_11

    .line 320
    sget-object v7, Lcom/keepassdroid/database/load/ImporterV4$KdbContext;->MemoryProtection:Lcom/keepassdroid/database/load/ImporterV4$KdbContext;

    invoke-direct {p0, p1, v7, p2}, Lcom/keepassdroid/database/load/ImporterV4;->SwitchContext(Lcom/keepassdroid/database/load/ImporterV4$KdbContext;Lcom/keepassdroid/database/load/ImporterV4$KdbContext;Lorg/xmlpull/v1/XmlPullParser;)Lcom/keepassdroid/database/load/ImporterV4$KdbContext;

    move-result-object p1

    goto/16 :goto_0

    .line 321
    :cond_11
    const-string v7, "CustomIcons"

    invoke-virtual {v3, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_12

    .line 322
    sget-object v7, Lcom/keepassdroid/database/load/ImporterV4$KdbContext;->CustomIcons:Lcom/keepassdroid/database/load/ImporterV4$KdbContext;

    invoke-direct {p0, p1, v7, p2}, Lcom/keepassdroid/database/load/ImporterV4;->SwitchContext(Lcom/keepassdroid/database/load/ImporterV4$KdbContext;Lcom/keepassdroid/database/load/ImporterV4$KdbContext;Lorg/xmlpull/v1/XmlPullParser;)Lcom/keepassdroid/database/load/ImporterV4$KdbContext;

    move-result-object p1

    goto/16 :goto_0

    .line 323
    :cond_12
    const-string v7, "RecycleBinEnabled"

    invoke-virtual {v3, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_13

    .line 324
    iget-object v7, p0, Lcom/keepassdroid/database/load/ImporterV4;->db:Lcom/keepassdroid/database/PwDatabaseV4;

    const/4 v8, 0x1

    invoke-direct {p0, p2, v8}, Lcom/keepassdroid/database/load/ImporterV4;->ReadBool(Lorg/xmlpull/v1/XmlPullParser;Z)Z

    move-result v8

    iput-boolean v8, v7, Lcom/keepassdroid/database/PwDatabaseV4;->recycleBinEnabled:Z

    goto/16 :goto_0

    .line 325
    :cond_13
    const-string v7, "RecycleBinUUID"

    invoke-virtual {v3, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_14

    .line 326
    iget-object v7, p0, Lcom/keepassdroid/database/load/ImporterV4;->db:Lcom/keepassdroid/database/PwDatabaseV4;

    invoke-direct {p0, p2}, Lcom/keepassdroid/database/load/ImporterV4;->ReadUuid(Lorg/xmlpull/v1/XmlPullParser;)Ljava/util/UUID;

    move-result-object v8

    iput-object v8, v7, Lcom/keepassdroid/database/PwDatabaseV4;->recycleBinUUID:Ljava/util/UUID;

    goto/16 :goto_0

    .line 327
    :cond_14
    const-string v7, "RecycleBinChanged"

    invoke-virtual {v3, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_15

    .line 328
    iget-object v7, p0, Lcom/keepassdroid/database/load/ImporterV4;->db:Lcom/keepassdroid/database/PwDatabaseV4;

    invoke-direct {p0, p2}, Lcom/keepassdroid/database/load/ImporterV4;->ReadTime(Lorg/xmlpull/v1/XmlPullParser;)Ljava/util/Date;

    move-result-object v8

    iput-object v8, v7, Lcom/keepassdroid/database/PwDatabaseV4;->recycleBinChanged:Ljava/util/Date;

    goto/16 :goto_0

    .line 329
    :cond_15
    const-string v7, "EntryTemplatesGroup"

    invoke-virtual {v3, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_16

    .line 330
    iget-object v7, p0, Lcom/keepassdroid/database/load/ImporterV4;->db:Lcom/keepassdroid/database/PwDatabaseV4;

    invoke-direct {p0, p2}, Lcom/keepassdroid/database/load/ImporterV4;->ReadUuid(Lorg/xmlpull/v1/XmlPullParser;)Ljava/util/UUID;

    move-result-object v8

    iput-object v8, v7, Lcom/keepassdroid/database/PwDatabaseV4;->entryTemplatesGroup:Ljava/util/UUID;

    goto/16 :goto_0

    .line 331
    :cond_16
    const-string v7, "EntryTemplatesGroupChanged"

    invoke-virtual {v3, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_17

    .line 332
    iget-object v7, p0, Lcom/keepassdroid/database/load/ImporterV4;->db:Lcom/keepassdroid/database/PwDatabaseV4;

    invoke-direct {p0, p2}, Lcom/keepassdroid/database/load/ImporterV4;->ReadTime(Lorg/xmlpull/v1/XmlPullParser;)Ljava/util/Date;

    move-result-object v8

    iput-object v8, v7, Lcom/keepassdroid/database/PwDatabaseV4;->entryTemplatesGroupChanged:Ljava/util/Date;

    goto/16 :goto_0

    .line 333
    :cond_17
    const-string v7, "HistoryMaxItems"

    invoke-virtual {v3, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_18

    .line 334
    iget-object v7, p0, Lcom/keepassdroid/database/load/ImporterV4;->db:Lcom/keepassdroid/database/PwDatabaseV4;

    const/4 v8, -0x1

    invoke-direct {p0, p2, v8}, Lcom/keepassdroid/database/load/ImporterV4;->ReadInt(Lorg/xmlpull/v1/XmlPullParser;I)I

    move-result v8

    iput v8, v7, Lcom/keepassdroid/database/PwDatabaseV4;->historyMaxItems:I

    goto/16 :goto_0

    .line 335
    :cond_18
    const-string v7, "HistoryMaxSize"

    invoke-virtual {v3, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_19

    .line 336
    iget-object v7, p0, Lcom/keepassdroid/database/load/ImporterV4;->db:Lcom/keepassdroid/database/PwDatabaseV4;

    const-wide/16 v8, -0x1

    invoke-direct {p0, p2, v8, v9}, Lcom/keepassdroid/database/load/ImporterV4;->ReadLong(Lorg/xmlpull/v1/XmlPullParser;J)J

    move-result-wide v8

    iput-wide v8, v7, Lcom/keepassdroid/database/PwDatabaseV4;->historyMaxSize:J

    goto/16 :goto_0

    .line 337
    :cond_19
    const-string v7, "EntryTemplatesGroupChanged"

    invoke-virtual {v3, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_1a

    .line 338
    iget-object v7, p0, Lcom/keepassdroid/database/load/ImporterV4;->db:Lcom/keepassdroid/database/PwDatabaseV4;

    invoke-direct {p0, p2}, Lcom/keepassdroid/database/load/ImporterV4;->ReadTime(Lorg/xmlpull/v1/XmlPullParser;)Ljava/util/Date;

    move-result-object v8

    iput-object v8, v7, Lcom/keepassdroid/database/PwDatabaseV4;->entryTemplatesGroupChanged:Ljava/util/Date;

    goto/16 :goto_0

    .line 339
    :cond_1a
    const-string v7, "LastSelectedGroup"

    invoke-virtual {v3, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_1b

    .line 340
    iget-object v7, p0, Lcom/keepassdroid/database/load/ImporterV4;->db:Lcom/keepassdroid/database/PwDatabaseV4;

    invoke-direct {p0, p2}, Lcom/keepassdroid/database/load/ImporterV4;->ReadUuid(Lorg/xmlpull/v1/XmlPullParser;)Ljava/util/UUID;

    move-result-object v8

    iput-object v8, v7, Lcom/keepassdroid/database/PwDatabaseV4;->lastSelectedGroup:Ljava/util/UUID;

    goto/16 :goto_0

    .line 341
    :cond_1b
    const-string v7, "LastTopVisibleGroup"

    invoke-virtual {v3, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_1c

    .line 342
    iget-object v7, p0, Lcom/keepassdroid/database/load/ImporterV4;->db:Lcom/keepassdroid/database/PwDatabaseV4;

    invoke-direct {p0, p2}, Lcom/keepassdroid/database/load/ImporterV4;->ReadUuid(Lorg/xmlpull/v1/XmlPullParser;)Ljava/util/UUID;

    move-result-object v8

    iput-object v8, v7, Lcom/keepassdroid/database/PwDatabaseV4;->lastTopVisibleGroup:Ljava/util/UUID;

    goto/16 :goto_0

    .line 343
    :cond_1c
    const-string v7, "Binaries"

    invoke-virtual {v3, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_1d

    .line 344
    sget-object v7, Lcom/keepassdroid/database/load/ImporterV4$KdbContext;->Binaries:Lcom/keepassdroid/database/load/ImporterV4$KdbContext;

    invoke-direct {p0, p1, v7, p2}, Lcom/keepassdroid/database/load/ImporterV4;->SwitchContext(Lcom/keepassdroid/database/load/ImporterV4$KdbContext;Lcom/keepassdroid/database/load/ImporterV4$KdbContext;Lorg/xmlpull/v1/XmlPullParser;)Lcom/keepassdroid/database/load/ImporterV4$KdbContext;

    move-result-object p1

    goto/16 :goto_0

    .line 345
    :cond_1d
    const-string v7, "CustomData"

    invoke-virtual {v3, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_0

    .line 346
    sget-object v7, Lcom/keepassdroid/database/load/ImporterV4$KdbContext;->CustomData:Lcom/keepassdroid/database/load/ImporterV4$KdbContext;

    invoke-direct {p0, p1, v7, p2}, Lcom/keepassdroid/database/load/ImporterV4;->SwitchContext(Lcom/keepassdroid/database/load/ImporterV4$KdbContext;Lcom/keepassdroid/database/load/ImporterV4$KdbContext;Lorg/xmlpull/v1/XmlPullParser;)Lcom/keepassdroid/database/load/ImporterV4$KdbContext;

    move-result-object p1

    goto/16 :goto_0

    .line 351
    :pswitch_3
    const-string v7, "ProtectTitle"

    invoke-virtual {v3, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_1e

    .line 352
    iget-object v7, p0, Lcom/keepassdroid/database/load/ImporterV4;->db:Lcom/keepassdroid/database/PwDatabaseV4;

    iget-object v7, v7, Lcom/keepassdroid/database/PwDatabaseV4;->memoryProtection:Lcom/keepassdroid/database/PwDatabaseV4$MemoryProtectionConfig;

    const/4 v8, 0x0

    invoke-direct {p0, p2, v8}, Lcom/keepassdroid/database/load/ImporterV4;->ReadBool(Lorg/xmlpull/v1/XmlPullParser;Z)Z

    move-result v8

    iput-boolean v8, v7, Lcom/keepassdroid/database/PwDatabaseV4$MemoryProtectionConfig;->protectTitle:Z

    goto/16 :goto_0

    .line 353
    :cond_1e
    const-string v7, "ProtectUserName"

    invoke-virtual {v3, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_1f

    .line 354
    iget-object v7, p0, Lcom/keepassdroid/database/load/ImporterV4;->db:Lcom/keepassdroid/database/PwDatabaseV4;

    iget-object v7, v7, Lcom/keepassdroid/database/PwDatabaseV4;->memoryProtection:Lcom/keepassdroid/database/PwDatabaseV4$MemoryProtectionConfig;

    const/4 v8, 0x0

    invoke-direct {p0, p2, v8}, Lcom/keepassdroid/database/load/ImporterV4;->ReadBool(Lorg/xmlpull/v1/XmlPullParser;Z)Z

    move-result v8

    iput-boolean v8, v7, Lcom/keepassdroid/database/PwDatabaseV4$MemoryProtectionConfig;->protectUserName:Z

    goto/16 :goto_0

    .line 355
    :cond_1f
    const-string v7, "ProtectPassword"

    invoke-virtual {v3, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_20

    .line 356
    iget-object v7, p0, Lcom/keepassdroid/database/load/ImporterV4;->db:Lcom/keepassdroid/database/PwDatabaseV4;

    iget-object v7, v7, Lcom/keepassdroid/database/PwDatabaseV4;->memoryProtection:Lcom/keepassdroid/database/PwDatabaseV4$MemoryProtectionConfig;

    const/4 v8, 0x0

    invoke-direct {p0, p2, v8}, Lcom/keepassdroid/database/load/ImporterV4;->ReadBool(Lorg/xmlpull/v1/XmlPullParser;Z)Z

    move-result v8

    iput-boolean v8, v7, Lcom/keepassdroid/database/PwDatabaseV4$MemoryProtectionConfig;->protectPassword:Z

    goto/16 :goto_0

    .line 357
    :cond_20
    const-string v7, "ProtectURL"

    invoke-virtual {v3, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_21

    .line 358
    iget-object v7, p0, Lcom/keepassdroid/database/load/ImporterV4;->db:Lcom/keepassdroid/database/PwDatabaseV4;

    iget-object v7, v7, Lcom/keepassdroid/database/PwDatabaseV4;->memoryProtection:Lcom/keepassdroid/database/PwDatabaseV4$MemoryProtectionConfig;

    const/4 v8, 0x0

    invoke-direct {p0, p2, v8}, Lcom/keepassdroid/database/load/ImporterV4;->ReadBool(Lorg/xmlpull/v1/XmlPullParser;Z)Z

    move-result v8

    iput-boolean v8, v7, Lcom/keepassdroid/database/PwDatabaseV4$MemoryProtectionConfig;->protectUrl:Z

    goto/16 :goto_0

    .line 359
    :cond_21
    const-string v7, "ProtectNotes"

    invoke-virtual {v3, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_22

    .line 360
    iget-object v7, p0, Lcom/keepassdroid/database/load/ImporterV4;->db:Lcom/keepassdroid/database/PwDatabaseV4;

    iget-object v7, v7, Lcom/keepassdroid/database/PwDatabaseV4;->memoryProtection:Lcom/keepassdroid/database/PwDatabaseV4$MemoryProtectionConfig;

    const/4 v8, 0x0

    invoke-direct {p0, p2, v8}, Lcom/keepassdroid/database/load/ImporterV4;->ReadBool(Lorg/xmlpull/v1/XmlPullParser;Z)Z

    move-result v8

    iput-boolean v8, v7, Lcom/keepassdroid/database/PwDatabaseV4$MemoryProtectionConfig;->protectNotes:Z

    goto/16 :goto_0

    .line 361
    :cond_22
    const-string v7, "AutoEnableVisualHiding"

    invoke-virtual {v3, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_23

    .line 362
    iget-object v7, p0, Lcom/keepassdroid/database/load/ImporterV4;->db:Lcom/keepassdroid/database/PwDatabaseV4;

    iget-object v7, v7, Lcom/keepassdroid/database/PwDatabaseV4;->memoryProtection:Lcom/keepassdroid/database/PwDatabaseV4$MemoryProtectionConfig;

    const/4 v8, 0x0

    invoke-direct {p0, p2, v8}, Lcom/keepassdroid/database/load/ImporterV4;->ReadBool(Lorg/xmlpull/v1/XmlPullParser;Z)Z

    move-result v8

    iput-boolean v8, v7, Lcom/keepassdroid/database/PwDatabaseV4$MemoryProtectionConfig;->autoEnableVisualHiding:Z

    goto/16 :goto_0

    .line 364
    :cond_23
    invoke-direct {p0, p2}, Lcom/keepassdroid/database/load/ImporterV4;->ReadUnknown(Lorg/xmlpull/v1/XmlPullParser;)V

    goto/16 :goto_0

    .line 369
    :pswitch_4
    const-string v7, "Icon"

    invoke-virtual {v3, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_24

    .line 370
    sget-object v7, Lcom/keepassdroid/database/load/ImporterV4$KdbContext;->CustomIcon:Lcom/keepassdroid/database/load/ImporterV4$KdbContext;

    invoke-direct {p0, p1, v7, p2}, Lcom/keepassdroid/database/load/ImporterV4;->SwitchContext(Lcom/keepassdroid/database/load/ImporterV4$KdbContext;Lcom/keepassdroid/database/load/ImporterV4$KdbContext;Lorg/xmlpull/v1/XmlPullParser;)Lcom/keepassdroid/database/load/ImporterV4$KdbContext;

    move-result-object p1

    goto/16 :goto_0

    .line 372
    :cond_24
    invoke-direct {p0, p2}, Lcom/keepassdroid/database/load/ImporterV4;->ReadUnknown(Lorg/xmlpull/v1/XmlPullParser;)V

    goto/16 :goto_0

    .line 377
    :pswitch_5
    const-string v7, "UUID"

    invoke-virtual {v3, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_25

    .line 378
    invoke-direct {p0, p2}, Lcom/keepassdroid/database/load/ImporterV4;->ReadUuid(Lorg/xmlpull/v1/XmlPullParser;)Ljava/util/UUID;

    move-result-object v7

    iput-object v7, p0, Lcom/keepassdroid/database/load/ImporterV4;->customIconID:Ljava/util/UUID;

    goto/16 :goto_0

    .line 379
    :cond_25
    const-string v7, "Data"

    invoke-virtual {v3, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_27

    .line 380
    invoke-direct {p0, p2}, Lcom/keepassdroid/database/load/ImporterV4;->ReadString(Lorg/xmlpull/v1/XmlPullParser;)Ljava/lang/String;

    move-result-object v5

    .line 381
    .local v5, "strData":Ljava/lang/String;
    if-eqz v5, :cond_26

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v7

    if-lez v7, :cond_26

    .line 382
    invoke-static {v5}, Lbiz/source_code/base64Coder/Base64Coder;->decode(Ljava/lang/String;)[B

    move-result-object v7

    iput-object v7, p0, Lcom/keepassdroid/database/load/ImporterV4;->customIconData:[B

    goto/16 :goto_0

    .line 384
    :cond_26
    sget-boolean v7, Lcom/keepassdroid/database/load/ImporterV4;->$assertionsDisabled:Z

    if-nez v7, :cond_0

    new-instance v7, Ljava/lang/AssertionError;

    invoke-direct {v7}, Ljava/lang/AssertionError;-><init>()V

    throw v7

    .line 387
    .end local v5    # "strData":Ljava/lang/String;
    :cond_27
    invoke-direct {p0, p2}, Lcom/keepassdroid/database/load/ImporterV4;->ReadUnknown(Lorg/xmlpull/v1/XmlPullParser;)V

    goto/16 :goto_0

    .line 392
    :pswitch_6
    const-string v7, "Binary"

    invoke-virtual {v3, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_29

    .line 393
    const/4 v7, 0x0

    const-string v8, "ID"

    invoke-interface {p2, v7, v8}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 394
    .local v2, "key":Ljava/lang/String;
    if-eqz v2, :cond_28

    .line 395
    invoke-direct {p0, p2}, Lcom/keepassdroid/database/load/ImporterV4;->ReadProtectedBinary(Lorg/xmlpull/v1/XmlPullParser;)Lcom/keepassdroid/database/security/ProtectedBinary;

    move-result-object v4

    .line 396
    .local v4, "pbData":Lcom/keepassdroid/database/security/ProtectedBinary;
    iget-object v7, p0, Lcom/keepassdroid/database/load/ImporterV4;->binPool:Lcom/keepassdroid/database/BinaryPool;

    invoke-virtual {v7, v2, v4}, Lcom/keepassdroid/database/BinaryPool;->put(Ljava/lang/String;Lcom/keepassdroid/database/security/ProtectedBinary;)Lcom/keepassdroid/database/security/ProtectedBinary;

    goto/16 :goto_0

    .line 398
    .end local v4    # "pbData":Lcom/keepassdroid/database/security/ProtectedBinary;
    :cond_28
    invoke-direct {p0, p2}, Lcom/keepassdroid/database/load/ImporterV4;->ReadUnknown(Lorg/xmlpull/v1/XmlPullParser;)V

    goto/16 :goto_0

    .line 401
    .end local v2    # "key":Ljava/lang/String;
    :cond_29
    invoke-direct {p0, p2}, Lcom/keepassdroid/database/load/ImporterV4;->ReadUnknown(Lorg/xmlpull/v1/XmlPullParser;)V

    goto/16 :goto_0

    .line 407
    :pswitch_7
    const-string v7, "Item"

    invoke-virtual {v3, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_2a

    .line 408
    sget-object v7, Lcom/keepassdroid/database/load/ImporterV4$KdbContext;->CustomDataItem:Lcom/keepassdroid/database/load/ImporterV4$KdbContext;

    invoke-direct {p0, p1, v7, p2}, Lcom/keepassdroid/database/load/ImporterV4;->SwitchContext(Lcom/keepassdroid/database/load/ImporterV4$KdbContext;Lcom/keepassdroid/database/load/ImporterV4$KdbContext;Lorg/xmlpull/v1/XmlPullParser;)Lcom/keepassdroid/database/load/ImporterV4$KdbContext;

    move-result-object p1

    goto/16 :goto_0

    .line 410
    :cond_2a
    invoke-direct {p0, p2}, Lcom/keepassdroid/database/load/ImporterV4;->ReadUnknown(Lorg/xmlpull/v1/XmlPullParser;)V

    goto/16 :goto_0

    .line 415
    :pswitch_8
    const-string v7, "Key"

    invoke-virtual {v3, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_2b

    .line 416
    invoke-direct {p0, p2}, Lcom/keepassdroid/database/load/ImporterV4;->ReadString(Lorg/xmlpull/v1/XmlPullParser;)Ljava/lang/String;

    move-result-object v7

    iput-object v7, p0, Lcom/keepassdroid/database/load/ImporterV4;->customDataKey:Ljava/lang/String;

    goto/16 :goto_0

    .line 417
    :cond_2b
    const-string v7, "Value"

    invoke-virtual {v3, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_2c

    .line 418
    invoke-direct {p0, p2}, Lcom/keepassdroid/database/load/ImporterV4;->ReadString(Lorg/xmlpull/v1/XmlPullParser;)Ljava/lang/String;

    move-result-object v7

    iput-object v7, p0, Lcom/keepassdroid/database/load/ImporterV4;->customDataValue:Ljava/lang/String;

    goto/16 :goto_0

    .line 420
    :cond_2c
    invoke-direct {p0, p2}, Lcom/keepassdroid/database/load/ImporterV4;->ReadUnknown(Lorg/xmlpull/v1/XmlPullParser;)V

    goto/16 :goto_0

    .line 425
    :pswitch_9
    const-string v7, "Group"

    invoke-virtual {v3, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_2f

    .line 426
    sget-boolean v7, Lcom/keepassdroid/database/load/ImporterV4;->$assertionsDisabled:Z

    if-nez v7, :cond_2d

    iget-object v7, p0, Lcom/keepassdroid/database/load/ImporterV4;->ctxGroups:Ljava/util/Stack;

    invoke-virtual {v7}, Ljava/util/Stack;->size()I

    move-result v7

    if-eqz v7, :cond_2d

    new-instance v7, Ljava/lang/AssertionError;

    invoke-direct {v7}, Ljava/lang/AssertionError;-><init>()V

    throw v7

    .line 427
    :cond_2d
    iget-object v7, p0, Lcom/keepassdroid/database/load/ImporterV4;->ctxGroups:Ljava/util/Stack;

    invoke-virtual {v7}, Ljava/util/Stack;->size()I

    move-result v7

    if-eqz v7, :cond_2e

    new-instance v7, Ljava/io/IOException;

    const-string v8, "Group list should be empty."

    invoke-direct {v7, v8}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 429
    :cond_2e
    iget-object v7, p0, Lcom/keepassdroid/database/load/ImporterV4;->db:Lcom/keepassdroid/database/PwDatabaseV4;

    new-instance v8, Lcom/keepassdroid/database/PwGroupV4;

    invoke-direct {v8}, Lcom/keepassdroid/database/PwGroupV4;-><init>()V

    iput-object v8, v7, Lcom/keepassdroid/database/PwDatabaseV4;->rootGroup:Lcom/keepassdroid/database/PwGroup;

    .line 430
    iget-object v8, p0, Lcom/keepassdroid/database/load/ImporterV4;->ctxGroups:Ljava/util/Stack;

    iget-object v7, p0, Lcom/keepassdroid/database/load/ImporterV4;->db:Lcom/keepassdroid/database/PwDatabaseV4;

    iget-object v7, v7, Lcom/keepassdroid/database/PwDatabaseV4;->rootGroup:Lcom/keepassdroid/database/PwGroup;

    check-cast v7, Lcom/keepassdroid/database/PwGroupV4;

    invoke-virtual {v8, v7}, Ljava/util/Stack;->push(Ljava/lang/Object;)Ljava/lang/Object;

    .line 431
    iget-object v7, p0, Lcom/keepassdroid/database/load/ImporterV4;->ctxGroups:Ljava/util/Stack;

    invoke-virtual {v7}, Ljava/util/Stack;->peek()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/keepassdroid/database/PwGroupV4;

    iput-object v7, p0, Lcom/keepassdroid/database/load/ImporterV4;->ctxGroup:Lcom/keepassdroid/database/PwGroupV4;

    .line 433
    sget-object v7, Lcom/keepassdroid/database/load/ImporterV4$KdbContext;->Group:Lcom/keepassdroid/database/load/ImporterV4$KdbContext;

    invoke-direct {p0, p1, v7, p2}, Lcom/keepassdroid/database/load/ImporterV4;->SwitchContext(Lcom/keepassdroid/database/load/ImporterV4$KdbContext;Lcom/keepassdroid/database/load/ImporterV4$KdbContext;Lorg/xmlpull/v1/XmlPullParser;)Lcom/keepassdroid/database/load/ImporterV4$KdbContext;

    move-result-object p1

    goto/16 :goto_0

    .line 434
    :cond_2f
    const-string v7, "DeletedObjects"

    invoke-virtual {v3, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_30

    .line 435
    sget-object v7, Lcom/keepassdroid/database/load/ImporterV4$KdbContext;->RootDeletedObjects:Lcom/keepassdroid/database/load/ImporterV4$KdbContext;

    invoke-direct {p0, p1, v7, p2}, Lcom/keepassdroid/database/load/ImporterV4;->SwitchContext(Lcom/keepassdroid/database/load/ImporterV4$KdbContext;Lcom/keepassdroid/database/load/ImporterV4$KdbContext;Lorg/xmlpull/v1/XmlPullParser;)Lcom/keepassdroid/database/load/ImporterV4$KdbContext;

    move-result-object p1

    goto/16 :goto_0

    .line 437
    :cond_30
    invoke-direct {p0, p2}, Lcom/keepassdroid/database/load/ImporterV4;->ReadUnknown(Lorg/xmlpull/v1/XmlPullParser;)V

    goto/16 :goto_0

    .line 442
    :pswitch_a
    const-string v7, "UUID"

    invoke-virtual {v3, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_31

    .line 443
    iget-object v7, p0, Lcom/keepassdroid/database/load/ImporterV4;->ctxGroup:Lcom/keepassdroid/database/PwGroupV4;

    invoke-direct {p0, p2}, Lcom/keepassdroid/database/load/ImporterV4;->ReadUuid(Lorg/xmlpull/v1/XmlPullParser;)Ljava/util/UUID;

    move-result-object v8

    iput-object v8, v7, Lcom/keepassdroid/database/PwGroupV4;->uuid:Ljava/util/UUID;

    goto/16 :goto_0

    .line 444
    :cond_31
    const-string v7, "Name"

    invoke-virtual {v3, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_32

    .line 445
    iget-object v7, p0, Lcom/keepassdroid/database/load/ImporterV4;->ctxGroup:Lcom/keepassdroid/database/PwGroupV4;

    invoke-direct {p0, p2}, Lcom/keepassdroid/database/load/ImporterV4;->ReadString(Lorg/xmlpull/v1/XmlPullParser;)Ljava/lang/String;

    move-result-object v8

    iput-object v8, v7, Lcom/keepassdroid/database/PwGroupV4;->name:Ljava/lang/String;

    goto/16 :goto_0

    .line 446
    :cond_32
    const-string v7, "Notes"

    invoke-virtual {v3, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_33

    .line 447
    iget-object v7, p0, Lcom/keepassdroid/database/load/ImporterV4;->ctxGroup:Lcom/keepassdroid/database/PwGroupV4;

    invoke-direct {p0, p2}, Lcom/keepassdroid/database/load/ImporterV4;->ReadString(Lorg/xmlpull/v1/XmlPullParser;)Ljava/lang/String;

    move-result-object v8

    iput-object v8, v7, Lcom/keepassdroid/database/PwGroupV4;->notes:Ljava/lang/String;

    goto/16 :goto_0

    .line 448
    :cond_33
    const-string v7, "IconID"

    invoke-virtual {v3, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_34

    .line 449
    iget-object v7, p0, Lcom/keepassdroid/database/load/ImporterV4;->ctxGroup:Lcom/keepassdroid/database/PwGroupV4;

    iget-object v8, p0, Lcom/keepassdroid/database/load/ImporterV4;->db:Lcom/keepassdroid/database/PwDatabaseV4;

    iget-object v8, v8, Lcom/keepassdroid/database/PwDatabaseV4;->iconFactory:Lcom/keepassdroid/database/PwIconFactory;

    const-wide/16 v10, 0x0

    invoke-direct {p0, p2, v10, v11}, Lcom/keepassdroid/database/load/ImporterV4;->ReadUInt(Lorg/xmlpull/v1/XmlPullParser;J)J

    move-result-wide v10

    long-to-int v9, v10

    invoke-virtual {v8, v9}, Lcom/keepassdroid/database/PwIconFactory;->getIcon(I)Lcom/keepassdroid/database/PwIconStandard;

    move-result-object v8

    iput-object v8, v7, Lcom/keepassdroid/database/PwGroupV4;->icon:Lcom/keepassdroid/database/PwIconStandard;

    goto/16 :goto_0

    .line 450
    :cond_34
    const-string v7, "CustomIconUUID"

    invoke-virtual {v3, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_35

    .line 451
    iget-object v7, p0, Lcom/keepassdroid/database/load/ImporterV4;->ctxGroup:Lcom/keepassdroid/database/PwGroupV4;

    iget-object v8, p0, Lcom/keepassdroid/database/load/ImporterV4;->db:Lcom/keepassdroid/database/PwDatabaseV4;

    iget-object v8, v8, Lcom/keepassdroid/database/PwDatabaseV4;->iconFactory:Lcom/keepassdroid/database/PwIconFactory;

    invoke-direct {p0, p2}, Lcom/keepassdroid/database/load/ImporterV4;->ReadUuid(Lorg/xmlpull/v1/XmlPullParser;)Ljava/util/UUID;

    move-result-object v9

    invoke-virtual {v8, v9}, Lcom/keepassdroid/database/PwIconFactory;->getIcon(Ljava/util/UUID;)Lcom/keepassdroid/database/PwIconCustom;

    move-result-object v8

    iput-object v8, v7, Lcom/keepassdroid/database/PwGroupV4;->customIcon:Lcom/keepassdroid/database/PwIconCustom;

    goto/16 :goto_0

    .line 452
    :cond_35
    const-string v7, "Times"

    invoke-virtual {v3, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_36

    .line 453
    sget-object v7, Lcom/keepassdroid/database/load/ImporterV4$KdbContext;->GroupTimes:Lcom/keepassdroid/database/load/ImporterV4$KdbContext;

    invoke-direct {p0, p1, v7, p2}, Lcom/keepassdroid/database/load/ImporterV4;->SwitchContext(Lcom/keepassdroid/database/load/ImporterV4$KdbContext;Lcom/keepassdroid/database/load/ImporterV4$KdbContext;Lorg/xmlpull/v1/XmlPullParser;)Lcom/keepassdroid/database/load/ImporterV4$KdbContext;

    move-result-object p1

    goto/16 :goto_0

    .line 454
    :cond_36
    const-string v7, "IsExpanded"

    invoke-virtual {v3, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_37

    .line 455
    iget-object v7, p0, Lcom/keepassdroid/database/load/ImporterV4;->ctxGroup:Lcom/keepassdroid/database/PwGroupV4;

    const/4 v8, 0x1

    invoke-direct {p0, p2, v8}, Lcom/keepassdroid/database/load/ImporterV4;->ReadBool(Lorg/xmlpull/v1/XmlPullParser;Z)Z

    move-result v8

    iput-boolean v8, v7, Lcom/keepassdroid/database/PwGroupV4;->isExpanded:Z

    goto/16 :goto_0

    .line 456
    :cond_37
    const-string v7, "DefaultAutoTypeSequence"

    invoke-virtual {v3, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_38

    .line 457
    iget-object v7, p0, Lcom/keepassdroid/database/load/ImporterV4;->ctxGroup:Lcom/keepassdroid/database/PwGroupV4;

    invoke-direct {p0, p2}, Lcom/keepassdroid/database/load/ImporterV4;->ReadString(Lorg/xmlpull/v1/XmlPullParser;)Ljava/lang/String;

    move-result-object v8

    iput-object v8, v7, Lcom/keepassdroid/database/PwGroupV4;->defaultAutoTypeSequence:Ljava/lang/String;

    goto/16 :goto_0

    .line 458
    :cond_38
    const-string v7, "EnableAutoType"

    invoke-virtual {v3, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_39

    .line 459
    iget-object v7, p0, Lcom/keepassdroid/database/load/ImporterV4;->ctxGroup:Lcom/keepassdroid/database/PwGroupV4;

    invoke-direct {p0, p2}, Lcom/keepassdroid/database/load/ImporterV4;->ReadString(Lorg/xmlpull/v1/XmlPullParser;)Ljava/lang/String;

    move-result-object v8

    invoke-direct {p0, v8}, Lcom/keepassdroid/database/load/ImporterV4;->StringToBoolean(Ljava/lang/String;)Ljava/lang/Boolean;

    move-result-object v8

    iput-object v8, v7, Lcom/keepassdroid/database/PwGroupV4;->enableAutoType:Ljava/lang/Boolean;

    goto/16 :goto_0

    .line 460
    :cond_39
    const-string v7, "EnableSearching"

    invoke-virtual {v3, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_3a

    .line 461
    iget-object v7, p0, Lcom/keepassdroid/database/load/ImporterV4;->ctxGroup:Lcom/keepassdroid/database/PwGroupV4;

    invoke-direct {p0, p2}, Lcom/keepassdroid/database/load/ImporterV4;->ReadString(Lorg/xmlpull/v1/XmlPullParser;)Ljava/lang/String;

    move-result-object v8

    invoke-direct {p0, v8}, Lcom/keepassdroid/database/load/ImporterV4;->StringToBoolean(Ljava/lang/String;)Ljava/lang/Boolean;

    move-result-object v8

    iput-object v8, v7, Lcom/keepassdroid/database/PwGroupV4;->enableSearching:Ljava/lang/Boolean;

    goto/16 :goto_0

    .line 462
    :cond_3a
    const-string v7, "LastTopVisibleEntry"

    invoke-virtual {v3, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_3b

    .line 463
    iget-object v7, p0, Lcom/keepassdroid/database/load/ImporterV4;->ctxGroup:Lcom/keepassdroid/database/PwGroupV4;

    invoke-direct {p0, p2}, Lcom/keepassdroid/database/load/ImporterV4;->ReadUuid(Lorg/xmlpull/v1/XmlPullParser;)Ljava/util/UUID;

    move-result-object v8

    iput-object v8, v7, Lcom/keepassdroid/database/PwGroupV4;->lastTopVisibleEntry:Ljava/util/UUID;

    goto/16 :goto_0

    .line 464
    :cond_3b
    const-string v7, "Group"

    invoke-virtual {v3, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_3c

    .line 465
    new-instance v7, Lcom/keepassdroid/database/PwGroupV4;

    invoke-direct {v7}, Lcom/keepassdroid/database/PwGroupV4;-><init>()V

    iput-object v7, p0, Lcom/keepassdroid/database/load/ImporterV4;->ctxGroup:Lcom/keepassdroid/database/PwGroupV4;

    .line 466
    iget-object v7, p0, Lcom/keepassdroid/database/load/ImporterV4;->ctxGroups:Ljava/util/Stack;

    invoke-virtual {v7}, Ljava/util/Stack;->peek()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/keepassdroid/database/PwGroupV4;

    iget-object v8, p0, Lcom/keepassdroid/database/load/ImporterV4;->ctxGroup:Lcom/keepassdroid/database/PwGroupV4;

    const/4 v9, 0x1

    invoke-virtual {v7, v8, v9}, Lcom/keepassdroid/database/PwGroupV4;->AddGroup(Lcom/keepassdroid/database/PwGroupV4;Z)V

    .line 467
    iget-object v7, p0, Lcom/keepassdroid/database/load/ImporterV4;->ctxGroups:Ljava/util/Stack;

    iget-object v8, p0, Lcom/keepassdroid/database/load/ImporterV4;->ctxGroup:Lcom/keepassdroid/database/PwGroupV4;

    invoke-virtual {v7, v8}, Ljava/util/Stack;->push(Ljava/lang/Object;)Ljava/lang/Object;

    .line 469
    sget-object v7, Lcom/keepassdroid/database/load/ImporterV4$KdbContext;->Group:Lcom/keepassdroid/database/load/ImporterV4$KdbContext;

    invoke-direct {p0, p1, v7, p2}, Lcom/keepassdroid/database/load/ImporterV4;->SwitchContext(Lcom/keepassdroid/database/load/ImporterV4$KdbContext;Lcom/keepassdroid/database/load/ImporterV4$KdbContext;Lorg/xmlpull/v1/XmlPullParser;)Lcom/keepassdroid/database/load/ImporterV4$KdbContext;

    move-result-object p1

    goto/16 :goto_0

    .line 470
    :cond_3c
    const-string v7, "Entry"

    invoke-virtual {v3, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_3d

    .line 471
    new-instance v7, Lcom/keepassdroid/database/PwEntryV4;

    invoke-direct {v7}, Lcom/keepassdroid/database/PwEntryV4;-><init>()V

    iput-object v7, p0, Lcom/keepassdroid/database/load/ImporterV4;->ctxEntry:Lcom/keepassdroid/database/PwEntryV4;

    .line 472
    iget-object v7, p0, Lcom/keepassdroid/database/load/ImporterV4;->ctxGroup:Lcom/keepassdroid/database/PwGroupV4;

    iget-object v8, p0, Lcom/keepassdroid/database/load/ImporterV4;->ctxEntry:Lcom/keepassdroid/database/PwEntryV4;

    const/4 v9, 0x1

    invoke-virtual {v7, v8, v9}, Lcom/keepassdroid/database/PwGroupV4;->AddEntry(Lcom/keepassdroid/database/PwEntryV4;Z)V

    .line 474
    const/4 v7, 0x0

    iput-boolean v7, p0, Lcom/keepassdroid/database/load/ImporterV4;->entryInHistory:Z

    .line 475
    sget-object v7, Lcom/keepassdroid/database/load/ImporterV4$KdbContext;->Entry:Lcom/keepassdroid/database/load/ImporterV4$KdbContext;

    invoke-direct {p0, p1, v7, p2}, Lcom/keepassdroid/database/load/ImporterV4;->SwitchContext(Lcom/keepassdroid/database/load/ImporterV4$KdbContext;Lcom/keepassdroid/database/load/ImporterV4$KdbContext;Lorg/xmlpull/v1/XmlPullParser;)Lcom/keepassdroid/database/load/ImporterV4$KdbContext;

    move-result-object p1

    goto/16 :goto_0

    .line 477
    :cond_3d
    invoke-direct {p0, p2}, Lcom/keepassdroid/database/load/ImporterV4;->ReadUnknown(Lorg/xmlpull/v1/XmlPullParser;)V

    goto/16 :goto_0

    .line 482
    :pswitch_b
    const-string v7, "UUID"

    invoke-virtual {v3, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_3e

    .line 483
    iget-object v7, p0, Lcom/keepassdroid/database/load/ImporterV4;->ctxEntry:Lcom/keepassdroid/database/PwEntryV4;

    invoke-direct {p0, p2}, Lcom/keepassdroid/database/load/ImporterV4;->ReadUuid(Lorg/xmlpull/v1/XmlPullParser;)Ljava/util/UUID;

    move-result-object v8

    invoke-virtual {v7, v8}, Lcom/keepassdroid/database/PwEntryV4;->setUUID(Ljava/util/UUID;)V

    goto/16 :goto_0

    .line 484
    :cond_3e
    const-string v7, "IconID"

    invoke-virtual {v3, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_3f

    .line 485
    iget-object v7, p0, Lcom/keepassdroid/database/load/ImporterV4;->ctxEntry:Lcom/keepassdroid/database/PwEntryV4;

    iget-object v8, p0, Lcom/keepassdroid/database/load/ImporterV4;->db:Lcom/keepassdroid/database/PwDatabaseV4;

    iget-object v8, v8, Lcom/keepassdroid/database/PwDatabaseV4;->iconFactory:Lcom/keepassdroid/database/PwIconFactory;

    const-wide/16 v10, 0x0

    invoke-direct {p0, p2, v10, v11}, Lcom/keepassdroid/database/load/ImporterV4;->ReadUInt(Lorg/xmlpull/v1/XmlPullParser;J)J

    move-result-wide v10

    long-to-int v9, v10

    invoke-virtual {v8, v9}, Lcom/keepassdroid/database/PwIconFactory;->getIcon(I)Lcom/keepassdroid/database/PwIconStandard;

    move-result-object v8

    iput-object v8, v7, Lcom/keepassdroid/database/PwEntryV4;->icon:Lcom/keepassdroid/database/PwIconStandard;

    goto/16 :goto_0

    .line 486
    :cond_3f
    const-string v7, "CustomIconUUID"

    invoke-virtual {v3, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_40

    .line 487
    iget-object v7, p0, Lcom/keepassdroid/database/load/ImporterV4;->ctxEntry:Lcom/keepassdroid/database/PwEntryV4;

    iget-object v8, p0, Lcom/keepassdroid/database/load/ImporterV4;->db:Lcom/keepassdroid/database/PwDatabaseV4;

    iget-object v8, v8, Lcom/keepassdroid/database/PwDatabaseV4;->iconFactory:Lcom/keepassdroid/database/PwIconFactory;

    invoke-direct {p0, p2}, Lcom/keepassdroid/database/load/ImporterV4;->ReadUuid(Lorg/xmlpull/v1/XmlPullParser;)Ljava/util/UUID;

    move-result-object v9

    invoke-virtual {v8, v9}, Lcom/keepassdroid/database/PwIconFactory;->getIcon(Ljava/util/UUID;)Lcom/keepassdroid/database/PwIconCustom;

    move-result-object v8

    iput-object v8, v7, Lcom/keepassdroid/database/PwEntryV4;->customIcon:Lcom/keepassdroid/database/PwIconCustom;

    goto/16 :goto_0

    .line 488
    :cond_40
    const-string v7, "ForegroundColor"

    invoke-virtual {v3, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_41

    .line 489
    iget-object v7, p0, Lcom/keepassdroid/database/load/ImporterV4;->ctxEntry:Lcom/keepassdroid/database/PwEntryV4;

    invoke-direct {p0, p2}, Lcom/keepassdroid/database/load/ImporterV4;->ReadString(Lorg/xmlpull/v1/XmlPullParser;)Ljava/lang/String;

    move-result-object v8

    iput-object v8, v7, Lcom/keepassdroid/database/PwEntryV4;->foregroundColor:Ljava/lang/String;

    goto/16 :goto_0

    .line 490
    :cond_41
    const-string v7, "BackgroundColor"

    invoke-virtual {v3, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_42

    .line 491
    iget-object v7, p0, Lcom/keepassdroid/database/load/ImporterV4;->ctxEntry:Lcom/keepassdroid/database/PwEntryV4;

    invoke-direct {p0, p2}, Lcom/keepassdroid/database/load/ImporterV4;->ReadString(Lorg/xmlpull/v1/XmlPullParser;)Ljava/lang/String;

    move-result-object v8

    iput-object v8, v7, Lcom/keepassdroid/database/PwEntryV4;->backgroupColor:Ljava/lang/String;

    goto/16 :goto_0

    .line 492
    :cond_42
    const-string v7, "OverrideURL"

    invoke-virtual {v3, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_43

    .line 493
    iget-object v7, p0, Lcom/keepassdroid/database/load/ImporterV4;->ctxEntry:Lcom/keepassdroid/database/PwEntryV4;

    invoke-direct {p0, p2}, Lcom/keepassdroid/database/load/ImporterV4;->ReadString(Lorg/xmlpull/v1/XmlPullParser;)Ljava/lang/String;

    move-result-object v8

    iput-object v8, v7, Lcom/keepassdroid/database/PwEntryV4;->overrideURL:Ljava/lang/String;

    goto/16 :goto_0

    .line 494
    :cond_43
    const-string v7, "Tags"

    invoke-virtual {v3, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_44

    .line 495
    iget-object v7, p0, Lcom/keepassdroid/database/load/ImporterV4;->ctxEntry:Lcom/keepassdroid/database/PwEntryV4;

    invoke-direct {p0, p2}, Lcom/keepassdroid/database/load/ImporterV4;->ReadString(Lorg/xmlpull/v1/XmlPullParser;)Ljava/lang/String;

    move-result-object v8

    iput-object v8, v7, Lcom/keepassdroid/database/PwEntryV4;->tags:Ljava/lang/String;

    goto/16 :goto_0

    .line 496
    :cond_44
    const-string v7, "Times"

    invoke-virtual {v3, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_45

    .line 497
    sget-object v7, Lcom/keepassdroid/database/load/ImporterV4$KdbContext;->EntryTimes:Lcom/keepassdroid/database/load/ImporterV4$KdbContext;

    invoke-direct {p0, p1, v7, p2}, Lcom/keepassdroid/database/load/ImporterV4;->SwitchContext(Lcom/keepassdroid/database/load/ImporterV4$KdbContext;Lcom/keepassdroid/database/load/ImporterV4$KdbContext;Lorg/xmlpull/v1/XmlPullParser;)Lcom/keepassdroid/database/load/ImporterV4$KdbContext;

    move-result-object p1

    goto/16 :goto_0

    .line 498
    :cond_45
    const-string v7, "String"

    invoke-virtual {v3, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_46

    .line 499
    sget-object v7, Lcom/keepassdroid/database/load/ImporterV4$KdbContext;->EntryString:Lcom/keepassdroid/database/load/ImporterV4$KdbContext;

    invoke-direct {p0, p1, v7, p2}, Lcom/keepassdroid/database/load/ImporterV4;->SwitchContext(Lcom/keepassdroid/database/load/ImporterV4$KdbContext;Lcom/keepassdroid/database/load/ImporterV4$KdbContext;Lorg/xmlpull/v1/XmlPullParser;)Lcom/keepassdroid/database/load/ImporterV4$KdbContext;

    move-result-object p1

    goto/16 :goto_0

    .line 500
    :cond_46
    const-string v7, "Binary"

    invoke-virtual {v3, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_47

    .line 501
    sget-object v7, Lcom/keepassdroid/database/load/ImporterV4$KdbContext;->EntryBinary:Lcom/keepassdroid/database/load/ImporterV4$KdbContext;

    invoke-direct {p0, p1, v7, p2}, Lcom/keepassdroid/database/load/ImporterV4;->SwitchContext(Lcom/keepassdroid/database/load/ImporterV4$KdbContext;Lcom/keepassdroid/database/load/ImporterV4$KdbContext;Lorg/xmlpull/v1/XmlPullParser;)Lcom/keepassdroid/database/load/ImporterV4$KdbContext;

    move-result-object p1

    goto/16 :goto_0

    .line 502
    :cond_47
    const-string v7, "AutoType"

    invoke-virtual {v3, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_48

    .line 503
    sget-object v7, Lcom/keepassdroid/database/load/ImporterV4$KdbContext;->EntryAutoType:Lcom/keepassdroid/database/load/ImporterV4$KdbContext;

    invoke-direct {p0, p1, v7, p2}, Lcom/keepassdroid/database/load/ImporterV4;->SwitchContext(Lcom/keepassdroid/database/load/ImporterV4$KdbContext;Lcom/keepassdroid/database/load/ImporterV4$KdbContext;Lorg/xmlpull/v1/XmlPullParser;)Lcom/keepassdroid/database/load/ImporterV4$KdbContext;

    move-result-object p1

    goto/16 :goto_0

    .line 504
    :cond_48
    const-string v7, "History"

    invoke-virtual {v3, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_4b

    .line 505
    sget-boolean v7, Lcom/keepassdroid/database/load/ImporterV4;->$assertionsDisabled:Z

    if-nez v7, :cond_49

    iget-boolean v7, p0, Lcom/keepassdroid/database/load/ImporterV4;->entryInHistory:Z

    if-eqz v7, :cond_49

    new-instance v7, Ljava/lang/AssertionError;

    invoke-direct {v7}, Ljava/lang/AssertionError;-><init>()V

    throw v7

    .line 507
    :cond_49
    iget-boolean v7, p0, Lcom/keepassdroid/database/load/ImporterV4;->entryInHistory:Z

    if-nez v7, :cond_4a

    .line 508
    iget-object v7, p0, Lcom/keepassdroid/database/load/ImporterV4;->ctxEntry:Lcom/keepassdroid/database/PwEntryV4;

    iput-object v7, p0, Lcom/keepassdroid/database/load/ImporterV4;->ctxHistoryBase:Lcom/keepassdroid/database/PwEntryV4;

    .line 509
    sget-object v7, Lcom/keepassdroid/database/load/ImporterV4$KdbContext;->EntryHistory:Lcom/keepassdroid/database/load/ImporterV4$KdbContext;

    invoke-direct {p0, p1, v7, p2}, Lcom/keepassdroid/database/load/ImporterV4;->SwitchContext(Lcom/keepassdroid/database/load/ImporterV4$KdbContext;Lcom/keepassdroid/database/load/ImporterV4$KdbContext;Lorg/xmlpull/v1/XmlPullParser;)Lcom/keepassdroid/database/load/ImporterV4$KdbContext;

    move-result-object p1

    goto/16 :goto_0

    .line 511
    :cond_4a
    invoke-direct {p0, p2}, Lcom/keepassdroid/database/load/ImporterV4;->ReadUnknown(Lorg/xmlpull/v1/XmlPullParser;)V

    goto/16 :goto_0

    .line 514
    :cond_4b
    invoke-direct {p0, p2}, Lcom/keepassdroid/database/load/ImporterV4;->ReadUnknown(Lorg/xmlpull/v1/XmlPullParser;)V

    goto/16 :goto_0

    .line 521
    :pswitch_c
    sget-object v7, Lcom/keepassdroid/database/load/ImporterV4$KdbContext;->GroupTimes:Lcom/keepassdroid/database/load/ImporterV4$KdbContext;

    if-ne p1, v7, :cond_4c

    .line 522
    iget-object v6, p0, Lcom/keepassdroid/database/load/ImporterV4;->ctxGroup:Lcom/keepassdroid/database/PwGroupV4;

    .line 527
    .local v6, "tl":Lcom/keepassdroid/database/ITimeLogger;
    :goto_1
    const-string v7, "LastModificationTime"

    invoke-virtual {v3, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_4d

    .line 528
    invoke-direct {p0, p2}, Lcom/keepassdroid/database/load/ImporterV4;->ReadTime(Lorg/xmlpull/v1/XmlPullParser;)Ljava/util/Date;

    move-result-object v7

    invoke-interface {v6, v7}, Lcom/keepassdroid/database/ITimeLogger;->setLastModificationTime(Ljava/util/Date;)V

    goto/16 :goto_0

    .line 524
    .end local v6    # "tl":Lcom/keepassdroid/database/ITimeLogger;
    :cond_4c
    iget-object v6, p0, Lcom/keepassdroid/database/load/ImporterV4;->ctxEntry:Lcom/keepassdroid/database/PwEntryV4;

    .restart local v6    # "tl":Lcom/keepassdroid/database/ITimeLogger;
    goto :goto_1

    .line 529
    :cond_4d
    const-string v7, "CreationTime"

    invoke-virtual {v3, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_4e

    .line 530
    invoke-direct {p0, p2}, Lcom/keepassdroid/database/load/ImporterV4;->ReadTime(Lorg/xmlpull/v1/XmlPullParser;)Ljava/util/Date;

    move-result-object v7

    invoke-interface {v6, v7}, Lcom/keepassdroid/database/ITimeLogger;->setCreationTime(Ljava/util/Date;)V

    goto/16 :goto_0

    .line 531
    :cond_4e
    const-string v7, "LastAccessTime"

    invoke-virtual {v3, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_4f

    .line 532
    invoke-direct {p0, p2}, Lcom/keepassdroid/database/load/ImporterV4;->ReadTime(Lorg/xmlpull/v1/XmlPullParser;)Ljava/util/Date;

    move-result-object v7

    invoke-interface {v6, v7}, Lcom/keepassdroid/database/ITimeLogger;->setLastAccessTime(Ljava/util/Date;)V

    goto/16 :goto_0

    .line 533
    :cond_4f
    const-string v7, "ExpiryTime"

    invoke-virtual {v3, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_50

    .line 534
    invoke-direct {p0, p2}, Lcom/keepassdroid/database/load/ImporterV4;->ReadTime(Lorg/xmlpull/v1/XmlPullParser;)Ljava/util/Date;

    move-result-object v7

    invoke-interface {v6, v7}, Lcom/keepassdroid/database/ITimeLogger;->setExpiryTime(Ljava/util/Date;)V

    goto/16 :goto_0

    .line 535
    :cond_50
    const-string v7, "Expires"

    invoke-virtual {v3, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_51

    .line 536
    const/4 v7, 0x0

    invoke-direct {p0, p2, v7}, Lcom/keepassdroid/database/load/ImporterV4;->ReadBool(Lorg/xmlpull/v1/XmlPullParser;Z)Z

    move-result v7

    invoke-interface {v6, v7}, Lcom/keepassdroid/database/ITimeLogger;->setExpires(Z)V

    goto/16 :goto_0

    .line 537
    :cond_51
    const-string v7, "UsageCount"

    invoke-virtual {v3, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_52

    .line 538
    const-wide/16 v8, 0x0

    invoke-direct {p0, p2, v8, v9}, Lcom/keepassdroid/database/load/ImporterV4;->ReadULong(Lorg/xmlpull/v1/XmlPullParser;J)J

    move-result-wide v8

    invoke-interface {v6, v8, v9}, Lcom/keepassdroid/database/ITimeLogger;->setUsageCount(J)V

    goto/16 :goto_0

    .line 539
    :cond_52
    const-string v7, "LocationChanged"

    invoke-virtual {v3, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_53

    .line 540
    invoke-direct {p0, p2}, Lcom/keepassdroid/database/load/ImporterV4;->ReadTime(Lorg/xmlpull/v1/XmlPullParser;)Ljava/util/Date;

    move-result-object v7

    invoke-interface {v6, v7}, Lcom/keepassdroid/database/ITimeLogger;->setLocationChanged(Ljava/util/Date;)V

    goto/16 :goto_0

    .line 542
    :cond_53
    invoke-direct {p0, p2}, Lcom/keepassdroid/database/load/ImporterV4;->ReadUnknown(Lorg/xmlpull/v1/XmlPullParser;)V

    goto/16 :goto_0

    .line 547
    .end local v6    # "tl":Lcom/keepassdroid/database/ITimeLogger;
    :pswitch_d
    const-string v7, "Key"

    invoke-virtual {v3, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_54

    .line 548
    invoke-direct {p0, p2}, Lcom/keepassdroid/database/load/ImporterV4;->ReadString(Lorg/xmlpull/v1/XmlPullParser;)Ljava/lang/String;

    move-result-object v7

    iput-object v7, p0, Lcom/keepassdroid/database/load/ImporterV4;->ctxStringName:Ljava/lang/String;

    goto/16 :goto_0

    .line 549
    :cond_54
    const-string v7, "Value"

    invoke-virtual {v3, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_55

    .line 550
    invoke-direct {p0, p2}, Lcom/keepassdroid/database/load/ImporterV4;->ReadProtectedString(Lorg/xmlpull/v1/XmlPullParser;)Lcom/keepassdroid/database/security/ProtectedString;

    move-result-object v7

    iput-object v7, p0, Lcom/keepassdroid/database/load/ImporterV4;->ctxStringValue:Lcom/keepassdroid/database/security/ProtectedString;

    goto/16 :goto_0

    .line 552
    :cond_55
    invoke-direct {p0, p2}, Lcom/keepassdroid/database/load/ImporterV4;->ReadUnknown(Lorg/xmlpull/v1/XmlPullParser;)V

    goto/16 :goto_0

    .line 557
    :pswitch_e
    const-string v7, "Key"

    invoke-virtual {v3, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_56

    .line 558
    invoke-direct {p0, p2}, Lcom/keepassdroid/database/load/ImporterV4;->ReadString(Lorg/xmlpull/v1/XmlPullParser;)Ljava/lang/String;

    move-result-object v7

    iput-object v7, p0, Lcom/keepassdroid/database/load/ImporterV4;->ctxBinaryName:Ljava/lang/String;

    goto/16 :goto_0

    .line 559
    :cond_56
    const-string v7, "Value"

    invoke-virtual {v3, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_0

    .line 560
    invoke-direct {p0, p2}, Lcom/keepassdroid/database/load/ImporterV4;->ReadProtectedBinary(Lorg/xmlpull/v1/XmlPullParser;)Lcom/keepassdroid/database/security/ProtectedBinary;

    move-result-object v7

    iput-object v7, p0, Lcom/keepassdroid/database/load/ImporterV4;->ctxBinaryValue:Lcom/keepassdroid/database/security/ProtectedBinary;

    goto/16 :goto_0

    .line 565
    :pswitch_f
    const-string v7, "Enabled"

    invoke-virtual {v3, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_57

    .line 566
    iget-object v7, p0, Lcom/keepassdroid/database/load/ImporterV4;->ctxEntry:Lcom/keepassdroid/database/PwEntryV4;

    iget-object v7, v7, Lcom/keepassdroid/database/PwEntryV4;->autoType:Lcom/keepassdroid/database/PwEntryV4$AutoType;

    const/4 v8, 0x1

    invoke-direct {p0, p2, v8}, Lcom/keepassdroid/database/load/ImporterV4;->ReadBool(Lorg/xmlpull/v1/XmlPullParser;Z)Z

    move-result v8

    iput-boolean v8, v7, Lcom/keepassdroid/database/PwEntryV4$AutoType;->enabled:Z

    goto/16 :goto_0

    .line 567
    :cond_57
    const-string v7, "DataTransferObfuscation"

    invoke-virtual {v3, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_58

    .line 568
    iget-object v7, p0, Lcom/keepassdroid/database/load/ImporterV4;->ctxEntry:Lcom/keepassdroid/database/PwEntryV4;

    iget-object v7, v7, Lcom/keepassdroid/database/PwEntryV4;->autoType:Lcom/keepassdroid/database/PwEntryV4$AutoType;

    const-wide/16 v8, 0x0

    invoke-direct {p0, p2, v8, v9}, Lcom/keepassdroid/database/load/ImporterV4;->ReadUInt(Lorg/xmlpull/v1/XmlPullParser;J)J

    move-result-wide v8

    iput-wide v8, v7, Lcom/keepassdroid/database/PwEntryV4$AutoType;->obfuscationOptions:J

    goto/16 :goto_0

    .line 569
    :cond_58
    const-string v7, "DefaultSequence"

    invoke-virtual {v3, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_59

    .line 570
    iget-object v7, p0, Lcom/keepassdroid/database/load/ImporterV4;->ctxEntry:Lcom/keepassdroid/database/PwEntryV4;

    iget-object v7, v7, Lcom/keepassdroid/database/PwEntryV4;->autoType:Lcom/keepassdroid/database/PwEntryV4$AutoType;

    invoke-direct {p0, p2}, Lcom/keepassdroid/database/load/ImporterV4;->ReadString(Lorg/xmlpull/v1/XmlPullParser;)Ljava/lang/String;

    move-result-object v8

    iput-object v8, v7, Lcom/keepassdroid/database/PwEntryV4$AutoType;->defaultSequence:Ljava/lang/String;

    goto/16 :goto_0

    .line 571
    :cond_59
    const-string v7, "Association"

    invoke-virtual {v3, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_5a

    .line 572
    sget-object v7, Lcom/keepassdroid/database/load/ImporterV4$KdbContext;->EntryAutoTypeItem:Lcom/keepassdroid/database/load/ImporterV4$KdbContext;

    invoke-direct {p0, p1, v7, p2}, Lcom/keepassdroid/database/load/ImporterV4;->SwitchContext(Lcom/keepassdroid/database/load/ImporterV4$KdbContext;Lcom/keepassdroid/database/load/ImporterV4$KdbContext;Lorg/xmlpull/v1/XmlPullParser;)Lcom/keepassdroid/database/load/ImporterV4$KdbContext;

    move-result-object p1

    goto/16 :goto_0

    .line 574
    :cond_5a
    invoke-direct {p0, p2}, Lcom/keepassdroid/database/load/ImporterV4;->ReadUnknown(Lorg/xmlpull/v1/XmlPullParser;)V

    goto/16 :goto_0

    .line 579
    :pswitch_10
    const-string v7, "Window"

    invoke-virtual {v3, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_5b

    .line 580
    invoke-direct {p0, p2}, Lcom/keepassdroid/database/load/ImporterV4;->ReadString(Lorg/xmlpull/v1/XmlPullParser;)Ljava/lang/String;

    move-result-object v7

    iput-object v7, p0, Lcom/keepassdroid/database/load/ImporterV4;->ctxATName:Ljava/lang/String;

    goto/16 :goto_0

    .line 581
    :cond_5b
    const-string v7, "KeystrokeSequence"

    invoke-virtual {v3, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_5c

    .line 582
    invoke-direct {p0, p2}, Lcom/keepassdroid/database/load/ImporterV4;->ReadString(Lorg/xmlpull/v1/XmlPullParser;)Ljava/lang/String;

    move-result-object v7

    iput-object v7, p0, Lcom/keepassdroid/database/load/ImporterV4;->ctxATSeq:Ljava/lang/String;

    goto/16 :goto_0

    .line 584
    :cond_5c
    invoke-direct {p0, p2}, Lcom/keepassdroid/database/load/ImporterV4;->ReadUnknown(Lorg/xmlpull/v1/XmlPullParser;)V

    goto/16 :goto_0

    .line 589
    :pswitch_11
    const-string v7, "Entry"

    invoke-virtual {v3, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_5d

    .line 590
    new-instance v7, Lcom/keepassdroid/database/PwEntryV4;

    invoke-direct {v7}, Lcom/keepassdroid/database/PwEntryV4;-><init>()V

    iput-object v7, p0, Lcom/keepassdroid/database/load/ImporterV4;->ctxEntry:Lcom/keepassdroid/database/PwEntryV4;

    .line 591
    iget-object v7, p0, Lcom/keepassdroid/database/load/ImporterV4;->ctxHistoryBase:Lcom/keepassdroid/database/PwEntryV4;

    iget-object v7, v7, Lcom/keepassdroid/database/PwEntryV4;->history:Ljava/util/ArrayList;

    iget-object v8, p0, Lcom/keepassdroid/database/load/ImporterV4;->ctxEntry:Lcom/keepassdroid/database/PwEntryV4;

    invoke-virtual {v7, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 593
    const/4 v7, 0x1

    iput-boolean v7, p0, Lcom/keepassdroid/database/load/ImporterV4;->entryInHistory:Z

    .line 594
    sget-object v7, Lcom/keepassdroid/database/load/ImporterV4$KdbContext;->Entry:Lcom/keepassdroid/database/load/ImporterV4$KdbContext;

    invoke-direct {p0, p1, v7, p2}, Lcom/keepassdroid/database/load/ImporterV4;->SwitchContext(Lcom/keepassdroid/database/load/ImporterV4$KdbContext;Lcom/keepassdroid/database/load/ImporterV4$KdbContext;Lorg/xmlpull/v1/XmlPullParser;)Lcom/keepassdroid/database/load/ImporterV4$KdbContext;

    move-result-object p1

    goto/16 :goto_0

    .line 596
    :cond_5d
    invoke-direct {p0, p2}, Lcom/keepassdroid/database/load/ImporterV4;->ReadUnknown(Lorg/xmlpull/v1/XmlPullParser;)V

    goto/16 :goto_0

    .line 601
    :pswitch_12
    const-string v7, "DeletedObject"

    invoke-virtual {v3, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_5e

    .line 602
    new-instance v7, Lcom/keepassdroid/database/PwDeletedObject;

    invoke-direct {v7}, Lcom/keepassdroid/database/PwDeletedObject;-><init>()V

    iput-object v7, p0, Lcom/keepassdroid/database/load/ImporterV4;->ctxDeletedObject:Lcom/keepassdroid/database/PwDeletedObject;

    .line 603
    iget-object v7, p0, Lcom/keepassdroid/database/load/ImporterV4;->db:Lcom/keepassdroid/database/PwDatabaseV4;

    iget-object v7, v7, Lcom/keepassdroid/database/PwDatabaseV4;->deletedObjects:Ljava/util/List;

    iget-object v8, p0, Lcom/keepassdroid/database/load/ImporterV4;->ctxDeletedObject:Lcom/keepassdroid/database/PwDeletedObject;

    invoke-interface {v7, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 605
    sget-object v7, Lcom/keepassdroid/database/load/ImporterV4$KdbContext;->DeletedObject:Lcom/keepassdroid/database/load/ImporterV4$KdbContext;

    invoke-direct {p0, p1, v7, p2}, Lcom/keepassdroid/database/load/ImporterV4;->SwitchContext(Lcom/keepassdroid/database/load/ImporterV4$KdbContext;Lcom/keepassdroid/database/load/ImporterV4$KdbContext;Lorg/xmlpull/v1/XmlPullParser;)Lcom/keepassdroid/database/load/ImporterV4$KdbContext;

    move-result-object p1

    goto/16 :goto_0

    .line 607
    :cond_5e
    invoke-direct {p0, p2}, Lcom/keepassdroid/database/load/ImporterV4;->ReadUnknown(Lorg/xmlpull/v1/XmlPullParser;)V

    goto/16 :goto_0

    .line 612
    :pswitch_13
    const-string v7, "UUID"

    invoke-virtual {v3, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_5f

    .line 613
    iget-object v7, p0, Lcom/keepassdroid/database/load/ImporterV4;->ctxDeletedObject:Lcom/keepassdroid/database/PwDeletedObject;

    invoke-direct {p0, p2}, Lcom/keepassdroid/database/load/ImporterV4;->ReadUuid(Lorg/xmlpull/v1/XmlPullParser;)Ljava/util/UUID;

    move-result-object v8

    iput-object v8, v7, Lcom/keepassdroid/database/PwDeletedObject;->uuid:Ljava/util/UUID;

    goto/16 :goto_0

    .line 614
    :cond_5f
    const-string v7, "DeletionTime"

    invoke-virtual {v3, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_60

    .line 615
    iget-object v7, p0, Lcom/keepassdroid/database/load/ImporterV4;->ctxDeletedObject:Lcom/keepassdroid/database/PwDeletedObject;

    invoke-direct {p0, p2}, Lcom/keepassdroid/database/load/ImporterV4;->ReadTime(Lorg/xmlpull/v1/XmlPullParser;)Ljava/util/Date;

    move-result-object v8

    invoke-virtual {v7, v8}, Lcom/keepassdroid/database/PwDeletedObject;->setDeletionTime(Ljava/util/Date;)V

    goto/16 :goto_0

    .line 617
    :cond_60
    invoke-direct {p0, p2}, Lcom/keepassdroid/database/load/ImporterV4;->ReadUnknown(Lorg/xmlpull/v1/XmlPullParser;)V

    goto/16 :goto_0

    .line 268
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_5
        :pswitch_6
        :pswitch_7
        :pswitch_8
        :pswitch_9
        :pswitch_a
        :pswitch_b
        :pswitch_c
        :pswitch_c
        :pswitch_d
        :pswitch_e
        :pswitch_f
        :pswitch_10
        :pswitch_11
        :pswitch_12
        :pswitch_13
    .end packed-switch
.end method

.method private ReadXmlStreamed(Ljava/io/InputStream;)V
    .locals 3
    .param p1, "readerStream"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/keepassdroid/database/exception/InvalidDBException;
        }
    .end annotation

    .prologue
    .line 211
    :try_start_0
    invoke-static {p1}, Lcom/keepassdroid/database/load/ImporterV4;->CreatePullParser(Ljava/io/InputStream;)Lorg/xmlpull/v1/XmlPullParser;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/keepassdroid/database/load/ImporterV4;->ReadDocumentStreamed(Lorg/xmlpull/v1/XmlPullParser;)V
    :try_end_0
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_0 .. :try_end_0} :catch_0

    .line 216
    return-void

    .line 212
    :catch_0
    move-exception v0

    .line 213
    .local v0, "e":Lorg/xmlpull/v1/XmlPullParserException;
    invoke-virtual {v0}, Lorg/xmlpull/v1/XmlPullParserException;->printStackTrace()V

    .line 214
    new-instance v1, Ljava/io/IOException;

    invoke-virtual {v0}, Lorg/xmlpull/v1/XmlPullParserException;->getLocalizedMessage()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method private StringToBoolean(Ljava/lang/String;)Ljava/lang/Boolean;
    .locals 3
    .param p1, "str"    # Ljava/lang/String;

    .prologue
    const/4 v1, 0x0

    .line 952
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    if-nez v2, :cond_1

    .line 963
    :cond_0
    :goto_0
    return-object v1

    .line 956
    :cond_1
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    .line 957
    .local v0, "trimmed":Ljava/lang/String;
    const-string v2, "true"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 958
    const/4 v1, 0x1

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    goto :goto_0

    .line 959
    :cond_2
    const-string v2, "false"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 960
    const/4 v1, 0x0

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    goto :goto_0
.end method

.method private SwitchContext(Lcom/keepassdroid/database/load/ImporterV4$KdbContext;Lcom/keepassdroid/database/load/ImporterV4$KdbContext;Lorg/xmlpull/v1/XmlPullParser;)Lcom/keepassdroid/database/load/ImporterV4$KdbContext;
    .locals 1
    .param p1, "ctxCurrent"    # Lcom/keepassdroid/database/load/ImporterV4$KdbContext;
    .param p2, "ctxNew"    # Lcom/keepassdroid/database/load/ImporterV4$KdbContext;
    .param p3, "xpp"    # Lorg/xmlpull/v1/XmlPullParser;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xmlpull/v1/XmlPullParserException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 943
    invoke-interface {p3}, Lorg/xmlpull/v1/XmlPullParser;->isEmptyElementTag()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 944
    invoke-interface {p3}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    .line 947
    .end local p1    # "ctxCurrent":Lcom/keepassdroid/database/load/ImporterV4$KdbContext;
    :goto_0
    return-object p1

    .restart local p1    # "ctxCurrent":Lcom/keepassdroid/database/load/ImporterV4$KdbContext;
    :cond_0
    move-object p1, p2

    goto :goto_0
.end method


# virtual methods
.method protected createDB()Lcom/keepassdroid/database/PwDatabaseV4;
    .locals 1

    .prologue
    .line 81
    new-instance v0, Lcom/keepassdroid/database/PwDatabaseV4;

    invoke-direct {v0}, Lcom/keepassdroid/database/PwDatabaseV4;-><init>()V

    return-object v0
.end method

.method public bridge synthetic openDatabase(Ljava/io/InputStream;Ljava/lang/String;Ljava/io/InputStream;)Lcom/keepassdroid/database/PwDatabase;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/keepassdroid/database/exception/InvalidDBException;
        }
    .end annotation

    .prologue
    .line 72
    invoke-virtual {p0, p1, p2, p3}, Lcom/keepassdroid/database/load/ImporterV4;->openDatabase(Ljava/io/InputStream;Ljava/lang/String;Ljava/io/InputStream;)Lcom/keepassdroid/database/PwDatabaseV4;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic openDatabase(Ljava/io/InputStream;Ljava/lang/String;Ljava/io/InputStream;Lcom/keepassdroid/UpdateStatus;)Lcom/keepassdroid/database/PwDatabase;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/keepassdroid/database/exception/InvalidDBException;
        }
    .end annotation

    .prologue
    .line 72
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/keepassdroid/database/load/ImporterV4;->openDatabase(Ljava/io/InputStream;Ljava/lang/String;Ljava/io/InputStream;Lcom/keepassdroid/UpdateStatus;)Lcom/keepassdroid/database/PwDatabaseV4;

    move-result-object v0

    return-object v0
.end method

.method public openDatabase(Ljava/io/InputStream;Ljava/lang/String;Ljava/io/InputStream;)Lcom/keepassdroid/database/PwDatabaseV4;
    .locals 1
    .param p1, "inStream"    # Ljava/io/InputStream;
    .param p2, "password"    # Ljava/lang/String;
    .param p3, "keyInputStream"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/keepassdroid/database/exception/InvalidDBException;
        }
    .end annotation

    .prologue
    .line 89
    new-instance v0, Lcom/keepassdroid/UpdateStatus;

    invoke-direct {v0}, Lcom/keepassdroid/UpdateStatus;-><init>()V

    invoke-virtual {p0, p1, p2, p3, v0}, Lcom/keepassdroid/database/load/ImporterV4;->openDatabase(Ljava/io/InputStream;Ljava/lang/String;Ljava/io/InputStream;Lcom/keepassdroid/UpdateStatus;)Lcom/keepassdroid/database/PwDatabaseV4;

    move-result-object v0

    return-object v0
.end method

.method public openDatabase(Ljava/io/InputStream;Ljava/lang/String;Ljava/io/InputStream;Lcom/keepassdroid/UpdateStatus;)Lcom/keepassdroid/database/PwDatabaseV4;
    .locals 16
    .param p1, "inStream"    # Ljava/io/InputStream;
    .param p2, "password"    # Ljava/lang/String;
    .param p3, "keyInputStream"    # Ljava/io/InputStream;
    .param p4, "status"    # Lcom/keepassdroid/UpdateStatus;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/keepassdroid/database/exception/InvalidDBException;
        }
    .end annotation

    .prologue
    .line 97
    invoke-virtual/range {p0 .. p0}, Lcom/keepassdroid/database/load/ImporterV4;->createDB()Lcom/keepassdroid/database/PwDatabaseV4;

    move-result-object v10

    move-object/from16 v0, p0

    iput-object v10, v0, Lcom/keepassdroid/database/load/ImporterV4;->db:Lcom/keepassdroid/database/PwDatabaseV4;

    .line 99
    new-instance v8, Lcom/keepassdroid/database/PwDbHeaderV4;

    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/keepassdroid/database/load/ImporterV4;->db:Lcom/keepassdroid/database/PwDatabaseV4;

    invoke-direct {v8, v10}, Lcom/keepassdroid/database/PwDbHeaderV4;-><init>(Lcom/keepassdroid/database/PwDatabaseV4;)V

    .line 101
    .local v8, "header":Lcom/keepassdroid/database/PwDbHeaderV4;
    move-object/from16 v0, p1

    invoke-virtual {v8, v0}, Lcom/keepassdroid/database/PwDbHeaderV4;->loadFromFile(Ljava/io/InputStream;)[B

    move-result-object v10

    move-object/from16 v0, p0

    iput-object v10, v0, Lcom/keepassdroid/database/load/ImporterV4;->hashOfHeader:[B

    .line 103
    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/keepassdroid/database/load/ImporterV4;->db:Lcom/keepassdroid/database/PwDatabaseV4;

    move-object/from16 v0, p2

    move-object/from16 v1, p3

    invoke-virtual {v10, v0, v1}, Lcom/keepassdroid/database/PwDatabaseV4;->setMasterKey(Ljava/lang/String;Ljava/io/InputStream;)V

    .line 104
    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/keepassdroid/database/load/ImporterV4;->db:Lcom/keepassdroid/database/PwDatabaseV4;

    iget-object v11, v8, Lcom/keepassdroid/database/PwDbHeaderV4;->masterSeed:[B

    iget-object v12, v8, Lcom/keepassdroid/database/PwDbHeaderV4;->transformSeed:[B

    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/keepassdroid/database/load/ImporterV4;->db:Lcom/keepassdroid/database/PwDatabaseV4;

    iget-wide v14, v13, Lcom/keepassdroid/database/PwDatabaseV4;->numKeyEncRounds:J

    long-to-int v13, v14

    invoke-virtual {v10, v11, v12, v13}, Lcom/keepassdroid/database/PwDatabaseV4;->makeFinalKey([B[BI)V

    .line 109
    :try_start_0
    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/keepassdroid/database/load/ImporterV4;->db:Lcom/keepassdroid/database/PwDatabaseV4;

    iget-object v10, v10, Lcom/keepassdroid/database/PwDatabaseV4;->dataCipher:Ljava/util/UUID;

    const/4 v11, 0x2

    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/keepassdroid/database/load/ImporterV4;->db:Lcom/keepassdroid/database/PwDatabaseV4;

    iget-object v12, v12, Lcom/keepassdroid/database/PwDatabaseV4;->finalKey:[B

    iget-object v13, v8, Lcom/keepassdroid/database/PwDbHeaderV4;->encryptionIV:[B

    invoke-static {v10, v11, v12, v13}, Lcom/keepassdroid/crypto/CipherFactory;->getInstance(Ljava/util/UUID;I[B[B)Ljavax/crypto/Cipher;
    :try_end_0
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljavax/crypto/NoSuchPaddingException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/security/InvalidKeyException; {:try_start_0 .. :try_end_0} :catch_3
    .catch Ljava/security/InvalidAlgorithmParameterException; {:try_start_0 .. :try_end_0} :catch_4

    move-result-object v2

    .line 120
    .local v2, "cipher":Ljavax/crypto/Cipher;
    new-instance v5, Lcom/keepassdroid/stream/BetterCipherInputStream;

    const v10, 0xc800

    move-object/from16 v0, p1

    invoke-direct {v5, v0, v2, v10}, Lcom/keepassdroid/stream/BetterCipherInputStream;-><init>(Ljava/io/InputStream;Ljavax/crypto/Cipher;I)V

    .line 121
    .local v5, "decrypted":Ljava/io/InputStream;
    new-instance v3, Lcom/keepassdroid/stream/LEDataInputStream;

    invoke-direct {v3, v5}, Lcom/keepassdroid/stream/LEDataInputStream;-><init>(Ljava/io/InputStream;)V

    .line 122
    .local v3, "dataDecrypted":Lcom/keepassdroid/stream/LEDataInputStream;
    const/4 v9, 0x0

    .line 124
    .local v9, "storedStartBytes":[B
    const/16 v10, 0x20

    :try_start_1
    invoke-virtual {v3, v10}, Lcom/keepassdroid/stream/LEDataInputStream;->readBytes(I)[B

    move-result-object v9

    .line 125
    if-eqz v9, :cond_0

    array-length v10, v9

    const/16 v11, 0x20

    if-eq v10, v11, :cond_1

    .line 126
    :cond_0
    new-instance v10, Lcom/keepassdroid/database/exception/InvalidPasswordException;

    invoke-direct {v10}, Lcom/keepassdroid/database/exception/InvalidPasswordException;-><init>()V

    throw v10
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    .line 128
    :catch_0
    move-exception v6

    .line 129
    .local v6, "e":Ljava/io/IOException;
    new-instance v10, Lcom/keepassdroid/database/exception/InvalidPasswordException;

    invoke-direct {v10}, Lcom/keepassdroid/database/exception/InvalidPasswordException;-><init>()V

    throw v10

    .line 110
    .end local v2    # "cipher":Ljavax/crypto/Cipher;
    .end local v3    # "dataDecrypted":Lcom/keepassdroid/stream/LEDataInputStream;
    .end local v5    # "decrypted":Ljava/io/InputStream;
    .end local v6    # "e":Ljava/io/IOException;
    .end local v9    # "storedStartBytes":[B
    :catch_1
    move-exception v6

    .line 111
    .local v6, "e":Ljava/security/NoSuchAlgorithmException;
    new-instance v10, Ljava/io/IOException;

    const-string v11, "Invalid algorithm."

    invoke-direct {v10, v11}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v10

    .line 112
    .end local v6    # "e":Ljava/security/NoSuchAlgorithmException;
    :catch_2
    move-exception v6

    .line 113
    .local v6, "e":Ljavax/crypto/NoSuchPaddingException;
    new-instance v10, Ljava/io/IOException;

    const-string v11, "Invalid algorithm."

    invoke-direct {v10, v11}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v10

    .line 114
    .end local v6    # "e":Ljavax/crypto/NoSuchPaddingException;
    :catch_3
    move-exception v6

    .line 115
    .local v6, "e":Ljava/security/InvalidKeyException;
    new-instance v10, Ljava/io/IOException;

    const-string v11, "Invalid algorithm."

    invoke-direct {v10, v11}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v10

    .line 116
    .end local v6    # "e":Ljava/security/InvalidKeyException;
    :catch_4
    move-exception v6

    .line 117
    .local v6, "e":Ljava/security/InvalidAlgorithmParameterException;
    new-instance v10, Ljava/io/IOException;

    const-string v11, "Invalid algorithm."

    invoke-direct {v10, v11}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v10

    .line 132
    .end local v6    # "e":Ljava/security/InvalidAlgorithmParameterException;
    .restart local v2    # "cipher":Ljavax/crypto/Cipher;
    .restart local v3    # "dataDecrypted":Lcom/keepassdroid/stream/LEDataInputStream;
    .restart local v5    # "decrypted":Ljava/io/InputStream;
    .restart local v9    # "storedStartBytes":[B
    :cond_1
    iget-object v10, v8, Lcom/keepassdroid/database/PwDbHeaderV4;->streamStartBytes:[B

    invoke-static {v9, v10}, Ljava/util/Arrays;->equals([B[B)Z

    move-result v10

    if-nez v10, :cond_2

    .line 133
    new-instance v10, Lcom/keepassdroid/database/exception/InvalidPasswordException;

    invoke-direct {v10}, Lcom/keepassdroid/database/exception/InvalidPasswordException;-><init>()V

    throw v10

    .line 136
    :cond_2
    new-instance v7, Lcom/keepassdroid/stream/HashedBlockInputStream;

    invoke-direct {v7, v3}, Lcom/keepassdroid/stream/HashedBlockInputStream;-><init>(Ljava/io/InputStream;)V

    .line 139
    .local v7, "hashed":Lcom/keepassdroid/stream/HashedBlockInputStream;
    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/keepassdroid/database/load/ImporterV4;->db:Lcom/keepassdroid/database/PwDatabaseV4;

    iget-object v10, v10, Lcom/keepassdroid/database/PwDatabaseV4;->compressionAlgorithm:Lcom/keepassdroid/database/PwCompressionAlgorithm;

    sget-object v11, Lcom/keepassdroid/database/PwCompressionAlgorithm;->Gzip:Lcom/keepassdroid/database/PwCompressionAlgorithm;

    if-ne v10, v11, :cond_3

    .line 140
    new-instance v4, Ljava/util/zip/GZIPInputStream;

    invoke-direct {v4, v7}, Ljava/util/zip/GZIPInputStream;-><init>(Ljava/io/InputStream;)V

    .line 145
    .local v4, "decompressed":Ljava/io/InputStream;
    :goto_0
    iget-object v10, v8, Lcom/keepassdroid/database/PwDbHeaderV4;->protectedStreamKey:[B

    if-nez v10, :cond_5

    .line 146
    sget-boolean v10, Lcom/keepassdroid/database/load/ImporterV4;->$assertionsDisabled:Z

    if-nez v10, :cond_4

    new-instance v10, Ljava/lang/AssertionError;

    invoke-direct {v10}, Ljava/lang/AssertionError;-><init>()V

    throw v10

    .line 142
    .end local v4    # "decompressed":Ljava/io/InputStream;
    :cond_3
    move-object v4, v7

    .restart local v4    # "decompressed":Ljava/io/InputStream;
    goto :goto_0

    .line 147
    :cond_4
    new-instance v10, Ljava/io/IOException;

    const-string v11, "Invalid stream key."

    invoke-direct {v10, v11}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v10

    .line 150
    :cond_5
    iget-object v10, v8, Lcom/keepassdroid/database/PwDbHeaderV4;->innerRandomStream:Lcom/keepassdroid/database/CrsAlgorithm;

    iget-object v11, v8, Lcom/keepassdroid/database/PwDbHeaderV4;->protectedStreamKey:[B

    invoke-static {v10, v11}, Lcom/keepassdroid/crypto/PwStreamCipherFactory;->getInstance(Lcom/keepassdroid/database/CrsAlgorithm;[B)Lorg/bouncycastle/crypto/StreamCipher;

    move-result-object v10

    move-object/from16 v0, p0

    iput-object v10, v0, Lcom/keepassdroid/database/load/ImporterV4;->randomStream:Lorg/bouncycastle/crypto/StreamCipher;

    .line 152
    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/keepassdroid/database/load/ImporterV4;->randomStream:Lorg/bouncycastle/crypto/StreamCipher;

    if-nez v10, :cond_6

    .line 153
    new-instance v10, Lcom/keepassdroid/database/exception/ArcFourException;

    invoke-direct {v10}, Lcom/keepassdroid/database/exception/ArcFourException;-><init>()V

    throw v10

    .line 156
    :cond_6
    move-object/from16 v0, p0

    invoke-direct {v0, v4}, Lcom/keepassdroid/database/load/ImporterV4;->ReadXmlStreamed(Ljava/io/InputStream;)V

    .line 158
    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/keepassdroid/database/load/ImporterV4;->db:Lcom/keepassdroid/database/PwDatabaseV4;

    return-object v10
.end method
