package org.bouncycastle.asn1;

import java.io.IOException;

public abstract class ASN1Null
  extends ASN1Object
{
  boolean asn1Equals(DERObject paramDERObject)
  {
    return (paramDERObject instanceof ASN1Null);
  }
  
  abstract void encode(DEROutputStream paramDEROutputStream)
    throws IOException;
  
  public int hashCode()
  {
    return -1;
  }
  
  public String toString()
  {
    return "NULL";
  }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/org/bouncycastle/asn1/ASN1Null.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */