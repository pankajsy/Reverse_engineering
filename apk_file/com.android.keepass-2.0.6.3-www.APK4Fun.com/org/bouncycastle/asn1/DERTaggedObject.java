package org.bouncycastle.asn1;

import java.io.IOException;

public class DERTaggedObject
        extends ASN1TaggedObject {
    private static final byte[] ZERO_BYTES = new byte[0];

    public DERTaggedObject(int paramInt) {
        super(false, paramInt, new DERSequence());
    }

    public DERTaggedObject(int paramInt, DEREncodable paramDEREncodable) {
        super(paramInt, paramDEREncodable);
    }

    public DERTaggedObject(boolean paramBoolean, int paramInt, DEREncodable paramDEREncodable) {
        super(paramBoolean, paramInt, paramDEREncodable);
    }

    void encode(DEROutputStream paramDEROutputStream)
            throws IOException {
        if (!this.empty) {
            byte[] arrayOfByte = this.obj.getDERObject().getEncoded("DER");
            if (this.explicit) {
                paramDEROutputStream.writeEncoded(160, this.tagNo, arrayOfByte);
                return;
            }
            if ((arrayOfByte[0] & 0x20) != 0) {
            }
            for (int i = 160; ; i = 128) {
                paramDEROutputStream.writeTag(i, this.tagNo);
                paramDEROutputStream.write(arrayOfByte, 1, arrayOfByte.length - 1);
                return;
            }
        }
        paramDEROutputStream.writeEncoded(160, this.tagNo, ZERO_BYTES);
    }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/org/bouncycastle/asn1/DERTaggedObject.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */