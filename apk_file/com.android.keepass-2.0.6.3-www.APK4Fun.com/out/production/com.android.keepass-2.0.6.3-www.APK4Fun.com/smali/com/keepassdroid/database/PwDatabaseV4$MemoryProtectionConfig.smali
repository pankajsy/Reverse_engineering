.class public Lcom/keepassdroid/database/PwDatabaseV4$MemoryProtectionConfig;
.super Ljava/lang/Object;
.source "PwDatabaseV4.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/keepassdroid/database/PwDatabaseV4;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "MemoryProtectionConfig"
.end annotation


# instance fields
.field public autoEnableVisualHiding:Z

.field public protectNotes:Z

.field public protectPassword:Z

.field public protectTitle:Z

.field public protectUrl:Z

.field public protectUserName:Z

.field final synthetic this$0:Lcom/keepassdroid/database/PwDatabaseV4;


# direct methods
.method public constructor <init>(Lcom/keepassdroid/database/PwDatabaseV4;)V
    .locals 1
    .param p1, "this$0"    # Lcom/keepassdroid/database/PwDatabaseV4;

    .prologue
    const/4 v0, 0x0

    .line 90
    iput-object p1, p0, Lcom/keepassdroid/database/PwDatabaseV4$MemoryProtectionConfig;->this$0:Lcom/keepassdroid/database/PwDatabaseV4;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 91
    iput-boolean v0, p0, Lcom/keepassdroid/database/PwDatabaseV4$MemoryProtectionConfig;->protectTitle:Z

    .line 92
    iput-boolean v0, p0, Lcom/keepassdroid/database/PwDatabaseV4$MemoryProtectionConfig;->protectUserName:Z

    .line 93
    iput-boolean v0, p0, Lcom/keepassdroid/database/PwDatabaseV4$MemoryProtectionConfig;->protectPassword:Z

    .line 94
    iput-boolean v0, p0, Lcom/keepassdroid/database/PwDatabaseV4$MemoryProtectionConfig;->protectUrl:Z

    .line 95
    iput-boolean v0, p0, Lcom/keepassdroid/database/PwDatabaseV4$MemoryProtectionConfig;->protectNotes:Z

    .line 97
    iput-boolean v0, p0, Lcom/keepassdroid/database/PwDatabaseV4$MemoryProtectionConfig;->autoEnableVisualHiding:Z

    return-void
.end method


# virtual methods
.method public GetProtection(Ljava/lang/String;)Z
    .locals 1
    .param p1, "field"    # Ljava/lang/String;

    .prologue
    .line 100
    const-string v0, "Title"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/keepassdroid/database/PwDatabaseV4$MemoryProtectionConfig;->protectTitle:Z

    .line 106
    :goto_0
    return v0

    .line 101
    :cond_0
    const-string v0, "UserName"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-boolean v0, p0, Lcom/keepassdroid/database/PwDatabaseV4$MemoryProtectionConfig;->protectUserName:Z

    goto :goto_0

    .line 102
    :cond_1
    const-string v0, "Password"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    iget-boolean v0, p0, Lcom/keepassdroid/database/PwDatabaseV4$MemoryProtectionConfig;->protectPassword:Z

    goto :goto_0

    .line 103
    :cond_2
    const-string v0, "URL"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_3

    iget-boolean v0, p0, Lcom/keepassdroid/database/PwDatabaseV4$MemoryProtectionConfig;->protectUrl:Z

    goto :goto_0

    .line 104
    :cond_3
    const-string v0, "Notes"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_4

    iget-boolean v0, p0, Lcom/keepassdroid/database/PwDatabaseV4$MemoryProtectionConfig;->protectNotes:Z

    goto :goto_0

    .line 106
    :cond_4
    const/4 v0, 0x0

    goto :goto_0
.end method
