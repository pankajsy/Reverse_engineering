.class public Lcom/keepassdroid/utils/SprContextV4;
.super Ljava/lang/Object;
.source "SprContextV4.java"

# interfaces
.implements Ljava/lang/Cloneable;


# instance fields
.field public db:Lcom/keepassdroid/database/PwDatabaseV4;

.field public entry:Lcom/keepassdroid/database/PwEntryV4;

.field public refsCache:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/keepassdroid/database/PwDatabaseV4;Lcom/keepassdroid/database/PwEntryV4;)V
    .locals 1
    .param p1, "db"    # Lcom/keepassdroid/database/PwDatabaseV4;
    .param p2, "entry"    # Lcom/keepassdroid/database/PwEntryV4;

    .prologue
    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 31
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/keepassdroid/utils/SprContextV4;->refsCache:Ljava/util/Map;

    .line 34
    iput-object p1, p0, Lcom/keepassdroid/utils/SprContextV4;->db:Lcom/keepassdroid/database/PwDatabaseV4;

    .line 35
    iput-object p2, p0, Lcom/keepassdroid/utils/SprContextV4;->entry:Lcom/keepassdroid/database/PwEntryV4;

    .line 36
    return-void
.end method


# virtual methods
.method protected clone()Ljava/lang/Object;
    .locals 2

    .prologue
    .line 41
    :try_start_0
    invoke-super {p0}, Ljava/lang/Object;->clone()Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/CloneNotSupportedException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 43
    :goto_0
    return-object v1

    .line 42
    :catch_0
    move-exception v0

    .line 43
    .local v0, "e":Ljava/lang/CloneNotSupportedException;
    const/4 v1, 0x0

    goto :goto_0
.end method
