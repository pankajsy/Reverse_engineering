package org.bouncycastle.jce.interfaces;

import java.util.Enumeration;
import org.bouncycastle.asn1.DEREncodable;
import org.bouncycastle.asn1.DERObjectIdentifier;

public abstract interface PKCS12BagAttributeCarrier
{
  public abstract DEREncodable getBagAttribute(DERObjectIdentifier paramDERObjectIdentifier);
  
  public abstract Enumeration getBagAttributeKeys();
  
  public abstract void setBagAttribute(DERObjectIdentifier paramDERObjectIdentifier, DEREncodable paramDEREncodable);
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/org/bouncycastle/jce/interfaces/PKCS12BagAttributeCarrier.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */