package org.bouncycastle.asn1;

import java.io.IOException;

public abstract interface ASN1TaggedObjectParser
  extends DEREncodable
{
  public abstract DEREncodable getObjectParser(int paramInt, boolean paramBoolean)
    throws IOException;
  
  public abstract int getTagNo();
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/org/bouncycastle/asn1/ASN1TaggedObjectParser.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */