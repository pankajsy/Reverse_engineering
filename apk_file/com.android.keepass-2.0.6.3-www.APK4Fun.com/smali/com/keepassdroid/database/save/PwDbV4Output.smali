.class public Lcom/keepassdroid/database/save/PwDbV4Output;
.super Lcom/keepassdroid/database/save/PwDbOutput;
.source "PwDbV4Output.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/keepassdroid/database/save/PwDbV4Output$EntryWriter;,
        Lcom/keepassdroid/database/save/PwDbV4Output$GroupWriter;
    }
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z


# instance fields
.field private binPool:Lcom/keepassdroid/database/BinaryPool;

.field private hashOfHeader:[B

.field private header:Lcom/keepassdroid/database/PwDbHeaderV4;

.field mPM:Lcom/keepassdroid/database/PwDatabaseV4;

.field private randomStream:Lorg/bouncycastle/crypto/StreamCipher;

.field private xml:Lorg/xmlpull/v1/XmlSerializer;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 73
    const-class v0, Lcom/keepassdroid/database/save/PwDbV4Output;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    sput-boolean v0, Lcom/keepassdroid/database/save/PwDbV4Output;->$assertionsDisabled:Z

    return-void

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method protected constructor <init>(Lcom/keepassdroid/database/PwDatabaseV4;Ljava/io/OutputStream;)V
    .locals 0
    .param p1, "pm"    # Lcom/keepassdroid/database/PwDatabaseV4;
    .param p2, "os"    # Ljava/io/OutputStream;

    .prologue
    .line 83
    invoke-direct {p0, p2}, Lcom/keepassdroid/database/save/PwDbOutput;-><init>(Ljava/io/OutputStream;)V

    .line 85
    iput-object p1, p0, Lcom/keepassdroid/database/save/PwDbV4Output;->mPM:Lcom/keepassdroid/database/PwDatabaseV4;

    .line 86
    return-void
.end method

.method static synthetic access$000(Lcom/keepassdroid/database/save/PwDbV4Output;Lcom/keepassdroid/database/PwGroupV4;)V
    .locals 0
    .param p0, "x0"    # Lcom/keepassdroid/database/save/PwDbV4Output;
    .param p1, "x1"    # Lcom/keepassdroid/database/PwGroupV4;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;,
            Ljava/lang/IllegalStateException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 73
    invoke-direct {p0, p1}, Lcom/keepassdroid/database/save/PwDbV4Output;->startGroup(Lcom/keepassdroid/database/PwGroupV4;)V

    return-void
.end method

.method static synthetic access$100(Lcom/keepassdroid/database/save/PwDbV4Output;)V
    .locals 0
    .param p0, "x0"    # Lcom/keepassdroid/database/save/PwDbV4Output;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;,
            Ljava/lang/IllegalStateException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 73
    invoke-direct {p0}, Lcom/keepassdroid/database/save/PwDbV4Output;->endGroup()V

    return-void
.end method

.method static synthetic access$200(Lcom/keepassdroid/database/save/PwDbV4Output;Lcom/keepassdroid/database/PwEntryV4;Z)V
    .locals 0
    .param p0, "x0"    # Lcom/keepassdroid/database/save/PwDbV4Output;
    .param p1, "x1"    # Lcom/keepassdroid/database/PwEntryV4;
    .param p2, "x2"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;,
            Ljava/lang/IllegalStateException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 73
    invoke-direct {p0, p1, p2}, Lcom/keepassdroid/database/save/PwDbV4Output;->writeEntry(Lcom/keepassdroid/database/PwEntryV4;Z)V

    return-void
.end method

.method private attachStreamEncryptor(Lcom/keepassdroid/database/PwDbHeaderV4;Ljava/io/OutputStream;)Ljavax/crypto/CipherOutputStream;
    .locals 8
    .param p1, "header"    # Lcom/keepassdroid/database/PwDbHeaderV4;
    .param p2, "os"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/keepassdroid/database/exception/PwDbOutputException;
        }
    .end annotation

    .prologue
    .line 249
    :try_start_0
    iget-object v3, p0, Lcom/keepassdroid/database/save/PwDbV4Output;->mPM:Lcom/keepassdroid/database/PwDatabaseV4;

    iget-object v4, p1, Lcom/keepassdroid/database/PwDbHeaderV4;->masterSeed:[B

    iget-object v5, p1, Lcom/keepassdroid/database/PwDbHeaderV4;->transformSeed:[B

    iget-object v6, p0, Lcom/keepassdroid/database/save/PwDbV4Output;->mPM:Lcom/keepassdroid/database/PwDatabaseV4;

    iget-wide v6, v6, Lcom/keepassdroid/database/PwDatabaseV4;->numKeyEncRounds:J

    long-to-int v6, v6

    invoke-virtual {v3, v4, v5, v6}, Lcom/keepassdroid/database/PwDatabaseV4;->makeFinalKey([B[BI)V

    .line 250
    iget-object v3, p0, Lcom/keepassdroid/database/save/PwDbV4Output;->mPM:Lcom/keepassdroid/database/PwDatabaseV4;

    iget-object v3, v3, Lcom/keepassdroid/database/PwDatabaseV4;->dataCipher:Ljava/util/UUID;

    const/4 v4, 0x1

    iget-object v5, p0, Lcom/keepassdroid/database/save/PwDbV4Output;->mPM:Lcom/keepassdroid/database/PwDatabaseV4;

    iget-object v5, v5, Lcom/keepassdroid/database/PwDatabaseV4;->finalKey:[B

    iget-object v6, p1, Lcom/keepassdroid/database/PwDbHeaderV4;->encryptionIV:[B

    invoke-static {v3, v4, v5, v6}, Lcom/keepassdroid/crypto/CipherFactory;->getInstance(Ljava/util/UUID;I[B[B)Ljavax/crypto/Cipher;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    .line 255
    .local v0, "cipher":Ljavax/crypto/Cipher;
    new-instance v1, Ljavax/crypto/CipherOutputStream;

    invoke-direct {v1, p2, v0}, Ljavax/crypto/CipherOutputStream;-><init>(Ljava/io/OutputStream;Ljavax/crypto/Cipher;)V

    .line 257
    .local v1, "cos":Ljavax/crypto/CipherOutputStream;
    return-object v1

    .line 251
    .end local v0    # "cipher":Ljavax/crypto/Cipher;
    .end local v1    # "cos":Ljavax/crypto/CipherOutputStream;
    :catch_0
    move-exception v2

    .line 252
    .local v2, "e":Ljava/lang/Exception;
    new-instance v3, Lcom/keepassdroid/database/exception/PwDbOutputException;

    const-string v4, "Invalid algorithm."

    invoke-direct {v3, v4}, Lcom/keepassdroid/database/exception/PwDbOutputException;-><init>(Ljava/lang/String;)V

    throw v3
.end method

.method private endGroup()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;,
            Ljava/lang/IllegalStateException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 318
    iget-object v0, p0, Lcom/keepassdroid/database/save/PwDbV4Output;->xml:Lorg/xmlpull/v1/XmlSerializer;

    const/4 v1, 0x0

    const-string v2, "Group"

    invoke-interface {v0, v1, v2}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 319
    return-void
.end method

.method private outputDatabase(Ljava/io/OutputStream;)V
    .locals 7
    .param p1, "os"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;,
            Ljava/lang/IllegalStateException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v6, 0x1

    const/4 v5, 0x0

    .line 168
    new-instance v3, Lcom/keepassdroid/database/BinaryPool;

    iget-object v2, p0, Lcom/keepassdroid/database/save/PwDbV4Output;->mPM:Lcom/keepassdroid/database/PwDatabaseV4;

    iget-object v2, v2, Lcom/keepassdroid/database/PwDatabaseV4;->rootGroup:Lcom/keepassdroid/database/PwGroup;

    check-cast v2, Lcom/keepassdroid/database/PwGroupV4;

    invoke-direct {v3, v2}, Lcom/keepassdroid/database/BinaryPool;-><init>(Lcom/keepassdroid/database/PwGroupV4;)V

    iput-object v3, p0, Lcom/keepassdroid/database/save/PwDbV4Output;->binPool:Lcom/keepassdroid/database/BinaryPool;

    .line 170
    invoke-static {}, Landroid/util/Xml;->newSerializer()Lorg/xmlpull/v1/XmlSerializer;

    move-result-object v2

    iput-object v2, p0, Lcom/keepassdroid/database/save/PwDbV4Output;->xml:Lorg/xmlpull/v1/XmlSerializer;

    .line 172
    iget-object v2, p0, Lcom/keepassdroid/database/save/PwDbV4Output;->xml:Lorg/xmlpull/v1/XmlSerializer;

    const-string v3, "UTF-8"

    invoke-interface {v2, p1, v3}, Lorg/xmlpull/v1/XmlSerializer;->setOutput(Ljava/io/OutputStream;Ljava/lang/String;)V

    .line 173
    iget-object v2, p0, Lcom/keepassdroid/database/save/PwDbV4Output;->xml:Lorg/xmlpull/v1/XmlSerializer;

    const-string v3, "UTF-8"

    invoke-static {v6}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    invoke-interface {v2, v3, v4}, Lorg/xmlpull/v1/XmlSerializer;->startDocument(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 175
    iget-object v2, p0, Lcom/keepassdroid/database/save/PwDbV4Output;->xml:Lorg/xmlpull/v1/XmlSerializer;

    const-string v3, "KeePassFile"

    invoke-interface {v2, v5, v3}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 177
    invoke-direct {p0}, Lcom/keepassdroid/database/save/PwDbV4Output;->writeMeta()V

    .line 179
    iget-object v2, p0, Lcom/keepassdroid/database/save/PwDbV4Output;->mPM:Lcom/keepassdroid/database/PwDatabaseV4;

    iget-object v1, v2, Lcom/keepassdroid/database/PwDatabaseV4;->rootGroup:Lcom/keepassdroid/database/PwGroup;

    check-cast v1, Lcom/keepassdroid/database/PwGroupV4;

    .line 180
    .local v1, "root":Lcom/keepassdroid/database/PwGroupV4;
    iget-object v2, p0, Lcom/keepassdroid/database/save/PwDbV4Output;->xml:Lorg/xmlpull/v1/XmlSerializer;

    const-string v3, "Root"

    invoke-interface {v2, v5, v3}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 181
    invoke-direct {p0, v1}, Lcom/keepassdroid/database/save/PwDbV4Output;->startGroup(Lcom/keepassdroid/database/PwGroupV4;)V

    .line 182
    new-instance v0, Ljava/util/Stack;

    invoke-direct {v0}, Ljava/util/Stack;-><init>()V

    .line 183
    .local v0, "groupStack":Ljava/util/Stack;, "Ljava/util/Stack<Lcom/keepassdroid/database/PwGroupV4;>;"
    invoke-virtual {v0, v1}, Ljava/util/Stack;->push(Ljava/lang/Object;)Ljava/lang/Object;

    .line 185
    new-instance v2, Lcom/keepassdroid/database/save/PwDbV4Output$GroupWriter;

    invoke-direct {v2, p0, v0}, Lcom/keepassdroid/database/save/PwDbV4Output$GroupWriter;-><init>(Lcom/keepassdroid/database/save/PwDbV4Output;Ljava/util/Stack;)V

    new-instance v3, Lcom/keepassdroid/database/save/PwDbV4Output$EntryWriter;

    invoke-direct {v3, p0, v5}, Lcom/keepassdroid/database/save/PwDbV4Output$EntryWriter;-><init>(Lcom/keepassdroid/database/save/PwDbV4Output;Lcom/keepassdroid/database/save/PwDbV4Output$1;)V

    invoke-virtual {v1, v2, v3}, Lcom/keepassdroid/database/PwGroupV4;->preOrderTraverseTree(Lcom/keepassdroid/database/GroupHandler;Lcom/keepassdroid/database/EntryHandler;)Z

    move-result v2

    if-nez v2, :cond_0

    new-instance v2, Ljava/lang/RuntimeException;

    const-string v3, "Writing groups failed"

    invoke-direct {v2, v3}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 187
    :cond_0
    :goto_0
    invoke-virtual {v0}, Ljava/util/Stack;->size()I

    move-result v2

    if-le v2, v6, :cond_1

    .line 188
    iget-object v2, p0, Lcom/keepassdroid/database/save/PwDbV4Output;->xml:Lorg/xmlpull/v1/XmlSerializer;

    const-string v3, "Group"

    invoke-interface {v2, v5, v3}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 189
    invoke-virtual {v0}, Ljava/util/Stack;->pop()Ljava/lang/Object;

    goto :goto_0

    .line 192
    :cond_1
    invoke-direct {p0}, Lcom/keepassdroid/database/save/PwDbV4Output;->endGroup()V

    .line 194
    const-string v2, "DeletedObjects"

    iget-object v3, p0, Lcom/keepassdroid/database/save/PwDbV4Output;->mPM:Lcom/keepassdroid/database/PwDatabaseV4;

    iget-object v3, v3, Lcom/keepassdroid/database/PwDatabaseV4;->deletedObjects:Ljava/util/List;

    invoke-direct {p0, v2, v3}, Lcom/keepassdroid/database/save/PwDbV4Output;->writeList(Ljava/lang/String;Ljava/util/List;)V

    .line 196
    iget-object v2, p0, Lcom/keepassdroid/database/save/PwDbV4Output;->xml:Lorg/xmlpull/v1/XmlSerializer;

    const-string v3, "Root"

    invoke-interface {v2, v5, v3}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 198
    iget-object v2, p0, Lcom/keepassdroid/database/save/PwDbV4Output;->xml:Lorg/xmlpull/v1/XmlSerializer;

    const-string v3, "KeePassFile"

    invoke-interface {v2, v5, v3}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 199
    iget-object v2, p0, Lcom/keepassdroid/database/save/PwDbV4Output;->xml:Lorg/xmlpull/v1/XmlSerializer;

    invoke-interface {v2}, Lorg/xmlpull/v1/XmlSerializer;->endDocument()V

    .line 201
    return-void
.end method

.method private safeXmlString(Ljava/lang/String;)Ljava/lang/String;
    .locals 4
    .param p1, "text"    # Ljava/lang/String;

    .prologue
    .line 670
    invoke-static {p1}, Lcom/keepassdroid/utils/EmptyUtils;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 689
    .end local p1    # "text":Ljava/lang/String;
    :goto_0
    return-object p1

    .line 674
    .restart local p1    # "text":Ljava/lang/String;
    :cond_0
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 677
    .local v2, "sb":Ljava/lang/StringBuilder;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v3

    if-ge v1, v3, :cond_4

    .line 678
    invoke-virtual {p1, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 680
    .local v0, "ch":C
    const/16 v3, 0x20

    if-lt v0, v3, :cond_1

    const v3, 0xd7ff

    if-le v0, v3, :cond_2

    :cond_1
    const/16 v3, 0x9

    if-eq v0, v3, :cond_2

    const/16 v3, 0xa

    if-eq v0, v3, :cond_2

    const/16 v3, 0xd

    if-eq v0, v3, :cond_2

    const v3, 0xe000

    if-lt v0, v3, :cond_3

    const v3, 0xfffd

    if-gt v0, v3, :cond_3

    .line 684
    :cond_2
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 677
    :cond_3
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 689
    .end local v0    # "ch":C
    :cond_4
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    goto :goto_0
.end method

.method private startGroup(Lcom/keepassdroid/database/PwGroupV4;)V
    .locals 4
    .param p1, "group"    # Lcom/keepassdroid/database/PwGroupV4;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;,
            Ljava/lang/IllegalStateException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 298
    iget-object v0, p0, Lcom/keepassdroid/database/save/PwDbV4Output;->xml:Lorg/xmlpull/v1/XmlSerializer;

    const/4 v1, 0x0

    const-string v2, "Group"

    invoke-interface {v0, v1, v2}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 299
    const-string v0, "UUID"

    iget-object v1, p1, Lcom/keepassdroid/database/PwGroupV4;->uuid:Ljava/util/UUID;

    invoke-direct {p0, v0, v1}, Lcom/keepassdroid/database/save/PwDbV4Output;->writeObject(Ljava/lang/String;Ljava/util/UUID;)V

    .line 300
    const-string v0, "Name"

    iget-object v1, p1, Lcom/keepassdroid/database/PwGroupV4;->name:Ljava/lang/String;

    invoke-direct {p0, v0, v1}, Lcom/keepassdroid/database/save/PwDbV4Output;->writeObject(Ljava/lang/String;Ljava/lang/String;)V

    .line 301
    const-string v0, "Notes"

    iget-object v1, p1, Lcom/keepassdroid/database/PwGroupV4;->notes:Ljava/lang/String;

    invoke-direct {p0, v0, v1}, Lcom/keepassdroid/database/save/PwDbV4Output;->writeObject(Ljava/lang/String;Ljava/lang/String;)V

    .line 302
    const-string v0, "IconID"

    iget-object v1, p1, Lcom/keepassdroid/database/PwGroupV4;->icon:Lcom/keepassdroid/database/PwIconStandard;

    iget v1, v1, Lcom/keepassdroid/database/PwIconStandard;->iconId:I

    int-to-long v2, v1

    invoke-direct {p0, v0, v2, v3}, Lcom/keepassdroid/database/save/PwDbV4Output;->writeObject(Ljava/lang/String;J)V

    .line 304
    iget-object v0, p1, Lcom/keepassdroid/database/PwGroupV4;->customIcon:Lcom/keepassdroid/database/PwIconCustom;

    sget-object v1, Lcom/keepassdroid/database/PwIconCustom;->ZERO:Lcom/keepassdroid/database/PwIconCustom;

    invoke-virtual {v0, v1}, Lcom/keepassdroid/database/PwIconCustom;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 305
    const-string v0, "CustomIconUUID"

    iget-object v1, p1, Lcom/keepassdroid/database/PwGroupV4;->customIcon:Lcom/keepassdroid/database/PwIconCustom;

    iget-object v1, v1, Lcom/keepassdroid/database/PwIconCustom;->uuid:Ljava/util/UUID;

    invoke-direct {p0, v0, v1}, Lcom/keepassdroid/database/save/PwDbV4Output;->writeObject(Ljava/lang/String;Ljava/util/UUID;)V

    .line 308
    :cond_0
    const-string v0, "Times"

    invoke-direct {p0, v0, p1}, Lcom/keepassdroid/database/save/PwDbV4Output;->writeList(Ljava/lang/String;Lcom/keepassdroid/database/ITimeLogger;)V

    .line 309
    const-string v0, "IsExpanded"

    iget-boolean v1, p1, Lcom/keepassdroid/database/PwGroupV4;->isExpanded:Z

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lcom/keepassdroid/database/save/PwDbV4Output;->writeObject(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 310
    const-string v0, "DefaultAutoTypeSequence"

    iget-object v1, p1, Lcom/keepassdroid/database/PwGroupV4;->defaultAutoTypeSequence:Ljava/lang/String;

    invoke-direct {p0, v0, v1}, Lcom/keepassdroid/database/save/PwDbV4Output;->writeObject(Ljava/lang/String;Ljava/lang/String;)V

    .line 311
    const-string v0, "EnableAutoType"

    iget-object v1, p1, Lcom/keepassdroid/database/PwGroupV4;->enableAutoType:Ljava/lang/Boolean;

    invoke-direct {p0, v0, v1}, Lcom/keepassdroid/database/save/PwDbV4Output;->writeObject(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 312
    const-string v0, "EnableSearching"

    iget-object v1, p1, Lcom/keepassdroid/database/PwGroupV4;->enableSearching:Ljava/lang/Boolean;

    invoke-direct {p0, v0, v1}, Lcom/keepassdroid/database/save/PwDbV4Output;->writeObject(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 313
    const-string v0, "LastTopVisibleEntry"

    iget-object v1, p1, Lcom/keepassdroid/database/PwGroupV4;->lastTopVisibleEntry:Ljava/util/UUID;

    invoke-direct {p0, v0, v1}, Lcom/keepassdroid/database/save/PwDbV4Output;->writeObject(Ljava/lang/String;Ljava/util/UUID;)V

    .line 315
    return-void
.end method

.method private subWriteValue(Lcom/keepassdroid/database/security/ProtectedBinary;)V
    .locals 9
    .param p1, "value"    # Lcom/keepassdroid/database/security/ProtectedBinary;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;,
            Ljava/lang/IllegalStateException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v8, 0x0

    const/4 v2, 0x0

    .line 380
    invoke-virtual {p1}, Lcom/keepassdroid/database/security/ProtectedBinary;->isProtected()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 381
    iget-object v0, p0, Lcom/keepassdroid/database/save/PwDbV4Output;->xml:Lorg/xmlpull/v1/XmlSerializer;

    const-string v1, "Protected"

    const-string v5, "True"

    invoke-interface {v0, v8, v1, v5}, Lorg/xmlpull/v1/XmlSerializer;->attribute(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 383
    invoke-virtual {p1}, Lcom/keepassdroid/database/security/ProtectedBinary;->length()I

    move-result v3

    .line 384
    .local v3, "valLength":I
    if-lez v3, :cond_0

    .line 385
    new-array v4, v3, [B

    .line 386
    .local v4, "encoded":[B
    iget-object v0, p0, Lcom/keepassdroid/database/save/PwDbV4Output;->randomStream:Lorg/bouncycastle/crypto/StreamCipher;

    invoke-virtual {p1}, Lcom/keepassdroid/database/security/ProtectedBinary;->getData()[B

    move-result-object v1

    move v5, v2

    invoke-interface/range {v0 .. v5}, Lorg/bouncycastle/crypto/StreamCipher;->processBytes([BII[BI)V

    .line 388
    iget-object v0, p0, Lcom/keepassdroid/database/save/PwDbV4Output;->xml:Lorg/xmlpull/v1/XmlSerializer;

    invoke-static {v4}, Lbiz/source_code/base64Coder/Base64Coder;->encode([B)[C

    move-result-object v1

    invoke-static {v1}, Ljava/lang/String;->valueOf([C)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lorg/xmlpull/v1/XmlSerializer;->text(Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 403
    .end local v3    # "valLength":I
    .end local v4    # "encoded":[B
    :cond_0
    :goto_0
    return-void

    .line 392
    :cond_1
    iget-object v0, p0, Lcom/keepassdroid/database/save/PwDbV4Output;->mPM:Lcom/keepassdroid/database/PwDatabaseV4;

    iget-object v0, v0, Lcom/keepassdroid/database/PwDatabaseV4;->compressionAlgorithm:Lcom/keepassdroid/database/PwCompressionAlgorithm;

    sget-object v1, Lcom/keepassdroid/database/PwCompressionAlgorithm;->Gzip:Lcom/keepassdroid/database/PwCompressionAlgorithm;

    if-ne v0, v1, :cond_2

    .line 393
    iget-object v0, p0, Lcom/keepassdroid/database/save/PwDbV4Output;->xml:Lorg/xmlpull/v1/XmlSerializer;

    const-string v1, "Compressed"

    const-string v2, "True"

    invoke-interface {v0, v8, v1, v2}, Lorg/xmlpull/v1/XmlSerializer;->attribute(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 394
    invoke-virtual {p1}, Lcom/keepassdroid/database/security/ProtectedBinary;->getData()[B

    move-result-object v7

    .line 395
    .local v7, "raw":[B
    invoke-static {v7}, Lcom/keepassdroid/utils/MemUtil;->compress([B)[B

    move-result-object v6

    .line 396
    .local v6, "compressed":[B
    iget-object v0, p0, Lcom/keepassdroid/database/save/PwDbV4Output;->xml:Lorg/xmlpull/v1/XmlSerializer;

    invoke-static {v6}, Lbiz/source_code/base64Coder/Base64Coder;->encode([B)[C

    move-result-object v1

    invoke-static {v1}, Ljava/lang/String;->valueOf([C)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lorg/xmlpull/v1/XmlSerializer;->text(Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    goto :goto_0

    .line 398
    .end local v6    # "compressed":[B
    .end local v7    # "raw":[B
    :cond_2
    invoke-virtual {p1}, Lcom/keepassdroid/database/security/ProtectedBinary;->getData()[B

    move-result-object v7

    .line 399
    .restart local v7    # "raw":[B
    iget-object v0, p0, Lcom/keepassdroid/database/save/PwDbV4Output;->xml:Lorg/xmlpull/v1/XmlSerializer;

    invoke-static {v7}, Lbiz/source_code/base64Coder/Base64Coder;->encode([B)[C

    move-result-object v1

    invoke-static {v1}, Ljava/lang/String;->valueOf([C)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lorg/xmlpull/v1/XmlSerializer;->text(Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    goto :goto_0
.end method

.method private writeBinPool()V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;,
            Ljava/lang/IllegalStateException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v5, 0x0

    .line 653
    iget-object v1, p0, Lcom/keepassdroid/database/save/PwDbV4Output;->xml:Lorg/xmlpull/v1/XmlSerializer;

    const-string v2, "Binaries"

    invoke-interface {v1, v5, v2}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 655
    iget-object v1, p0, Lcom/keepassdroid/database/save/PwDbV4Output;->binPool:Lcom/keepassdroid/database/BinaryPool;

    invoke-virtual {v1}, Lcom/keepassdroid/database/BinaryPool;->entrySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 656
    .local v0, "pair":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Lcom/keepassdroid/database/security/ProtectedBinary;>;"
    iget-object v1, p0, Lcom/keepassdroid/database/save/PwDbV4Output;->xml:Lorg/xmlpull/v1/XmlSerializer;

    const-string v3, "Binary"

    invoke-interface {v1, v5, v3}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 657
    iget-object v3, p0, Lcom/keepassdroid/database/save/PwDbV4Output;->xml:Lorg/xmlpull/v1/XmlSerializer;

    const-string v4, "ID"

    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-interface {v3, v5, v4, v1}, Lorg/xmlpull/v1/XmlSerializer;->attribute(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 659
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/keepassdroid/database/security/ProtectedBinary;

    invoke-direct {p0, v1}, Lcom/keepassdroid/database/save/PwDbV4Output;->subWriteValue(Lcom/keepassdroid/database/security/ProtectedBinary;)V

    .line 661
    iget-object v1, p0, Lcom/keepassdroid/database/save/PwDbV4Output;->xml:Lorg/xmlpull/v1/XmlSerializer;

    const-string v3, "Binary"

    invoke-interface {v1, v5, v3}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    goto :goto_0

    .line 665
    .end local v0    # "pair":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Lcom/keepassdroid/database/security/ProtectedBinary;>;"
    :cond_0
    iget-object v1, p0, Lcom/keepassdroid/database/save/PwDbV4Output;->xml:Lorg/xmlpull/v1/XmlSerializer;

    const-string v2, "Binaries"

    invoke-interface {v1, v5, v2}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 667
    return-void
.end method

.method private writeCustomIconList()V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;,
            Ljava/lang/IllegalStateException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v5, 0x0

    .line 635
    iget-object v2, p0, Lcom/keepassdroid/database/save/PwDbV4Output;->mPM:Lcom/keepassdroid/database/PwDatabaseV4;

    iget-object v0, v2, Lcom/keepassdroid/database/PwDatabaseV4;->customIcons:Ljava/util/List;

    .line 636
    .local v0, "customIcons":Ljava/util/List;, "Ljava/util/List<Lcom/keepassdroid/database/PwIconCustom;>;"
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v2

    if-nez v2, :cond_0

    .line 650
    :goto_0
    return-void

    .line 638
    :cond_0
    iget-object v2, p0, Lcom/keepassdroid/database/save/PwDbV4Output;->xml:Lorg/xmlpull/v1/XmlSerializer;

    const-string v3, "CustomIcons"

    invoke-interface {v2, v5, v3}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 640
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/keepassdroid/database/PwIconCustom;

    .line 641
    .local v1, "icon":Lcom/keepassdroid/database/PwIconCustom;
    iget-object v3, p0, Lcom/keepassdroid/database/save/PwDbV4Output;->xml:Lorg/xmlpull/v1/XmlSerializer;

    const-string v4, "Icon"

    invoke-interface {v3, v5, v4}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 643
    const-string v3, "UUID"

    iget-object v4, v1, Lcom/keepassdroid/database/PwIconCustom;->uuid:Ljava/util/UUID;

    invoke-direct {p0, v3, v4}, Lcom/keepassdroid/database/save/PwDbV4Output;->writeObject(Ljava/lang/String;Ljava/util/UUID;)V

    .line 644
    const-string v3, "Data"

    iget-object v4, v1, Lcom/keepassdroid/database/PwIconCustom;->imageData:[B

    invoke-static {v4}, Lbiz/source_code/base64Coder/Base64Coder;->encode([B)[C

    move-result-object v4

    invoke-static {v4}, Ljava/lang/String;->valueOf([C)Ljava/lang/String;

    move-result-object v4

    invoke-direct {p0, v3, v4}, Lcom/keepassdroid/database/save/PwDbV4Output;->writeObject(Ljava/lang/String;Ljava/lang/String;)V

    .line 646
    iget-object v3, p0, Lcom/keepassdroid/database/save/PwDbV4Output;->xml:Lorg/xmlpull/v1/XmlSerializer;

    const-string v4, "Icon"

    invoke-interface {v3, v5, v4}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    goto :goto_1

    .line 649
    .end local v1    # "icon":Lcom/keepassdroid/database/PwIconCustom;
    :cond_1
    iget-object v2, p0, Lcom/keepassdroid/database/save/PwDbV4Output;->xml:Lorg/xmlpull/v1/XmlSerializer;

    const-string v3, "CustomIcons"

    invoke-interface {v2, v5, v3}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    goto :goto_0
.end method

.method private writeEntry(Lcom/keepassdroid/database/PwEntryV4;Z)V
    .locals 6
    .param p1, "entry"    # Lcom/keepassdroid/database/PwEntryV4;
    .param p2, "isHistory"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;,
            Ljava/lang/IllegalStateException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v5, 0x0

    const/4 v4, 0x1

    .line 322
    sget-boolean v0, Lcom/keepassdroid/database/save/PwDbV4Output;->$assertionsDisabled:Z

    if-nez v0, :cond_0

    if-nez p1, :cond_0

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 324
    :cond_0
    iget-object v0, p0, Lcom/keepassdroid/database/save/PwDbV4Output;->xml:Lorg/xmlpull/v1/XmlSerializer;

    const-string v1, "Entry"

    invoke-interface {v0, v5, v1}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 326
    const-string v0, "UUID"

    iget-object v1, p1, Lcom/keepassdroid/database/PwEntryV4;->uuid:Ljava/util/UUID;

    invoke-direct {p0, v0, v1}, Lcom/keepassdroid/database/save/PwDbV4Output;->writeObject(Ljava/lang/String;Ljava/util/UUID;)V

    .line 327
    const-string v0, "IconID"

    iget-object v1, p1, Lcom/keepassdroid/database/PwEntryV4;->icon:Lcom/keepassdroid/database/PwIconStandard;

    iget v1, v1, Lcom/keepassdroid/database/PwIconStandard;->iconId:I

    int-to-long v2, v1

    invoke-direct {p0, v0, v2, v3}, Lcom/keepassdroid/database/save/PwDbV4Output;->writeObject(Ljava/lang/String;J)V

    .line 329
    iget-object v0, p1, Lcom/keepassdroid/database/PwEntryV4;->customIcon:Lcom/keepassdroid/database/PwIconCustom;

    sget-object v1, Lcom/keepassdroid/database/PwIconCustom;->ZERO:Lcom/keepassdroid/database/PwIconCustom;

    invoke-virtual {v0, v1}, Lcom/keepassdroid/database/PwIconCustom;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 330
    const-string v0, "CustomIconUUID"

    iget-object v1, p1, Lcom/keepassdroid/database/PwEntryV4;->customIcon:Lcom/keepassdroid/database/PwIconCustom;

    iget-object v1, v1, Lcom/keepassdroid/database/PwIconCustom;->uuid:Ljava/util/UUID;

    invoke-direct {p0, v0, v1}, Lcom/keepassdroid/database/save/PwDbV4Output;->writeObject(Ljava/lang/String;Ljava/util/UUID;)V

    .line 333
    :cond_1
    const-string v0, "ForegroundColor"

    iget-object v1, p1, Lcom/keepassdroid/database/PwEntryV4;->foregroundColor:Ljava/lang/String;

    invoke-direct {p0, v0, v1}, Lcom/keepassdroid/database/save/PwDbV4Output;->writeObject(Ljava/lang/String;Ljava/lang/String;)V

    .line 334
    const-string v0, "BackgroundColor"

    iget-object v1, p1, Lcom/keepassdroid/database/PwEntryV4;->backgroupColor:Ljava/lang/String;

    invoke-direct {p0, v0, v1}, Lcom/keepassdroid/database/save/PwDbV4Output;->writeObject(Ljava/lang/String;Ljava/lang/String;)V

    .line 335
    const-string v0, "OverrideURL"

    iget-object v1, p1, Lcom/keepassdroid/database/PwEntryV4;->overrideURL:Ljava/lang/String;

    invoke-direct {p0, v0, v1}, Lcom/keepassdroid/database/save/PwDbV4Output;->writeObject(Ljava/lang/String;Ljava/lang/String;)V

    .line 336
    const-string v0, "Tags"

    iget-object v1, p1, Lcom/keepassdroid/database/PwEntryV4;->tags:Ljava/lang/String;

    invoke-direct {p0, v0, v1}, Lcom/keepassdroid/database/save/PwDbV4Output;->writeObject(Ljava/lang/String;Ljava/lang/String;)V

    .line 338
    const-string v0, "Times"

    invoke-direct {p0, v0, p1}, Lcom/keepassdroid/database/save/PwDbV4Output;->writeList(Ljava/lang/String;Lcom/keepassdroid/database/ITimeLogger;)V

    .line 340
    iget-object v0, p1, Lcom/keepassdroid/database/PwEntryV4;->strings:Ljava/util/HashMap;

    invoke-direct {p0, v0, v4}, Lcom/keepassdroid/database/save/PwDbV4Output;->writeList(Ljava/util/Map;Z)V

    .line 341
    iget-object v0, p1, Lcom/keepassdroid/database/PwEntryV4;->binaries:Ljava/util/HashMap;

    invoke-direct {p0, v0}, Lcom/keepassdroid/database/save/PwDbV4Output;->writeList(Ljava/util/Map;)V

    .line 342
    const-string v0, "AutoType"

    iget-object v1, p1, Lcom/keepassdroid/database/PwEntryV4;->autoType:Lcom/keepassdroid/database/PwEntryV4$AutoType;

    invoke-direct {p0, v0, v1}, Lcom/keepassdroid/database/save/PwDbV4Output;->writeList(Ljava/lang/String;Lcom/keepassdroid/database/PwEntryV4$AutoType;)V

    .line 344
    if-nez p2, :cond_3

    .line 345
    const-string v0, "History"

    iget-object v1, p1, Lcom/keepassdroid/database/PwEntryV4;->history:Ljava/util/ArrayList;

    invoke-direct {p0, v0, v1, v4}, Lcom/keepassdroid/database/save/PwDbV4Output;->writeList(Ljava/lang/String;Ljava/util/List;Z)V

    .line 350
    :cond_2
    iget-object v0, p0, Lcom/keepassdroid/database/save/PwDbV4Output;->xml:Lorg/xmlpull/v1/XmlSerializer;

    const-string v1, "Entry"

    invoke-interface {v0, v5, v1}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 351
    return-void

    .line 347
    :cond_3
    sget-boolean v0, Lcom/keepassdroid/database/save/PwDbV4Output;->$assertionsDisabled:Z

    if-nez v0, :cond_2

    iget-object v0, p1, Lcom/keepassdroid/database/PwEntryV4;->history:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-eqz v0, :cond_2

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0
.end method

.method private writeList(Ljava/lang/String;Lcom/keepassdroid/database/ITimeLogger;)V
    .locals 5
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "it"    # Lcom/keepassdroid/database/ITimeLogger;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;,
            Ljava/lang/IllegalStateException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x0

    .line 606
    sget-boolean v0, Lcom/keepassdroid/database/save/PwDbV4Output;->$assertionsDisabled:Z

    if-nez v0, :cond_1

    if-eqz p1, :cond_0

    if-nez p2, :cond_1

    :cond_0
    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 608
    :cond_1
    iget-object v0, p0, Lcom/keepassdroid/database/save/PwDbV4Output;->xml:Lorg/xmlpull/v1/XmlSerializer;

    invoke-interface {v0, v4, p1}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 610
    const-string v0, "LastModificationTime"

    invoke-interface {p2}, Lcom/keepassdroid/database/ITimeLogger;->getLastModificationTime()Ljava/util/Date;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lcom/keepassdroid/database/save/PwDbV4Output;->writeObject(Ljava/lang/String;Ljava/util/Date;)V

    .line 611
    const-string v0, "CreationTime"

    invoke-interface {p2}, Lcom/keepassdroid/database/ITimeLogger;->getCreationTime()Ljava/util/Date;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lcom/keepassdroid/database/save/PwDbV4Output;->writeObject(Ljava/lang/String;Ljava/util/Date;)V

    .line 612
    const-string v0, "LastAccessTime"

    invoke-interface {p2}, Lcom/keepassdroid/database/ITimeLogger;->getLastAccessTime()Ljava/util/Date;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lcom/keepassdroid/database/save/PwDbV4Output;->writeObject(Ljava/lang/String;Ljava/util/Date;)V

    .line 613
    const-string v0, "ExpiryTime"

    invoke-interface {p2}, Lcom/keepassdroid/database/ITimeLogger;->getExpiryTime()Ljava/util/Date;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lcom/keepassdroid/database/save/PwDbV4Output;->writeObject(Ljava/lang/String;Ljava/util/Date;)V

    .line 614
    const-string v0, "Expires"

    invoke-interface {p2}, Lcom/keepassdroid/database/ITimeLogger;->expires()Z

    move-result v1

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lcom/keepassdroid/database/save/PwDbV4Output;->writeObject(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 615
    const-string v0, "UsageCount"

    invoke-interface {p2}, Lcom/keepassdroid/database/ITimeLogger;->getUsageCount()J

    move-result-wide v2

    invoke-direct {p0, v0, v2, v3}, Lcom/keepassdroid/database/save/PwDbV4Output;->writeObject(Ljava/lang/String;J)V

    .line 616
    const-string v0, "LocationChanged"

    invoke-interface {p2}, Lcom/keepassdroid/database/ITimeLogger;->getLocationChanged()Ljava/util/Date;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lcom/keepassdroid/database/save/PwDbV4Output;->writeObject(Ljava/lang/String;Ljava/util/Date;)V

    .line 618
    iget-object v0, p0, Lcom/keepassdroid/database/save/PwDbV4Output;->xml:Lorg/xmlpull/v1/XmlSerializer;

    invoke-interface {v0, v4, p1}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 619
    return-void
.end method

.method private writeList(Ljava/lang/String;Lcom/keepassdroid/database/PwDatabaseV4$MemoryProtectionConfig;)V
    .locals 3
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Lcom/keepassdroid/database/PwDatabaseV4$MemoryProtectionConfig;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;,
            Ljava/lang/IllegalStateException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 577
    sget-boolean v0, Lcom/keepassdroid/database/save/PwDbV4Output;->$assertionsDisabled:Z

    if-nez v0, :cond_1

    if-eqz p1, :cond_0

    if-nez p2, :cond_1

    :cond_0
    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 579
    :cond_1
    iget-object v0, p0, Lcom/keepassdroid/database/save/PwDbV4Output;->xml:Lorg/xmlpull/v1/XmlSerializer;

    invoke-interface {v0, v2, p1}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 581
    const-string v0, "ProtectTitle"

    iget-boolean v1, p2, Lcom/keepassdroid/database/PwDatabaseV4$MemoryProtectionConfig;->protectTitle:Z

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lcom/keepassdroid/database/save/PwDbV4Output;->writeObject(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 582
    const-string v0, "ProtectUserName"

    iget-boolean v1, p2, Lcom/keepassdroid/database/PwDatabaseV4$MemoryProtectionConfig;->protectUserName:Z

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lcom/keepassdroid/database/save/PwDbV4Output;->writeObject(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 583
    const-string v0, "ProtectPassword"

    iget-boolean v1, p2, Lcom/keepassdroid/database/PwDatabaseV4$MemoryProtectionConfig;->protectPassword:Z

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lcom/keepassdroid/database/save/PwDbV4Output;->writeObject(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 584
    const-string v0, "ProtectURL"

    iget-boolean v1, p2, Lcom/keepassdroid/database/PwDatabaseV4$MemoryProtectionConfig;->protectUrl:Z

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lcom/keepassdroid/database/save/PwDbV4Output;->writeObject(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 585
    const-string v0, "ProtectNotes"

    iget-boolean v1, p2, Lcom/keepassdroid/database/PwDatabaseV4$MemoryProtectionConfig;->protectNotes:Z

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lcom/keepassdroid/database/save/PwDbV4Output;->writeObject(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 587
    iget-object v0, p0, Lcom/keepassdroid/database/save/PwDbV4Output;->xml:Lorg/xmlpull/v1/XmlSerializer;

    invoke-interface {v0, v2, p1}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 589
    return-void
.end method

.method private writeList(Ljava/lang/String;Lcom/keepassdroid/database/PwEntryV4$AutoType;)V
    .locals 9
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "autoType"    # Lcom/keepassdroid/database/PwEntryV4$AutoType;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;,
            Ljava/lang/IllegalStateException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v8, 0x0

    .line 465
    sget-boolean v0, Lcom/keepassdroid/database/save/PwDbV4Output;->$assertionsDisabled:Z

    if-nez v0, :cond_1

    if-eqz p1, :cond_0

    if-nez p2, :cond_1

    :cond_0
    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 467
    :cond_1
    iget-object v0, p0, Lcom/keepassdroid/database/save/PwDbV4Output;->xml:Lorg/xmlpull/v1/XmlSerializer;

    invoke-interface {v0, v8, p1}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 469
    const-string v0, "Enabled"

    iget-boolean v1, p2, Lcom/keepassdroid/database/PwEntryV4$AutoType;->enabled:Z

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lcom/keepassdroid/database/save/PwDbV4Output;->writeObject(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 470
    const-string v0, "DataTransferObfuscation"

    iget-wide v2, p2, Lcom/keepassdroid/database/PwEntryV4$AutoType;->obfuscationOptions:J

    invoke-direct {p0, v0, v2, v3}, Lcom/keepassdroid/database/save/PwDbV4Output;->writeObject(Ljava/lang/String;J)V

    .line 472
    iget-object v0, p2, Lcom/keepassdroid/database/PwEntryV4$AutoType;->defaultSequence:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_2

    .line 473
    const-string v0, "DefaultSequence"

    iget-object v1, p2, Lcom/keepassdroid/database/PwEntryV4$AutoType;->defaultSequence:Ljava/lang/String;

    const/4 v2, 0x1

    invoke-direct {p0, v0, v1, v2}, Lcom/keepassdroid/database/save/PwDbV4Output;->writeObject(Ljava/lang/String;Ljava/lang/String;Z)V

    .line 476
    :cond_2
    invoke-virtual {p2}, Lcom/keepassdroid/database/PwEntryV4$AutoType;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :goto_0
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/Map$Entry;

    .line 477
    .local v6, "pair":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v1, "Association"

    const-string v2, "Window"

    invoke-interface {v6}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    const-string v4, "KeystrokeSequence"

    invoke-interface {v6}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    move-object v0, p0

    invoke-direct/range {v0 .. v5}, Lcom/keepassdroid/database/save/PwDbV4Output;->writeObject(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 480
    .end local v6    # "pair":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_3
    iget-object v0, p0, Lcom/keepassdroid/database/save/PwDbV4Output;->xml:Lorg/xmlpull/v1/XmlSerializer;

    invoke-interface {v0, v8, p1}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 482
    return-void
.end method

.method private writeList(Ljava/lang/String;Ljava/util/List;)V
    .locals 4
    .param p1, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Lcom/keepassdroid/database/PwDeletedObject;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;,
            Ljava/lang/IllegalStateException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .local p2, "value":Ljava/util/List;, "Ljava/util/List<Lcom/keepassdroid/database/PwDeletedObject;>;"
    const/4 v3, 0x0

    .line 564
    sget-boolean v1, Lcom/keepassdroid/database/save/PwDbV4Output;->$assertionsDisabled:Z

    if-nez v1, :cond_1

    if-eqz p1, :cond_0

    if-nez p2, :cond_1

    :cond_0
    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1}, Ljava/lang/AssertionError;-><init>()V

    throw v1

    .line 566
    :cond_1
    iget-object v1, p0, Lcom/keepassdroid/database/save/PwDbV4Output;->xml:Lorg/xmlpull/v1/XmlSerializer;

    invoke-interface {v1, v3, p1}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 568
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/keepassdroid/database/PwDeletedObject;

    .line 569
    .local v0, "pdo":Lcom/keepassdroid/database/PwDeletedObject;
    const-string v2, "DeletedObject"

    invoke-direct {p0, v2, v0}, Lcom/keepassdroid/database/save/PwDbV4Output;->writeObject(Ljava/lang/String;Lcom/keepassdroid/database/PwDeletedObject;)V

    goto :goto_0

    .line 572
    .end local v0    # "pdo":Lcom/keepassdroid/database/PwDeletedObject;
    :cond_2
    iget-object v1, p0, Lcom/keepassdroid/database/save/PwDbV4Output;->xml:Lorg/xmlpull/v1/XmlSerializer;

    invoke-interface {v1, v3, p1}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 574
    return-void
.end method

.method private writeList(Ljava/lang/String;Ljava/util/List;Z)V
    .locals 4
    .param p1, "name"    # Ljava/lang/String;
    .param p3, "isHistory"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Lcom/keepassdroid/database/PwEntryV4;",
            ">;Z)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;,
            Ljava/lang/IllegalStateException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .local p2, "value":Ljava/util/List;, "Ljava/util/List<Lcom/keepassdroid/database/PwEntryV4;>;"
    const/4 v3, 0x0

    .line 622
    sget-boolean v1, Lcom/keepassdroid/database/save/PwDbV4Output;->$assertionsDisabled:Z

    if-nez v1, :cond_1

    if-eqz p1, :cond_0

    if-nez p2, :cond_1

    :cond_0
    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1}, Ljava/lang/AssertionError;-><init>()V

    throw v1

    .line 624
    :cond_1
    iget-object v1, p0, Lcom/keepassdroid/database/save/PwDbV4Output;->xml:Lorg/xmlpull/v1/XmlSerializer;

    invoke-interface {v1, v3, p1}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 626
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/keepassdroid/database/PwEntryV4;

    .line 627
    .local v0, "entry":Lcom/keepassdroid/database/PwEntryV4;
    invoke-direct {p0, v0, p3}, Lcom/keepassdroid/database/save/PwDbV4Output;->writeEntry(Lcom/keepassdroid/database/PwEntryV4;Z)V

    goto :goto_0

    .line 630
    .end local v0    # "entry":Lcom/keepassdroid/database/PwEntryV4;
    :cond_2
    iget-object v1, p0, Lcom/keepassdroid/database/save/PwDbV4Output;->xml:Lorg/xmlpull/v1/XmlSerializer;

    invoke-interface {v1, v3, p1}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 632
    return-void
.end method

.method private writeList(Ljava/lang/String;Ljava/util/Map;)V
    .locals 9
    .param p1, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;,
            Ljava/lang/IllegalStateException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .local p2, "customData":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const/4 v8, 0x0

    .line 592
    sget-boolean v0, Lcom/keepassdroid/database/save/PwDbV4Output;->$assertionsDisabled:Z

    if-nez v0, :cond_1

    if-eqz p1, :cond_0

    if-nez p2, :cond_1

    :cond_0
    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 594
    :cond_1
    iget-object v0, p0, Lcom/keepassdroid/database/save/PwDbV4Output;->xml:Lorg/xmlpull/v1/XmlSerializer;

    invoke-interface {v0, v8, p1}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 596
    invoke-interface {p2}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :goto_0
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/Map$Entry;

    .line 597
    .local v6, "pair":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v1, "Item"

    const-string v2, "Key"

    invoke-interface {v6}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    const-string v4, "Value"

    invoke-interface {v6}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    move-object v0, p0

    invoke-direct/range {v0 .. v5}, Lcom/keepassdroid/database/save/PwDbV4Output;->writeObject(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 601
    .end local v6    # "pair":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_2
    iget-object v0, p0, Lcom/keepassdroid/database/save/PwDbV4Output;->xml:Lorg/xmlpull/v1/XmlSerializer;

    invoke-interface {v0, v8, p1}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 603
    return-void
.end method

.method private writeList(Ljava/util/Map;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lcom/keepassdroid/database/security/ProtectedBinary;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;,
            Ljava/lang/IllegalStateException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 555
    .local p1, "binaries":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lcom/keepassdroid/database/security/ProtectedBinary;>;"
    sget-boolean v1, Lcom/keepassdroid/database/save/PwDbV4Output;->$assertionsDisabled:Z

    if-nez v1, :cond_0

    if-nez p1, :cond_0

    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1}, Ljava/lang/AssertionError;-><init>()V

    throw v1

    .line 557
    :cond_0
    invoke-interface {p1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 558
    .local v0, "pair":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Lcom/keepassdroid/database/security/ProtectedBinary;>;"
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/keepassdroid/database/security/ProtectedBinary;

    const/4 v4, 0x1

    invoke-direct {p0, v1, v2, v4}, Lcom/keepassdroid/database/save/PwDbV4Output;->writeObject(Ljava/lang/String;Lcom/keepassdroid/database/security/ProtectedBinary;Z)V

    goto :goto_0

    .line 560
    .end local v0    # "pair":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Lcom/keepassdroid/database/security/ProtectedBinary;>;"
    :cond_1
    return-void
.end method

.method private writeList(Ljava/util/Map;Z)V
    .locals 4
    .param p2, "isEntryString"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lcom/keepassdroid/database/security/ProtectedString;",
            ">;Z)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;,
            Ljava/lang/IllegalStateException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 485
    .local p1, "strings":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lcom/keepassdroid/database/security/ProtectedString;>;"
    sget-boolean v1, Lcom/keepassdroid/database/save/PwDbV4Output;->$assertionsDisabled:Z

    if-nez v1, :cond_0

    if-nez p1, :cond_0

    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1}, Ljava/lang/AssertionError;-><init>()V

    throw v1

    .line 487
    :cond_0
    invoke-interface {p1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 488
    .local v0, "pair":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Lcom/keepassdroid/database/security/ProtectedString;>;"
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/keepassdroid/database/security/ProtectedString;

    invoke-direct {p0, v1, v2, p2}, Lcom/keepassdroid/database/save/PwDbV4Output;->writeObject(Ljava/lang/String;Lcom/keepassdroid/database/security/ProtectedString;Z)V

    goto :goto_0

    .line 492
    .end local v0    # "pair":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Lcom/keepassdroid/database/security/ProtectedString;>;"
    :cond_1
    return-void
.end method

.method private writeMeta()V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;,
            Ljava/lang/IllegalStateException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x0

    const/4 v2, 0x1

    .line 204
    iget-object v0, p0, Lcom/keepassdroid/database/save/PwDbV4Output;->xml:Lorg/xmlpull/v1/XmlSerializer;

    const-string v1, "Meta"

    invoke-interface {v0, v4, v1}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 206
    const-string v0, "Generator"

    iget-object v1, p0, Lcom/keepassdroid/database/save/PwDbV4Output;->mPM:Lcom/keepassdroid/database/PwDatabaseV4;

    iget-object v1, v1, Lcom/keepassdroid/database/PwDatabaseV4;->localizedAppName:Ljava/lang/String;

    invoke-direct {p0, v0, v1}, Lcom/keepassdroid/database/save/PwDbV4Output;->writeObject(Ljava/lang/String;Ljava/lang/String;)V

    .line 208
    iget-object v0, p0, Lcom/keepassdroid/database/save/PwDbV4Output;->hashOfHeader:[B

    if-eqz v0, :cond_0

    .line 209
    const-string v0, "HeaderHash"

    iget-object v1, p0, Lcom/keepassdroid/database/save/PwDbV4Output;->hashOfHeader:[B

    invoke-static {v1}, Lbiz/source_code/base64Coder/Base64Coder;->encode([B)[C

    move-result-object v1

    invoke-static {v1}, Ljava/lang/String;->valueOf([C)Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lcom/keepassdroid/database/save/PwDbV4Output;->writeObject(Ljava/lang/String;Ljava/lang/String;)V

    .line 212
    :cond_0
    const-string v0, "DatabaseName"

    iget-object v1, p0, Lcom/keepassdroid/database/save/PwDbV4Output;->mPM:Lcom/keepassdroid/database/PwDatabaseV4;

    iget-object v1, v1, Lcom/keepassdroid/database/PwDatabaseV4;->name:Ljava/lang/String;

    invoke-direct {p0, v0, v1, v2}, Lcom/keepassdroid/database/save/PwDbV4Output;->writeObject(Ljava/lang/String;Ljava/lang/String;Z)V

    .line 213
    const-string v0, "DatabaseNameChanged"

    iget-object v1, p0, Lcom/keepassdroid/database/save/PwDbV4Output;->mPM:Lcom/keepassdroid/database/PwDatabaseV4;

    iget-object v1, v1, Lcom/keepassdroid/database/PwDatabaseV4;->nameChanged:Ljava/util/Date;

    invoke-direct {p0, v0, v1}, Lcom/keepassdroid/database/save/PwDbV4Output;->writeObject(Ljava/lang/String;Ljava/util/Date;)V

    .line 214
    const-string v0, "DatabaseDescription"

    iget-object v1, p0, Lcom/keepassdroid/database/save/PwDbV4Output;->mPM:Lcom/keepassdroid/database/PwDatabaseV4;

    iget-object v1, v1, Lcom/keepassdroid/database/PwDatabaseV4;->description:Ljava/lang/String;

    invoke-direct {p0, v0, v1, v2}, Lcom/keepassdroid/database/save/PwDbV4Output;->writeObject(Ljava/lang/String;Ljava/lang/String;Z)V

    .line 215
    const-string v0, "DatabaseDescriptionChanged"

    iget-object v1, p0, Lcom/keepassdroid/database/save/PwDbV4Output;->mPM:Lcom/keepassdroid/database/PwDatabaseV4;

    iget-object v1, v1, Lcom/keepassdroid/database/PwDatabaseV4;->descriptionChanged:Ljava/util/Date;

    invoke-direct {p0, v0, v1}, Lcom/keepassdroid/database/save/PwDbV4Output;->writeObject(Ljava/lang/String;Ljava/util/Date;)V

    .line 216
    const-string v0, "DefaultUserName"

    iget-object v1, p0, Lcom/keepassdroid/database/save/PwDbV4Output;->mPM:Lcom/keepassdroid/database/PwDatabaseV4;

    iget-object v1, v1, Lcom/keepassdroid/database/PwDatabaseV4;->defaultUserName:Ljava/lang/String;

    invoke-direct {p0, v0, v1, v2}, Lcom/keepassdroid/database/save/PwDbV4Output;->writeObject(Ljava/lang/String;Ljava/lang/String;Z)V

    .line 217
    const-string v0, "DefaultUserNameChanged"

    iget-object v1, p0, Lcom/keepassdroid/database/save/PwDbV4Output;->mPM:Lcom/keepassdroid/database/PwDatabaseV4;

    iget-object v1, v1, Lcom/keepassdroid/database/PwDatabaseV4;->defaultUserNameChanged:Ljava/util/Date;

    invoke-direct {p0, v0, v1}, Lcom/keepassdroid/database/save/PwDbV4Output;->writeObject(Ljava/lang/String;Ljava/util/Date;)V

    .line 218
    const-string v0, "MaintenanceHistoryDays"

    iget-object v1, p0, Lcom/keepassdroid/database/save/PwDbV4Output;->mPM:Lcom/keepassdroid/database/PwDatabaseV4;

    iget-wide v2, v1, Lcom/keepassdroid/database/PwDatabaseV4;->maintenanceHistoryDays:J

    invoke-direct {p0, v0, v2, v3}, Lcom/keepassdroid/database/save/PwDbV4Output;->writeObject(Ljava/lang/String;J)V

    .line 219
    const-string v0, "Color"

    iget-object v1, p0, Lcom/keepassdroid/database/save/PwDbV4Output;->mPM:Lcom/keepassdroid/database/PwDatabaseV4;

    iget-object v1, v1, Lcom/keepassdroid/database/PwDatabaseV4;->color:Ljava/lang/String;

    invoke-direct {p0, v0, v1}, Lcom/keepassdroid/database/save/PwDbV4Output;->writeObject(Ljava/lang/String;Ljava/lang/String;)V

    .line 220
    const-string v0, "MasterKeyChanged"

    iget-object v1, p0, Lcom/keepassdroid/database/save/PwDbV4Output;->mPM:Lcom/keepassdroid/database/PwDatabaseV4;

    iget-object v1, v1, Lcom/keepassdroid/database/PwDatabaseV4;->keyLastChanged:Ljava/util/Date;

    invoke-direct {p0, v0, v1}, Lcom/keepassdroid/database/save/PwDbV4Output;->writeObject(Ljava/lang/String;Ljava/util/Date;)V

    .line 221
    const-string v0, "MasterKeyChangeRec"

    iget-object v1, p0, Lcom/keepassdroid/database/save/PwDbV4Output;->mPM:Lcom/keepassdroid/database/PwDatabaseV4;

    iget-wide v2, v1, Lcom/keepassdroid/database/PwDatabaseV4;->keyChangeRecDays:J

    invoke-direct {p0, v0, v2, v3}, Lcom/keepassdroid/database/save/PwDbV4Output;->writeObject(Ljava/lang/String;J)V

    .line 222
    const-string v0, "MasterKeyChangeForce"

    iget-object v1, p0, Lcom/keepassdroid/database/save/PwDbV4Output;->mPM:Lcom/keepassdroid/database/PwDatabaseV4;

    iget-wide v2, v1, Lcom/keepassdroid/database/PwDatabaseV4;->keyChangeForceDays:J

    invoke-direct {p0, v0, v2, v3}, Lcom/keepassdroid/database/save/PwDbV4Output;->writeObject(Ljava/lang/String;J)V

    .line 225
    const-string v0, "MemoryProtection"

    iget-object v1, p0, Lcom/keepassdroid/database/save/PwDbV4Output;->mPM:Lcom/keepassdroid/database/PwDatabaseV4;

    iget-object v1, v1, Lcom/keepassdroid/database/PwDatabaseV4;->memoryProtection:Lcom/keepassdroid/database/PwDatabaseV4$MemoryProtectionConfig;

    invoke-direct {p0, v0, v1}, Lcom/keepassdroid/database/save/PwDbV4Output;->writeList(Ljava/lang/String;Lcom/keepassdroid/database/PwDatabaseV4$MemoryProtectionConfig;)V

    .line 227
    invoke-direct {p0}, Lcom/keepassdroid/database/save/PwDbV4Output;->writeCustomIconList()V

    .line 229
    const-string v0, "RecycleBinEnabled"

    iget-object v1, p0, Lcom/keepassdroid/database/save/PwDbV4Output;->mPM:Lcom/keepassdroid/database/PwDatabaseV4;

    iget-boolean v1, v1, Lcom/keepassdroid/database/PwDatabaseV4;->recycleBinEnabled:Z

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lcom/keepassdroid/database/save/PwDbV4Output;->writeObject(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 230
    const-string v0, "RecycleBinUUID"

    iget-object v1, p0, Lcom/keepassdroid/database/save/PwDbV4Output;->mPM:Lcom/keepassdroid/database/PwDatabaseV4;

    iget-object v1, v1, Lcom/keepassdroid/database/PwDatabaseV4;->recycleBinUUID:Ljava/util/UUID;

    invoke-direct {p0, v0, v1}, Lcom/keepassdroid/database/save/PwDbV4Output;->writeObject(Ljava/lang/String;Ljava/util/UUID;)V

    .line 231
    const-string v0, "RecycleBinChanged"

    iget-object v1, p0, Lcom/keepassdroid/database/save/PwDbV4Output;->mPM:Lcom/keepassdroid/database/PwDatabaseV4;

    iget-object v1, v1, Lcom/keepassdroid/database/PwDatabaseV4;->recycleBinChanged:Ljava/util/Date;

    invoke-direct {p0, v0, v1}, Lcom/keepassdroid/database/save/PwDbV4Output;->writeObject(Ljava/lang/String;Ljava/util/Date;)V

    .line 232
    const-string v0, "EntryTemplatesGroup"

    iget-object v1, p0, Lcom/keepassdroid/database/save/PwDbV4Output;->mPM:Lcom/keepassdroid/database/PwDatabaseV4;

    iget-object v1, v1, Lcom/keepassdroid/database/PwDatabaseV4;->entryTemplatesGroup:Ljava/util/UUID;

    invoke-direct {p0, v0, v1}, Lcom/keepassdroid/database/save/PwDbV4Output;->writeObject(Ljava/lang/String;Ljava/util/UUID;)V

    .line 233
    const-string v0, "EntryTemplatesGroupChanged"

    iget-object v1, p0, Lcom/keepassdroid/database/save/PwDbV4Output;->mPM:Lcom/keepassdroid/database/PwDatabaseV4;

    iget-object v1, v1, Lcom/keepassdroid/database/PwDatabaseV4;->entryTemplatesGroupChanged:Ljava/util/Date;

    invoke-direct {p0, v0, v1}, Lcom/keepassdroid/database/save/PwDbV4Output;->writeObject(Ljava/lang/String;Ljava/util/Date;)V

    .line 234
    const-string v0, "HistoryMaxItems"

    iget-object v1, p0, Lcom/keepassdroid/database/save/PwDbV4Output;->mPM:Lcom/keepassdroid/database/PwDatabaseV4;

    iget v1, v1, Lcom/keepassdroid/database/PwDatabaseV4;->historyMaxItems:I

    int-to-long v2, v1

    invoke-direct {p0, v0, v2, v3}, Lcom/keepassdroid/database/save/PwDbV4Output;->writeObject(Ljava/lang/String;J)V

    .line 235
    const-string v0, "HistoryMaxSize"

    iget-object v1, p0, Lcom/keepassdroid/database/save/PwDbV4Output;->mPM:Lcom/keepassdroid/database/PwDatabaseV4;

    iget-wide v2, v1, Lcom/keepassdroid/database/PwDatabaseV4;->historyMaxSize:J

    invoke-direct {p0, v0, v2, v3}, Lcom/keepassdroid/database/save/PwDbV4Output;->writeObject(Ljava/lang/String;J)V

    .line 236
    const-string v0, "LastSelectedGroup"

    iget-object v1, p0, Lcom/keepassdroid/database/save/PwDbV4Output;->mPM:Lcom/keepassdroid/database/PwDatabaseV4;

    iget-object v1, v1, Lcom/keepassdroid/database/PwDatabaseV4;->lastSelectedGroup:Ljava/util/UUID;

    invoke-direct {p0, v0, v1}, Lcom/keepassdroid/database/save/PwDbV4Output;->writeObject(Ljava/lang/String;Ljava/util/UUID;)V

    .line 237
    const-string v0, "LastTopVisibleGroup"

    iget-object v1, p0, Lcom/keepassdroid/database/save/PwDbV4Output;->mPM:Lcom/keepassdroid/database/PwDatabaseV4;

    iget-object v1, v1, Lcom/keepassdroid/database/PwDatabaseV4;->lastTopVisibleGroup:Ljava/util/UUID;

    invoke-direct {p0, v0, v1}, Lcom/keepassdroid/database/save/PwDbV4Output;->writeObject(Ljava/lang/String;Ljava/util/UUID;)V

    .line 239
    invoke-direct {p0}, Lcom/keepassdroid/database/save/PwDbV4Output;->writeBinPool()V

    .line 240
    const-string v0, "CustomData"

    iget-object v1, p0, Lcom/keepassdroid/database/save/PwDbV4Output;->mPM:Lcom/keepassdroid/database/PwDatabaseV4;

    iget-object v1, v1, Lcom/keepassdroid/database/PwDatabaseV4;->customData:Ljava/util/Map;

    invoke-direct {p0, v0, v1}, Lcom/keepassdroid/database/save/PwDbV4Output;->writeList(Ljava/lang/String;Ljava/util/Map;)V

    .line 242
    iget-object v0, p0, Lcom/keepassdroid/database/save/PwDbV4Output;->xml:Lorg/xmlpull/v1/XmlSerializer;

    const-string v1, "Meta"

    invoke-interface {v0, v4, v1}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 244
    return-void
.end method

.method private writeObject(Ljava/lang/String;J)V
    .locals 2
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;,
            Ljava/lang/IllegalStateException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 427
    invoke-static {p2, p3}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, p1, v0}, Lcom/keepassdroid/database/save/PwDbV4Output;->writeObject(Ljava/lang/String;Ljava/lang/String;)V

    .line 428
    return-void
.end method

.method private writeObject(Ljava/lang/String;Lcom/keepassdroid/database/PwDeletedObject;)V
    .locals 3
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Lcom/keepassdroid/database/PwDeletedObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;,
            Ljava/lang/IllegalStateException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 544
    sget-boolean v0, Lcom/keepassdroid/database/save/PwDbV4Output;->$assertionsDisabled:Z

    if-nez v0, :cond_1

    if-eqz p1, :cond_0

    if-nez p2, :cond_1

    :cond_0
    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 546
    :cond_1
    iget-object v0, p0, Lcom/keepassdroid/database/save/PwDbV4Output;->xml:Lorg/xmlpull/v1/XmlSerializer;

    invoke-interface {v0, v2, p1}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 548
    const-string v0, "UUID"

    iget-object v1, p2, Lcom/keepassdroid/database/PwDeletedObject;->uuid:Ljava/util/UUID;

    invoke-direct {p0, v0, v1}, Lcom/keepassdroid/database/save/PwDbV4Output;->writeObject(Ljava/lang/String;Ljava/util/UUID;)V

    .line 549
    const-string v0, "DeletionTime"

    invoke-virtual {p2}, Lcom/keepassdroid/database/PwDeletedObject;->getDeletionTime()Ljava/util/Date;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lcom/keepassdroid/database/save/PwDbV4Output;->writeObject(Ljava/lang/String;Ljava/util/Date;)V

    .line 551
    iget-object v0, p0, Lcom/keepassdroid/database/save/PwDbV4Output;->xml:Lorg/xmlpull/v1/XmlSerializer;

    invoke-interface {v0, v2, p1}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 552
    return-void
.end method

.method private writeObject(Ljava/lang/String;Lcom/keepassdroid/database/security/ProtectedBinary;Z)V
    .locals 4
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "value"    # Lcom/keepassdroid/database/security/ProtectedBinary;
    .param p3, "allowRef"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;,
            Ljava/lang/IllegalStateException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x0

    .line 355
    sget-boolean v1, Lcom/keepassdroid/database/save/PwDbV4Output;->$assertionsDisabled:Z

    if-nez v1, :cond_1

    if-eqz p1, :cond_0

    if-nez p2, :cond_1

    :cond_0
    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1}, Ljava/lang/AssertionError;-><init>()V

    throw v1

    .line 357
    :cond_1
    iget-object v1, p0, Lcom/keepassdroid/database/save/PwDbV4Output;->xml:Lorg/xmlpull/v1/XmlSerializer;

    const-string v2, "Binary"

    invoke-interface {v1, v3, v2}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 358
    iget-object v1, p0, Lcom/keepassdroid/database/save/PwDbV4Output;->xml:Lorg/xmlpull/v1/XmlSerializer;

    const-string v2, "Key"

    invoke-interface {v1, v3, v2}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 359
    iget-object v1, p0, Lcom/keepassdroid/database/save/PwDbV4Output;->xml:Lorg/xmlpull/v1/XmlSerializer;

    invoke-direct {p0, p1}, Lcom/keepassdroid/database/save/PwDbV4Output;->safeXmlString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Lorg/xmlpull/v1/XmlSerializer;->text(Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 360
    iget-object v1, p0, Lcom/keepassdroid/database/save/PwDbV4Output;->xml:Lorg/xmlpull/v1/XmlSerializer;

    const-string v2, "Key"

    invoke-interface {v1, v3, v2}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 362
    iget-object v1, p0, Lcom/keepassdroid/database/save/PwDbV4Output;->xml:Lorg/xmlpull/v1/XmlSerializer;

    const-string v2, "Value"

    invoke-interface {v1, v3, v2}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 363
    const/4 v0, 0x0

    .line 364
    .local v0, "strRef":Ljava/lang/String;
    if-eqz p3, :cond_2

    .line 365
    iget-object v1, p0, Lcom/keepassdroid/database/save/PwDbV4Output;->binPool:Lcom/keepassdroid/database/BinaryPool;

    invoke-virtual {v1, p2}, Lcom/keepassdroid/database/BinaryPool;->poolFind(Lcom/keepassdroid/database/security/ProtectedBinary;)Ljava/lang/String;

    move-result-object v0

    .line 368
    :cond_2
    if-eqz v0, :cond_3

    .line 369
    iget-object v1, p0, Lcom/keepassdroid/database/save/PwDbV4Output;->xml:Lorg/xmlpull/v1/XmlSerializer;

    const-string v2, "Ref"

    invoke-interface {v1, v3, v2, v0}, Lorg/xmlpull/v1/XmlSerializer;->attribute(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 374
    :goto_0
    iget-object v1, p0, Lcom/keepassdroid/database/save/PwDbV4Output;->xml:Lorg/xmlpull/v1/XmlSerializer;

    const-string v2, "Value"

    invoke-interface {v1, v3, v2}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 376
    iget-object v1, p0, Lcom/keepassdroid/database/save/PwDbV4Output;->xml:Lorg/xmlpull/v1/XmlSerializer;

    const-string v2, "Binary"

    invoke-interface {v1, v3, v2}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 377
    return-void

    .line 372
    :cond_3
    invoke-direct {p0, p2}, Lcom/keepassdroid/database/save/PwDbV4Output;->subWriteValue(Lcom/keepassdroid/database/security/ProtectedBinary;)V

    goto :goto_0
.end method

.method private writeObject(Ljava/lang/String;Lcom/keepassdroid/database/security/ProtectedString;Z)V
    .locals 9
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "value"    # Lcom/keepassdroid/database/security/ProtectedString;
    .param p3, "isEntryString"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;,
            Ljava/lang/IllegalStateException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    const/4 v8, 0x0

    .line 495
    sget-boolean v0, Lcom/keepassdroid/database/save/PwDbV4Output;->$assertionsDisabled:Z

    if-nez v0, :cond_1

    if-eqz p1, :cond_0

    if-nez p2, :cond_1

    :cond_0
    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 497
    :cond_1
    iget-object v0, p0, Lcom/keepassdroid/database/save/PwDbV4Output;->xml:Lorg/xmlpull/v1/XmlSerializer;

    const-string v5, "String"

    invoke-interface {v0, v8, v5}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 498
    iget-object v0, p0, Lcom/keepassdroid/database/save/PwDbV4Output;->xml:Lorg/xmlpull/v1/XmlSerializer;

    const-string v5, "Key"

    invoke-interface {v0, v8, v5}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 499
    iget-object v0, p0, Lcom/keepassdroid/database/save/PwDbV4Output;->xml:Lorg/xmlpull/v1/XmlSerializer;

    invoke-direct {p0, p1}, Lcom/keepassdroid/database/save/PwDbV4Output;->safeXmlString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-interface {v0, v5}, Lorg/xmlpull/v1/XmlSerializer;->text(Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 500
    iget-object v0, p0, Lcom/keepassdroid/database/save/PwDbV4Output;->xml:Lorg/xmlpull/v1/XmlSerializer;

    const-string v5, "Key"

    invoke-interface {v0, v8, v5}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 502
    iget-object v0, p0, Lcom/keepassdroid/database/save/PwDbV4Output;->xml:Lorg/xmlpull/v1/XmlSerializer;

    const-string v5, "Value"

    invoke-interface {v0, v8, v5}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 503
    invoke-virtual {p2}, Lcom/keepassdroid/database/security/ProtectedString;->isProtected()Z

    move-result v6

    .line 504
    .local v6, "protect":Z
    if-eqz p3, :cond_2

    .line 505
    const-string v0, "Title"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 506
    iget-object v0, p0, Lcom/keepassdroid/database/save/PwDbV4Output;->mPM:Lcom/keepassdroid/database/PwDatabaseV4;

    iget-object v0, v0, Lcom/keepassdroid/database/PwDatabaseV4;->memoryProtection:Lcom/keepassdroid/database/PwDatabaseV4$MemoryProtectionConfig;

    iget-boolean v6, v0, Lcom/keepassdroid/database/PwDatabaseV4$MemoryProtectionConfig;->protectTitle:Z

    .line 522
    :cond_2
    :goto_0
    if-eqz v6, :cond_8

    .line 523
    iget-object v0, p0, Lcom/keepassdroid/database/save/PwDbV4Output;->xml:Lorg/xmlpull/v1/XmlSerializer;

    const-string v5, "Protected"

    const-string v7, "True"

    invoke-interface {v0, v8, v5, v7}, Lorg/xmlpull/v1/XmlSerializer;->attribute(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 525
    invoke-virtual {p2}, Lcom/keepassdroid/database/security/ProtectedString;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v5, "UTF-8"

    invoke-virtual {v0, v5}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v1

    .line 526
    .local v1, "data":[B
    array-length v3, v1

    .line 528
    .local v3, "valLength":I
    if-lez v3, :cond_3

    .line 529
    new-array v4, v3, [B

    .line 530
    .local v4, "encoded":[B
    iget-object v0, p0, Lcom/keepassdroid/database/save/PwDbV4Output;->randomStream:Lorg/bouncycastle/crypto/StreamCipher;

    move v5, v2

    invoke-interface/range {v0 .. v5}, Lorg/bouncycastle/crypto/StreamCipher;->processBytes([BII[BI)V

    .line 531
    iget-object v0, p0, Lcom/keepassdroid/database/save/PwDbV4Output;->xml:Lorg/xmlpull/v1/XmlSerializer;

    invoke-static {v4}, Lbiz/source_code/base64Coder/Base64Coder;->encode([B)[C

    move-result-object v2

    invoke-static {v2}, Ljava/lang/String;->valueOf([C)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v2}, Lorg/xmlpull/v1/XmlSerializer;->text(Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 538
    .end local v1    # "data":[B
    .end local v3    # "valLength":I
    .end local v4    # "encoded":[B
    :cond_3
    :goto_1
    iget-object v0, p0, Lcom/keepassdroid/database/save/PwDbV4Output;->xml:Lorg/xmlpull/v1/XmlSerializer;

    const-string v2, "Value"

    invoke-interface {v0, v8, v2}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 539
    iget-object v0, p0, Lcom/keepassdroid/database/save/PwDbV4Output;->xml:Lorg/xmlpull/v1/XmlSerializer;

    const-string v2, "String"

    invoke-interface {v0, v8, v2}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 541
    return-void

    .line 508
    :cond_4
    const-string v0, "UserName"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5

    .line 509
    iget-object v0, p0, Lcom/keepassdroid/database/save/PwDbV4Output;->mPM:Lcom/keepassdroid/database/PwDatabaseV4;

    iget-object v0, v0, Lcom/keepassdroid/database/PwDatabaseV4;->memoryProtection:Lcom/keepassdroid/database/PwDatabaseV4$MemoryProtectionConfig;

    iget-boolean v6, v0, Lcom/keepassdroid/database/PwDatabaseV4$MemoryProtectionConfig;->protectUserName:Z

    goto :goto_0

    .line 511
    :cond_5
    const-string v0, "Password"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_6

    .line 512
    iget-object v0, p0, Lcom/keepassdroid/database/save/PwDbV4Output;->mPM:Lcom/keepassdroid/database/PwDatabaseV4;

    iget-object v0, v0, Lcom/keepassdroid/database/PwDatabaseV4;->memoryProtection:Lcom/keepassdroid/database/PwDatabaseV4$MemoryProtectionConfig;

    iget-boolean v6, v0, Lcom/keepassdroid/database/PwDatabaseV4$MemoryProtectionConfig;->protectPassword:Z

    goto :goto_0

    .line 514
    :cond_6
    const-string v0, "URL"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_7

    .line 515
    iget-object v0, p0, Lcom/keepassdroid/database/save/PwDbV4Output;->mPM:Lcom/keepassdroid/database/PwDatabaseV4;

    iget-object v0, v0, Lcom/keepassdroid/database/PwDatabaseV4;->memoryProtection:Lcom/keepassdroid/database/PwDatabaseV4$MemoryProtectionConfig;

    iget-boolean v6, v0, Lcom/keepassdroid/database/PwDatabaseV4$MemoryProtectionConfig;->protectUrl:Z

    goto :goto_0

    .line 517
    :cond_7
    const-string v0, "Notes"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 518
    iget-object v0, p0, Lcom/keepassdroid/database/save/PwDbV4Output;->mPM:Lcom/keepassdroid/database/PwDatabaseV4;

    iget-object v0, v0, Lcom/keepassdroid/database/PwDatabaseV4;->memoryProtection:Lcom/keepassdroid/database/PwDatabaseV4$MemoryProtectionConfig;

    iget-boolean v6, v0, Lcom/keepassdroid/database/PwDatabaseV4$MemoryProtectionConfig;->protectNotes:Z

    goto :goto_0

    .line 535
    :cond_8
    iget-object v0, p0, Lcom/keepassdroid/database/save/PwDbV4Output;->xml:Lorg/xmlpull/v1/XmlSerializer;

    invoke-virtual {p2}, Lcom/keepassdroid/database/security/ProtectedString;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/keepassdroid/database/save/PwDbV4Output;->safeXmlString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v2}, Lorg/xmlpull/v1/XmlSerializer;->text(Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    goto :goto_1
.end method

.method private writeObject(Ljava/lang/String;Ljava/lang/Boolean;)V
    .locals 2
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/Boolean;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;,
            Ljava/lang/IllegalStateException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 432
    if-nez p2, :cond_0

    .line 433
    const-string v0, "null"

    .line 442
    .local v0, "text":Ljava/lang/String;
    :goto_0
    invoke-direct {p0, p1, v0}, Lcom/keepassdroid/database/save/PwDbV4Output;->writeObject(Ljava/lang/String;Ljava/lang/String;)V

    .line 443
    return-void

    .line 435
    .end local v0    # "text":Ljava/lang/String;
    :cond_0
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 436
    const-string v0, "True"

    .restart local v0    # "text":Ljava/lang/String;
    goto :goto_0

    .line 439
    .end local v0    # "text":Ljava/lang/String;
    :cond_1
    const-string v0, "False"

    .restart local v0    # "text":Ljava/lang/String;
    goto :goto_0
.end method

.method private writeObject(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;,
            Ljava/lang/IllegalStateException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 419
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/keepassdroid/database/save/PwDbV4Output;->writeObject(Ljava/lang/String;Ljava/lang/String;Z)V

    .line 420
    return-void
.end method

.method private writeObject(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 3
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "keyName"    # Ljava/lang/String;
    .param p3, "keyValue"    # Ljava/lang/String;
    .param p4, "valueName"    # Ljava/lang/String;
    .param p5, "valueValue"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;,
            Ljava/lang/IllegalStateException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 451
    iget-object v0, p0, Lcom/keepassdroid/database/save/PwDbV4Output;->xml:Lorg/xmlpull/v1/XmlSerializer;

    invoke-interface {v0, v2, p1}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 453
    iget-object v0, p0, Lcom/keepassdroid/database/save/PwDbV4Output;->xml:Lorg/xmlpull/v1/XmlSerializer;

    invoke-interface {v0, v2, p2}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 454
    iget-object v0, p0, Lcom/keepassdroid/database/save/PwDbV4Output;->xml:Lorg/xmlpull/v1/XmlSerializer;

    invoke-direct {p0, p3}, Lcom/keepassdroid/database/save/PwDbV4Output;->safeXmlString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lorg/xmlpull/v1/XmlSerializer;->text(Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 455
    iget-object v0, p0, Lcom/keepassdroid/database/save/PwDbV4Output;->xml:Lorg/xmlpull/v1/XmlSerializer;

    invoke-interface {v0, v2, p2}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 457
    iget-object v0, p0, Lcom/keepassdroid/database/save/PwDbV4Output;->xml:Lorg/xmlpull/v1/XmlSerializer;

    invoke-interface {v0, v2, p4}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 458
    iget-object v0, p0, Lcom/keepassdroid/database/save/PwDbV4Output;->xml:Lorg/xmlpull/v1/XmlSerializer;

    invoke-direct {p0, p5}, Lcom/keepassdroid/database/save/PwDbV4Output;->safeXmlString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lorg/xmlpull/v1/XmlSerializer;->text(Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 459
    iget-object v0, p0, Lcom/keepassdroid/database/save/PwDbV4Output;->xml:Lorg/xmlpull/v1/XmlSerializer;

    invoke-interface {v0, v2, p4}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 461
    iget-object v0, p0, Lcom/keepassdroid/database/save/PwDbV4Output;->xml:Lorg/xmlpull/v1/XmlSerializer;

    invoke-interface {v0, v2, p1}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 462
    return-void
.end method

.method private writeObject(Ljava/lang/String;Ljava/lang/String;Z)V
    .locals 2
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;
    .param p3, "filterXmlChars"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;,
            Ljava/lang/IllegalStateException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x0

    .line 406
    sget-boolean v0, Lcom/keepassdroid/database/save/PwDbV4Output;->$assertionsDisabled:Z

    if-nez v0, :cond_1

    if-eqz p1, :cond_0

    if-nez p2, :cond_1

    :cond_0
    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 408
    :cond_1
    iget-object v0, p0, Lcom/keepassdroid/database/save/PwDbV4Output;->xml:Lorg/xmlpull/v1/XmlSerializer;

    invoke-interface {v0, v1, p1}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 410
    if-eqz p3, :cond_2

    .line 411
    invoke-direct {p0, p2}, Lcom/keepassdroid/database/save/PwDbV4Output;->safeXmlString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    .line 414
    :cond_2
    iget-object v0, p0, Lcom/keepassdroid/database/save/PwDbV4Output;->xml:Lorg/xmlpull/v1/XmlSerializer;

    invoke-interface {v0, p2}, Lorg/xmlpull/v1/XmlSerializer;->text(Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 415
    iget-object v0, p0, Lcom/keepassdroid/database/save/PwDbV4Output;->xml:Lorg/xmlpull/v1/XmlSerializer;

    invoke-interface {v0, v1, p1}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 416
    return-void
.end method

.method private writeObject(Ljava/lang/String;Ljava/util/Date;)V
    .locals 1
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/util/Date;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;,
            Ljava/lang/IllegalStateException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 423
    sget-object v0, Lcom/keepassdroid/database/PwDatabaseV4XML;->dateFormat:Ljava/text/SimpleDateFormat;

    invoke-virtual {v0, p2}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, p1, v0}, Lcom/keepassdroid/database/save/PwDbV4Output;->writeObject(Ljava/lang/String;Ljava/lang/String;)V

    .line 424
    return-void
.end method

.method private writeObject(Ljava/lang/String;Ljava/util/UUID;)V
    .locals 2
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "uuid"    # Ljava/util/UUID;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;,
            Ljava/lang/IllegalStateException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 446
    invoke-static {p2}, Lcom/keepassdroid/utils/Types;->UUIDtoBytes(Ljava/util/UUID;)[B

    move-result-object v0

    .line 447
    .local v0, "data":[B
    invoke-static {v0}, Lbiz/source_code/base64Coder/Base64Coder;->encode([B)[C

    move-result-object v1

    invoke-static {v1}, Ljava/lang/String;->valueOf([C)Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, p1, v1}, Lcom/keepassdroid/database/save/PwDbV4Output;->writeObject(Ljava/lang/String;Ljava/lang/String;)V

    .line 448
    return-void
.end method


# virtual methods
.method public output()V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/keepassdroid/database/exception/PwDbOutputException;
        }
    .end annotation

    .prologue
    .line 90
    iget-object v4, p0, Lcom/keepassdroid/database/save/PwDbV4Output;->mOS:Ljava/io/OutputStream;

    invoke-virtual {p0, v4}, Lcom/keepassdroid/database/save/PwDbV4Output;->outputHeader(Ljava/io/OutputStream;)Lcom/keepassdroid/database/PwDbHeader;

    move-result-object v4

    check-cast v4, Lcom/keepassdroid/database/PwDbHeaderV4;

    iput-object v4, p0, Lcom/keepassdroid/database/save/PwDbV4Output;->header:Lcom/keepassdroid/database/PwDbHeaderV4;

    .line 92
    iget-object v4, p0, Lcom/keepassdroid/database/save/PwDbV4Output;->header:Lcom/keepassdroid/database/PwDbHeaderV4;

    iget-object v5, p0, Lcom/keepassdroid/database/save/PwDbV4Output;->mOS:Ljava/io/OutputStream;

    invoke-direct {p0, v4, v5}, Lcom/keepassdroid/database/save/PwDbV4Output;->attachStreamEncryptor(Lcom/keepassdroid/database/PwDbHeaderV4;Ljava/io/OutputStream;)Ljavax/crypto/CipherOutputStream;

    move-result-object v1

    .line 96
    .local v1, "cos":Ljavax/crypto/CipherOutputStream;
    :try_start_0
    iget-object v4, p0, Lcom/keepassdroid/database/save/PwDbV4Output;->header:Lcom/keepassdroid/database/PwDbHeaderV4;

    iget-object v4, v4, Lcom/keepassdroid/database/PwDbHeaderV4;->streamStartBytes:[B

    invoke-virtual {v1, v4}, Ljavax/crypto/CipherOutputStream;->write([B)V

    .line 98
    new-instance v3, Lcom/keepassdroid/stream/HashedBlockOutputStream;

    invoke-direct {v3, v1}, Lcom/keepassdroid/stream/HashedBlockOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 100
    .local v3, "hashed":Lcom/keepassdroid/stream/HashedBlockOutputStream;
    iget-object v4, p0, Lcom/keepassdroid/database/save/PwDbV4Output;->mPM:Lcom/keepassdroid/database/PwDatabaseV4;

    iget-object v4, v4, Lcom/keepassdroid/database/PwDatabaseV4;->compressionAlgorithm:Lcom/keepassdroid/database/PwCompressionAlgorithm;

    sget-object v5, Lcom/keepassdroid/database/PwCompressionAlgorithm;->Gzip:Lcom/keepassdroid/database/PwCompressionAlgorithm;

    if-ne v4, v5, :cond_0

    .line 101
    new-instance v0, Ljava/util/zip/GZIPOutputStream;

    invoke-direct {v0, v3}, Ljava/util/zip/GZIPOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 106
    .local v0, "compressed":Ljava/io/OutputStream;
    :goto_0
    invoke-direct {p0, v0}, Lcom/keepassdroid/database/save/PwDbV4Output;->outputDatabase(Ljava/io/OutputStream;)V

    .line 107
    invoke-virtual {v0}, Ljava/io/OutputStream;->close()V
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_2

    .line 115
    return-void

    .line 103
    .end local v0    # "compressed":Ljava/io/OutputStream;
    :cond_0
    move-object v0, v3

    .restart local v0    # "compressed":Ljava/io/OutputStream;
    goto :goto_0

    .line 108
    .end local v0    # "compressed":Ljava/io/OutputStream;
    .end local v3    # "hashed":Lcom/keepassdroid/stream/HashedBlockOutputStream;
    :catch_0
    move-exception v2

    .line 109
    .local v2, "e":Ljava/lang/IllegalArgumentException;
    new-instance v4, Lcom/keepassdroid/database/exception/PwDbOutputException;

    invoke-direct {v4, v2}, Lcom/keepassdroid/database/exception/PwDbOutputException;-><init>(Ljava/lang/Exception;)V

    throw v4

    .line 110
    .end local v2    # "e":Ljava/lang/IllegalArgumentException;
    :catch_1
    move-exception v2

    .line 111
    .local v2, "e":Ljava/lang/IllegalStateException;
    new-instance v4, Lcom/keepassdroid/database/exception/PwDbOutputException;

    invoke-direct {v4, v2}, Lcom/keepassdroid/database/exception/PwDbOutputException;-><init>(Ljava/lang/Exception;)V

    throw v4

    .line 112
    .end local v2    # "e":Ljava/lang/IllegalStateException;
    :catch_2
    move-exception v2

    .line 113
    .local v2, "e":Ljava/io/IOException;
    new-instance v4, Lcom/keepassdroid/database/exception/PwDbOutputException;

    invoke-direct {v4, v2}, Lcom/keepassdroid/database/exception/PwDbOutputException;-><init>(Ljava/lang/Exception;)V

    throw v4
.end method

.method public outputHeader(Ljava/io/OutputStream;)Lcom/keepassdroid/database/PwDbHeader;
    .locals 5
    .param p1, "os"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/keepassdroid/database/exception/PwDbOutputException;
        }
    .end annotation

    .prologue
    .line 282
    new-instance v1, Lcom/keepassdroid/database/PwDbHeaderV4;

    iget-object v3, p0, Lcom/keepassdroid/database/save/PwDbV4Output;->mPM:Lcom/keepassdroid/database/PwDatabaseV4;

    invoke-direct {v1, v3}, Lcom/keepassdroid/database/PwDbHeaderV4;-><init>(Lcom/keepassdroid/database/PwDatabaseV4;)V

    .line 283
    .local v1, "header":Lcom/keepassdroid/database/PwDbHeaderV4;
    invoke-virtual {p0, v1}, Lcom/keepassdroid/database/save/PwDbV4Output;->setIVs(Lcom/keepassdroid/database/PwDbHeader;)Ljava/security/SecureRandom;

    .line 285
    new-instance v2, Lcom/keepassdroid/database/save/PwDbHeaderOutputV4;

    iget-object v3, p0, Lcom/keepassdroid/database/save/PwDbV4Output;->mPM:Lcom/keepassdroid/database/PwDatabaseV4;

    invoke-direct {v2, v3, v1, p1}, Lcom/keepassdroid/database/save/PwDbHeaderOutputV4;-><init>(Lcom/keepassdroid/database/PwDatabaseV4;Lcom/keepassdroid/database/PwDbHeaderV4;Ljava/io/OutputStream;)V

    .line 287
    .local v2, "pho":Lcom/keepassdroid/database/save/PwDbHeaderOutputV4;
    :try_start_0
    invoke-virtual {v2}, Lcom/keepassdroid/database/save/PwDbHeaderOutputV4;->output()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 292
    invoke-virtual {v2}, Lcom/keepassdroid/database/save/PwDbHeaderOutputV4;->getHashOfHeader()[B

    move-result-object v3

    iput-object v3, p0, Lcom/keepassdroid/database/save/PwDbV4Output;->hashOfHeader:[B

    .line 294
    return-object v1

    .line 288
    :catch_0
    move-exception v0

    .line 289
    .local v0, "e":Ljava/io/IOException;
    new-instance v3, Lcom/keepassdroid/database/exception/PwDbOutputException;

    const-string v4, "Failed to output the header."

    invoke-direct {v3, v4}, Lcom/keepassdroid/database/exception/PwDbOutputException;-><init>(Ljava/lang/String;)V

    throw v3
.end method

.method protected setIVs(Lcom/keepassdroid/database/PwDbHeader;)Ljava/security/SecureRandom;
    .locals 4
    .param p1, "header"    # Lcom/keepassdroid/database/PwDbHeader;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/keepassdroid/database/exception/PwDbOutputException;
        }
    .end annotation

    .prologue
    .line 262
    invoke-super {p0, p1}, Lcom/keepassdroid/database/save/PwDbOutput;->setIVs(Lcom/keepassdroid/database/PwDbHeader;)Ljava/security/SecureRandom;

    move-result-object v1

    .local v1, "random":Ljava/security/SecureRandom;
    move-object v0, p1

    .line 264
    check-cast v0, Lcom/keepassdroid/database/PwDbHeaderV4;

    .line 265
    .local v0, "h":Lcom/keepassdroid/database/PwDbHeaderV4;
    iget-object v2, v0, Lcom/keepassdroid/database/PwDbHeaderV4;->masterSeed:[B

    invoke-virtual {v1, v2}, Ljava/security/SecureRandom;->nextBytes([B)V

    .line 266
    iget-object v2, v0, Lcom/keepassdroid/database/PwDbHeaderV4;->transformSeed:[B

    invoke-virtual {v1, v2}, Ljava/security/SecureRandom;->nextBytes([B)V

    .line 267
    iget-object v2, v0, Lcom/keepassdroid/database/PwDbHeaderV4;->encryptionIV:[B

    invoke-virtual {v1, v2}, Ljava/security/SecureRandom;->nextBytes([B)V

    .line 269
    iget-object v2, v0, Lcom/keepassdroid/database/PwDbHeaderV4;->protectedStreamKey:[B

    invoke-virtual {v1, v2}, Ljava/security/SecureRandom;->nextBytes([B)V

    .line 270
    sget-object v2, Lcom/keepassdroid/database/CrsAlgorithm;->Salsa20:Lcom/keepassdroid/database/CrsAlgorithm;

    iput-object v2, v0, Lcom/keepassdroid/database/PwDbHeaderV4;->innerRandomStream:Lcom/keepassdroid/database/CrsAlgorithm;

    .line 271
    iget-object v2, v0, Lcom/keepassdroid/database/PwDbHeaderV4;->innerRandomStream:Lcom/keepassdroid/database/CrsAlgorithm;

    iget-object v3, v0, Lcom/keepassdroid/database/PwDbHeaderV4;->protectedStreamKey:[B

    invoke-static {v2, v3}, Lcom/keepassdroid/crypto/PwStreamCipherFactory;->getInstance(Lcom/keepassdroid/database/CrsAlgorithm;[B)Lorg/bouncycastle/crypto/StreamCipher;

    move-result-object v2

    iput-object v2, p0, Lcom/keepassdroid/database/save/PwDbV4Output;->randomStream:Lorg/bouncycastle/crypto/StreamCipher;

    .line 272
    iget-object v2, p0, Lcom/keepassdroid/database/save/PwDbV4Output;->randomStream:Lorg/bouncycastle/crypto/StreamCipher;

    if-nez v2, :cond_0

    .line 273
    new-instance v2, Lcom/keepassdroid/database/exception/PwDbOutputException;

    const-string v3, "Invalid random cipher"

    invoke-direct {v2, v3}, Lcom/keepassdroid/database/exception/PwDbOutputException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 275
    :cond_0
    iget-object v2, v0, Lcom/keepassdroid/database/PwDbHeaderV4;->streamStartBytes:[B

    invoke-virtual {v1, v2}, Ljava/security/SecureRandom;->nextBytes([B)V

    .line 277
    return-object v1
.end method
