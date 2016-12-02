package org.bouncycastle.asn1.pkcs;

import org.bouncycastle.asn1.ASN1Encodable;
import org.bouncycastle.asn1.ASN1EncodableVector;
import org.bouncycastle.asn1.ASN1Sequence;
import org.bouncycastle.asn1.DERInteger;
import org.bouncycastle.asn1.DERObject;
import org.bouncycastle.asn1.DERSequence;

import java.math.BigInteger;

public class DHParameter
        extends ASN1Encodable {
    DERInteger g;
    DERInteger l;
    DERInteger p;

    public DHParameter(BigInteger paramBigInteger1, BigInteger paramBigInteger2, int paramInt) {
        this.p = new DERInteger(paramBigInteger1);
        this.g = new DERInteger(paramBigInteger2);
        if (paramInt != 0) {
            this.l = new DERInteger(paramInt);
            return;
        }
        this.l = null;
    }

    public DHParameter(ASN1Sequence paramASN1Sequence) {
        paramASN1Sequence = paramASN1Sequence.getObjects();
        this.p = ((DERInteger) paramASN1Sequence.nextElement());
        this.g = ((DERInteger) paramASN1Sequence.nextElement());
        if (paramASN1Sequence.hasMoreElements()) {
            this.l = ((DERInteger) paramASN1Sequence.nextElement());
            return;
        }
        this.l = null;
    }

    public BigInteger getG() {
        return this.g.getPositiveValue();
    }

    public BigInteger getL() {
        if (this.l == null) {
            return null;
        }
        return this.l.getPositiveValue();
    }

    public BigInteger getP() {
        return this.p.getPositiveValue();
    }

    public DERObject toASN1Object() {
        ASN1EncodableVector localASN1EncodableVector = new ASN1EncodableVector();
        localASN1EncodableVector.add(this.p);
        localASN1EncodableVector.add(this.g);
        if (getL() != null) {
            localASN1EncodableVector.add(this.l);
        }
        return new DERSequence(localASN1EncodableVector);
    }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/org/bouncycastle/asn1/pkcs/DHParameter.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */