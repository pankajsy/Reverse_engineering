.class public Lcom/keepassdroid/password/PasswordGenerator;
.super Ljava/lang/Object;
.source "PasswordGenerator.java"


# static fields
.field private static final bracketChars:Ljava/lang/String; = "[]{}()<>"

.field private static final digitChars:Ljava/lang/String; = "0123456789"

.field private static final lowerCaseChars:Ljava/lang/String; = "abcdefghijklmnopqrstuvwxyz"

.field private static final minusChars:Ljava/lang/String; = "-"

.field private static final spaceChars:Ljava/lang/String; = " "

.field private static final specialChars:Ljava/lang/String; = "!\"#$%&\'*+,./:;=?@\\^`"

.field private static final underlineChars:Ljava/lang/String; = "_"

.field private static final upperCaseChars:Ljava/lang/String; = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"


# instance fields
.field private cxt:Landroid/content/Context;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1, "cxt"    # Landroid/content/Context;

    .prologue
    .line 40
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 41
    iput-object p1, p0, Lcom/keepassdroid/password/PasswordGenerator;->cxt:Landroid/content/Context;

    .line 42
    return-void
.end method


# virtual methods
.method public generatePassword(IZZZZZZZZ)Ljava/lang/String;
    .locals 16
    .param p1, "length"    # I
    .param p2, "upperCase"    # Z
    .param p3, "lowerCase"    # Z
    .param p4, "digits"    # Z
    .param p5, "minus"    # Z
    .param p6, "underline"    # Z
    .param p7, "space"    # Z
    .param p8, "specials"    # Z
    .param p9, "brackets"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .prologue
    .line 45
    if-gtz p1, :cond_0

    .line 46
    new-instance v1, Ljava/lang/IllegalArgumentException;

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/keepassdroid/password/PasswordGenerator;->cxt:Landroid/content/Context;

    const v3, 0x7f060047

    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 48
    :cond_0
    if-nez p2, :cond_1

    if-nez p3, :cond_1

    if-nez p4, :cond_1

    if-nez p5, :cond_1

    if-nez p6, :cond_1

    if-nez p7, :cond_1

    if-nez p8, :cond_1

    if-nez p9, :cond_1

    .line 49
    new-instance v1, Ljava/lang/IllegalArgumentException;

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/keepassdroid/password/PasswordGenerator;->cxt:Landroid/content/Context;

    const v3, 0x7f060042

    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    :cond_1
    move-object/from16 v1, p0

    move/from16 v2, p2

    move/from16 v3, p3

    move/from16 v4, p4

    move/from16 v5, p5

    move/from16 v6, p6

    move/from16 v7, p7

    move/from16 v8, p8

    move/from16 v9, p9

    .line 51
    invoke-virtual/range {v1 .. v9}, Lcom/keepassdroid/password/PasswordGenerator;->getCharacterSet(ZZZZZZZZ)Ljava/lang/String;

    move-result-object v12

    .line 53
    .local v12, "characterSet":Ljava/lang/String;
    invoke-virtual {v12}, Ljava/lang/String;->length()I

    move-result v15

    .line 55
    .local v15, "size":I
    new-instance v10, Ljava/lang/StringBuffer;

    invoke-direct {v10}, Ljava/lang/StringBuffer;-><init>()V

    .line 57
    .local v10, "buffer":Ljava/lang/StringBuffer;
    new-instance v14, Ljava/security/SecureRandom;

    invoke-direct {v14}, Ljava/security/SecureRandom;-><init>()V

    .line 58
    .local v14, "random":Ljava/security/SecureRandom;
    if-lez v15, :cond_2

    .line 60
    const/4 v13, 0x0

    .local v13, "i":I
    :goto_0
    move/from16 v0, p1

    if-ge v13, v0, :cond_2

    .line 61
    invoke-virtual {v14, v15}, Ljava/security/SecureRandom;->nextInt(I)I

    move-result v1

    int-to-char v1, v1

    invoke-virtual {v12, v1}, Ljava/lang/String;->charAt(I)C

    move-result v11

    .line 63
    .local v11, "c":C
    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 60
    add-int/lit8 v13, v13, 0x1

    goto :goto_0

    .line 67
    .end local v11    # "c":C
    .end local v13    # "i":I
    :cond_2
    invoke-virtual {v10}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public getCharacterSet(ZZZZZZZZ)Ljava/lang/String;
    .locals 2
    .param p1, "upperCase"    # Z
    .param p2, "lowerCase"    # Z
    .param p3, "digits"    # Z
    .param p4, "minus"    # Z
    .param p5, "underline"    # Z
    .param p6, "space"    # Z
    .param p7, "specials"    # Z
    .param p8, "brackets"    # Z

    .prologue
    .line 71
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 73
    .local v0, "charSet":Ljava/lang/StringBuffer;
    if-eqz p1, :cond_0

    .line 74
    const-string v1, "ABCDEFGHIJKLMNOPQRSTUVWXYZ"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 76
    :cond_0
    if-eqz p2, :cond_1

    .line 77
    const-string v1, "abcdefghijklmnopqrstuvwxyz"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 79
    :cond_1
    if-eqz p3, :cond_2

    .line 80
    const-string v1, "0123456789"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 82
    :cond_2
    if-eqz p4, :cond_3

    .line 83
    const-string v1, "-"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 85
    :cond_3
    if-eqz p5, :cond_4

    .line 86
    const-string v1, "_"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 88
    :cond_4
    if-eqz p6, :cond_5

    .line 89
    const-string v1, " "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 91
    :cond_5
    if-eqz p7, :cond_6

    .line 92
    const-string v1, "!\"#$%&\'*+,./:;=?@\\^`"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 94
    :cond_6
    if-eqz p8, :cond_7

    .line 95
    const-string v1, "[]{}()<>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 97
    :cond_7
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method
