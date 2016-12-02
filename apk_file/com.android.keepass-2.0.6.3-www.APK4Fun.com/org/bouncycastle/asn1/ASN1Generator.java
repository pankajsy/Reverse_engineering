package org.bouncycastle.asn1;

import java.io.OutputStream;

public abstract class ASN1Generator {
    protected OutputStream _out;

    public ASN1Generator(OutputStream paramOutputStream) {
        this._out = paramOutputStream;
    }

    public abstract OutputStream getRawOutputStream();
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/org/bouncycastle/asn1/ASN1Generator.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */