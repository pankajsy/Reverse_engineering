.class public Lcom/keepassdroid/IconPickerActivity;
.super Lcom/keepassdroid/LockCloseActivity;
.source "IconPickerActivity.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/keepassdroid/IconPickerActivity$ImageAdapter;
    }
.end annotation


# static fields
.field public static final KEY_ICON_ID:Ljava/lang/String; = "icon_id"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 39
    invoke-direct {p0}, Lcom/keepassdroid/LockCloseActivity;-><init>()V

    return-void
.end method

.method public static Launch(Landroid/app/Activity;)V
    .locals 2
    .param p0, "act"    # Landroid/app/Activity;

    .prologue
    .line 45
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/keepassdroid/IconPickerActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 46
    .local v0, "i":Landroid/content/Intent;
    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Landroid/app/Activity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 47
    return-void
.end method


# virtual methods
.method public onCreate(Landroid/os/Bundle;)V
    .locals 2
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 52
    invoke-super {p0, p1}, Lcom/keepassdroid/LockCloseActivity;->onCreate(Landroid/os/Bundle;)V

    .line 53
    const v1, 0x7f030015

    invoke-virtual {p0, v1}, Lcom/keepassdroid/IconPickerActivity;->setContentView(I)V

    .line 55
    const v1, 0x7f0b0068

    invoke-virtual {p0, v1}, Lcom/keepassdroid/IconPickerActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/GridView;

    .line 56
    .local v0, "currIconGridView":Landroid/widget/GridView;
    new-instance v1, Lcom/keepassdroid/IconPickerActivity$ImageAdapter;

    invoke-direct {v1, p0, p0}, Lcom/keepassdroid/IconPickerActivity$ImageAdapter;-><init>(Lcom/keepassdroid/IconPickerActivity;Landroid/content/Context;)V

    invoke-virtual {v0, v1}, Landroid/widget/GridView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 58
    new-instance v1, Lcom/keepassdroid/IconPickerActivity$1;

    invoke-direct {v1, p0}, Lcom/keepassdroid/IconPickerActivity$1;-><init>(Lcom/keepassdroid/IconPickerActivity;)V

    invoke-virtual {v0, v1}, Landroid/widget/GridView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    .line 70
    return-void
.end method
