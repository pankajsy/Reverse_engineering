.class public Lcom/keepassdroid/database/edit/FileOnFinish;
.super Lcom/keepassdroid/database/edit/OnFinish;
.source "FileOnFinish.java"


# instance fields
.field private mFilename:Landroid/net/Uri;

.field protected mOnFinish:Lcom/keepassdroid/database/edit/FileOnFinish;


# direct methods
.method public constructor <init>(Lcom/keepassdroid/database/edit/FileOnFinish;)V
    .locals 1
    .param p1, "finish"    # Lcom/keepassdroid/database/edit/FileOnFinish;

    .prologue
    .line 29
    invoke-direct {p0, p1}, Lcom/keepassdroid/database/edit/OnFinish;-><init>(Lcom/keepassdroid/database/edit/OnFinish;)V

    .line 25
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/keepassdroid/database/edit/FileOnFinish;->mFilename:Landroid/net/Uri;

    .line 31
    iput-object p1, p0, Lcom/keepassdroid/database/edit/FileOnFinish;->mOnFinish:Lcom/keepassdroid/database/edit/FileOnFinish;

    .line 32
    return-void
.end method


# virtual methods
.method public getFilename()Landroid/net/Uri;
    .locals 1

    .prologue
    .line 39
    iget-object v0, p0, Lcom/keepassdroid/database/edit/FileOnFinish;->mFilename:Landroid/net/Uri;

    return-object v0
.end method

.method public setFilename(Landroid/net/Uri;)V
    .locals 0
    .param p1, "filename"    # Landroid/net/Uri;

    .prologue
    .line 35
    iput-object p1, p0, Lcom/keepassdroid/database/edit/FileOnFinish;->mFilename:Landroid/net/Uri;

    .line 36
    return-void
.end method
