.class public Lcom/keepassdroid/icons/DrawableFactory;
.super Ljava/lang/Object;
.source "DrawableFactory.java"


# static fields
.field private static blank:Landroid/graphics/drawable/Drawable;

.field private static blankHeight:I

.field private static blankWidth:I


# instance fields
.field private customIconMap:Lorg/apache/commons/collections/map/ReferenceMap;

.field private standardIconMap:Lorg/apache/commons/collections/map/ReferenceMap;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    const/4 v1, -0x1

    .line 38
    const/4 v0, 0x0

    sput-object v0, Lcom/keepassdroid/icons/DrawableFactory;->blank:Landroid/graphics/drawable/Drawable;

    .line 39
    sput v1, Lcom/keepassdroid/icons/DrawableFactory;->blankWidth:I

    .line 40
    sput v1, Lcom/keepassdroid/icons/DrawableFactory;->blankHeight:I

    return-void
.end method

.method public constructor <init>()V
    .locals 3

    .prologue
    const/4 v2, 0x2

    const/4 v1, 0x0

    .line 37
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 46
    new-instance v0, Lorg/apache/commons/collections/map/ReferenceMap;

    invoke-direct {v0, v1, v2}, Lorg/apache/commons/collections/map/ReferenceMap;-><init>(II)V

    iput-object v0, p0, Lcom/keepassdroid/icons/DrawableFactory;->customIconMap:Lorg/apache/commons/collections/map/ReferenceMap;

    .line 52
    new-instance v0, Lorg/apache/commons/collections/map/ReferenceMap;

    invoke-direct {v0, v1, v2}, Lorg/apache/commons/collections/map/ReferenceMap;-><init>(II)V

    iput-object v0, p0, Lcom/keepassdroid/icons/DrawableFactory;->standardIconMap:Lorg/apache/commons/collections/map/ReferenceMap;

    return-void
.end method

