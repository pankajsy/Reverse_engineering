.class public Lcom/keepassdroid/compat/BitmapDrawableCompat;
.super Ljava/lang/Object;
.source "BitmapDrawableCompat.java"


# static fields
.field private static constResBitmap:Ljava/lang/reflect/Constructor;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/reflect/Constructor",
            "<",
            "Landroid/graphics/drawable/BitmapDrawable;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    .line 34
    :try_start_0
    const-class v0, Landroid/graphics/drawable/BitmapDrawable;

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Class;

    const/4 v2, 0x0

    const-class v3, Landroid/content/res/Resources;

    aput-object v3, v1, v2

    const/4 v2, 0x1

    const-class v3, Landroid/graphics/Bitmap;

    aput-object v3, v1, v2

    invoke-virtual {v0, v1}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v0

    sput-object v0, Lcom/keepassdroid/compat/BitmapDrawableCompat;->constResBitmap:Ljava/lang/reflect/Constructor;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 39
    :goto_0
    return-void

    .line 36
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getBitmapDrawable(Landroid/content/res/Resources;Landroid/graphics/Bitmap;)Landroid/graphics/drawable/BitmapDrawable;
    .locals 3
    .param p0, "res"    # Landroid/content/res/Resources;
    .param p1, "bitmap"    # Landroid/graphics/Bitmap;

    .prologue
    .line 42
    sget-object v0, Lcom/keepassdroid/compat/BitmapDrawableCompat;->constResBitmap:Ljava/lang/reflect/Constructor;

    if-eqz v0, :cond_0

    .line 44
    :try_start_0
    sget-object v0, Lcom/keepassdroid/compat/BitmapDrawableCompat;->constResBitmap:Ljava/lang/reflect/Constructor;

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object p0, v1, v2

    const/4 v2, 0x1

    aput-object p1, v1, v2

    invoke-virtual {v0, v1}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/graphics/drawable/BitmapDrawable;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 50
    :goto_0
    return-object v0

    .line 45
    :catch_0
    move-exception v0

    .line 50
    :cond_0
    new-instance v0, Landroid/graphics/drawable/BitmapDrawable;

    invoke-direct {v0, p1}, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/graphics/Bitmap;)V

    goto :goto_0
.end method
