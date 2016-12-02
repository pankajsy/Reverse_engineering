.class public Lcom/keepassdroid/assets/TypefaceFactory;
.super Ljava/lang/Object;
.source "TypefaceFactory.java"


# static fields
.field private static typefaceMap:Lorg/apache/commons/collections/map/ReferenceMap;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 36
    new-instance v0, Lorg/apache/commons/collections/map/ReferenceMap;

    const/4 v1, 0x0

    const/4 v2, 0x2

    invoke-direct {v0, v1, v2}, Lorg/apache/commons/collections/map/ReferenceMap;-><init>(II)V

    sput-object v0, Lcom/keepassdroid/assets/TypefaceFactory;->typefaceMap:Lorg/apache/commons/collections/map/ReferenceMap;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getTypeface(Landroid/content/Context;Ljava/lang/String;)Landroid/graphics/Typeface;
    .locals 3
    .param p0, "ctx"    # Landroid/content/Context;
    .param p1, "fontPath"    # Ljava/lang/String;

    .prologue
    .line 41
    sget-object v2, Lcom/keepassdroid/assets/TypefaceFactory;->typefaceMap:Lorg/apache/commons/collections/map/ReferenceMap;

    invoke-virtual {v2, p1}, Lorg/apache/commons/collections/map/ReferenceMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/graphics/Typeface;

    .line 42
    .local v1, "tf":Landroid/graphics/Typeface;
    if-eqz v1, :cond_0

    .line 50
    .end local v1    # "tf":Landroid/graphics/Typeface;
    :goto_0
    return-object v1

    .line 47
    .restart local v1    # "tf":Landroid/graphics/Typeface;
    :cond_0
    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v2

    invoke-static {v2, p1}, Landroid/graphics/Typeface;->createFromAsset(Landroid/content/res/AssetManager;Ljava/lang/String;)Landroid/graphics/Typeface;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    goto :goto_0

    .line 48
    :catch_0
    move-exception v0

    .line 50
    .local v0, "e":Ljava/lang/Exception;
    const/4 v1, 0x0

    goto :goto_0
.end method
