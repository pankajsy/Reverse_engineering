.class public Lcom/keepassdroid/compat/ClipDataCompat;
.super Ljava/lang/Object;
.source "ClipDataCompat.java"


# static fields
.field private static clipData:Ljava/lang/Class;

.field private static clipDataItem:Ljava/lang/Class;

.field private static clipDescription:Ljava/lang/Class;

.field private static getClipDataFromIntent:Ljava/lang/reflect/Method;

.field private static getDescription:Ljava/lang/reflect/Method;

.field private static getItemAt:Ljava/lang/reflect/Method;

.field private static getItemCount:Ljava/lang/reflect/Method;

.field private static getLabel:Ljava/lang/reflect/Method;

.field private static getUri:Ljava/lang/reflect/Method;

.field private static initSucceded:Z


# direct methods
.method static constructor <clinit>()V
    .locals 8

    .prologue
    const/4 v7, 0x1

    const/4 v6, 0x0

    .line 42
    :try_start_0
    const-string v1, "android.content.ClipData"

    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    sput-object v1, Lcom/keepassdroid/compat/ClipDataCompat;->clipData:Ljava/lang/Class;

    .line 43
    sget-object v2, Lcom/keepassdroid/compat/ClipDataCompat;->clipData:Ljava/lang/Class;

    const-string v3, "getDescription"

    const/4 v1, 0x0

    check-cast v1, [Ljava/lang/Class;

    invoke-virtual {v2, v3, v1}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    sput-object v1, Lcom/keepassdroid/compat/ClipDataCompat;->getDescription:Ljava/lang/reflect/Method;

    .line 44
    sget-object v2, Lcom/keepassdroid/compat/ClipDataCompat;->clipData:Ljava/lang/Class;

    const-string v3, "getItemCount"

    const/4 v1, 0x0

    check-cast v1, [Ljava/lang/Class;

    invoke-virtual {v2, v3, v1}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    sput-object v1, Lcom/keepassdroid/compat/ClipDataCompat;->getItemCount:Ljava/lang/reflect/Method;

    .line 45
    sget-object v1, Lcom/keepassdroid/compat/ClipDataCompat;->clipData:Ljava/lang/Class;

    const-string v2, "getItemAt"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Class;

    const/4 v4, 0x0

    sget-object v5, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v5, v3, v4

    invoke-virtual {v1, v2, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    sput-object v1, Lcom/keepassdroid/compat/ClipDataCompat;->getItemAt:Ljava/lang/reflect/Method;

    .line 46
    const-string v1, "android.content.ClipDescription"

    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    sput-object v1, Lcom/keepassdroid/compat/ClipDataCompat;->clipDescription:Ljava/lang/Class;

    .line 47
    sget-object v2, Lcom/keepassdroid/compat/ClipDataCompat;->clipDescription:Ljava/lang/Class;

    const-string v3, "getLabel"

    const/4 v1, 0x0

    check-cast v1, [Ljava/lang/Class;

    invoke-virtual {v2, v3, v1}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    sput-object v1, Lcom/keepassdroid/compat/ClipDataCompat;->getLabel:Ljava/lang/reflect/Method;

    .line 49
    const-string v1, "android.content.ClipData$Item"

    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    sput-object v1, Lcom/keepassdroid/compat/ClipDataCompat;->clipDataItem:Ljava/lang/Class;

    .line 50
    sget-object v2, Lcom/keepassdroid/compat/ClipDataCompat;->clipDataItem:Ljava/lang/Class;

    const-string v3, "getUri"

    const/4 v1, 0x0

    check-cast v1, [Ljava/lang/Class;

    invoke-virtual {v2, v3, v1}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    sput-object v1, Lcom/keepassdroid/compat/ClipDataCompat;->getUri:Ljava/lang/reflect/Method;

    .line 52
    const-class v2, Landroid/content/Intent;

    const-string v3, "getClipData"

    const/4 v1, 0x0

    check-cast v1, [Ljava/lang/Class;

    invoke-virtual {v2, v3, v1}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    sput-object v1, Lcom/keepassdroid/compat/ClipDataCompat;->getClipDataFromIntent:Ljava/lang/reflect/Method;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 58
    .local v0, "e":Ljava/lang/Exception;
    :goto_0
    sput-boolean v7, Lcom/keepassdroid/compat/ClipDataCompat;->initSucceded:Z

    .line 59
    return-void

    .line 54
    .end local v0    # "e":Ljava/lang/Exception;
    :catch_0
    move-exception v0

    .line 55
    .restart local v0    # "e":Ljava/lang/Exception;
    sput-boolean v6, Lcom/keepassdroid/compat/ClipDataCompat;->initSucceded:Z

    goto :goto_0
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getUriFromIntent(Landroid/content/Intent;Ljava/lang/String;)Landroid/net/Uri;
    .locals 11
    .param p0, "i"    # Landroid/content/Intent;
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    const/4 v9, 0x1

    const/4 v7, 0x0

    .line 62
    const/4 v1, 0x0

    .line 63
    .local v1, "clipDataSucceeded":Z
    sget-boolean v6, Lcom/keepassdroid/compat/ClipDataCompat;->initSucceded:Z

    if-eqz v6, :cond_1

    .line 65
    :try_start_0
    sget-object v6, Lcom/keepassdroid/compat/ClipDataCompat;->getClipDataFromIntent:Ljava/lang/reflect/Method;

    const/4 v8, 0x0

    invoke-virtual {v6, p0, v8}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 67
    .local v0, "clip":Ljava/lang/Object;
    if-eqz v0, :cond_0

    .line 68
    sget-object v6, Lcom/keepassdroid/compat/ClipDataCompat;->getDescription:Ljava/lang/reflect/Method;

    const/4 v8, 0x0

    invoke-virtual {v6, v0, v8}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    .line 69
    .local v2, "clipDescription":Ljava/lang/Object;
    sget-object v6, Lcom/keepassdroid/compat/ClipDataCompat;->getLabel:Ljava/lang/reflect/Method;

    const/4 v8, 0x0

    invoke-virtual {v6, v2, v8}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/CharSequence;

    .line 70
    .local v5, "label":Ljava/lang/CharSequence;
    invoke-virtual {v5, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 71
    sget-object v6, Lcom/keepassdroid/compat/ClipDataCompat;->getItemCount:Ljava/lang/reflect/Method;

    const/4 v8, 0x0

    invoke-virtual {v6, v0, v8}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Integer;

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v4

    .line 72
    .local v4, "itemCount":I
    if-ne v4, v9, :cond_0

    .line 73
    sget-object v6, Lcom/keepassdroid/compat/ClipDataCompat;->getItemAt:Ljava/lang/reflect/Method;

    const/4 v8, 0x1

    new-array v8, v8, [Ljava/lang/Object;

    const/4 v9, 0x0

    const/4 v10, 0x0

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    aput-object v10, v8, v9

    invoke-virtual {v6, v0, v8}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    .line 74
    .local v3, "clipItem":Ljava/lang/Object;
    if-eqz v3, :cond_0

    .line 75
    sget-object v6, Lcom/keepassdroid/compat/ClipDataCompat;->getUri:Ljava/lang/reflect/Method;

    const/4 v7, 0x0

    invoke-virtual {v6, v3, v7}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroid/net/Uri;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 87
    .end local v0    # "clip":Ljava/lang/Object;
    .end local v2    # "clipDescription":Ljava/lang/Object;
    .end local v3    # "clipItem":Ljava/lang/Object;
    .end local v4    # "itemCount":I
    .end local v5    # "label":Ljava/lang/CharSequence;
    :goto_0
    return-object v6

    .restart local v0    # "clip":Ljava/lang/Object;
    :cond_0
    move-object v6, v7

    .line 80
    goto :goto_0

    .line 82
    .end local v0    # "clip":Ljava/lang/Object;
    :catch_0
    move-exception v6

    .line 87
    :cond_1
    invoke-virtual {p0, p1}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v6

    check-cast v6, Landroid/net/Uri;

    goto :goto_0
.end method
