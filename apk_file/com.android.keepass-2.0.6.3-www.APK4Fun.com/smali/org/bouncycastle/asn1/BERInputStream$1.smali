.class final Lorg/bouncycastle/asn1/BERInputStream$1;
.super Lorg/bouncycastle/asn1/DERObject;
.source "BERInputStream.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/bouncycastle/asn1/BERInputStream;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 17
    invoke-direct {p0}, Lorg/bouncycastle/asn1/DERObject;-><init>()V

    return-void
.end method


# virtual methods
.method encode(Lorg/bouncycastle/asn1/DEROutputStream;)V
    .locals 2
    .param p1, "out"    # Lorg/bouncycastle/asn1/DEROutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 22
    new-instance v0, Ljava/io/IOException;

    const-string v1, "Eeek!"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 1
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    .line 31
    if-ne p1, p0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public hashCode()I
    .locals 1

    .prologue
    .line 26
    const/4 v0, 0x0

    return v0
.end method
