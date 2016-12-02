.class Lcom/keepassdroid/database/save/PwDbV4Output$EntryWriter;
.super Lcom/keepassdroid/database/EntryHandler;
.source "PwDbV4Output.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/keepassdroid/database/save/PwDbV4Output;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "EntryWriter"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/keepassdroid/database/EntryHandler",
        "<",
        "Lcom/keepassdroid/database/PwEntry;",
        ">;"
    }
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z


# instance fields
.field final synthetic this$0:Lcom/keepassdroid/database/save/PwDbV4Output;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 149
    const-class v0, Lcom/keepassdroid/database/save/PwDbV4Output;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    sput-boolean v0, Lcom/keepassdroid/database/save/PwDbV4Output$EntryWriter;->$assertionsDisabled:Z

    return-void

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private constructor <init>(Lcom/keepassdroid/database/save/PwDbV4Output;)V
    .locals 0

    .prologue
    .line 149
    iput-object p1, p0, Lcom/keepassdroid/database/save/PwDbV4Output$EntryWriter;->this$0:Lcom/keepassdroid/database/save/PwDbV4Output;

    invoke-direct {p0}, Lcom/keepassdroid/database/EntryHandler;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/keepassdroid/database/save/PwDbV4Output;Lcom/keepassdroid/database/save/PwDbV4Output$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/keepassdroid/database/save/PwDbV4Output;
    .param p2, "x1"    # Lcom/keepassdroid/database/save/PwDbV4Output$1;

    .prologue
    .line 149
    invoke-direct {p0, p1}, Lcom/keepassdroid/database/save/PwDbV4Output$EntryWriter;-><init>(Lcom/keepassdroid/database/save/PwDbV4Output;)V

    return-void
.end method


# virtual methods
.method public operate(Lcom/keepassdroid/database/PwEntry;)Z
    .locals 4
    .param p1, "e"    # Lcom/keepassdroid/database/PwEntry;

    .prologue
    .line 153
    move-object v0, p1

    check-cast v0, Lcom/keepassdroid/database/PwEntryV4;

    .line 154
    .local v0, "entry":Lcom/keepassdroid/database/PwEntryV4;
    sget-boolean v2, Lcom/keepassdroid/database/save/PwDbV4Output$EntryWriter;->$assertionsDisabled:Z

    if-nez v2, :cond_0

    if-nez v0, :cond_0

    new-instance v2, Ljava/lang/AssertionError;

    invoke-direct {v2}, Ljava/lang/AssertionError;-><init>()V

    throw v2

    .line 157
    :cond_0
    :try_start_0
    iget-object v2, p0, Lcom/keepassdroid/database/save/PwDbV4Output$EntryWriter;->this$0:Lcom/keepassdroid/database/save/PwDbV4Output;

    const/4 v3, 0x0

    # invokes: Lcom/keepassdroid/database/save/PwDbV4Output;->writeEntry(Lcom/keepassdroid/database/PwEntryV4;Z)V
    invoke-static {v2, v0, v3}, Lcom/keepassdroid/database/save/PwDbV4Output;->access$200(Lcom/keepassdroid/database/save/PwDbV4Output;Lcom/keepassdroid/database/PwEntryV4;Z)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 162
    const/4 v2, 0x1

    return v2

    .line 158
    :catch_0
    move-exception v1

    .line 159
    .local v1, "ex":Ljava/io/IOException;
    new-instance v2, Ljava/lang/RuntimeException;

    invoke-direct {v2, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v2
.end method
