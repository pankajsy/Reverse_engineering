.class Lcom/keepassdroid/EntryActivity$3;
.super Ljava/lang/Object;
.source "EntryActivity.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/keepassdroid/EntryActivity;->showSamsungDialog()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/keepassdroid/EntryActivity;


# direct methods
.method constructor <init>(Lcom/keepassdroid/EntryActivity;)V
    .locals 0
    .param p1, "this$0"    # Lcom/keepassdroid/EntryActivity;

    .prologue
    .line 468
    iput-object p1, p0, Lcom/keepassdroid/EntryActivity$3;->this$0:Lcom/keepassdroid/EntryActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 0
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 471
    invoke-interface {p1}, Landroid/content/DialogInterface;->dismiss()V

    .line 472
    return-void
.end method
