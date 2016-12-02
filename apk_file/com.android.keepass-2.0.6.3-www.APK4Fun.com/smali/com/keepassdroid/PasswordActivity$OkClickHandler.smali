.class Lcom/keepassdroid/PasswordActivity$OkClickHandler;
.super Ljava/lang/Object;
.source "PasswordActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/keepassdroid/PasswordActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "OkClickHandler"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/keepassdroid/PasswordActivity;


# direct methods
.method private constructor <init>(Lcom/keepassdroid/PasswordActivity;)V
    .locals 0

    .prologue
    .line 256
    iput-object p1, p0, Lcom/keepassdroid/PasswordActivity$OkClickHandler;->this$0:Lcom/keepassdroid/PasswordActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/keepassdroid/PasswordActivity;Lcom/keepassdroid/PasswordActivity$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/keepassdroid/PasswordActivity;
    .param p2, "x1"    # Lcom/keepassdroid/PasswordActivity$1;

    .prologue
    .line 256
    invoke-direct {p0, p1}, Lcom/keepassdroid/PasswordActivity$OkClickHandler;-><init>(Lcom/keepassdroid/PasswordActivity;)V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 4
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 259
    iget-object v2, p0, Lcom/keepassdroid/PasswordActivity$OkClickHandler;->this$0:Lcom/keepassdroid/PasswordActivity;

    const v3, 0x7f0b004c

    # invokes: Lcom/keepassdroid/PasswordActivity;->getEditText(I)Ljava/lang/String;
    invoke-static {v2, v3}, Lcom/keepassdroid/PasswordActivity;->access$200(Lcom/keepassdroid/PasswordActivity;I)Ljava/lang/String;

    move-result-object v1

    .line 260
    .local v1, "pass":Ljava/lang/String;
    iget-object v2, p0, Lcom/keepassdroid/PasswordActivity$OkClickHandler;->this$0:Lcom/keepassdroid/PasswordActivity;

    const v3, 0x7f0b006d

    # invokes: Lcom/keepassdroid/PasswordActivity;->getEditText(I)Ljava/lang/String;
    invoke-static {v2, v3}, Lcom/keepassdroid/PasswordActivity;->access$200(Lcom/keepassdroid/PasswordActivity;I)Ljava/lang/String;

    move-result-object v0

    .line 261
    .local v0, "key":Ljava/lang/String;
    iget-object v2, p0, Lcom/keepassdroid/PasswordActivity$OkClickHandler;->this$0:Lcom/keepassdroid/PasswordActivity;

    # invokes: Lcom/keepassdroid/PasswordActivity;->loadDatabase(Ljava/lang/String;Ljava/lang/String;)V
    invoke-static {v2, v1, v0}, Lcom/keepassdroid/PasswordActivity;->access$300(Lcom/keepassdroid/PasswordActivity;Ljava/lang/String;Ljava/lang/String;)V

    .line 262
    return-void
.end method
