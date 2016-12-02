.class public final Lorg/bouncycastle/util/Arrays;
.super Ljava/lang/Object;
.source "Arrays.java"


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 11
    return-void
.end method

.method public static areEqual([B[B)Z
    .locals 5
    .param p0, "a"    # [B
    .param p1, "b"    # [B

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 47
    if-ne p0, p1, :cond_1

    .line 70
    :cond_0
    :goto_0
    return v1

    .line 52
    :cond_1
    if-eqz p0, :cond_2

    if-nez p1, :cond_3

    :cond_2
    move v1, v2

    .line 54
    goto :goto_0

    .line 57
    :cond_3
    array-length v3, p0

    array-length v4, p1

    if-eq v3, v4, :cond_4

    move v1, v2

    .line 59
    goto :goto_0

    .line 62
    :cond_4
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    array-length v3, p0

    if-eq v0, v3, :cond_0

    .line 64
    aget-byte v3, p0, v0

    aget-byte v4, p1, v0

    if-eq v3, v4, :cond_5

    move v1, v2

    .line 66
    goto :goto_0

    .line 62
    :cond_5
    add-int/lit8 v0, v0, 0x1

    goto :goto_1
.end method

.method public static areEqual([I[I)Z
    .locals 5
    .param p0, "a"    # [I
    .param p1, "b"    # [I

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 114
    if-ne p0, p1, :cond_1

    .line 137
    :cond_0
    :goto_0
    return v1

    .line 119
    :cond_1
    if-eqz p0, :cond_2

    if-nez p1, :cond_3

    :cond_2
    move v1, v2

    .line 121
    goto :goto_0

    .line 124
    :cond_3
    array-length v3, p0

    array-length v4, p1

    if-eq v3, v4, :cond_4

    move v1, v2

    .line 126
    goto :goto_0

    .line 129
    :cond_4
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    array-length v3, p0

    if-eq v0, v3, :cond_0

    .line 131
    aget v3, p0, v0

    aget v4, p1, v0

    if-eq v3, v4, :cond_5

    move v1, v2

    .line 133
    goto :goto_0

    .line 129
    :cond_5
    add-int/lit8 v0, v0, 0x1

    goto :goto_1
.end method

.method public static areEqual([Z[Z)Z
    .locals 5
    .param p0, "a"    # [Z
    .param p1, "b"    # [Z

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 17
    if-ne p0, p1, :cond_1

    .line 40
    :cond_0
    :goto_0
    return v1

    .line 22
    :cond_1
    if-eqz p0, :cond_2

    if-nez p1, :cond_3

    :cond_2
    move v1, v2

    .line 24
    goto :goto_0

    .line 27
    :cond_3
    array-length v3, p0

    array-length v4, p1

    if-eq v3, v4, :cond_4

    move v1, v2

    .line 29
    goto :goto_0

    .line 32
    :cond_4
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    array-length v3, p0

    if-eq v0, v3, :cond_0

    .line 34
    aget-boolean v3, p0, v0

    aget-boolean v4, p1, v0

    if-eq v3, v4, :cond_5

    move v1, v2

    .line 36
    goto :goto_0

    .line 32
    :cond_5
    add-int/lit8 v0, v0, 0x1

    goto :goto_1
.end method

.method public static clone([B)[B
    .locals 3
    .param p0, "data"    # [B

    .prologue
    const/4 v2, 0x0

    .line 191
    if-nez p0, :cond_0

    .line 193
    const/4 v0, 0x0

    .line 199
    :goto_0
    return-object v0

    .line 195
    :cond_0
    array-length v1, p0

    new-array v0, v1, [B

    .line 197
    .local v0, "copy":[B
    array-length v1, p0

    invoke-static {p0, v2, v0, v2, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    goto :goto_0
.end method

.method public static clone([I)[I
    .locals 3
    .param p0, "data"    # [I

    .prologue
    const/4 v2, 0x0

    .line 204
    if-nez p0, :cond_0

    .line 206
    const/4 v0, 0x0

    .line 212
    :goto_0
    return-object v0

    .line 208
    :cond_0
    array-length v1, p0

    new-array v0, v1, [I

    .line 210
    .local v0, "copy":[I
    array-length v1, p0

    invoke-static {p0, v2, v0, v2, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    goto :goto_0
.end method

.method public static constantTimeAreEqual([B[B)Z
    .locals 6
    .param p0, "a"    # [B
    .param p1, "b"    # [B

    .prologue
    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 85
    if-ne p0, p1, :cond_1

    .line 107
    :cond_0
    :goto_0
    return v2

    .line 90
    :cond_1
    if-eqz p0, :cond_2

    if-nez p1, :cond_3

    :cond_2
    move v2, v3

    .line 92
    goto :goto_0

    .line 95
    :cond_3
    array-length v4, p0

    array-length v5, p1

    if-eq v4, v5, :cond_4

    move v2, v3

    .line 97
    goto :goto_0

    .line 100
    :cond_4
    const/4 v1, 0x0

    .line 102
    .local v1, "nonEqual":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    array-length v4, p0

    if-eq v0, v4, :cond_5

    .line 104
    aget-byte v4, p0, v0

    aget-byte v5, p1, v0

    xor-int/2addr v4, v5

    or-int/2addr v1, v4

    .line 102
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 107
    :cond_5
    if-eqz v1, :cond_0

    move v2, v3

    goto :goto_0
.end method

.method public static fill([BB)V
    .locals 2
    .param p0, "array"    # [B
    .param p1, "value"    # B

    .prologue
    .line 144
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v1, p0

    if-ge v0, v1, :cond_0

    .line 146
    aput-byte p1, p0, v0

    .line 144
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 148
    :cond_0
    return-void
.end method

.method public static fill([JJ)V
    .locals 3
    .param p0, "array"    # [J
    .param p1, "value"    # J

    .prologue
    .line 154
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v1, p0

    if-ge v0, v1, :cond_0

    .line 156
    aput-wide p1, p0, v0

    .line 154
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 158
    :cond_0
    return-void
.end method

.method public static fill([SS)V
    .locals 2
    .param p0, "array"    # [S
    .param p1, "value"    # S

    .prologue
    .line 164
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v1, p0

    if-ge v0, v1, :cond_0

    .line 166
    aput-short p1, p0, v0

    .line 164
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 168
    :cond_0
    return-void
.end method

.method public static hashCode([B)I
    .locals 3
    .param p0, "data"    # [B

    .prologue
    .line 172
    if-nez p0, :cond_1

    .line 174
    const/4 v0, 0x0

    .line 186
    :cond_0
    return v0

    .line 177
    :cond_1
    array-length v1, p0

    .line 178
    .local v1, "i":I
    add-int/lit8 v0, v1, 0x1

    .line 180
    .local v0, "hc":I
    :goto_0
    add-int/lit8 v1, v1, -0x1

    if-ltz v1, :cond_0

    .line 182
    mul-int/lit16 v0, v0, 0x101

    .line 183
    aget-byte v2, p0, v1

    xor-int/2addr v0, v2

    goto :goto_0
.end method
