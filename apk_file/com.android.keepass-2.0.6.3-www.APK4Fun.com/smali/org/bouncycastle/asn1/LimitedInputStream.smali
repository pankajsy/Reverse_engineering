.class abstract Lorg/bouncycastle/asn1/LimitedInputStream;
.super Ljava/io/InputStream;
.source "LimitedInputStream.java"


# instance fields
.field protected final _in:Ljava/io/InputStream;


# direct methods
.method constructor <init>(Ljava/io/InputStream;)V
    .locals 0
    .param p1, "in"    # Ljava/io/InputStream;

    .prologue
    .line 12
    invoke-direct {p0}, Ljava/io/InputStream;-><init>()V

    .line 13
    iput-object p1, p0, Lorg/bouncycastle/asn1/LimitedInputStream;->_in:Ljava/io/InputStream;

    .line 14
    return-void
.end method


# virtual methods
.method protected setParentEofDetect(Z)V
    .locals 1
    .param p1, "on"    # Z

    .prologue
    .line 18
    iget-object v0, p0, Lorg/bouncycastle/asn1/LimitedInputStream;->_in:Ljava/io/InputStream;

    instance-of v0, v0, Lorg/bouncycastle/asn1/IndefiniteLengthInputStream;

    if-eqz v0, :cond_0

    .line 20
    iget-object v0, p0, Lorg/bouncycastle/asn1/LimitedInputStream;->_in:Ljava/io/InputStream;

    check-cast v0, Lorg/bouncycastle/asn1/IndefiniteLengthInputStream;

    invoke-virtual {v0, p1}, Lorg/bouncycastle/asn1/IndefiniteLengthInputStream;->setEofOn00(Z)V

    .line 22
    :cond_0
    return-void
.end method
