.class public Lcom/keepassdroid/fileselect/FileSelectActivity;
.super Landroid/app/ListActivity;
.source "FileSelectActivity.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/keepassdroid/fileselect/FileSelectActivity$CollectPassword;,
        Lcom/keepassdroid/fileselect/FileSelectActivity$LaunchGroupActivity;
    }
.end annotation


# static fields
.field private static final CMENU_CLEAR:I = 0x1

.field public static final FILE_BROWSE:I = 0x1

.field public static final GET_CONTENT:I = 0x2

.field public static final OPEN_DOC:I = 0x3


# instance fields
.field private fileHistory:Lcom/keepassdroid/fileselect/RecentFileHistory;

.field private recentMode:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 70
    invoke-direct {p0}, Landroid/app/ListActivity;-><init>()V

    .line 80
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/keepassdroid/fileselect/FileSelectActivity;->recentMode:Z

    return-void
.end method

.method static synthetic access$000(Lcom/keepassdroid/fileselect/FileSelectActivity;)Lcom/keepassdroid/fileselect/RecentFileHistory;
    .locals 1
    .param p0, "x0"    # Lcom/keepassdroid/fileselect/FileSelectActivity;

    .prologue
    .line 70
    iget-object v0, p0, Lcom/keepassdroid/fileselect/FileSelectActivity;->fileHistory:Lcom/keepassdroid/fileselect/RecentFileHistory;

    return-object v0
.end method

.method static synthetic access$100(Lcom/keepassdroid/fileselect/FileSelectActivity;)V
    .locals 0
    .param p0, "x0"    # Lcom/keepassdroid/fileselect/FileSelectActivity;

    .prologue
    .line 70
    invoke-direct {p0}, Lcom/keepassdroid/fileselect/FileSelectActivity;->refreshList()V

    return-void
.end method

.method private fillData()V
    .locals 5

    .prologue
    const v4, 0x7f0b0040

    .line 307
    invoke-virtual {p0, v4}, Lcom/keepassdroid/fileselect/FileSelectActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/EditText;

    .line 308
    .local v1, "filename":Landroid/widget/EditText;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v3

    invoke-virtual {v3}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const v3, 0x7f0600b5

    invoke-virtual {p0, v3}, Lcom/keepassdroid/fileselect/FileSelectActivity;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 310
    new-instance v0, Landroid/widget/ArrayAdapter;

    const v2, 0x7f03000a

    iget-object v3, p0, Lcom/keepassdroid/fileselect/FileSelectActivity;->fileHistory:Lcom/keepassdroid/fileselect/RecentFileHistory;

    invoke-virtual {v3}, Lcom/keepassdroid/fileselect/RecentFileHistory;->getDbList()Ljava/util/List;

    move-result-object v3

    invoke-direct {v0, p0, v2, v4, v3}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;IILjava/util/List;)V

    .line 311
    .local v0, "adapter":Landroid/widget/ArrayAdapter;, "Landroid/widget/ArrayAdapter<Ljava/lang/String;>;"
    invoke-virtual {p0, v0}, Lcom/keepassdroid/fileselect/FileSelectActivity;->setListAdapter(Landroid/widget/ListAdapter;)V

    .line 312
    return-void
.end method

.method private refreshList()V
    .locals 1

    .prologue
    .line 468
    invoke-virtual {p0}, Lcom/keepassdroid/fileselect/FileSelectActivity;->getListAdapter()Landroid/widget/ListAdapter;

    move-result-object v0

    check-cast v0, Landroid/widget/ArrayAdapter;

    .line 469
    .local v0, "adapter":Landroid/widget/ArrayAdapter;, "Landroid/widget/ArrayAdapter<Ljava/lang/String;>;"
    invoke-virtual {v0}, Landroid/widget/ArrayAdapter;->notifyDataSetChanged()V

    .line 470
    return-void
.end method


# virtual methods
.method protected onActivityResult(IILandroid/content/Intent;)V
    .locals 6
    .param p1, "requestCode"    # I
    .param p2, "resultCode"    # I
    .param p3, "data"    # Landroid/content/Intent;

    .prologue
    const/4 v5, 0x2

    const/4 v4, -0x1

    .line 346
    invoke-super {p0, p1, p2, p3}, Landroid/app/ListActivity;->onActivityResult(IILandroid/content/Intent;)V

    .line 348
    invoke-direct {p0}, Lcom/keepassdroid/fileselect/FileSelectActivity;->fillData()V

    .line 350
    const/4 v0, 0x0

    .line 351
    .local v0, "filename":Ljava/lang/String;
    const/4 v3, 0x1

    if-ne p1, v3, :cond_3

    if-ne p2, v4, :cond_3

    .line 352
    invoke-virtual {p3}, Landroid/content/Intent;->getDataString()Ljava/lang/String;

    move-result-object v0

    .line 353
    if-eqz v0, :cond_1

    .line 354
    const-string v3, "file://"

    invoke-virtual {v0, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 355
    const/4 v3, 0x7

    invoke-virtual {v0, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    .line 358
    :cond_0
    invoke-static {v0}, Ljava/net/URLDecoder;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 374
    :cond_1
    :goto_0
    if-eqz v0, :cond_2

    .line 375
    const v3, 0x7f0b0040

    invoke-virtual {p0, v3}, Lcom/keepassdroid/fileselect/FileSelectActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/EditText;

    .line 376
    .local v1, "fn":Landroid/widget/EditText;
    invoke-virtual {v1, v0}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 378
    .end local v1    # "fn":Landroid/widget/EditText;
    :cond_2
    return-void

    .line 362
    :cond_3
    if-eq p1, v5, :cond_4

    const/4 v3, 0x3

    if-ne p1, v3, :cond_1

    :cond_4
    if-ne p2, v4, :cond_1

    .line 363
    if-eqz p3, :cond_1

    .line 364
    invoke-virtual {p3}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v2

    .line 365
    .local v2, "uri":Landroid/net/Uri;
    if-eqz v2, :cond_1

    .line 366
    if-ne p1, v5, :cond_5

    .line 367
    invoke-static {p0, v2}, Lcom/keepassdroid/utils/UriUtil;->translate(Landroid/content/Context;Landroid/net/Uri;)Landroid/net/Uri;

    move-result-object v2

    .line 369
    :cond_5
    invoke-virtual {v2}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public onContextItemSelected(Landroid/view/MenuItem;)Z
    .locals 7
    .param p1, "item"    # Landroid/view/MenuItem;

    .prologue
    const/4 v4, 0x0

    const/4 v3, 0x1

    .line 442
    invoke-super {p0, p1}, Landroid/app/ListActivity;->onContextItemSelected(Landroid/view/MenuItem;)Z

    .line 444
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v5

    if-ne v5, v3, :cond_0

    .line 445
    invoke-interface {p1}, Landroid/view/MenuItem;->getMenuInfo()Landroid/view/ContextMenu$ContextMenuInfo;

    move-result-object v0

    check-cast v0, Landroid/widget/AdapterView$AdapterContextMenuInfo;

    .line 447
    .local v0, "acmi":Landroid/widget/AdapterView$AdapterContextMenuInfo;
    iget-object v2, v0, Landroid/widget/AdapterView$AdapterContextMenuInfo;->targetView:Landroid/view/View;

    check-cast v2, Landroid/widget/TextView;

    .line 448
    .local v2, "tv":Landroid/widget/TextView;
    invoke-virtual {v2}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v5

    invoke-interface {v5}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v1

    .line 449
    .local v1, "filename":Ljava/lang/String;
    new-instance v5, Lcom/keepassdroid/fileselect/FileSelectActivity$5;

    invoke-direct {v5, p0}, Lcom/keepassdroid/fileselect/FileSelectActivity$5;-><init>(Lcom/keepassdroid/fileselect/FileSelectActivity;)V

    new-array v6, v3, [Ljava/lang/String;

    aput-object v1, v6, v4

    .line 459
    invoke-virtual {v5, v6}, Lcom/keepassdroid/fileselect/FileSelectActivity$5;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 463
    .end local v0    # "acmi":Landroid/widget/AdapterView$AdapterContextMenuInfo;
    .end local v1    # "filename":Ljava/lang/String;
    .end local v2    # "tv":Landroid/widget/TextView;
    :goto_0
    return v3

    :cond_0
    move v3, v4

    goto :goto_0
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 11
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 84
    invoke-super {p0, p1}, Landroid/app/ListActivity;->onCreate(Landroid/os/Bundle;)V

    .line 86
    invoke-static {}, Lcom/keepassdroid/app/App;->getFileHistory()Lcom/keepassdroid/fileselect/RecentFileHistory;

    move-result-object v9

    iput-object v9, p0, Lcom/keepassdroid/fileselect/FileSelectActivity;->fileHistory:Lcom/keepassdroid/fileselect/RecentFileHistory;

    .line 88
    iget-object v9, p0, Lcom/keepassdroid/fileselect/FileSelectActivity;->fileHistory:Lcom/keepassdroid/fileselect/RecentFileHistory;

    invoke-virtual {v9}, Lcom/keepassdroid/fileselect/RecentFileHistory;->hasRecentFiles()Z

    move-result v9

    if-eqz v9, :cond_1

    .line 89
    const/4 v9, 0x1

    iput-boolean v9, p0, Lcom/keepassdroid/fileselect/FileSelectActivity;->recentMode:Z

    .line 90
    const v9, 0x7f03000b

    invoke-virtual {p0, v9}, Lcom/keepassdroid/fileselect/FileSelectActivity;->setContentView(I)V

    .line 96
    :goto_0
    const v9, 0x7f0b0046

    invoke-virtual {p0, v9}, Lcom/keepassdroid/fileselect/FileSelectActivity;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/Button;

    .line 97
    .local v5, "openButton":Landroid/widget/Button;
    new-instance v9, Lcom/keepassdroid/fileselect/FileSelectActivity$1;

    invoke-direct {v9, p0}, Lcom/keepassdroid/fileselect/FileSelectActivity$1;-><init>(Lcom/keepassdroid/fileselect/FileSelectActivity;)V

    invoke-virtual {v5, v9}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 119
    const v9, 0x7f0b0047

    invoke-virtual {p0, v9}, Lcom/keepassdroid/fileselect/FileSelectActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/Button;

    .line 120
    .local v1, "createButton":Landroid/widget/Button;
    new-instance v9, Lcom/keepassdroid/fileselect/FileSelectActivity$2;

    invoke-direct {v9, p0}, Lcom/keepassdroid/fileselect/FileSelectActivity$2;-><init>(Lcom/keepassdroid/fileselect/FileSelectActivity;)V

    invoke-virtual {v1, v9}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 190
    const v9, 0x7f0b0045

    invoke-virtual {p0, v9}, Lcom/keepassdroid/fileselect/FileSelectActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageButton;

    .line 191
    .local v0, "browseButton":Landroid/widget/ImageButton;
    new-instance v9, Lcom/keepassdroid/fileselect/FileSelectActivity$3;

    invoke-direct {v9, p0}, Lcom/keepassdroid/fileselect/FileSelectActivity$3;-><init>(Lcom/keepassdroid/fileselect/FileSelectActivity;)V

    invoke-virtual {v0, v9}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 237
    invoke-direct {p0}, Lcom/keepassdroid/fileselect/FileSelectActivity;->fillData()V

    .line 239
    invoke-virtual {p0}, Lcom/keepassdroid/fileselect/FileSelectActivity;->getListView()Landroid/widget/ListView;

    move-result-object v9

    invoke-virtual {p0, v9}, Lcom/keepassdroid/fileselect/FileSelectActivity;->registerForContextMenu(Landroid/view/View;)V

    .line 242
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v7

    .line 243
    .local v7, "prefs":Landroid/content/SharedPreferences;
    const-string v9, "defaultFileName"

    const-string v10, ""

    invoke-interface {v7, v9, v10}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 245
    .local v4, "fileName":Ljava/lang/String;
    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v9

    if-lez v9, :cond_0

    .line 246
    invoke-static {v4}, Lcom/keepassdroid/utils/UriUtil;->parseDefaultFile(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v3

    .line 247
    .local v3, "dbUri":Landroid/net/Uri;
    invoke-virtual {v3}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v8

    .line 249
    .local v8, "scheme":Ljava/lang/String;
    invoke-static {v8}, Lcom/keepassdroid/utils/EmptyUtils;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v9

    if-nez v9, :cond_2

    const-string v9, "file"

    invoke-virtual {v8, v9}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_2

    .line 250
    invoke-virtual {v3}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v6

    .line 251
    .local v6, "path":Ljava/lang/String;
    new-instance v2, Ljava/io/File;

    invoke-direct {v2, v6}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 253
    .local v2, "db":Ljava/io/File;
    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v9

    if-eqz v9, :cond_0

    .line 255
    :try_start_0
    invoke-static {p0, v6}, Lcom/keepassdroid/PasswordActivity;->Launch(Landroid/app/Activity;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 269
    .end local v2    # "db":Ljava/io/File;
    .end local v3    # "dbUri":Landroid/net/Uri;
    .end local v6    # "path":Ljava/lang/String;
    .end local v8    # "scheme":Ljava/lang/String;
    :cond_0
    :goto_1
    return-void

    .line 92
    .end local v0    # "browseButton":Landroid/widget/ImageButton;
    .end local v1    # "createButton":Landroid/widget/Button;
    .end local v4    # "fileName":Ljava/lang/String;
    .end local v5    # "openButton":Landroid/widget/Button;
    .end local v7    # "prefs":Landroid/content/SharedPreferences;
    :cond_1
    const v9, 0x7f03000d

    invoke-virtual {p0, v9}, Lcom/keepassdroid/fileselect/FileSelectActivity;->setContentView(I)V

    goto :goto_0

    .line 263
    .restart local v0    # "browseButton":Landroid/widget/ImageButton;
    .restart local v1    # "createButton":Landroid/widget/Button;
    .restart local v3    # "dbUri":Landroid/net/Uri;
    .restart local v4    # "fileName":Ljava/lang/String;
    .restart local v5    # "openButton":Landroid/widget/Button;
    .restart local v7    # "prefs":Landroid/content/SharedPreferences;
    .restart local v8    # "scheme":Ljava/lang/String;
    :cond_2
    :try_start_1
    invoke-virtual {v3}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {p0, v9}, Lcom/keepassdroid/PasswordActivity;->Launch(Landroid/app/Activity;Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1

    .line 264
    :catch_0
    move-exception v9

    goto :goto_1

    .line 256
    .restart local v2    # "db":Ljava/io/File;
    .restart local v6    # "path":Ljava/lang/String;
    :catch_1
    move-exception v9

    goto :goto_1
.end method

.method public onCreateContextMenu(Landroid/view/ContextMenu;Landroid/view/View;Landroid/view/ContextMenu$ContextMenuInfo;)V
    .locals 3
    .param p1, "menu"    # Landroid/view/ContextMenu;
    .param p2, "v"    # Landroid/view/View;
    .param p3, "menuInfo"    # Landroid/view/ContextMenu$ContextMenuInfo;

    .prologue
    const/4 v2, 0x0

    .line 435
    invoke-super {p0, p1, p2, p3}, Landroid/app/ListActivity;->onCreateContextMenu(Landroid/view/ContextMenu;Landroid/view/View;Landroid/view/ContextMenu$ContextMenuInfo;)V

    .line 437
    const/4 v0, 0x1

    const v1, 0x7f060080

    invoke-interface {p1, v2, v0, v2, v1}, Landroid/view/ContextMenu;->add(IIII)Landroid/view/MenuItem;

    .line 438
    return-void
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;)Z
    .locals 2
    .param p1, "menu"    # Landroid/view/Menu;

    .prologue
    .line 398
    invoke-super {p0, p1}, Landroid/app/ListActivity;->onCreateOptionsMenu(Landroid/view/Menu;)Z

    .line 400
    invoke-virtual {p0}, Lcom/keepassdroid/fileselect/FileSelectActivity;->getMenuInflater()Landroid/view/MenuInflater;

    move-result-object v0

    .line 401
    .local v0, "inflater":Landroid/view/MenuInflater;
    const v1, 0x7f0a0002

    invoke-virtual {v0, v1, p1}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    .line 403
    const/4 v1, 0x1

    return v1
.end method

.method protected onListItemClick(Landroid/widget/ListView;Landroid/view/View;IJ)V
    .locals 4
    .param p1, "l"    # Landroid/widget/ListView;
    .param p2, "v"    # Landroid/view/View;
    .param p3, "position"    # I
    .param p4, "id"    # J

    .prologue
    .line 316
    invoke-super/range {p0 .. p5}, Landroid/app/ListActivity;->onListItemClick(Landroid/widget/ListView;Landroid/view/View;IJ)V

    .line 318
    new-instance v0, Lcom/keepassdroid/fileselect/FileSelectActivity$4;

    invoke-direct {v0, p0}, Lcom/keepassdroid/fileselect/FileSelectActivity$4;-><init>(Lcom/keepassdroid/fileselect/FileSelectActivity;)V

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Integer;

    const/4 v2, 0x0

    .line 341
    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-virtual {v0, v1}, Lcom/keepassdroid/fileselect/FileSelectActivity$4;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 342
    return-void
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 4
    .param p1, "item"    # Landroid/view/MenuItem;

    .prologue
    const/4 v2, 0x1

    .line 408
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v3

    sparse-switch v3, :sswitch_data_0

    .line 429
    invoke-super {p0, p1}, Landroid/app/ListActivity;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result v2

    :goto_0
    return v2

    .line 411
    :sswitch_0
    const v3, 0x7f0600b6

    :try_start_0
    invoke-static {p0, v3}, Lcom/keepassdroid/utils/Util;->gotoUrl(Landroid/content/Context;I)V
    :try_end_0
    .catch Landroid/content/ActivityNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 412
    :catch_0
    move-exception v1

    .line 413
    .local v1, "e":Landroid/content/ActivityNotFoundException;
    const v3, 0x7f06003a

    invoke-static {p0, v3, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v2

    invoke-virtual {v2}, Landroid/widget/Toast;->show()V

    .line 414
    const/4 v2, 0x0

    goto :goto_0

    .line 420
    .end local v1    # "e":Landroid/content/ActivityNotFoundException;
    :sswitch_1
    new-instance v0, Lcom/keepassdroid/AboutDialog;

    invoke-direct {v0, p0}, Lcom/keepassdroid/AboutDialog;-><init>(Landroid/content/Context;)V

    .line 421
    .local v0, "dialog":Lcom/keepassdroid/AboutDialog;
    invoke-virtual {v0}, Lcom/keepassdroid/AboutDialog;->show()V

    goto :goto_0

    .line 425
    .end local v0    # "dialog":Lcom/keepassdroid/AboutDialog;
    :sswitch_2
    invoke-static {p0}, Lcom/keepassdroid/settings/AppSettingsActivity;->Launch(Landroid/content/Context;)V

    goto :goto_0

    .line 408
    :sswitch_data_0
    .sparse-switch
        0x7f0b0072 -> :sswitch_0
        0x7f0b0078 -> :sswitch_2
        0x7f0b0079 -> :sswitch_1
    .end sparse-switch
.end method

.method protected onResume()V
    .locals 4

    .prologue
    .line 382
    invoke-super {p0}, Landroid/app/ListActivity;->onResume()V

    .line 385
    iget-object v2, p0, Lcom/keepassdroid/fileselect/FileSelectActivity;->fileHistory:Lcom/keepassdroid/fileselect/RecentFileHistory;

    invoke-virtual {v2}, Lcom/keepassdroid/fileselect/RecentFileHistory;->hasRecentFiles()Z

    move-result v2

    iget-boolean v3, p0, Lcom/keepassdroid/fileselect/FileSelectActivity;->recentMode:Z

    if-eq v2, v3, :cond_0

    .line 387
    invoke-virtual {p0}, Lcom/keepassdroid/fileselect/FileSelectActivity;->getIntent()Landroid/content/Intent;

    move-result-object v1

    .line 388
    .local v1, "intent":Landroid/content/Intent;
    invoke-virtual {p0, v1}, Lcom/keepassdroid/fileselect/FileSelectActivity;->startActivity(Landroid/content/Intent;)V

    .line 389
    invoke-virtual {p0}, Lcom/keepassdroid/fileselect/FileSelectActivity;->finish()V

    .line 392
    .end local v1    # "intent":Landroid/content/Intent;
    :cond_0
    const v2, 0x7f0b0042

    invoke-virtual {p0, v2}, Lcom/keepassdroid/fileselect/FileSelectActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/keepassdroid/view/FileNameView;

    .line 393
    .local v0, "fnv":Lcom/keepassdroid/view/FileNameView;
    invoke-virtual {v0}, Lcom/keepassdroid/view/FileNameView;->updateExternalStorageWarning()V

    .line 394
    return-void
.end method
