package org.bouncycastle.asn1;

import java.io.IOException;

public class DERBMPString
        extends ASN1Object
        implements DERString {
    String string;

    public DERBMPString(String paramString) {
        this.string = paramString;
    }

    public DERBMPString(byte[] paramArrayOfByte) {
        char[] arrayOfChar = new char[paramArrayOfByte.length / 2];
        int i = 0;
        while (i != arrayOfChar.length) {
            arrayOfChar[i] = ((char) (paramArrayOfByte[(i * 2)] << 8 | paramArrayOfByte[(i * 2 + 1)] & 0xFF));
            i += 1;
        }
        this.string = new String(arrayOfChar);
    }

    public static DERBMPString getInstance(Object paramObject) {
        if ((paramObject == null) || ((paramObject instanceof DERBMPString))) {
            return (DERBMPString) paramObject;
        }
        if ((paramObject instanceof ASN1OctetString)) {
            return new DERBMPString(((ASN1OctetString) paramObject).getOctets());
        }
        if ((paramObject instanceof ASN1TaggedObject)) {
            return getInstance(((ASN1TaggedObject) paramObject).getObject());
        }
        throw new IllegalArgumentException("illegal object in getInstance: " + paramObject.getClass().getName());
    }

    public static DERBMPString getInstance(ASN1TaggedObject paramASN1TaggedObject, boolean paramBoolean) {
        return getInstance(paramASN1TaggedObject.getObject());
    }

    protected boolean asn1Equals(DERObject paramDERObject) {
        if (!(paramDERObject instanceof DERBMPString)) {
            return false;
        }
        paramDERObject = (DERBMPString) paramDERObject;
        return getString().equals(paramDERObject.getString());
    }

    void encode(DEROutputStream paramDEROutputStream)
            throws IOException {
        char[] arrayOfChar = this.string.toCharArray();
        byte[] arrayOfByte = new byte[arrayOfChar.length * 2];
        int i = 0;
        while (i != arrayOfChar.length) {
            arrayOfByte[(i * 2)] = ((byte) (arrayOfChar[i] >> '\b'));
            arrayOfByte[(i * 2 + 1)] = ((byte) arrayOfChar[i]);
            i += 1;
        }
        paramDEROutputStream.writeEncoded(30, arrayOfByte);
    }

    public String getString() {
        return this.string;
    }

    public int hashCode() {
        return getString().hashCode();
    }

    public String toString() {
        return this.string;
    }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/org/bouncycastle/asn1/DERBMPString.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */