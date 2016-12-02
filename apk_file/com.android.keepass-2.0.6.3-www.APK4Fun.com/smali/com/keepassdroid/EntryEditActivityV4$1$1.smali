.class Lcom/keepassdroid/EntryEditActivityV4$1$1;
.super Ljava/lang/Object;
.source "EntryEditActivityV4.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/keepassdroid/EntryEditActivityV4$1;->onClick(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/keepassdroid/EntryEditActivityV4$1;


# direct methods
.method constructor <init>(Lcom/keepassdroid/EntryEditActivityV4$1;)V
    .locals 0
    .param p1, "this$1"    # Lcom/keepassdroid/EntryEditActivityV4$1;

    .prologue
    .line 95
    iput-object p1, p0, Lcom/keepassdroid/EntryEditActivityV4$1$1;->this$1:Lcom/keepassdroid/EntryEditActivityV4$1;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 98
    iget-object v0, p0, Lcom/keepassdroid/EntryEditActivityV4$1$1;->this$1:Lcom/keepassdroid/EntryEditActivityV4$1;

    iget-object v0, v0, Lcom/keepassdroid/EntryEditActivityV4$1;->this$0:Lcom/keepassdroid/EntryEditActivityV4;

    # getter for: Lcom/keepassdroid/EntryEditActivityV4;->scroll:Landroid/widget/ScrollView;
    invoke-static {v0}, Lcom/keepassdroid/EntryEditActivityV4;->access$100(Lcom/keepassdroid/EntryEditActivityV4;)Landroid/widget/ScrollView;

    move-result-object v0

    const/16 v1, 0x82

    invoke-virtual {v0, v1}, Landroid/widget/ScrollView;->fullScroll(I)Z

    .line 99
    return-void
.end method
