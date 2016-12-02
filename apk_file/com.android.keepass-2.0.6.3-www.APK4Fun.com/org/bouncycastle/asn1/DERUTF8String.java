package org.bouncycastle.asn1;

import org.bouncycastle.util.Strings;

import java.io.IOException;

public class DERUTF8String
        extends ASN1Object
        implements DERString {
    String string;

    public DERUTF8String(String paramString) {
        this.string = paramString;
    }

    DERUTF8String(byte[] paramArrayOfByte) {
        this.string = Strings.fromUTF8ByteArray(paramArrayOfByte);
    }

    public static DERUTF8String getInstance(Object paramObject) {
        if ((paramObject == null) || ((paramObject instanceof DERUTF8String))) {
            return (DERUTF8String) paramObject;
        }
        if ((paramObject instanceof ASN1OctetString)) {
            return new DERUTF8String(((ASN1OctetString) paramObject).getOctets());
        }
        if ((paramObject instanceof ASN1TaggedObject)) {
            return getInstance(((ASN1TaggedObject) paramObject).getObject());
        }
        throw new IllegalArgumentException("illegal object in getInstance: " + paramObject.getClass().getName());
    }

    public static DERUTF8String getInstance(ASN1TaggedObject paramASN1TaggedObject, boolean paramBoolean) {
        return getInstance(paramASN1TaggedObject.getObject());
    }

    boolean asn1Equals(DERObject paramDERObject) {
        if (!(paramDERObject instanceof DERUTF8String)) {
            return false;
        }
        paramDERObject = (DERUTF8String) paramDERObject;
        return getString().equals(paramDERObject.getString());
    }

    void encode(DEROutputStream paramDEROutputStream)
            throws IOException {
        paramDEROutputStream.writeEncoded(12, Strings.toUTF8ByteArray(this.string));
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


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/org/bouncycastle/asn1/DERUTF8String.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */