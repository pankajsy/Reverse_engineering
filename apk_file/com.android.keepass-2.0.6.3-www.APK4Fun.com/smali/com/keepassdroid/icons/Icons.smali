.class public Lcom/keepassdroid/icons/Icons;
.super Ljava/lang/Object;
.source "Icons.java"


# static fields
.field private static icons:Landroid/util/SparseIntArray;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 30
    const/4 v0, 0x0

    sput-object v0, Lcom/keepassdroid/icons/Icons;->icons:Landroid/util/SparseIntArray;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static buildList()V
    .locals 10

    .prologue
    .line 33
    sget-object v8, Lcom/keepassdroid/icons/Icons;->icons:Landroid/util/SparseIntArray;

    if-nez v8, :cond_2

    .line 34
    new-instance v8, Landroid/util/SparseIntArray;

    invoke-direct {v8}, Landroid/util/SparseIntArray;-><init>()V

    sput-object v8, Lcom/keepassdroid/icons/Icons;->icons:Landroid/util/SparseIntArray;

    .line 36
    const-class v0, Lcom/android/keepass/R$drawable;

    .line 38
    .local v0, "c":Ljava/lang/Class;, "Ljava/lang/Class<Lcom/android/keepass/R$drawable;>;"
    invoke-virtual {v0}, Ljava/lang/Class;->getFields()[Ljava/lang/reflect/Field;

    move-result-object v3

    .line 40
    .local v3, "fields":[Ljava/lang/reflect/Field;
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_0
    array-length v8, v3

    if-ge v4, v8, :cond_2

    .line 41
    aget-object v8, v3, v4

    invoke-virtual {v8}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v2

    .line 42
    .local v2, "fieldName":Ljava/lang/String;
    const-string v8, "ic\\d{2}.*"

    invoke-virtual {v2, v8}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_0

    .line 43
    const/4 v8, 0x2

    const/4 v9, 0x4

    invoke-virtual {v2, v8, v9}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v7

    .line 44
    .local v7, "sNum":Ljava/lang/String;
    invoke-static {v7}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v5

    .line 45
    .local v5, "num":I
    const/16 v8, 0x45

    if-le v5, v8, :cond_1

    .line 40
    .end local v5    # "num":I
    .end local v7    # "sNum":Ljava/lang/String;
    :cond_0
    :goto_1
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 51
    .restart local v5    # "num":I
    .restart local v7    # "sNum":Ljava/lang/String;
    :cond_1
    :try_start_0
    aget-object v8, v3, v4

    const/4 v9, 0x0

    invoke-virtual {v8, v9}, Ljava/lang/reflect/Field;->getInt(Ljava/lang/Object;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v6

    .line 56
    .local v6, "resId":I
    sget-object v8, Lcom/keepassdroid/icons/Icons;->icons:Landroid/util/SparseIntArray;

    invoke-virtual {v8, v5, v6}, Landroid/util/SparseIntArray;->put(II)V

    goto :goto_1

    .line 52
    .end local v6    # "resId":I
    :catch_0
    move-exception v1

    .line 53
    .local v1, "e":Ljava/lang/Exception;
    goto :goto_1

    .line 60
    .end local v1    # "e":Ljava/lang/Exception;
    .end local v2    # "fieldName":Ljava/lang/String;
    .end local v5    # "num":I
    .end local v7    # "sNum":Ljava/lang/String;
    :cond_2
    return-void
.end method

.method public static count()I
    .locals 1

    .prologue
    .line 69
    invoke-static {}, Lcom/keepassdroid/icons/Icons;->buildList()V

    .line 71
    sget-object v0, Lcom/keepassdroid/icons/Icons;->icons:Landroid/util/SparseIntArray;

    invoke-virtual {v0}, Landroid/util/SparseIntArray;->size()I

    move-result v0

    return v0
.end method

.method public static iconToResId(I)I
    .locals 2
    .param p0, "iconId"    # I

    .prologue
    .line 63
    invoke-static {}, Lcom/keepassdroid/icons/Icons;->buildList()V

    .line 65
    sget-object v0, Lcom/keepassdroid/icons/Icons;->icons:Landroid/util/SparseIntArray;

    const v1, 0x7f020045

    invoke-virtual {v0, p0, v1}, Landroid/util/SparseIntArray;->get(II)I

    move-result v0

    return v0
.end method
