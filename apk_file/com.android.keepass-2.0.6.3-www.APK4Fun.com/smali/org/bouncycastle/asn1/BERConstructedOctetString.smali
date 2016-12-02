.class public Lorg/bouncycastle/asn1/BERConstructedOctetString;
.super Lorg/bouncycastle/asn1/DEROctetString;
.source "BERConstructedOctetString.java"


# static fields
.field private static final MAX_LENGTH:I = 0x3e8


# instance fields
.field private octs:Ljava/util/Vector;


# direct methods
.method public constructor <init>(Ljava/util/Vector;)V
    .locals 1
    .param p1, "octs"    # Ljava/util/Vector;

    .prologue
    .line 57
    invoke-static {p1}, Lorg/bouncycastle/asn1/BERConstructedOctetString;->toBytes(Ljava/util/Vector;)[B

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/bouncycastle/asn1/DEROctetString;-><init>([B)V

    .line 59
    iput-object p1, p0, Lorg/bouncycastle/asn1/BERConstructedOctetString;->octs:Ljava/util/Vector;

    .line 60
    return-void
.end method

.method public constructor <init>(Lorg/bouncycastle/asn1/DEREncodable;)V
    .locals 1
    .param p1, "obj"    # Lorg/bouncycastle/asn1/DEREncodable;

    .prologue
    .line 71
    invoke-interface {p1}, Lorg/bouncycastle/asn1/DEREncodable;->getDERObject()Lorg/bouncycastle/asn1/DERObject;

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/bouncycastle/asn1/DEROctetString;-><init>(Lorg/bouncycastle/asn1/DEREncodable;)V

    .line 72
    return-void
.end method

.method public constructor <init>(Lorg/bouncycastle/asn1/DERObject;)V
    .locals 0
    .param p1, "obj"    # Lorg/bouncycastle/asn1/DERObject;

    .prologue
    .line 65
    invoke-direct {p0, p1}, Lorg/bouncycastle/asn1/DEROctetString;-><init>(Lorg/bouncycastle/asn1/DEREncodable;)V

    .line 66
    return-void
.end method

.method public constructor <init>([B)V
    .locals 0
    .param p1, "string"    # [B

    .prologue
    .line 51
    invoke-direct {p0, p1}, Lorg/bouncycastle/asn1/DEROctetString;-><init>([B)V

    .line 52
    return-void
.end method

.method private generateOcts()Ljava/util/Vector;
    .locals 7

    .prologue
    .line 94
    new-instance v3, Ljava/util/Vector;

    invoke-direct {v3}, Ljava/util/Vector;-><init>()V

    .line 95
    .local v3, "vec":Ljava/util/Vector;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    iget-object v4, p0, Lorg/bouncycastle/asn1/BERConstructedOctetString;->string:[B

    array-length v4, v4

    if-ge v1, v4, :cond_1

    .line 99
    add-int/lit16 v4, v1, 0x3e8

    iget-object v5, p0, Lorg/bouncycastle/asn1/BERConstructedOctetString;->string:[B

    array-length v5, v5

    if-le v4, v5, :cond_0

    .line 101
    iget-object v4, p0, Lorg/bouncycastle/asn1/BERConstructedOctetString;->string:[B

    array-length v0, v4

    .line 108
    .local v0, "end":I
    :goto_1
    sub-int v4, v0, v1

    new-array v2, v4, [B

    .line 110
    .local v2, "nStr":[B
    iget-object v4, p0, Lorg/bouncycastle/asn1/BERConstructedOctetString;->string:[B

    const/4 v5, 0x0

    array-length v6, v2

    invoke-static {v4, v1, v2, v5, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 112
    new-instance v4, Lorg/bouncycastle/asn1/DEROctetString;

    invoke-direct {v4, v2}, Lorg/bouncycastle/asn1/DEROctetString;-><init>([B)V

    invoke-virtual {v3, v4}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 95
    add-int/lit16 v1, v1, 0x3e8

    goto :goto_0

    .line 105
    .end local v0    # "end":I
    .end local v2    # "nStr":[B
    :cond_0
    add-int/lit16 v0, v1, 0x3e8

    .restart local v0    # "end":I
    goto :goto_1

    .line 115
    .end local v0    # "end":I
    :cond_1
    return-object v3
.end method

.method private static toBytes(Ljava/util/Vector;)[B
    .locals 7
    .param p0, "octs"    # Ljava/util/Vector;

    .prologue
    .line 20
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 22
    .local v0, "bOut":Ljava/io/ByteArrayOutputStream;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    invoke-virtual {p0}, Ljava/util/Vector;->size()I

    move-result v4

    if-eq v2, v4, :cond_0

    .line 26
    :try_start_0
    invoke-virtual {p0, v2}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/bouncycastle/asn1/DEROctetString;

    .line 28
    .local v3, "o":Lorg/bouncycastle/asn1/DEROctetString;
    invoke-virtual {v3}, Lorg/bouncycastle/asn1/DEROctetString;->getOctets()[B

    move-result-object v4

    invoke-virtual {v0, v4}, Ljava/io/ByteArrayOutputStream;->write([B)V
    :try_end_0
    .catch Ljava/lang/ClassCastException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    .line 22
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 30
    .end local v3    # "o":Lorg/bouncycastle/asn1/DEROctetString;
    :catch_0
    move-exception v1

    .line 32
    .local v1, "e":Ljava/lang/ClassCastException;
    new-instance v4, Ljava/lang/IllegalArgumentException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0, v2}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " found in input should only contain DEROctetString"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 34
    .end local v1    # "e":Ljava/lang/ClassCastException;
    :catch_1
    move-exception v1

    .line 36
    .local v1, "e":Ljava/io/IOException;
    new-instance v4, Ljava/lang/IllegalArgumentException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "exception converting octets "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v1}, Ljava/io/IOException;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 40
    .end local v1    # "e":Ljava/io/IOException;
    :cond_0
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v4

    return-object v4
.end method


# virtual methods
.method public encode(Lorg/bouncycastle/asn1/DEROutputStream;)V
    .locals 3
    .param p1, "out"    # Lorg/bouncycastle/asn1/DEROutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 122
    instance-of v1, p1, Lorg/bouncycastle/asn1/ASN1OutputStream;

    if-nez v1, :cond_0

    instance-of v1, p1, Lorg/bouncycastle/asn1/BEROutputStream;

    if-eqz v1, :cond_2

    .line 124
    :cond_0
    const/16 v1, 0x24

    invoke-virtual {p1, v1}, Lorg/bouncycastle/asn1/DEROutputStream;->write(I)V

    .line 126
    const/16 v1, 0x80

    invoke-virtual {p1, v1}, Lorg/bouncycastle/asn1/DEROutputStream;->write(I)V

    .line 131
    invoke-virtual {p0}, Lorg/bouncycastle/asn1/BERConstructedOctetString;->getObjects()Ljava/util/Enumeration;

    move-result-object v0

    .line 132
    .local v0, "e":Ljava/util/Enumeration;
    :goto_0
    invoke-interface {v0}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 134
    invoke-interface {v0}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {p1, v1}, Lorg/bouncycastle/asn1/DEROutputStream;->writeObject(Ljava/lang/Object;)V

    goto :goto_0

    .line 137
    :cond_1
    invoke-virtual {p1, v2}, Lorg/bouncycastle/asn1/DEROutputStream;->write(I)V

    .line 138
    invoke-virtual {p1, v2}, Lorg/bouncycastle/asn1/DEROutputStream;->write(I)V

    .line 144
    .end local v0    # "e":Ljava/util/Enumeration;
    :goto_1
    return-void

    .line 142
    :cond_2
    invoke-super {p0, p1}, Lorg/bouncycastle/asn1/DEROctetString;->encode(Lorg/bouncycastle/asn1/DEROutputStream;)V

    goto :goto_1
.end method

.method public getObjects()Ljava/util/Enumeration;
    .locals 1

    .prologue
    .line 84
    iget-object v0, p0, Lorg/bouncycastle/asn1/BERConstructedOctetString;->octs:Ljava/util/Vector;

    if-nez v0, :cond_0

    .line 86
    invoke-direct {p0}, Lorg/bouncycastle/asn1/BERConstructedOctetString;->generateOcts()Ljava/util/Vector;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/Vector;->elements()Ljava/util/Enumeration;

    move-result-object v0

    .line 89
    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lorg/bouncycastle/asn1/BERConstructedOctetString;->octs:Ljava/util/Vector;

    invoke-virtual {v0}, Ljava/util/Vector;->elements()Ljava/util/Enumeration;

    move-result-object v0

    goto :goto_0
.end method

.method public getOctets()[B
    .locals 1

    .prologue
    .line 76
    iget-object v0, p0, Lorg/bouncycastle/asn1/BERConstructedOctetString;->string:[B

    return-object v0
.end method
