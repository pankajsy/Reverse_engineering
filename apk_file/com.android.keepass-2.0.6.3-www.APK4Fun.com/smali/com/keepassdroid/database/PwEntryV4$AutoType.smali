.class public Lcom/keepassdroid/database/PwEntryV4$AutoType;
.super Ljava/lang/Object;
.source "PwEntryV4.java"

# interfaces
.implements Ljava/lang/Cloneable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/keepassdroid/database/PwEntryV4;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "AutoType"
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z

.field private static final OBF_OPT_NONE:J


# instance fields
.field public defaultSequence:Ljava/lang/String;

.field public enabled:Z

.field public obfuscationOptions:J

.field final synthetic this$0:Lcom/keepassdroid/database/PwEntryV4;

.field private windowSeqPairs:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 63
    const-class v0, Lcom/keepassdroid/database/PwEntryV4;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    sput-boolean v0, Lcom/keepassdroid/database/PwEntryV4$AutoType;->$assertionsDisabled:Z

    return-void

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public constructor <init>(Lcom/keepassdroid/database/PwEntryV4;)V
    .locals 2
    .param p1, "this$0"    # Lcom/keepassdroid/database/PwEntryV4;

    .prologue
    .line 63
    iput-object p1, p0, Lcom/keepassdroid/database/PwEntryV4$AutoType;->this$0:Lcom/keepassdroid/database/PwEntryV4;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 66
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/keepassdroid/database/PwEntryV4$AutoType;->enabled:Z

    .line 67
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/keepassdroid/database/PwEntryV4$AutoType;->obfuscationOptions:J

    .line 68
    const-string v0, ""

    iput-object v0, p0, Lcom/keepassdroid/database/PwEntryV4$AutoType;->defaultSequence:Ljava/lang/String;

    .line 70
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/keepassdroid/database/PwEntryV4$AutoType;->windowSeqPairs:Ljava/util/HashMap;

    return-void
.end method


# virtual methods
.method public clone()Ljava/lang/Object;
    .locals 3

    .prologue
    .line 76
    :try_start_0
    invoke-super {p0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/keepassdroid/database/PwEntryV4$AutoType;
    :try_end_0
    .catch Ljava/lang/CloneNotSupportedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 83
    .local v0, "auto":Lcom/keepassdroid/database/PwEntryV4$AutoType;
    iget-object v2, p0, Lcom/keepassdroid/database/PwEntryV4$AutoType;->windowSeqPairs:Ljava/util/HashMap;

    invoke-virtual {v2}, Ljava/util/HashMap;->clone()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/HashMap;

    iput-object v2, v0, Lcom/keepassdroid/database/PwEntryV4$AutoType;->windowSeqPairs:Ljava/util/HashMap;

    .line 85
    return-object v0

    .line 78
    .end local v0    # "auto":Lcom/keepassdroid/database/PwEntryV4$AutoType;
    :catch_0
    move-exception v1

    .line 79
    .local v1, "e":Ljava/lang/CloneNotSupportedException;
    sget-boolean v2, Lcom/keepassdroid/database/PwEntryV4$AutoType;->$assertionsDisabled:Z

    if-nez v2, :cond_0

    new-instance v2, Ljava/lang/AssertionError;

    invoke-direct {v2}, Ljava/lang/AssertionError;-><init>()V

    throw v2

    .line 80
    :cond_0
    new-instance v2, Ljava/lang/RuntimeException;

    invoke-direct {v2, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v2
.end method

.method public entrySet()Ljava/util/Set;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<",
            "Ljava/util/Map$Entry",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation

    .prologue
    .line 94
    iget-object v0, p0, Lcom/keepassdroid/database/PwEntryV4$AutoType;->windowSeqPairs:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method public put(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    .line 90
    iget-object v0, p0, Lcom/keepassdroid/database/PwEntryV4$AutoType;->windowSeqPairs:Ljava/util/HashMap;

    invoke-virtual {v0, p1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 91
    return-void
.end method
