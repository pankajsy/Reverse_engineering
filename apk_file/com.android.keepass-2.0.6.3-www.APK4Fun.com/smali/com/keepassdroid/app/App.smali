.class public Lcom/keepassdroid/app/App;
.super Landroid/app/Application;
.source "App.java"


# static fields
.field private static calendar:Ljava/util/Calendar;

.field private static db:Lcom/keepassdroid/Database;

.field private static fileHistory:Lcom/keepassdroid/fileselect/RecentFileHistory;

.field private static shutdown:Z


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 31
    sput-object v1, Lcom/keepassdroid/app/App;->db:Lcom/keepassdroid/Database;

    .line 32
    const/4 v0, 0x0

    sput-boolean v0, Lcom/keepassdroid/app/App;->shutdown:Z

    .line 33
    sput-object v1, Lcom/keepassdroid/app/App;->calendar:Ljava/util/Calendar;

    .line 34
    sput-object v1, Lcom/keepassdroid/app/App;->fileHistory:Lcom/keepassdroid/fileselect/RecentFileHistory;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 30
    invoke-direct {p0}, Landroid/app/Application;-><init>()V

    return-void
.end method

.method public static clearShutdown()V
    .locals 1

    .prologue
    .line 61
    const/4 v0, 0x0

    sput-boolean v0, Lcom/keepassdroid/app/App;->shutdown:Z

    .line 62
    return-void
.end method

.method public static getCalendar()Ljava/util/Calendar;
    .locals 1

    .prologue
    .line 65
    sget-object v0, Lcom/keepassdroid/app/App;->calendar:Ljava/util/Calendar;

    if-nez v0, :cond_0

    .line 66
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v0

    sput-object v0, Lcom/keepassdroid/app/App;->calendar:Ljava/util/Calendar;

    .line 69
    :cond_0
    sget-object v0, Lcom/keepassdroid/app/App;->calendar:Ljava/util/Calendar;

    return-object v0
.end method

.method public static getDB()Lcom/keepassdroid/Database;
    .locals 1

    .prologue
    .line 37
    sget-object v0, Lcom/keepassdroid/app/App;->db:Lcom/keepassdroid/Database;

    if-nez v0, :cond_0

    .line 38
    new-instance v0, Lcom/keepassdroid/Database;

    invoke-direct {v0}, Lcom/keepassdroid/Database;-><init>()V

    sput-object v0, Lcom/keepassdroid/app/App;->db:Lcom/keepassdroid/Database;

    .line 41
    :cond_0
    sget-object v0, Lcom/keepassdroid/app/App;->db:Lcom/keepassdroid/Database;

    return-object v0
.end method

.method public static getFileHistory()Lcom/keepassdroid/fileselect/RecentFileHistory;
    .locals 1

    .prologue
    .line 45
    sget-object v0, Lcom/keepassdroid/app/App;->fileHistory:Lcom/keepassdroid/fileselect/RecentFileHistory;

    return-object v0
.end method

.method public static isShutdown()Z
    .locals 1

    .prologue
    .line 53
    sget-boolean v0, Lcom/keepassdroid/app/App;->shutdown:Z

    return v0
.end method

.method public static setDB(Lcom/keepassdroid/Database;)V
    .locals 0
    .param p0, "d"    # Lcom/keepassdroid/Database;

    .prologue
    .line 49
    sput-object p0, Lcom/keepassdroid/app/App;->db:Lcom/keepassdroid/Database;

    .line 50
    return-void
.end method

.method public static setShutdown()V
    .locals 1

    .prologue
    .line 57
    const/4 v0, 0x1

    sput-boolean v0, Lcom/keepassdroid/app/App;->shutdown:Z

    .line 58
    return-void
.end method


# virtual methods
.method public onCreate()V
    .locals 1

    .prologue
    .line 74
    invoke-super {p0}, Landroid/app/Application;->onCreate()V

    .line 76
    new-instance v0, Lcom/keepassdroid/fileselect/RecentFileHistory;

    invoke-direct {v0, p0}, Lcom/keepassdroid/fileselect/RecentFileHistory;-><init>(Landroid/content/Context;)V

    sput-object v0, Lcom/keepassdroid/app/App;->fileHistory:Lcom/keepassdroid/fileselect/RecentFileHistory;

    .line 78
    invoke-static {}, Lcom/keepassdroid/compat/PRNGFixes;->apply()V

    .line 79
    return-void
.end method

.method public onTerminate()V
    .locals 1

    .prologue
    .line 83
    sget-object v0, Lcom/keepassdroid/app/App;->db:Lcom/keepassdroid/Database;

    if-eqz v0, :cond_0

    .line 84
    sget-object v0, Lcom/keepassdroid/app/App;->db:Lcom/keepassdroid/Database;

    invoke-virtual {v0}, Lcom/keepassdroid/Database;->clear()V

    .line 87
    :cond_0
    invoke-super {p0}, Landroid/app/Application;->onTerminate()V

    .line 88
    return-void
.end method
