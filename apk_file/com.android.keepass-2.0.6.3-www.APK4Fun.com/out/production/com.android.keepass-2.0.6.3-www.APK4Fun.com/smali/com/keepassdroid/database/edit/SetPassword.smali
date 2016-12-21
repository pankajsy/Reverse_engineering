.class public Lcom/keepassdroid/database/edit/SetPassword;
.super Lcom/keepassdroid/database/edit/RunnableOnFinish;
.source "SetPassword.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/keepassdroid/database/edit/SetPassword$AfterSave;
    }
.end annotation


# instance fields
.field private ctx:Landroid/content/Context;

.field private mDb:Lcom/keepassdroid/Database;

.field private mDontSave:Z

.field private mKeyfile:Landroid/net/Uri;

.field private mPassword:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/keepassdroid/Database;Ljava/lang/String;Landroid/net/Uri;Lcom/keepassdroid/database/edit/OnFinish;)V
    .locals 7
    .param p1, "ctx"    # Landroid/content/Context;
    .param p2, "db"    # Lcom/keepassdroid/Database;
    .param p3, "password"    # Ljava/lang/String;
    .param p4, "keyfile"    # Landroid/net/Uri;
    .param p5, "finish"    # Lcom/keepassdroid/database/edit/OnFinish;

    .prologue
    .line 44
    const/4 v6, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    move-object v5, p5

    invoke-direct/range {v0 .. v6}, Lcom/keepassdroid/database/edit/SetPassword;-><init>(Landroid/content/Context;Lcom/keepassdroid/Database;Ljava/lang/String;Landroid/net/Uri;Lcom/keepassdroid/database/edit/OnFinish;Z)V

    .line 46
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/keepassdroid/Database;Ljava/lang/String;Landroid/net/Uri;Lcom/keepassdroid/database/edit/OnFinish;Z)V
    .locals 0
    .param p1, "ctx"    # Landroid/content/Context;
    .param p2, "db"    # Lcom/keepassdroid/Database;
    .param p3, "password"    # Ljava/lang/String;
    .param p4, "keyfile"    # Landroid/net/Uri;
    .param p5, "finish"    # Lcom/keepassdroid/database/edit/OnFinish;
    .param p6, "dontSave"    # Z

    .prologue
    .line 49
    invoke-direct {p0, p5}, Lcom/keepassdroid/database/edit/RunnableOnFinish;-><init>(Lcom/keepassdroid/database/edit/OnFinish;)V

    .line 51
    iput-object p2, p0, Lcom/keepassdroid/database/edit/SetPassword;->mDb:Lcom/keepassdroid/Database;

    .line 52
    iput-object p3, p0, Lcom/keepassdroid/database/edit/SetPassword;->mPassword:Ljava/lang/String;

    .line 53
    iput-object p4, p0, Lcom/keepassdroid/database/edit/SetPassword;->mKeyfile:Landroid/net/Uri;

    .line 54
    iput-boolean p6, p0, Lcom/keepassdroid/database/edit/SetPassword;->mDontSave:Z

    .line 55
    iput-object p1, p0, Lcom/keepassdroid/database/edit/SetPassword;->ctx:Landroid/content/Context;

    .line 56
    return-void
.end method

.method static synthetic access$000(Lcom/keepassdroid/database/edit/SetPassword;)Lcom/keepassdroid/Database;
    .locals 1
    .param p0, "x0"    # Lcom/keepassdroid/database/edit/SetPassword;

    .prologue
    .line 35
    iget-object v0, p0, Lcom/keepassdroid/database/edit/SetPassword;->mDb:Lcom/keepassdroid/Database;

    return-object v0
.end method

