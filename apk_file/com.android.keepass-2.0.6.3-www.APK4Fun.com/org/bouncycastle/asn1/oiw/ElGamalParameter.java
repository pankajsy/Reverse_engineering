package org.bouncycastle.asn1.oiw;

import org.bouncycastle.asn1.ASN1Encodable;
import org.bouncycastle.asn1.ASN1EncodableVector;
import org.bouncycastle.asn1.ASN1Sequence;
import org.bouncycastle.asn1.DERInteger;
import org.bouncycastle.asn1.DERObject;
import org.bouncycastle.asn1.DERSequence;

import java.math.BigInteger;

public class ElGamalParameter
        extends ASN1Encodable {
    DERInteger g;
    DERInteger p;

    public ElGamalParameter(BigInteger paramBigInteger1, BigInteger paramBigInteger2) {
        this.p = new DERInteger(paramBigInteger1);
        this.g = new DERInteger(paramBigInteger2);
    }

    public ElGamalParameter(ASN1Sequence paramASN1Sequence) {
        paramASN1Sequence = paramASN1Sequence.getObjects();
        this.p = ((DERInteger) paramASN1Sequence.nextElement());
        this.g = ((DERInteger) paramASN1Sequence.nextElement());
    }

    public BigInteger getG() {
        return this.g.getPositiveValue();
    }

    public BigInteger getP() {
        return this.p.getPositiveValue();
    }

    public DERObject toASN1Object() {
        ASN1EncodableVector localASN1EncodableVector = new ASN1EncodableVector();
        localASN1EncodableVector.add(this.p);
        localASN1EncodableVector.add(this.g);
        return new DERSequence(localASN1EncodableVector);
    }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/org/bouncycastle/asn1/oiw/ElGamalParameter.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */