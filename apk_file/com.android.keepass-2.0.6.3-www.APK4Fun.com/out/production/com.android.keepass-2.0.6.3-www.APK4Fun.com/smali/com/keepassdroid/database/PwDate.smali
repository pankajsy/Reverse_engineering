.class public Lcom/keepassdroid/database/PwDate;
.super Ljava/lang/Object;
.source "PwDate.java"

# interfaces
.implements Ljava/lang/Cloneable;


# static fields
.field private static final DATE_SIZE:I = 0x5


# instance fields
.field private cDate:[B

.field private cDateBuilt:Z

.field private jDate:Ljava/util/Date;

.field private jDateBuilt:Z


# direct methods
.method private constructor <init>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 61
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 39
    iput-boolean v0, p0, Lcom/keepassdroid/database/PwDate;->cDateBuilt:Z

    .line 40
    iput-boolean v0, p0, Lcom/keepassdroid/database/PwDate;->jDateBuilt:Z

    .line 63
    return-void
.end method

.method public constructor <init>(J)V
    .locals 1
    .param p1, "millis"    # J

    .prologue
    const/4 v0, 0x0

    .line 56
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 39
    iput-boolean v0, p0, Lcom/keepassdroid/database/PwDate;->cDateBuilt:Z

    .line 40
    iput-boolean v0, p0, Lcom/keepassdroid/database/PwDate;->jDateBuilt:Z

    .line 57
    new-instance v0, Ljava/util/Date;

    invoke-direct {v0, p1, p2}, Ljava/util/Date;-><init>(J)V

    iput-object v0, p0, Lcom/keepassdroid/database/PwDate;->jDate:Ljava/util/Date;

    .line 58
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/keepassdroid/database/PwDate;->jDateBuilt:Z

    .line 59
    return-void
.end method

.method public constructor <init>(Ljava/util/Date;)V
    .locals 1
    .param p1, "date"    # Ljava/util/Date;

    .prologue
    const/4 v0, 0x0

    .line 51
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 39
    iput-boolean v0, p0, Lcom/keepassdroid/database/PwDate;->cDateBuilt:Z

    .line 40
    iput-boolean v0, p0, Lcom/keepassdroid/database/PwDate;->jDateBuilt:Z

    .line 52
    iput-object p1, p0, Lcom/keepassdroid/database/PwDate;->jDate:Ljava/util/Date;

    .line 53
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/keepassdroid/database/PwDate;->jDateBuilt:Z

    .line 54
    return-void
.end method

.method public constructor <init>([BI)V
    .locals 3
    .param p1, "buf"    # [B
    .param p2, "offset"    # I

    .prologue
    const/4 v2, 0x5

    const/4 v1, 0x0

    .line 45
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 39
    iput-boolean v1, p0, Lcom/keepassdroid/database/PwDate;->cDateBuilt:Z

    .line 40
    iput-boolean v1, p0, Lcom/keepassdroid/database/PwDate;->jDateBuilt:Z

    .line 46
    new-array v0, v2, [B

    iput-object v0, p0, Lcom/keepassdroid/database/PwDate;->cDate:[B

    .line 47
    iget-object v0, p0, Lcom/keepassdroid/database/PwDate;->cDate:[B

    invoke-static {p1, p2, v0, v1, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 48
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/keepassdroid/database/PwDate;->cDateBuilt:Z

    .line 49
    return-void
.end method

.method public static IsSameDate(Ljava/util/Date;Ljava/util/Date;)Z
    .locals 9
    .param p0, "d1"    # Ljava/util/Date;
    .param p1, "d2"    # Ljava/util/Date;

    .prologue
    const/16 v8, 0xa

    const/4 v7, 0x5

    const/4 v6, 0x2

    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 196
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v0

    .line 197
    .local v0, "cal1":Ljava/util/Calendar;
    invoke-virtual {v0, p0}, Ljava/util/Calendar;->setTime(Ljava/util/Date;)V

    .line 198
    const/16 v4, 0xe

    invoke-virtual {v0, v4, v3}, Ljava/util/Calendar;->set(II)V

    .line 200
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v1

    .line 201
    .local v1, "cal2":Ljava/util/Calendar;
    invoke-virtual {v1, p1}, Ljava/util/Calendar;->setTime(Ljava/util/Date;)V

    .line 202
    const/16 v4, 0xe

    invoke-virtual {v1, v4, v3}, Ljava/util/Calendar;->set(II)V

    .line 204
    invoke-virtual {v0, v2}, Ljava/util/Calendar;->get(I)I

    move-result v4

    invoke-virtual {v1, v2}, Ljava/util/Calendar;->get(I)I

    move-result v5

    if-ne v4, v5, :cond_0

    .line 205
    invoke-virtual {v0, v6}, Ljava/util/Calendar;->get(I)I

    move-result v4

    invoke-virtual {v1, v6}, Ljava/util/Calendar;->get(I)I

    move-result v5

    if-ne v4, v5, :cond_0

    .line 206
    invoke-virtual {v0, v7}, Ljava/util/Calendar;->get(I)I

    move-result v4

    invoke-virtual {v1, v7}, Ljava/util/Calendar;->get(I)I

    move-result v5

    if-ne v4, v5, :cond_0

    .line 207
    invoke-virtual {v0, v8}, Ljava/util/Calendar;->get(I)I

    move-result v4

    invoke-virtual {v1, v8}, Ljava/util/Calendar;->get(I)I

    move-result v5

    if-ne v4, v5, :cond_0

    const/16 v4, 0xc

    .line 208
    invoke-virtual {v0, v4}, Ljava/util/Calendar;->get(I)I

    move-result v4

    const/16 v5, 0xc

    invoke-virtual {v1, v5}, Ljava/util/Calendar;->get(I)I

    move-result v5

    if-ne v4, v5, :cond_0

    const/16 v4, 0xd

    .line 209
    invoke-virtual {v0, v4}, Ljava/util/Calendar;->get(I)I

    move-result v4

    const/16 v5, 0xd

    invoke-virtual {v1, v5}, Ljava/util/Calendar;->get(I)I

    move-result v5

    if-ne v4, v5, :cond_0

    :goto_0
    return v2

    :cond_0
    move v2, v3

    goto :goto_0
.end method

.method public static readTime([BILjava/util/Calendar;)Ljava/util/Date;
    .locals 13
    .param p0, "buf"    # [B
    .param p1, "offset"    # I
    .param p2, "time"    # Ljava/util/Calendar;

    .prologue
    .line 110
    invoke-static {p0, p1}, Lcom/keepassdroid/utils/Types;->readUByte([BI)I

    move-result v7

    .line 111
    .local v7, "dw1":I
    add-int/lit8 v0, p1, 0x1

    invoke-static {p0, v0}, Lcom/keepassdroid/utils/Types;->readUByte([BI)I

    move-result v8

    .line 112
    .local v8, "dw2":I
    add-int/lit8 v0, p1, 0x2

    invoke-static {p0, v0}, Lcom/keepassdroid/utils/Types;->readUByte([BI)I

    move-result v9

    .line 113
    .local v9, "dw3":I
    add-int/lit8 v0, p1, 0x3

    invoke-static {p0, v0}, Lcom/keepassdroid/utils/Types;->readUByte([BI)I

    move-result v10

    .line 114
    .local v10, "dw4":I
    add-int/lit8 v0, p1, 0x4

    invoke-static {p0, v0}, Lcom/keepassdroid/utils/Types;->readUByte([BI)I

    move-result v11

    .line 117
    .local v11, "dw5":I
    shl-int/lit8 v0, v7, 0x6

    shr-int/lit8 v2, v8, 0x2

    or-int v1, v0, v2

    .line 118
    .local v1, "year":I
    and-int/lit8 v0, v8, 0x3

    shl-int/lit8 v0, v0, 0x2

    shr-int/lit8 v2, v9, 0x6

    or-int v12, v0, v2

    .line 120
    .local v12, "month":I
    shr-int/lit8 v0, v9, 0x1

    and-int/lit8 v3, v0, 0x1f

    .line 121
    .local v3, "day":I
    and-int/lit8 v0, v9, 0x1

    shl-int/lit8 v0, v0, 0x4

    shr-int/lit8 v2, v10, 0x4

    or-int v4, v0, v2

    .line 122
    .local v4, "hour":I
    and-int/lit8 v0, v10, 0xf

    shl-int/lit8 v0, v0, 0x2

    shr-int/lit8 v2, v11, 0x6

    or-int v5, v0, v2

    .line 123
    .local v5, "minute":I
    and-int/lit8 v6, v11, 0x3f

    .line 125
    .local v6, "second":I
    if-nez p2, :cond_0

    .line 126
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object p2

    .line 130
    :cond_0
    add-int/lit8 v2, v12, -0x1

    move-object v0, p2

    invoke-virtual/range {v0 .. v6}, Ljava/util/Calendar;->set(IIIIII)V

    .line 132
    invoke-virtual {p2}, Ljava/util/Calendar;->getTime()Ljava/util/Date;

    move-result-object v0

    return-object v0
.end method

.method public static writeTime(Ljava/util/Date;)[B
    .locals 1
    .param p0, "date"    # Ljava/util/Date;

    .prologue
    .line 137
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lcom/keepassdroid/database/PwDate;->writeTime(Ljava/util/Date;Ljava/util/Calendar;)[B

    move-result-object v0

    return-object v0
.end method

.method public static writeTime(Ljava/util/Date;Ljava/util/Calendar;)[B
    .locals 11
    .param p0, "date"    # Ljava/util/Date;
    .param p1, "cal"    # Ljava/util/Calendar;

    .prologue
    const/4 v8, 0x5

    const/4 v10, 0x2

    const/4 v9, 0x1

    .line 141
    if-nez p0, :cond_0

    .line 142
    const/4 v0, 0x0

    .line 168
    :goto_0
    return-object v0

    .line 145
    :cond_0
    new-array v0, v8, [B

    .line 146
    .local v0, "buf":[B
    if-nez p1, :cond_1

    .line 147
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object p1

    .line 149
    :cond_1
    invoke-virtual {p1, p0}, Ljava/util/Calendar;->setTime(Ljava/util/Date;)V

    .line 151
    invoke-virtual {p1, v9}, Ljava/util/Calendar;->get(I)I

    move-result v6

    .line 153
    .local v6, "year":I
    invoke-virtual {p1, v10}, Ljava/util/Calendar;->get(I)I

    move-result v7

    add-int/lit8 v4, v7, 0x1

    .line 155
    .local v4, "month":I
    invoke-virtual {p1, v8}, Ljava/util/Calendar;->get(I)I

    move-result v7

    add-int/lit8 v1, v7, -0x1

    .line 156
    .local v1, "day":I
    const/16 v7, 0xb

    invoke-virtual {p1, v7}, Ljava/util/Calendar;->get(I)I

    move-result v2

    .line 157
    .local v2, "hour":I
    const/16 v7, 0xc

    invoke-virtual {p1, v7}, Ljava/util/Calendar;->get(I)I

    move-result v3

    .line 158
    .local v3, "minute":I
    const/16 v7, 0xd

    invoke-virtual {p1, v7}, Ljava/util/Calendar;->get(I)I

    move-result v5

    .line 160
    .local v5, "second":I
    const/4 v7, 0x0

    shr-int/lit8 v8, v6, 0x6

    and-int/lit8 v8, v8, 0x3f

    invoke-static {v8}, Lcom/keepassdroid/utils/Types;->writeUByte(I)B

    move-result v8

    aput-byte v8, v0, v7

    .line 161
    and-int/lit8 v7, v6, 0x3f

    shl-int/lit8 v7, v7, 0x2

    shr-int/lit8 v8, v4, 0x2

    and-int/lit8 v8, v8, 0x3

    or-int/2addr v7, v8

    invoke-static {v7}, Lcom/keepassdroid/utils/Types;->writeUByte(I)B

    move-result v7

    aput-byte v7, v0, v9

    .line 163
    and-int/lit8 v7, v4, 0x3

    shl-int/lit8 v7, v7, 0x6

    and-int/lit8 v8, v1, 0x1f

    shl-int/lit8 v8, v8, 0x1

    or-int/2addr v7, v8

    shr-int/lit8 v8, v2, 0x4

    and-int/lit8 v8, v8, 0x1

    or-int/2addr v7, v8

    int-to-byte v7, v7

    aput-byte v7, v0, v10

    .line 165
    const/4 v7, 0x3

    and-int/lit8 v8, v2, 0xf

    shl-int/lit8 v8, v8, 0x4

    shr-int/lit8 v9, v3, 0x2

    and-int/lit8 v9, v9, 0xf

    or-int/2addr v8, v9

    int-to-byte v8, v8

    aput-byte v8, v0, v7

    .line 166
    const/4 v7, 0x4

    and-int/lit8 v8, v3, 0x3

    shl-int/lit8 v8, v8, 0x6

    and-int/lit8 v9, v5, 0x3f

    or-int/2addr v8, v9

    int-to-byte v8, v8

    aput-byte v8, v0, v7

    goto :goto_0
.end method


# virtual methods
.method public clone()Ljava/lang/Object;
    .locals 6

    .prologue
    const/4 v5, 0x5

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 67
    new-instance v0, Lcom/keepassdroid/database/PwDate;

    invoke-direct {v0}, Lcom/keepassdroid/database/PwDate;-><init>()V

    .line 69
    .local v0, "copy":Lcom/keepassdroid/database/PwDate;
    iget-boolean v2, p0, Lcom/keepassdroid/database/PwDate;->cDateBuilt:Z

    if-eqz v2, :cond_0

    .line 70
    new-array v1, v5, [B

    .line 71
    .local v1, "newC":[B
    iget-object v2, p0, Lcom/keepassdroid/database/PwDate;->cDate:[B

    invoke-static {v2, v3, v1, v3, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 72
    iput-object v1, v0, Lcom/keepassdroid/database/PwDate;->cDate:[B

    .line 73
    iput-boolean v4, v0, Lcom/keepassdroid/database/PwDate;->cDateBuilt:Z

    .line 76
    .end local v1    # "newC":[B
    :cond_0
    iget-boolean v2, p0, Lcom/keepassdroid/database/PwDate;->jDateBuilt:Z

    if-eqz v2, :cond_1

    .line 77
    iget-object v2, p0, Lcom/keepassdroid/database/PwDate;->jDate:Ljava/util/Date;

    invoke-virtual {v2}, Ljava/util/Date;->clone()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Date;

    iput-object v2, v0, Lcom/keepassdroid/database/PwDate;->jDate:Ljava/util/Date;

    .line 78
    iput-boolean v4, v0, Lcom/keepassdroid/database/PwDate;->jDateBuilt:Z

    .line 81
    :cond_1
    return-object v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 4
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x0

    .line 173
    if-ne p0, p1, :cond_1

    .line 174
    const/4 v1, 0x1

    .line 191
    :cond_0
    :goto_0
    return v1

    .line 176
    :cond_1
    if-eqz p1, :cond_0

    .line 179
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    if-ne v2, v3, :cond_0

    move-object v0, p1

    .line 183
    check-cast v0, Lcom/keepassdroid/database/PwDate;

    .line 184
    .local v0, "date":Lcom/keepassdroid/database/PwDate;
    iget-boolean v1, p0, Lcom/keepassdroid/database/PwDate;->cDateBuilt:Z

    if-eqz v1, :cond_2

    iget-boolean v1, v0, Lcom/keepassdroid/database/PwDate;->cDateBuilt:Z

    if-eqz v1, :cond_2

    .line 185
    iget-object v1, p0, Lcom/keepassdroid/database/PwDate;->cDate:[B

    iget-object v2, v0, Lcom/keepassdroid/database/PwDate;->cDate:[B

    invoke-static {v1, v2}, Ljava/util/Arrays;->equals([B[B)Z

    move-result v1

    goto :goto_0

    .line 186
    :cond_2
    iget-boolean v1, p0, Lcom/keepassdroid/database/PwDate;->jDateBuilt:Z

    if-eqz v1, :cond_3

    iget-boolean v1, v0, Lcom/keepassdroid/database/PwDate;->jDateBuilt:Z

    if-eqz v1, :cond_3

    .line 187
    iget-object v1, p0, Lcom/keepassdroid/database/PwDate;->jDate:Ljava/util/Date;

    iget-object v2, v0, Lcom/keepassdroid/database/PwDate;->jDate:Ljava/util/Date;

    invoke-static {v1, v2}, Lcom/keepassdroid/database/PwDate;->IsSameDate(Ljava/util/Date;Ljava/util/Date;)Z

    move-result v1

    goto :goto_0

    .line 188
    :cond_3
    iget-boolean v1, p0, Lcom/keepassdroid/database/PwDate;->cDateBuilt:Z

    if-eqz v1, :cond_4

    iget-boolean v1, v0, Lcom/keepassdroid/database/PwDate;->jDateBuilt:Z

    if-eqz v1, :cond_4

    .line 189
    invoke-virtual {v0}, Lcom/keepassdroid/database/PwDate;->getCDate()[B

    move-result-object v1

    iget-object v2, p0, Lcom/keepassdroid/database/PwDate;->cDate:[B

    invoke-static {v1, v2}, Ljava/util/Arrays;->equals([B[B)Z

    move-result v1

    goto :goto_0

    .line 191
    :cond_4
    invoke-virtual {v0}, Lcom/keepassdroid/database/PwDate;->getJDate()Ljava/util/Date;

    move-result-object v1

    iget-object v2, p0, Lcom/keepassdroid/database/PwDate;->jDate:Ljava/util/Date;

    invoke-static {v1, v2}, Lcom/keepassdroid/database/PwDate;->IsSameDate(Ljava/util/Date;Ljava/util/Date;)Z

    move-result v1

    goto :goto_0
.end method

.method public getCDate()[B
    .locals 2

    .prologue
    .line 96
    iget-boolean v0, p0, Lcom/keepassdroid/database/PwDate;->cDateBuilt:Z

    if-nez v0, :cond_0

    .line 97
    iget-object v0, p0, Lcom/keepassdroid/database/PwDate;->jDate:Ljava/util/Date;

    invoke-static {}, Lcom/keepassdroid/app/App;->getCalendar()Ljava/util/Calendar;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/keepassdroid/database/PwDate;->writeTime(Ljava/util/Date;Ljava/util/Calendar;)[B

    move-result-object v0

    iput-object v0, p0, Lcom/keepassdroid/database/PwDate;->cDate:[B

    .line 98
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/keepassdroid/database/PwDate;->cDateBuilt:Z

    .line 101
    :cond_0
    iget-object v0, p0, Lcom/keepassdroid/database/PwDate;->cDate:[B

    return-object v0
.end method

.method public getJDate()Ljava/util/Date;
    .locals 3

    .prologue
    .line 87
    iget-boolean v0, p0, Lcom/keepassdroid/database/PwDate;->jDateBuilt:Z

    if-nez v0, :cond_0

    .line 88
    iget-object v0, p0, Lcom/keepassdroid/database/PwDate;->cDate:[B

    const/4 v1, 0x0

    invoke-static {}, Lcom/keepassdroid/app/App;->getCalendar()Ljava/util/Calendar;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/keepassdroid/database/PwDate;->readTime([BILjava/util/Calendar;)Ljava/util/Date;

    move-result-object v0

    iput-object v0, p0, Lcom/keepassdroid/database/PwDate;->jDate:Ljava/util/Date;

    .line 89
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/keepassdroid/database/PwDate;->jDateBuilt:Z

    .line 92
    :cond_0
    iget-object v0, p0, Lcom/keepassdroid/database/PwDate;->jDate:Ljava/util/Date;

    return-object v0
.end method
