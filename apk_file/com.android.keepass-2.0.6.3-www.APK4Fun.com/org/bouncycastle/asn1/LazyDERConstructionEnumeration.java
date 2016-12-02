package org.bouncycastle.asn1;

import java.io.IOException;
import java.util.Enumeration;

class LazyDERConstructionEnumeration
        implements Enumeration {
    private ASN1InputStream aIn;
    private Object nextObj;

    public LazyDERConstructionEnumeration(byte[] paramArrayOfByte) {
        this.aIn = new ASN1InputStream(paramArrayOfByte, true);
        this.nextObj = readObject();
    }

    private Object readObject() {
        try {
            DERObject localDERObject = this.aIn.readObject();
            return localDERObject;
        } catch (IOException localIOException) {
            throw new ASN1ParsingException("malformed DER construction: " + localIOException, localIOException);
        }
    }

    public boolean hasMoreElements() {
        return this.nextObj != null;
    }

    public Object nextElement() {
        Object localObject = this.nextObj;
        this.nextObj = readObject();
        return localObject;
    }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/org/bouncycastle/asn1/LazyDERConstructionEnumeration.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */