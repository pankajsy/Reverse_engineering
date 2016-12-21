.class Lorg/bouncycastle/asn1/ASN1Set$1;
.super Ljava/lang/Object;
.source "ASN1Set.java"

# interfaces
.implements Lorg/bouncycastle/asn1/ASN1SetParser;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/bouncycastle/asn1/ASN1Set;->parser()Lorg/bouncycastle/asn1/ASN1SetParser;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private index:I

.field private final max:I

.field final synthetic this$0:Lorg/bouncycastle/asn1/ASN1Set;

.field final synthetic val$outer:Lorg/bouncycastle/asn1/ASN1Set;


# direct methods
.method constructor <init>(Lorg/bouncycastle/asn1/ASN1Set;Lorg/bouncycastle/asn1/ASN1Set;)V
    .locals 1
    .param p1, "this$0"    # Lorg/bouncycastle/asn1/ASN1Set;

    .prologue
    .line 140
    iput-object p1, p0, Lorg/bouncycastle/asn1/ASN1Set$1;->this$0:Lorg/bouncycastle/asn1/ASN1Set;

    iput-object p2, p0, Lorg/bouncycastle/asn1/ASN1Set$1;->val$outer:Lorg/bouncycastle/asn1/ASN1Set;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 141
    iget-object v0, p0, Lorg/bouncycastle/asn1/ASN1Set$1;->this$0:Lorg/bouncycastle/asn1/ASN1Set;

    invoke-virtual {v0}, Lorg/bouncycastle/asn1/ASN1Set;->size()I

    move-result v0

    iput v0, p0, Lorg/bouncycastle/asn1/ASN1Set$1;->max:I

    return-void
.end method


# virtual methods
.method public getDERObject()Lorg/bouncycastle/asn1/DERObject;
    .locals 1

    .prologue
    .line 167
    iget-object v0, p0, Lorg/bouncycastle/asn1/ASN1Set$1;->val$outer:Lorg/bouncycastle/asn1/ASN1Set;

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
    .line 147
    iget v1, p0, Lorg/bouncycastle/asn1/ASN1Set$1;->index:I

    iget v2, p0, Lorg/bouncycastle/asn1/ASN1Set$1;->max:I

    if-ne v1, v2, :cond_1

    .line 149
    const/4 v0, 0x0

    .line 162
    :cond_0
    :goto_0
    return-object v0

    .line 152
    :cond_1
    iget-object v1, p0, Lorg/bouncycastle/asn1/ASN1Set$1;->this$0:Lorg/bouncycastle/asn1/ASN1Set;

    iget v2, p0, Lorg/bouncycastle/asn1/ASN1Set$1;->index:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lorg/bouncycastle/asn1/ASN1Set$1;->index:I

    invoke-virtual {v1, v2}, Lorg/bouncycastle/asn1/ASN1Set;->getObjectAt(I)Lorg/bouncycastle/asn1/DEREncodable;

    move-result-object v0

    .line 153
    .local v0, "obj":Lorg/bouncycastle/asn1/DEREncodable;
    instance-of v1, v0, Lorg/bouncycastle/asn1/ASN1Sequence;

    if-eqz v1, :cond_2

    .line 155
    check-cast v0, Lorg/bouncycastle/asn1/ASN1Sequence;

    .end local v0    # "obj":Lorg/bouncycastle/asn1/DEREncodable;
    invoke-virtual {v0}, Lorg/bouncycastle/asn1/ASN1Sequence;->parser()Lorg/bouncycastle/asn1/ASN1SequenceParser;

    move-result-object v0

    goto :goto_0

    .line 157
    .restart local v0    # "obj":Lorg/bouncycastle/asn1/DEREncodable;
    :cond_2
    instance-of v1, v0, Lorg/bouncycastle/asn1/ASN1Set;

    if-eqz v1, :cond_0

    .line 159
    check-cast v0, Lorg/bouncycastle/asn1/ASN1Set;

    .end local v0    # "obj":Lorg/bouncycastle/asn1/DEREncodable;
    invoke-virtual {v0}, Lorg/bouncycastle/asn1/ASN1Set;->parser()Lorg/bouncycastle/asn1/ASN1SetParser;

    move-result-object v0

    goto :goto_0
.end method
