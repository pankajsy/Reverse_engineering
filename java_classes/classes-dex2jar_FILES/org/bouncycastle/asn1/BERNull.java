package org.bouncycastle.asn1;

import java.io.IOException;

public class BERNull
  extends DERNull
{
  public static final BERNull INSTANCE = new BERNull();
  
  void encode(DEROutputStream paramDEROutputStream)
    throws IOException
  {
    if (((paramDEROutputStream instanceof ASN1OutputStream)) || ((paramDEROutputStream instanceof BEROutputStream)))
    {
      paramDEROutputStream.write(5);
      return;
    }
    super.encode(paramDEROutputStream);
  }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/org/bouncycastle/asn1/BERNull.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */