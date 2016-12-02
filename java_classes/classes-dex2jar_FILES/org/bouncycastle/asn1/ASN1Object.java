package org.bouncycastle.asn1;

import java.io.IOException;

public abstract class ASN1Object
  extends DERObject
{
  public static ASN1Object fromByteArray(byte[] paramArrayOfByte)
    throws IOException
  {
    return (ASN1Object)new ASN1InputStream(paramArrayOfByte).readObject();
  }
  
  abstract boolean asn1Equals(DERObject paramDERObject);
  
  abstract void encode(DEROutputStream paramDEROutputStream)
    throws IOException;
  
  public final boolean equals(Object paramObject)
  {
    if (this == paramObject) {}
    while (((paramObject instanceof DEREncodable)) && (asn1Equals(((DEREncodable)paramObject).getDERObject()))) {
      return true;
    }
    return false;
  }
  
  public abstract int hashCode();
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/org/bouncycastle/asn1/ASN1Object.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */