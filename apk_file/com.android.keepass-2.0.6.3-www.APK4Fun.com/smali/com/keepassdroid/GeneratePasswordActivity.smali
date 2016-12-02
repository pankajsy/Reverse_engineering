.class public Lcom/keepassdroid/GeneratePasswordActivity;
.super Lcom/keepassdroid/LockCloseActivity;
.source "GeneratePasswordActivity.java"


# static fields
.field private static final BUTTON_IDS:[I


# instance fields
.field private lengthButtonsListener:Landroid/view/View$OnClickListener;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 37
    const/4 v0, 0x4

    new-array v0, v0, [I

    fill-array-data v0, :array_0

    sput-object v0, Lcom/keepassdroid/GeneratePasswordActivity;->BUTTON_IDS:[I

    return-void

    nop

    :array_0
    .array-data 4
        0x7f0b0052
        0x7f0b0051
        0x7f0b0050
        0x7f0b004f
    .end array-data
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 36
    invoke-direct {p0}, Lcom/keepassdroid/LockCloseActivity;-><init>()V

    .line 45
    new-instance v0, Lcom/keepassdroid/GeneratePasswordActivity$1;

    invoke-direct {v0, p0}, Lcom/keepassdroid/GeneratePasswordActivity$1;-><init>(Lcom/keepassdroid/GeneratePasswordActivity;)V

    iput-object v0, p0, Lcom/keepassdroid/GeneratePasswordActivity;->lengthButtonsListener:Landroid/view/View$OnClickListener;

    return-void
.end method

.method public static Launch(Landroid/app/Activity;)V
    .locals 2
    .param p0, "act"    # Landroid/app/Activity;

    .prologue
    .line 40
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/keepassdroid/GeneratePasswordActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 42
    .local v0, "i":Landroid/content/Intent;
    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Landroid/app/Activity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 43
    return-void
.end method

.method static synthetic access$000(Lcom/keepassdroid/GeneratePasswordActivity;)V
    .locals 0
    .param p0, "x0"    # Lcom/keepassdroid/GeneratePasswordActivity;

    .prologue
    .line 36
    invoke-direct {p0}, Lcom/keepassdroid/GeneratePasswordActivity;->fillPassword()V

    return-void
.end method

.method private fillPassword()V
    .locals 2

    .prologue
    .line 102
    const v1, 0x7f0b004c

    invoke-virtual {p0, v1}, Lcom/keepassdroid/GeneratePasswordActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    .line 103
    .local v0, "txtPassword":Landroid/widget/EditText;
    invoke-virtual {p0}, Lcom/keepassdroid/GeneratePasswordActivity;->generatePassword()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 104
    return-void
.end method


# virtual methods
.method public generatePassword()Ljava/lang/String;
    .locals 13

    .prologue
    const/4 v12, 0x1

    .line 107
    const-string v11, ""

    .line 110
    .local v11, "password":Ljava/lang/String;
    const v2, 0x7f0b0053

    :try_start_0
    invoke-virtual {p0, v2}, Lcom/keepassdroid/GeneratePasswordActivity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/EditText;

    invoke-virtual {v2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v1

    .line 112
    .local v1, "length":I
    const v2, 0x7f0b0054

    invoke-virtual {p0, v2}, Lcom/keepassdroid/GeneratePasswordActivity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/CheckBox;

    invoke-virtual {v2}, Landroid/widget/CheckBox;->isChecked()Z

    .line 114
    new-instance v0, Lcom/keepassdroid/password/PasswordGenerator;

    invoke-direct {v0, p0}, Lcom/keepassdroid/password/PasswordGenerator;-><init>(Landroid/content/Context;)V

    .line 116
    .local v0, "generator":Lcom/keepassdroid/password/PasswordGenerator;
    const v2, 0x7f0b0054

    .line 117
    invoke-virtual {p0, v2}, Lcom/keepassdroid/GeneratePasswordActivity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/CheckBox;

    invoke-virtual {v2}, Landroid/widget/CheckBox;->isChecked()Z

    move-result v2

    const v3, 0x7f0b0055

    .line 118
    invoke-virtual {p0, v3}, Lcom/keepassdroid/GeneratePasswordActivity;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/CheckBox;

    invoke-virtual {v3}, Landroid/widget/CheckBox;->isChecked()Z

    move-result v3

    const v4, 0x7f0b0056

    .line 119
    invoke-virtual {p0, v4}, Lcom/keepassdroid/GeneratePasswordActivity;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/CheckBox;

    invoke-virtual {v4}, Landroid/widget/CheckBox;->isChecked()Z

    move-result v4

    const v5, 0x7f0b0057

    .line 120
    invoke-virtual {p0, v5}, Lcom/keepassdroid/GeneratePasswordActivity;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/CheckBox;

    invoke-virtual {v5}, Landroid/widget/CheckBox;->isChecked()Z

    move-result v5

    const v6, 0x7f0b0058

    .line 121
    invoke-virtual {p0, v6}, Lcom/keepassdroid/GeneratePasswordActivity;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/CheckBox;

    invoke-virtual {v6}, Landroid/widget/CheckBox;->isChecked()Z

    move-result v6

    const v7, 0x7f0b0059

    .line 122
    invoke-virtual {p0, v7}, Lcom/keepassdroid/GeneratePasswordActivity;->findViewById(I)Landroid/view/View;

    move-result-object v7

    check-cast v7, Landroid/widget/CheckBox;

    invoke-virtual {v7}, Landroid/widget/CheckBox;->isChecked()Z

    move-result v7

    const v8, 0x7f0b005a

    .line 123
    invoke-virtual {p0, v8}, Lcom/keepassdroid/GeneratePasswordActivity;->findViewById(I)Landroid/view/View;

    move-result-object v8

    check-cast v8, Landroid/widget/CheckBox;

    invoke-virtual {v8}, Landroid/widget/CheckBox;->isChecked()Z

    move-result v8

    const v9, 0x7f0b005b

    .line 124
    invoke-virtual {p0, v9}, Lcom/keepassdroid/GeneratePasswordActivity;->findViewById(I)Landroid/view/View;

    move-result-object v9

    check-cast v9, Landroid/widget/CheckBox;

    invoke-virtual {v9}, Landroid/widget/CheckBox;->isChecked()Z

    move-result v9

    .line 116
    invoke-virtual/range {v0 .. v9}, Lcom/keepassdroid/password/PasswordGenerator;->generatePassword(IZZZZZZZZ)Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_1

    move-result-object v11

    .line 131
    .end local v0    # "generator":Lcom/keepassdroid/password/PasswordGenerator;
    .end local v1    # "length":I
    :goto_0
    return-object v11

    .line 125
    :catch_0
    move-exception v10

    .line 126
    .local v10, "e":Ljava/lang/NumberFormatException;
    const v2, 0x7f060047

    invoke-static {p0, v2, v12}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v2

    invoke-virtual {v2}, Landroid/widget/Toast;->show()V

    goto :goto_0

    .line 127
    .end local v10    # "e":Ljava/lang/NumberFormatException;
    :catch_1
    move-exception v10

    .line 128
    .local v10, "e":Ljava/lang/IllegalArgumentException;
    invoke-virtual {v10}, Ljava/lang/IllegalArgumentException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-static {p0, v2, v12}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v2

    invoke-virtual {v2}, Landroid/widget/Toast;->show()V

    goto :goto_0
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 9
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const/4 v5, 0x0

    .line 56
    invoke-super {p0, p1}, Lcom/keepassdroid/LockCloseActivity;->onCreate(Landroid/os/Bundle;)V

    .line 57
    const v6, 0x7f03000e

    invoke-virtual {p0, v6}, Lcom/keepassdroid/GeneratePasswordActivity;->setContentView(I)V

    .line 58
    invoke-virtual {p0, v5}, Lcom/keepassdroid/GeneratePasswordActivity;->setResult(I)V

    .line 60
    sget-object v6, Lcom/keepassdroid/GeneratePasswordActivity;->BUTTON_IDS:[I

    array-length v7, v6

    :goto_0
    if-ge v5, v7, :cond_0

    aget v4, v6, v5

    .line 61
    .local v4, "id":I
    invoke-virtual {p0, v4}, Lcom/keepassdroid/GeneratePasswordActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/Button;

    .line 62
    .local v1, "button":Landroid/widget/Button;
    iget-object v8, p0, Lcom/keepassdroid/GeneratePasswordActivity;->lengthButtonsListener:Landroid/view/View$OnClickListener;

    invoke-virtual {v1, v8}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 60
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .line 65
    .end local v1    # "button":Landroid/widget/Button;
    .end local v4    # "id":I
    :cond_0
    const v5, 0x7f0b004d

    invoke-virtual {p0, v5}, Lcom/keepassdroid/GeneratePasswordActivity;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/Button;

    .line 66
    .local v3, "genPassButton":Landroid/widget/Button;
    new-instance v5, Lcom/keepassdroid/GeneratePasswordActivity$2;

    invoke-direct {v5, p0}, Lcom/keepassdroid/GeneratePasswordActivity$2;-><init>(Lcom/keepassdroid/GeneratePasswordActivity;)V

    invoke-virtual {v3, v5}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 72
    const v5, 0x7f0b0048

    invoke-virtual {p0, v5}, Lcom/keepassdroid/GeneratePasswordActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    .line 73
    .local v0, "acceptButton":Landroid/widget/Button;
    new-instance v5, Lcom/keepassdroid/GeneratePasswordActivity$3;

    invoke-direct {v5, p0}, Lcom/keepassdroid/GeneratePasswordActivity$3;-><init>(Lcom/keepassdroid/GeneratePasswordActivity;)V

    invoke-virtual {v0, v5}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 87
    const v5, 0x7f0b0049

    invoke-virtual {p0, v5}, Lcom/keepassdroid/GeneratePasswordActivity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/Button;

    .line 88
    .local v2, "cancelButton":Landroid/widget/Button;
    new-instance v5, Lcom/keepassdroid/GeneratePasswordActivity$4;

    invoke-direct {v5, p0}, Lcom/keepassdroid/GeneratePasswordActivity$4;-><init>(Lcom/keepassdroid/GeneratePasswordActivity;)V

    invoke-virtual {v2, v5}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 98
    invoke-direct {p0}, Lcom/keepassdroid/GeneratePasswordActivity;->fillPassword()V

    .line 99
    return-void
.end method
