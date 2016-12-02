.class Lcom/keepassdroid/fileselect/FileSelectActivity$1;
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
    .line 97
    iput-object p1, p0, Lcom/keepassdroid/fileselect/FileSelectActivity$1;->this$0:Lcom/keepassdroid/fileselect/FileSelectActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 5
    .param p1, "v"    # Landroid/view/View;

    .prologue
    const/4 v4, 0x1

    .line 100
    iget-object v2, p0, Lcom/keepassdroid/fileselect/FileSelectActivity$1;->this$0:Lcom/keepassdroid/fileselect/FileSelectActivity;

    const v3, 0x7f0b0040

    invoke-static {v2, v3}, Lcom/keepassdroid/utils/Util;->getEditText(Landroid/app/Activity;I)Ljava/lang/String;

    move-result-object v1

    .line 104
    .local v1, "fileName":Ljava/lang/String;
    :try_start_0
    iget-object v2, p0, Lcom/keepassdroid/fileselect/FileSelectActivity$1;->this$0:Lcom/keepassdroid/fileselect/FileSelectActivity;

    invoke-static {v2, v1}, Lcom/keepassdroid/PasswordActivity;->Launch(Landroid/app/Activity;Ljava/lang/String;)V
    :try_end_0
    .catch Lcom/keepassdroid/database/exception/ContentFileNotFoundException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_1

    .line 115
    :goto_0
    return-void

    .line 106
    :catch_0
    move-exception v0

    .line 107
    .local v0, "e":Lcom/keepassdroid/database/exception/ContentFileNotFoundException;
    iget-object v2, p0, Lcom/keepassdroid/fileselect/FileSelectActivity$1;->this$0:Lcom/keepassdroid/fileselect/FileSelectActivity;

    const v3, 0x7f0600a8

    invoke-static {v2, v3, v4}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v2

    .line 108
    invoke-virtual {v2}, Landroid/widget/Toast;->show()V

    goto :goto_0

    .line 110
    .end local v0    # "e":Lcom/keepassdroid/database/exception/ContentFileNotFoundException;
    :catch_1
    move-exception v0

    .line 111
    .local v0, "e":Ljava/io/FileNotFoundException;
    iget-object v2, p0, Lcom/keepassdroid/fileselect/FileSelectActivity$1;->this$0:Lcom/keepassdroid/fileselect/FileSelectActivity;

    const v3, 0x7f060002

    invoke-static {v2, v3, v4}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v2

    .line 112
    invoke-virtual {v2}, Landroid/widget/Toast;->show()V

    goto :goto_0
.end method
