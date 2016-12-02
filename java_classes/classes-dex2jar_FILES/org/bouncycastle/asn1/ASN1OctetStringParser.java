package org.bouncycastle.asn1;

import java.io.InputStream;

public abstract interface ASN1OctetStringParser
  extends DEREncodable
{
  public abstract InputStream getOctetStream();
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/org/bouncycastle/asn1/ASN1OctetStringParser.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */