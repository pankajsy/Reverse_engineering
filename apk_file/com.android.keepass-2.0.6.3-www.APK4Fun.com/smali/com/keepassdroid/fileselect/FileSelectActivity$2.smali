.class Lcom/keepassdroid/fileselect/FileSelectActivity$2;
.super Ljava/lang/Object;
.source "FileSelectActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/keepassdroid/fileselect/FileSelectActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/keepassdroid/fileselect/FileSelectActivity;


# direct methods
.method constructor <init>(Lcom/keepassdroid/fileselect/FileSelectActivity;)V
    .locals 0
    .param p1, "this$0"    # Lcom/keepassdroid/fileselect/FileSelectActivity;

    .prologue
    .line 120
    iput-object p1, p0, Lcom/keepassdroid/fileselect/FileSelectActivity$2;->this$0:Lcom/keepassdroid/fileselect/FileSelectActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 12
    .param p1, "v"    # Landroid/view/View;

    .prologue
    const/4 v11, 0x1

    .line 123
    iget-object v7, p0, Lcom/keepassdroid/fileselect/FileSelectActivity$2;->this$0:Lcom/keepassdroid/fileselect/FileSelectActivity;

    const v8, 0x7f0b0040

    invoke-static {v7, v8}, Lcom/keepassdroid/utils/Util;->getEditText(Landroid/app/Activity;I)Ljava/lang/String;

    move-result-object v4

    .line 127
    .local v4, "filename":Ljava/lang/String;
    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v7

    if-nez v7, :cond_0

    .line 128
    iget-object v7, p0, Lcom/keepassdroid/fileselect/FileSelectActivity$2;->this$0:Lcom/keepassdroid/fileselect/FileSelectActivity;

    const v8, 0x7f06003c

    .line 129
    invoke-static {v7, v8, v11}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v7

    .line 131
    invoke-virtual {v7}, Landroid/widget/Toast;->show()V

    .line 186
    :goto_0
    return-void

    .line 136
    :cond_0
    new-instance v3, Ljava/io/File;

    invoke-direct {v3, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 138
    .local v3, "file":Ljava/io/File;
    :try_start_0
    invoke-virtual {v3}, Ljava/io/File;->exists()Z

    move-result v7

    if-eqz v7, :cond_1

    .line 139
    iget-object v7, p0, Lcom/keepassdroid/fileselect/FileSelectActivity$2;->this$0:Lcom/keepassdroid/fileselect/FileSelectActivity;

    const v8, 0x7f060038

    const/4 v9, 0x1

    invoke-static {v7, v8, v9}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v7

    .line 141
    invoke-virtual {v7}, Landroid/widget/Toast;->show()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 165
    :catch_0
    move-exception v2

    .line 166
    .local v2, "e":Ljava/io/IOException;
    iget-object v7, p0, Lcom/keepassdroid/fileselect/FileSelectActivity$2;->this$0:Lcom/keepassdroid/fileselect/FileSelectActivity;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v9, p0, Lcom/keepassdroid/fileselect/FileSelectActivity$2;->this$0:Lcom/keepassdroid/fileselect/FileSelectActivity;

    const v10, 0x7f06003b

    .line 168
    invoke-virtual {v9, v10}, Lcom/keepassdroid/fileselect/FileSelectActivity;->getText(I)Ljava/lang/CharSequence;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    .line 169
    invoke-virtual {v2}, Ljava/io/IOException;->getLocalizedMessage()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    .line 166
    invoke-static {v7, v8, v11}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v7

    .line 170
    invoke-virtual {v7}, Landroid/widget/Toast;->show()V

    goto :goto_0

    .line 144
    .end local v2    # "e":Ljava/io/IOException;
    :cond_1
    :try_start_1
    invoke-virtual {v3}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v5

    .line 146
    .local v5, "parent":Ljava/io/File;
    if-eqz v5, :cond_2

    invoke-virtual {v5}, Ljava/io/File;->exists()Z

    move-result v7

    if-eqz v7, :cond_3

    invoke-virtual {v5}, Ljava/io/File;->isDirectory()Z

    move-result v7

    if-nez v7, :cond_3

    .line 147
    :cond_2
    iget-object v7, p0, Lcom/keepassdroid/fileselect/FileSelectActivity$2;->this$0:Lcom/keepassdroid/fileselect/FileSelectActivity;

    const v8, 0x7f06003e

    const/4 v9, 0x1

    invoke-static {v7, v8, v9}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v7

    .line 149
    invoke-virtual {v7}, Landroid/widget/Toast;->show()V

    goto :goto_0

    .line 153
    :cond_3
    invoke-virtual {v5}, Ljava/io/File;->exists()Z

    move-result v7

    if-nez v7, :cond_4

    .line 155
    invoke-virtual {v5}, Ljava/io/File;->mkdirs()Z

    move-result v7

    if-nez v7, :cond_4

    .line 156
    iget-object v7, p0, Lcom/keepassdroid/fileselect/FileSelectActivity$2;->this$0:Lcom/keepassdroid/fileselect/FileSelectActivity;

    const v8, 0x7f060037

    const/4 v9, 0x1

    invoke-static {v7, v8, v9}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v7

    .line 158
    invoke-virtual {v7}, Landroid/widget/Toast;->show()V

    goto/16 :goto_0

    .line 164
    :cond_4
    invoke-virtual {v3}, Ljava/io/File;->createNewFile()Z
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    .line 176
    new-instance v6, Lcom/keepassdroid/fileselect/FileSelectActivity$CollectPassword;

    iget-object v7, p0, Lcom/keepassdroid/fileselect/FileSelectActivity$2;->this$0:Lcom/keepassdroid/fileselect/FileSelectActivity;

    new-instance v8, Lcom/keepassdroid/fileselect/FileSelectActivity$LaunchGroupActivity;

    iget-object v9, p0, Lcom/keepassdroid/fileselect/FileSelectActivity$2;->this$0:Lcom/keepassdroid/fileselect/FileSelectActivity;

    invoke-direct {v8, v9, v4}, Lcom/keepassdroid/fileselect/FileSelectActivity$LaunchGroupActivity;-><init>(Lcom/keepassdroid/fileselect/FileSelectActivity;Ljava/lang/String;)V

    invoke-direct {v6, v7, v8}, Lcom/keepassdroid/fileselect/FileSelectActivity$CollectPassword;-><init>(Lcom/keepassdroid/fileselect/FileSelectActivity;Lcom/keepassdroid/database/edit/FileOnFinish;)V

    .line 180
    .local v6, "password":Lcom/keepassdroid/fileselect/FileSelectActivity$CollectPassword;
    new-instance v0, Lcom/keepassdroid/database/edit/CreateDB;

    iget-object v7, p0, Lcom/keepassdroid/fileselect/FileSelectActivity$2;->this$0:Lcom/keepassdroid/fileselect/FileSelectActivity;

    invoke-direct {v0, v7, v4, v6, v11}, Lcom/keepassdroid/database/edit/CreateDB;-><init>(Landroid/content/Context;Ljava/lang/String;Lcom/keepassdroid/database/edit/OnFinish;Z)V

    .line 181
    .local v0, "create":Lcom/keepassdroid/database/edit/CreateDB;
    new-instance v1, Lcom/keepassdroid/ProgressTask;

    iget-object v7, p0, Lcom/keepassdroid/fileselect/FileSelectActivity$2;->this$0:Lcom/keepassdroid/fileselect/FileSelectActivity;

    const v8, 0x7f06007c

    invoke-direct {v1, v7, v0, v8}, Lcom/keepassdroid/ProgressTask;-><init>(Landroid/content/Context;Lcom/keepassdroid/database/edit/RunnableOnFinish;I)V

    .line 184
    .local v1, "createTask":Lcom/keepassdroid/ProgressTask;
    invoke-virtual {v1}, Lcom/keepassdroid/ProgressTask;->run()V

    goto/16 :goto_0
.end method
