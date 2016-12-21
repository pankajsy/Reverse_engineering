.class public Lorg/bouncycastle/asn1/ASN1ObjectParser;
.super Ljava/lang/Object;
.source "ASN1ObjectParser.java"


# instance fields
.field _aIn:Lorg/bouncycastle/asn1/ASN1StreamParser;


# direct methods
.method protected constructor <init>(IILjava/io/InputStream;)V
    .locals 1
    .param p1, "baseTag"    # I
    .param p2, "tagNumber"    # I
    .param p3, "contentStream"    # Ljava/io/InputStream;

    .prologue
    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 17
    new-instance v0, Lorg/bouncycastle/asn1/ASN1StreamParser;

    invoke-direct {v0, p3}, Lorg/bouncycastle/asn1/ASN1StreamParser;-><init>(Ljava/io/InputStream;)V

    iput-object v0, p0, Lorg/bouncycastle/asn1/ASN1ObjectParser;->_aIn:Lorg/bouncycastle/asn1/ASN1StreamParser;

    .line 18
    return-void
.end method
