.class public Lorg/bouncycastle/asn1/BERApplicationSpecificParser;
.super Ljava/lang/Object;
.source "BERApplicationSpecificParser.java"

# interfaces
.implements Lorg/bouncycastle/asn1/ASN1ApplicationSpecificParser;


# instance fields
.field private final parser:Lorg/bouncycastle/asn1/ASN1StreamParser;

.field private final tag:I


# direct methods
.method constructor <init>(ILorg/bouncycastle/asn1/ASN1StreamParser;)V
    .locals 0
    .param p1, "tag"    # I
    .param p2, "parser"    # Lorg/bouncycastle/asn1/ASN1StreamParser;

    .prologue
    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 13
    iput p1, p0, Lorg/bouncycastle/asn1/BERApplicationSpecificParser;->tag:I

    .line 14
    iput-object p2, p0, Lorg/bouncycastle/asn1/BERApplicationSpecificParser;->parser:Lorg/bouncycastle/asn1/ASN1StreamParser;

    .line 15
    return-void
.end method


# virtual methods
.method public getDERObject()Lorg/bouncycastle/asn1/DERObject;
    .locals 4

    .prologue
    .line 27
    :try_start_0
    new-instance v1, Lorg/bouncycastle/asn1/BERApplicationSpecific;

    iget v2, p0, Lorg/bouncycastle/asn1/BERApplicationSpecificParser;->tag:I

    iget-object v3, p0, Lorg/bouncycastle/asn1/BERApplicationSpecificParser;->parser:Lorg/bouncycastle/asn1/ASN1StreamParser;

    invoke-virtual {v3}, Lorg/bouncycastle/asn1/ASN1StreamParser;->readVector()Lorg/bouncycastle/asn1/ASN1EncodableVector;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Lorg/bouncycastle/asn1/BERApplicationSpecific;-><init>(ILorg/bouncycastle/asn1/ASN1EncodableVector;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v1

    .line 29
    :catch_0
    move-exception v0

    .line 31
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
    .line 20
    iget-object v0, p0, Lorg/bouncycastle/asn1/BERApplicationSpecificParser;->parser:Lorg/bouncycastle/asn1/ASN1StreamParser;

    invoke-virtual {v0}, Lorg/bouncycastle/asn1/ASN1StreamParser;->readObject()Lorg/bouncycastle/asn1/DEREncodable;

    move-result-object v0

    return-object v0
.end method
