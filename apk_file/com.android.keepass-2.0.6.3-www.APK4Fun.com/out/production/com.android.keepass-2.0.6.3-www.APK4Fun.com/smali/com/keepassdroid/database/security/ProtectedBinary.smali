.class public Lcom/keepassdroid/database/security/ProtectedBinary;
.super Ljava/lang/Object;
.source "ProtectedBinary.java"


# static fields
.field public static final EMPTY:Lcom/keepassdroid/database/security/ProtectedBinary;


# instance fields
.field private data:[B

.field private protect:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 26
    new-instance v0, Lcom/keepassdroid/database/security/ProtectedBinary;

    invoke-direct {v0}, Lcom/keepassdroid/database/security/ProtectedBinary;-><init>()V

    sput-object v0, Lcom/keepassdroid/database/security/ProtectedBinary;->EMPTY:Lcom/keepassdroid/database/security/ProtectedBinary;

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 44
    new-array v0, v1, [B

    invoke-direct {p0, v1, v0}, Lcom/keepassdroid/database/security/ProtectedBinary;-><init>(Z[B)V

    .line 46
    return-void
.end method

.method public constructor <init>(Z[B)V
    .locals 0
    .param p1, "enableProtection"    # Z
    .param p2, "data"    # [B

    .prologue
    .line 48
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 49
    iput-boolean p1, p0, Lcom/keepassdroid/database/security/ProtectedBinary;->protect:Z

    .line 50
    iput-object p2, p0, Lcom/keepassdroid/database/security/ProtectedBinary;->data:[B

    .line 52
    return-void
.end method


# virtual methods
.method public equals(Lcom/keepassdroid/database/security/ProtectedBinary;)Z
    .locals 2
    .param p1, "rhs"    # Lcom/keepassdroid/database/security/ProtectedBinary;

    .prologue
    .line 62
    iget-boolean v0, p0, Lcom/keepassdroid/database/security/ProtectedBinary;->protect:Z

    iget-boolean v1, p1, Lcom/keepassdroid/database/security/ProtectedBinary;->protect:Z

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lcom/keepassdroid/database/security/ProtectedBinary;->data:[B

    iget-object v1, p1, Lcom/keepassdroid/database/security/ProtectedBinary;->data:[B

    invoke-static {v0, v1}, Ljava/util/Arrays;->equals([B[B)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getData()[B
    .locals 1

    .prologue
    .line 58
    iget-object v0, p0, Lcom/keepassdroid/database/security/ProtectedBinary;->data:[B

    return-object v0
.end method

.method public isProtected()Z
    .locals 1

    .prologue
    .line 32
    iget-boolean v0, p0, Lcom/keepassdroid/database/security/ProtectedBinary;->protect:Z

    return v0
.end method

.method public length()I
    .locals 1

    .prologue
    .line 36
    iget-object v0, p0, Lcom/keepassdroid/database/security/ProtectedBinary;->data:[B

    if-nez v0, :cond_0

    .line 37
    const/4 v0, 0x0

    .line 40
    :goto_0
    return v0

    :cond_0
    iget-object v0, p0, Lcom/keepassdroid/database/security/ProtectedBinary;->data:[B

    array-length v0, v0

    goto :goto_0
.end method
