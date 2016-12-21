.class Lcom/keepassdroid/settings/AppSettingsActivity$1;
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
    .line 55
    iput-object p1, p0, Lcom/keepassdroid/settings/AppSettingsActivity$1;->this$0:Lcom/keepassdroid/settings/AppSettingsActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onPreferenceChange(Landroid/preference/Preference;Ljava/lang/Object;)Z
    .locals 2
    .param p1, "preference"    # Landroid/preference/Preference;
    .param p2, "newValue"    # Ljava/lang/Object;

    .prologue
    .line 58
    move-object v0, p2

    check-cast v0, Ljava/lang/Boolean;

    .line 60
    .local v0, "value":Ljava/lang/Boolean;
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-nez v1, :cond_0

    .line 61
    invoke-static {}, Lcom/keepassdroid/app/App;->getFileHistory()Lcom/keepassdroid/fileselect/RecentFileHistory;

    move-result-object v1

    invoke-virtual {v1}, Lcom/keepassdroid/fileselect/RecentFileHistory;->deleteAllKeys()V

    .line 64
    :cond_0
    const/4 v1, 0x1

    return v1
.end method
