.class public Lcom/keepassdroid/utils/Util;
.super Ljava/lang/Object;
.source "Util.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static copyStream(Ljava/io/InputStream;Ljava/io/OutputStream;)V
    .locals 3
    .param p0, "in"    # Ljava/io/InputStream;
    .param p1, "out"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 87
    const/16 v2, 0x400

    new-array v0, v2, [B

    .line 89
    .local v0, "buf":[B
    :goto_0
    invoke-virtual {p0, v0}, Ljava/io/InputStream;->read([B)I

    move-result v1

    .local v1, "read":I
    const/4 v2, -0x1

    if-eq v1, v2, :cond_0

    .line 90
    const/4 v2, 0x0

    invoke-virtual {p1, v0, v2, v1}, Ljava/io/OutputStream;->write([BII)V

    goto :goto_0

    .line 92
    :cond_0
    return-void
.end method

.method public static copyToClipboard(Landroid/content/Context;Ljava/lang/String;)V
    .locals 3
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "text"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/keepassdroid/database/exception/SamsungClipboardException;
        }
    .end annotation

    .prologue
    .line 48
    const-string v2, "clipboard"

    invoke-virtual {p0, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/text/ClipboardManager;

    .line 51
    .local v0, "clipboard":Landroid/text/ClipboardManager;
    :try_start_0
    invoke-virtual {v0, p1}, Landroid/text/ClipboardManager;->setText(Ljava/lang/CharSequence;)V
    :try_end_0
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_0

    .line 55
    return-void

    .line 52
    :catch_0
    move-exception v1

    .line 53
    .local v1, "e":Ljava/lang/NullPointerException;
    new-instance v2, Lcom/keepassdroid/database/exception/SamsungClipboardException;

    invoke-direct {v2, v1}, Lcom/keepassdroid/database/exception/SamsungClipboardException;-><init>(Ljava/lang/Exception;)V

    throw v2
.end method

.method public static getClipboard(Landroid/content/Context;)Ljava/lang/String;
    .locals 3
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 38
    const-string v2, "clipboard"

    invoke-virtual {p0, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/text/ClipboardManager;

    .line 39
    .local v0, "clipboard":Landroid/text/ClipboardManager;
    invoke-virtual {v0}, Landroid/text/ClipboardManager;->getText()Ljava/lang/CharSequence;

    move-result-object v1

    .line 40
    .local v1, "csText":Ljava/lang/CharSequence;
    if-nez v1, :cond_0

    .line 41
    const-string v2, ""

    .line 44
    :goto_0
    return-object v2

    :cond_0
    invoke-interface {v1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v2

    goto :goto_0
.end method

.method public static getEditText(Landroid/app/Activity;I)Ljava/lang/String;
    .locals 2
    .param p0, "act"    # Landroid/app/Activity;
    .param p1, "resId"    # I

    .prologue
    .line 69
    invoke-virtual {p0, p1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    .line 71
    .local v0, "te":Landroid/widget/TextView;
    if-eqz v0, :cond_0

    .line 72
    invoke-virtual {v0}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v1

    invoke-interface {v1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v1

    .line 74
    :goto_0
    return-object v1

    :cond_0
    const-string v1, ""

    goto :goto_0
.end method

.method public static gotoUrl(Landroid/content/Context;I)V
    .locals 1
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "resId"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/content/ActivityNotFoundException;
        }
    .end annotation

    .prologue
    .line 65
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v0}, Lcom/keepassdroid/utils/Util;->gotoUrl(Landroid/content/Context;Ljava/lang/String;)V

    .line 66
    return-void
.end method

.method public static gotoUrl(Landroid/content/Context;Ljava/lang/String;)V
    .locals 3
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "url"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/content/ActivityNotFoundException;
        }
    .end annotation

    .prologue
    .line 58
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_0

    .line 59
    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    .line 60
    .local v0, "uri":Landroid/net/Uri;
    new-instance v1, Landroid/content/Intent;

    const-string v2, "android.intent.action.VIEW"

    invoke-direct {v1, v2, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    invoke-virtual {p0, v1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 62
    .end local v0    # "uri":Landroid/net/Uri;
    :cond_0
    return-void
.end method

.method public static setEditText(Landroid/app/Activity;ILjava/lang/String;)V
    .locals 1
    .param p0, "act"    # Landroid/app/Activity;
    .param p1, "resId"    # I
    .param p2, "str"    # Ljava/lang/String;

    .prologue
    .line 79
    invoke-virtual {p0, p1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    .line 81
    .local v0, "te":Landroid/widget/TextView;
    if-eqz v0, :cond_0

    .line 82
    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 84
    :cond_0
    return-void
.end method