.method static synthetic access$100(Lcom/keepassdroid/database/edit/SetPassword;[B)V
    .locals 0
    .param p0, "x0"    # Lcom/keepassdroid/database/edit/SetPassword;
    .param p1, "x1"    # [B

    .prologue
    .line 35
    invoke-direct {p0, p1}, Lcom/keepassdroid/database/edit/SetPassword;->erase([B)V

    return-void
.end method

.method private erase([B)V
    .locals 2
    .param p1, "array"    # [B

    .prologue
    .line 121
    if-nez p1, :cond_1

    .line 126
    :cond_0
    return-void

    .line 123
    :cond_1
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v1, p1

    if-ge v0, v1, :cond_0

    .line 124
    const/4 v1, 0x0

    aput-byte v1, p1, v0

    .line 123
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method


# virtual methods
.method public run()V
    .locals 9

    .prologue
    const/4 v7, 0x0

    .line 70
    iget-object v5, p0, Lcom/keepassdroid/database/edit/SetPassword;->mDb:Lcom/keepassdroid/Database;

    iget-object v3, v5, Lcom/keepassdroid/Database;->pm:Lcom/keepassdroid/database/PwDatabase;

    .line 72
    .local v3, "pm":Lcom/keepassdroid/database/PwDatabase;
    iget-object v5, v3, Lcom/keepassdroid/database/PwDatabase;->masterKey:[B

    array-length v5, v5

    new-array v0, v5, [B

    .line 73
    .local v0, "backupKey":[B
    iget-object v5, v3, Lcom/keepassdroid/database/PwDatabase;->masterKey:[B

    array-length v6, v0

    invoke-static {v5, v7, v0, v7, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 77
    :try_start_0
    iget-object v5, p0, Lcom/keepassdroid/database/edit/SetPassword;->ctx:Landroid/content/Context;

    iget-object v6, p0, Lcom/keepassdroid/database/edit/SetPassword;->mKeyfile:Landroid/net/Uri;

    invoke-static {v5, v6}, Lcom/keepassdroid/utils/UriUtil;->getUriInputStream(Landroid/content/Context;Landroid/net/Uri;)Ljava/io/InputStream;

    move-result-object v2

    .line 78
    .local v2, "is":Ljava/io/InputStream;
    iget-object v5, p0, Lcom/keepassdroid/database/edit/SetPassword;->mPassword:Ljava/lang/String;

    invoke-virtual {v3, v5, v2}, Lcom/keepassdroid/database/PwDatabase;->setMasterKey(Ljava/lang/String;Ljava/io/InputStream;)V
    :try_end_0
    .catch Lcom/keepassdroid/database/exception/InvalidKeyFileException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    .line 90
    new-instance v5, Lcom/keepassdroid/database/edit/SetPassword$AfterSave;

    iget-object v6, p0, Lcom/keepassdroid/database/edit/SetPassword;->mFinish:Lcom/keepassdroid/database/edit/OnFinish;

    invoke-direct {v5, p0, v0, v6}, Lcom/keepassdroid/database/edit/SetPassword$AfterSave;-><init>(Lcom/keepassdroid/database/edit/SetPassword;[BLcom/keepassdroid/database/edit/OnFinish;)V

    iput-object v5, p0, Lcom/keepassdroid/database/edit/SetPassword;->mFinish:Lcom/keepassdroid/database/edit/OnFinish;

    .line 91
    new-instance v4, Lcom/keepassdroid/database/edit/SaveDB;

    iget-object v5, p0, Lcom/keepassdroid/database/edit/SetPassword;->ctx:Landroid/content/Context;

    iget-object v6, p0, Lcom/keepassdroid/database/edit/SetPassword;->mDb:Lcom/keepassdroid/Database;

    iget-object v7, p0, Lcom/keepassdroid/database/edit/SetPassword;->mFinish:Lcom/keepassdroid/database/edit/OnFinish;

    iget-boolean v8, p0, Lcom/keepassdroid/database/edit/SetPassword;->mDontSave:Z

    invoke-direct {v4, v5, v6, v7, v8}, Lcom/keepassdroid/database/edit/SaveDB;-><init>(Landroid/content/Context;Lcom/keepassdroid/Database;Lcom/keepassdroid/database/edit/OnFinish;Z)V

    .line 92
    .local v4, "save":Lcom/keepassdroid/database/edit/SaveDB;
    invoke-virtual {v4}, Lcom/keepassdroid/database/edit/SaveDB;->run()V

    .line 93
    .end local v2    # "is":Ljava/io/InputStream;
    .end local v4    # "save":Lcom/keepassdroid/database/edit/SaveDB;
    :goto_0
    return-void

    .line 79
    :catch_0
    move-exception v1

    .line 80
    .local v1, "e":Lcom/keepassdroid/database/exception/InvalidKeyFileException;
    invoke-direct {p0, v0}, Lcom/keepassdroid/database/edit/SetPassword;->erase([B)V

    .line 81
    invoke-virtual {v1}, Lcom/keepassdroid/database/exception/InvalidKeyFileException;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p0, v7, v5}, Lcom/keepassdroid/database/edit/SetPassword;->finish(ZLjava/lang/String;)V

    goto :goto_0

    .line 83
    .end local v1    # "e":Lcom/keepassdroid/database/exception/InvalidKeyFileException;
    :catch_1
    move-exception v1

    .line 84
    .local v1, "e":Ljava/io/IOException;
    invoke-direct {p0, v0}, Lcom/keepassdroid/database/edit/SetPassword;->erase([B)V

    .line 85
    invoke-virtual {v1}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p0, v7, v5}, Lcom/keepassdroid/database/edit/SetPassword;->finish(ZLjava/lang/String;)V

    goto :goto_0
.end method

.method public validatePassword(Landroid/content/Context;Landroid/content/DialogInterface$OnClickListener;)Z
    .locals 4
    .param p1, "ctx"    # Landroid/content/Context;
    .param p2, "onclick"    # Landroid/content/DialogInterface$OnClickListener;

    .prologue
    const/4 v1, 0x1

    .line 59
    iget-object v2, p0, Lcom/keepassdroid/database/edit/SetPassword;->mDb:Lcom/keepassdroid/Database;

    iget-object v2, v2, Lcom/keepassdroid/Database;->pm:Lcom/keepassdroid/database/PwDatabase;

    iget-object v3, p0, Lcom/keepassdroid/database/edit/SetPassword;->mPassword:Ljava/lang/String;

    invoke-virtual {v2, v3}, Lcom/keepassdroid/database/PwDatabase;->validatePasswordEncoding(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 60
    new-instance v0, Lcom/keepassdroid/dialog/PasswordEncodingDialogHelper;

    invoke-direct {v0}, Lcom/keepassdroid/dialog/PasswordEncodingDialogHelper;-><init>()V

    .line 61
    .local v0, "dialog":Lcom/keepassdroid/dialog/PasswordEncodingDialogHelper;
    invoke-virtual {v0, p1, p2, v1}, Lcom/keepassdroid/dialog/PasswordEncodingDialogHelper;->show(Landroid/content/Context;Landroid/content/DialogInterface$OnClickListener;Z)V

    .line 62
    const/4 v1, 0x0

    .line 65
    .end local v0    # "dialog":Lcom/keepassdroid/dialog/PasswordEncodingDialogHelper;
    :cond_0
    return v1
.end method
