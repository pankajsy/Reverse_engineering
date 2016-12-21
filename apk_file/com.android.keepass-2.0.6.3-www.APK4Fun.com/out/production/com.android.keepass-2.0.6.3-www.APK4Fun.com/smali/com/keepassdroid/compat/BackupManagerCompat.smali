.class public Lcom/keepassdroid/compat/BackupManagerCompat;
.super Ljava/lang/Object;
.source "BackupManagerCompat.java"


# static fields
.field private static classBackupManager:Ljava/lang/Class;

.field private static constructorBackupManager:Ljava/lang/reflect/Constructor;

.field private static dataChanged:Ljava/lang/reflect/Method;


# instance fields
.field private backupManager:Ljava/lang/Object;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    .line 38
    :try_start_0
    const-string v0, "android.app.backup.BackupManager"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lcom/keepassdroid/compat/BackupManagerCompat;->classBackupManager:Ljava/lang/Class;

    .line 39
    sget-object v0, Lcom/keepassdroid/compat/BackupManagerCompat;->classBackupManager:Ljava/lang/Class;

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Class;

    const/4 v2, 0x0

    const-class v3, Landroid/content/Context;

    aput-object v3, v1, v2

    invoke-virtual {v0, v1}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v0

    sput-object v0, Lcom/keepassdroid/compat/BackupManagerCompat;->constructorBackupManager:Ljava/lang/reflect/Constructor;

    .line 40
    sget-object v1, Lcom/keepassdroid/compat/BackupManagerCompat;->classBackupManager:Ljava/lang/Class;

    const-string v2, "dataChanged"

    const/4 v0, 0x0

    check-cast v0, [Ljava/lang/Class;

    invoke-virtual {v1, v2, v0}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    sput-object v0, Lcom/keepassdroid/compat/BackupManagerCompat;->dataChanged:Ljava/lang/reflect/Method;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 44
    :goto_0
    return-void

    .line 41
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 3
    .param p1, "ctx"    # Landroid/content/Context;

    .prologue
    .line 46
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 47
    sget-object v0, Lcom/keepassdroid/compat/BackupManagerCompat;->constructorBackupManager:Ljava/lang/reflect/Constructor;

    if-eqz v0, :cond_0

    .line 49
    :try_start_0
    sget-object v0, Lcom/keepassdroid/compat/BackupManagerCompat;->constructorBackupManager:Ljava/lang/reflect/Constructor;

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    invoke-virtual {v0, v1}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    iput-object v0, p0, Lcom/keepassdroid/compat/BackupManagerCompat;->backupManager:Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 54
    :cond_0
    :goto_0
    return-void

    .line 50
    :catch_0
    move-exception v0

    goto :goto_0
.end method


# virtual methods
.method public dataChanged()V
    .locals 3

    .prologue
    .line 57
    iget-object v0, p0, Lcom/keepassdroid/compat/BackupManagerCompat;->backupManager:Ljava/lang/Object;

    if-eqz v0, :cond_0

    sget-object v0, Lcom/keepassdroid/compat/BackupManagerCompat;->dataChanged:Ljava/lang/reflect/Method;

    if-eqz v0, :cond_0

    .line 59
    :try_start_0
    sget-object v1, Lcom/keepassdroid/compat/BackupManagerCompat;->dataChanged:Ljava/lang/reflect/Method;

    iget-object v2, p0, Lcom/keepassdroid/compat/BackupManagerCompat;->backupManager:Ljava/lang/Object;

    const/4 v0, 0x0

    check-cast v0, [Ljava/lang/Object;

    invoke-virtual {v1, v2, v0}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 64
    :cond_0
    :goto_0
    return-void

    .line 60
    :catch_0
    move-exception v0

    goto :goto_0
.end method
