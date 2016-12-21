.class public Lcom/keepassdroid/database/load/ImporterFactory;
.super Ljava/lang/Object;
.source "ImporterFactory.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static createImporter(Ljava/io/InputStream;)Lcom/keepassdroid/database/load/Importer;
    .locals 1
    .param p0, "is"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/keepassdroid/database/exception/InvalidDBSignatureException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 33
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lcom/keepassdroid/database/load/ImporterFactory;->createImporter(Ljava/io/InputStream;Z)Lcom/keepassdroid/database/load/Importer;

    move-result-object v0

    return-object v0
.end method

.method public static createImporter(Ljava/io/InputStream;Z)Lcom/keepassdroid/database/load/Importer;
    .locals 3
    .param p0, "is"    # Ljava/io/InputStream;
    .param p1, "debug"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/keepassdroid/database/exception/InvalidDBSignatureException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 38
    invoke-static {p0}, Lcom/keepassdroid/stream/LEDataInputStream;->readInt(Ljava/io/InputStream;)I

    move-result v0

    .line 39
    .local v0, "sig1":I
    invoke-static {p0}, Lcom/keepassdroid/stream/LEDataInputStream;->readInt(Ljava/io/InputStream;)I

    move-result v1

    .line 41
    .local v1, "sig2":I
    invoke-static {v0, v1}, Lcom/keepassdroid/database/PwDbHeaderV3;->matchesHeader(II)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 42
    if-eqz p1, :cond_0

    .line 43
    new-instance v2, Lcom/keepassdroid/database/load/ImporterV3Debug;

    invoke-direct {v2}, Lcom/keepassdroid/database/load/ImporterV3Debug;-><init>()V

    .line 48
    :goto_0
    return-object v2

    .line 46
    :cond_0
    new-instance v2, Lcom/keepassdroid/database/load/ImporterV3;

    invoke-direct {v2}, Lcom/keepassdroid/database/load/ImporterV3;-><init>()V

    goto :goto_0

    .line 47
    :cond_1
    invoke-static {v0, v1}, Lcom/keepassdroid/database/PwDbHeaderV4;->matchesHeader(II)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 48
    new-instance v2, Lcom/keepassdroid/database/load/ImporterV4;

    invoke-direct {v2}, Lcom/keepassdroid/database/load/ImporterV4;-><init>()V

    goto :goto_0

    .line 51
    :cond_2
    new-instance v2, Lcom/keepassdroid/database/exception/InvalidDBSignatureException;

    invoke-direct {v2}, Lcom/keepassdroid/database/exception/InvalidDBSignatureException;-><init>()V

    throw v2
.end method
