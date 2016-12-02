.class public Lcom/keepassdroid/settings/RoundsPreference;
.super Landroid/preference/DialogPreference;
.source "RoundsPreference.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/keepassdroid/settings/RoundsPreference$AfterSave;
    }
.end annotation


# instance fields
.field private mPM:Lcom/keepassdroid/database/PwDatabase;

.field private mRoundsView:Landroid/widget/TextView;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 59
    invoke-direct {p0, p1, p2}, Landroid/preference/DialogPreference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 60
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyle"    # I

    .prologue
    .line 63
    invoke-direct {p0, p1, p2, p3}, Landroid/preference/DialogPreference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 64
    return-void
.end method

.method static synthetic access$000(Lcom/keepassdroid/settings/RoundsPreference;)Lcom/keepassdroid/database/PwDatabase;
    .locals 1
    .param p0, "x0"    # Lcom/keepassdroid/settings/RoundsPreference;

    .prologue
    .line 39
    iget-object v0, p0, Lcom/keepassdroid/settings/RoundsPreference;->mPM:Lcom/keepassdroid/database/PwDatabase;

    return-object v0
.end method


# virtual methods
.method protected onCreateDialogView()Landroid/view/View;
    .locals 6

    .prologue
    .line 46
    invoke-super {p0}, Landroid/preference/DialogPreference;->onCreateDialogView()Landroid/view/View;

    move-result-object v1

    .line 48
    .local v1, "view":Landroid/view/View;
    const v4, 0x7f0b000f

    invoke-virtual {v1, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    iput-object v4, p0, Lcom/keepassdroid/settings/RoundsPreference;->mRoundsView:Landroid/widget/TextView;

    .line 50
    invoke-static {}, Lcom/keepassdroid/app/App;->getDB()Lcom/keepassdroid/Database;

    move-result-object v0

    .line 51
    .local v0, "db":Lcom/keepassdroid/Database;
    iget-object v4, v0, Lcom/keepassdroid/Database;->pm:Lcom/keepassdroid/database/PwDatabase;

    iput-object v4, p0, Lcom/keepassdroid/settings/RoundsPreference;->mPM:Lcom/keepassdroid/database/PwDatabase;

    .line 52
    iget-object v4, p0, Lcom/keepassdroid/settings/RoundsPreference;->mPM:Lcom/keepassdroid/database/PwDatabase;

    invoke-virtual {v4}, Lcom/keepassdroid/database/PwDatabase;->getNumRounds()J

    move-result-wide v2

    .line 53
    .local v2, "numRounds":J
    iget-object v4, p0, Lcom/keepassdroid/settings/RoundsPreference;->mRoundsView:Landroid/widget/TextView;

    invoke-static {v2, v3}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 55
    return-object v1
.end method

.method protected onDialogClosed(Z)V
    .locals 14
    .param p1, "positiveResult"    # Z

    .prologue
    const/4 v2, 0x1

    .line 68
    invoke-super {p0, p1}, Landroid/preference/DialogPreference;->onDialogClosed(Z)V

    .line 70
    if-eqz p1, :cond_1

    .line 74
    :try_start_0
    iget-object v0, p0, Lcom/keepassdroid/settings/RoundsPreference;->mRoundsView:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v10

    .line 75
    .local v10, "strRounds":Ljava/lang/String;
    invoke-static {v10}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v8

    .line 81
    .local v8, "rounds":I
    if-ge v8, v2, :cond_0

    .line 82
    const/4 v8, 0x1

    .line 85
    :cond_0
    iget-object v0, p0, Lcom/keepassdroid/settings/RoundsPreference;->mPM:Lcom/keepassdroid/database/PwDatabase;

    invoke-virtual {v0}, Lcom/keepassdroid/database/PwDatabase;->getNumRounds()J

    move-result-wide v4

    .line 87
    .local v4, "oldRounds":J
    :try_start_1
    iget-object v0, p0, Lcom/keepassdroid/settings/RoundsPreference;->mPM:Lcom/keepassdroid/database/PwDatabase;

    int-to-long v12, v8

    invoke-virtual {v0, v12, v13}, Lcom/keepassdroid/database/PwDatabase;->setNumRounds(J)V
    :try_end_1
    .catch Ljava/lang/NumberFormatException; {:try_start_1 .. :try_end_1} :catch_1

    .line 93
    :goto_0
    new-instance v3, Landroid/os/Handler;

    invoke-direct {v3}, Landroid/os/Handler;-><init>()V

    .line 94
    .local v3, "handler":Landroid/os/Handler;
    new-instance v9, Lcom/keepassdroid/database/edit/SaveDB;

    invoke-virtual {p0}, Lcom/keepassdroid/settings/RoundsPreference;->getContext()Landroid/content/Context;

    move-result-object v11

    invoke-static {}, Lcom/keepassdroid/app/App;->getDB()Lcom/keepassdroid/Database;

    move-result-object v12

    new-instance v0, Lcom/keepassdroid/settings/RoundsPreference$AfterSave;

    invoke-virtual {p0}, Lcom/keepassdroid/settings/RoundsPreference;->getContext()Landroid/content/Context;

    move-result-object v2

    move-object v1, p0

    invoke-direct/range {v0 .. v5}, Lcom/keepassdroid/settings/RoundsPreference$AfterSave;-><init>(Lcom/keepassdroid/settings/RoundsPreference;Landroid/content/Context;Landroid/os/Handler;J)V

    invoke-direct {v9, v11, v12, v0}, Lcom/keepassdroid/database/edit/SaveDB;-><init>(Landroid/content/Context;Lcom/keepassdroid/Database;Lcom/keepassdroid/database/edit/OnFinish;)V

    .line 95
    .local v9, "save":Lcom/keepassdroid/database/edit/SaveDB;
    new-instance v7, Lcom/keepassdroid/ProgressTask;

    invoke-virtual {p0}, Lcom/keepassdroid/settings/RoundsPreference;->getContext()Landroid/content/Context;

    move-result-object v0

    const v1, 0x7f060086

    invoke-direct {v7, v0, v9, v1}, Lcom/keepassdroid/ProgressTask;-><init>(Landroid/content/Context;Lcom/keepassdroid/database/edit/RunnableOnFinish;I)V

    .line 96
    .local v7, "pt":Lcom/keepassdroid/ProgressTask;
    invoke-virtual {v7}, Lcom/keepassdroid/ProgressTask;->run()V

    .line 100
    .end local v3    # "handler":Landroid/os/Handler;
    .end local v4    # "oldRounds":J
    .end local v7    # "pt":Lcom/keepassdroid/ProgressTask;
    .end local v8    # "rounds":I
    .end local v9    # "save":Lcom/keepassdroid/database/edit/SaveDB;
    .end local v10    # "strRounds":Ljava/lang/String;
    :cond_1
    :goto_1
    return-void

    .line 76
    :catch_0
    move-exception v6

    .line 77
    .local v6, "e":Ljava/lang/NumberFormatException;
    invoke-virtual {p0}, Lcom/keepassdroid/settings/RoundsPreference;->getContext()Landroid/content/Context;

    move-result-object v0

    const v1, 0x7f060044

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    goto :goto_1

    .line 88
    .end local v6    # "e":Ljava/lang/NumberFormatException;
    .restart local v4    # "oldRounds":J
    .restart local v8    # "rounds":I
    .restart local v10    # "strRounds":Ljava/lang/String;
    :catch_1
    move-exception v6

    .line 89
    .restart local v6    # "e":Ljava/lang/NumberFormatException;
    invoke-virtual {p0}, Lcom/keepassdroid/settings/RoundsPreference;->getContext()Landroid/content/Context;

    move-result-object v0

    const v1, 0x7f060045

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 90
    iget-object v0, p0, Lcom/keepassdroid/settings/RoundsPreference;->mPM:Lcom/keepassdroid/database/PwDatabase;

    const-wide/32 v12, 0x7fffffff

    invoke-virtual {v0, v12, v13}, Lcom/keepassdroid/database/PwDatabase;->setNumRounds(J)V

    goto :goto_0
.end method
