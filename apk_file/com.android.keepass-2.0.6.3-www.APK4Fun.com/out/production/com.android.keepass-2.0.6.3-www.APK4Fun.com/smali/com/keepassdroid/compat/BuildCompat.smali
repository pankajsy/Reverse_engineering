.class public Lcom/keepassdroid/compat/BuildCompat;
.super Ljava/lang/Object;
.source "BuildCompat.java"


# static fields
.field public static final VERSION_CODE_GINGERBREAD:I = 0x9

.field public static final VERSION_CODE_ICE_CREAM_SANDWICH:I = 0xe

.field public static final VERSION_CODE_JELLY_BEAN:I = 0x10

.field public static final VERSION_CODE_JELLY_BEAN_MR2:I = 0x12

.field public static final VERSION_KITKAT:I = 0x13

.field private static manuText:Ljava/lang/String;

.field private static manufacturer:Ljava/lang/reflect/Field;

.field private static versionInt:I

.field private static versionSDK:Ljava/lang/reflect/Field;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    .line 42
    :try_start_0
    const-class v2, Landroid/os/Build;

    const-string v3, "MANUFACTURER"

    invoke-virtual {v2, v3}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v2

    sput-object v2, Lcom/keepassdroid/compat/BuildCompat;->manufacturer:Ljava/lang/reflect/Field;

    .line 43
    sget-object v2, Lcom/keepassdroid/compat/BuildCompat;->manufacturer:Ljava/lang/reflect/Field;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    sput-object v2, Lcom/keepassdroid/compat/BuildCompat;->manuText:Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 50
    .local v0, "e":Ljava/lang/Exception;
    :goto_0
    :try_start_1
    const-class v2, Landroid/os/Build$VERSION;

    const-string v3, "SDK_INT"

    invoke-virtual {v2, v3}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v2

    sput-object v2, Lcom/keepassdroid/compat/BuildCompat;->versionSDK:Ljava/lang/reflect/Field;

    .line 51
    sget-object v2, Lcom/keepassdroid/compat/BuildCompat;->versionSDK:Ljava/lang/reflect/Field;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Ljava/lang/reflect/Field;->getInt(Ljava/lang/Object;)I

    move-result v2

    sput v2, Lcom/keepassdroid/compat/BuildCompat;->versionInt:I
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 59
    :goto_1
    return-void

    .line 44
    .end local v0    # "e":Ljava/lang/Exception;
    :catch_0
    move-exception v0

    .line 45
    .restart local v0    # "e":Ljava/lang/Exception;
    const-string v2, ""

    sput-object v2, Lcom/keepassdroid/compat/BuildCompat;->manuText:Ljava/lang/String;

    goto :goto_0

    .line 52
    :catch_1
    move-exception v0

    .line 54
    :try_start_2
    sget-object v2, Landroid/os/Build$VERSION;->SDK:Ljava/lang/String;

    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2

    sput v2, Lcom/keepassdroid/compat/BuildCompat;->versionInt:I
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    goto :goto_1

    .line 55
    :catch_2
    move-exception v1

    .line 56
    .local v1, "nfe":Ljava/lang/Exception;
    const/4 v2, -0x1

    sput v2, Lcom/keepassdroid/compat/BuildCompat;->versionInt:I

    goto :goto_1
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getManufacturer()Ljava/lang/String;
    .locals 1

    .prologue
    .line 62
    sget-object v0, Lcom/keepassdroid/compat/BuildCompat;->manuText:Ljava/lang/String;

    return-object v0
.end method

.method public static getSdkVersion()I
    .locals 1

    .prologue
    .line 66
    sget v0, Lcom/keepassdroid/compat/BuildCompat;->versionInt:I

    return v0
.end method
