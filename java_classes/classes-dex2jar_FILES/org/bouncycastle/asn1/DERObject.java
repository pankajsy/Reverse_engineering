package org.bouncycastle.asn1;

import java.io.IOException;

public abstract class DERObject
  extends ASN1Encodable
  implements DERTags
{
  abstract void encode(DEROutputStream paramDEROutputStream)
    throws IOException;
  
  public abstract boolean equals(Object paramObject);
  
  public abstract int hashCode();
  
  public DERObject toASN1Object()
  {
    return this;
  }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/org/bouncycastle/asn1/DERObject.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */