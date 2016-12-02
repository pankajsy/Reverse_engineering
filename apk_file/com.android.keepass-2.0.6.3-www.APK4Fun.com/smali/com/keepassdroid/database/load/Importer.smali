.class public abstract Lcom/keepassdroid/database/load/Importer;
.super Ljava/lang/Object;
.source "Importer.java"


# static fields
.field public static final DEBUG:Z = true


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public abstract openDatabase(Ljava/io/InputStream;Ljava/lang/String;Ljava/io/InputStream;)Lcom/keepassdroid/database/PwDatabase;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/keepassdroid/database/exception/InvalidDBException;
        }
    .end annotation
.end method

.method public abstract openDatabase(Ljava/io/InputStream;Ljava/lang/String;Ljava/io/InputStream;Lcom/keepassdroid/UpdateStatus;)Lcom/keepassdroid/database/PwDatabase;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/keepassdroid/database/exception/InvalidDBException;
        }
    .end annotation
.end method
