.class public abstract Lcom/keepassdroid/EntryEditActivity;
.super Lcom/keepassdroid/LockCloseHideActivity;
.source "EntryEditActivity.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/keepassdroid/EntryEditActivity$AfterSave;
    }
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z

.field public static final KEY_ENTRY:Ljava/lang/String; = "entry"

.field public static final KEY_PARENT:Ljava/lang/String; = "parent"

.field public static final RESULT_OK_ICON_PICKER:I = 0x3e8

.field public static final RESULT_OK_PASSWORD_GENERATOR:I = 0x3e9


# instance fields
.field protected mEntry:Lcom/keepassdroid/database/PwEntry;

.field protected mIsNew:Z

.field protected mSelectedIconID:I

.field private mShowPassword:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 64
    const-class v0, Lcom/keepassdroid/EntryEditActivity;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    sput-boolean v0, Lcom/keepassdroid/EntryEditActivity;->$assertionsDisabled:Z

    return-void

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 64
    invoke-direct {p0}, Lcom/keepassdroid/LockCloseHideActivity;-><init>()V

    .line 72
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/keepassdroid/EntryEditActivity;->mShowPassword:Z

    .line 74
    const/4 v0, -0x1

    iput v0, p0, Lcom/keepassdroid/EntryEditActivity;->mSelectedIconID:I

    return-void
.end method

.method public static Launch(Landroid/app/Activity;Lcom/keepassdroid/database/PwEntry;)V
    .locals 3
    .param p0, "act"    # Landroid/app/Activity;
    .param p1, "pw"    # Lcom/keepassdroid/database/PwEntry;

    .prologue
    .line 78
    instance-of v1, p1, Lcom/keepassdroid/database/PwEntryV3;

    if-eqz v1, :cond_0

    .line 79
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/keepassdroid/EntryEditActivityV3;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 88
    .local v0, "i":Landroid/content/Intent;
    :goto_0
    const-string v1, "entry"

    invoke-virtual {p1}, Lcom/keepassdroid/database/PwEntry;->getUUID()Ljava/util/UUID;

    move-result-object v2

    invoke-static {v2}, Lcom/keepassdroid/utils/Types;->UUIDtoBytes(Ljava/util/UUID;)[B

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;[B)Landroid/content/Intent;

    .line 90
    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Landroid/app/Activity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 91
    return-void

    .line 81
    .end local v0    # "i":Landroid/content/Intent;
    :cond_0
    instance-of v1, p1, Lcom/keepassdroid/database/PwEntryV4;

    if-eqz v1, :cond_1

    .line 82
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/keepassdroid/EntryEditActivityV4;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .restart local v0    # "i":Landroid/content/Intent;
    goto :goto_0

    .line 85
    .end local v0    # "i":Landroid/content/Intent;
    :cond_1
    new-instance v1, Ljava/lang/RuntimeException;

    const-string v2, "Not yet implemented."

    invoke-direct {v1, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public static Launch(Landroid/app/Activity;Lcom/keepassdroid/database/PwGroup;)V
    .locals 3
    .param p0, "act"    # Landroid/app/Activity;
    .param p1, "pw"    # Lcom/keepassdroid/database/PwGroup;

    .prologue
    .line 95
    instance-of v1, p1, Lcom/keepassdroid/database/PwGroupV3;

    if-eqz v1, :cond_0

    .line 96
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/keepassdroid/EntryEditActivityV3;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 97
    .local v0, "i":Landroid/content/Intent;
    const-string v1, "parent"

    check-cast p1, Lcom/keepassdroid/database/PwGroupV3;

    .end local p1    # "pw":Lcom/keepassdroid/database/PwGroup;
    invoke-static {v0, v1, p1}, Lcom/keepassdroid/EntryEditActivityV3;->putParentId(Landroid/content/Intent;Ljava/lang/String;Lcom/keepassdroid/database/PwGroupV3;)V

    .line 107
    :goto_0
    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Landroid/app/Activity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 108
    return-void

    .line 99
    .end local v0    # "i":Landroid/content/Intent;
    .restart local p1    # "pw":Lcom/keepassdroid/database/PwGroup;
    :cond_0
    instance-of v1, p1, Lcom/keepassdroid/database/PwGroupV4;

    if-eqz v1, :cond_1

    .line 100
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/keepassdroid/EntryEditActivityV4;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 101
    .restart local v0    # "i":Landroid/content/Intent;
    const-string v1, "parent"

    check-cast p1, Lcom/keepassdroid/database/PwGroupV4;

    .end local p1    # "pw":Lcom/keepassdroid/database/PwGroup;
    invoke-static {v0, v1, p1}, Lcom/keepassdroid/EntryEditActivityV4;->putParentId(Landroid/content/Intent;Ljava/lang/String;Lcom/keepassdroid/database/PwGroupV4;)V

    goto :goto_0

    .line 104
    .end local v0    # "i":Landroid/content/Intent;
    .restart local p1    # "pw":Lcom/keepassdroid/database/PwGroup;
    :cond_1
    new-instance v1, Ljava/lang/RuntimeException;

    const-string v2, "Not yet implemented."

    invoke-direct {v1, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method private populateText(ILjava/lang/String;)V
    .locals 1
    .param p1, "viewId"    # I
    .param p2, "text"    # Ljava/lang/String;

    .prologue
    .line 371
    invoke-virtual {p0, p1}, Lcom/keepassdroid/EntryEditActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    .line 372
    .local v0, "tv":Landroid/widget/TextView;
    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 373
    return-void
.end method

.method private setPasswordStyle()V
    .locals 5

    .prologue
    const/16 v4, 0x91

    const/16 v3, 0x81

    .line 341
    const v2, 0x7f0b0021

    invoke-virtual {p0, v2}, Lcom/keepassdroid/EntryEditActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    .line 342
    .local v1, "password":Landroid/widget/TextView;
    const v2, 0x7f0b0024

    invoke-virtual {p0, v2}, Lcom/keepassdroid/EntryEditActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    .line 344
    .local v0, "confpassword":Landroid/widget/TextView;
    iget-boolean v2, p0, Lcom/keepassdroid/EntryEditActivity;->mShowPassword:Z

    if-eqz v2, :cond_0

    .line 345
    invoke-virtual {v1, v4}, Landroid/widget/TextView;->setInputType(I)V

    .line 346
    invoke-virtual {v0, v4}, Landroid/widget/TextView;->setInputType(I)V

    .line 352
    :goto_0
    return-void

    .line 349
    :cond_0
    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setInputType(I)V

    .line 350
    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setInputType(I)V

    goto :goto_0
.end method


# virtual methods
.method protected fillData()V
    .locals 5

    .prologue
    .line 355
    const v2, 0x7f0b0016

    invoke-virtual {p0, v2}, Lcom/keepassdroid/EntryEditActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageButton;

    .line 356
    .local v0, "currIconButton":Landroid/widget/ImageButton;
    invoke-static {}, Lcom/keepassdroid/app/App;->getDB()Lcom/keepassdroid/Database;

    move-result-object v2

    iget-object v2, v2, Lcom/keepassdroid/Database;->drawFactory:Lcom/keepassdroid/icons/DrawableFactory;

    invoke-virtual {p0}, Lcom/keepassdroid/EntryEditActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    iget-object v4, p0, Lcom/keepassdroid/EntryEditActivity;->mEntry:Lcom/keepassdroid/database/PwEntry;

    invoke-virtual {v4}, Lcom/keepassdroid/database/PwEntry;->getIcon()Lcom/keepassdroid/database/PwIcon;

    move-result-object v4

    invoke-virtual {v2, v0, v3, v4}, Lcom/keepassdroid/icons/DrawableFactory;->assignDrawableTo(Landroid/widget/ImageView;Landroid/content/res/Resources;Lcom/keepassdroid/database/PwIcon;)V

    .line 358
    const v2, 0x7f0b0017

    iget-object v3, p0, Lcom/keepassdroid/EntryEditActivity;->mEntry:Lcom/keepassdroid/database/PwEntry;

    invoke-virtual {v3}, Lcom/keepassdroid/database/PwEntry;->getTitle()Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v2, v3}, Lcom/keepassdroid/EntryEditActivity;->populateText(ILjava/lang/String;)V

    .line 359
    const v2, 0x7f0b001a

    iget-object v3, p0, Lcom/keepassdroid/EntryEditActivity;->mEntry:Lcom/keepassdroid/database/PwEntry;

    invoke-virtual {v3}, Lcom/keepassdroid/database/PwEntry;->getUsername()Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v2, v3}, Lcom/keepassdroid/EntryEditActivity;->populateText(ILjava/lang/String;)V

    .line 360
    const v2, 0x7f0b001d

    iget-object v3, p0, Lcom/keepassdroid/EntryEditActivity;->mEntry:Lcom/keepassdroid/database/PwEntry;

    invoke-virtual {v3}, Lcom/keepassdroid/database/PwEntry;->getUrl()Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v2, v3}, Lcom/keepassdroid/EntryEditActivity;->populateText(ILjava/lang/String;)V

    .line 362
    new-instance v1, Ljava/lang/String;

    iget-object v2, p0, Lcom/keepassdroid/EntryEditActivity;->mEntry:Lcom/keepassdroid/database/PwEntry;

    invoke-virtual {v2}, Lcom/keepassdroid/database/PwEntry;->getPassword()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    .line 363
    .local v1, "password":Ljava/lang/String;
    const v2, 0x7f0b0021

    invoke-direct {p0, v2, v1}, Lcom/keepassdroid/EntryEditActivity;->populateText(ILjava/lang/String;)V

    .line 364
    const v2, 0x7f0b0024

    invoke-direct {p0, v2, v1}, Lcom/keepassdroid/EntryEditActivity;->populateText(ILjava/lang/String;)V

    .line 365
    invoke-direct {p0}, Lcom/keepassdroid/EntryEditActivity;->setPasswordStyle()V

    .line 367
    const v2, 0x7f0b0027

    iget-object v3, p0, Lcom/keepassdroid/EntryEditActivity;->mEntry:Lcom/keepassdroid/database/PwEntry;

    invoke-virtual {v3}, Lcom/keepassdroid/database/PwEntry;->getNotes()Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v2, v3}, Lcom/keepassdroid/EntryEditActivity;->populateText(ILjava/lang/String;)V

    .line 368
    return-void
