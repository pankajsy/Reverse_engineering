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

public class RC2CBCParameter
        extends ASN1Encodable {
    ASN1OctetString iv;
    DERInteger version;

    public RC2CBCParameter(int paramInt, byte[] paramArrayOfByte) {
        this.version = new DERInteger(paramInt);
        this.iv = new DEROctetString(paramArrayOfByte);
    }

    public RC2CBCParameter(ASN1Sequence paramASN1Sequence) {
        if (paramASN1Sequence.size() == 1) {
            this.version = null;
            this.iv = ((ASN1OctetString) paramASN1Sequence.getObjectAt(0));
            return;
        }
        this.version = ((DERInteger) paramASN1Sequence.getObjectAt(0));
        this.iv = ((ASN1OctetString) paramASN1Sequence.getObjectAt(1));
    }

    public RC2CBCParameter(byte[] paramArrayOfByte) {
        this.version = null;
        this.iv = new DEROctetString(paramArrayOfByte);
    }

    public static RC2CBCParameter getInstance(Object paramObject) {
        if ((paramObject instanceof ASN1Sequence)) {
            return new RC2CBCParameter((ASN1Sequence) paramObject);
        }
        throw new IllegalArgumentException("unknown object in RC2CBCParameter factory");
    }

    public byte[] getIV() {
        return this.iv.getOctets();
    }

    public BigInteger getRC2ParameterVersion() {
        if (this.version == null) {
            return null;
        }
        return this.version.getValue();
    }

    public DERObject toASN1Object() {
        ASN1EncodableVector localASN1EncodableVector = new ASN1EncodableVector();
        if (this.version != null) {
            localASN1EncodableVector.add(this.version);
        }
        localASN1EncodableVector.add(this.iv);
        return new DERSequence(localASN1EncodableVector);
    }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/org/bouncycastle/asn1/pkcs/RC2CBCParameter.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */