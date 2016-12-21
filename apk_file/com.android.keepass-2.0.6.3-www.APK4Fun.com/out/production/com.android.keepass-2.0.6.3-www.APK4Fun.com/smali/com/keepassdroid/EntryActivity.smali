.class public Lcom/keepassdroid/EntryActivity;
.super Lcom/keepassdroid/LockCloseHideActivity;
.source "EntryActivity.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/keepassdroid/EntryActivity$ClearClipboardTask;
    }
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z

.field public static final KEY_ENTRY:Ljava/lang/String; = "entry"

.field public static final KEY_REFRESH_POS:Ljava/lang/String; = "refresh_pos"

.field public static final NOTIFY_PASSWORD:I = 0x2

.field public static final NOTIFY_USERNAME:I = 0x1


# instance fields
.field private dateFormat:Ljava/text/DateFormat;

.field protected mEntry:Lcom/keepassdroid/database/PwEntry;

.field private mIntentReceiver:Landroid/content/BroadcastReceiver;

.field private mNM:Landroid/app/NotificationManager;

.field private mPos:I

.field private mShowPassword:Z

.field private mTimer:Ljava/util/Timer;

.field protected readOnly:Z

.field private timeFormat:Ljava/text/DateFormat;

.field final uiThreadCallback:Landroid/os/Handler;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 70
    const-class v0, Lcom/keepassdroid/EntryActivity;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    sput-boolean v0, Lcom/keepassdroid/EntryActivity;->$assertionsDisabled:Z

    return-void

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 70
    invoke-direct {p0}, Lcom/keepassdroid/LockCloseHideActivity;-><init>()V

    .line 93
    new-instance v0, Ljava/util/Timer;

    invoke-direct {v0}, Ljava/util/Timer;-><init>()V

    iput-object v0, p0, Lcom/keepassdroid/EntryActivity;->mTimer:Ljava/util/Timer;

    .line 98
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/keepassdroid/EntryActivity;->readOnly:Z

    .line 429
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    iput-object v0, p0, Lcom/keepassdroid/EntryActivity;->uiThreadCallback:Landroid/os/Handler;

    return-void
.end method

.method public static Launch(Landroid/app/Activity;Lcom/keepassdroid/database/PwEntry;I)V
    .locals 3
    .param p0, "act"    # Landroid/app/Activity;
    .param p1, "pw"    # Lcom/keepassdroid/database/PwEntry;
    .param p2, "pos"    # I

    .prologue
    .line 80
    instance-of v1, p1, Lcom/keepassdroid/database/PwEntryV4;

    if-eqz v1, :cond_0

    .line 81
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/keepassdroid/EntryActivityV4;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 86
    .local v0, "i":Landroid/content/Intent;
    :goto_0
    const-string v1, "entry"

    invoke-virtual {p1}, Lcom/keepassdroid/database/PwEntry;->getUUID()Ljava/util/UUID;

    move-result-object v2

    invoke-static {v2}, Lcom/keepassdroid/utils/Types;->UUIDtoBytes(Ljava/util/UUID;)[B

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;[B)Landroid/content/Intent;

    .line 87
    const-string v1, "refresh_pos"

    invoke-virtual {v0, v1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 89
    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Landroid/app/Activity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 90
    return-void

    .line 83
    .end local v0    # "i":Landroid/content/Intent;
    :cond_0
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/keepassdroid/EntryActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .restart local v0    # "i":Landroid/content/Intent;
    goto :goto_0
.end method

.method static synthetic access$000(Lcom/keepassdroid/EntryActivity;Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Lcom/keepassdroid/EntryActivity;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 70
    invoke-direct {p0, p1}, Lcom/keepassdroid/EntryActivity;->timeoutCopyToClipboard(Ljava/lang/String;)V

    return-void
.end method

.method private getDateTime(Ljava/util/Date;)Ljava/lang/String;
    .locals 2
    .param p1, "dt"    # Ljava/util/Date;

    .prologue
    .line 242
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lcom/keepassdroid/EntryActivity;->dateFormat:Ljava/text/DateFormat;

    invoke-virtual {v1, p1}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/keepassdroid/EntryActivity;->timeFormat:Ljava/text/DateFormat;

    invoke-virtual {v1, p1}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private getNotification(Ljava/lang/String;I)Landroid/app/Notification;
    .locals 8
    .param p1, "intentText"    # Ljava/lang/String;
    .param p2, "descResId"    # I

    .prologue
    .line 230
    invoke-virtual {p0, p2}, Lcom/keepassdroid/EntryActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 231
    .local v0, "desc":Ljava/lang/String;
    new-instance v2, Landroid/app/Notification;

    const v4, 0x7f020048

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    invoke-direct {v2, v4, v0, v6, v7}, Landroid/app/Notification;-><init>(ILjava/lang/CharSequence;J)V

    .line 233
    .local v2, "notify":Landroid/app/Notification;
    new-instance v1, Landroid/content/Intent;

    invoke-direct {v1, p1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 234
    .local v1, "intent":Landroid/content/Intent;
    const/4 v4, 0x0

    const/high16 v5, 0x10000000

    invoke-static {p0, v4, v1, v5}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v3

    .line 236
    .local v3, "pending":Landroid/app/PendingIntent;
    const v4, 0x7f06000e

    invoke-virtual {p0, v4}, Lcom/keepassdroid/EntryActivity;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, p0, v4, v0, v3}, Landroid/app/Notification;->setLatestEventInfo(Landroid/content/Context;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Landroid/app/PendingIntent;)V

    .line 238
    return-object v2
.end method

.method private populateText(II)V
    .locals 1
    .param p1, "viewId"    # I
    .param p2, "resId"    # I

    .prologue
    .line 275
    invoke-virtual {p0, p1}, Lcom/keepassdroid/EntryActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    .line 276
    .local v0, "tv":Landroid/widget/TextView;
    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setText(I)V

    .line 277
    return-void
.end method

.method private populateText(ILjava/lang/String;)V
    .locals 1
    .param p1, "viewId"    # I
    .param p2, "text"    # Ljava/lang/String;

    .prologue
    .line 280
    invoke-virtual {p0, p1}, Lcom/keepassdroid/EntryActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    .line 281
    .local v0, "tv":Landroid/widget/TextView;
    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 282
    return-void
.end method

.method private setPasswordStyle()V
    .locals 2

    .prologue
    .line 342
    const v1, 0x7f0b0021

    invoke-virtual {p0, v1}, Lcom/keepassdroid/EntryActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    .line 344
    .local v0, "password":Landroid/widget/TextView;
    iget-boolean v1, p0, Lcom/keepassdroid/EntryActivity;->mShowPassword:Z

    if-eqz v1, :cond_0

    .line 345
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTransformationMethod(Landroid/text/method/TransformationMethod;)V

    .line 349
    :goto_0
    return-void

    .line 347
    :cond_0
    invoke-static {}, Landroid/text/method/PasswordTransformationMethod;->getInstance()Landroid/text/method/PasswordTransformationMethod;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTransformationMethod(Landroid/text/method/TransformationMethod;)V

    goto :goto_0
.end method

.method private showSamsungDialog()V
    .locals 7

    .prologue
    .line 458
    const v4, 0x7f060098

    invoke-virtual {p0, v4}, Lcom/keepassdroid/EntryActivity;->getString(I)Ljava/lang/String;

    move-result-object v4

    const-string v5, "line.separator"

    invoke-static {v5}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const v5, 0x7f0600b1

    invoke-virtual {p0, v5}, Lcom/keepassdroid/EntryActivity;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 459
    .local v2, "text":Ljava/lang/String;
    new-instance v1, Landroid/text/SpannableString;

    invoke-direct {v1, v2}, Landroid/text/SpannableString;-><init>(Ljava/lang/CharSequence;)V

    .line 460
    .local v1, "s":Landroid/text/SpannableString;
    new-instance v3, Landroid/widget/TextView;

    invoke-direct {v3, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 461
    .local v3, "tv":Landroid/widget/TextView;
    invoke-virtual {v3, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 462
    const/4 v4, -0x1

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setAutoLinkMask(I)V

    .line 463
    invoke-static {}, Landroid/text/method/LinkMovementMethod;->getInstance()Landroid/text/method/MovementMethod;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setMovementMethod(Landroid/text/method/MovementMethod;)V

    .line 464
    const/4 v4, 0x1

    invoke-static {v1, v4}, Landroid/text/util/Linkify;->addLinks(Landroid/text/Spannable;I)Z

    .line 466
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 467
    .local v0, "builder":Landroid/app/AlertDialog$Builder;
    const v4, 0x7f06009a

    invoke-virtual {v0, v4}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v4

    const v5, 0x104000a

    new-instance v6, Lcom/keepassdroid/EntryActivity$3;

    invoke-direct {v6, p0}, Lcom/keepassdroid/EntryActivity$3;-><init>(Lcom/keepassdroid/EntryActivity;)V

    .line 468
    invoke-virtual {v4, v5, v6}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v4

    .line 474
    invoke-virtual {v4, v3}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object v4

    .line 475
    invoke-virtual {v4}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 477
    return-void
.end method

.method private timeoutCopyToClipboard(Ljava/lang/String;)V
    .locals 8
    .param p1, "text"    # Ljava/lang/String;

    .prologue
    .line 411
    :try_start_0
    invoke-static {p0, p1}, Lcom/keepassdroid/utils/Util;->copyToClipboard(Landroid/content/Context;Ljava/lang/String;)V
    :try_end_0
    .catch Lcom/keepassdroid/database/exception/SamsungClipboardException; {:try_start_0 .. :try_end_0} :catch_0

    .line 417
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v3

    .line 418
    .local v3, "prefs":Landroid/content/SharedPreferences;
    const v5, 0x7f0600b3

    invoke-virtual {p0, v5}, Lcom/keepassdroid/EntryActivity;->getString(I)Ljava/lang/String;

    move-result-object v5

    const v6, 0x7f0600b2

    invoke-virtual {p0, v6}, Lcom/keepassdroid/EntryActivity;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-interface {v3, v5, v6}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 420
    .local v4, "sClipClear":Ljava/lang/String;
    invoke-static {v4}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v0

    .line 422
    .local v0, "clipClearTime":J
    const-wide/16 v6, 0x0

    cmp-long v5, v0, v6

    if-lez v5, :cond_0

    .line 423
    iget-object v5, p0, Lcom/keepassdroid/EntryActivity;->mTimer:Ljava/util/Timer;

    new-instance v6, Lcom/keepassdroid/EntryActivity$ClearClipboardTask;

    invoke-direct {v6, p0, p0, p1}, Lcom/keepassdroid/EntryActivity$ClearClipboardTask;-><init>(Lcom/keepassdroid/EntryActivity;Landroid/content/Context;Ljava/lang/String;)V

    invoke-virtual {v5, v6, v0, v1}, Ljava/util/Timer;->schedule(Ljava/util/TimerTask;J)V

    .line 425
    .end local v0    # "clipClearTime":J
    .end local v3    # "prefs":Landroid/content/SharedPreferences;
    .end local v4    # "sClipClear":Ljava/lang/String;
    :cond_0
    :goto_0
    return-void

    .line 412
    :catch_0
    move-exception v2

    .line 413
    .local v2, "e":Lcom/keepassdroid/database/exception/SamsungClipboardException;
    invoke-direct {p0}, Lcom/keepassdroid/EntryActivity;->showSamsungDialog()V

    goto :goto_0
.end method


# virtual methods
.method protected fillData(Z)V
    .locals 9
    .param p1, "trimList"    # Z

    .prologue
    const v8, 0x7f0b003e

    const/4 v7, 0x1

    .line 247
    const v4, 0x7f0b002f

    invoke-virtual {p0, v4}, Lcom/keepassdroid/EntryActivity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/ImageView;

    .line 248
    .local v2, "iv":Landroid/widget/ImageView;
    invoke-static {}, Lcom/keepassdroid/app/App;->getDB()Lcom/keepassdroid/Database;

    move-result-object v0

    .line 249
    .local v0, "db":Lcom/keepassdroid/Database;
    iget-object v4, v0, Lcom/keepassdroid/Database;->drawFactory:Lcom/keepassdroid/icons/DrawableFactory;

    invoke-virtual {p0}, Lcom/keepassdroid/EntryActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    iget-object v6, p0, Lcom/keepassdroid/EntryActivity;->mEntry:Lcom/keepassdroid/database/PwEntry;

    invoke-virtual {v6}, Lcom/keepassdroid/database/PwEntry;->getIcon()Lcom/keepassdroid/database/PwIcon;

    move-result-object v6

    invoke-virtual {v4, v2, v5, v6}, Lcom/keepassdroid/icons/DrawableFactory;->assignDrawableTo(Landroid/widget/ImageView;Landroid/content/res/Resources;Lcom/keepassdroid/database/PwIcon;)V

    .line 251
    iget-object v3, v0, Lcom/keepassdroid/Database;->pm:Lcom/keepassdroid/database/PwDatabase;

    .line 253
    .local v3, "pm":Lcom/keepassdroid/database/PwDatabase;
    const v4, 0x7f0b0017

    iget-object v5, p0, Lcom/keepassdroid/EntryActivity;->mEntry:Lcom/keepassdroid/database/PwEntry;

    invoke-virtual {v5, v7, v3}, Lcom/keepassdroid/database/PwEntry;->getTitle(ZLcom/keepassdroid/database/PwDatabase;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {p0, v4, v5}, Lcom/keepassdroid/EntryActivity;->populateText(ILjava/lang/String;)V

    .line 254
    const v4, 0x7f0b001a

    iget-object v5, p0, Lcom/keepassdroid/EntryActivity;->mEntry:Lcom/keepassdroid/database/PwEntry;

    invoke-virtual {v5, v7, v3}, Lcom/keepassdroid/database/PwEntry;->getUsername(ZLcom/keepassdroid/database/PwDatabase;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {p0, v4, v5}, Lcom/keepassdroid/EntryActivity;->populateText(ILjava/lang/String;)V

    .line 256
    const v4, 0x7f0b001d

    iget-object v5, p0, Lcom/keepassdroid/EntryActivity;->mEntry:Lcom/keepassdroid/database/PwEntry;

    invoke-virtual {v5, v7, v3}, Lcom/keepassdroid/database/PwEntry;->getUrl(ZLcom/keepassdroid/database/PwDatabase;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {p0, v4, v5}, Lcom/keepassdroid/EntryActivity;->populateText(ILjava/lang/String;)V

    .line 257
    const v4, 0x7f0b0021

    iget-object v5, p0, Lcom/keepassdroid/EntryActivity;->mEntry:Lcom/keepassdroid/database/PwEntry;

    invoke-virtual {v5, v7, v3}, Lcom/keepassdroid/database/PwEntry;->getPassword(ZLcom/keepassdroid/database/PwDatabase;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {p0, v4, v5}, Lcom/keepassdroid/EntryActivity;->populateText(ILjava/lang/String;)V

    .line 258
    invoke-direct {p0}, Lcom/keepassdroid/EntryActivity;->setPasswordStyle()V

    .line 260
    const v4, 0x7f0b0038

    iget-object v5, p0, Lcom/keepassdroid/EntryActivity;->mEntry:Lcom/keepassdroid/database/PwEntry;

    invoke-virtual {v5}, Lcom/keepassdroid/database/PwEntry;->getCreationTime()Ljava/util/Date;

    move-result-object v5

    invoke-direct {p0, v5}, Lcom/keepassdroid/EntryActivity;->getDateTime(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {p0, v4, v5}, Lcom/keepassdroid/EntryActivity;->populateText(ILjava/lang/String;)V

    .line 261
    const v4, 0x7f0b003a

    iget-object v5, p0, Lcom/keepassdroid/EntryActivity;->mEntry:Lcom/keepassdroid/database/PwEntry;

    invoke-virtual {v5}, Lcom/keepassdroid/database/PwEntry;->getLastModificationTime()Ljava/util/Date;

    move-result-object v5

    invoke-direct {p0, v5}, Lcom/keepassdroid/EntryActivity;->getDateTime(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {p0, v4, v5}, Lcom/keepassdroid/EntryActivity;->populateText(ILjava/lang/String;)V

    .line 262
    const v4, 0x7f0b003c

    iget-object v5, p0, Lcom/keepassdroid/EntryActivity;->mEntry:Lcom/keepassdroid/database/PwEntry;

    invoke-virtual {v5}, Lcom/keepassdroid/database/PwEntry;->getLastAccessTime()Ljava/util/Date;

    move-result-object v5

    invoke-direct {p0, v5}, Lcom/keepassdroid/EntryActivity;->getDateTime(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {p0, v4, v5}, Lcom/keepassdroid/EntryActivity;->populateText(ILjava/lang/String;)V

    .line 264
    iget-object v4, p0, Lcom/keepassdroid/EntryActivity;->mEntry:Lcom/keepassdroid/database/PwEntry;

    invoke-virtual {v4}, Lcom/keepassdroid/database/PwEntry;->getExpiryTime()Ljava/util/Date;

    move-result-object v1

    .line 265
    .local v1, "expires":Ljava/util/Date;
    iget-object v4, p0, Lcom/keepassdroid/EntryActivity;->mEntry:Lcom/keepassdroid/database/PwEntry;

    invoke-virtual {v4}, Lcom/keepassdroid/database/PwEntry;->expires()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 266
    invoke-direct {p0, v1}, Lcom/keepassdroid/EntryActivity;->getDateTime(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {p0, v8, v4}, Lcom/keepassdroid/EntryActivity;->populateText(ILjava/lang/String;)V

    .line 270
    :goto_0
    const v4, 0x7f0b0027

    iget-object v5, p0, Lcom/keepassdroid/EntryActivity;->mEntry:Lcom/keepassdroid/database/PwEntry;

    invoke-virtual {v5, v7, v3}, Lcom/keepassdroid/database/PwEntry;->getNotes(ZLcom/keepassdroid/database/PwDatabase;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {p0, v4, v5}, Lcom/keepassdroid/EntryActivity;->populateText(ILjava/lang/String;)V

    .line 272
    return-void

    .line 268
    :cond_0
    const v4, 0x7f060073

    invoke-direct {p0, v8, v4}, Lcom/keepassdroid/EntryActivity;->populateText(II)V

    goto :goto_0
.end method

.method protected onActivityResult(IILandroid/content/Intent;)V
    .locals 4
    .param p1, "requestCode"    # I
    .param p2, "resultCode"    # I
    .param p3, "data"    # Landroid/content/Intent;

    .prologue
    const/4 v2, 0x3

    const/4 v3, 0x2

    .line 286
    invoke-super {p0, p1, p2, p3}, Lcom/keepassdroid/LockCloseHideActivity;->onActivityResult(IILandroid/content/Intent;)V

    .line 287
    if-eq p2, v3, :cond_0

    if-ne p2, v2, :cond_1

    .line 288
    :cond_0
    const/4 v1, 0x1

    invoke-virtual {p0, v1}, Lcom/keepassdroid/EntryActivity;->fillData(Z)V

    .line 289
    if-ne p2, v2, :cond_1

    .line 290
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 291
    .local v0, "ret":Landroid/content/Intent;
    const-string v1, "refresh_pos"

    iget v2, p0, Lcom/keepassdroid/EntryActivity;->mPos:I

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 292
    invoke-virtual {p0, v3, v0}, Lcom/keepassdroid/EntryActivity;->setResult(ILandroid/content/Intent;)V

    .line 295
    .end local v0    # "ret":Landroid/content/Intent;
    :cond_1
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 13
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const/4 v9, 0x1

    const/4 v10, 0x0

    .line 127
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v5

    .line 128
    .local v5, "prefs":Landroid/content/SharedPreferences;
    const v8, 0x7f0600c1

    invoke-virtual {p0, v8}, Lcom/keepassdroid/EntryActivity;->getString(I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {p0}, Lcom/keepassdroid/EntryActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v11

    const v12, 0x7f080001

    invoke-virtual {v11, v12}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v11

    invoke-interface {v5, v8, v11}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v8

    if-nez v8, :cond_0

    move v8, v9

    :goto_0
    iput-boolean v8, p0, Lcom/keepassdroid/EntryActivity;->mShowPassword:Z

    .line 130
    invoke-super {p0, p1}, Lcom/keepassdroid/LockCloseHideActivity;->onCreate(Landroid/os/Bundle;)V

    .line 131
    invoke-virtual {p0}, Lcom/keepassdroid/EntryActivity;->setEntryView()V

    .line 133
    invoke-virtual {p0}, Lcom/keepassdroid/EntryActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    .line 134
    .local v0, "appCtx":Landroid/content/Context;
    invoke-static {v0}, Landroid/text/format/DateFormat;->getDateFormat(Landroid/content/Context;)Ljava/text/DateFormat;

    move-result-object v8

    iput-object v8, p0, Lcom/keepassdroid/EntryActivity;->dateFormat:Ljava/text/DateFormat;

    .line 135
    invoke-static {v0}, Landroid/text/format/DateFormat;->getTimeFormat(Landroid/content/Context;)Ljava/text/DateFormat;

    move-result-object v8

    iput-object v8, p0, Lcom/keepassdroid/EntryActivity;->timeFormat:Ljava/text/DateFormat;

    .line 137
    invoke-static {}, Lcom/keepassdroid/app/App;->getDB()Lcom/keepassdroid/Database;

    move-result-object v1

    .line 139
    .local v1, "db":Lcom/keepassdroid/Database;
    invoke-virtual {v1}, Lcom/keepassdroid/Database;->Loaded()Z

    move-result v8

    if-nez v8, :cond_1

    .line 140
    invoke-virtual {p0}, Lcom/keepassdroid/EntryActivity;->finish()V

    .line 208
    :goto_1
    return-void

    .end local v0    # "appCtx":Landroid/content/Context;
    .end local v1    # "db":Lcom/keepassdroid/Database;
    :cond_0
    move v8, v10

    .line 128
    goto :goto_0

    .line 143
    .restart local v0    # "appCtx":Landroid/content/Context;
    .restart local v1    # "db":Lcom/keepassdroid/Database;
    :cond_1
    iget-boolean v8, v1, Lcom/keepassdroid/Database;->readOnly:Z

    iput-boolean v8, p0, Lcom/keepassdroid/EntryActivity;->readOnly:Z

    .line 145
    invoke-virtual {p0, v10}, Lcom/keepassdroid/EntryActivity;->setResult(I)V

    .line 147
    invoke-virtual {p0}, Lcom/keepassdroid/EntryActivity;->getIntent()Landroid/content/Intent;

    move-result-object v3

    .line 148
    .local v3, "i":Landroid/content/Intent;
    const-string v8, "entry"

    invoke-virtual {v3, v8}, Landroid/content/Intent;->getByteArrayExtra(Ljava/lang/String;)[B

    move-result-object v8

    invoke-static {v8}, Lcom/keepassdroid/utils/Types;->bytestoUUID([B)Ljava/util/UUID;

    move-result-object v7

    .line 149
    .local v7, "uuid":Ljava/util/UUID;
    const-string v8, "refresh_pos"

    const/4 v11, -0x1

    invoke-virtual {v3, v8, v11}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v8

    iput v8, p0, Lcom/keepassdroid/EntryActivity;->mPos:I

    .line 150
    sget-boolean v8, Lcom/keepassdroid/EntryActivity;->$assertionsDisabled:Z

    if-nez v8, :cond_2

    if-nez v7, :cond_2

    new-instance v8, Ljava/lang/AssertionError;

    invoke-direct {v8}, Ljava/lang/AssertionError;-><init>()V

    throw v8

    .line 152
    :cond_2
    iget-object v8, v1, Lcom/keepassdroid/Database;->pm:Lcom/keepassdroid/database/PwDatabase;

    iget-object v8, v8, Lcom/keepassdroid/database/PwDatabase;->entries:Ljava/util/Map;

    invoke-interface {v8, v7}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/keepassdroid/database/PwEntry;

    iput-object v8, p0, Lcom/keepassdroid/EntryActivity;->mEntry:Lcom/keepassdroid/database/PwEntry;

    .line 153
    iget-object v8, p0, Lcom/keepassdroid/EntryActivity;->mEntry:Lcom/keepassdroid/database/PwEntry;

    if-nez v8, :cond_3

    .line 154
    const v8, 0x7f06009b

    invoke-static {p0, v8, v9}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v8

    invoke-virtual {v8}, Landroid/widget/Toast;->show()V

    .line 155
    invoke-virtual {p0}, Lcom/keepassdroid/EntryActivity;->finish()V

    goto :goto_1

    .line 160
    :cond_3
    invoke-static {p0}, Lcom/keepassdroid/compat/ActivityCompat;->invalidateOptionsMenu(Landroid/app/Activity;)V

    .line 163
    iget-object v8, p0, Lcom/keepassdroid/EntryActivity;->mEntry:Lcom/keepassdroid/database/PwEntry;

    invoke-virtual {v8, v10, v10}, Lcom/keepassdroid/database/PwEntry;->touch(ZZ)V

    .line 165
    invoke-virtual {p0, v10}, Lcom/keepassdroid/EntryActivity;->fillData(Z)V

    .line 167
    invoke-virtual {p0}, Lcom/keepassdroid/EntryActivity;->setupEditButtons()V

    .line 170
    const-string v8, "notification"

    invoke-virtual {p0, v8}, Lcom/keepassdroid/EntryActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Landroid/app/NotificationManager;

    iput-object v8, p0, Lcom/keepassdroid/EntryActivity;->mNM:Landroid/app/NotificationManager;

    .line 172
    iget-object v8, p0, Lcom/keepassdroid/EntryActivity;->mEntry:Lcom/keepassdroid/database/PwEntry;

    invoke-virtual {v8}, Lcom/keepassdroid/database/PwEntry;->getPassword()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/String;->length()I

    move-result v8

    if-lez v8, :cond_4

    .line 174
    const-string v8, "com.keepassdroid.copy_password"

    const v10, 0x7f060019

    invoke-direct {p0, v8, v10}, Lcom/keepassdroid/EntryActivity;->getNotification(Ljava/lang/String;I)Landroid/app/Notification;

    move-result-object v4

    .line 175
    .local v4, "password":Landroid/app/Notification;
    iget-object v8, p0, Lcom/keepassdroid/EntryActivity;->mNM:Landroid/app/NotificationManager;

    const/4 v10, 0x2

    invoke-virtual {v8, v10, v4}, Landroid/app/NotificationManager;->notify(ILandroid/app/Notification;)V

    .line 178
    .end local v4    # "password":Landroid/app/Notification;
    :cond_4
    iget-object v8, p0, Lcom/keepassdroid/EntryActivity;->mEntry:Lcom/keepassdroid/database/PwEntry;

    invoke-virtual {v8}, Lcom/keepassdroid/database/PwEntry;->getUsername()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/String;->length()I

    move-result v8

    if-lez v8, :cond_5

    .line 180
    const-string v8, "com.keepassdroid.copy_username"

    const v10, 0x7f06001a

    invoke-direct {p0, v8, v10}, Lcom/keepassdroid/EntryActivity;->getNotification(Ljava/lang/String;I)Landroid/app/Notification;

    move-result-object v6

    .line 181
    .local v6, "username":Landroid/app/Notification;
    iget-object v8, p0, Lcom/keepassdroid/EntryActivity;->mNM:Landroid/app/NotificationManager;

    invoke-virtual {v8, v9, v6}, Landroid/app/NotificationManager;->notify(ILandroid/app/Notification;)V

    .line 184
    .end local v6    # "username":Landroid/app/Notification;
    :cond_5
    new-instance v8, Lcom/keepassdroid/EntryActivity$2;

    invoke-direct {v8, p0}, Lcom/keepassdroid/EntryActivity$2;-><init>(Lcom/keepassdroid/EntryActivity;)V

    iput-object v8, p0, Lcom/keepassdroid/EntryActivity;->mIntentReceiver:Landroid/content/BroadcastReceiver;

    .line 204
    new-instance v2, Landroid/content/IntentFilter;

    invoke-direct {v2}, Landroid/content/IntentFilter;-><init>()V

    .line 205
    .local v2, "filter":Landroid/content/IntentFilter;
    const-string v8, "com.keepassdroid.copy_username"

    invoke-virtual {v2, v8}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 206
    const-string v8, "com.keepassdroid.copy_password"

    invoke-virtual {v2, v8}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 207
    iget-object v8, p0, Lcom/keepassdroid/EntryActivity;->mIntentReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v8, v2}, Lcom/keepassdroid/EntryActivity;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    goto/16 :goto_1
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;)Z
    .locals 8
    .param p1, "menu"    # Landroid/view/Menu;

    .prologue
    const/4 v7, 0x0

    .line 299
    invoke-super {p0, p1}, Lcom/keepassdroid/LockCloseHideActivity;->onCreateOptionsMenu(Landroid/view/Menu;)Z

    .line 301
    invoke-virtual {p0}, Lcom/keepassdroid/EntryActivity;->getMenuInflater()Landroid/view/MenuInflater;

    move-result-object v3

    .line 302
    .local v3, "inflater":Landroid/view/MenuInflater;
    const/high16 v6, 0x7f0a0000

    invoke-virtual {v3, v6, p1}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    .line 304
    const v6, 0x7f0b0073

    invoke-interface {p1, v6}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v4

    .line 305
    .local v4, "togglePassword":Landroid/view/MenuItem;
    iget-boolean v6, p0, Lcom/keepassdroid/EntryActivity;->mShowPassword:Z

    if-eqz v6, :cond_1

    .line 306
    const v6, 0x7f06006a

    invoke-interface {v4, v6}, Landroid/view/MenuItem;->setTitle(I)Landroid/view/MenuItem;

    .line 311
    :goto_0
    const v6, 0x7f0b0074

    invoke-interface {p1, v6}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v2

    .line 312
    .local v2, "gotoUrl":Landroid/view/MenuItem;
    const v6, 0x7f0b0075

    invoke-interface {p1, v6}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v1

    .line 313
    .local v1, "copyUser":Landroid/view/MenuItem;
    const v6, 0x7f0b0076

    invoke-interface {p1, v6}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v0

    .line 317
    .local v0, "copyPass":Landroid/view/MenuItem;
    iget-object v6, p0, Lcom/keepassdroid/EntryActivity;->mEntry:Lcom/keepassdroid/database/PwEntry;

    if-nez v6, :cond_2

    .line 318
    invoke-interface {v2, v7}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    .line 319
    invoke-interface {v1, v7}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    .line 320
    invoke-interface {v0, v7}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    .line 338
    :cond_0
    :goto_1
    const/4 v6, 0x1

    return v6

    .line 308
    .end local v0    # "copyPass":Landroid/view/MenuItem;
    .end local v1    # "copyUser":Landroid/view/MenuItem;
    .end local v2    # "gotoUrl":Landroid/view/MenuItem;
    :cond_1
    const v6, 0x7f060070

    invoke-interface {v4, v6}, Landroid/view/MenuItem;->setTitle(I)Landroid/view/MenuItem;

    goto :goto_0

    .line 323
    .restart local v0    # "copyPass":Landroid/view/MenuItem;
    .restart local v1    # "copyUser":Landroid/view/MenuItem;
    .restart local v2    # "gotoUrl":Landroid/view/MenuItem;
    :cond_2
    iget-object v6, p0, Lcom/keepassdroid/EntryActivity;->mEntry:Lcom/keepassdroid/database/PwEntry;

    invoke-virtual {v6}, Lcom/keepassdroid/database/PwEntry;->getUrl()Ljava/lang/String;

    move-result-object v5

    .line 324
    .local v5, "url":Ljava/lang/String;
    invoke-static {v5}, Lcom/keepassdroid/utils/EmptyUtils;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_3

    .line 326
    invoke-interface {v2, v7}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    .line 328
    :cond_3
    iget-object v6, p0, Lcom/keepassdroid/EntryActivity;->mEntry:Lcom/keepassdroid/database/PwEntry;

    invoke-virtual {v6}, Lcom/keepassdroid/database/PwEntry;->getUsername()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v6

    if-nez v6, :cond_4

    .line 330
    invoke-interface {v1, v7}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    .line 332
    :cond_4
    iget-object v6, p0, Lcom/keepassdroid/EntryActivity;->mEntry:Lcom/keepassdroid/database/PwEntry;

    invoke-virtual {v6}, Lcom/keepassdroid/database/PwEntry;->getPassword()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v6

    if-nez v6, :cond_0

    .line 334
    invoke-interface {v0, v7}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    goto :goto_1
.end method

.method protected onDestroy()V
    .locals 1

    .prologue
    .line 213
    iget-object v0, p0, Lcom/keepassdroid/EntryActivity;->mIntentReceiver:Landroid/content/BroadcastReceiver;

    if-eqz v0, :cond_0

    .line 214
    iget-object v0, p0, Lcom/keepassdroid/EntryActivity;->mIntentReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v0}, Lcom/keepassdroid/EntryActivity;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 217
    :cond_0
    iget-object v0, p0, Lcom/keepassdroid/EntryActivity;->mNM:Landroid/app/NotificationManager;

    if-eqz v0, :cond_1

    .line 219
    :try_start_0
    iget-object v0, p0, Lcom/keepassdroid/EntryActivity;->mNM:Landroid/app/NotificationManager;

    invoke-virtual {v0}, Landroid/app/NotificationManager;->cancelAll()V
    :try_end_0
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_0

    .line 226
    :cond_1
    :goto_0
    invoke-super {p0}, Lcom/keepassdroid/LockCloseHideActivity;->onDestroy()V

    .line 227
    return-void

    .line 220
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 6
    .param p1, "item"    # Landroid/view/MenuItem;

    .prologue
    const/4 v3, 0x0

    const/4 v2, 0x1

    .line 353
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v4

    packed-switch v4, :pswitch_data_0

    .line 406
    invoke-super {p0, p1}, Lcom/keepassdroid/LockCloseHideActivity;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result v2

    :goto_0
    return v2

    .line 356
    :pswitch_0
    const v4, 0x7f0600b6

    :try_start_0
    invoke-static {p0, v4}, Lcom/keepassdroid/utils/Util;->gotoUrl(Landroid/content/Context;I)V
    :try_end_0
    .catch Landroid/content/ActivityNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 357
    :catch_0
    move-exception v0

    .line 358
    .local v0, "e":Landroid/content/ActivityNotFoundException;
    const v4, 0x7f06003a

    invoke-static {p0, v4, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v2

    invoke-virtual {v2}, Landroid/widget/Toast;->show()V

    move v2, v3

    .line 359
    goto :goto_0

    .line 364
    .end local v0    # "e":Landroid/content/ActivityNotFoundException;
    :pswitch_1
    iget-boolean v4, p0, Lcom/keepassdroid/EntryActivity;->mShowPassword:Z

    if-eqz v4, :cond_0

    .line 365
    const v4, 0x7f060070

    invoke-interface {p1, v4}, Landroid/view/MenuItem;->setTitle(I)Landroid/view/MenuItem;

    .line 366
    iput-boolean v3, p0, Lcom/keepassdroid/EntryActivity;->mShowPassword:Z

    .line 371
    :goto_1
    invoke-direct {p0}, Lcom/keepassdroid/EntryActivity;->setPasswordStyle()V

    goto :goto_0

    .line 368
    :cond_0
    const v3, 0x7f06006a

    invoke-interface {p1, v3}, Landroid/view/MenuItem;->setTitle(I)Landroid/view/MenuItem;

    .line 369
    iput-boolean v2, p0, Lcom/keepassdroid/EntryActivity;->mShowPassword:Z

    goto :goto_1

    .line 377
    :pswitch_2
    iget-object v3, p0, Lcom/keepassdroid/EntryActivity;->mEntry:Lcom/keepassdroid/database/PwEntry;

    invoke-virtual {v3}, Lcom/keepassdroid/database/PwEntry;->getUrl()Ljava/lang/String;

    move-result-object v1

    .line 380
    .local v1, "url":Ljava/lang/String;
    const-string v3, "://"

    invoke-virtual {v1, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_1

    .line 381
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "http://"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 385
    :cond_1
    :try_start_1
    invoke-static {p0, v1}, Lcom/keepassdroid/utils/Util;->gotoUrl(Landroid/content/Context;Ljava/lang/String;)V
    :try_end_1
    .catch Landroid/content/ActivityNotFoundException; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_0

    .line 386
    :catch_1
    move-exception v0

    .line 387
    .restart local v0    # "e":Landroid/content/ActivityNotFoundException;
    const v3, 0x7f060076

    invoke-static {p0, v3, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v3

    invoke-virtual {v3}, Landroid/widget/Toast;->show()V

    goto :goto_0

    .line 392
    .end local v0    # "e":Landroid/content/ActivityNotFoundException;
    .end local v1    # "url":Ljava/lang/String;
    :pswitch_3
    iget-object v3, p0, Lcom/keepassdroid/EntryActivity;->mEntry:Lcom/keepassdroid/database/PwEntry;

    invoke-static {}, Lcom/keepassdroid/app/App;->getDB()Lcom/keepassdroid/Database;

    move-result-object v4

    iget-object v4, v4, Lcom/keepassdroid/Database;->pm:Lcom/keepassdroid/database/PwDatabase;

    invoke-virtual {v3, v2, v4}, Lcom/keepassdroid/database/PwEntry;->getUsername(ZLcom/keepassdroid/database/PwDatabase;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v3}, Lcom/keepassdroid/EntryActivity;->timeoutCopyToClipboard(Ljava/lang/String;)V

    goto :goto_0

    .line 396
    :pswitch_4
    new-instance v3, Ljava/lang/String;

    iget-object v4, p0, Lcom/keepassdroid/EntryActivity;->mEntry:Lcom/keepassdroid/database/PwEntry;

    invoke-static {}, Lcom/keepassdroid/app/App;->getDB()Lcom/keepassdroid/Database;

    move-result-object v5

    iget-object v5, v5, Lcom/keepassdroid/Database;->pm:Lcom/keepassdroid/database/PwDatabase;

    invoke-virtual {v4, v2, v5}, Lcom/keepassdroid/database/PwEntry;->getPassword(ZLcom/keepassdroid/database/PwDatabase;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    invoke-direct {p0, v3}, Lcom/keepassdroid/EntryActivity;->timeoutCopyToClipboard(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 400
    :pswitch_5
    invoke-static {}, Lcom/keepassdroid/app/App;->setShutdown()V

    .line 401
    invoke-virtual {p0, v2}, Lcom/keepassdroid/EntryActivity;->setResult(I)V

    .line 402
    invoke-virtual {p0}, Lcom/keepassdroid/EntryActivity;->finish()V

    goto/16 :goto_0

    .line 353
    nop

    :pswitch_data_0
    .packed-switch 0x7f0b0072
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_5
    .end packed-switch
.end method

.method protected setEntryView()V
    .locals 1

    .prologue
    .line 104
    const v0, 0x7f030007

    invoke-virtual {p0, v0}, Lcom/keepassdroid/EntryActivity;->setContentView(I)V

    .line 105
    return-void
.end method

.method protected setupEditButtons()V
    .locals 4

    .prologue
    const/16 v3, 0x8

    .line 108
    const v2, 0x7f0b0032

    invoke-virtual {p0, v2}, Lcom/keepassdroid/EntryActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/Button;

    .line 109
    .local v1, "edit":Landroid/widget/Button;
    new-instance v2, Lcom/keepassdroid/EntryActivity$1;

    invoke-direct {v2, p0}, Lcom/keepassdroid/EntryActivity$1;-><init>(Lcom/keepassdroid/EntryActivity;)V

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 117
    iget-boolean v2, p0, Lcom/keepassdroid/EntryActivity;->readOnly:Z

    if-eqz v2, :cond_0

    .line 118
    invoke-virtual {v1, v3}, Landroid/widget/Button;->setVisibility(I)V

    .line 120
    const v2, 0x7f0b0033

    invoke-virtual {p0, v2}, Lcom/keepassdroid/EntryActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .line 121
    .local v0, "divider":Landroid/view/View;
    invoke-virtual {v0, v3}, Landroid/view/View;->setVisibility(I)V

    .line 123
    .end local v0    # "divider":Landroid/view/View;
    :cond_0
    return-void
.end method
