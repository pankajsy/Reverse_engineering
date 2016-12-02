.class final enum Lcom/keepassdroid/database/load/ImporterV4$KdbContext;
.super Ljava/lang/Enum;
.source "ImporterV4.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/keepassdroid/database/load/ImporterV4;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x401a
    name = "KdbContext"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/keepassdroid/database/load/ImporterV4$KdbContext;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/keepassdroid/database/load/ImporterV4$KdbContext;

.field public static final enum Binaries:Lcom/keepassdroid/database/load/ImporterV4$KdbContext;

.field public static final enum CustomData:Lcom/keepassdroid/database/load/ImporterV4$KdbContext;

.field public static final enum CustomDataItem:Lcom/keepassdroid/database/load/ImporterV4$KdbContext;

.field public static final enum CustomIcon:Lcom/keepassdroid/database/load/ImporterV4$KdbContext;

.field public static final enum CustomIcons:Lcom/keepassdroid/database/load/ImporterV4$KdbContext;

.field public static final enum DeletedObject:Lcom/keepassdroid/database/load/ImporterV4$KdbContext;

.field public static final enum Entry:Lcom/keepassdroid/database/load/ImporterV4$KdbContext;

.field public static final enum EntryAutoType:Lcom/keepassdroid/database/load/ImporterV4$KdbContext;

.field public static final enum EntryAutoTypeItem:Lcom/keepassdroid/database/load/ImporterV4$KdbContext;

.field public static final enum EntryBinary:Lcom/keepassdroid/database/load/ImporterV4$KdbContext;

.field public static final enum EntryHistory:Lcom/keepassdroid/database/load/ImporterV4$KdbContext;

.field public static final enum EntryString:Lcom/keepassdroid/database/load/ImporterV4$KdbContext;

.field public static final enum EntryTimes:Lcom/keepassdroid/database/load/ImporterV4$KdbContext;

.field public static final enum Group:Lcom/keepassdroid/database/load/ImporterV4$KdbContext;

.field public static final enum GroupTimes:Lcom/keepassdroid/database/load/ImporterV4$KdbContext;

.field public static final enum KeePassFile:Lcom/keepassdroid/database/load/ImporterV4$KdbContext;

.field public static final enum MemoryProtection:Lcom/keepassdroid/database/load/ImporterV4$KdbContext;

.field public static final enum Meta:Lcom/keepassdroid/database/load/ImporterV4$KdbContext;

.field public static final enum Null:Lcom/keepassdroid/database/load/ImporterV4$KdbContext;

.field public static final enum Root:Lcom/keepassdroid/database/load/ImporterV4$KdbContext;

.field public static final enum RootDeletedObjects:Lcom/keepassdroid/database/load/ImporterV4$KdbContext;