.method private getIconDrawable(Landroid/content/res/Resources;Lcom/keepassdroid/database/PwIcon;)Landroid/graphics/drawable/Drawable;
    .locals 1
    .param p1, "res"    # Landroid/content/res/Resources;
    .param p2, "icon"    # Lcom/keepassdroid/database/PwIcon;

    .prologue
    .line 60
    instance-of v0, p2, Lcom/keepassdroid/database/PwIconStandard;

    if-eqz v0, :cond_0

    .line 61
    check-cast p2, Lcom/keepassdroid/database/PwIconStandard;

    .end local p2    # "icon":Lcom/keepassdroid/database/PwIcon;
    invoke-virtual {p0, p1, p2}, Lcom/keepassdroid/icons/DrawableFactory;->getIconDrawable(Landroid/content/res/Resources;Lcom/keepassdroid/database/PwIconStandard;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 63
    :goto_0
    return-object v0

    .restart local p2    # "icon":Lcom/keepassdroid/database/PwIcon;
    :cond_0
    check-cast p2, Lcom/keepassdroid/database/PwIconCustom;

    .end local p2    # "icon":Lcom/keepassdroid/database/PwIcon;
    invoke-virtual {p0, p1, p2}, Lcom/keepassdroid/icons/DrawableFactory;->getIconDrawable(Landroid/content/res/Resources;Lcom/keepassdroid/database/PwIconCustom;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    goto :goto_0
.end method

.method private static initBlank(Landroid/content/res/Resources;)V
    .locals 1
    .param p0, "res"    # Landroid/content/res/Resources;

    .prologue
    .line 68
    sget-object v0, Lcom/keepassdroid/icons/DrawableFactory;->blank:Landroid/graphics/drawable/Drawable;

    if-nez v0, :cond_0

    .line 69
    const v0, 0x7f020045

    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    sput-object v0, Lcom/keepassdroid/icons/DrawableFactory;->blank:Landroid/graphics/drawable/Drawable;

    .line 70
    sget-object v0, Lcom/keepassdroid/icons/DrawableFactory;->blank:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v0

    sput v0, Lcom/keepassdroid/icons/DrawableFactory;->blankWidth:I

    .line 71
    sget-object v0, Lcom/keepassdroid/icons/DrawableFactory;->blank:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v0

    sput v0, Lcom/keepassdroid/icons/DrawableFactory;->blankHeight:I

    .line 73
    :cond_0
    return-void
.end method

.method private resize(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
    .locals 5
    .param p1, "bitmap"    # Landroid/graphics/Bitmap;

    .prologue
    .line 121
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v1

    .line 122
    .local v1, "width":I
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v0

    .line 124
    .local v0, "height":I
    sget v2, Lcom/keepassdroid/icons/DrawableFactory;->blankWidth:I

    if-ne v1, v2, :cond_0

    sget v2, Lcom/keepassdroid/icons/DrawableFactory;->blankHeight:I

    if-ne v0, v2, :cond_0

    .line 128
    .end local p1    # "bitmap":Landroid/graphics/Bitmap;
    :goto_0
    return-object p1

    .restart local p1    # "bitmap":Landroid/graphics/Bitmap;
    :cond_0
    sget v2, Lcom/keepassdroid/icons/DrawableFactory;->blankWidth:I

    sget v3, Lcom/keepassdroid/icons/DrawableFactory;->blankHeight:I

    const/4 v4, 0x1

    invoke-static {p1, v2, v3, v4}, Landroid/graphics/Bitmap;->createScaledBitmap(Landroid/graphics/Bitmap;IIZ)Landroid/graphics/Bitmap;

    move-result-object p1

    goto :goto_0
.end method


# virtual methods
.method public assignDrawableTo(Landroid/widget/ImageView;Landroid/content/res/Resources;Lcom/keepassdroid/database/PwIcon;)V
    .locals 1
    .param p1, "iv"    # Landroid/widget/ImageView;
    .param p2, "res"    # Landroid/content/res/Resources;
    .param p3, "icon"    # Lcom/keepassdroid/database/PwIcon;

    .prologue
    .line 55
    invoke-direct {p0, p2, p3}, Lcom/keepassdroid/icons/DrawableFactory;->getIconDrawable(Landroid/content/res/Resources;Lcom/keepassdroid/database/PwIcon;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 56
    .local v0, "draw":Landroid/graphics/drawable/Drawable;
    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 57
    return-void
.end method

.method public clear()V
    .locals 1

    .prologue
    .line 132
    iget-object v0, p0, Lcom/keepassdroid/icons/DrawableFactory;->standardIconMap:Lorg/apache/commons/collections/map/ReferenceMap;

    invoke-virtual {v0}, Lorg/apache/commons/collections/map/ReferenceMap;->clear()V

    .line 133
    iget-object v0, p0, Lcom/keepassdroid/icons/DrawableFactory;->customIconMap:Lorg/apache/commons/collections/map/ReferenceMap;

    invoke-virtual {v0}, Lorg/apache/commons/collections/map/ReferenceMap;->clear()V

    .line 134
    return-void
.end method

.method public getIconDrawable(Landroid/content/res/Resources;Lcom/keepassdroid/database/PwIconCustom;)Landroid/graphics/drawable/Drawable;
    .locals 5
    .param p1, "res"    # Landroid/content/res/Resources;
    .param p2, "icon"    # Lcom/keepassdroid/database/PwIconCustom;

    .prologue
    .line 88
    invoke-static {p1}, Lcom/keepassdroid/icons/DrawableFactory;->initBlank(Landroid/content/res/Resources;)V

    .line 89
    if-nez p2, :cond_1

    .line 90
    sget-object v1, Lcom/keepassdroid/icons/DrawableFactory;->blank:Landroid/graphics/drawable/Drawable;

    .line 113
    :cond_0
    :goto_0
    return-object v1

    .line 93
    :cond_1
    iget-object v2, p0, Lcom/keepassdroid/icons/DrawableFactory;->customIconMap:Lorg/apache/commons/collections/map/ReferenceMap;

    iget-object v3, p2, Lcom/keepassdroid/database/PwIconCustom;->uuid:Ljava/util/UUID;

    invoke-virtual {v2, v3}, Lorg/apache/commons/collections/map/ReferenceMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/graphics/drawable/Drawable;

    .line 95
    .local v1, "draw":Landroid/graphics/drawable/Drawable;
    if-nez v1, :cond_0

    .line 96
    iget-object v2, p2, Lcom/keepassdroid/database/PwIconCustom;->imageData:[B

    if-nez v2, :cond_2

    .line 97
    sget-object v1, Lcom/keepassdroid/icons/DrawableFactory;->blank:Landroid/graphics/drawable/Drawable;

    goto :goto_0

    .line 100
    :cond_2
    iget-object v2, p2, Lcom/keepassdroid/database/PwIconCustom;->imageData:[B

    const/4 v3, 0x0

    iget-object v4, p2, Lcom/keepassdroid/database/PwIconCustom;->imageData:[B

    array-length v4, v4

    invoke-static {v2, v3, v4}, Landroid/graphics/BitmapFactory;->decodeByteArray([BII)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 103
    .local v0, "bitmap":Landroid/graphics/Bitmap;
    if-nez v0, :cond_3

    .line 104
    sget-object v1, Lcom/keepassdroid/icons/DrawableFactory;->blank:Landroid/graphics/drawable/Drawable;

    goto :goto_0

    .line 107
    :cond_3
    invoke-direct {p0, v0}, Lcom/keepassdroid/icons/DrawableFactory;->resize(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 109
    invoke-static {p1, v0}, Lcom/keepassdroid/compat/BitmapDrawableCompat;->getBitmapDrawable(Landroid/content/res/Resources;Landroid/graphics/Bitmap;)Landroid/graphics/drawable/BitmapDrawable;

    move-result-object v1

    .line 110
    iget-object v2, p0, Lcom/keepassdroid/icons/DrawableFactory;->customIconMap:Lorg/apache/commons/collections/map/ReferenceMap;

    iget-object v3, p2, Lcom/keepassdroid/database/PwIconCustom;->uuid:Ljava/util/UUID;

    invoke-virtual {v2, v3, v1}, Lorg/apache/commons/collections/map/ReferenceMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0
.end method

.method public getIconDrawable(Landroid/content/res/Resources;Lcom/keepassdroid/database/PwIconStandard;)Landroid/graphics/drawable/Drawable;
    .locals 4
    .param p1, "res"    # Landroid/content/res/Resources;
    .param p2, "icon"    # Lcom/keepassdroid/database/PwIconStandard;

    .prologue
    .line 76
    iget v2, p2, Lcom/keepassdroid/database/PwIconStandard;->iconId:I

    invoke-static {v2}, Lcom/keepassdroid/icons/Icons;->iconToResId(I)I

    move-result v1

    .line 78
    .local v1, "resId":I
    iget-object v2, p0, Lcom/keepassdroid/icons/DrawableFactory;->standardIconMap:Lorg/apache/commons/collections/map/ReferenceMap;

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v2, v3}, Lorg/apache/commons/collections/map/ReferenceMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/graphics/drawable/Drawable;

    .line 79
    .local v0, "draw":Landroid/graphics/drawable/Drawable;
    if-nez v0, :cond_0

    .line 80
    invoke-virtual {p1, v1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 81
    iget-object v2, p0, Lcom/keepassdroid/icons/DrawableFactory;->standardIconMap:Lorg/apache/commons/collections/map/ReferenceMap;

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v2, v3, v0}, Lorg/apache/commons/collections/map/ReferenceMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 84
    :cond_0
    return-object v0
.end method
