.class public Lorg/bouncycastle/asn1/DERSetParser;
.super Ljava/lang/Object;
.source "DERSetParser.java"

# interfaces
.implements Lorg/bouncycastle/asn1/ASN1SetParser;


# instance fields
.field private _parser:Lorg/bouncycastle/asn1/ASN1StreamParser;


# direct methods
.method constructor <init>(Lorg/bouncycastle/asn1/ASN1StreamParser;)V
    .locals 0
    .param p1, "parser"    # Lorg/bouncycastle/asn1/ASN1StreamParser;

    .prologue
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    iput-object p1, p0, Lorg/bouncycastle/asn1/DERSetParser;->_parser:Lorg/bouncycastle/asn1/ASN1StreamParser;

    .line 13
    return-void
.end method


# virtual methods
.method public getDERObject()Lorg/bouncycastle/asn1/DERObject;
    .locals 4

    .prologue
    .line 25
    :try_start_0
    new-instance v1, Lorg/bouncycastle/asn1/DERSet;

    iget-object v2, p0, Lorg/bouncycastle/asn1/DERSetParser;->_parser:Lorg/bouncycastle/asn1/ASN1StreamParser;

    invoke-virtual {v2}, Lorg/bouncycastle/asn1/ASN1StreamParser;->readVector()Lorg/bouncycastle/asn1/ASN1EncodableVector;

    move-result-object v2

    const/4 v3, 0x0

    invoke-direct {v1, v2, v3}, Lorg/bouncycastle/asn1/DERSet;-><init>(Lorg/bouncycastle/asn1/DEREncodableVector;Z)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v1

    .line 27
    :catch_0
    move-exception v0

    .line 29
    .local v0, "e":Ljava/io/IOException;
    new-instance v1, Lorg/bouncycastle/asn1/ASN1ParsingException;

    invoke-virtual {v0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2, v0}, Lorg/bouncycastle/asn1/ASN1ParsingException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method

.method public readObject()Lorg/bouncycastle/asn1/DEREncodable;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 18
    iget-object v0, p0, Lorg/bouncycastle/asn1/DERSetParser;->_parser:Lorg/bouncycastle/asn1/ASN1StreamParser;

    invoke-virtual {v0}, Lorg/bouncycastle/asn1/ASN1StreamParser;->readObject()Lorg/bouncycastle/asn1/DEREncodable;

    move-result-object v0

    return-object v0
.end method
