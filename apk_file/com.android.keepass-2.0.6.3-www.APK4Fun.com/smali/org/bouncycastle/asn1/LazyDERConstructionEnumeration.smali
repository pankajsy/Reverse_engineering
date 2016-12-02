.class Lorg/bouncycastle/asn1/LazyDERConstructionEnumeration;
.super Ljava/lang/Object;
.source "LazyDERConstructionEnumeration.java"

# interfaces
.implements Ljava/util/Enumeration;


# instance fields
.field private aIn:Lorg/bouncycastle/asn1/ASN1InputStream;

.field private nextObj:Ljava/lang/Object;


# direct methods
.method public constructor <init>([B)V
    .locals 2
    .param p1, "encoded"    # [B

    .prologue
    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 15
    new-instance v0, Lorg/bouncycastle/asn1/ASN1InputStream;

    const/4 v1, 0x1

    invoke-direct {v0, p1, v1}, Lorg/bouncycastle/asn1/ASN1InputStream;-><init>([BZ)V

    iput-object v0, p0, Lorg/bouncycastle/asn1/LazyDERConstructionEnumeration;->aIn:Lorg/bouncycastle/asn1/ASN1InputStream;

    .line 16
    invoke-direct {p0}, Lorg/bouncycastle/asn1/LazyDERConstructionEnumeration;->readObject()Ljava/lang/Object;

    move-result-object v0

    iput-object v0, p0, Lorg/bouncycastle/asn1/LazyDERConstructionEnumeration;->nextObj:Ljava/lang/Object;

    .line 17
    return-void
.end method

.method private readObject()Ljava/lang/Object;
    .locals 4

    .prologue
    .line 37
    :try_start_0
    iget-object v1, p0, Lorg/bouncycastle/asn1/LazyDERConstructionEnumeration;->aIn:Lorg/bouncycastle/asn1/ASN1InputStream;

    invoke-virtual {v1}, Lorg/bouncycastle/asn1/ASN1InputStream;->readObject()Lorg/bouncycastle/asn1/DERObject;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    return-object v1

    .line 39
    :catch_0
    move-exception v0

    .line 41
    .local v0, "e":Ljava/io/IOException;
    new-instance v1, Lorg/bouncycastle/asn1/ASN1ParsingException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "malformed DER construction: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2, v0}, Lorg/bouncycastle/asn1/ASN1ParsingException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method


# virtual methods
.method public hasMoreElements()Z
    .locals 1

    .prologue
    .line 21
    iget-object v0, p0, Lorg/bouncycastle/asn1/LazyDERConstructionEnumeration;->nextObj:Ljava/lang/Object;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public nextElement()Ljava/lang/Object;
    .locals 2

    .prologue
    .line 26
    iget-object v0, p0, Lorg/bouncycastle/asn1/LazyDERConstructionEnumeration;->nextObj:Ljava/lang/Object;

    .line 28
    .local v0, "o":Ljava/lang/Object;
    invoke-direct {p0}, Lorg/bouncycastle/asn1/LazyDERConstructionEnumeration;->readObject()Ljava/lang/Object;

    move-result-object v1

    iput-object v1, p0, Lorg/bouncycastle/asn1/LazyDERConstructionEnumeration;->nextObj:Ljava/lang/Object;

    .line 30
    return-object v0
.end method
