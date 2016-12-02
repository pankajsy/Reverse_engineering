package org.bouncycastle.asn1;

import java.io.IOException;

public class DERNull
  extends ASN1Null
{
  public static final DERNull INSTANCE = new DERNull();
  byte[] zeroBytes = new byte[0];
  
  void encode(DEROutputStream paramDEROutputStream)
    throws IOException
  {
    paramDEROutputStream.writeEncoded(5, this.zeroBytes);
  }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/org/bouncycastle/asn1/DERNull.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */