package org.bouncycastle.asn1;

import java.io.IOException;

public class BERSetParser
        implements ASN1SetParser {
    private ASN1StreamParser _parser;

    BERSetParser(ASN1StreamParser paramASN1StreamParser) {
        this._parser = paramASN1StreamParser;
    }

    public DERObject getDERObject() {
        try {
            BERSet localBERSet = new BERSet(this._parser.readVector(), false);
            return localBERSet;
        } catch (IOException localIOException) {
            throw new ASN1ParsingException(localIOException.getMessage(), localIOException);
        }
    }

    public DEREncodable readObject()
            throws IOException {
        return this._parser.readObject();
    }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/org/bouncycastle/asn1/BERSetParser.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */