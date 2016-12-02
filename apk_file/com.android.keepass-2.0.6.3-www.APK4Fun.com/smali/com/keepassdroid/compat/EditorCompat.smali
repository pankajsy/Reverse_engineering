.class public Lcom/keepassdroid/compat/EditorCompat;
.super Ljava/lang/Object;
.source "EditorCompat.java"


# static fields
.field private static apply:Ljava/lang/reflect/Method;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    .line 32
    :try_start_0
    const-class v2, Landroid/app/Activity;

    const-string v3, "apply"

    const/4 v1, 0x0

    check-cast v1, [Ljava/lang/Class;

    invoke-virtual {v2, v3, v1}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    sput-object v1, Lcom/keepassdroid/compat/EditorCompat;->apply:Ljava/lang/reflect/Method;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 41
    .local v0, "e":Ljava/lang/Exception;
    :goto_0
    return-void

    .line 33
    .end local v0    # "e":Ljava/lang/Exception;
    :catch_0
    move-exception v0

    .line 36
    .restart local v0    # "e":Ljava/lang/Exception;
    :try_start_1
    const-class v2, Landroid/app/Activity;

    const-string v3, "commit"

    const/4 v1, 0x0

    check-cast v1, [Ljava/lang/Class;

    invoke-virtual {v2, v3, v1}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    sput-object v1, Lcom/keepassdroid/compat/EditorCompat;->apply:Ljava/lang/reflect/Method;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_0

    .line 37
    :catch_1
    move-exception v1

    goto :goto_0
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static apply(Landroid/content/SharedPreferences$Editor;)V
    .locals 3
    .param p0, "edit"    # Landroid/content/SharedPreferences$Editor;

    .prologue
    .line 45
    :try_start_0
    sget-object v2, Lcom/keepassdroid/compat/EditorCompat;->apply:Ljava/lang/reflect/Method;

    const/4 v1, 0x0

    check-cast v1, [Ljava/lang/Object;

    invoke-virtual {v2, p0, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 51
    :goto_0
    return-void

    .line 46
    :catch_0
    move-exception v0

    .line 48
    .local v0, "e":Ljava/lang/Exception;
    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    goto :goto_0
.end method
