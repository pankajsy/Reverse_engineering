.class Lcom/keepassdroid/EntryActivity$1;
.super Ljava/lang/Object;
.source "EntryActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/keepassdroid/EntryActivity;->setupEditButtons()V
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
    .line 109
    iput-object p1, p0, Lcom/keepassdroid/EntryActivity$1;->this$0:Lcom/keepassdroid/EntryActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 112
    iget-object v0, p0, Lcom/keepassdroid/EntryActivity$1;->this$0:Lcom/keepassdroid/EntryActivity;

    iget-object v1, p0, Lcom/keepassdroid/EntryActivity$1;->this$0:Lcom/keepassdroid/EntryActivity;

    iget-object v1, v1, Lcom/keepassdroid/EntryActivity;->mEntry:Lcom/keepassdroid/database/PwEntry;

    invoke-static {v0, v1}, Lcom/keepassdroid/EntryEditActivity;->Launch(Landroid/app/Activity;Lcom/keepassdroid/database/PwEntry;)V

    .line 113
    return-void
.end method
