.class public Lcom/keepassdroid/settings/AppSettingsActivity;
.super Lcom/keepassdroid/LockingClosePreferenceActivity;
.source "AppSettingsActivity.java"


# static fields
.field public static KEYFILE_DEFAULT:Z


# instance fields
.field private backupManager:Lcom/keepassdroid/compat/BackupManagerCompat;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 38
    const/4 v0, 0x0

    sput-boolean v0, Lcom/keepassdroid/settings/AppSettingsActivity;->KEYFILE_DEFAULT:Z

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 37
    invoke-direct {p0}, Lcom/keepassdroid/LockingClosePreferenceActivity;-><init>()V

    return-void
.end method

.method public static Launch(Landroid/content/Context;)V
    .locals 2
    .param p0, "ctx"    # Landroid/content/Context;

    .prologue
    .line 43
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/keepassdroid/settings/AppSettingsActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 45
    .local v0, "i":Landroid/content/Intent;
    invoke-virtual {p0, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 46
    return-void
.end method

.method static synthetic access$000(Lcom/keepassdroid/settings/AppSettingsActivity;Lcom/keepassdroid/Database;Landroid/preference/Preference;)V
    .locals 0
    .param p0, "x0"    # Lcom/keepassdroid/settings/AppSettingsActivity;
    .param p1, "x1"    # Lcom/keepassdroid/Database;
    .param p2, "x2"    # Landroid/preference/Preference;

    .prologue
    .line 37
    invoke-direct {p0, p1, p2}, Lcom/keepassdroid/settings/AppSettingsActivity;->setRounds(Lcom/keepassdroid/Database;Landroid/preference/Preference;)V

    return-void
.end method

.method private setAlgorithm(Lcom/keepassdroid/Database;Landroid/preference/Preference;)V
    .locals 3
    .param p1, "db"    # Lcom/keepassdroid/Database;
    .param p2, "algorithm"    # Landroid/preference/Preference;

    .prologue
    .line 124
    iget-object v1, p1, Lcom/keepassdroid/Database;->pm:Lcom/keepassdroid/database/PwDatabase;

    invoke-virtual {v1}, Lcom/keepassdroid/database/PwDatabase;->getEncAlgorithm()Lcom/keepassdroid/database/PwEncryptionAlgorithm;

    move-result-object v1

    sget-object v2, Lcom/keepassdroid/database/PwEncryptionAlgorithm;->Rjindal:Lcom/keepassdroid/database/PwEncryptionAlgorithm;

    if-ne v1, v2, :cond_0

    .line 125
    const v0, 0x7f060081

    .line 130
    .local v0, "resId":I
    :goto_0
    invoke-virtual {p2, v0}, Landroid/preference/Preference;->setSummary(I)V

    .line 131
    return-void

    .line 127
    .end local v0    # "resId":I
    :cond_0
    const v0, 0x7f06008f

    .restart local v0    # "resId":I
    goto :goto_0
.end method

.method private setRounds(Lcom/keepassdroid/Database;Landroid/preference/Preference;)V
    .locals 2
    .param p1, "db"    # Lcom/keepassdroid/Database;
    .param p2, "rounds"    # Landroid/preference/Preference;

    .prologue
    .line 119
    iget-object v0, p1, Lcom/keepassdroid/Database;->pm:Lcom/keepassdroid/database/PwDatabase;

    invoke-virtual {v0}, Lcom/keepassdroid/database/PwDatabase;->getNumRounds()J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Landroid/preference/Preference;->setSummary(Ljava/lang/CharSequence;)V

    .line 120
    return-void
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 7
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 50
    invoke-super {p0, p1}, Lcom/keepassdroid/LockingClosePreferenceActivity;->onCreate(Landroid/os/Bundle;)V

    .line 52
    const/high16 v6, 0x7f040000

    invoke-virtual {p0, v6}, Lcom/keepassdroid/settings/AppSettingsActivity;->addPreferencesFromResource(I)V

    .line 54
    const v6, 0x7f0600be

    invoke-virtual {p0, v6}, Lcom/keepassdroid/settings/AppSettingsActivity;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p0, v6}, Lcom/keepassdroid/settings/AppSettingsActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v3

    .line 55
    .local v3, "keyFile":Landroid/preference/Preference;
    new-instance v6, Lcom/keepassdroid/settings/AppSettingsActivity$1;

    invoke-direct {v6, p0}, Lcom/keepassdroid/settings/AppSettingsActivity$1;-><init>(Lcom/keepassdroid/settings/AppSettingsActivity;)V

    invoke-virtual {v3, v6}, Landroid/preference/Preference;->setOnPreferenceChangeListener(Landroid/preference/Preference$OnPreferenceChangeListener;)V

    .line 68
    const v6, 0x7f0600c5

    invoke-virtual {p0, v6}, Lcom/keepassdroid/settings/AppSettingsActivity;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p0, v6}, Lcom/keepassdroid/settings/AppSettingsActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v4

    .line 69
    .local v4, "recentHistory":Landroid/preference/Preference;
    new-instance v6, Lcom/keepassdroid/settings/AppSettingsActivity$2;

    invoke-direct {v6, p0}, Lcom/keepassdroid/settings/AppSettingsActivity$2;-><init>(Lcom/keepassdroid/settings/AppSettingsActivity;)V

    invoke-virtual {v4, v6}, Landroid/preference/Preference;->setOnPreferenceChangeListener(Landroid/preference/Preference$OnPreferenceChangeListener;)V

    .line 86
    invoke-static {}, Lcom/keepassdroid/app/App;->getDB()Lcom/keepassdroid/Database;

    move-result-object v1

    .line 87
    .local v1, "db":Lcom/keepassdroid/Database;
    invoke-virtual {v1}, Lcom/keepassdroid/Database;->Loaded()Z

    move-result v6

    if-eqz v6, :cond_0

    iget-object v6, v1, Lcom/keepassdroid/Database;->pm:Lcom/keepassdroid/database/PwDatabase;

    invoke-virtual {v6}, Lcom/keepassdroid/database/PwDatabase;->appSettingsEnabled()Z

    move-result v6

    if-eqz v6, :cond_0

    .line 88
    const v6, 0x7f0600c6

    invoke-virtual {p0, v6}, Lcom/keepassdroid/settings/AppSettingsActivity;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p0, v6}, Lcom/keepassdroid/settings/AppSettingsActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v5

    .line 89
    .local v5, "rounds":Landroid/preference/Preference;
    new-instance v6, Lcom/keepassdroid/settings/AppSettingsActivity$3;

    invoke-direct {v6, p0}, Lcom/keepassdroid/settings/AppSettingsActivity$3;-><init>(Lcom/keepassdroid/settings/AppSettingsActivity;)V

    invoke-virtual {v5, v6}, Landroid/preference/Preference;->setOnPreferenceChangeListener(Landroid/preference/Preference$OnPreferenceChangeListener;)V

    .line 97
    invoke-direct {p0, v1, v5}, Lcom/keepassdroid/settings/AppSettingsActivity;->setRounds(Lcom/keepassdroid/Database;Landroid/preference/Preference;)V

    .line 99
    const v6, 0x7f0600ae

    invoke-virtual {p0, v6}, Lcom/keepassdroid/settings/AppSettingsActivity;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p0, v6}, Lcom/keepassdroid/settings/AppSettingsActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    .line 100
    .local v0, "algorithm":Landroid/preference/Preference;
    invoke-direct {p0, v1, v0}, Lcom/keepassdroid/settings/AppSettingsActivity;->setAlgorithm(Lcom/keepassdroid/Database;Landroid/preference/Preference;)V

    .line 107
    .end local v0    # "algorithm":Landroid/preference/Preference;
    .end local v5    # "rounds":Landroid/preference/Preference;
    :goto_0
    new-instance v6, Lcom/keepassdroid/compat/BackupManagerCompat;

    invoke-direct {v6, p0}, Lcom/keepassdroid/compat/BackupManagerCompat;-><init>(Landroid/content/Context;)V

    iput-object v6, p0, Lcom/keepassdroid/settings/AppSettingsActivity;->backupManager:Lcom/keepassdroid/compat/BackupManagerCompat;

    .line 109
    return-void

    .line 103
    :cond_0
    const v6, 0x7f0600b4

    invoke-virtual {p0, v6}, Lcom/keepassdroid/settings/AppSettingsActivity;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p0, v6}, Lcom/keepassdroid/settings/AppSettingsActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v2

    .line 104
    .local v2, "dbSettings":Landroid/preference/Preference;
    const/4 v6, 0x0

    invoke-virtual {v2, v6}, Landroid/preference/Preference;->setEnabled(Z)V

    goto :goto_0
.end method

.method protected onStop()V
    .locals 1

    .prologue
    .line 113
    iget-object v0, p0, Lcom/keepassdroid/settings/AppSettingsActivity;->backupManager:Lcom/keepassdroid/compat/BackupManagerCompat;

    invoke-virtual {v0}, Lcom/keepassdroid/compat/BackupManagerCompat;->dataChanged()V

    .line 115
    invoke-super {p0}, Lcom/keepassdroid/LockingClosePreferenceActivity;->onStop()V

    .line 116
    return-void
.end method
