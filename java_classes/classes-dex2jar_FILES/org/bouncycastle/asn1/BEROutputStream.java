package org.bouncycastle.asn1;

import java.io.IOException;
import java.io.OutputStream;

public class BEROutputStream
  extends DEROutputStream
{
  public BEROutputStream(OutputStream paramOutputStream)
  {
    super(paramOutputStream);
  }
  
  public void writeObject(Object paramObject)
    throws IOException
  {
    if (paramObject == null)
    {
      writeNull();
      return;
    }
    if ((paramObject instanceof DERObject))
    {
      ((DERObject)paramObject).encode(this);
      return;
    }
    if ((paramObject instanceof DEREncodable))
    {
      ((DEREncodable)paramObject).getDERObject().encode(this);
      return;
    }
    throw new IOException("object not BEREncodable");
  }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/org/bouncycastle/asn1/BEROutputStream.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */