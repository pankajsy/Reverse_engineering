.class public Lcom/keepassdroid/database/save/PwDbHeaderOutputV3;
.super Ljava/lang/Object;
.source "PwDbHeaderOutputV3.java"


# instance fields
.field private mHeader:Lcom/keepassdroid/database/PwDbHeaderV3;

.field private mOS:Ljava/io/OutputStream;


# direct methods
.method public constructor <init>(Lcom/keepassdroid/database/PwDbHeaderV3;Ljava/io/OutputStream;)V
    .locals 0
    .param p1, "header"    # Lcom/keepassdroid/database/PwDbHeaderV3;
    .param p2, "os"    # Ljava/io/OutputStream;

    .prologue
    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 34
    iput-object p1, p0, Lcom/keepassdroid/database/save/PwDbHeaderOutputV3;->mHeader:Lcom/keepassdroid/database/PwDbHeaderV3;

    .line 35
    iput-object p2, p0, Lcom/keepassdroid/database/save/PwDbHeaderOutputV3;->mOS:Ljava/io/OutputStream;

    .line 36
    return-void
.end method


# virtual methods
.method public close()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 65
    iget-object v0, p0, Lcom/keepassdroid/database/save/PwDbHeaderOutputV3;->mOS:Ljava/io/OutputStream;

    invoke-virtual {v0}, Ljava/io/OutputStream;->close()V

    .line 66
    return-void
.end method

.method public output()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 59
    invoke-virtual {p0}, Lcom/keepassdroid/database/save/PwDbHeaderOutputV3;->outputStart()V

    .line 60
    invoke-virtual {p0}, Lcom/keepassdroid/database/save/PwDbHeaderOutputV3;->outputContentHash()V

    .line 61
    invoke-virtual {p0}, Lcom/keepassdroid/database/save/PwDbHeaderOutputV3;->outputEnd()V

    .line 62
    return-void
.end method

.method public outputContentHash()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 50
    iget-object v0, p0, Lcom/keepassdroid/database/save/PwDbHeaderOutputV3;->mOS:Ljava/io/OutputStream;

    iget-object v1, p0, Lcom/keepassdroid/database/save/PwDbHeaderOutputV3;->mHeader:Lcom/keepassdroid/database/PwDbHeaderV3;

    iget-object v1, v1, Lcom/keepassdroid/database/PwDbHeaderV3;->contentsHash:[B

    invoke-virtual {v0, v1}, Ljava/io/OutputStream;->write([B)V

    .line 51
    return-void
.end method

.method public outputEnd()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 54
    iget-object v0, p0, Lcom/keepassdroid/database/save/PwDbHeaderOutputV3;->mOS:Ljava/io/OutputStream;

    iget-object v1, p0, Lcom/keepassdroid/database/save/PwDbHeaderOutputV3;->mHeader:Lcom/keepassdroid/database/PwDbHeaderV3;

    iget-object v1, v1, Lcom/keepassdroid/database/PwDbHeaderV3;->transformSeed:[B

    invoke-virtual {v0, v1}, Ljava/io/OutputStream;->write([B)V

    .line 55
    iget-object v0, p0, Lcom/keepassdroid/database/save/PwDbHeaderOutputV3;->mOS:Ljava/io/OutputStream;

    iget-object v1, p0, Lcom/keepassdroid/database/save/PwDbHeaderOutputV3;->mHeader:Lcom/keepassdroid/database/PwDbHeaderV3;

    iget v1, v1, Lcom/keepassdroid/database/PwDbHeaderV3;->numKeyEncRounds:I

    invoke-static {v1}, Lcom/keepassdroid/stream/LEDataOutputStream;->writeIntBuf(I)[B

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/OutputStream;->write([B)V

    .line 56
    return-void
.end method

.method public outputStart()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 39
    iget-object v0, p0, Lcom/keepassdroid/database/save/PwDbHeaderOutputV3;->mOS:Ljava/io/OutputStream;

    iget-object v1, p0, Lcom/keepassdroid/database/save/PwDbHeaderOutputV3;->mHeader:Lcom/keepassdroid/database/PwDbHeaderV3;

    iget v1, v1, Lcom/keepassdroid/database/PwDbHeaderV3;->signature1:I

    invoke-static {v1}, Lcom/keepassdroid/stream/LEDataOutputStream;->writeIntBuf(I)[B

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/OutputStream;->write([B)V

    .line 40
    iget-object v0, p0, Lcom/keepassdroid/database/save/PwDbHeaderOutputV3;->mOS:Ljava/io/OutputStream;

    iget-object v1, p0, Lcom/keepassdroid/database/save/PwDbHeaderOutputV3;->mHeader:Lcom/keepassdroid/database/PwDbHeaderV3;

    iget v1, v1, Lcom/keepassdroid/database/PwDbHeaderV3;->signature2:I

    invoke-static {v1}, Lcom/keepassdroid/stream/LEDataOutputStream;->writeIntBuf(I)[B

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/OutputStream;->write([B)V

    .line 41
    iget-object v0, p0, Lcom/keepassdroid/database/save/PwDbHeaderOutputV3;->mOS:Ljava/io/OutputStream;

    iget-object v1, p0, Lcom/keepassdroid/database/save/PwDbHeaderOutputV3;->mHeader:Lcom/keepassdroid/database/PwDbHeaderV3;

    iget v1, v1, Lcom/keepassdroid/database/PwDbHeaderV3;->flags:I

    invoke-static {v1}, Lcom/keepassdroid/stream/LEDataOutputStream;->writeIntBuf(I)[B

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/OutputStream;->write([B)V

    .line 42
    iget-object v0, p0, Lcom/keepassdroid/database/save/PwDbHeaderOutputV3;->mOS:Ljava/io/OutputStream;

    iget-object v1, p0, Lcom/keepassdroid/database/save/PwDbHeaderOutputV3;->mHeader:Lcom/keepassdroid/database/PwDbHeaderV3;

    iget v1, v1, Lcom/keepassdroid/database/PwDbHeaderV3;->version:I

    invoke-static {v1}, Lcom/keepassdroid/stream/LEDataOutputStream;->writeIntBuf(I)[B

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/OutputStream;->write([B)V

    .line 43
    iget-object v0, p0, Lcom/keepassdroid/database/save/PwDbHeaderOutputV3;->mOS:Ljava/io/OutputStream;

    iget-object v1, p0, Lcom/keepassdroid/database/save/PwDbHeaderOutputV3;->mHeader:Lcom/keepassdroid/database/PwDbHeaderV3;

    iget-object v1, v1, Lcom/keepassdroid/database/PwDbHeaderV3;->masterSeed:[B

    invoke-virtual {v0, v1}, Ljava/io/OutputStream;->write([B)V

    .line 44
    iget-object v0, p0, Lcom/keepassdroid/database/save/PwDbHeaderOutputV3;->mOS:Ljava/io/OutputStream;

    iget-object v1, p0, Lcom/keepassdroid/database/save/PwDbHeaderOutputV3;->mHeader:Lcom/keepassdroid/database/PwDbHeaderV3;

    iget-object v1, v1, Lcom/keepassdroid/database/PwDbHeaderV3;->encryptionIV:[B

    invoke-virtual {v0, v1}, Ljava/io/OutputStream;->write([B)V

    .line 45
    iget-object v0, p0, Lcom/keepassdroid/database/save/PwDbHeaderOutputV3;->mOS:Ljava/io/OutputStream;

    iget-object v1, p0, Lcom/keepassdroid/database/save/PwDbHeaderOutputV3;->mHeader:Lcom/keepassdroid/database/PwDbHeaderV3;

    iget v1, v1, Lcom/keepassdroid/database/PwDbHeaderV3;->numGroups:I

    invoke-static {v1}, Lcom/keepassdroid/stream/LEDataOutputStream;->writeIntBuf(I)[B

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/OutputStream;->write([B)V

    .line 46
    iget-object v0, p0, Lcom/keepassdroid/database/save/PwDbHeaderOutputV3;->mOS:Ljava/io/OutputStream;

    iget-object v1, p0, Lcom/keepassdroid/database/save/PwDbHeaderOutputV3;->mHeader:Lcom/keepassdroid/database/PwDbHeaderV3;

    iget v1, v1, Lcom/keepassdroid/database/PwDbHeaderV3;->numEntries:I

    invoke-static {v1}, Lcom/keepassdroid/stream/LEDataOutputStream;->writeIntBuf(I)[B

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/OutputStream;->write([B)V

    .line 47
    return-void
.end method
