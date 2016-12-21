.class Lcom/keepassdroid/GroupActivity$2;
.super Ljava/lang/Object;
.source "GroupActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/keepassdroid/GroupActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/keepassdroid/GroupActivity;


# direct methods
.method constructor <init>(Lcom/keepassdroid/GroupActivity;)V
    .locals 0
    .param p1, "this$0"    # Lcom/keepassdroid/GroupActivity;

    .prologue
    .line 164
    iput-object p1, p0, Lcom/keepassdroid/GroupActivity$2;->this$0:Lcom/keepassdroid/GroupActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 167
    iget-object v0, p0, Lcom/keepassdroid/GroupActivity$2;->this$0:Lcom/keepassdroid/GroupActivity;

    iget-object v1, p0, Lcom/keepassdroid/GroupActivity$2;->this$0:Lcom/keepassdroid/GroupActivity;

    iget-object v1, v1, Lcom/keepassdroid/GroupActivity;->mGroup:Lcom/keepassdroid/database/PwGroup;

    invoke-static {v0, v1}, Lcom/keepassdroid/EntryEditActivity;->Launch(Landroid/app/Activity;Lcom/keepassdroid/database/PwGroup;)V

    .line 168
    return-void
.end method
