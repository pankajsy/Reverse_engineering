.class Lcom/keepassdroid/crypto/NativeAESCipherSpi$Cleanup;
.super Ljava/lang/Object;
.source "NativeAESCipherSpi.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/keepassdroid/crypto/NativeAESCipherSpi;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "Cleanup"
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 77
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/keepassdroid/crypto/NativeAESCipherSpi$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/keepassdroid/crypto/NativeAESCipherSpi$1;

    .prologue
    .line 77
    invoke-direct {p0}, Lcom/keepassdroid/crypto/NativeAESCipherSpi$Cleanup;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    .prologue
    .line 82
    :goto_0
    :try_start_0
    # getter for: Lcom/keepassdroid/crypto/NativeAESCipherSpi;->mQueue:Ljava/lang/ref/ReferenceQueue;
    invoke-static {}, Lcom/keepassdroid/crypto/NativeAESCipherSpi;->access$100()Ljava/lang/ref/ReferenceQueue;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/ref/ReferenceQueue;->remove()Ljava/lang/ref/Reference;

    move-result-object v2

    .line 84
    .local v2, "ref":Ljava/lang/ref/Reference;, "Ljava/lang/ref/Reference<+Lcom/keepassdroid/crypto/NativeAESCipherSpi;>;"
    # getter for: Lcom/keepassdroid/crypto/NativeAESCipherSpi;->mCleanup:Ljava/util/HashMap;
    invoke-static {}, Lcom/keepassdroid/crypto/NativeAESCipherSpi;->access$200()Ljava/util/HashMap;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Long;

    invoke-virtual {v3}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    .line 85
    .local v0, "ctx":J
    # invokes: Lcom/keepassdroid/crypto/NativeAESCipherSpi;->nCleanup(J)V
    invoke-static {v0, v1}, Lcom/keepassdroid/crypto/NativeAESCipherSpi;->access$300(J)V

    .line 86
    const-string v3, "KeePassDroid"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Cleaned up cipher context: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 88
    .end local v0    # "ctx":J
    .end local v2    # "ref":Ljava/lang/ref/Reference;, "Ljava/lang/ref/Reference<+Lcom/keepassdroid/crypto/NativeAESCipherSpi;>;"
    :catch_0
    move-exception v3

    goto :goto_0
.end method
