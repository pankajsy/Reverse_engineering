package org.bouncycastle.asn1.pkcs;

import org.bouncycastle.asn1.ASN1Encodable;
import org.bouncycastle.asn1.ASN1EncodableVector;
import org.bouncycastle.asn1.ASN1Sequence;
import org.bouncycastle.asn1.ASN1Set;
import org.bouncycastle.asn1.DERObject;
import org.bouncycastle.asn1.DERObjectIdentifier;
import org.bouncycastle.asn1.DERSequence;

public class Attribute
        extends ASN1Encodable {
    private DERObjectIdentifier attrType;
    private ASN1Set attrValues;

    public Attribute(ASN1Sequence paramASN1Sequence) {
        this.attrType = ((DERObjectIdentifier) paramASN1Sequence.getObjectAt(0));
        this.attrValues = ((ASN1Set) paramASN1Sequence.getObjectAt(1));
    }

    public Attribute(DERObjectIdentifier paramDERObjectIdentifier, ASN1Set paramASN1Set) {
        this.attrType = paramDERObjectIdentifier;
        this.attrValues = paramASN1Set;
    }

    public static Attribute getInstance(Object paramObject) {
        if ((paramObject == null) || ((paramObject instanceof Attribute))) {
            return (Attribute) paramObject;
        }
        if ((paramObject instanceof ASN1Sequence)) {
            return new Attribute((ASN1Sequence) paramObject);
        }
        throw new IllegalArgumentException("unknown object in factory: " + paramObject.getClass().getName());
    }

    public DERObjectIdentifier getAttrType() {
        return this.attrType;
    }

    public ASN1Set getAttrValues() {
        return this.attrValues;
    }

    public DERObject toASN1Object() {
        ASN1EncodableVector localASN1EncodableVector = new ASN1EncodableVector();
        localASN1EncodableVector.add(this.attrType);
        localASN1EncodableVector.add(this.attrValues);
        return new DERSequence(localASN1EncodableVector);
    }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/org/bouncycastle/asn1/pkcs/Attribute.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */