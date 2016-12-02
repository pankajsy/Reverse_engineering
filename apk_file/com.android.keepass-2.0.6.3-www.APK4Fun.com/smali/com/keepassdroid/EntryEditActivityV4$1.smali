.class Lcom/keepassdroid/EntryEditActivityV4$1;
.super Ljava/lang/Object;
.source "EntryEditActivityV4.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/keepassdroid/EntryEditActivityV4;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/keepassdroid/EntryEditActivityV4;


# direct methods
.method constructor <init>(Lcom/keepassdroid/EntryEditActivityV4;)V
    .locals 0
    .param p1, "this$0"    # Lcom/keepassdroid/EntryEditActivityV4;

    .prologue
    .line 84
    iput-object p1, p0, Lcom/keepassdroid/EntryEditActivityV4$1;->this$0:Lcom/keepassdroid/EntryEditActivityV4;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 6
    .param p1, "v"    # Landroid/view/View;

    .prologue
    const/4 v5, 0x0

    .line 88
    iget-object v2, p0, Lcom/keepassdroid/EntryEditActivityV4$1;->this$0:Lcom/keepassdroid/EntryEditActivityV4;

    const v3, 0x7f0b0029

    invoke-virtual {v2, v3}, Lcom/keepassdroid/EntryEditActivityV4;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    .line 90
    .local v0, "container":Landroid/widget/LinearLayout;
    iget-object v2, p0, Lcom/keepassdroid/EntryEditActivityV4$1;->this$0:Lcom/keepassdroid/EntryEditActivityV4;

    # getter for: Lcom/keepassdroid/EntryEditActivityV4;->inflater:Landroid/view/LayoutInflater;
    invoke-static {v2}, Lcom/keepassdroid/EntryEditActivityV4;->access$000(Lcom/keepassdroid/EntryEditActivityV4;)Landroid/view/LayoutInflater;

    move-result-object v2

    const v3, 0x7f030004

    invoke-virtual {v2, v3, v0, v5}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/keepassdroid/view/EntryEditSection;

    .line 91
    .local v1, "ees":Lcom/keepassdroid/view/EntryEditSection;
    const-string v2, ""

    new-instance v3, Lcom/keepassdroid/database/security/ProtectedString;

    const-string v4, ""

    invoke-direct {v3, v5, v4}, Lcom/keepassdroid/database/security/ProtectedString;-><init>(ZLjava/lang/String;)V

    invoke-virtual {v1, v2, v3}, Lcom/keepassdroid/view/EntryEditSection;->setData(Ljava/lang/String;Lcom/keepassdroid/database/security/ProtectedString;)V

    .line 92
    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 95
    iget-object v2, p0, Lcom/keepassdroid/EntryEditActivityV4$1;->this$0:Lcom/keepassdroid/EntryEditActivityV4;

    # getter for: Lcom/keepassdroid/EntryEditActivityV4;->scroll:Landroid/widget/ScrollView;
    invoke-static {v2}, Lcom/keepassdroid/EntryEditActivityV4;->access$100(Lcom/keepassdroid/EntryEditActivityV4;)Landroid/widget/ScrollView;

    move-result-object v2

    new-instance v3, Lcom/keepassdroid/EntryEditActivityV4$1$1;

    invoke-direct {v3, p0}, Lcom/keepassdroid/EntryEditActivityV4$1$1;-><init>(Lcom/keepassdroid/EntryEditActivityV4$1;)V

    invoke-virtual {v2, v3}, Landroid/widget/ScrollView;->post(Ljava/lang/Runnable;)Z

    .line 102
    return-void
.end method
