package org.bouncycastle.asn1;

import java.io.IOException;

public class DEROctetString
        extends ASN1OctetString {
    public DEROctetString(DEREncodable paramDEREncodable) {
        super(paramDEREncodable);
    }

    public DEROctetString(byte[] paramArrayOfByte) {
        super(paramArrayOfByte);
    }

    static void encode(DEROutputStream paramDEROutputStream, byte[] paramArrayOfByte)
            throws IOException {
        paramDEROutputStream.writeEncoded(4, paramArrayOfByte);
    }

    void encode(DEROutputStream paramDEROutputStream)
            throws IOException {
        paramDEROutputStream.writeEncoded(4, this.string);
    }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/org/bouncycastle/asn1/DEROctetString.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */