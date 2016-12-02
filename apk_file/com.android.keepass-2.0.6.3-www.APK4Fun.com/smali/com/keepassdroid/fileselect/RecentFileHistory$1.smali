.class Lcom/keepassdroid/fileselect/RecentFileHistory$1;
.super Ljava/lang/Object;
.source "RecentFileHistory.java"

# interfaces
.implements Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/keepassdroid/fileselect/RecentFileHistory;-><init>(Landroid/content/Context;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/keepassdroid/fileselect/RecentFileHistory;


# direct methods
.method constructor <init>(Lcom/keepassdroid/fileselect/RecentFileHistory;)V
    .locals 0
    .param p1, "this$0"    # Lcom/keepassdroid/fileselect/RecentFileHistory;

    .prologue
    .line 55
    iput-object p1, p0, Lcom/keepassdroid/fileselect/RecentFileHistory$1;->this$0:Lcom/keepassdroid/fileselect/RecentFileHistory;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onSharedPreferenceChanged(Landroid/content/SharedPreferences;Ljava/lang/String;)V
    .locals 4
    .param p1, "sharedPreferences"    # Landroid/content/SharedPreferences;
    .param p2, "key"    # Ljava/lang/String;

    .prologue
    const v2, 0x7f0600c5

    .line 60
    iget-object v0, p0, Lcom/keepassdroid/fileselect/RecentFileHistory$1;->this$0:Lcom/keepassdroid/fileselect/RecentFileHistory;

    # getter for: Lcom/keepassdroid/fileselect/RecentFileHistory;->ctx:Landroid/content/Context;
    invoke-static {v0}, Lcom/keepassdroid/fileselect/RecentFileHistory;->access$000(Lcom/keepassdroid/fileselect/RecentFileHistory;)Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 61
    iget-object v0, p0, Lcom/keepassdroid/fileselect/RecentFileHistory$1;->this$0:Lcom/keepassdroid/fileselect/RecentFileHistory;

    iget-object v1, p0, Lcom/keepassdroid/fileselect/RecentFileHistory$1;->this$0:Lcom/keepassdroid/fileselect/RecentFileHistory;

    # getter for: Lcom/keepassdroid/fileselect/RecentFileHistory;->ctx:Landroid/content/Context;
    invoke-static {v1}, Lcom/keepassdroid/fileselect/RecentFileHistory;->access$000(Lcom/keepassdroid/fileselect/RecentFileHistory;)Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/keepassdroid/fileselect/RecentFileHistory$1;->this$0:Lcom/keepassdroid/fileselect/RecentFileHistory;

    # getter for: Lcom/keepassdroid/fileselect/RecentFileHistory;->ctx:Landroid/content/Context;
    invoke-static {v2}, Lcom/keepassdroid/fileselect/RecentFileHistory;->access$000(Lcom/keepassdroid/fileselect/RecentFileHistory;)Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f080003

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v2

    invoke-interface {p1, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    # setter for: Lcom/keepassdroid/fileselect/RecentFileHistory;->enabled:Z
    invoke-static {v0, v1}, Lcom/keepassdroid/fileselect/RecentFileHistory;->access$102(Lcom/keepassdroid/fileselect/RecentFileHistory;Z)Z

    .line 63
    :cond_0
    return-void
.end method
