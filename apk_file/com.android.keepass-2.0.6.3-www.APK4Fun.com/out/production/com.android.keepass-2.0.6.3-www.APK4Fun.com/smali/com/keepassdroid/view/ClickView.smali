.class public abstract Lcom/keepassdroid/view/ClickView;
.super Landroid/widget/LinearLayout;
.source "ClickView.java"


# instance fields
.field protected readOnly:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 34
    invoke-direct {p0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 31
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/keepassdroid/view/ClickView;->readOnly:Z

    .line 36
    invoke-static {}, Lcom/keepassdroid/app/App;->getDB()Lcom/keepassdroid/Database;

    move-result-object v0

    iget-boolean v0, v0, Lcom/keepassdroid/Database;->readOnly:Z

    iput-boolean v0, p0, Lcom/keepassdroid/view/ClickView;->readOnly:Z

    .line 37
    return-void
.end method


# virtual methods
.method public abstract onClick()V
.end method

.method public abstract onContextItemSelected(Landroid/view/MenuItem;)Z
.end method

.method public abstract onCreateMenu(Landroid/view/ContextMenu;Landroid/view/ContextMenu$ContextMenuInfo;)V
.end method
