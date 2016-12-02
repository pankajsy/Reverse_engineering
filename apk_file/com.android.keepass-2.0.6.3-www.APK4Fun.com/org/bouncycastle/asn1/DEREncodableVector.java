package org.bouncycastle.asn1;

import java.util.Vector;

public class DEREncodableVector {
    Vector v = new Vector();

    public void add(DEREncodable paramDEREncodable) {
        this.v.addElement(paramDEREncodable);
    }

    public DEREncodable get(int paramInt) {
        return (DEREncodable) this.v.elementAt(paramInt);
    }

    public int size() {
        return this.v.size();
    }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/org/bouncycastle/asn1/DEREncodableVector.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */