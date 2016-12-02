package org.bouncycastle.asn1;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.Enumeration;

public class DERSet
        extends ASN1Set {
    public DERSet() {
    }

    public DERSet(DEREncodable paramDEREncodable) {
        addObject(paramDEREncodable);
    }

    public DERSet(DEREncodableVector paramDEREncodableVector) {
        this(paramDEREncodableVector, true);
    }

    DERSet(DEREncodableVector paramDEREncodableVector, boolean paramBoolean) {
        int i = 0;
        while (i != paramDEREncodableVector.size()) {
            addObject(paramDEREncodableVector.get(i));
            i += 1;
        }
        if (paramBoolean) {
            sort();
        }
    }

    public DERSet(ASN1Encodable[] paramArrayOfASN1Encodable) {
        int i = 0;
        while (i != paramArrayOfASN1Encodable.length) {
            addObject(paramArrayOfASN1Encodable[i]);
            i += 1;
        }
        sort();
    }

    void encode(DEROutputStream paramDEROutputStream)
            throws IOException {
        ByteArrayOutputStream localByteArrayOutputStream = new ByteArrayOutputStream();
        DEROutputStream localDEROutputStream = new DEROutputStream(localByteArrayOutputStream);
        Enumeration localEnumeration = getObjects();
        while (localEnumeration.hasMoreElements()) {
            localDEROutputStream.writeObject(localEnumeration.nextElement());
        }
        localDEROutputStream.close();
        paramDEROutputStream.writeEncoded(49, localByteArrayOutputStream.toByteArray());
    }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/org/bouncycastle/asn1/DERSet.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */