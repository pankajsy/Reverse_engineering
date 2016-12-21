.class public Lcom/keepassdroid/database/load/ImporterV4Debug;
.super Lcom/keepassdroid/database/load/ImporterV4;
.source "ImporterV4Debug.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 29
    invoke-direct {p0}, Lcom/keepassdroid/database/load/ImporterV4;-><init>()V

    return-void
.end method


# virtual methods
.method protected bridge synthetic createDB()Lcom/keepassdroid/database/PwDatabaseV4;
    .locals 1

    .prologue
    .line 29
    invoke-virtual {p0}, Lcom/keepassdroid/database/load/ImporterV4Debug;->createDB()Lcom/keepassdroid/database/PwDatabaseV4Debug;

    move-result-object v0

    return-object v0
.end method

.method protected createDB()Lcom/keepassdroid/database/PwDatabaseV4Debug;
    .locals 1

    .prologue
    .line 33
    new-instance v0, Lcom/keepassdroid/database/PwDatabaseV4Debug;

    invoke-direct {v0}, Lcom/keepassdroid/database/PwDatabaseV4Debug;-><init>()V

    return-object v0
.end method

.method public bridge synthetic openDatabase(Ljava/io/InputStream;Ljava/lang/String;Ljava/io/InputStream;Lcom/keepassdroid/UpdateStatus;)Lcom/keepassdroid/database/PwDatabase;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/keepassdroid/database/exception/InvalidDBException;
        }
    .end annotation

    .prologue
    .line 29
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/keepassdroid/database/load/ImporterV4Debug;->openDatabase(Ljava/io/InputStream;Ljava/lang/String;Ljava/io/InputStream;Lcom/keepassdroid/UpdateStatus;)Lcom/keepassdroid/database/PwDatabaseV4Debug;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic openDatabase(Ljava/io/InputStream;Ljava/lang/String;Ljava/io/InputStream;Lcom/keepassdroid/UpdateStatus;)Lcom/keepassdroid/database/PwDatabaseV4;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/keepassdroid/database/exception/InvalidDBException;
        }
    .end annotation

    .prologue
    .line 29
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/keepassdroid/database/load/ImporterV4Debug;->openDatabase(Ljava/io/InputStream;Ljava/lang/String;Ljava/io/InputStream;Lcom/keepassdroid/UpdateStatus;)Lcom/keepassdroid/database/PwDatabaseV4Debug;

    move-result-object v0

    return-object v0
.end method

.method public openDatabase(Ljava/io/InputStream;Ljava/lang/String;Ljava/io/InputStream;Lcom/keepassdroid/UpdateStatus;)Lcom/keepassdroid/database/PwDatabaseV4Debug;
    .locals 1
    .param p1, "inStream"    # Ljava/io/InputStream;
    .param p2, "password"    # Ljava/lang/String;
    .param p3, "keyInputFile"    # Ljava/io/InputStream;
    .param p4, "status"    # Lcom/keepassdroid/UpdateStatus;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/keepassdroid/database/exception/InvalidDBException;
        }
    .end annotation

    .prologue
    .line 40
    invoke-super {p0, p1, p2, p3, p4}, Lcom/keepassdroid/database/load/ImporterV4;->openDatabase(Ljava/io/InputStream;Ljava/lang/String;Ljava/io/InputStream;Lcom/keepassdroid/UpdateStatus;)Lcom/keepassdroid/database/PwDatabaseV4;

    move-result-object v0

    check-cast v0, Lcom/keepassdroid/database/PwDatabaseV4Debug;

    return-object v0
.end method
