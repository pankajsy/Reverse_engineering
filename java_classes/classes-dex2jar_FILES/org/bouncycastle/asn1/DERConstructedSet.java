package org.bouncycastle.asn1;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.Enumeration;

public class DERConstructedSet
  extends ASN1Set
{
  public DERConstructedSet() {}
  
  public DERConstructedSet(DEREncodable paramDEREncodable)
  {
    addObject(paramDEREncodable);
  }
  
  public DERConstructedSet(DEREncodableVector paramDEREncodableVector)
  {
    int i = 0;
    while (i != paramDEREncodableVector.size())
    {
      addObject(paramDEREncodableVector.get(i));
      i += 1;
    }
  }
  
  public void addObject(DEREncodable paramDEREncodable)
  {
    super.addObject(paramDEREncodable);
  }
  
  void encode(DEROutputStream paramDEROutputStream)
    throws IOException
  {
    ByteArrayOutputStream localByteArrayOutputStream = new ByteArrayOutputStream();
    DEROutputStream localDEROutputStream = new DEROutputStream(localByteArrayOutputStream);
    Enumeration localEnumeration = getObjects();
    while (localEnumeration.hasMoreElements()) {
      localDEROutputStream.writeObject(localEnumeration.nextElement());
    }
    localDEROutputStream.close();
    paramDEROutputStream.writeEncoded(49, localByteArrayOutputStream.toByteArray());
  }
  
  public int getSize()
  {
    return size();
  }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/org/bouncycastle/asn1/DERConstructedSet.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */