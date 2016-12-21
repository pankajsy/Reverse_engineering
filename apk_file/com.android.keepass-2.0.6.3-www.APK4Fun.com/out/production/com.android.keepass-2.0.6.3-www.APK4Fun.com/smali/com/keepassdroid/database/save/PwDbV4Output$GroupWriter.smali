.class Lcom/keepassdroid/database/save/PwDbV4Output$GroupWriter;
.super Lcom/keepassdroid/database/GroupHandler;
.source "PwDbV4Output.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/keepassdroid/database/save/PwDbV4Output;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "GroupWriter"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/keepassdroid/database/GroupHandler",
        "<",
        "Lcom/keepassdroid/database/PwGroup;",
        ">;"
    }
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z


# instance fields
.field private groupStack:Ljava/util/Stack;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Stack",
            "<",
            "Lcom/keepassdroid/database/PwGroupV4;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic this$0:Lcom/keepassdroid/database/save/PwDbV4Output;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 117
    const-class v0, Lcom/keepassdroid/database/save/PwDbV4Output;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    sput-boolean v0, Lcom/keepassdroid/database/save/PwDbV4Output$GroupWriter;->$assertionsDisabled:Z

    return-void

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public constructor <init>(Lcom/keepassdroid/database/save/PwDbV4Output;Ljava/util/Stack;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Stack",
            "<",
            "Lcom/keepassdroid/database/PwGroupV4;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 120
    .local p2, "gs":Ljava/util/Stack;, "Ljava/util/Stack<Lcom/keepassdroid/database/PwGroupV4;>;"
    iput-object p1, p0, Lcom/keepassdroid/database/save/PwDbV4Output$GroupWriter;->this$0:Lcom/keepassdroid/database/save/PwDbV4Output;

    invoke-direct {p0}, Lcom/keepassdroid/database/GroupHandler;-><init>()V

    .line 121
    iput-object p2, p0, Lcom/keepassdroid/database/save/PwDbV4Output$GroupWriter;->groupStack:Ljava/util/Stack;

    .line 122
    return-void
.end method


# virtual methods
.method public operate(Lcom/keepassdroid/database/PwGroup;)Z
    .locals 4
    .param p1, "g"    # Lcom/keepassdroid/database/PwGroup;

    .prologue
    .line 126
    move-object v1, p1

    check-cast v1, Lcom/keepassdroid/database/PwGroupV4;

    .line 127
    .local v1, "group":Lcom/keepassdroid/database/PwGroupV4;
    sget-boolean v2, Lcom/keepassdroid/database/save/PwDbV4Output$GroupWriter;->$assertionsDisabled:Z

    if-nez v2, :cond_1

    if-nez v1, :cond_1

    new-instance v2, Ljava/lang/AssertionError;

    invoke-direct {v2}, Ljava/lang/AssertionError;-><init>()V

    throw v2

    .line 138
    :cond_0
    :try_start_0
    iget-object v2, p0, Lcom/keepassdroid/database/save/PwDbV4Output$GroupWriter;->this$0:Lcom/keepassdroid/database/save/PwDbV4Output;

    # invokes: Lcom/keepassdroid/database/save/PwDbV4Output;->endGroup()V
    invoke-static {v2}, Lcom/keepassdroid/database/save/PwDbV4Output;->access$100(Lcom/keepassdroid/database/save/PwDbV4Output;)V

    .line 131
    :cond_1
    iget-object v2, v1, Lcom/keepassdroid/database/PwGroupV4;->parent:Lcom/keepassdroid/database/PwGroupV4;

    iget-object v3, p0, Lcom/keepassdroid/database/save/PwDbV4Output$GroupWriter;->groupStack:Ljava/util/Stack;

    invoke-virtual {v3}, Ljava/util/Stack;->peek()Ljava/lang/Object;

    move-result-object v3

    if-ne v2, v3, :cond_2

    .line 132
    iget-object v2, p0, Lcom/keepassdroid/database/save/PwDbV4Output$GroupWriter;->groupStack:Ljava/util/Stack;

    invoke-virtual {v2, v1}, Ljava/util/Stack;->push(Ljava/lang/Object;)Ljava/lang/Object;

    .line 133
    iget-object v2, p0, Lcom/keepassdroid/database/save/PwDbV4Output$GroupWriter;->this$0:Lcom/keepassdroid/database/save/PwDbV4Output;

    # invokes: Lcom/keepassdroid/database/save/PwDbV4Output;->startGroup(Lcom/keepassdroid/database/PwGroupV4;)V
    invoke-static {v2, v1}, Lcom/keepassdroid/database/save/PwDbV4Output;->access$000(Lcom/keepassdroid/database/save/PwDbV4Output;Lcom/keepassdroid/database/PwGroupV4;)V

    .line 145
    const/4 v2, 0x1

    :goto_0
    return v2

    .line 136
    :cond_2
    iget-object v2, p0, Lcom/keepassdroid/database/save/PwDbV4Output$GroupWriter;->groupStack:Ljava/util/Stack;

    invoke-virtual {v2}, Ljava/util/Stack;->pop()Ljava/lang/Object;

    .line 137
    iget-object v2, p0, Lcom/keepassdroid/database/save/PwDbV4Output$GroupWriter;->groupStack:Ljava/util/Stack;

    invoke-virtual {v2}, Ljava/util/Stack;->size()I
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v2

    if-gtz v2, :cond_0

    const/4 v2, 0x0

    goto :goto_0

    .line 140
    :catch_0
    move-exception v0

    .line 141
    .local v0, "e":Ljava/io/IOException;
    new-instance v2, Ljava/lang/RuntimeException;

    invoke-direct {v2, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v2
.end method

.method public bridge synthetic operate(Ljava/lang/Object;)Z
    .locals 1

    .prologue
    .line 117
    check-cast p1, Lcom/keepassdroid/database/PwGroup;

    invoke-virtual {p0, p1}, Lcom/keepassdroid/database/save/PwDbV4Output$GroupWriter;->operate(Lcom/keepassdroid/database/PwGroup;)Z

    move-result v0

    return v0
.end method
