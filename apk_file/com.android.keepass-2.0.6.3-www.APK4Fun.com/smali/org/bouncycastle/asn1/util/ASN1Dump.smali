.class public Lorg/bouncycastle/asn1/util/ASN1Dump;
.super Ljava/lang/Object;
.source "ASN1Dump.java"


# static fields
.field private static final SAMPLE_SIZE:I = 0x20

.field private static final TAB:Ljava/lang/String; = "    "


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 44
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static _dumpAsString(Ljava/lang/String;ZLorg/bouncycastle/asn1/DERObject;Ljava/lang/StringBuffer;)V
    .locals 11
    .param p0, "indent"    # Ljava/lang/String;
    .param p1, "verbose"    # Z
    .param p2, "obj"    # Lorg/bouncycastle/asn1/DERObject;
    .param p3, "buf"    # Ljava/lang/StringBuffer;

    .prologue
    .line 60
    const-string v8, "line.separator"

    invoke-static {v8}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 61
    .local v4, "nl":Ljava/lang/String;
    instance-of v8, p2, Lorg/bouncycastle/asn1/ASN1Sequence;

    if-eqz v8, :cond_7

    move-object v8, p2

    .line 63
    check-cast v8, Lorg/bouncycastle/asn1/ASN1Sequence;

    invoke-virtual {v8}, Lorg/bouncycastle/asn1/ASN1Sequence;->getObjects()Ljava/util/Enumeration;

    move-result-object v1

    .line 64
    .local v1, "e":Ljava/util/Enumeration;
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "    "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    .line 66
    .local v7, "tab":Ljava/lang/String;
    invoke-virtual {p3, p0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 67
    instance-of v8, p2, Lorg/bouncycastle/asn1/BERConstructedSequence;

    if-eqz v8, :cond_1

    .line 69
    const-string v8, "BER ConstructedSequence"

    invoke-virtual {p3, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 88
    :goto_0
    invoke-virtual {p3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 90
    :goto_1
    invoke-interface {v1}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v8

    if-eqz v8, :cond_9

    .line 92
    invoke-interface {v1}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v5

    .line 94
    .local v5, "o":Ljava/lang/Object;
    if-eqz v5, :cond_0

    new-instance v8, Lorg/bouncycastle/asn1/DERNull;

    invoke-direct {v8}, Lorg/bouncycastle/asn1/DERNull;-><init>()V

    invoke-virtual {v5, v8}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_5

    .line 96
    :cond_0
    invoke-virtual {p3, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 97
    const-string v8, "NULL"

    invoke-virtual {p3, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 98
    invoke-virtual {p3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_1

    .line 71
    .end local v5    # "o":Ljava/lang/Object;
    :cond_1
    instance-of v8, p2, Lorg/bouncycastle/asn1/DERConstructedSequence;

    if-eqz v8, :cond_2

    .line 73
    const-string v8, "DER ConstructedSequence"

    invoke-virtual {p3, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_0

    .line 75
    :cond_2
    instance-of v8, p2, Lorg/bouncycastle/asn1/BERSequence;

    if-eqz v8, :cond_3

    .line 77
    const-string v8, "BER Sequence"

    invoke-virtual {p3, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_0

    .line 79
    :cond_3
    instance-of v8, p2, Lorg/bouncycastle/asn1/DERSequence;

    if-eqz v8, :cond_4

    .line 81
    const-string v8, "DER Sequence"

    invoke-virtual {p3, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_0

    .line 85
    :cond_4
    const-string v8, "Sequence"

    invoke-virtual {p3, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_0

    .line 100
    .restart local v5    # "o":Ljava/lang/Object;
    :cond_5
    instance-of v8, v5, Lorg/bouncycastle/asn1/DERObject;

    if-eqz v8, :cond_6

    .line 102
    check-cast v5, Lorg/bouncycastle/asn1/DERObject;

    .end local v5    # "o":Ljava/lang/Object;
    invoke-static {v7, p1, v5, p3}, Lorg/bouncycastle/asn1/util/ASN1Dump;->_dumpAsString(Ljava/lang/String;ZLorg/bouncycastle/asn1/DERObject;Ljava/lang/StringBuffer;)V

    goto :goto_1

    .line 106
    .restart local v5    # "o":Ljava/lang/Object;
    :cond_6
    check-cast v5, Lorg/bouncycastle/asn1/DEREncodable;

    .end local v5    # "o":Ljava/lang/Object;
    invoke-interface {v5}, Lorg/bouncycastle/asn1/DEREncodable;->getDERObject()Lorg/bouncycastle/asn1/DERObject;

    move-result-object v8

    invoke-static {v7, p1, v8, p3}, Lorg/bouncycastle/asn1/util/ASN1Dump;->_dumpAsString(Ljava/lang/String;ZLorg/bouncycastle/asn1/DERObject;Ljava/lang/StringBuffer;)V

    goto :goto_1

    .line 110
    .end local v1    # "e":Ljava/util/Enumeration;
    .end local v7    # "tab":Ljava/lang/String;
    :cond_7
    instance-of v8, p2, Lorg/bouncycastle/asn1/DERTaggedObject;

    if-eqz v8, :cond_c

    .line 112
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "    "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    .line 114
    .restart local v7    # "tab":Ljava/lang/String;
    invoke-virtual {p3, p0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 115
    instance-of v8, p2, Lorg/bouncycastle/asn1/BERTaggedObject;

    if-eqz v8, :cond_a

    .line 117
    const-string v8, "BER Tagged ["

    invoke-virtual {p3, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    :goto_2
    move-object v5, p2

    .line 124
    check-cast v5, Lorg/bouncycastle/asn1/DERTaggedObject;

    .line 126
    .local v5, "o":Lorg/bouncycastle/asn1/DERTaggedObject;
    invoke-virtual {v5}, Lorg/bouncycastle/asn1/DERTaggedObject;->getTagNo()I

    move-result v8

    invoke-static {v8}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {p3, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 127
    const/16 v8, 0x5d

    invoke-virtual {p3, v8}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 129
    invoke-virtual {v5}, Lorg/bouncycastle/asn1/DERTaggedObject;->isExplicit()Z

    move-result v8

    if-nez v8, :cond_8

    .line 131
    const-string v8, " IMPLICIT "

    invoke-virtual {p3, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 134
    :cond_8
    invoke-virtual {p3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 136
    invoke-virtual {v5}, Lorg/bouncycastle/asn1/DERTaggedObject;->isEmpty()Z

    move-result v8

    if-eqz v8, :cond_b

    .line 138
    invoke-virtual {p3, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 139
    const-string v8, "EMPTY"

    invoke-virtual {p3, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 140
    invoke-virtual {p3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 355
    .end local v5    # "o":Lorg/bouncycastle/asn1/DERTaggedObject;
    .end local v7    # "tab":Ljava/lang/String;
    .end local p2    # "obj":Lorg/bouncycastle/asn1/DERObject;
    :cond_9
    :goto_3
    return-void

    .line 121
    .restart local v7    # "tab":Ljava/lang/String;
    .restart local p2    # "obj":Lorg/bouncycastle/asn1/DERObject;
    :cond_a
    const-string v8, "Tagged ["

    invoke-virtual {p3, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_2

    .line 144
    .restart local v5    # "o":Lorg/bouncycastle/asn1/DERTaggedObject;
    :cond_b
    invoke-virtual {v5}, Lorg/bouncycastle/asn1/DERTaggedObject;->getObject()Lorg/bouncycastle/asn1/DERObject;

    move-result-object v8

    invoke-static {v7, p1, v8, p3}, Lorg/bouncycastle/asn1/util/ASN1Dump;->_dumpAsString(Ljava/lang/String;ZLorg/bouncycastle/asn1/DERObject;Ljava/lang/StringBuffer;)V

    goto :goto_3

    .line 147
    .end local v5    # "o":Lorg/bouncycastle/asn1/DERTaggedObject;
    .end local v7    # "tab":Ljava/lang/String;
    :cond_c
    instance-of v8, p2, Lorg/bouncycastle/asn1/DERConstructedSet;

    if-eqz v8, :cond_f

    .line 149
    check-cast p2, Lorg/bouncycastle/asn1/ASN1Set;

    .end local p2    # "obj":Lorg/bouncycastle/asn1/DERObject;
    invoke-virtual {p2}, Lorg/bouncycastle/asn1/ASN1Set;->getObjects()Ljava/util/Enumeration;

    move-result-object v1

    .line 150
    .restart local v1    # "e":Ljava/util/Enumeration;
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "    "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    .line 152
    .restart local v7    # "tab":Ljava/lang/String;
    invoke-virtual {p3, p0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 153
    const-string v8, "ConstructedSet"

    invoke-virtual {p3, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 154
    invoke-virtual {p3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 156
    :goto_4
    invoke-interface {v1}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v8

    if-eqz v8, :cond_9

    .line 158
    invoke-interface {v1}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v5

    .line 160
    .local v5, "o":Ljava/lang/Object;
    if-nez v5, :cond_d

    .line 162
    invoke-virtual {p3, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 163
    const-string v8, "NULL"

    invoke-virtual {p3, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 164
    invoke-virtual {p3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_4

    .line 166
    :cond_d
    instance-of v8, v5, Lorg/bouncycastle/asn1/DERObject;

    if-eqz v8, :cond_e

    .line 168
    check-cast v5, Lorg/bouncycastle/asn1/DERObject;

    .end local v5    # "o":Ljava/lang/Object;
    invoke-static {v7, p1, v5, p3}, Lorg/bouncycastle/asn1/util/ASN1Dump;->_dumpAsString(Ljava/lang/String;ZLorg/bouncycastle/asn1/DERObject;Ljava/lang/StringBuffer;)V

    goto :goto_4

    .line 172
    .restart local v5    # "o":Ljava/lang/Object;
    :cond_e
    check-cast v5, Lorg/bouncycastle/asn1/DEREncodable;

    .end local v5    # "o":Ljava/lang/Object;
    invoke-interface {v5}, Lorg/bouncycastle/asn1/DEREncodable;->getDERObject()Lorg/bouncycastle/asn1/DERObject;

    move-result-object v8

    invoke-static {v7, p1, v8, p3}, Lorg/bouncycastle/asn1/util/ASN1Dump;->_dumpAsString(Ljava/lang/String;ZLorg/bouncycastle/asn1/DERObject;Ljava/lang/StringBuffer;)V

    goto :goto_4

    .line 176
    .end local v1    # "e":Ljava/util/Enumeration;
    .end local v7    # "tab":Ljava/lang/String;
    .restart local p2    # "obj":Lorg/bouncycastle/asn1/DERObject;
    :cond_f
    instance-of v8, p2, Lorg/bouncycastle/asn1/BERSet;

    if-eqz v8, :cond_12

    .line 178
    check-cast p2, Lorg/bouncycastle/asn1/ASN1Set;

    .end local p2    # "obj":Lorg/bouncycastle/asn1/DERObject;
    invoke-virtual {p2}, Lorg/bouncycastle/asn1/ASN1Set;->getObjects()Ljava/util/Enumeration;

    move-result-object v1

    .line 179
    .restart local v1    # "e":Ljava/util/Enumeration;
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "    "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    .line 181
    .restart local v7    # "tab":Ljava/lang/String;
    invoke-virtual {p3, p0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 182
    const-string v8, "BER Set"

    invoke-virtual {p3, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 183
    invoke-virtual {p3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 185
    :goto_5
    invoke-interface {v1}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v8

    if-eqz v8, :cond_9

    .line 187
    invoke-interface {v1}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v5

    .line 189
    .restart local v5    # "o":Ljava/lang/Object;
    if-nez v5, :cond_10

    .line 191
    invoke-virtual {p3, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 192
    const-string v8, "NULL"

    invoke-virtual {p3, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 193
    invoke-virtual {p3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_5

    .line 195
    :cond_10
    instance-of v8, v5, Lorg/bouncycastle/asn1/DERObject;

    if-eqz v8, :cond_11

    .line 197
    check-cast v5, Lorg/bouncycastle/asn1/DERObject;

    .end local v5    # "o":Ljava/lang/Object;
    invoke-static {v7, p1, v5, p3}, Lorg/bouncycastle/asn1/util/ASN1Dump;->_dumpAsString(Ljava/lang/String;ZLorg/bouncycastle/asn1/DERObject;Ljava/lang/StringBuffer;)V

    goto :goto_5

    .line 201
    .restart local v5    # "o":Ljava/lang/Object;
    :cond_11
    check-cast v5, Lorg/bouncycastle/asn1/DEREncodable;

    .end local v5    # "o":Ljava/lang/Object;
    invoke-interface {v5}, Lorg/bouncycastle/asn1/DEREncodable;->getDERObject()Lorg/bouncycastle/asn1/DERObject;

    move-result-object v8

    invoke-static {v7, p1, v8, p3}, Lorg/bouncycastle/asn1/util/ASN1Dump;->_dumpAsString(Ljava/lang/String;ZLorg/bouncycastle/asn1/DERObject;Ljava/lang/StringBuffer;)V

    goto :goto_5

    .line 205
    .end local v1    # "e":Ljava/util/Enumeration;
    .end local v7    # "tab":Ljava/lang/String;
    .restart local p2    # "obj":Lorg/bouncycastle/asn1/DERObject;
    :cond_12
    instance-of v8, p2, Lorg/bouncycastle/asn1/DERSet;

    if-eqz v8, :cond_15

    .line 207
    check-cast p2, Lorg/bouncycastle/asn1/ASN1Set;

    .end local p2    # "obj":Lorg/bouncycastle/asn1/DERObject;
    invoke-virtual {p2}, Lorg/bouncycastle/asn1/ASN1Set;->getObjects()Ljava/util/Enumeration;

    move-result-object v1

    .line 208
    .restart local v1    # "e":Ljava/util/Enumeration;
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "    "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    .line 210
    .restart local v7    # "tab":Ljava/lang/String;
    invoke-virtual {p3, p0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 211
    const-string v8, "DER Set"

    invoke-virtual {p3, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 212
    invoke-virtual {p3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 214
    :goto_6
    invoke-interface {v1}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v8

    if-eqz v8, :cond_9

    .line 216
    invoke-interface {v1}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v5

    .line 218
    .restart local v5    # "o":Ljava/lang/Object;
    if-nez v5, :cond_13

    .line 220
    invoke-virtual {p3, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 221
    const-string v8, "NULL"

    invoke-virtual {p3, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 222
    invoke-virtual {p3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_6

    .line 224
    :cond_13
    instance-of v8, v5, Lorg/bouncycastle/asn1/DERObject;

    if-eqz v8, :cond_14

    .line 226
    check-cast v5, Lorg/bouncycastle/asn1/DERObject;

    .end local v5    # "o":Ljava/lang/Object;
    invoke-static {v7, p1, v5, p3}, Lorg/bouncycastle/asn1/util/ASN1Dump;->_dumpAsString(Ljava/lang/String;ZLorg/bouncycastle/asn1/DERObject;Ljava/lang/StringBuffer;)V

    goto :goto_6

    .line 230
    .restart local v5    # "o":Ljava/lang/Object;
    :cond_14
    check-cast v5, Lorg/bouncycastle/asn1/DEREncodable;

    .end local v5    # "o":Ljava/lang/Object;
    invoke-interface {v5}, Lorg/bouncycastle/asn1/DEREncodable;->getDERObject()Lorg/bouncycastle/asn1/DERObject;

    move-result-object v8

    invoke-static {v7, p1, v8, p3}, Lorg/bouncycastle/asn1/util/ASN1Dump;->_dumpAsString(Ljava/lang/String;ZLorg/bouncycastle/asn1/DERObject;Ljava/lang/StringBuffer;)V

    goto :goto_6

    .line 234
    .end local v1    # "e":Ljava/util/Enumeration;
    .end local v7    # "tab":Ljava/lang/String;
    .restart local p2    # "obj":Lorg/bouncycastle/asn1/DERObject;
    :cond_15
    instance-of v8, p2, Lorg/bouncycastle/asn1/DERObjectIdentifier;

    if-eqz v8, :cond_16

    .line 236
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "ObjectIdentifier("

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    check-cast p2, Lorg/bouncycastle/asn1/DERObjectIdentifier;

    .end local p2    # "obj":Lorg/bouncycastle/asn1/DERObject;
    invoke-virtual {p2}, Lorg/bouncycastle/asn1/DERObjectIdentifier;->getId()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, ")"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {p3, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto/16 :goto_3

    .line 238
    .restart local p2    # "obj":Lorg/bouncycastle/asn1/DERObject;
    :cond_16
    instance-of v8, p2, Lorg/bouncycastle/asn1/DERBoolean;

    if-eqz v8, :cond_17

    .line 240
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "Boolean("

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    check-cast p2, Lorg/bouncycastle/asn1/DERBoolean;

    .end local p2    # "obj":Lorg/bouncycastle/asn1/DERObject;
    invoke-virtual {p2}, Lorg/bouncycastle/asn1/DERBoolean;->isTrue()Z

    move-result v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, ")"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {p3, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto/16 :goto_3

    .line 242
    .restart local p2    # "obj":Lorg/bouncycastle/asn1/DERObject;
    :cond_17
    instance-of v8, p2, Lorg/bouncycastle/asn1/DERInteger;

    if-eqz v8, :cond_18

    .line 244
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "Integer("

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    check-cast p2, Lorg/bouncycastle/asn1/DERInteger;

    .end local p2    # "obj":Lorg/bouncycastle/asn1/DERObject;
    invoke-virtual {p2}, Lorg/bouncycastle/asn1/DERInteger;->getValue()Ljava/math/BigInteger;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, ")"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {p3, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto/16 :goto_3

    .line 246
    .restart local p2    # "obj":Lorg/bouncycastle/asn1/DERObject;
    :cond_18
    instance-of v8, p2, Lorg/bouncycastle/asn1/BERConstructedOctetString;

    if-eqz v8, :cond_1a

    move-object v6, p2

    .line 248
    check-cast v6, Lorg/bouncycastle/asn1/ASN1OctetString;

    .line 249
    .local v6, "oct":Lorg/bouncycastle/asn1/ASN1OctetString;
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "BER Constructed Octet String"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "["

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v6}, Lorg/bouncycastle/asn1/ASN1OctetString;->getOctets()[B

    move-result-object v9

    array-length v9, v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "] "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {p3, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 250
    if-eqz p1, :cond_19

    .line 252
    invoke-virtual {v6}, Lorg/bouncycastle/asn1/ASN1OctetString;->getOctets()[B

    move-result-object v8

    invoke-static {p0, v8}, Lorg/bouncycastle/asn1/util/ASN1Dump;->dumpBinaryDataAsString(Ljava/lang/String;[B)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {p3, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto/16 :goto_3

    .line 255
    :cond_19
    invoke-virtual {p3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto/16 :goto_3

    .line 258
    .end local v6    # "oct":Lorg/bouncycastle/asn1/ASN1OctetString;
    :cond_1a
    instance-of v8, p2, Lorg/bouncycastle/asn1/DEROctetString;

    if-eqz v8, :cond_1c

    move-object v6, p2

    .line 260
    check-cast v6, Lorg/bouncycastle/asn1/ASN1OctetString;

    .line 261
    .restart local v6    # "oct":Lorg/bouncycastle/asn1/ASN1OctetString;
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "DER Octet String"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "["

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v6}, Lorg/bouncycastle/asn1/ASN1OctetString;->getOctets()[B

    move-result-object v9

    array-length v9, v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "] "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {p3, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 262
    if-eqz p1, :cond_1b

    .line 264
    invoke-virtual {v6}, Lorg/bouncycastle/asn1/ASN1OctetString;->getOctets()[B

    move-result-object v8

    invoke-static {p0, v8}, Lorg/bouncycastle/asn1/util/ASN1Dump;->dumpBinaryDataAsString(Ljava/lang/String;[B)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {p3, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto/16 :goto_3

    .line 267
    :cond_1b
    invoke-virtual {p3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto/16 :goto_3

    .line 270
    .end local v6    # "oct":Lorg/bouncycastle/asn1/ASN1OctetString;
    :cond_1c
    instance-of v8, p2, Lorg/bouncycastle/asn1/DERBitString;

    if-eqz v8, :cond_1e

    move-object v0, p2

    .line 272
    check-cast v0, Lorg/bouncycastle/asn1/DERBitString;

    .line 273
    .local v0, "bt":Lorg/bouncycastle/asn1/DERBitString;
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "DER Bit String"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "["

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v0}, Lorg/bouncycastle/asn1/DERBitString;->getBytes()[B

    move-result-object v9

    array-length v9, v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, ", "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v0}, Lorg/bouncycastle/asn1/DERBitString;->getPadBits()I

    move-result v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "] "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {p3, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 274
    if-eqz p1, :cond_1d

    .line 276
    invoke-virtual {v0}, Lorg/bouncycastle/asn1/DERBitString;->getBytes()[B

    move-result-object v8

    invoke-static {p0, v8}, Lorg/bouncycastle/asn1/util/ASN1Dump;->dumpBinaryDataAsString(Ljava/lang/String;[B)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {p3, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto/16 :goto_3

    .line 279
    :cond_1d
    invoke-virtual {p3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto/16 :goto_3

    .line 282
    .end local v0    # "bt":Lorg/bouncycastle/asn1/DERBitString;
    :cond_1e
    instance-of v8, p2, Lorg/bouncycastle/asn1/DERIA5String;

    if-eqz v8, :cond_1f

    .line 284
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "IA5String("

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    check-cast p2, Lorg/bouncycastle/asn1/DERIA5String;

    .end local p2    # "obj":Lorg/bouncycastle/asn1/DERObject;
    invoke-virtual {p2}, Lorg/bouncycastle/asn1/DERIA5String;->getString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, ") "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {p3, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto/16 :goto_3

    .line 286
    .restart local p2    # "obj":Lorg/bouncycastle/asn1/DERObject;
    :cond_1f
    instance-of v8, p2, Lorg/bouncycastle/asn1/DERUTF8String;

    if-eqz v8, :cond_20

    .line 288
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "UTF8String("

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    check-cast p2, Lorg/bouncycastle/asn1/DERUTF8String;

    .end local p2    # "obj":Lorg/bouncycastle/asn1/DERObject;
    invoke-virtual {p2}, Lorg/bouncycastle/asn1/DERUTF8String;->getString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, ") "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {p3, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto/16 :goto_3

    .line 290
    .restart local p2    # "obj":Lorg/bouncycastle/asn1/DERObject;
    :cond_20
    instance-of v8, p2, Lorg/bouncycastle/asn1/DERPrintableString;

    if-eqz v8, :cond_21

    .line 292
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "PrintableString("

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    check-cast p2, Lorg/bouncycastle/asn1/DERPrintableString;

    .end local p2    # "obj":Lorg/bouncycastle/asn1/DERObject;
    invoke-virtual {p2}, Lorg/bouncycastle/asn1/DERPrintableString;->getString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, ") "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {p3, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto/16 :goto_3

    .line 294
    .restart local p2    # "obj":Lorg/bouncycastle/asn1/DERObject;
    :cond_21
    instance-of v8, p2, Lorg/bouncycastle/asn1/DERVisibleString;

    if-eqz v8, :cond_22

    .line 296
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "VisibleString("

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    check-cast p2, Lorg/bouncycastle/asn1/DERVisibleString;

    .end local p2    # "obj":Lorg/bouncycastle/asn1/DERObject;
    invoke-virtual {p2}, Lorg/bouncycastle/asn1/DERVisibleString;->getString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, ") "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {p3, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto/16 :goto_3

    .line 298
    .restart local p2    # "obj":Lorg/bouncycastle/asn1/DERObject;
    :cond_22
    instance-of v8, p2, Lorg/bouncycastle/asn1/DERBMPString;

    if-eqz v8, :cond_23

    .line 300
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "BMPString("

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    check-cast p2, Lorg/bouncycastle/asn1/DERBMPString;

    .end local p2    # "obj":Lorg/bouncycastle/asn1/DERObject;
    invoke-virtual {p2}, Lorg/bouncycastle/asn1/DERBMPString;->getString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, ") "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {p3, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto/16 :goto_3

    .line 302
    .restart local p2    # "obj":Lorg/bouncycastle/asn1/DERObject;
    :cond_23
    instance-of v8, p2, Lorg/bouncycastle/asn1/DERT61String;

    if-eqz v8, :cond_24

    .line 304
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "T61String("

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    check-cast p2, Lorg/bouncycastle/asn1/DERT61String;

    .end local p2    # "obj":Lorg/bouncycastle/asn1/DERObject;
    invoke-virtual {p2}, Lorg/bouncycastle/asn1/DERT61String;->getString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, ") "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {p3, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto/16 :goto_3

    .line 306
    .restart local p2    # "obj":Lorg/bouncycastle/asn1/DERObject;
    :cond_24
    instance-of v8, p2, Lorg/bouncycastle/asn1/DERUTCTime;

    if-eqz v8, :cond_25

    .line 308
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "UTCTime("

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    check-cast p2, Lorg/bouncycastle/asn1/DERUTCTime;

    .end local p2    # "obj":Lorg/bouncycastle/asn1/DERObject;
    invoke-virtual {p2}, Lorg/bouncycastle/asn1/DERUTCTime;->getTime()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, ") "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {p3, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto/16 :goto_3

    .line 310
    .restart local p2    # "obj":Lorg/bouncycastle/asn1/DERObject;
    :cond_25
    instance-of v8, p2, Lorg/bouncycastle/asn1/DERGeneralizedTime;

    if-eqz v8, :cond_26

    .line 312
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "GeneralizedTime("

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    check-cast p2, Lorg/bouncycastle/asn1/DERGeneralizedTime;

    .end local p2    # "obj":Lorg/bouncycastle/asn1/DERObject;
    invoke-virtual {p2}, Lorg/bouncycastle/asn1/DERGeneralizedTime;->getTime()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, ") "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {p3, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto/16 :goto_3

    .line 314
    .restart local p2    # "obj":Lorg/bouncycastle/asn1/DERObject;
    :cond_26
    instance-of v8, p2, Lorg/bouncycastle/asn1/DERUnknownTag;

    if-eqz v8, :cond_27

    .line 316
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "Unknown "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    move-object v8, p2

    check-cast v8, Lorg/bouncycastle/asn1/DERUnknownTag;

    invoke-virtual {v8}, Lorg/bouncycastle/asn1/DERUnknownTag;->getTag()I

    move-result v8

    const/16 v10, 0x10

    invoke-static {v8, v10}, Ljava/lang/Integer;->toString(II)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v9, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    new-instance v9, Ljava/lang/String;

    check-cast p2, Lorg/bouncycastle/asn1/DERUnknownTag;

    .end local p2    # "obj":Lorg/bouncycastle/asn1/DERObject;
    invoke-virtual {p2}, Lorg/bouncycastle/asn1/DERUnknownTag;->getData()[B

    move-result-object v10

    invoke-static {v10}, Lorg/bouncycastle/util/encoders/Hex;->encode([B)[B

    move-result-object v10

    invoke-direct {v9, v10}, Ljava/lang/String;-><init>([B)V

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {p3, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto/16 :goto_3

    .line 318
    .restart local p2    # "obj":Lorg/bouncycastle/asn1/DERObject;
    :cond_27
    instance-of v8, p2, Lorg/bouncycastle/asn1/BERApplicationSpecific;

    if-eqz v8, :cond_28

    .line 320
    const-string v8, "BER"

    invoke-static {v8, p0, p1, p2, v4}, Lorg/bouncycastle/asn1/util/ASN1Dump;->outputApplicationSpecific(Ljava/lang/String;Ljava/lang/String;ZLorg/bouncycastle/asn1/DERObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {p3, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto/16 :goto_3

    .line 322
    :cond_28
    instance-of v8, p2, Lorg/bouncycastle/asn1/DERApplicationSpecific;

    if-eqz v8, :cond_29

    .line 324
    const-string v8, "DER"

    invoke-static {v8, p0, p1, p2, v4}, Lorg/bouncycastle/asn1/util/ASN1Dump;->outputApplicationSpecific(Ljava/lang/String;Ljava/lang/String;ZLorg/bouncycastle/asn1/DERObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {p3, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto/16 :goto_3

    .line 326
    :cond_29
    instance-of v8, p2, Lorg/bouncycastle/asn1/DEREnumerated;

    if-eqz v8, :cond_2a

    move-object v2, p2

    .line 328
    check-cast v2, Lorg/bouncycastle/asn1/DEREnumerated;

    .line 329
    .local v2, "en":Lorg/bouncycastle/asn1/DEREnumerated;
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "DER Enumerated("

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v2}, Lorg/bouncycastle/asn1/DEREnumerated;->getValue()Ljava/math/BigInteger;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, ")"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {p3, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto/16 :goto_3

    .line 331
    .end local v2    # "en":Lorg/bouncycastle/asn1/DEREnumerated;
    :cond_2a
    instance-of v8, p2, Lorg/bouncycastle/asn1/DERExternal;

    if-eqz v8, :cond_2e

    move-object v3, p2

    .line 333
    check-cast v3, Lorg/bouncycastle/asn1/DERExternal;

    .line 334
    .local v3, "ext":Lorg/bouncycastle/asn1/DERExternal;
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "External "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {p3, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 335
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "    "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    .line 336
    .restart local v7    # "tab":Ljava/lang/String;
    invoke-virtual {v3}, Lorg/bouncycastle/asn1/DERExternal;->getDirectReference()Lorg/bouncycastle/asn1/DERObjectIdentifier;

    move-result-object v8

    if-eqz v8, :cond_2b

    .line 338
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "Direct Reference: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v3}, Lorg/bouncycastle/asn1/DERExternal;->getDirectReference()Lorg/bouncycastle/asn1/DERObjectIdentifier;

    move-result-object v9

    invoke-virtual {v9}, Lorg/bouncycastle/asn1/DERObjectIdentifier;->getId()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {p3, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 340
    :cond_2b
    invoke-virtual {v3}, Lorg/bouncycastle/asn1/DERExternal;->getIndirectReference()Lorg/bouncycastle/asn1/DERInteger;

    move-result-object v8

    if-eqz v8, :cond_2c

    .line 342
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "Indirect Reference: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v3}, Lorg/bouncycastle/asn1/DERExternal;->getIndirectReference()Lorg/bouncycastle/asn1/DERInteger;

    move-result-object v9

    invoke-virtual {v9}, Lorg/bouncycastle/asn1/DERInteger;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {p3, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 344
    :cond_2c
    invoke-virtual {v3}, Lorg/bouncycastle/asn1/DERExternal;->getDataValueDescriptor()Lorg/bouncycastle/asn1/ASN1Object;

    move-result-object v8

    if-eqz v8, :cond_2d

    .line 346
    invoke-virtual {v3}, Lorg/bouncycastle/asn1/DERExternal;->getDataValueDescriptor()Lorg/bouncycastle/asn1/ASN1Object;

    move-result-object v8

    invoke-static {v7, p1, v8, p3}, Lorg/bouncycastle/asn1/util/ASN1Dump;->_dumpAsString(Ljava/lang/String;ZLorg/bouncycastle/asn1/DERObject;Ljava/lang/StringBuffer;)V

    .line 348
    :cond_2d
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "Encoding: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v3}, Lorg/bouncycastle/asn1/DERExternal;->getEncoding()I

    move-result v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {p3, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 349
    invoke-virtual {v3}, Lorg/bouncycastle/asn1/DERExternal;->getExternalContent()Lorg/bouncycastle/asn1/DERObject;

    move-result-object v8

    invoke-static {v7, p1, v8, p3}, Lorg/bouncycastle/asn1/util/ASN1Dump;->_dumpAsString(Ljava/lang/String;ZLorg/bouncycastle/asn1/DERObject;Ljava/lang/StringBuffer;)V

    goto/16 :goto_3

    .line 353
    .end local v3    # "ext":Lorg/bouncycastle/asn1/DERExternal;
    .end local v7    # "tab":Ljava/lang/String;
    :cond_2e
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {p3, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto/16 :goto_3
.end method

.method private static calculateAscString([BII)Ljava/lang/String;
    .locals 4
    .param p0, "bytes"    # [B
    .param p1, "off"    # I
    .param p2, "len"    # I

    .prologue
    .line 461
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 463
    .local v0, "buf":Ljava/lang/StringBuffer;
    move v1, p1

    .local v1, "i":I
    :goto_0
    add-int v2, p1, p2

    if-eq v1, v2, :cond_1

    .line 465
    aget-byte v2, p0, v1

    const/16 v3, 0x20

    if-lt v2, v3, :cond_0

    aget-byte v2, p0, v1

    const/16 v3, 0x7e

    if-gt v2, v3, :cond_0

    .line 467
    aget-byte v2, p0, v1

    int-to-char v2, v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 463
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 471
    :cond_1
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method public static dumpAsString(Ljava/lang/Object;)Ljava/lang/String;
    .locals 1
    .param p0, "obj"    # Ljava/lang/Object;

    .prologue
    .line 392
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lorg/bouncycastle/asn1/util/ASN1Dump;->dumpAsString(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static dumpAsString(Ljava/lang/Object;Z)Ljava/lang/String;
    .locals 3
    .param p0, "obj"    # Ljava/lang/Object;
    .param p1, "verbose"    # Z

    .prologue
    .line 406
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 408
    .local v0, "buf":Ljava/lang/StringBuffer;
    instance-of v1, p0, Lorg/bouncycastle/asn1/DERObject;

    if-eqz v1, :cond_0

    .line 410
    const-string v1, ""

    check-cast p0, Lorg/bouncycastle/asn1/DERObject;

    .end local p0    # "obj":Ljava/lang/Object;
    invoke-static {v1, p1, p0, v0}, Lorg/bouncycastle/asn1/util/ASN1Dump;->_dumpAsString(Ljava/lang/String;ZLorg/bouncycastle/asn1/DERObject;Ljava/lang/StringBuffer;)V

    .line 421
    :goto_0
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    :goto_1
    return-object v1

    .line 412
    .restart local p0    # "obj":Ljava/lang/Object;
    :cond_0
    instance-of v1, p0, Lorg/bouncycastle/asn1/DEREncodable;

    if-eqz v1, :cond_1

    .line 414
    const-string v1, ""

    check-cast p0, Lorg/bouncycastle/asn1/DEREncodable;

    .end local p0    # "obj":Ljava/lang/Object;
    invoke-interface {p0}, Lorg/bouncycastle/asn1/DEREncodable;->getDERObject()Lorg/bouncycastle/asn1/DERObject;

    move-result-object v2

    invoke-static {v1, p1, v2, v0}, Lorg/bouncycastle/asn1/util/ASN1Dump;->_dumpAsString(Ljava/lang/String;ZLorg/bouncycastle/asn1/DERObject;Ljava/lang/StringBuffer;)V

    goto :goto_0

    .line 418
    .restart local p0    # "obj":Ljava/lang/Object;
    :cond_1
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "unknown object type "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_1
.end method

.method private static dumpBinaryDataAsString(Ljava/lang/String;[B)Ljava/lang/String;
    .locals 7
    .param p0, "indent"    # Ljava/lang/String;
    .param p1, "bytes"    # [B

    .prologue
    const/16 v6, 0x20

    .line 426
    const-string v4, "line.separator"

    invoke-static {v4}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 427
    .local v3, "nl":Ljava/lang/String;
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 429
    .local v0, "buf":Ljava/lang/StringBuffer;
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "    "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    .line 431
    invoke-virtual {v0, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 432
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    array-length v4, p1

    if-ge v1, v4, :cond_2

    .line 434
    array-length v4, p1

    sub-int/2addr v4, v1

    if-le v4, v6, :cond_0

    .line 436
    invoke-virtual {v0, p0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 437
    new-instance v4, Ljava/lang/String;

    invoke-static {p1, v1, v6}, Lorg/bouncycastle/util/encoders/Hex;->encode([BII)[B

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/String;-><init>([B)V

    invoke-virtual {v0, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 438
    const-string v4, "    "

    invoke-virtual {v0, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 439
    invoke-static {p1, v1, v6}, Lorg/bouncycastle/asn1/util/ASN1Dump;->calculateAscString([BII)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 440
    invoke-virtual {v0, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 432
    :goto_1
    add-int/lit8 v1, v1, 0x20

    goto :goto_0

    .line 444
    :cond_0
    invoke-virtual {v0, p0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 445
    new-instance v4, Ljava/lang/String;

    array-length v5, p1

    sub-int/2addr v5, v1

    invoke-static {p1, v1, v5}, Lorg/bouncycastle/util/encoders/Hex;->encode([BII)[B

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/String;-><init>([B)V

    invoke-virtual {v0, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 446
    array-length v4, p1

    sub-int v2, v4, v1

    .local v2, "j":I
    :goto_2
    if-eq v2, v6, :cond_1

    .line 448
    const-string v4, "  "

    invoke-virtual {v0, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 446
    add-int/lit8 v2, v2, 0x1

    goto :goto_2

    .line 450
    :cond_1
    const-string v4, "    "

    invoke-virtual {v0, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 451
    array-length v4, p1

    sub-int/2addr v4, v1

    invoke-static {p1, v1, v4}, Lorg/bouncycastle/asn1/util/ASN1Dump;->calculateAscString([BII)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 452
    invoke-virtual {v0, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_1

    .line 456
    .end local v2    # "j":I
    :cond_2
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    return-object v4
.end method

.method private static outputApplicationSpecific(Ljava/lang/String;Ljava/lang/String;ZLorg/bouncycastle/asn1/DERObject;Ljava/lang/String;)Ljava/lang/String;
    .locals 7
    .param p0, "type"    # Ljava/lang/String;
    .param p1, "indent"    # Ljava/lang/String;
    .param p2, "verbose"    # Z
    .param p3, "obj"    # Lorg/bouncycastle/asn1/DERObject;
    .param p4, "nl"    # Ljava/lang/String;

    .prologue
    .line 359
    move-object v0, p3

    check-cast v0, Lorg/bouncycastle/asn1/DERApplicationSpecific;

    .line 360
    .local v0, "app":Lorg/bouncycastle/asn1/DERApplicationSpecific;
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    .line 362
    .local v1, "buf":Ljava/lang/StringBuffer;
    invoke-virtual {v0}, Lorg/bouncycastle/asn1/DERApplicationSpecific;->isConstructed()Z

    move-result v4

    if-eqz v4, :cond_1

    .line 366
    const/16 v4, 0x10

    :try_start_0
    invoke-virtual {v0, v4}, Lorg/bouncycastle/asn1/DERApplicationSpecific;->getObject(I)Lorg/bouncycastle/asn1/DERObject;

    move-result-object v4

    invoke-static {v4}, Lorg/bouncycastle/asn1/ASN1Sequence;->getInstance(Ljava/lang/Object;)Lorg/bouncycastle/asn1/ASN1Sequence;

    move-result-object v3

    .line 367
    .local v3, "s":Lorg/bouncycastle/asn1/ASN1Sequence;
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " ApplicationSpecific["

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v0}, Lorg/bouncycastle/asn1/DERApplicationSpecific;->getApplicationTag()I

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "]"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 368
    invoke-virtual {v3}, Lorg/bouncycastle/asn1/ASN1Sequence;->getObjects()Ljava/util/Enumeration;

    move-result-object v2

    .local v2, "e":Ljava/util/Enumeration;
    :goto_0
    invoke-interface {v2}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 370
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "    "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v2}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/bouncycastle/asn1/DERObject;

    invoke-static {v5, p2, v4, v1}, Lorg/bouncycastle/asn1/util/ASN1Dump;->_dumpAsString(Ljava/lang/String;ZLorg/bouncycastle/asn1/DERObject;Ljava/lang/StringBuffer;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 373
    .end local v2    # "e":Ljava/util/Enumeration;
    .end local v3    # "s":Lorg/bouncycastle/asn1/ASN1Sequence;
    :catch_0
    move-exception v2

    .line 375
    .local v2, "e":Ljava/io/IOException;
    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    .line 377
    .end local v2    # "e":Ljava/io/IOException;
    :cond_0
    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    .line 380
    :goto_1
    return-object v4

    :cond_1
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " ApplicationSpecific["

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v0}, Lorg/bouncycastle/asn1/DERApplicationSpecific;->getApplicationTag()I

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "] ("

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    new-instance v5, Ljava/lang/String;

    invoke-virtual {v0}, Lorg/bouncycastle/asn1/DERApplicationSpecific;->getContents()[B

    move-result-object v6

    invoke-static {v6}, Lorg/bouncycastle/util/encoders/Hex;->encode([B)[B

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/String;-><init>([B)V

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ")"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    goto :goto_1
.end method
