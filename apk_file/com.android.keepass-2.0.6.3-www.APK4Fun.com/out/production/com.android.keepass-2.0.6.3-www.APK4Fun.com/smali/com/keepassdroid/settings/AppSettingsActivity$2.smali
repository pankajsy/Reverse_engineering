.class Lcom/keepassdroid/settings/AppSettingsActivity$2;
.super Ljava/lang/Object;
.source "AppSettingsActivity.java"

# interfaces
.implements Landroid/preference/Preference$OnPreferenceChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/keepassdroid/settings/AppSettingsActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/keepassdroid/settings/AppSettingsActivity;


# direct methods
.method constructor <init>(Lcom/keepassdroid/settings/AppSettingsActivity;)V
    .locals 0
    .param p1, "this$0"    # Lcom/keepassdroid/settings/AppSettingsActivity;

    .prologue
    .line 69
    iput-object p1, p0, Lcom/keepassdroid/settings/AppSettingsActivity$2;->this$0:Lcom/keepassdroid/settings/AppSettingsActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onPreferenceChange(Landroid/preference/Preference;Ljava/lang/Object;)Z
    .locals 3
    .param p1, "preference"    # Landroid/preference/Preference;
    .param p2, "newValue"    # Ljava/lang/Object;

    .prologue
    const/4 v2, 0x1

    .line 72
    move-object v0, p2

    check-cast v0, Ljava/lang/Boolean;

    .line 74
    .local v0, "value":Ljava/lang/Boolean;
    if-nez v0, :cond_0

    .line 75
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    .line 78
    :cond_0
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-nez v1, :cond_1

    .line 79
    invoke-static {}, Lcom/keepassdroid/app/App;->getFileHistory()Lcom/keepassdroid/fileselect/RecentFileHistory;

    move-result-object v1

    invoke-virtual {v1}, Lcom/keepassdroid/fileselect/RecentFileHistory;->deleteAll()V

    .line 82
    :cond_1
    return v2
.end method
