package org.bouncycastle.asn1.pkcs;

import org.bouncycastle.asn1.ASN1Encodable;
import org.bouncycastle.asn1.ASN1EncodableVector;
import org.bouncycastle.asn1.ASN1OctetString;
import org.bouncycastle.asn1.ASN1Sequence;
import org.bouncycastle.asn1.DERInteger;
import org.bouncycastle.asn1.DERObject;
import org.bouncycastle.asn1.DEROctetString;
import org.bouncycastle.asn1.DERSequence;

import java.math.BigInteger;

public class PBKDF2Params
        extends ASN1Encodable {
    DERInteger iterationCount;
    DERInteger keyLength;
    ASN1OctetString octStr;

    public PBKDF2Params(ASN1Sequence paramASN1Sequence) {
        paramASN1Sequence = paramASN1Sequence.getObjects();
        this.octStr = ((ASN1OctetString) paramASN1Sequence.nextElement());
        this.iterationCount = ((DERInteger) paramASN1Sequence.nextElement());
        if (paramASN1Sequence.hasMoreElements()) {
            this.keyLength = ((DERInteger) paramASN1Sequence.nextElement());
            return;
        }
        this.keyLength = null;
    }

    public PBKDF2Params(byte[] paramArrayOfByte, int paramInt) {
        this.octStr = new DEROctetString(paramArrayOfByte);
        this.iterationCount = new DERInteger(paramInt);
    }

    public static PBKDF2Params getInstance(Object paramObject) {
        if ((paramObject instanceof PBKDF2Params)) {
            return (PBKDF2Params) paramObject;
        }
        if ((paramObject instanceof ASN1Sequence)) {
            return new PBKDF2Params((ASN1Sequence) paramObject);
        }
        throw new IllegalArgumentException("unknown object in factory: " + paramObject.getClass().getName());
    }

    public BigInteger getIterationCount() {
        return this.iterationCount.getValue();
    }

    public BigInteger getKeyLength() {
        if (this.keyLength != null) {
            return this.keyLength.getValue();
        }
        return null;
    }

    public byte[] getSalt() {
        return this.octStr.getOctets();
    }

    public DERObject toASN1Object() {
        ASN1EncodableVector localASN1EncodableVector = new ASN1EncodableVector();
        localASN1EncodableVector.add(this.octStr);
        localASN1EncodableVector.add(this.iterationCount);
        if (this.keyLength != null) {
            localASN1EncodableVector.add(this.keyLength);
        }
        return new DERSequence(localASN1EncodableVector);
    }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/org/bouncycastle/asn1/pkcs/PBKDF2Params.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */