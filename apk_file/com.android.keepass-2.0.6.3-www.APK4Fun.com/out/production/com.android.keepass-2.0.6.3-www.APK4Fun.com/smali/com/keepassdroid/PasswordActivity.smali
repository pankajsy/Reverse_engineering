.class public Lcom/keepassdroid/PasswordActivity;
.super Lcom/keepassdroid/LockingActivity;
.source "PasswordActivity.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/keepassdroid/PasswordActivity$InitTask;,
        Lcom/keepassdroid/PasswordActivity$AfterLoad;,
        Lcom/keepassdroid/PasswordActivity$OkClickHandler;,
        Lcom/keepassdroid/PasswordActivity$DefaultCheckChange;
    }
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z

.field private static final FILE_BROWSE:I = 0x100

.field public static final GET_CONTENT:I = 0x101

.field public static final KEY_DEFAULT_FILENAME:Ljava/lang/String; = "defaultFileName"

.field private static final KEY_FILENAME:Ljava/lang/String; = "fileName"

.field private static final KEY_KEYFILE:Ljava/lang/String; = "keyFile"

.field private static final KEY_LAUNCH_IMMEDIATELY:Ljava/lang/String; = "launchImmediately"

.field private static final KEY_PASSWORD:Ljava/lang/String; = "password"

.field private static final OPEN_DOC:I = 0x102

.field private static final VIEW_INTENT:Ljava/lang/String; = "android.intent.action.VIEW"


# instance fields
.field private mDbUri:Landroid/net/Uri;

.field private mKeyUri:Landroid/net/Uri;

.field private mRememberKeyfile:Z

.field prefs:Landroid/content/SharedPreferences;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 71
    const-class v0, Lcom/keepassdroid/PasswordActivity;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    sput-boolean v0, Lcom/keepassdroid/PasswordActivity;->$assertionsDisabled:Z

    return-void

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 71
    invoke-direct {p0}, Lcom/keepassdroid/LockingActivity;-><init>()V

    .line 84
    iput-object v0, p0, Lcom/keepassdroid/PasswordActivity;->mDbUri:Landroid/net/Uri;

    .line 85
    iput-object v0, p0, Lcom/keepassdroid/PasswordActivity;->mKeyUri:Landroid/net/Uri;

    return-void
.end method

.method public static Launch(Landroid/app/Activity;Ljava/lang/String;)V
    .locals 1
    .param p0, "act"    # Landroid/app/Activity;
    .param p1, "fileName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/FileNotFoundException;
        }
    .end annotation

    .prologue
    .line 90
    const-string v0, ""

    invoke-static {p0, p1, v0}, Lcom/keepassdroid/PasswordActivity;->Launch(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V

    .line 91
    return-void
.end method

.method public static Launch(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V
    .locals 5
    .param p0, "act"    # Landroid/app/Activity;
    .param p1, "fileName"    # Ljava/lang/String;
    .param p2, "keyFile"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/FileNotFoundException;
        }
    .end annotation

    .prologue
    .line 94
    invoke-static {p1}, Lcom/keepassdroid/utils/EmptyUtils;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 95
    new-instance v4, Ljava/io/FileNotFoundException;

    invoke-direct {v4}, Ljava/io/FileNotFoundException;-><init>()V

    throw v4

    .line 98
    :cond_0
    invoke-static {p1}, Lcom/keepassdroid/utils/UriUtil;->parseDefaultFile(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v3

    .line 99
    .local v3, "uri":Landroid/net/Uri;
    invoke-virtual {v3}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v2

    .line 101
    .local v2, "scheme":Ljava/lang/String;
    invoke-static {v2}, Lcom/keepassdroid/utils/EmptyUtils;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_1

    const-string v4, "file"

    invoke-virtual {v2, v4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 102
    new-instance v0, Ljava/io/File;

    invoke-virtual {v3}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v0, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 103
    .local v0, "dbFile":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v4

    if-nez v4, :cond_1

    .line 104
    new-instance v4, Ljava/io/FileNotFoundException;

    invoke-direct {v4}, Ljava/io/FileNotFoundException;-><init>()V

    throw v4

    .line 108
    .end local v0    # "dbFile":Ljava/io/File;
    :cond_1
    new-instance v1, Landroid/content/Intent;

    const-class v4, Lcom/keepassdroid/PasswordActivity;

    invoke-direct {v1, p0, v4}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 109
    .local v1, "i":Landroid/content/Intent;
    const-string v4, "fileName"

    invoke-virtual {v1, v4, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 110
    const-string v4, "keyFile"

    invoke-virtual {v1, v4, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 112
    const/4 v4, 0x0

    invoke-virtual {p0, v1, v4}, Landroid/app/Activity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 114
    return-void
.end method

.method static synthetic access$100(Lcom/keepassdroid/PasswordActivity;)Landroid/net/Uri;
    .locals 1
    .param p0, "x0"    # Lcom/keepassdroid/PasswordActivity;

    .prologue
    .line 71
    iget-object v0, p0, Lcom/keepassdroid/PasswordActivity;->mDbUri:Landroid/net/Uri;

    return-object v0
.end method

.method static synthetic access$1000(Lcom/keepassdroid/PasswordActivity;Ljava/lang/String;Landroid/net/Uri;)V
    .locals 0
    .param p0, "x0"    # Lcom/keepassdroid/PasswordActivity;
    .param p1, "x1"    # Ljava/lang/String;
    .param p2, "x2"    # Landroid/net/Uri;

    .prologue
    .line 71
    invoke-direct {p0, p1, p2}, Lcom/keepassdroid/PasswordActivity;->loadDatabase(Ljava/lang/String;Landroid/net/Uri;)V

    return-void
.end method

.method static synthetic access$102(Lcom/keepassdroid/PasswordActivity;Landroid/net/Uri;)Landroid/net/Uri;
    .locals 0
    .param p0, "x0"    # Lcom/keepassdroid/PasswordActivity;
    .param p1, "x1"    # Landroid/net/Uri;

    .prologue
    .line 71
    iput-object p1, p0, Lcom/keepassdroid/PasswordActivity;->mDbUri:Landroid/net/Uri;

    return-object p1
.end method

.method static synthetic access$200(Lcom/keepassdroid/PasswordActivity;I)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/keepassdroid/PasswordActivity;
    .param p1, "x1"    # I

    .prologue
    .line 71
    invoke-direct {p0, p1}, Lcom/keepassdroid/PasswordActivity;->getEditText(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$300(Lcom/keepassdroid/PasswordActivity;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Lcom/keepassdroid/PasswordActivity;
    .param p1, "x1"    # Ljava/lang/String;
    .param p2, "x2"    # Ljava/lang/String;

    .prologue
    .line 71
    invoke-direct {p0, p1, p2}, Lcom/keepassdroid/PasswordActivity;->loadDatabase(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$400(Lcom/keepassdroid/PasswordActivity;)Landroid/net/Uri;
    .locals 1
    .param p0, "x0"    # Lcom/keepassdroid/PasswordActivity;

    .prologue
    .line 71
    iget-object v0, p0, Lcom/keepassdroid/PasswordActivity;->mKeyUri:Landroid/net/Uri;

    return-object v0
.end method

.method static synthetic access$402(Lcom/keepassdroid/PasswordActivity;Landroid/net/Uri;)Landroid/net/Uri;
    .locals 0
    .param p0, "x0"    # Lcom/keepassdroid/PasswordActivity;
    .param p1, "x1"    # Landroid/net/Uri;

    .prologue
    .line 71
    iput-object p1, p0, Lcom/keepassdroid/PasswordActivity;->mKeyUri:Landroid/net/Uri;

    return-object p1
.end method

.method static synthetic access$500(Lcom/keepassdroid/PasswordActivity;Landroid/net/Uri;)Landroid/net/Uri;
    .locals 1
    .param p0, "x0"    # Lcom/keepassdroid/PasswordActivity;
    .param p1, "x1"    # Landroid/net/Uri;

    .prologue
    .line 71
    invoke-direct {p0, p1}, Lcom/keepassdroid/PasswordActivity;->getKeyFile(Landroid/net/Uri;)Landroid/net/Uri;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$600(Lcom/keepassdroid/PasswordActivity;)V
    .locals 0
    .param p0, "x0"    # Lcom/keepassdroid/PasswordActivity;

    .prologue
    .line 71
    invoke-direct {p0}, Lcom/keepassdroid/PasswordActivity;->populateView()V

    return-void
.end method

.method static synthetic access$900(Lcom/keepassdroid/PasswordActivity;)V
    .locals 0
    .param p0, "x0"    # Lcom/keepassdroid/PasswordActivity;

    .prologue
    .line 71
    invoke-direct {p0}, Lcom/keepassdroid/PasswordActivity;->retrieveSettings()V

    return-void
.end method

.method private errorMessage(I)V
    .locals 1
    .param p1, "resId"    # I

    .prologue
    .line 228
    const/4 v0, 0x1

    invoke-static {p0, p1, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 229
    return-void
.end method

.method private getEditText(I)Ljava/lang/String;
    .locals 1
    .param p1, "resId"    # I

    .prologue
    .line 290
    invoke-static {p0, p1}, Lcom/keepassdroid/utils/Util;->getEditText(Landroid/app/Activity;I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private getKeyFile(Landroid/net/Uri;)Landroid/net/Uri;
    .locals 1
    .param p1, "dbUri"    # Landroid/net/Uri;

    .prologue
    .line 203
    iget-boolean v0, p0, Lcom/keepassdroid/PasswordActivity;->mRememberKeyfile:Z

    if-eqz v0, :cond_0

    .line 205
    invoke-static {}, Lcom/keepassdroid/app/App;->getFileHistory()Lcom/keepassdroid/fileselect/RecentFileHistory;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/keepassdroid/fileselect/RecentFileHistory;->getFileByName(Landroid/net/Uri;)Landroid/net/Uri;

    move-result-object v0

    .line 207
    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private loadDatabase(Ljava/lang/String;Landroid/net/Uri;)V
    .locals 9
    .param p1, "pass"    # Ljava/lang/String;
    .param p2, "keyfile"    # Landroid/net/Uri;

    .prologue
    .line 271
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    if-nez v2, :cond_1

    if-eqz p2, :cond_0

    invoke-virtual {p2}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    if-nez v2, :cond_1

    .line 272
    :cond_0
    const v2, 0x7f060040

    invoke-direct {p0, v2}, Lcom/keepassdroid/PasswordActivity;->errorMessage(I)V

    .line 287
    :goto_0
    return-void

    .line 277
    :cond_1
    invoke-static {}, Lcom/keepassdroid/app/App;->getDB()Lcom/keepassdroid/Database;

    move-result-object v1

    .line 278
    .local v1, "db":Lcom/keepassdroid/Database;
    invoke-virtual {v1}, Lcom/keepassdroid/Database;->clear()V

    .line 281
    invoke-static {}, Lcom/keepassdroid/app/App;->clearShutdown()V

    .line 283
    new-instance v7, Landroid/os/Handler;

    invoke-direct {v7}, Landroid/os/Handler;-><init>()V

    .line 284
    .local v7, "handler":Landroid/os/Handler;
    new-instance v0, Lcom/keepassdroid/database/edit/LoadDB;

    iget-object v3, p0, Lcom/keepassdroid/PasswordActivity;->mDbUri:Landroid/net/Uri;

    new-instance v6, Lcom/keepassdroid/PasswordActivity$AfterLoad;

    invoke-direct {v6, p0, v7, v1}, Lcom/keepassdroid/PasswordActivity$AfterLoad;-><init>(Lcom/keepassdroid/PasswordActivity;Landroid/os/Handler;Lcom/keepassdroid/Database;)V

    move-object v2, p0

    move-object v4, p1

    move-object v5, p2

    invoke-direct/range {v0 .. v6}, Lcom/keepassdroid/database/edit/LoadDB;-><init>(Lcom/keepassdroid/Database;Landroid/content/Context;Landroid/net/Uri;Ljava/lang/String;Landroid/net/Uri;Lcom/keepassdroid/database/edit/OnFinish;)V

    .line 285
    .local v0, "task":Lcom/keepassdroid/database/edit/LoadDB;
    new-instance v8, Lcom/keepassdroid/ProgressTask;

    const v2, 0x7f06005c

    invoke-direct {v8, p0, v0, v2}, Lcom/keepassdroid/ProgressTask;-><init>(Landroid/content/Context;Lcom/keepassdroid/database/edit/RunnableOnFinish;I)V

    .line 286
    .local v8, "pt":Lcom/keepassdroid/ProgressTask;
    invoke-virtual {v8}, Lcom/keepassdroid/ProgressTask;->run()V

    goto :goto_0
.end method

.method private loadDatabase(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p1, "pass"    # Ljava/lang/String;
    .param p2, "keyfile"    # Ljava/lang/String;

    .prologue
    .line 266
    invoke-static {p2}, Lcom/keepassdroid/utils/UriUtil;->parseDefaultFile(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    invoke-direct {p0, p1, v0}, Lcom/keepassdroid/PasswordActivity;->loadDatabase(Ljava/lang/String;Landroid/net/Uri;)V

    .line 267
    return-void
.end method

.method private populateView()V
    .locals 3

    .prologue
    .line 212
    iget-object v2, p0, Lcom/keepassdroid/PasswordActivity;->mDbUri:Landroid/net/Uri;

    if-nez v2, :cond_0

    const-string v0, ""

    .line 213
    .local v0, "db":Ljava/lang/String;
    :goto_0
    const v2, 0x7f0b006a

    invoke-direct {p0, v2, v0}, Lcom/keepassdroid/PasswordActivity;->setEditText(ILjava/lang/String;)V

    .line 215
    iget-object v2, p0, Lcom/keepassdroid/PasswordActivity;->mKeyUri:Landroid/net/Uri;

    if-nez v2, :cond_1

    const-string v1, ""

    .line 216
    .local v1, "key":Ljava/lang/String;
    :goto_1
    const v2, 0x7f0b006d

    invoke-direct {p0, v2, v1}, Lcom/keepassdroid/PasswordActivity;->setEditText(ILjava/lang/String;)V

    .line 217
    return-void

    .line 212
    .end local v0    # "db":Ljava/lang/String;
    .end local v1    # "key":Ljava/lang/String;
    :cond_0
    iget-object v2, p0, Lcom/keepassdroid/PasswordActivity;->mDbUri:Landroid/net/Uri;

    invoke-virtual {v2}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 215
    .restart local v0    # "db":Ljava/lang/String;
    :cond_1
    iget-object v2, p0, Lcom/keepassdroid/PasswordActivity;->mKeyUri:Landroid/net/Uri;

    invoke-virtual {v2}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_1
.end method

.method private retrieveSettings()V
    .locals 5

    .prologue
    .line 195
    iget-object v2, p0, Lcom/keepassdroid/PasswordActivity;->prefs:Landroid/content/SharedPreferences;

    const-string v3, "defaultFileName"

    const-string v4, ""

    invoke-interface {v2, v3, v4}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 196
    .local v1, "defaultFilename":Ljava/lang/String;
    iget-object v2, p0, Lcom/keepassdroid/PasswordActivity;->mDbUri:Landroid/net/Uri;

    invoke-virtual {v2}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/keepassdroid/utils/EmptyUtils;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_0

    iget-object v2, p0, Lcom/keepassdroid/PasswordActivity;->mDbUri:Landroid/net/Uri;

    invoke-static {v2, v1}, Lcom/keepassdroid/utils/UriUtil;->equalsDefaultfile(Landroid/net/Uri;Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 197
    const v2, 0x7f0b006b

    invoke-virtual {p0, v2}, Lcom/keepassdroid/PasswordActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/CheckBox;

    .line 198
    .local v0, "checkbox":Landroid/widget/CheckBox;
    const/4 v2, 0x1

    invoke-virtual {v0, v2}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 200
    .end local v0    # "checkbox":Landroid/widget/CheckBox;
    :cond_0
    return-void
.end method

.method private setEditText(ILjava/lang/String;)V
    .locals 2
    .param p1, "resId"    # I
    .param p2, "str"    # Ljava/lang/String;

    .prologue
    .line 294
    invoke-virtual {p0, p1}, Lcom/keepassdroid/PasswordActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    .line 295
    .local v0, "te":Landroid/widget/TextView;
    sget-boolean v1, Lcom/keepassdroid/PasswordActivity;->$assertionsDisabled:Z

    if-nez v1, :cond_0

    if-eqz v0, :cond_0

    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1}, Ljava/lang/AssertionError;-><init>()V

    throw v1

    .line 297
    :cond_0
    if-eqz v0, :cond_1

    .line 298
    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 300
    :cond_1
    return-void
.end method


# virtual methods
.method protected onActivityResult(IILandroid/content/Intent;)V
    .locals 7
    .param p1, "requestCode"    # I
    .param p2, "resultCode"    # I
    .param p3, "data"    # Landroid/content/Intent;

    .prologue
    const v6, 0x7f0b006d

    const v5, 0x7f0b004c

    const/4 v4, -0x1

    .line 118
    invoke-super {p0, p1, p2, p3}, Lcom/keepassdroid/LockingActivity;->onActivityResult(IILandroid/content/Intent;)V

    .line 120
    sparse-switch p1, :sswitch_data_0

    .line 164
    :cond_0
    :goto_0
    return-void

    .line 123
    :sswitch_0
    const-string v4, ""

    invoke-direct {p0, v5, v4}, Lcom/keepassdroid/PasswordActivity;->setEditText(ILjava/lang/String;)V

    .line 124
    invoke-static {}, Lcom/keepassdroid/app/App;->getDB()Lcom/keepassdroid/Database;

    move-result-object v4

    invoke-virtual {v4}, Lcom/keepassdroid/Database;->clear()V

    goto :goto_0

    .line 128
    :sswitch_1
    const/4 v4, 0x1

    invoke-virtual {p0, v4}, Lcom/keepassdroid/PasswordActivity;->setResult(I)V

    .line 129
    const-string v4, ""

    invoke-direct {p0, v5, v4}, Lcom/keepassdroid/PasswordActivity;->setEditText(ILjava/lang/String;)V

    .line 130
    invoke-virtual {p0}, Lcom/keepassdroid/PasswordActivity;->finish()V

    .line 131
    invoke-static {}, Lcom/keepassdroid/app/App;->getDB()Lcom/keepassdroid/Database;

    move-result-object v4

    invoke-virtual {v4}, Lcom/keepassdroid/Database;->clear()V

    goto :goto_0

    .line 134
    :sswitch_2
    if-ne p2, v4, :cond_0

    .line 135
    invoke-virtual {p3}, Landroid/content/Intent;->getDataString()Ljava/lang/String;

    move-result-object v0

    .line 136
    .local v0, "filename":Ljava/lang/String;
    if-eqz v0, :cond_0

    .line 137
    invoke-virtual {p0, v6}, Lcom/keepassdroid/PasswordActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/EditText;

    .line 138
    .local v1, "fn":Landroid/widget/EditText;
    invoke-virtual {v1, v0}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 139
    invoke-static {v0}, Lcom/keepassdroid/utils/UriUtil;->parseDefaultFile(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v4

    iput-object v4, p0, Lcom/keepassdroid/PasswordActivity;->mKeyUri:Landroid/net/Uri;

    goto :goto_0

    .line 145
    .end local v0    # "filename":Ljava/lang/String;
    .end local v1    # "fn":Landroid/widget/EditText;
    :sswitch_3
    if-ne p2, v4, :cond_0

    .line 146
    if-eqz p3, :cond_0

    .line 147
    invoke-virtual {p3}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v3

    .line 148
    .local v3, "uri":Landroid/net/Uri;
    if-eqz v3, :cond_0

    .line 149
    const/16 v4, 0x101

    if-ne p1, v4, :cond_1

    .line 150
    invoke-static {p0, v3}, Lcom/keepassdroid/utils/UriUtil;->translate(Landroid/content/Context;Landroid/net/Uri;)Landroid/net/Uri;

    move-result-object v3

    .line 152
    :cond_1
    invoke-virtual {v3}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v2

    .line 153
    .local v2, "path":Ljava/lang/String;
    if-eqz v2, :cond_2

    .line 154
    invoke-virtual {p0, v6}, Lcom/keepassdroid/PasswordActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/EditText;

    .line 155
    .restart local v1    # "fn":Landroid/widget/EditText;
    invoke-virtual {v1, v2}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 158
    .end local v1    # "fn":Landroid/widget/EditText;
    :cond_2
    iput-object v3, p0, Lcom/keepassdroid/PasswordActivity;->mKeyUri:Landroid/net/Uri;

    goto :goto_0

    .line 120
    nop

    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_0
        0x1 -> :sswitch_1
        0x100 -> :sswitch_2
        0x101 -> :sswitch_3
        0x102 -> :sswitch_3
    .end sparse-switch
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 5
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 168
    invoke-super {p0, p1}, Lcom/keepassdroid/LockingActivity;->onCreate(Landroid/os/Bundle;)V

    .line 170
    invoke-virtual {p0}, Lcom/keepassdroid/PasswordActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    .line 172
    .local v0, "i":Landroid/content/Intent;
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v1

    iput-object v1, p0, Lcom/keepassdroid/PasswordActivity;->prefs:Landroid/content/SharedPreferences;

    .line 173
    iget-object v1, p0, Lcom/keepassdroid/PasswordActivity;->prefs:Landroid/content/SharedPreferences;

    const v2, 0x7f0600be

    invoke-virtual {p0, v2}, Lcom/keepassdroid/PasswordActivity;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0}, Lcom/keepassdroid/PasswordActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const/high16 v4, 0x7f080000

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v3

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    iput-boolean v1, p0, Lcom/keepassdroid/PasswordActivity;->mRememberKeyfile:Z

    .line 174
    const v1, 0x7f030016

    invoke-virtual {p0, v1}, Lcom/keepassdroid/PasswordActivity;->setContentView(I)V

    .line 176
    new-instance v1, Lcom/keepassdroid/PasswordActivity$InitTask;

    const/4 v2, 0x0

    invoke-direct {v1, p0, v2}, Lcom/keepassdroid/PasswordActivity$InitTask;-><init>(Lcom/keepassdroid/PasswordActivity;Lcom/keepassdroid/PasswordActivity$1;)V

    const/4 v2, 0x1

    new-array v2, v2, [Landroid/content/Intent;

    const/4 v3, 0x0

    aput-object v0, v2, v3

    invoke-virtual {v1, v2}, Lcom/keepassdroid/PasswordActivity$InitTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 177
    return-void
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;)Z
    .locals 2
    .param p1, "menu"    # Landroid/view/Menu;

    .prologue
    .line 304
    invoke-super {p0, p1}, Lcom/keepassdroid/LockingActivity;->onCreateOptionsMenu(Landroid/view/Menu;)Z

    .line 306
    invoke-virtual {p0}, Lcom/keepassdroid/PasswordActivity;->getMenuInflater()Landroid/view/MenuInflater;

    move-result-object v0

    .line 307
    .local v0, "inflate":Landroid/view/MenuInflater;
    const v1, 0x7f0a0004

    invoke-virtual {v0, v1, p1}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    .line 309
    const/4 v1, 0x1

    return v1
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 3
    .param p1, "item"    # Landroid/view/MenuItem;

    .prologue
    const/4 v1, 0x1

    .line 314
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v2

    packed-switch v2, :pswitch_data_0

    .line 325
    invoke-super {p0, p1}, Lcom/keepassdroid/LockingActivity;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result v1

    :goto_0
    return v1

    .line 316
    :pswitch_0
    new-instance v0, Lcom/keepassdroid/AboutDialog;

    invoke-direct {v0, p0}, Lcom/keepassdroid/AboutDialog;-><init>(Landroid/content/Context;)V

    .line 317
    .local v0, "dialog":Lcom/keepassdroid/AboutDialog;
    invoke-virtual {v0}, Lcom/keepassdroid/AboutDialog;->show()V

    goto :goto_0

    .line 321
    .end local v0    # "dialog":Lcom/keepassdroid/AboutDialog;
    :pswitch_1
    invoke-static {p0}, Lcom/keepassdroid/settings/AppSettingsActivity;->Launch(Landroid/content/Context;)V

    goto :goto_0

    .line 314
    :pswitch_data_0
    .packed-switch 0x7f0b0078
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method protected onResume()V
    .locals 2

    .prologue
    .line 181
    invoke-super {p0}, Lcom/keepassdroid/LockingActivity;->onResume()V

    .line 185
    invoke-static {}, Lcom/keepassdroid/app/App;->isShutdown()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 186
    const v1, 0x7f0b004c

    invoke-virtual {p0, v1}, Lcom/keepassdroid/PasswordActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    .line 187
    .local v0, "password":Landroid/widget/TextView;
    const-string v1, ""

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 191
    .end local v0    # "password":Landroid/widget/TextView;
    :cond_0
    invoke-static {}, Lcom/keepassdroid/app/App;->clearShutdown()V

    .line 192
    return-void
.end method
