.class public Lcom/keepassdroid/compat/StorageAF;
.super Ljava/lang/Object;
.source "StorageAF.java"


# static fields
.field public static ACTION_OPEN_DOCUMENT:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    .line 40
    :try_start_0
    const-class v2, Landroid/content/Intent;

    const-string v3, "ACTION_OPEN_DOCUMENT"

    invoke-virtual {v2, v3}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    .line 41
    .local v1, "openDocument":Ljava/lang/reflect/Field;
    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    sput-object v2, Lcom/keepassdroid/compat/StorageAF;->ACTION_OPEN_DOCUMENT:Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 46
    :goto_0
    return-void

    .line 42
    :catch_0
    move-exception v0

    .line 43
    .local v0, "e":Ljava/lang/Exception;
    const-string v2, "android.intent.action.OPEN_DOCUMENT"

    sput-object v2, Lcom/keepassdroid/compat/StorageAF;->ACTION_OPEN_DOCUMENT:Ljava/lang/String;

    goto :goto_0
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 34
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static supportsStorageFramework()Z
    .locals 2

    .prologue
    .line 48
    invoke-static {}, Lcom/keepassdroid/compat/BuildCompat;->getSdkVersion()I

    move-result v0

    const/16 v1, 0x13

    if-lt v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static useStorageFramework(Landroid/content/Context;)Z
    .locals 4
    .param p0, "ctx"    # Landroid/content/Context;

    .prologue
    .line 51
    invoke-static {}, Lcom/keepassdroid/compat/StorageAF;->supportsStorageFramework()Z

    move-result v1

    if-nez v1, :cond_0

    const/4 v1, 0x0

    .line 54
    :goto_0
    return v1

    .line 53
    :cond_0
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 54
    .local v0, "prefs":Landroid/content/SharedPreferences;
    const v1, 0x7f0600c7

    invoke-virtual {p0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f080004

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v2

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    goto :goto_0
.end method