.end method

.method protected abstract getParentGroupId(Landroid/content/Intent;Ljava/lang/String;)Lcom/keepassdroid/database/PwGroupId;
.end method

.method protected onActivityResult(IILandroid/content/Intent;)V
    .locals 6
    .param p1, "requestCode"    # I
    .param p2, "resultCode"    # I
    .param p3, "data"    # Landroid/content/Intent;

    .prologue
    .line 273
    packed-switch p2, :pswitch_data_0

    .line 294
    :goto_0
    return-void

    .line 276
    :pswitch_0
    invoke-virtual {p3}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v4

    const-string v5, "icon_id"

    invoke-virtual {v4, v5}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v4

    iput v4, p0, Lcom/keepassdroid/EntryEditActivity;->mSelectedIconID:I

    .line 277
    const v4, 0x7f0b0016

    invoke-virtual {p0, v4}, Lcom/keepassdroid/EntryEditActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageButton;

    .line 278
    .local v1, "currIconButton":Landroid/widget/ImageButton;
    iget v4, p0, Lcom/keepassdroid/EntryEditActivity;->mSelectedIconID:I

    invoke-static {v4}, Lcom/keepassdroid/icons/Icons;->iconToResId(I)I

    move-result v4

    invoke-virtual {v1, v4}, Landroid/widget/ImageButton;->setImageResource(I)V

    goto :goto_0

    .line 282
    .end local v1    # "currIconButton":Landroid/widget/ImageButton;
    :pswitch_1
    const-string v4, "com.keepassdroid.password.generated_password"

    invoke-virtual {p3, v4}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 283
    .local v2, "generatedPassword":Ljava/lang/String;
    const v4, 0x7f0b0021

    invoke-virtual {p0, v4}, Lcom/keepassdroid/EntryEditActivity;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/EditText;

    .line 284
    .local v3, "password":Landroid/widget/EditText;
    const v4, 0x7f0b0024

    invoke-virtual {p0, v4}, Lcom/keepassdroid/EntryEditActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    .line 286
    .local v0, "confPassword":Landroid/widget/EditText;
    invoke-virtual {v3, v2}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 287
    invoke-virtual {v0, v2}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0

    .line 273
    :pswitch_data_0
    .packed-switch 0x3e8
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 20
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 114
    invoke-static/range {p0 .. p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v12

    .line 115
    .local v12, "prefs":Landroid/content/SharedPreferences;
    const v17, 0x7f0600c1

    move-object/from16 v0, p0

    move/from16 v1, v17

    invoke-virtual {v0, v1}, Lcom/keepassdroid/EntryEditActivity;->getString(I)Ljava/lang/String;

    move-result-object v17

    invoke-virtual/range {p0 .. p0}, Lcom/keepassdroid/EntryEditActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v18

    const v19, 0x7f080001

    invoke-virtual/range {v18 .. v19}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v18

    move-object/from16 v0, v17

    move/from16 v1, v18

    invoke-interface {v12, v0, v1}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v17

    if-nez v17, :cond_1

    const/16 v17, 0x1

    :goto_0
    move/from16 v0, v17

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/keepassdroid/EntryEditActivity;->mShowPassword:Z

    .line 117
    invoke-super/range {p0 .. p1}, Lcom/keepassdroid/LockCloseHideActivity;->onCreate(Landroid/os/Bundle;)V

    .line 118
    const v17, 0x7f030003

    move-object/from16 v0, p0

    move/from16 v1, v17

    invoke-virtual {v0, v1}, Lcom/keepassdroid/EntryEditActivity;->setContentView(I)V

    .line 119
    const/16 v17, 0x0

    move-object/from16 v0, p0

    move/from16 v1, v17

    invoke-virtual {v0, v1}, Lcom/keepassdroid/EntryEditActivity;->setResult(I)V

    .line 122
    invoke-static {}, Lcom/keepassdroid/app/App;->getDB()Lcom/keepassdroid/Database;

    move-result-object v4

    .line 123
    .local v4, "db":Lcom/keepassdroid/Database;
    invoke-virtual {v4}, Lcom/keepassdroid/Database;->Loaded()Z

    move-result v17

    if-nez v17, :cond_2

    .line 124
    invoke-virtual/range {p0 .. p0}, Lcom/keepassdroid/EntryEditActivity;->finish()V

    .line 221
    :cond_0
    :goto_1
    return-void

    .line 115
    .end local v4    # "db":Lcom/keepassdroid/Database;
    :cond_1
    const/16 v17, 0x0

    goto :goto_0

    .line 128
    .restart local v4    # "db":Lcom/keepassdroid/Database;
    :cond_2
    invoke-virtual/range {p0 .. p0}, Lcom/keepassdroid/EntryEditActivity;->getIntent()Landroid/content/Intent;

    move-result-object v6

    .line 129
    .local v6, "i":Landroid/content/Intent;
    const-string v17, "entry"

    move-object/from16 v0, v17

    invoke-virtual {v6, v0}, Landroid/content/Intent;->getByteArrayExtra(Ljava/lang/String;)[B

    move-result-object v16

    .line 131
    .local v16, "uuidBytes":[B
    iget-object v11, v4, Lcom/keepassdroid/Database;->pm:Lcom/keepassdroid/database/PwDatabase;

    .line 132
    .local v11, "pm":Lcom/keepassdroid/database/PwDatabase;
    if-nez v16, :cond_3

    .line 134
    const-string v17, "parent"

    move-object/from16 v0, p0

    move-object/from16 v1, v17

    invoke-virtual {v0, v6, v1}, Lcom/keepassdroid/EntryEditActivity;->getParentGroupId(Landroid/content/Intent;Ljava/lang/String;)Lcom/keepassdroid/database/PwGroupId;

    move-result-object v9

    .line 135
    .local v9, "parentId":Lcom/keepassdroid/database/PwGroupId;
    iget-object v0, v11, Lcom/keepassdroid/database/PwDatabase;->groups:Ljava/util/Map;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    invoke-interface {v0, v9}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/keepassdroid/database/PwGroup;

    .line 136
    .local v8, "parent":Lcom/keepassdroid/database/PwGroup;
    invoke-static {v8}, Lcom/keepassdroid/database/PwEntry;->getInstance(Lcom/keepassdroid/database/PwGroup;)Lcom/keepassdroid/database/PwEntry;

    move-result-object v17

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/keepassdroid/EntryEditActivity;->mEntry:Lcom/keepassdroid/database/PwEntry;

    .line 137
    const/16 v17, 0x1

    move/from16 v0, v17

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/keepassdroid/EntryEditActivity;->mIsNew:Z

    .line 149
    .end local v8    # "parent":Lcom/keepassdroid/database/PwGroup;
    .end local v9    # "parentId":Lcom/keepassdroid/database/PwGroupId;
    :goto_2
    const v17, 0x7f0b0014

    move-object/from16 v0, p0

    move/from16 v1, v17

    invoke-virtual {v0, v1}, Lcom/keepassdroid/EntryEditActivity;->findViewById(I)Landroid/view/View;

    move-result-object v14

    .line 150
    .local v14, "scrollView":Landroid/view/View;
    const/high16 v17, 0x1000000

    move/from16 v0, v17

    invoke-virtual {v14, v0}, Landroid/view/View;->setScrollBarStyle(I)V

    .line 152
    const v17, 0x7f0b0016

    move-object/from16 v0, p0

    move/from16 v1, v17

    invoke-virtual {v0, v1}, Lcom/keepassdroid/EntryEditActivity;->findViewById(I)Landroid/view/View;

    move-result-object v7

    check-cast v7, Landroid/widget/ImageButton;

    .line 153
    .local v7, "iconButton":Landroid/widget/ImageButton;
    new-instance v17, Lcom/keepassdroid/EntryEditActivity$1;

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Lcom/keepassdroid/EntryEditActivity$1;-><init>(Lcom/keepassdroid/EntryEditActivity;)V

    move-object/from16 v0, v17

    invoke-virtual {v7, v0}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 160
    const v17, 0x7f0b0020

    move-object/from16 v0, p0

    move/from16 v1, v17

    invoke-virtual {v0, v1}, Lcom/keepassdroid/EntryEditActivity;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/Button;

    .line 161
    .local v5, "generatePassword":Landroid/widget/Button;
    new-instance v17, Lcom/keepassdroid/EntryEditActivity$2;

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Lcom/keepassdroid/EntryEditActivity$2;-><init>(Lcom/keepassdroid/EntryEditActivity;)V

    move-object/from16 v0, v17

    invoke-virtual {v5, v0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 169
    const v17, 0x7f0b0011

    move-object/from16 v0, p0

    move/from16 v1, v17

    invoke-virtual {v0, v1}, Lcom/keepassdroid/EntryEditActivity;->findViewById(I)Landroid/view/View;

    move-result-object v13

    check-cast v13, Landroid/widget/Button;

    .line 170
    .local v13, "save":Landroid/widget/Button;
    new-instance v17, Lcom/keepassdroid/EntryEditActivity$3;

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Lcom/keepassdroid/EntryEditActivity$3;-><init>(Lcom/keepassdroid/EntryEditActivity;)V

    move-object/from16 v0, v17

    invoke-virtual {v13, v0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 202
    const v17, 0x7f0b0012

    move-object/from16 v0, p0

    move/from16 v1, v17

    invoke-virtual {v0, v1}, Lcom/keepassdroid/EntryEditActivity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/Button;

    .line 203
    .local v2, "cancel":Landroid/widget/Button;
    new-instance v17, Lcom/keepassdroid/EntryEditActivity$4;

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Lcom/keepassdroid/EntryEditActivity$4;-><init>(Lcom/keepassdroid/EntryEditActivity;)V

    move-object/from16 v0, v17

    invoke-virtual {v2, v0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 213
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/keepassdroid/EntryEditActivity;->mShowPassword:Z

    move/from16 v17, v0

    if-eqz v17, :cond_0

    .line 214
    const v17, 0x7f0b0021

    move-object/from16 v0, p0

    move/from16 v1, v17

    invoke-virtual {v0, v1}, Lcom/keepassdroid/EntryEditActivity;->findViewById(I)Landroid/view/View;

    move-result-object v10

    check-cast v10, Landroid/widget/EditText;

    .line 215
    .local v10, "pass":Landroid/widget/EditText;
    const v17, 0x7f0b0024

    move-object/from16 v0, p0

    move/from16 v1, v17

    invoke-virtual {v0, v1}, Lcom/keepassdroid/EntryEditActivity;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/EditText;

    .line 217
    .local v3, "conf":Landroid/widget/EditText;
    const/16 v17, 0x91

    move/from16 v0, v17

    invoke-virtual {v10, v0}, Landroid/widget/EditText;->setInputType(I)V

    .line 218
    const/16 v17, 0x91

    move/from16 v0, v17

    invoke-virtual {v3, v0}, Landroid/widget/EditText;->setInputType(I)V

    goto/16 :goto_1

    .line 140
    .end local v2    # "cancel":Landroid/widget/Button;
    .end local v3    # "conf":Landroid/widget/EditText;
    .end local v5    # "generatePassword":Landroid/widget/Button;
    .end local v7    # "iconButton":Landroid/widget/ImageButton;
    .end local v10    # "pass":Landroid/widget/EditText;
    .end local v13    # "save":Landroid/widget/Button;
    .end local v14    # "scrollView":Landroid/view/View;
    :cond_3
    invoke-static/range {v16 .. v16}, Lcom/keepassdroid/utils/Types;->bytestoUUID([B)Ljava/util/UUID;

    move-result-object v15

    .line 141
    .local v15, "uuid":Ljava/util/UUID;
    sget-boolean v17, Lcom/keepassdroid/EntryEditActivity;->$assertionsDisabled:Z

    if-nez v17, :cond_4

    if-nez v15, :cond_4

    new-instance v17, Ljava/lang/AssertionError;

    invoke-direct/range {v17 .. v17}, Ljava/lang/AssertionError;-><init>()V

    throw v17

    .line 143
    :cond_4
    iget-object v0, v11, Lcom/keepassdroid/database/PwDatabase;->entries:Ljava/util/Map;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    invoke-interface {v0, v15}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v17

    check-cast v17, Lcom/keepassdroid/database/PwEntry;

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/keepassdroid/EntryEditActivity;->mEntry:Lcom/keepassdroid/database/PwEntry;

    .line 144
    const/16 v17, 0x0

    move/from16 v0, v17

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/keepassdroid/EntryEditActivity;->mIsNew:Z

    .line 146
    invoke-virtual/range {p0 .. p0}, Lcom/keepassdroid/EntryEditActivity;->fillData()V

    goto/16 :goto_2
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;)Z
    .locals 3
    .param p1, "menu"    # Landroid/view/Menu;

    .prologue
    .line 298
    invoke-super {p0, p1}, Lcom/keepassdroid/LockCloseHideActivity;->onCreateOptionsMenu(Landroid/view/Menu;)Z

    .line 300
    invoke-virtual {p0}, Lcom/keepassdroid/EntryEditActivity;->getMenuInflater()Landroid/view/MenuInflater;

    move-result-object v0

    .line 301
    .local v0, "inflater":Landroid/view/MenuInflater;
    const v2, 0x7f0a0001

    invoke-virtual {v0, v2, p1}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    .line 304
    const v2, 0x7f0b0073

    invoke-interface {p1, v2}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v1

    .line 305
    .local v1, "togglePassword":Landroid/view/MenuItem;
    iget-boolean v2, p0, Lcom/keepassdroid/EntryEditActivity;->mShowPassword:Z

    if-eqz v2, :cond_0

    .line 306
    const v2, 0x7f06006a

    invoke-interface {v1, v2}, Landroid/view/MenuItem;->setTitle(I)Landroid/view/MenuItem;

    .line 311
    :goto_0
    const/4 v2, 0x1

    return v2

    .line 308
    :cond_0
    const v2, 0x7f060070

    invoke-interface {v1, v2}, Landroid/view/MenuItem;->setTitle(I)Landroid/view/MenuItem;

    goto :goto_0
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 4
    .param p1, "item"    # Landroid/view/MenuItem;

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x1

    .line 315
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v3

    packed-switch v3, :pswitch_data_0

    .line 337
    invoke-super {p0, p1}, Lcom/keepassdroid/LockCloseHideActivity;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result v1

    :goto_0
    return v1

    .line 318
    :pswitch_0
    const v3, 0x7f0600b6

    :try_start_0
    invoke-static {p0, v3}, Lcom/keepassdroid/utils/Util;->gotoUrl(Landroid/content/Context;I)V
    :try_end_0
    .catch Landroid/content/ActivityNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 319
    :catch_0
    move-exception v0

    .line 320
    .local v0, "e":Landroid/content/ActivityNotFoundException;
    const v3, 0x7f06003a

    invoke-static {p0, v3, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    move v1, v2

    .line 321
    goto :goto_0

    .line 326
    .end local v0    # "e":Landroid/content/ActivityNotFoundException;
    :pswitch_1
    iget-boolean v3, p0, Lcom/keepassdroid/EntryEditActivity;->mShowPassword:Z

    if-eqz v3, :cond_0

    .line 327
    const v3, 0x7f060070

    invoke-interface {p1, v3}, Landroid/view/MenuItem;->setTitle(I)Landroid/view/MenuItem;

    .line 328
    iput-boolean v2, p0, Lcom/keepassdroid/EntryEditActivity;->mShowPassword:Z

    .line 333
    :goto_1
    invoke-direct {p0}, Lcom/keepassdroid/EntryEditActivity;->setPasswordStyle()V

    goto :goto_0

    .line 330
    :cond_0
    const v2, 0x7f06006a

    invoke-interface {p1, v2}, Landroid/view/MenuItem;->setTitle(I)Landroid/view/MenuItem;

    .line 331
    iput-boolean v1, p0, Lcom/keepassdroid/EntryEditActivity;->mShowPassword:Z

    goto :goto_1

    .line 315
    nop

    :pswitch_data_0
    .packed-switch 0x7f0b0072
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method protected populateNewEntry()Lcom/keepassdroid/database/PwEntry;
    .locals 1

    .prologue
    .line 243
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/keepassdroid/EntryEditActivity;->populateNewEntry(Lcom/keepassdroid/database/PwEntry;)Lcom/keepassdroid/database/PwEntry;

    move-result-object v0

    return-object v0
.end method

.method protected populateNewEntry(Lcom/keepassdroid/database/PwEntry;)Lcom/keepassdroid/database/PwEntry;
    .locals 5
    .param p1, "entry"    # Lcom/keepassdroid/database/PwEntry;

    .prologue
    .line 248
    if-nez p1, :cond_0

    .line 249
    iget-object v3, p0, Lcom/keepassdroid/EntryEditActivity;->mEntry:Lcom/keepassdroid/database/PwEntry;

    const/4 v4, 0x1

    invoke-virtual {v3, v4}, Lcom/keepassdroid/database/PwEntry;->clone(Z)Lcom/keepassdroid/database/PwEntry;

    move-result-object v1

    .line 256
    .local v1, "newEntry":Lcom/keepassdroid/database/PwEntry;
    :goto_0
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/Calendar;->getTime()Ljava/util/Date;

    move-result-object v2

    .line 257
    .local v2, "now":Ljava/util/Date;
    invoke-virtual {v1, v2}, Lcom/keepassdroid/database/PwEntry;->setLastAccessTime(Ljava/util/Date;)V

    .line 258
    invoke-virtual {v1, v2}, Lcom/keepassdroid/database/PwEntry;->setLastModificationTime(Ljava/util/Date;)V

    .line 260
    invoke-static {}, Lcom/keepassdroid/app/App;->getDB()Lcom/keepassdroid/Database;

    move-result-object v3

    iget-object v0, v3, Lcom/keepassdroid/Database;->pm:Lcom/keepassdroid/database/PwDatabase;

    .line 261
    .local v0, "db":Lcom/keepassdroid/database/PwDatabase;
    const v3, 0x7f0b0017

    invoke-static {p0, v3}, Lcom/keepassdroid/utils/Util;->getEditText(Landroid/app/Activity;I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3, v0}, Lcom/keepassdroid/database/PwEntry;->setTitle(Ljava/lang/String;Lcom/keepassdroid/database/PwDatabase;)V

    .line 262
    const v3, 0x7f0b001d

    invoke-static {p0, v3}, Lcom/keepassdroid/utils/Util;->getEditText(Landroid/app/Activity;I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3, v0}, Lcom/keepassdroid/database/PwEntry;->setUrl(Ljava/lang/String;Lcom/keepassdroid/database/PwDatabase;)V

    .line 263
    const v3, 0x7f0b001a

    invoke-static {p0, v3}, Lcom/keepassdroid/utils/Util;->getEditText(Landroid/app/Activity;I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3, v0}, Lcom/keepassdroid/database/PwEntry;->setUsername(Ljava/lang/String;Lcom/keepassdroid/database/PwDatabase;)V

    .line 264
    const v3, 0x7f0b0027

    invoke-static {p0, v3}, Lcom/keepassdroid/utils/Util;->getEditText(Landroid/app/Activity;I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3, v0}, Lcom/keepassdroid/database/PwEntry;->setNotes(Ljava/lang/String;Lcom/keepassdroid/database/PwDatabase;)V

    .line 265
    const v3, 0x7f0b0021

    invoke-static {p0, v3}, Lcom/keepassdroid/utils/Util;->getEditText(Landroid/app/Activity;I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3, v0}, Lcom/keepassdroid/database/PwEntry;->setPassword(Ljava/lang/String;Lcom/keepassdroid/database/PwDatabase;)V

    .line 267
    return-object v1

    .line 252
    .end local v0    # "db":Lcom/keepassdroid/database/PwDatabase;
    .end local v1    # "newEntry":Lcom/keepassdroid/database/PwEntry;
    .end local v2    # "now":Ljava/util/Date;
    :cond_0
    move-object v1, p1

    .restart local v1    # "newEntry":Lcom/keepassdroid/database/PwEntry;
    goto :goto_0
.end method

.method protected validateBeforeSaving()Z
    .locals 6

    .prologue
    const/4 v3, 0x0

    const/4 v4, 0x1

    .line 225
    const v5, 0x7f0b0017

    invoke-static {p0, v5}, Lcom/keepassdroid/utils/Util;->getEditText(Landroid/app/Activity;I)Ljava/lang/String;

    move-result-object v2

    .line 226
    .local v2, "title":Ljava/lang/String;
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v5

    if-nez v5, :cond_0

    .line 227
    const v5, 0x7f060046

    invoke-static {p0, v5, v4}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v4

    invoke-virtual {v4}, Landroid/widget/Toast;->show()V

    .line 239
    :goto_0
    return v3

    .line 232
    :cond_0
    const v5, 0x7f0b0021

    invoke-static {p0, v5}, Lcom/keepassdroid/utils/Util;->getEditText(Landroid/app/Activity;I)Ljava/lang/String;

    move-result-object v1

    .line 233
    .local v1, "pass":Ljava/lang/String;
    const v5, 0x7f0b0024

    invoke-static {p0, v5}, Lcom/keepassdroid/utils/Util;->getEditText(Landroid/app/Activity;I)Ljava/lang/String;

    move-result-object v0

    .line 234
    .local v0, "conf":Ljava/lang/String;
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_1

    .line 235
    const v5, 0x7f060043

    invoke-static {p0, v5, v4}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v4

    invoke-virtual {v4}, Landroid/widget/Toast;->show()V

    goto :goto_0

    :cond_1
    move v3, v4

    .line 239
    goto :goto_0
.end method
