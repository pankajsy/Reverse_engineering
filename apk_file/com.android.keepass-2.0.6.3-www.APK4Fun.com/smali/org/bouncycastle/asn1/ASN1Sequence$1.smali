.class Lorg/bouncycastle/asn1/ASN1Sequence$1;
.super Ljava/lang/Object;
.source "ASN1Sequence.java"

# interfaces
.implements Lorg/bouncycastle/asn1/ASN1SequenceParser;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/bouncycastle/asn1/ASN1Sequence;->parser()Lorg/bouncycastle/asn1/ASN1SequenceParser;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private index:I

.field private final max:I

.field final synthetic this$0:Lorg/bouncycastle/asn1/ASN1Sequence;

.field final synthetic val$outer:Lorg/bouncycastle/asn1/ASN1Sequence;


# direct methods
.method constructor <init>(Lorg/bouncycastle/asn1/ASN1Sequence;Lorg/bouncycastle/asn1/ASN1Sequence;)V
    .locals 1
    .param p1, "this$0"    # Lorg/bouncycastle/asn1/ASN1Sequence;

    .prologue
    .line 99
    iput-object p1, p0, Lorg/bouncycastle/asn1/ASN1Sequence$1;->this$0:Lorg/bouncycastle/asn1/ASN1Sequence;

    iput-object p2, p0, Lorg/bouncycastle/asn1/ASN1Sequence$1;->val$outer:Lorg/bouncycastle/asn1/ASN1Sequence;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 100
    iget-object v0, p0, Lorg/bouncycastle/asn1/ASN1Sequence$1;->this$0:Lorg/bouncycastle/asn1/ASN1Sequence;

    invoke-virtual {v0}, Lorg/bouncycastle/asn1/ASN1Sequence;->size()I

    move-result v0

    iput v0, p0, Lorg/bouncycastle/asn1/ASN1Sequence$1;->max:I

    return-void
.end method


# virtual methods
.method public getDERObject()Lorg/bouncycastle/asn1/DERObject;
    .locals 1

    .prologue
    .line 126
    iget-object v0, p0, Lorg/bouncycastle/asn1/ASN1Sequence$1;->val$outer:Lorg/bouncycastle/asn1/ASN1Sequence;

    return-object v0
.end method

.method public readObject()Lorg/bouncycastle/asn1/DEREncodable;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 106
    iget v1, p0, Lorg/bouncycastle/asn1/ASN1Sequence$1;->index:I

    iget v2, p0, Lorg/bouncycastle/asn1/ASN1Sequence$1;->max:I

    if-ne v1, v2, :cond_1

    .line 108
    const/4 v0, 0x0

    .line 121
    :cond_0
    :goto_0
    return-object v0

    .line 111
    :cond_1
    iget-object v1, p0, Lorg/bouncycastle/asn1/ASN1Sequence$1;->this$0:Lorg/bouncycastle/asn1/ASN1Sequence;

    iget v2, p0, Lorg/bouncycastle/asn1/ASN1Sequence$1;->index:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lorg/bouncycastle/asn1/ASN1Sequence$1;->index:I

    invoke-virtual {v1, v2}, Lorg/bouncycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/bouncycastle/asn1/DEREncodable;

    move-result-object v0

    .line 112
    .local v0, "obj":Lorg/bouncycastle/asn1/DEREncodable;
    instance-of v1, v0, Lorg/bouncycastle/asn1/ASN1Sequence;

    if-eqz v1, :cond_2

    .line 114
    check-cast v0, Lorg/bouncycastle/asn1/ASN1Sequence;

    .end local v0    # "obj":Lorg/bouncycastle/asn1/DEREncodable;
    invoke-virtual {v0}, Lorg/bouncycastle/asn1/ASN1Sequence;->parser()Lorg/bouncycastle/asn1/ASN1SequenceParser;

    move-result-object v0

    goto :goto_0

    .line 116
    .restart local v0    # "obj":Lorg/bouncycastle/asn1/DEREncodable;
    :cond_2
    instance-of v1, v0, Lorg/bouncycastle/asn1/ASN1Set;

    if-eqz v1, :cond_0

    .line 118
    check-cast v0, Lorg/bouncycastle/asn1/ASN1Set;

    .end local v0    # "obj":Lorg/bouncycastle/asn1/DEREncodable;
    invoke-virtual {v0}, Lorg/bouncycastle/asn1/ASN1Set;->parser()Lorg/bouncycastle/asn1/ASN1SetParser;

    move-result-object v0

    goto :goto_0
.end method