# direct methods
.method static constructor <clinit>()V
    .locals 8

    .prologue
    const/4 v7, 0x4

    const/4 v6, 0x3

    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 164
    new-instance v0, Lcom/keepassdroid/database/load/ImporterV4$KdbContext;

    const-string v1, "Null"

    invoke-direct {v0, v1, v3}, Lcom/keepassdroid/database/load/ImporterV4$KdbContext;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/keepassdroid/database/load/ImporterV4$KdbContext;->Null:Lcom/keepassdroid/database/load/ImporterV4$KdbContext;

    .line 165
    new-instance v0, Lcom/keepassdroid/database/load/ImporterV4$KdbContext;

    const-string v1, "KeePassFile"

    invoke-direct {v0, v1, v4}, Lcom/keepassdroid/database/load/ImporterV4$KdbContext;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/keepassdroid/database/load/ImporterV4$KdbContext;->KeePassFile:Lcom/keepassdroid/database/load/ImporterV4$KdbContext;

    .line 166
    new-instance v0, Lcom/keepassdroid/database/load/ImporterV4$KdbContext;

    const-string v1, "Meta"

    invoke-direct {v0, v1, v5}, Lcom/keepassdroid/database/load/ImporterV4$KdbContext;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/keepassdroid/database/load/ImporterV4$KdbContext;->Meta:Lcom/keepassdroid/database/load/ImporterV4$KdbContext;

    .line 167
    new-instance v0, Lcom/keepassdroid/database/load/ImporterV4$KdbContext;

    const-string v1, "Root"

    invoke-direct {v0, v1, v6}, Lcom/keepassdroid/database/load/ImporterV4$KdbContext;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/keepassdroid/database/load/ImporterV4$KdbContext;->Root:Lcom/keepassdroid/database/load/ImporterV4$KdbContext;

    .line 168
    new-instance v0, Lcom/keepassdroid/database/load/ImporterV4$KdbContext;

    const-string v1, "MemoryProtection"

    invoke-direct {v0, v1, v7}, Lcom/keepassdroid/database/load/ImporterV4$KdbContext;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/keepassdroid/database/load/ImporterV4$KdbContext;->MemoryProtection:Lcom/keepassdroid/database/load/ImporterV4$KdbContext;

    .line 169
    new-instance v0, Lcom/keepassdroid/database/load/ImporterV4$KdbContext;

    const-string v1, "CustomIcons"

    const/4 v2, 0x5

    invoke-direct {v0, v1, v2}, Lcom/keepassdroid/database/load/ImporterV4$KdbContext;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/keepassdroid/database/load/ImporterV4$KdbContext;->CustomIcons:Lcom/keepassdroid/database/load/ImporterV4$KdbContext;

    .line 170
    new-instance v0, Lcom/keepassdroid/database/load/ImporterV4$KdbContext;

    const-string v1, "CustomIcon"

    const/4 v2, 0x6

    invoke-direct {v0, v1, v2}, Lcom/keepassdroid/database/load/ImporterV4$KdbContext;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/keepassdroid/database/load/ImporterV4$KdbContext;->CustomIcon:Lcom/keepassdroid/database/load/ImporterV4$KdbContext;

    .line 171
    new-instance v0, Lcom/keepassdroid/database/load/ImporterV4$KdbContext;

    const-string v1, "CustomData"

    const/4 v2, 0x7

    invoke-direct {v0, v1, v2}, Lcom/keepassdroid/database/load/ImporterV4$KdbContext;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/keepassdroid/database/load/ImporterV4$KdbContext;->CustomData:Lcom/keepassdroid/database/load/ImporterV4$KdbContext;

    .line 172
    new-instance v0, Lcom/keepassdroid/database/load/ImporterV4$KdbContext;

    const-string v1, "CustomDataItem"

    const/16 v2, 0x8

    invoke-direct {v0, v1, v2}, Lcom/keepassdroid/database/load/ImporterV4$KdbContext;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/keepassdroid/database/load/ImporterV4$KdbContext;->CustomDataItem:Lcom/keepassdroid/database/load/ImporterV4$KdbContext;

    .line 173
    new-instance v0, Lcom/keepassdroid/database/load/ImporterV4$KdbContext;

    const-string v1, "RootDeletedObjects"

    const/16 v2, 0x9

    invoke-direct {v0, v1, v2}, Lcom/keepassdroid/database/load/ImporterV4$KdbContext;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/keepassdroid/database/load/ImporterV4$KdbContext;->RootDeletedObjects:Lcom/keepassdroid/database/load/ImporterV4$KdbContext;

    .line 174
    new-instance v0, Lcom/keepassdroid/database/load/ImporterV4$KdbContext;

    const-string v1, "DeletedObject"

    const/16 v2, 0xa

    invoke-direct {v0, v1, v2}, Lcom/keepassdroid/database/load/ImporterV4$KdbContext;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/keepassdroid/database/load/ImporterV4$KdbContext;->DeletedObject:Lcom/keepassdroid/database/load/ImporterV4$KdbContext;

    .line 175
    new-instance v0, Lcom/keepassdroid/database/load/ImporterV4$KdbContext;

    const-string v1, "Group"

    const/16 v2, 0xb

    invoke-direct {v0, v1, v2}, Lcom/keepassdroid/database/load/ImporterV4$KdbContext;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/keepassdroid/database/load/ImporterV4$KdbContext;->Group:Lcom/keepassdroid/database/load/ImporterV4$KdbContext;

    .line 176
    new-instance v0, Lcom/keepassdroid/database/load/ImporterV4$KdbContext;

    const-string v1, "GroupTimes"

    const/16 v2, 0xc

    invoke-direct {v0, v1, v2}, Lcom/keepassdroid/database/load/ImporterV4$KdbContext;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/keepassdroid/database/load/ImporterV4$KdbContext;->GroupTimes:Lcom/keepassdroid/database/load/ImporterV4$KdbContext;

    .line 177
    new-instance v0, Lcom/keepassdroid/database/load/ImporterV4$KdbContext;

    const-string v1, "Entry"

    const/16 v2, 0xd

    invoke-direct {v0, v1, v2}, Lcom/keepassdroid/database/load/ImporterV4$KdbContext;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/keepassdroid/database/load/ImporterV4$KdbContext;->Entry:Lcom/keepassdroid/database/load/ImporterV4$KdbContext;

    .line 178
    new-instance v0, Lcom/keepassdroid/database/load/ImporterV4$KdbContext;

    const-string v1, "EntryTimes"

    const/16 v2, 0xe

    invoke-direct {v0, v1, v2}, Lcom/keepassdroid/database/load/ImporterV4$KdbContext;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/keepassdroid/database/load/ImporterV4$KdbContext;->EntryTimes:Lcom/keepassdroid/database/load/ImporterV4$KdbContext;

    .line 179
    new-instance v0, Lcom/keepassdroid/database/load/ImporterV4$KdbContext;

    const-string v1, "EntryString"

    const/16 v2, 0xf

    invoke-direct {v0, v1, v2}, Lcom/keepassdroid/database/load/ImporterV4$KdbContext;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/keepassdroid/database/load/ImporterV4$KdbContext;->EntryString:Lcom/keepassdroid/database/load/ImporterV4$KdbContext;

    .line 180
    new-instance v0, Lcom/keepassdroid/database/load/ImporterV4$KdbContext;

    const-string v1, "EntryBinary"

    const/16 v2, 0x10

    invoke-direct {v0, v1, v2}, Lcom/keepassdroid/database/load/ImporterV4$KdbContext;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/keepassdroid/database/load/ImporterV4$KdbContext;->EntryBinary:Lcom/keepassdroid/database/load/ImporterV4$KdbContext;

    .line 181
    new-instance v0, Lcom/keepassdroid/database/load/ImporterV4$KdbContext;

    const-string v1, "EntryAutoType"

    const/16 v2, 0x11

    invoke-direct {v0, v1, v2}, Lcom/keepassdroid/database/load/ImporterV4$KdbContext;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/keepassdroid/database/load/ImporterV4$KdbContext;->EntryAutoType:Lcom/keepassdroid/database/load/ImporterV4$KdbContext;

    .line 182
    new-instance v0, Lcom/keepassdroid/database/load/ImporterV4$KdbContext;

    const-string v1, "EntryAutoTypeItem"

    const/16 v2, 0x12

    invoke-direct {v0, v1, v2}, Lcom/keepassdroid/database/load/ImporterV4$KdbContext;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/keepassdroid/database/load/ImporterV4$KdbContext;->EntryAutoTypeItem:Lcom/keepassdroid/database/load/ImporterV4$KdbContext;

    .line 183
    new-instance v0, Lcom/keepassdroid/database/load/ImporterV4$KdbContext;

    const-string v1, "EntryHistory"

    const/16 v2, 0x13

    invoke-direct {v0, v1, v2}, Lcom/keepassdroid/database/load/ImporterV4$KdbContext;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/keepassdroid/database/load/ImporterV4$KdbContext;->EntryHistory:Lcom/keepassdroid/database/load/ImporterV4$KdbContext;

    .line 184
    new-instance v0, Lcom/keepassdroid/database/load/ImporterV4$KdbContext;

    const-string v1, "Binaries"

    const/16 v2, 0x14

    invoke-direct {v0, v1, v2}, Lcom/keepassdroid/database/load/ImporterV4$KdbContext;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/keepassdroid/database/load/ImporterV4$KdbContext;->Binaries:Lcom/keepassdroid/database/load/ImporterV4$KdbContext;

    .line 163
    const/16 v0, 0x15

    new-array v0, v0, [Lcom/keepassdroid/database/load/ImporterV4$KdbContext;

    sget-object v1, Lcom/keepassdroid/database/load/ImporterV4$KdbContext;->Null:Lcom/keepassdroid/database/load/ImporterV4$KdbContext;

    aput-object v1, v0, v3

    sget-object v1, Lcom/keepassdroid/database/load/ImporterV4$KdbContext;->KeePassFile:Lcom/keepassdroid/database/load/ImporterV4$KdbContext;

    aput-object v1, v0, v4

    sget-object v1, Lcom/keepassdroid/database/load/ImporterV4$KdbContext;->Meta:Lcom/keepassdroid/database/load/ImporterV4$KdbContext;

    aput-object v1, v0, v5

    sget-object v1, Lcom/keepassdroid/database/load/ImporterV4$KdbContext;->Root:Lcom/keepassdroid/database/load/ImporterV4$KdbContext;

    aput-object v1, v0, v6

    sget-object v1, Lcom/keepassdroid/database/load/ImporterV4$KdbContext;->MemoryProtection:Lcom/keepassdroid/database/load/ImporterV4$KdbContext;

    aput-object v1, v0, v7

    const/4 v1, 0x5

    sget-object v2, Lcom/keepassdroid/database/load/ImporterV4$KdbContext;->CustomIcons:Lcom/keepassdroid/database/load/ImporterV4$KdbContext;

    aput-object v2, v0, v1

    const/4 v1, 0x6

    sget-object v2, Lcom/keepassdroid/database/load/ImporterV4$KdbContext;->CustomIcon:Lcom/keepassdroid/database/load/ImporterV4$KdbContext;

    aput-object v2, v0, v1

    const/4 v1, 0x7

    sget-object v2, Lcom/keepassdroid/database/load/ImporterV4$KdbContext;->CustomData:Lcom/keepassdroid/database/load/ImporterV4$KdbContext;

    aput-object v2, v0, v1

    const/16 v1, 0x8

    sget-object v2, Lcom/keepassdroid/database/load/ImporterV4$KdbContext;->CustomDataItem:Lcom/keepassdroid/database/load/ImporterV4$KdbContext;

    aput-object v2, v0, v1

    const/16 v1, 0x9

    sget-object v2, Lcom/keepassdroid/database/load/ImporterV4$KdbContext;->RootDeletedObjects:Lcom/keepassdroid/database/load/ImporterV4$KdbContext;

    aput-object v2, v0, v1

    const/16 v1, 0xa

    sget-object v2, Lcom/keepassdroid/database/load/ImporterV4$KdbContext;->DeletedObject:Lcom/keepassdroid/database/load/ImporterV4$KdbContext;

    aput-object v2, v0, v1

    const/16 v1, 0xb

    sget-object v2, Lcom/keepassdroid/database/load/ImporterV4$KdbContext;->Group:Lcom/keepassdroid/database/load/ImporterV4$KdbContext;

    aput-object v2, v0, v1

    const/16 v1, 0xc

    sget-object v2, Lcom/keepassdroid/database/load/ImporterV4$KdbContext;->GroupTimes:Lcom/keepassdroid/database/load/ImporterV4$KdbContext;

    aput-object v2, v0, v1

    const/16 v1, 0xd

    sget-object v2, Lcom/keepassdroid/database/load/ImporterV4$KdbContext;->Entry:Lcom/keepassdroid/database/load/ImporterV4$KdbContext;

    aput-object v2, v0, v1

    const/16 v1, 0xe

    sget-object v2, Lcom/keepassdroid/database/load/ImporterV4$KdbContext;->EntryTimes:Lcom/keepassdroid/database/load/ImporterV4$KdbContext;

    aput-object v2, v0, v1

    const/16 v1, 0xf

    sget-object v2, Lcom/keepassdroid/database/load/ImporterV4$KdbContext;->EntryString:Lcom/keepassdroid/database/load/ImporterV4$KdbContext;

    aput-object v2, v0, v1

    const/16 v1, 0x10

    sget-object v2, Lcom/keepassdroid/database/load/ImporterV4$KdbContext;->EntryBinary:Lcom/keepassdroid/database/load/ImporterV4$KdbContext;

    aput-object v2, v0, v1

    const/16 v1, 0x11

    sget-object v2, Lcom/keepassdroid/database/load/ImporterV4$KdbContext;->EntryAutoType:Lcom/keepassdroid/database/load/ImporterV4$KdbContext;

    aput-object v2, v0, v1

    const/16 v1, 0x12

    sget-object v2, Lcom/keepassdroid/database/load/ImporterV4$KdbContext;->EntryAutoTypeItem:Lcom/keepassdroid/database/load/ImporterV4$KdbContext;

    aput-object v2, v0, v1

    const/16 v1, 0x13

    sget-object v2, Lcom/keepassdroid/database/load/ImporterV4$KdbContext;->EntryHistory:Lcom/keepassdroid/database/load/ImporterV4$KdbContext;

    aput-object v2, v0, v1

    const/16 v1, 0x14

    sget-object v2, Lcom/keepassdroid/database/load/ImporterV4$KdbContext;->Binaries:Lcom/keepassdroid/database/load/ImporterV4$KdbContext;

    aput-object v2, v0, v1

    sput-object v0, Lcom/keepassdroid/database/load/ImporterV4$KdbContext;->$VALUES:[Lcom/keepassdroid/database/load/ImporterV4$KdbContext;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .prologue
    .line 163
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/keepassdroid/database/load/ImporterV4$KdbContext;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 163
    const-class v0, Lcom/keepassdroid/database/load/ImporterV4$KdbContext;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/keepassdroid/database/load/ImporterV4$KdbContext;

    return-object v0
.end method

.method public static values()[Lcom/keepassdroid/database/load/ImporterV4$KdbContext;
    .locals 1

    .prologue
    .line 163
    sget-object v0, Lcom/keepassdroid/database/load/ImporterV4$KdbContext;->$VALUES:[Lcom/keepassdroid/database/load/ImporterV4$KdbContext;

    invoke-virtual {v0}, [Lcom/keepassdroid/database/load/ImporterV4$KdbContext;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/keepassdroid/database/load/ImporterV4$KdbContext;

    return-object v0
.end method
