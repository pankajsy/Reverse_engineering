package org.bouncycastle.asn1;

import java.io.IOException;

public class DERPrintableString
        extends ASN1Object
        implements DERString {
    String string;

    public DERPrintableString(String paramString) {
        this(paramString, false);
    }

    public DERPrintableString(String paramString, boolean paramBoolean) {
        if ((paramBoolean) && (!isPrintableString(paramString))) {
            throw new IllegalArgumentException("string contains illegal characters");
        }
        this.string = paramString;
    }

    public DERPrintableString(byte[] paramArrayOfByte) {
        char[] arrayOfChar = new char[paramArrayOfByte.length];
        int i = 0;
        while (i != arrayOfChar.length) {
            arrayOfChar[i] = ((char) (paramArrayOfByte[i] & 0xFF));
            i += 1;
        }
        this.string = new String(arrayOfChar);
    }

    public static DERPrintableString getInstance(Object paramObject) {
        if ((paramObject == null) || ((paramObject instanceof DERPrintableString))) {
            return (DERPrintableString) paramObject;
        }
        if ((paramObject instanceof ASN1OctetString)) {
            return new DERPrintableString(((ASN1OctetString) paramObject).getOctets());
        }
        if ((paramObject instanceof ASN1TaggedObject)) {
            return getInstance(((ASN1TaggedObject) paramObject).getObject());
        }
        throw new IllegalArgumentException("illegal object in getInstance: " + paramObject.getClass().getName());
    }

    public static DERPrintableString getInstance(ASN1TaggedObject paramASN1TaggedObject, boolean paramBoolean) {
        return getInstance(paramASN1TaggedObject.getObject());
    }

    public static boolean isPrintableString(String paramString) {
        int i = paramString.length() - 1;
        if (i >= 0) {
            int j = paramString.charAt(i);
            if (j > 127) {
                return false;
            }
            if ((97 <= j) && (j <= 122)) {
            }
            while (((65 <= j) && (j <= 90)) || ((48 <= j) && (j <= 57))) {
                i -= 1;
                break;
            }
            switch (j) {
            }
            return false;
        }
        return true;
    }

    boolean asn1Equals(DERObject paramDERObject) {
        if (!(paramDERObject instanceof DERPrintableString)) {
            return false;
        }
        paramDERObject = (DERPrintableString) paramDERObject;
        return getString().equals(paramDERObject.getString());
    }

    void encode(DEROutputStream paramDEROutputStream)
            throws IOException {
        paramDEROutputStream.writeEncoded(19, getOctets());
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


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/org/bouncycastle/asn1/DERPrintableString.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */