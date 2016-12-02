.class public Lcom/keepassdroid/database/PwEntryV3;
.super Lcom/keepassdroid/database/PwEntry;
.source "PwEntryV3.java"


# static fields
.field static final synthetic $assertionsDisabled:Z

.field public static final DEFAULT_DATE:Ljava/util/Date;

.field public static final DEFAULT_PWDATE:Lcom/keepassdroid/database/PwDate;

.field public static final NEVER_EXPIRE:Ljava/util/Date;

.field public static final NEVER_EXPIRE_BUG:Ljava/util/Date;

.field public static final PMS_ID_BINDESC:Ljava/lang/String; = "bin-stream"

.field public static final PMS_ID_TITLE:Ljava/lang/String; = "Meta-Info"

.field public static final PMS_ID_URL:Ljava/lang/String; = "$"

.field public static final PMS_ID_USER:Ljava/lang/String; = "SYSTEM"

.field public static final PW_NEVER_EXPIRE:Lcom/keepassdroid/database/PwDate;

.field public static final PW_NEVER_EXPIRE_BUG:Lcom/keepassdroid/database/PwDate;


# instance fields
.field public additional:Ljava/lang/String;

.field private binaryData:[B

.field public binaryDesc:Ljava/lang/String;

.field public groupId:I

.field public parent:Lcom/keepassdroid/database/PwGroupV3;

.field private password:[B

.field public tCreation:Lcom/keepassdroid/database/PwDate;

.field public tExpire:Lcom/keepassdroid/database/PwDate;

.field public tLastAccess:Lcom/keepassdroid/database/PwDate;

.field public tLastMod:Lcom/keepassdroid/database/PwDate;

.field public title:Ljava/lang/String;

.field public url:Ljava/lang/String;

.field public username:Ljava/lang/String;

.field private uuid:[B


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 75
    const-class v0, Lcom/keepassdroid/database/PwEntryV3;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    sput-boolean v0, Lcom/keepassdroid/database/PwEntryV3;->$assertionsDisabled:Z

    .line 77
    invoke-static {}, Lcom/keepassdroid/database/PwEntryV3;->getNeverExpire()Ljava/util/Date;

    move-result-object v0

    sput-object v0, Lcom/keepassdroid/database/PwEntryV3;->NEVER_EXPIRE:Ljava/util/Date;

    .line 78
    invoke-static {}, Lcom/keepassdroid/database/PwEntryV3;->getNeverExpireBug()Ljava/util/Date;

    move-result-object v0

    sput-object v0, Lcom/keepassdroid/database/PwEntryV3;->NEVER_EXPIRE_BUG:Ljava/util/Date;

    .line 79
    invoke-static {}, Lcom/keepassdroid/database/PwEntryV3;->getDefaultDate()Ljava/util/Date;

    move-result-object v0

    sput-object v0, Lcom/keepassdroid/database/PwEntryV3;->DEFAULT_DATE:Ljava/util/Date;

    .line 80
    new-instance v0, Lcom/keepassdroid/database/PwDate;

    sget-object v1, Lcom/keepassdroid/database/PwEntryV3;->NEVER_EXPIRE:Ljava/util/Date;

    invoke-direct {v0, v1}, Lcom/keepassdroid/database/PwDate;-><init>(Ljava/util/Date;)V

    sput-object v0, Lcom/keepassdroid/database/PwEntryV3;->PW_NEVER_EXPIRE:Lcom/keepassdroid/database/PwDate;

    .line 81
    new-instance v0, Lcom/keepassdroid/database/PwDate;

    sget-object v1, Lcom/keepassdroid/database/PwEntryV3;->NEVER_EXPIRE_BUG:Ljava/util/Date;

    invoke-direct {v0, v1}, Lcom/keepassdroid/database/PwDate;-><init>(Ljava/util/Date;)V

    sput-object v0, Lcom/keepassdroid/database/PwEntryV3;->PW_NEVER_EXPIRE_BUG:Lcom/keepassdroid/database/PwDate;

    .line 82
    new-instance v0, Lcom/keepassdroid/database/PwDate;

    sget-object v1, Lcom/keepassdroid/database/PwEntryV3;->DEFAULT_DATE:Ljava/util/Date;

    invoke-direct {v0, v1}, Lcom/keepassdroid/database/PwDate;-><init>(Ljava/util/Date;)V

    sput-object v0, Lcom/keepassdroid/database/PwEntryV3;->DEFAULT_PWDATE:Lcom/keepassdroid/database/PwDate;

    return-void

    .line 75
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 162
    invoke-direct {p0}, Lcom/keepassdroid/database/PwEntry;-><init>()V

    .line 158
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/keepassdroid/database/PwEntryV3;->parent:Lcom/keepassdroid/database/PwGroupV3;

    .line 163
    return-void
.end method

.method public constructor <init>(Lcom/keepassdroid/database/PwGroupV3;)V
    .locals 1
    .param p1, "p"    # Lcom/keepassdroid/database/PwGroupV3;

    .prologue
    const/4 v0, 0x1

    .line 172
    invoke-direct {p0, p1, v0, v0}, Lcom/keepassdroid/database/PwEntryV3;-><init>(Lcom/keepassdroid/database/PwGroupV3;ZZ)V

    .line 173
    return-void
.end method

.method public constructor <init>(Lcom/keepassdroid/database/PwGroupV3;ZZ)V
    .locals 5
    .param p1, "p"    # Lcom/keepassdroid/database/PwGroupV3;
    .param p2, "initId"    # Z
    .param p3, "initDates"    # Z

    .prologue
    .line 175
    invoke-direct {p0}, Lcom/keepassdroid/database/PwEntry;-><init>()V

    .line 158
    const/4 v3, 0x0

    iput-object v3, p0, Lcom/keepassdroid/database/PwEntryV3;->parent:Lcom/keepassdroid/database/PwGroupV3;

    .line 177
    iput-object p1, p0, Lcom/keepassdroid/database/PwEntryV3;->parent:Lcom/keepassdroid/database/PwGroupV3;

    .line 178
    iget-object v3, p0, Lcom/keepassdroid/database/PwEntryV3;->parent:Lcom/keepassdroid/database/PwGroupV3;

    invoke-virtual {v3}, Lcom/keepassdroid/database/PwGroupV3;->getId()Lcom/keepassdroid/database/PwGroupId;

    move-result-object v3

    check-cast v3, Lcom/keepassdroid/database/PwGroupIdV3;

    invoke-virtual {v3}, Lcom/keepassdroid/database/PwGroupIdV3;->getId()I

    move-result v3

    iput v3, p0, Lcom/keepassdroid/database/PwEntryV3;->groupId:I

    .line 180
    if-eqz p2, :cond_0

    .line 181
    new-instance v2, Ljava/util/Random;

    invoke-direct {v2}, Ljava/util/Random;-><init>()V

    .line 182
    .local v2, "random":Ljava/util/Random;
    const/16 v3, 0x10

    new-array v3, v3, [B

    iput-object v3, p0, Lcom/keepassdroid/database/PwEntryV3;->uuid:[B

    .line 183
    iget-object v3, p0, Lcom/keepassdroid/database/PwEntryV3;->uuid:[B

    invoke-virtual {v2, v3}, Ljava/util/Random;->nextBytes([B)V

    .line 186
    .end local v2    # "random":Ljava/util/Random;
    :cond_0
    if-eqz p3, :cond_1

    .line 187
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v0

    .line 188
    .local v0, "cal":Ljava/util/Calendar;
    invoke-virtual {v0}, Ljava/util/Calendar;->getTime()Ljava/util/Date;

    move-result-object v1

    .line 189
    .local v1, "now":Ljava/util/Date;
    new-instance v3, Lcom/keepassdroid/database/PwDate;

    invoke-direct {v3, v1}, Lcom/keepassdroid/database/PwDate;-><init>(Ljava/util/Date;)V

    iput-object v3, p0, Lcom/keepassdroid/database/PwEntryV3;->tCreation:Lcom/keepassdroid/database/PwDate;

    .line 190
    new-instance v3, Lcom/keepassdroid/database/PwDate;

    invoke-direct {v3, v1}, Lcom/keepassdroid/database/PwDate;-><init>(Ljava/util/Date;)V

    iput-object v3, p0, Lcom/keepassdroid/database/PwEntryV3;->tLastAccess:Lcom/keepassdroid/database/PwDate;

    .line 191
    new-instance v3, Lcom/keepassdroid/database/PwDate;

    invoke-direct {v3, v1}, Lcom/keepassdroid/database/PwDate;-><init>(Ljava/util/Date;)V

    iput-object v3, p0, Lcom/keepassdroid/database/PwEntryV3;->tLastMod:Lcom/keepassdroid/database/PwDate;

    .line 192
    new-instance v3, Lcom/keepassdroid/database/PwDate;

    sget-object v4, Lcom/keepassdroid/database/PwEntryV3;->NEVER_EXPIRE:Ljava/util/Date;

    invoke-direct {v3, v4}, Lcom/keepassdroid/database/PwDate;-><init>(Ljava/util/Date;)V

    iput-object v3, p0, Lcom/keepassdroid/database/PwEntryV3;->tExpire:Lcom/keepassdroid/database/PwDate;

    .line 195
    .end local v0    # "cal":Ljava/util/Calendar;
    .end local v1    # "now":Ljava/util/Date;
    :cond_1
    return-void
.end method

.method public static IsNever(Ljava/util/Date;)Z
    .locals 1
    .param p0, "date"    # Ljava/util/Date;

    .prologue
    .line 154
    sget-object v0, Lcom/keepassdroid/database/PwEntryV3;->NEVER_EXPIRE:Ljava/util/Date;

    invoke-static {v0, p0}, Lcom/keepassdroid/database/PwDate;->IsSameDate(Ljava/util/Date;Ljava/util/Date;)Z

    move-result v0

    return v0
.end method

.method private assign(Lcom/keepassdroid/database/PwEntryV3;)V
    .locals 5
    .param p1, "source"    # Lcom/keepassdroid/database/PwEntryV3;

    .prologue
    const/4 v4, 0x0

    .line 301
    iget-object v2, p1, Lcom/keepassdroid/database/PwEntryV3;->title:Ljava/lang/String;

    iput-object v2, p0, Lcom/keepassdroid/database/PwEntryV3;->title:Ljava/lang/String;

    .line 302
    iget-object v2, p1, Lcom/keepassdroid/database/PwEntryV3;->url:Ljava/lang/String;

    iput-object v2, p0, Lcom/keepassdroid/database/PwEntryV3;->url:Ljava/lang/String;

    .line 303
    iget v2, p1, Lcom/keepassdroid/database/PwEntryV3;->groupId:I

    iput v2, p0, Lcom/keepassdroid/database/PwEntryV3;->groupId:I

    .line 304
    iget-object v2, p1, Lcom/keepassdroid/database/PwEntryV3;->username:Ljava/lang/String;

    iput-object v2, p0, Lcom/keepassdroid/database/PwEntryV3;->username:Ljava/lang/String;

    .line 305
    iget-object v2, p1, Lcom/keepassdroid/database/PwEntryV3;->additional:Ljava/lang/String;

    iput-object v2, p0, Lcom/keepassdroid/database/PwEntryV3;->additional:Ljava/lang/String;

    .line 306
    iget-object v2, p1, Lcom/keepassdroid/database/PwEntryV3;->uuid:[B

    iput-object v2, p0, Lcom/keepassdroid/database/PwEntryV3;->uuid:[B

    .line 308
    iget-object v2, p1, Lcom/keepassdroid/database/PwEntryV3;->password:[B

    array-length v1, v2

    .line 309
    .local v1, "passLen":I
    new-array v2, v1, [B

    iput-object v2, p0, Lcom/keepassdroid/database/PwEntryV3;->password:[B

    .line 310
    iget-object v2, p1, Lcom/keepassdroid/database/PwEntryV3;->password:[B

    iget-object v3, p0, Lcom/keepassdroid/database/PwEntryV3;->password:[B

    invoke-static {v2, v4, v3, v4, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 312
    iget-object v2, p1, Lcom/keepassdroid/database/PwEntryV3;->tCreation:Lcom/keepassdroid/database/PwDate;

    invoke-virtual {v2}, Lcom/keepassdroid/database/PwDate;->clone()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/keepassdroid/database/PwDate;

    iput-object v2, p0, Lcom/keepassdroid/database/PwEntryV3;->tCreation:Lcom/keepassdroid/database/PwDate;

    .line 313
    iget-object v2, p1, Lcom/keepassdroid/database/PwEntryV3;->tLastMod:Lcom/keepassdroid/database/PwDate;

    invoke-virtual {v2}, Lcom/keepassdroid/database/PwDate;->clone()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/keepassdroid/database/PwDate;

    iput-object v2, p0, Lcom/keepassdroid/database/PwEntryV3;->tLastMod:Lcom/keepassdroid/database/PwDate;

    .line 314
    iget-object v2, p1, Lcom/keepassdroid/database/PwEntryV3;->tLastAccess:Lcom/keepassdroid/database/PwDate;

    invoke-virtual {v2}, Lcom/keepassdroid/database/PwDate;->clone()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/keepassdroid/database/PwDate;

    iput-object v2, p0, Lcom/keepassdroid/database/PwEntryV3;->tLastAccess:Lcom/keepassdroid/database/PwDate;

    .line 315
    iget-object v2, p1, Lcom/keepassdroid/database/PwEntryV3;->tExpire:Lcom/keepassdroid/database/PwDate;

    invoke-virtual {v2}, Lcom/keepassdroid/database/PwDate;->clone()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/keepassdroid/database/PwDate;

    iput-object v2, p0, Lcom/keepassdroid/database/PwEntryV3;->tExpire:Lcom/keepassdroid/database/PwDate;

    .line 317
    iget-object v2, p1, Lcom/keepassdroid/database/PwEntryV3;->binaryDesc:Ljava/lang/String;

    iput-object v2, p0, Lcom/keepassdroid/database/PwEntryV3;->binaryDesc:Ljava/lang/String;

    .line 319
    iget-object v2, p1, Lcom/keepassdroid/database/PwEntryV3;->binaryData:[B

    if-eqz v2, :cond_0

    .line 320
    iget-object v2, p1, Lcom/keepassdroid/database/PwEntryV3;->binaryData:[B

    array-length v0, v2

    .line 321
    .local v0, "descLen":I
    new-array v2, v0, [B

    iput-object v2, p0, Lcom/keepassdroid/database/PwEntryV3;->binaryData:[B

    .line 322
    iget-object v2, p1, Lcom/keepassdroid/database/PwEntryV3;->binaryData:[B

    iget-object v3, p0, Lcom/keepassdroid/database/PwEntryV3;->binaryData:[B

    invoke-static {v2, v4, v3, v4, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 325
    .end local v0    # "descLen":I
    :cond_0
    iget-object v2, p1, Lcom/keepassdroid/database/PwEntryV3;->parent:Lcom/keepassdroid/database/PwGroupV3;

    iput-object v2, p0, Lcom/keepassdroid/database/PwEntryV3;->parent:Lcom/keepassdroid/database/PwGroupV3;

    .line 327
    return-void
.end method

.method private static fill([BB)V
    .locals 2
    .param p0, "array"    # [B
    .param p1, "value"    # B

    .prologue
    .line 219
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v1, p0

    if-ge v0, v1, :cond_0

    .line 220
    aput-byte p1, p0, v0

    .line 219
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 221
    :cond_0
    return-void
.end method

.method private static getDefaultDate()Ljava/util/Date;
    .locals 4

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 112
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v0

    .line 113
    .local v0, "cal":Ljava/util/Calendar;
    const/16 v1, 0x7d4

    invoke-virtual {v0, v3, v1}, Ljava/util/Calendar;->set(II)V

    .line 114
    const/4 v1, 0x2

    invoke-virtual {v0, v1, v2}, Ljava/util/Calendar;->set(II)V

    .line 115
    const/4 v1, 0x5

    invoke-virtual {v0, v1, v3}, Ljava/util/Calendar;->set(II)V

    .line 116
    const/16 v1, 0xa

    invoke-virtual {v0, v1, v2}, Ljava/util/Calendar;->set(II)V

    .line 117
    const/16 v1, 0xc

    invoke-virtual {v0, v1, v2}, Ljava/util/Calendar;->set(II)V

    .line 118
    const/16 v1, 0xd

    invoke-virtual {v0, v1, v2}, Ljava/util/Calendar;->set(II)V

    .line 120
    invoke-virtual {v0}, Ljava/util/Calendar;->getTime()Ljava/util/Date;

    move-result-object v1

    return-object v1
.end method

.method private static getNeverExpire()Ljava/util/Date;
    .locals 4

    .prologue
    const/16 v3, 0x3b

    .line 124
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v0

    .line 125
    .local v0, "cal":Ljava/util/Calendar;
    const/4 v1, 0x1

    const/16 v2, 0xbb7

    invoke-virtual {v0, v1, v2}, Ljava/util/Calendar;->set(II)V

    .line 126
    const/4 v1, 0x2

    const/16 v2, 0xb

    invoke-virtual {v0, v1, v2}, Ljava/util/Calendar;->set(II)V

    .line 127
    const/4 v1, 0x5

    const/16 v2, 0x1c

    invoke-virtual {v0, v1, v2}, Ljava/util/Calendar;->set(II)V

    .line 128
    const/16 v1, 0xa

    const/16 v2, 0x17

    invoke-virtual {v0, v1, v2}, Ljava/util/Calendar;->set(II)V

    .line 129
    const/16 v1, 0xc

    invoke-virtual {v0, v1, v3}, Ljava/util/Calendar;->set(II)V

    .line 130
    const/16 v1, 0xd

    invoke-virtual {v0, v1, v3}, Ljava/util/Calendar;->set(II)V

    .line 132
    invoke-virtual {v0}, Ljava/util/Calendar;->getTime()Ljava/util/Date;

    move-result-object v1

    return-object v1
.end method

.method private static getNeverExpireBug()Ljava/util/Date;
    .locals 4

    .prologue
    const/16 v3, 0x3b

    .line 142
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v0

    .line 143
    .local v0, "cal":Ljava/util/Calendar;
    const/4 v1, 0x1

    const/16 v2, 0xbb7

    invoke-virtual {v0, v1, v2}, Ljava/util/Calendar;->set(II)V

    .line 144
    const/4 v1, 0x2

    const/16 v2, 0xb

    invoke-virtual {v0, v1, v2}, Ljava/util/Calendar;->set(II)V

    .line 145
    const/4 v1, 0x5

    const/16 v2, 0x1e

    invoke-virtual {v0, v1, v2}, Ljava/util/Calendar;->set(II)V

    .line 146
    const/16 v1, 0xa

    const/16 v2, 0x17

    invoke-virtual {v0, v1, v2}, Ljava/util/Calendar;->set(II)V

    .line 147
    const/16 v1, 0xc

    invoke-virtual {v0, v1, v3}, Ljava/util/Calendar;->set(II)V

    .line 148
    const/16 v1, 0xd

    invoke-virtual {v0, v1, v3}, Ljava/util/Calendar;->set(II)V

    .line 150
    invoke-virtual {v0}, Ljava/util/Calendar;->getTime()Ljava/util/Date;

    move-result-object v1

    return-object v1
.end method


# virtual methods
.method public assign(Lcom/keepassdroid/database/PwEntry;)V
    .locals 3
    .param p1, "source"    # Lcom/keepassdroid/database/PwEntry;

    .prologue
    .line 289
    instance-of v1, p1, Lcom/keepassdroid/database/PwEntryV3;

    if-nez v1, :cond_0

    .line 290
    new-instance v1, Ljava/lang/RuntimeException;

    const-string v2, "DB version mix"

    invoke-direct {v1, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 293
    :cond_0
    invoke-super {p0, p1}, Lcom/keepassdroid/database/PwEntry;->assign(Lcom/keepassdroid/database/PwEntry;)V

    move-object v0, p1

    .line 295
    check-cast v0, Lcom/keepassdroid/database/PwEntryV3;

    .line 296
    .local v0, "src":Lcom/keepassdroid/database/PwEntryV3;
    invoke-direct {p0, v0}, Lcom/keepassdroid/database/PwEntryV3;->assign(Lcom/keepassdroid/database/PwEntryV3;)V

    .line 298
    return-void
.end method

.method public clone()Ljava/lang/Object;
    .locals 6

    .prologue
    const/4 v5, 0x0

    .line 331
    invoke-super {p0}, Lcom/keepassdroid/database/PwEntry;->clone()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/keepassdroid/database/PwEntryV3;

    .line 333
    .local v1, "newEntry":Lcom/keepassdroid/database/PwEntryV3;
    iget-object v3, p0, Lcom/keepassdroid/database/PwEntryV3;->password:[B

    if-eqz v3, :cond_0

    .line 334
    iget-object v3, p0, Lcom/keepassdroid/database/PwEntryV3;->password:[B

    array-length v2, v3

    .line 335
    .local v2, "passLen":I
    new-array v3, v2, [B

    iput-object v3, p0, Lcom/keepassdroid/database/PwEntryV3;->password:[B

    .line 336
    iget-object v3, p0, Lcom/keepassdroid/database/PwEntryV3;->password:[B

    iget-object v4, v1, Lcom/keepassdroid/database/PwEntryV3;->password:[B

    invoke-static {v3, v5, v4, v5, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 339
    .end local v2    # "passLen":I
    :cond_0
    iget-object v3, p0, Lcom/keepassdroid/database/PwEntryV3;->tCreation:Lcom/keepassdroid/database/PwDate;

    invoke-virtual {v3}, Lcom/keepassdroid/database/PwDate;->clone()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/keepassdroid/database/PwDate;

    iput-object v3, v1, Lcom/keepassdroid/database/PwEntryV3;->tCreation:Lcom/keepassdroid/database/PwDate;

    .line 340
    iget-object v3, p0, Lcom/keepassdroid/database/PwEntryV3;->tLastMod:Lcom/keepassdroid/database/PwDate;

    invoke-virtual {v3}, Lcom/keepassdroid/database/PwDate;->clone()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/keepassdroid/database/PwDate;

    iput-object v3, v1, Lcom/keepassdroid/database/PwEntryV3;->tLastMod:Lcom/keepassdroid/database/PwDate;

    .line 341
    iget-object v3, p0, Lcom/keepassdroid/database/PwEntryV3;->tLastAccess:Lcom/keepassdroid/database/PwDate;

    invoke-virtual {v3}, Lcom/keepassdroid/database/PwDate;->clone()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/keepassdroid/database/PwDate;

    iput-object v3, v1, Lcom/keepassdroid/database/PwEntryV3;->tLastAccess:Lcom/keepassdroid/database/PwDate;

    .line 342
    iget-object v3, p0, Lcom/keepassdroid/database/PwEntryV3;->tExpire:Lcom/keepassdroid/database/PwDate;

    invoke-virtual {v3}, Lcom/keepassdroid/database/PwDate;->clone()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/keepassdroid/database/PwDate;

    iput-object v3, v1, Lcom/keepassdroid/database/PwEntryV3;->tExpire:Lcom/keepassdroid/database/PwDate;

    .line 344
    iget-object v3, p0, Lcom/keepassdroid/database/PwEntryV3;->binaryDesc:Ljava/lang/String;

    iput-object v3, v1, Lcom/keepassdroid/database/PwEntryV3;->binaryDesc:Ljava/lang/String;

    .line 346
    iget-object v3, p0, Lcom/keepassdroid/database/PwEntryV3;->binaryData:[B

    if-eqz v3, :cond_1

    .line 347
    iget-object v3, p0, Lcom/keepassdroid/database/PwEntryV3;->binaryData:[B

    array-length v0, v3

    .line 348
    .local v0, "descLen":I
    new-array v3, v0, [B

    iput-object v3, v1, Lcom/keepassdroid/database/PwEntryV3;->binaryData:[B

    .line 349
    iget-object v3, p0, Lcom/keepassdroid/database/PwEntryV3;->binaryData:[B

    iget-object v4, v1, Lcom/keepassdroid/database/PwEntryV3;->binaryData:[B

    invoke-static {v3, v5, v4, v5, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 352
    .end local v0    # "descLen":I
    :cond_1
    iget-object v3, p0, Lcom/keepassdroid/database/PwEntryV3;->parent:Lcom/keepassdroid/database/PwGroupV3;

    iput-object v3, v1, Lcom/keepassdroid/database/PwEntryV3;->parent:Lcom/keepassdroid/database/PwGroupV3;

    .line 355
    return-object v1
.end method

.method public expires()Z
    .locals 1

    .prologue
    .line 469
    iget-object v0, p0, Lcom/keepassdroid/database/PwEntryV3;->tExpire:Lcom/keepassdroid/database/PwDate;

    invoke-virtual {v0}, Lcom/keepassdroid/database/PwDate;->getJDate()Ljava/util/Date;

    move-result-object v0

    invoke-static {v0}, Lcom/keepassdroid/database/PwEntryV3;->IsNever(Ljava/util/Date;)Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getBinaryData()[B
    .locals 1

    .prologue
    .line 253
    iget-object v0, p0, Lcom/keepassdroid/database/PwEntryV3;->binaryData:[B

    return-object v0
.end method

.method public getCreationTime()Ljava/util/Date;
    .locals 1

    .prologue
    .line 365
    iget-object v0, p0, Lcom/keepassdroid/database/PwEntryV3;->tCreation:Lcom/keepassdroid/database/PwDate;

    invoke-virtual {v0}, Lcom/keepassdroid/database/PwDate;->getJDate()Ljava/util/Date;

    move-result-object v0

    return-object v0
.end method

.method public getExpiryTime()Ljava/util/Date;
    .locals 1

    .prologue
    .line 370
    iget-object v0, p0, Lcom/keepassdroid/database/PwEntryV3;->tExpire:Lcom/keepassdroid/database/PwDate;

    invoke-virtual {v0}, Lcom/keepassdroid/database/PwDate;->getJDate()Ljava/util/Date;

    move-result-object v0

    return-object v0
.end method

.method public getLastAccessTime()Ljava/util/Date;
    .locals 1

    .prologue
    .line 360
    iget-object v0, p0, Lcom/keepassdroid/database/PwEntryV3;->tLastAccess:Lcom/keepassdroid/database/PwDate;

    invoke-virtual {v0}, Lcom/keepassdroid/database/PwDate;->getJDate()Ljava/util/Date;

    move-result-object v0

    return-object v0
.end method

.method public getLastModificationTime()Ljava/util/Date;
    .locals 1

    .prologue
    .line 375
    iget-object v0, p0, Lcom/keepassdroid/database/PwEntryV3;->tLastMod:Lcom/keepassdroid/database/PwDate;

    invoke-virtual {v0}, Lcom/keepassdroid/database/PwDate;->getJDate()Ljava/util/Date;

    move-result-object v0

    return-object v0
.end method

.method public getNotes(ZLcom/keepassdroid/database/PwDatabase;)Ljava/lang/String;
    .locals 1
    .param p1, "decodeRef"    # Z
    .param p2, "db"    # Lcom/keepassdroid/database/PwDatabase;

    .prologue
    .line 449
    iget-object v0, p0, Lcom/keepassdroid/database/PwEntryV3;->additional:Ljava/lang/String;

    return-object v0
.end method

.method public bridge synthetic getParent()Lcom/keepassdroid/database/PwGroup;
    .locals 1

    .prologue
    .line 75
    invoke-virtual {p0}, Lcom/keepassdroid/database/PwEntryV3;->getParent()Lcom/keepassdroid/database/PwGroupV3;

    move-result-object v0

    return-object v0
.end method

.method public getParent()Lcom/keepassdroid/database/PwGroupV3;
    .locals 1

    .prologue
    .line 410
    iget-object v0, p0, Lcom/keepassdroid/database/PwEntryV3;->parent:Lcom/keepassdroid/database/PwGroupV3;

    return-object v0
.end method

.method public getPassword(ZLcom/keepassdroid/database/PwDatabase;)Ljava/lang/String;
    .locals 2
    .param p1, "decodeRef"    # Z
    .param p2, "db"    # Lcom/keepassdroid/database/PwDatabase;

    .prologue
    .line 202
    iget-object v0, p0, Lcom/keepassdroid/database/PwEntryV3;->password:[B

    if-nez v0, :cond_0

    .line 203
    const-string v0, ""

    .line 206
    :goto_0
    return-object v0

    :cond_0
    new-instance v0, Ljava/lang/String;

    iget-object v1, p0, Lcom/keepassdroid/database/PwEntryV3;->password:[B

    invoke-direct {v0, v1}, Ljava/lang/String;-><init>([B)V

    goto :goto_0
.end method

.method public getPasswordBytes()[B
    .locals 1

    .prologue
    .line 210
    iget-object v0, p0, Lcom/keepassdroid/database/PwEntryV3;->password:[B

    return-object v0
.end method

.method public getTitle(ZLcom/keepassdroid/database/PwDatabase;)Ljava/lang/String;
    .locals 1
    .param p1, "decodeRef"    # Z
    .param p2, "db"    # Lcom/keepassdroid/database/PwDatabase;

    .prologue
    .line 439
    iget-object v0, p0, Lcom/keepassdroid/database/PwEntryV3;->title:Ljava/lang/String;

    return-object v0
.end method

.method public getUUID()Ljava/util/UUID;
    .locals 1

    .prologue
    .line 415
    iget-object v0, p0, Lcom/keepassdroid/database/PwEntryV3;->uuid:[B

    invoke-static {v0}, Lcom/keepassdroid/utils/Types;->bytestoUUID([B)Ljava/util/UUID;

    move-result-object v0

    return-object v0
.end method

.method public getUrl(ZLcom/keepassdroid/database/PwDatabase;)Ljava/lang/String;
    .locals 1
    .param p1, "decodeRef"    # Z
    .param p2, "db"    # Lcom/keepassdroid/database/PwDatabase;

    .prologue
    .line 459
    iget-object v0, p0, Lcom/keepassdroid/database/PwEntryV3;->url:Ljava/lang/String;

    return-object v0
.end method

.method public getUsername(ZLcom/keepassdroid/database/PwDatabase;)Ljava/lang/String;
    .locals 1
    .param p1, "decodeRef"    # Z
    .param p2, "db"    # Lcom/keepassdroid/database/PwDatabase;

    .prologue
    .line 425
    iget-object v0, p0, Lcom/keepassdroid/database/PwEntryV3;->username:Ljava/lang/String;

    if-nez v0, :cond_0

    .line 426
    const-string v0, ""

    .line 429
    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/keepassdroid/database/PwEntryV3;->username:Ljava/lang/String;

    goto :goto_0
.end method

.method public isMetaStream()Z
    .locals 3

    .prologue
    const/4 v0, 0x0

    .line 271
    iget-object v1, p0, Lcom/keepassdroid/database/PwEntryV3;->binaryData:[B

    if-nez v1, :cond_1

    .line 282
    :cond_0
    :goto_0
    return v0

    .line 272
    :cond_1
    iget-object v1, p0, Lcom/keepassdroid/database/PwEntryV3;->additional:Ljava/lang/String;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/keepassdroid/database/PwEntryV3;->additional:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-eqz v1, :cond_0

    .line 273
    iget-object v1, p0, Lcom/keepassdroid/database/PwEntryV3;->binaryDesc:Ljava/lang/String;

    const-string v2, "bin-stream"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 274
    iget-object v1, p0, Lcom/keepassdroid/database/PwEntryV3;->title:Ljava/lang/String;

    if-eqz v1, :cond_0

    .line 275
    iget-object v1, p0, Lcom/keepassdroid/database/PwEntryV3;->title:Ljava/lang/String;

    const-string v2, "Meta-Info"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 276
    iget-object v1, p0, Lcom/keepassdroid/database/PwEntryV3;->username:Ljava/lang/String;

    if-eqz v1, :cond_0

    .line 277
    iget-object v1, p0, Lcom/keepassdroid/database/PwEntryV3;->username:Ljava/lang/String;

    const-string v2, "SYSTEM"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 278
    iget-object v1, p0, Lcom/keepassdroid/database/PwEntryV3;->url:Ljava/lang/String;

    if-eqz v1, :cond_0

    .line 279
    iget-object v1, p0, Lcom/keepassdroid/database/PwEntryV3;->url:Ljava/lang/String;

    const-string v2, "$"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 280
    iget-object v1, p0, Lcom/keepassdroid/database/PwEntryV3;->icon:Lcom/keepassdroid/database/PwIconStandard;

    invoke-virtual {v1}, Lcom/keepassdroid/database/PwIconStandard;->isMetaStreamIcon()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 282
    const/4 v0, 0x1

    goto :goto_0
.end method

.method public populateBlankFields(Lcom/keepassdroid/database/PwDatabaseV3;)V
    .locals 3
    .param p1, "db"    # Lcom/keepassdroid/database/PwDatabaseV3;

    .prologue
    const/4 v2, 0x0

    .line 473
    iget-object v0, p0, Lcom/keepassdroid/database/PwEntryV3;->icon:Lcom/keepassdroid/database/PwIconStandard;

    if-nez v0, :cond_0

    .line 474
    iget-object v0, p1, Lcom/keepassdroid/database/PwDatabaseV3;->iconFactory:Lcom/keepassdroid/database/PwIconFactory;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/keepassdroid/database/PwIconFactory;->getIcon(I)Lcom/keepassdroid/database/PwIconStandard;

    move-result-object v0

    iput-object v0, p0, Lcom/keepassdroid/database/PwEntryV3;->icon:Lcom/keepassdroid/database/PwIconStandard;

    .line 477
    :cond_0
    iget-object v0, p0, Lcom/keepassdroid/database/PwEntryV3;->username:Ljava/lang/String;

    if-nez v0, :cond_1

    .line 478
    const-string v0, ""

    iput-object v0, p0, Lcom/keepassdroid/database/PwEntryV3;->username:Ljava/lang/String;

    .line 481
    :cond_1
    iget-object v0, p0, Lcom/keepassdroid/database/PwEntryV3;->password:[B

    if-nez v0, :cond_2

    .line 482
    new-array v0, v2, [B

    iput-object v0, p0, Lcom/keepassdroid/database/PwEntryV3;->password:[B

    .line 485
    :cond_2
    iget-object v0, p0, Lcom/keepassdroid/database/PwEntryV3;->uuid:[B

    if-nez v0, :cond_3

    .line 486
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v0

    invoke-static {v0}, Lcom/keepassdroid/utils/Types;->UUIDtoBytes(Ljava/util/UUID;)[B

    move-result-object v0

    iput-object v0, p0, Lcom/keepassdroid/database/PwEntryV3;->uuid:[B

    .line 489
    :cond_3
    iget-object v0, p0, Lcom/keepassdroid/database/PwEntryV3;->title:Ljava/lang/String;

    if-nez v0, :cond_4

    .line 490
    const-string v0, ""

    iput-object v0, p0, Lcom/keepassdroid/database/PwEntryV3;->title:Ljava/lang/String;

    .line 493
    :cond_4
    iget-object v0, p0, Lcom/keepassdroid/database/PwEntryV3;->url:Ljava/lang/String;

    if-nez v0, :cond_5

    .line 494
    const-string v0, ""

    iput-object v0, p0, Lcom/keepassdroid/database/PwEntryV3;->url:Ljava/lang/String;

    .line 497
    :cond_5
    iget-object v0, p0, Lcom/keepassdroid/database/PwEntryV3;->additional:Ljava/lang/String;

    if-nez v0, :cond_6

    .line 498
    const-string v0, ""

    iput-object v0, p0, Lcom/keepassdroid/database/PwEntryV3;->additional:Ljava/lang/String;

    .line 501
    :cond_6
    iget-object v0, p0, Lcom/keepassdroid/database/PwEntryV3;->tCreation:Lcom/keepassdroid/database/PwDate;

    if-nez v0, :cond_7

    .line 502
    sget-object v0, Lcom/keepassdroid/database/PwEntryV3;->DEFAULT_PWDATE:Lcom/keepassdroid/database/PwDate;

    iput-object v0, p0, Lcom/keepassdroid/database/PwEntryV3;->tCreation:Lcom/keepassdroid/database/PwDate;

    .line 505
    :cond_7
    iget-object v0, p0, Lcom/keepassdroid/database/PwEntryV3;->tLastMod:Lcom/keepassdroid/database/PwDate;

    if-nez v0, :cond_8

    .line 506
    sget-object v0, Lcom/keepassdroid/database/PwEntryV3;->DEFAULT_PWDATE:Lcom/keepassdroid/database/PwDate;

    iput-object v0, p0, Lcom/keepassdroid/database/PwEntryV3;->tLastMod:Lcom/keepassdroid/database/PwDate;

    .line 509
    :cond_8
    iget-object v0, p0, Lcom/keepassdroid/database/PwEntryV3;->tLastAccess:Lcom/keepassdroid/database/PwDate;

    if-nez v0, :cond_9

    .line 510
    sget-object v0, Lcom/keepassdroid/database/PwEntryV3;->DEFAULT_PWDATE:Lcom/keepassdroid/database/PwDate;

    iput-object v0, p0, Lcom/keepassdroid/database/PwEntryV3;->tLastAccess:Lcom/keepassdroid/database/PwDate;

    .line 513
    :cond_9
    iget-object v0, p0, Lcom/keepassdroid/database/PwEntryV3;->tExpire:Lcom/keepassdroid/database/PwDate;

    if-nez v0, :cond_a

    .line 514
    sget-object v0, Lcom/keepassdroid/database/PwEntryV3;->PW_NEVER_EXPIRE:Lcom/keepassdroid/database/PwDate;

    iput-object v0, p0, Lcom/keepassdroid/database/PwEntryV3;->tExpire:Lcom/keepassdroid/database/PwDate;

    .line 517
    :cond_a
    iget-object v0, p0, Lcom/keepassdroid/database/PwEntryV3;->binaryDesc:Ljava/lang/String;

    if-nez v0, :cond_b

    .line 518
    const-string v0, ""

    iput-object v0, p0, Lcom/keepassdroid/database/PwEntryV3;->binaryDesc:Ljava/lang/String;

    .line 521
    :cond_b
    iget-object v0, p0, Lcom/keepassdroid/database/PwEntryV3;->binaryData:[B

    if-nez v0, :cond_c

    .line 522
    new-array v0, v2, [B

    iput-object v0, p0, Lcom/keepassdroid/database/PwEntryV3;->binaryData:[B

    .line 524
    :cond_c
    return-void
.end method

.method public setBinaryData([BII)V
    .locals 2
    .param p1, "buf"    # [B
    .param p2, "offset"    # I
    .param p3, "len"    # I

    .prologue
    const/4 v1, 0x0

    .line 260
    iget-object v0, p0, Lcom/keepassdroid/database/PwEntryV3;->binaryData:[B

    if-eqz v0, :cond_0

    .line 261
    iget-object v0, p0, Lcom/keepassdroid/database/PwEntryV3;->binaryData:[B

    invoke-static {v0, v1}, Lcom/keepassdroid/database/PwEntryV3;->fill([BB)V

    .line 262
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/keepassdroid/database/PwEntryV3;->binaryData:[B

    .line 264
    :cond_0
    new-array v0, p3, [B

    iput-object v0, p0, Lcom/keepassdroid/database/PwEntryV3;->binaryData:[B

    .line 265
    iget-object v0, p0, Lcom/keepassdroid/database/PwEntryV3;->binaryData:[B

    invoke-static {p1, p2, v0, v1, p3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 266
    return-void
.end method

.method public setCreationTime(Ljava/util/Date;)V
    .locals 1
    .param p1, "create"    # Ljava/util/Date;

    .prologue
    .line 380
    new-instance v0, Lcom/keepassdroid/database/PwDate;

    invoke-direct {v0, p1}, Lcom/keepassdroid/database/PwDate;-><init>(Ljava/util/Date;)V

    iput-object v0, p0, Lcom/keepassdroid/database/PwEntryV3;->tCreation:Lcom/keepassdroid/database/PwDate;

    .line 382
    return-void
.end method

.method public setExpires(Z)V
    .locals 1
    .param p1, "expires"    # Z

    .prologue
    .line 398
    if-nez p1, :cond_0

    .line 399
    sget-object v0, Lcom/keepassdroid/database/PwEntryV3;->PW_NEVER_EXPIRE:Lcom/keepassdroid/database/PwDate;

    iput-object v0, p0, Lcom/keepassdroid/database/PwEntryV3;->tExpire:Lcom/keepassdroid/database/PwDate;

    .line 401
    :cond_0
    return-void
.end method

.method public setExpiryTime(Ljava/util/Date;)V
    .locals 1
    .param p1, "expires"    # Ljava/util/Date;

    .prologue
    .line 405
    new-instance v0, Lcom/keepassdroid/database/PwDate;

    invoke-direct {v0, p1}, Lcom/keepassdroid/database/PwDate;-><init>(Ljava/util/Date;)V

    iput-object v0, p0, Lcom/keepassdroid/database/PwEntryV3;->tExpire:Lcom/keepassdroid/database/PwDate;

    .line 406
    return-void
.end method

.method public setLastAccessTime(Ljava/util/Date;)V
    .locals 1
    .param p1, "access"    # Ljava/util/Date;

    .prologue
    .line 392
    new-instance v0, Lcom/keepassdroid/database/PwDate;

    invoke-direct {v0, p1}, Lcom/keepassdroid/database/PwDate;-><init>(Ljava/util/Date;)V

    iput-object v0, p0, Lcom/keepassdroid/database/PwEntryV3;->tLastAccess:Lcom/keepassdroid/database/PwDate;

    .line 394
    return-void
.end method

.method public setLastModificationTime(Ljava/util/Date;)V
    .locals 1
    .param p1, "mod"    # Ljava/util/Date;

    .prologue
    .line 386
    new-instance v0, Lcom/keepassdroid/database/PwDate;

    invoke-direct {v0, p1}, Lcom/keepassdroid/database/PwDate;-><init>(Ljava/util/Date;)V

    iput-object v0, p0, Lcom/keepassdroid/database/PwEntryV3;->tLastMod:Lcom/keepassdroid/database/PwDate;

    .line 388
    return-void
.end method

.method public setNotes(Ljava/lang/String;Lcom/keepassdroid/database/PwDatabase;)V
    .locals 0
    .param p1, "notes"    # Ljava/lang/String;
    .param p2, "db"    # Lcom/keepassdroid/database/PwDatabase;

    .prologue
    .line 454
    iput-object p1, p0, Lcom/keepassdroid/database/PwEntryV3;->additional:Ljava/lang/String;

    .line 455
    return-void
.end method

.method public setParent(Lcom/keepassdroid/database/PwGroup;)V
    .locals 0
    .param p1, "parent"    # Lcom/keepassdroid/database/PwGroup;

    .prologue
    .line 528
    check-cast p1, Lcom/keepassdroid/database/PwGroupV3;

    .end local p1    # "parent":Lcom/keepassdroid/database/PwGroup;
    iput-object p1, p0, Lcom/keepassdroid/database/PwEntryV3;->parent:Lcom/keepassdroid/database/PwGroupV3;

    .line 529
    return-void
.end method

.method public setPassword(Ljava/lang/String;Lcom/keepassdroid/database/PwDatabase;)V
    .locals 5
    .param p1, "pass"    # Ljava/lang/String;
    .param p2, "db"    # Lcom/keepassdroid/database/PwDatabase;

    .prologue
    const/4 v4, 0x0

    .line 240
    :try_start_0
    const-string v2, "UTF-8"

    invoke-virtual {p1, v2}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v1

    .line 241
    .local v1, "password":[B
    const/4 v2, 0x0

    array-length v3, v1

    invoke-virtual {p0, v1, v2, v3}, Lcom/keepassdroid/database/PwEntryV3;->setPassword([BII)V
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    .line 247
    :goto_0
    return-void

    .line 242
    .end local v1    # "password":[B
    :catch_0
    move-exception v0

    .line 243
    .local v0, "e":Ljava/io/UnsupportedEncodingException;
    sget-boolean v2, Lcom/keepassdroid/database/PwEntryV3;->$assertionsDisabled:Z

    if-nez v2, :cond_0

    new-instance v2, Ljava/lang/AssertionError;

    invoke-direct {v2}, Ljava/lang/AssertionError;-><init>()V

    throw v2

    .line 244
    :cond_0
    invoke-virtual {p1}, Ljava/lang/String;->getBytes()[B

    move-result-object v1

    .line 245
    .restart local v1    # "password":[B
    array-length v2, v1

    invoke-virtual {p0, v1, v4, v2}, Lcom/keepassdroid/database/PwEntryV3;->setPassword([BII)V

    goto :goto_0
.end method

.method public setPassword([BII)V
    .locals 2
    .param p1, "buf"    # [B
    .param p2, "offset"    # I
    .param p3, "len"    # I

    .prologue
    const/4 v1, 0x0

    .line 226
    iget-object v0, p0, Lcom/keepassdroid/database/PwEntryV3;->password:[B

    if-eqz v0, :cond_0

    .line 227
    iget-object v0, p0, Lcom/keepassdroid/database/PwEntryV3;->password:[B

    invoke-static {v0, v1}, Lcom/keepassdroid/database/PwEntryV3;->fill([BB)V

    .line 228
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/keepassdroid/database/PwEntryV3;->password:[B

    .line 230
    :cond_0
    new-array v0, p3, [B

    iput-object v0, p0, Lcom/keepassdroid/database/PwEntryV3;->password:[B

    .line 231
    iget-object v0, p0, Lcom/keepassdroid/database/PwEntryV3;->password:[B

    invoke-static {p1, p2, v0, v1, p3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 232
    return-void
.end method

.method public setTitle(Ljava/lang/String;Lcom/keepassdroid/database/PwDatabase;)V
    .locals 0
    .param p1, "title"    # Ljava/lang/String;
    .param p2, "db"    # Lcom/keepassdroid/database/PwDatabase;

    .prologue
    .line 444
    iput-object p1, p0, Lcom/keepassdroid/database/PwEntryV3;->title:Ljava/lang/String;

    .line 445
    return-void
.end method

.method public setUUID(Ljava/util/UUID;)V
    .locals 1
    .param p1, "u"    # Ljava/util/UUID;

    .prologue
    .line 420
    invoke-static {p1}, Lcom/keepassdroid/utils/Types;->UUIDtoBytes(Ljava/util/UUID;)[B

    move-result-object v0

    iput-object v0, p0, Lcom/keepassdroid/database/PwEntryV3;->uuid:[B

    .line 421
    return-void
.end method

.method public setUrl(Ljava/lang/String;Lcom/keepassdroid/database/PwDatabase;)V
    .locals 0
    .param p1, "url"    # Ljava/lang/String;
    .param p2, "db"    # Lcom/keepassdroid/database/PwDatabase;

    .prologue
    .line 464
    iput-object p1, p0, Lcom/keepassdroid/database/PwEntryV3;->url:Ljava/lang/String;

    .line 465
    return-void
.end method

.method public setUsername(Ljava/lang/String;Lcom/keepassdroid/database/PwDatabase;)V
    .locals 0
    .param p1, "user"    # Ljava/lang/String;
    .param p2, "db"    # Lcom/keepassdroid/database/PwDatabase;

    .prologue
    .line 434
    iput-object p1, p0, Lcom/keepassdroid/database/PwEntryV3;->username:Ljava/lang/String;

    .line 435
    return-void
.end method
