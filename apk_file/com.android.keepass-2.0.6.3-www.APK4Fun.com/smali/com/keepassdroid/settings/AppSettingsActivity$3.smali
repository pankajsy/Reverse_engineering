.class Lcom/keepassdroid/settings/AppSettingsActivity$3;
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
    .line 89
    iput-object p1, p0, Lcom/keepassdroid/settings/AppSettingsActivity$3;->this$0:Lcom/keepassdroid/settings/AppSettingsActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onPreferenceChange(Landroid/preference/Preference;Ljava/lang/Object;)Z
    .locals 2
    .param p1, "preference"    # Landroid/preference/Preference;
    .param p2, "newValue"    # Ljava/lang/Object;

    .prologue
    .line 92
    iget-object v0, p0, Lcom/keepassdroid/settings/AppSettingsActivity$3;->this$0:Lcom/keepassdroid/settings/AppSettingsActivity;

    invoke-static {}, Lcom/keepassdroid/app/App;->getDB()Lcom/keepassdroid/Database;

    move-result-object v1

    # invokes: Lcom/keepassdroid/settings/AppSettingsActivity;->setRounds(Lcom/keepassdroid/Database;Landroid/preference/Preference;)V
    invoke-static {v0, v1, p1}, Lcom/keepassdroid/settings/AppSettingsActivity;->access$000(Lcom/keepassdroid/settings/AppSettingsActivity;Lcom/keepassdroid/Database;Landroid/preference/Preference;)V

    .line 93
    const/4 v0, 0x1

    return v0
.end method
