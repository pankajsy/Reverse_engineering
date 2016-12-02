package org.bouncycastle.asn1;

import java.io.IOException;

public class DERIA5String
        extends ASN1Object
        implements DERString {
    String string;

    public DERIA5String(String paramString) {
        this(paramString, false);
    }

    public DERIA5String(String paramString, boolean paramBoolean) {
        if (paramString == null) {
            throw new NullPointerException("string cannot be null");
        }
        if ((paramBoolean) && (!isIA5String(paramString))) {
            throw new IllegalArgumentException("string contains illegal characters");
        }
        this.string = paramString;
    }

    public DERIA5String(byte[] paramArrayOfByte) {
        char[] arrayOfChar = new char[paramArrayOfByte.length];
        int i = 0;
        while (i != arrayOfChar.length) {
            arrayOfChar[i] = ((char) (paramArrayOfByte[i] & 0xFF));
            i += 1;
        }
        this.string = new String(arrayOfChar);
    }

    public static DERIA5String getInstance(Object paramObject) {
        if ((paramObject == null) || ((paramObject instanceof DERIA5String))) {
            return (DERIA5String) paramObject;
        }
        if ((paramObject instanceof ASN1OctetString)) {
            return new DERIA5String(((ASN1OctetString) paramObject).getOctets());
        }
        if ((paramObject instanceof ASN1TaggedObject)) {
            return getInstance(((ASN1TaggedObject) paramObject).getObject());
        }
        throw new IllegalArgumentException("illegal object in getInstance: " + paramObject.getClass().getName());
    }

    public static DERIA5String getInstance(ASN1TaggedObject paramASN1TaggedObject, boolean paramBoolean) {
        return getInstance(paramASN1TaggedObject.getObject());
    }

    public static boolean isIA5String(String paramString) {
        int i = paramString.length() - 1;
        while (i >= 0) {
            if (paramString.charAt(i) > '') {
                return false;
            }
            i -= 1;
        }
        return true;
    }

    boolean asn1Equals(DERObject paramDERObject) {
        if (!(paramDERObject instanceof DERIA5String)) {
            return false;
        }
        paramDERObject = (DERIA5String) paramDERObject;
        return getString().equals(paramDERObject.getString());
    }

    void encode(DEROutputStream paramDEROutputStream)
            throws IOException {
        paramDEROutputStream.writeEncoded(22, getOctets());
    }

    public byte[] getOctets() {
        char[] arrayOfChar = this.string.toCharArray();
        byte[] arrayOfByte = new byte[arrayOfChar.length];
        int i = 0;
        while (i != arrayOfChar.length) {
            arrayOfByte[i] = ((byte) arrayOfChar[i]);
            i += 1;
        }
        return arrayOfByte;
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


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/org/bouncycastle/asn1/DERIA5String.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */