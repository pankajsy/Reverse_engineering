package org.bouncycastle.asn1;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.Enumeration;
import java.util.Vector;

public abstract class ASN1Set
        extends ASN1Object {
    protected Vector set = new Vector();

    public static ASN1Set getInstance(Object paramObject) {
        if ((paramObject == null) || ((paramObject instanceof ASN1Set))) {
            return (ASN1Set) paramObject;
        }
        throw new IllegalArgumentException("unknown object in getInstance: " + paramObject.getClass().getName());
    }

    public static ASN1Set getInstance(ASN1TaggedObject paramASN1TaggedObject, boolean paramBoolean) {
        if (paramBoolean) {
            if (!paramASN1TaggedObject.isExplicit()) {
                throw new IllegalArgumentException("object implicit - explicit expected.");
            }
            return (ASN1Set) paramASN1TaggedObject.getObject();
        }
        if (paramASN1TaggedObject.isExplicit()) {
            return new DERSet(paramASN1TaggedObject.getObject());
        }
        if ((paramASN1TaggedObject.getObject() instanceof ASN1Set)) {
            return (ASN1Set) paramASN1TaggedObject.getObject();
        }
        ASN1EncodableVector localASN1EncodableVector = new ASN1EncodableVector();
        if ((paramASN1TaggedObject.getObject() instanceof ASN1Sequence)) {
            paramASN1TaggedObject = ((ASN1Sequence) paramASN1TaggedObject.getObject()).getObjects();
            while (paramASN1TaggedObject.hasMoreElements()) {
                localASN1EncodableVector.add((DEREncodable) paramASN1TaggedObject.nextElement());
            }
            return new DERSet(localASN1EncodableVector, false);
        }
        throw new IllegalArgumentException("unknown object in getInstance: " + paramASN1TaggedObject.getClass().getName());
    }

    private byte[] getEncoded(DEREncodable paramDEREncodable) {
        ByteArrayOutputStream localByteArrayOutputStream = new ByteArrayOutputStream();
        ASN1OutputStream localASN1OutputStream = new ASN1OutputStream(localByteArrayOutputStream);
        try {
            localASN1OutputStream.writeObject(paramDEREncodable);
            return localByteArrayOutputStream.toByteArray();
        } catch (IOException paramDEREncodable) {
            throw new IllegalArgumentException("cannot encode object added to SET");
        }
    }

    private boolean lessThanOrEqual(byte[] paramArrayOfByte1, byte[] paramArrayOfByte2) {
        int j;
        int k;
        if (paramArrayOfByte1.length <= paramArrayOfByte2.length) {
            i = 0;
            for (; ; ) {
                if (i != paramArrayOfByte1.length) {
                    j = paramArrayOfByte1[i] & 0xFF;
                    k = paramArrayOfByte2[i] & 0xFF;
                    if (k <= j) {
                    }
                } else {
                    return true;
                }
                if (j > k) {
                    return false;
                }
                i += 1;
            }
        }
        int i = 0;
        for (; ; ) {
            if (i == paramArrayOfByte2.length) {
                break label107;
            }
            j = paramArrayOfByte1[i] & 0xFF;
            k = paramArrayOfByte2[i] & 0xFF;
            if (k > j) {
                break;
            }
            if (j > k) {
                return false;
            }
            i += 1;
        }
        label107:
        return false;
    }

    protected void addObject(DEREncodable paramDEREncodable) {
        this.set.addElement(paramDEREncodable);
    }

    boolean asn1Equals(DERObject paramDERObject) {
        if (!(paramDERObject instanceof ASN1Set)) {
            return false;
        }
        Object localObject = (ASN1Set) paramDERObject;
        if (size() != ((ASN1Set) localObject).size()) {
            return false;
        }
        paramDERObject = getObjects();
        localObject = ((ASN1Set) localObject).getObjects();
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
        return (DEREncodable) this.set.elementAt(paramInt);
    }

    public Enumeration getObjects() {
        return this.set.elements();
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

    public ASN1SetParser parser() {
        new ASN1SetParser() {
            private final int max = ASN1Set.this.size();
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
                    localObject = ASN1Set.this;
                    int i = this.index;
                    this.index = (i + 1);
                    localDEREncodable = ((ASN1Set) localObject).getObjectAt(i);
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
        return this.set.size();
    }

    protected void sort() {
        if (this.set.size() > 1) {
            int j = 1;
            int k;
            for (int m = this.set.size() - 1; j != 0; m = k) {
                int i = 0;
                k = 0;
                Object localObject1 = getEncoded((DEREncodable) this.set.elementAt(0));
                j = 0;
                if (i != m) {
                    Object localObject2 = getEncoded((DEREncodable) this.set.elementAt(i + 1));
                    if (lessThanOrEqual((byte[]) localObject1, (byte[]) localObject2)) {
                        localObject1 = localObject2;
                    }
                    for (; ; ) {
                        i += 1;
                        break;
                        localObject2 = this.set.elementAt(i);
                        this.set.setElementAt(this.set.elementAt(i + 1), i);
                        this.set.setElementAt(localObject2, i + 1);
                        j = 1;
                        k = i;
                    }
                }
            }
        }
    }

    public String toString() {
        return this.set.toString();
    }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/org/bouncycastle/asn1/ASN1Set.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */