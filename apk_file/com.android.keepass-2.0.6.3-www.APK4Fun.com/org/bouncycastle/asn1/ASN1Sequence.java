package org.bouncycastle.asn1;

import java.io.IOException;
import java.util.Enumeration;
import java.util.Vector;

public abstract class ASN1Sequence
        extends ASN1Object {
    private Vector seq = new Vector();

    public static ASN1Sequence getInstance(Object paramObject) {
        if ((paramObject == null) || ((paramObject instanceof ASN1Sequence))) {
            return (ASN1Sequence) paramObject;
        }
        throw new IllegalArgumentException("unknown object in getInstance: " + paramObject.getClass().getName());
    }

    public static ASN1Sequence getInstance(ASN1TaggedObject paramASN1TaggedObject, boolean paramBoolean) {
        if (paramBoolean) {
            if (!paramASN1TaggedObject.isExplicit()) {
                throw new IllegalArgumentException("object implicit - explicit expected.");
            }
            return (ASN1Sequence) paramASN1TaggedObject.getObject();
        }
        if (paramASN1TaggedObject.isExplicit()) {
            if ((paramASN1TaggedObject instanceof BERTaggedObject)) {
                return new BERSequence(paramASN1TaggedObject.getObject());
            }
            return new DERSequence(paramASN1TaggedObject.getObject());
        }
        if ((paramASN1TaggedObject.getObject() instanceof ASN1Sequence)) {
            return (ASN1Sequence) paramASN1TaggedObject.getObject();
        }
        throw new IllegalArgumentException("unknown object in getInstance: " + paramASN1TaggedObject.getClass().getName());
    }

    protected void addObject(DEREncodable paramDEREncodable) {
        this.seq.addElement(paramDEREncodable);
    }

    boolean asn1Equals(DERObject paramDERObject) {
        if (!(paramDERObject instanceof ASN1Sequence)) {
            return false;
        }
        Object localObject = (ASN1Sequence) paramDERObject;
        if (size() != ((ASN1Sequence) localObject).size()) {
            return false;
        }
        paramDERObject = getObjects();
        localObject = ((ASN1Sequence) localObject).getObjects();
        while (paramDERObject.hasMoreElements()) {
            DERObject localDERObject1 = ((DEREncodable) paramDERObject.nextElement()).getDERObject();
            DERObject localDERObject2 = ((DEREncodable) ((Enumeration) localObject).nextElement()).getDERObject();
            if ((localDERObject1 != localDERObject2) && ((localDERObject1 == null) || (!localDERObject1.equals(localDERObject2)))) {
                return false;
            }
        }
        return true;
    }

    abstract void encode(DEROutputStream paramDEROutputStream)
            throws IOException;

    public DEREncodable getObjectAt(int paramInt) {
        return (DEREncodable) this.seq.elementAt(paramInt);
    }

    public Enumeration getObjects() {
        return this.seq.elements();
    }

    public int hashCode() {
        Enumeration localEnumeration = getObjects();
        int i = size();
        while (localEnumeration.hasMoreElements()) {
            Object localObject = localEnumeration.nextElement();
            int j = i * 17;
            i = j;
            if (localObject != null) {
                i = j ^ localObject.hashCode();
            }
        }
        return i;
    }

    public ASN1SequenceParser parser() {
        new ASN1SequenceParser() {
            private final int max = ASN1Sequence.this.size();
            private int index;

            public DERObject getDERObject() {
                return jdField_this;
            }

            public DEREncodable readObject()
                    throws IOException {
                Object localObject;
                if (this.index == this.max) {
                    localObject = null;
                }
                DEREncodable localDEREncodable;
                do {
                    return (DEREncodable) localObject;
                    localObject = ASN1Sequence.this;
                    int i = this.index;
                    this.index = (i + 1);
                    localDEREncodable = ((ASN1Sequence) localObject).getObjectAt(i);
                    if ((localDEREncodable instanceof ASN1Sequence)) {
                        return ((ASN1Sequence) localDEREncodable).parser();
                    }
                    localObject = localDEREncodable;
                } while (!(localDEREncodable instanceof ASN1Set));
                return ((ASN1Set) localDEREncodable).parser();
            }
        };
    }

    public int size() {
        return this.seq.size();
    }

    public String toString() {
        return this.seq.toString();
    }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/org/bouncycastle/asn1/ASN1Sequence.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */