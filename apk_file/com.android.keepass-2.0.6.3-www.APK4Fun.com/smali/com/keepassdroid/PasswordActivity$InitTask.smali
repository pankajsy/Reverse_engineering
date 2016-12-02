.class Lcom/keepassdroid/PasswordActivity$InitTask;
.super Landroid/os/AsyncTask;
.source "PasswordActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/keepassdroid/PasswordActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "InitTask"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask",
        "<",
        "Landroid/content/Intent;",
        "Ljava/lang/Void;",
        "Ljava/lang/Integer;",
        ">;"
    }
.end annotation


# instance fields
.field launch_immediately:Z

.field password:Ljava/lang/String;

.field final synthetic this$0:Lcom/keepassdroid/PasswordActivity;


# direct methods
.method private constructor <init>(Lcom/keepassdroid/PasswordActivity;)V
    .locals 1

    .prologue
    .line 357
    iput-object p1, p0, Lcom/keepassdroid/PasswordActivity$InitTask;->this$0:Lcom/keepassdroid/PasswordActivity;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    .line 358
    const-string v0, ""

    iput-object v0, p0, Lcom/keepassdroid/PasswordActivity$InitTask;->password:Ljava/lang/String;

    .line 359
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/keepassdroid/PasswordActivity$InitTask;->launch_immediately:Z

    return-void
.end method

.method synthetic constructor <init>(Lcom/keepassdroid/PasswordActivity;Lcom/keepassdroid/PasswordActivity$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/keepassdroid/PasswordActivity;
    .param p2, "x1"    # Lcom/keepassdroid/PasswordActivity$1;

    .prologue
    .line 357
    invoke-direct {p0, p1}, Lcom/keepassdroid/PasswordActivity$InitTask;-><init>(Lcom/keepassdroid/PasswordActivity;)V

    return-void
.end method


# virtual methods
.method protected varargs doInBackground([Landroid/content/Intent;)Ljava/lang/Integer;
    .locals 10
    .param p1, "args"    # [Landroid/content/Intent;

    .prologue
    const v9, 0x7f060035

    const v7, 0x7f060002

    const/4 v8, 0x0

    .line 363
    aget-object v3, p1, v8

    .line 364
    .local v3, "i":Landroid/content/Intent;
    invoke-virtual {v3}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    .line 365
    .local v0, "action":Ljava/lang/String;
    if-eqz v0, :cond_7

    const-string v5, "android.intent.action.VIEW"

    invoke-virtual {v0, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_7

    .line 366
    invoke-virtual {v3}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v4

    .line 367
    .local v4, "incoming":Landroid/net/Uri;
    iget-object v5, p0, Lcom/keepassdroid/PasswordActivity$InitTask;->this$0:Lcom/keepassdroid/PasswordActivity;

    # setter for: Lcom/keepassdroid/PasswordActivity;->mDbUri:Landroid/net/Uri;
    invoke-static {v5, v4}, Lcom/keepassdroid/PasswordActivity;->access$102(Lcom/keepassdroid/PasswordActivity;Landroid/net/Uri;)Landroid/net/Uri;

    .line 369
    iget-object v5, p0, Lcom/keepassdroid/PasswordActivity$InitTask;->this$0:Lcom/keepassdroid/PasswordActivity;

    const-string v6, "keyFile"

    invoke-static {v3, v6}, Lcom/keepassdroid/compat/ClipDataCompat;->getUriFromIntent(Landroid/content/Intent;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v6

    # setter for: Lcom/keepassdroid/PasswordActivity;->mKeyUri:Landroid/net/Uri;
    invoke-static {v5, v6}, Lcom/keepassdroid/PasswordActivity;->access$402(Lcom/keepassdroid/PasswordActivity;Landroid/net/Uri;)Landroid/net/Uri;

    .line 371
    if-nez v4, :cond_0

    .line 372
    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    .line 411
    .end local v4    # "incoming":Landroid/net/Uri;
    :goto_0
    return-object v5

    .line 374
    .restart local v4    # "incoming":Landroid/net/Uri;
    :cond_0
    invoke-virtual {v4}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v5

    const-string v6, "file"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_5

    .line 375
    invoke-virtual {v4}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v2

    .line 377
    .local v2, "fileName":Ljava/lang/String;
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v5

    if-nez v5, :cond_1

    .line 379
    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    goto :goto_0

    .line 382
    :cond_1
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 383
    .local v1, "dbFile":Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v5

    if-nez v5, :cond_2

    .line 385
    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    goto :goto_0

    .line 388
    :cond_2
    iget-object v5, p0, Lcom/keepassdroid/PasswordActivity$InitTask;->this$0:Lcom/keepassdroid/PasswordActivity;

    # getter for: Lcom/keepassdroid/PasswordActivity;->mKeyUri:Landroid/net/Uri;
    invoke-static {v5}, Lcom/keepassdroid/PasswordActivity;->access$400(Lcom/keepassdroid/PasswordActivity;)Landroid/net/Uri;

    move-result-object v5

    if-nez v5, :cond_3

    .line 389
    iget-object v5, p0, Lcom/keepassdroid/PasswordActivity$InitTask;->this$0:Lcom/keepassdroid/PasswordActivity;

    iget-object v6, p0, Lcom/keepassdroid/PasswordActivity$InitTask;->this$0:Lcom/keepassdroid/PasswordActivity;

    iget-object v7, p0, Lcom/keepassdroid/PasswordActivity$InitTask;->this$0:Lcom/keepassdroid/PasswordActivity;

    # getter for: Lcom/keepassdroid/PasswordActivity;->mDbUri:Landroid/net/Uri;
    invoke-static {v7}, Lcom/keepassdroid/PasswordActivity;->access$100(Lcom/keepassdroid/PasswordActivity;)Landroid/net/Uri;

    move-result-object v7

    # invokes: Lcom/keepassdroid/PasswordActivity;->getKeyFile(Landroid/net/Uri;)Landroid/net/Uri;
    invoke-static {v6, v7}, Lcom/keepassdroid/PasswordActivity;->access$500(Lcom/keepassdroid/PasswordActivity;Landroid/net/Uri;)Landroid/net/Uri;

    move-result-object v6

    # setter for: Lcom/keepassdroid/PasswordActivity;->mKeyUri:Landroid/net/Uri;
    invoke-static {v5, v6}, Lcom/keepassdroid/PasswordActivity;->access$402(Lcom/keepassdroid/PasswordActivity;Landroid/net/Uri;)Landroid/net/Uri;

    .line 398
    .end local v1    # "dbFile":Ljava/io/File;
    .end local v2    # "fileName":Ljava/lang/String;
    :cond_3
    :goto_1
    const-string v5, "password"

    invoke-virtual {v3, v5}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    iput-object v5, p0, Lcom/keepassdroid/PasswordActivity$InitTask;->password:Ljava/lang/String;

    .line 399
    const-string v5, "launchImmediately"

    invoke-virtual {v3, v5, v8}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v5

    iput-boolean v5, p0, Lcom/keepassdroid/PasswordActivity$InitTask;->launch_immediately:Z

    .line 411
    .end local v4    # "incoming":Landroid/net/Uri;
    :cond_4
    :goto_2
    const/4 v5, 0x0

    goto :goto_0

    .line 391
    .restart local v4    # "incoming":Landroid/net/Uri;
    :cond_5
    invoke-virtual {v4}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v5

    const-string v6, "content"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_6

    .line 392
    iget-object v5, p0, Lcom/keepassdroid/PasswordActivity$InitTask;->this$0:Lcom/keepassdroid/PasswordActivity;

    # getter for: Lcom/keepassdroid/PasswordActivity;->mKeyUri:Landroid/net/Uri;
    invoke-static {v5}, Lcom/keepassdroid/PasswordActivity;->access$400(Lcom/keepassdroid/PasswordActivity;)Landroid/net/Uri;

    move-result-object v5

    if-nez v5, :cond_3

    .line 393
    iget-object v5, p0, Lcom/keepassdroid/PasswordActivity$InitTask;->this$0:Lcom/keepassdroid/PasswordActivity;

    iget-object v6, p0, Lcom/keepassdroid/PasswordActivity$InitTask;->this$0:Lcom/keepassdroid/PasswordActivity;

    iget-object v7, p0, Lcom/keepassdroid/PasswordActivity$InitTask;->this$0:Lcom/keepassdroid/PasswordActivity;

    # getter for: Lcom/keepassdroid/PasswordActivity;->mDbUri:Landroid/net/Uri;
    invoke-static {v7}, Lcom/keepassdroid/PasswordActivity;->access$100(Lcom/keepassdroid/PasswordActivity;)Landroid/net/Uri;

    move-result-object v7

    # invokes: Lcom/keepassdroid/PasswordActivity;->getKeyFile(Landroid/net/Uri;)Landroid/net/Uri;
    invoke-static {v6, v7}, Lcom/keepassdroid/PasswordActivity;->access$500(Lcom/keepassdroid/PasswordActivity;Landroid/net/Uri;)Landroid/net/Uri;

    move-result-object v6

    # setter for: Lcom/keepassdroid/PasswordActivity;->mKeyUri:Landroid/net/Uri;
    invoke-static {v5, v6}, Lcom/keepassdroid/PasswordActivity;->access$402(Lcom/keepassdroid/PasswordActivity;Landroid/net/Uri;)Landroid/net/Uri;

    goto :goto_1

    .line 396
    :cond_6
    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    goto/16 :goto_0

    .line 402
    .end local v4    # "incoming":Landroid/net/Uri;
    :cond_7
    iget-object v5, p0, Lcom/keepassdroid/PasswordActivity$InitTask;->this$0:Lcom/keepassdroid/PasswordActivity;

    const-string v6, "fileName"

    invoke-virtual {v3, v6}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Lcom/keepassdroid/utils/UriUtil;->parseDefaultFile(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v6

    # setter for: Lcom/keepassdroid/PasswordActivity;->mDbUri:Landroid/net/Uri;
    invoke-static {v5, v6}, Lcom/keepassdroid/PasswordActivity;->access$102(Lcom/keepassdroid/PasswordActivity;Landroid/net/Uri;)Landroid/net/Uri;

    .line 403
    iget-object v5, p0, Lcom/keepassdroid/PasswordActivity$InitTask;->this$0:Lcom/keepassdroid/PasswordActivity;

    const-string v6, "keyFile"

    invoke-virtual {v3, v6}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Lcom/keepassdroid/utils/UriUtil;->parseDefaultFile(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v6

    # setter for: Lcom/keepassdroid/PasswordActivity;->mKeyUri:Landroid/net/Uri;
    invoke-static {v5, v6}, Lcom/keepassdroid/PasswordActivity;->access$402(Lcom/keepassdroid/PasswordActivity;Landroid/net/Uri;)Landroid/net/Uri;

    .line 404
    const-string v5, "password"

    invoke-virtual {v3, v5}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    iput-object v5, p0, Lcom/keepassdroid/PasswordActivity$InitTask;->password:Ljava/lang/String;

    .line 405
    const-string v5, "launchImmediately"

    invoke-virtual {v3, v5, v8}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v5

    iput-boolean v5, p0, Lcom/keepassdroid/PasswordActivity$InitTask;->launch_immediately:Z

    .line 407
    iget-object v5, p0, Lcom/keepassdroid/PasswordActivity$InitTask;->this$0:Lcom/keepassdroid/PasswordActivity;

    # getter for: Lcom/keepassdroid/PasswordActivity;->mKeyUri:Landroid/net/Uri;
    invoke-static {v5}, Lcom/keepassdroid/PasswordActivity;->access$400(Lcom/keepassdroid/PasswordActivity;)Landroid/net/Uri;

    move-result-object v5

    if-eqz v5, :cond_8

    iget-object v5, p0, Lcom/keepassdroid/PasswordActivity$InitTask;->this$0:Lcom/keepassdroid/PasswordActivity;

    # getter for: Lcom/keepassdroid/PasswordActivity;->mKeyUri:Landroid/net/Uri;
    invoke-static {v5}, Lcom/keepassdroid/PasswordActivity;->access$400(Lcom/keepassdroid/PasswordActivity;)Landroid/net/Uri;

    move-result-object v5

    invoke-virtual {v5}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v5

    if-nez v5, :cond_4

    .line 408
    :cond_8
    iget-object v5, p0, Lcom/keepassdroid/PasswordActivity$InitTask;->this$0:Lcom/keepassdroid/PasswordActivity;

    iget-object v6, p0, Lcom/keepassdroid/PasswordActivity$InitTask;->this$0:Lcom/keepassdroid/PasswordActivity;

    iget-object v7, p0, Lcom/keepassdroid/PasswordActivity$InitTask;->this$0:Lcom/keepassdroid/PasswordActivity;

    # getter for: Lcom/keepassdroid/PasswordActivity;->mDbUri:Landroid/net/Uri;
    invoke-static {v7}, Lcom/keepassdroid/PasswordActivity;->access$100(Lcom/keepassdroid/PasswordActivity;)Landroid/net/Uri;

    move-result-object v7

    # invokes: Lcom/keepassdroid/PasswordActivity;->getKeyFile(Landroid/net/Uri;)Landroid/net/Uri;
    invoke-static {v6, v7}, Lcom/keepassdroid/PasswordActivity;->access$500(Lcom/keepassdroid/PasswordActivity;Landroid/net/Uri;)Landroid/net/Uri;

    move-result-object v6

    # setter for: Lcom/keepassdroid/PasswordActivity;->mKeyUri:Landroid/net/Uri;
    invoke-static {v5, v6}, Lcom/keepassdroid/PasswordActivity;->access$402(Lcom/keepassdroid/PasswordActivity;Landroid/net/Uri;)Landroid/net/Uri;

    goto/16 :goto_2
.end method

.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 357
    check-cast p1, [Landroid/content/Intent;

    invoke-virtual {p0, p1}, Lcom/keepassdroid/PasswordActivity$InitTask;->doInBackground([Landroid/content/Intent;)Ljava/lang/Integer;

    move-result-object v0

    return-object v0
.end method

.method public onPostExecute(Ljava/lang/Integer;)V
    .locals 8
    .param p1, "result"    # Ljava/lang/Integer;

    .prologue
    const/4 v7, 0x0

    .line 415
    if-eqz p1, :cond_1

    .line 416
    iget-object v5, p0, Lcom/keepassdroid/PasswordActivity$InitTask;->this$0:Lcom/keepassdroid/PasswordActivity;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v6

    const/4 v7, 0x1

    invoke-static {v5, v6, v7}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v5

    invoke-virtual {v5}, Landroid/widget/Toast;->show()V

    .line 417
    iget-object v5, p0, Lcom/keepassdroid/PasswordActivity$InitTask;->this$0:Lcom/keepassdroid/PasswordActivity;

    invoke-virtual {v5}, Lcom/keepassdroid/PasswordActivity;->finish()V

    .line 513
    :cond_0
    :goto_0
    return-void

    .line 421
    :cond_1
    iget-object v5, p0, Lcom/keepassdroid/PasswordActivity$InitTask;->this$0:Lcom/keepassdroid/PasswordActivity;

    # invokes: Lcom/keepassdroid/PasswordActivity;->populateView()V
    invoke-static {v5}, Lcom/keepassdroid/PasswordActivity;->access$600(Lcom/keepassdroid/PasswordActivity;)V

    .line 423
    iget-object v5, p0, Lcom/keepassdroid/PasswordActivity$InitTask;->this$0:Lcom/keepassdroid/PasswordActivity;

    const v6, 0x7f0b006e

    invoke-virtual {v5, v6}, Lcom/keepassdroid/PasswordActivity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/Button;

    .line 424
    .local v2, "confirmButton":Landroid/widget/Button;
    new-instance v5, Lcom/keepassdroid/PasswordActivity$OkClickHandler;

    iget-object v6, p0, Lcom/keepassdroid/PasswordActivity$InitTask;->this$0:Lcom/keepassdroid/PasswordActivity;

    invoke-direct {v5, v6, v7}, Lcom/keepassdroid/PasswordActivity$OkClickHandler;-><init>(Lcom/keepassdroid/PasswordActivity;Lcom/keepassdroid/PasswordActivity$1;)V

    invoke-virtual {v2, v5}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 426
    iget-object v5, p0, Lcom/keepassdroid/PasswordActivity$InitTask;->this$0:Lcom/keepassdroid/PasswordActivity;

    const v6, 0x7f0b006f

    invoke-virtual {v5, v6}, Lcom/keepassdroid/PasswordActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/CheckBox;

    .line 428
    .local v1, "checkBox":Landroid/widget/CheckBox;
    new-instance v5, Lcom/keepassdroid/PasswordActivity$InitTask$1;

    invoke-direct {v5, p0}, Lcom/keepassdroid/PasswordActivity$InitTask$1;-><init>(Lcom/keepassdroid/PasswordActivity$InitTask;)V

    invoke-virtual {v1, v5}, Landroid/widget/CheckBox;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 443
    iget-object v5, p0, Lcom/keepassdroid/PasswordActivity$InitTask;->password:Ljava/lang/String;

    if-eqz v5, :cond_2

    .line 444
    iget-object v5, p0, Lcom/keepassdroid/PasswordActivity$InitTask;->this$0:Lcom/keepassdroid/PasswordActivity;

    const v6, 0x7f0b004c

    invoke-virtual {v5, v6}, Lcom/keepassdroid/PasswordActivity;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    .line 445
    .local v4, "tv_password":Landroid/widget/TextView;
    iget-object v5, p0, Lcom/keepassdroid/PasswordActivity$InitTask;->password:Ljava/lang/String;

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 448
    .end local v4    # "tv_password":Landroid/widget/TextView;
    :cond_2
    iget-object v5, p0, Lcom/keepassdroid/PasswordActivity$InitTask;->this$0:Lcom/keepassdroid/PasswordActivity;

    const v6, 0x7f0b006b

    invoke-virtual {v5, v6}, Lcom/keepassdroid/PasswordActivity;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/CheckBox;

    .line 449
    .local v3, "defaultCheck":Landroid/widget/CheckBox;
    new-instance v5, Lcom/keepassdroid/PasswordActivity$DefaultCheckChange;

    iget-object v6, p0, Lcom/keepassdroid/PasswordActivity$InitTask;->this$0:Lcom/keepassdroid/PasswordActivity;

    invoke-direct {v5, v6, v7}, Lcom/keepassdroid/PasswordActivity$DefaultCheckChange;-><init>(Lcom/keepassdroid/PasswordActivity;Lcom/keepassdroid/PasswordActivity$1;)V

    invoke-virtual {v3, v5}, Landroid/widget/CheckBox;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 451
    iget-object v5, p0, Lcom/keepassdroid/PasswordActivity$InitTask;->this$0:Lcom/keepassdroid/PasswordActivity;

    const v6, 0x7f0b0045

    invoke-virtual {v5, v6}, Lcom/keepassdroid/PasswordActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageButton;

    .line 452
    .local v0, "browse":Landroid/widget/ImageButton;
    new-instance v5, Lcom/keepassdroid/PasswordActivity$InitTask$2;

    invoke-direct {v5, p0}, Lcom/keepassdroid/PasswordActivity$InitTask$2;-><init>(Lcom/keepassdroid/PasswordActivity$InitTask;)V

    invoke-virtual {v0, v5}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 509
    iget-object v5, p0, Lcom/keepassdroid/PasswordActivity$InitTask;->this$0:Lcom/keepassdroid/PasswordActivity;

    # invokes: Lcom/keepassdroid/PasswordActivity;->retrieveSettings()V
    invoke-static {v5}, Lcom/keepassdroid/PasswordActivity;->access$900(Lcom/keepassdroid/PasswordActivity;)V

    .line 511
    iget-boolean v5, p0, Lcom/keepassdroid/PasswordActivity$InitTask;->launch_immediately:Z

    if-eqz v5, :cond_0

    .line 512
    iget-object v5, p0, Lcom/keepassdroid/PasswordActivity$InitTask;->this$0:Lcom/keepassdroid/PasswordActivity;

    iget-object v6, p0, Lcom/keepassdroid/PasswordActivity$InitTask;->password:Ljava/lang/String;

    iget-object v7, p0, Lcom/keepassdroid/PasswordActivity$InitTask;->this$0:Lcom/keepassdroid/PasswordActivity;

    # getter for: Lcom/keepassdroid/PasswordActivity;->mKeyUri:Landroid/net/Uri;
    invoke-static {v7}, Lcom/keepassdroid/PasswordActivity;->access$400(Lcom/keepassdroid/PasswordActivity;)Landroid/net/Uri;

    move-result-object v7

    # invokes: Lcom/keepassdroid/PasswordActivity;->loadDatabase(Ljava/lang/String;Landroid/net/Uri;)V
    invoke-static {v5, v6, v7}, Lcom/keepassdroid/PasswordActivity;->access$1000(Lcom/keepassdroid/PasswordActivity;Ljava/lang/String;Landroid/net/Uri;)V

    goto :goto_0
.end method

.method public bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 357
    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p0, p1}, Lcom/keepassdroid/PasswordActivity$InitTask;->onPostExecute(Ljava/lang/Integer;)V

    return-void
.end method
