.class Lcom/keepassdroid/EntryEditActivity$2;
.super Ljava/lang/Object;
.source "EntryEditActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/keepassdroid/EntryEditActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/keepassdroid/EntryEditActivity;


# direct methods
.method constructor <init>(Lcom/keepassdroid/EntryEditActivity;)V
    .locals 0
    .param p1, "this$0"    # Lcom/keepassdroid/EntryEditActivity;

    .prologue
    .line 161
    iput-object p1, p0, Lcom/keepassdroid/EntryEditActivity$2;->this$0:Lcom/keepassdroid/EntryEditActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 164
    iget-object v0, p0, Lcom/keepassdroid/EntryEditActivity$2;->this$0:Lcom/keepassdroid/EntryEditActivity;

    invoke-static {v0}, Lcom/keepassdroid/GeneratePasswordActivity;->Launch(Landroid/app/Activity;)V

    .line 165
    return-void
.end method
