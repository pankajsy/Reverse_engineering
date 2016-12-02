package org.bouncycastle.asn1;

import java.io.IOException;
import java.util.Enumeration;

public class BERSet
  extends DERSet
{
  public BERSet() {}
  
  public BERSet(DEREncodable paramDEREncodable)
  {
    super(paramDEREncodable);
  }
  
  public BERSet(DEREncodableVector paramDEREncodableVector)
  {
    super(paramDEREncodableVector, false);
  }
  
  BERSet(DEREncodableVector paramDEREncodableVector, boolean paramBoolean)
  {
    super(paramDEREncodableVector, paramBoolean);
  }
  
  void encode(DEROutputStream paramDEROutputStream)
    throws IOException
  {
    if (((paramDEROutputStream instanceof ASN1OutputStream)) || ((paramDEROutputStream instanceof BEROutputStream)))
    {
      paramDEROutputStream.write(49);
      paramDEROutputStream.write(128);
      Enumeration localEnumeration = getObjects();
      while (localEnumeration.hasMoreElements()) {
        paramDEROutputStream.writeObject(localEnumeration.nextElement());
      }
      paramDEROutputStream.write(0);
      paramDEROutputStream.write(0);
      return;
    }
    super.encode(paramDEROutputStream);
  }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/org/bouncycastle/asn1/BERSet.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */