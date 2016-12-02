.class public Lcom/keepassdroid/backup/SettingsBackupAgent;
.super Landroid/app/backup/BackupAgentHelper;
.source "SettingsBackupAgent.java"


# annotations
.annotation build Landroid/annotation/SuppressLint;
    value = {
        "NewApi"
    }
.end annotation


# static fields
.field private static final PREFS_BACKUP_KEY:Ljava/lang/String; = "prefs"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 27
    invoke-direct {p0}, Landroid/app/backup/BackupAgentHelper;-><init>()V

    return-void
.end method


# virtual methods
.method public onCreate()V
    .locals 4

    .prologue
    .line 33
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lcom/keepassdroid/backup/SettingsBackupAgent;->getPackageName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "_preferences"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 35
    .local v0, "defaultPrefs":Ljava/lang/String;
    new-instance v1, Landroid/app/backup/SharedPreferencesBackupHelper;

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/String;

    const/4 v3, 0x0

    aput-object v0, v2, v3

    invoke-direct {v1, p0, v2}, Landroid/app/backup/SharedPreferencesBackupHelper;-><init>(Landroid/content/Context;[Ljava/lang/String;)V

    .line 36
    .local v1, "prefHelper":Landroid/app/backup/SharedPreferencesBackupHelper;
    const-string v2, "prefs"

    invoke-virtual {p0, v2, v1}, Lcom/keepassdroid/backup/SettingsBackupAgent;->addHelper(Ljava/lang/String;Landroid/app/backup/BackupHelper;)V

    .line 37
    return-void
.end method
