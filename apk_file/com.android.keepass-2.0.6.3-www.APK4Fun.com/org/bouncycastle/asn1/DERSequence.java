package org.bouncycastle.asn1;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.Enumeration;

public class DERSequence
        extends ASN1Sequence {
    public DERSequence() {
    }

    public DERSequence(DEREncodable paramDEREncodable) {
        addObject(paramDEREncodable);
    }

    public DERSequence(DEREncodableVector paramDEREncodableVector) {
        int i = 0;
        while (i != paramDEREncodableVector.size()) {
            addObject(paramDEREncodableVector.get(i));
            i += 1;
        }
    }

    public DERSequence(ASN1Encodable[] paramArrayOfASN1Encodable) {
        int i = 0;
        while (i != paramArrayOfASN1Encodable.length) {
            addObject(paramArrayOfASN1Encodable[i]);
            i += 1;
        }
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
        paramDEROutputStream.writeEncoded(48, localByteArrayOutputStream.toByteArray());
    }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/org/bouncycastle/asn1/DERSequence.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */