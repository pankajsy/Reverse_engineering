package org.bouncycastle.asn1;

import java.io.IOException;
import java.io.InputStream;

public class DEROctetStringParser
        implements ASN1OctetStringParser {
    private DefiniteLengthInputStream stream;

    DEROctetStringParser(DefiniteLengthInputStream paramDefiniteLengthInputStream) {
        this.stream = paramDefiniteLengthInputStream;
    }

    public DERObject getDERObject() {
        try {
            DEROctetString localDEROctetString = new DEROctetString(this.stream.toByteArray());
            return localDEROctetString;
        } catch (IOException localIOException) {
            throw new ASN1ParsingException("IOException converting stream to byte array: " + localIOException.getMessage(), localIOException);
        }
    }

    public InputStream getOctetStream() {
        return this.stream;
    }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/org/bouncycastle/asn1/DEROctetStringParser.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */