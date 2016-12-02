.class Lcom/keepassdroid/settings/RoundsPreference$AfterSave;
.super Lcom/keepassdroid/database/edit/OnFinish;
.source "RoundsPreference.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/keepassdroid/settings/RoundsPreference;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "AfterSave"
.end annotation


# instance fields
.field private mCtx:Landroid/content/Context;

.field private mOldRounds:J

.field final synthetic this$0:Lcom/keepassdroid/settings/RoundsPreference;


# direct methods
.method public constructor <init>(Lcom/keepassdroid/settings/RoundsPreference;Landroid/content/Context;Landroid/os/Handler;J)V
    .locals 0
    .param p2, "ctx"    # Landroid/content/Context;
    .param p3, "handler"    # Landroid/os/Handler;
    .param p4, "oldRounds"    # J

    .prologue
    .line 106
    iput-object p1, p0, Lcom/keepassdroid/settings/RoundsPreference$AfterSave;->this$0:Lcom/keepassdroid/settings/RoundsPreference;

    .line 107
    invoke-direct {p0, p3}, Lcom/keepassdroid/database/edit/OnFinish;-><init>(Landroid/os/Handler;)V

    .line 109
    iput-object p2, p0, Lcom/keepassdroid/settings/RoundsPreference$AfterSave;->mCtx:Landroid/content/Context;

    .line 110
    iput-wide p4, p0, Lcom/keepassdroid/settings/RoundsPreference$AfterSave;->mOldRounds:J

    .line 111
    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .prologue
    .line 115
    iget-boolean v1, p0, Lcom/keepassdroid/settings/RoundsPreference$AfterSave;->mSuccess:Z

    if-eqz v1, :cond_1

    .line 116
    iget-object v1, p0, Lcom/keepassdroid/settings/RoundsPreference$AfterSave;->this$0:Lcom/keepassdroid/settings/RoundsPreference;

    invoke-virtual {v1}, Lcom/keepassdroid/settings/RoundsPreference;->getOnPreferenceChangeListener()Landroid/preference/Preference$OnPreferenceChangeListener;

    move-result-object v0

    .line 117
    .local v0, "listner":Landroid/preference/Preference$OnPreferenceChangeListener;
    if-eqz v0, :cond_0

    .line 118
    iget-object v1, p0, Lcom/keepassdroid/settings/RoundsPreference$AfterSave;->this$0:Lcom/keepassdroid/settings/RoundsPreference;

    const/4 v2, 0x0

    invoke-interface {v0, v1, v2}, Landroid/preference/Preference$OnPreferenceChangeListener;->onPreferenceChange(Landroid/preference/Preference;Ljava/lang/Object;)Z

    .line 125
    .end local v0    # "listner":Landroid/preference/Preference$OnPreferenceChangeListener;
    :cond_0
    :goto_0
    invoke-super {p0}, Lcom/keepassdroid/database/edit/OnFinish;->run()V

    .line 126
    return-void

    .line 121
    :cond_1
    iget-object v1, p0, Lcom/keepassdroid/settings/RoundsPreference$AfterSave;->mCtx:Landroid/content/Context;

    invoke-virtual {p0, v1}, Lcom/keepassdroid/settings/RoundsPreference$AfterSave;->displayMessage(Landroid/content/Context;)V

    .line 122
    iget-object v1, p0, Lcom/keepassdroid/settings/RoundsPreference$AfterSave;->this$0:Lcom/keepassdroid/settings/RoundsPreference;

    # getter for: Lcom/keepassdroid/settings/RoundsPreference;->mPM:Lcom/keepassdroid/database/PwDatabase;
    invoke-static {v1}, Lcom/keepassdroid/settings/RoundsPreference;->access$000(Lcom/keepassdroid/settings/RoundsPreference;)Lcom/keepassdroid/database/PwDatabase;

    move-result-object v1

    iget-wide v2, p0, Lcom/keepassdroid/settings/RoundsPreference$AfterSave;->mOldRounds:J

    invoke-virtual {v1, v2, v3}, Lcom/keepassdroid/database/PwDatabase;->setNumRounds(J)V

    goto :goto_0
.end method
