package org.bouncycastle.asn1;

import java.io.IOException;

public class DERBoolean
  extends ASN1Object
{
  public static final DERBoolean FALSE = new DERBoolean(false);
  public static final DERBoolean TRUE = new DERBoolean(true);
  byte value;
  
  public DERBoolean(boolean paramBoolean)
  {
    if (paramBoolean) {}
    for (byte b = -1;; b = 0)
    {
      this.value = b;
      return;
    }
  }
  
  public DERBoolean(byte[] paramArrayOfByte)
  {
    this.value = paramArrayOfByte[0];
  }
  
  public static DERBoolean getInstance(Object paramObject)
  {
    if ((paramObject == null) || ((paramObject instanceof DERBoolean))) {
      return (DERBoolean)paramObject;
    }
    if ((paramObject instanceof ASN1OctetString)) {
      return new DERBoolean(((ASN1OctetString)paramObject).getOctets());
    }
    if ((paramObject instanceof ASN1TaggedObject)) {
      return getInstance(((ASN1TaggedObject)paramObject).getObject());
    }
    throw new IllegalArgumentException("illegal object in getInstance: " + paramObject.getClass().getName());
  }
  
  public static DERBoolean getInstance(ASN1TaggedObject paramASN1TaggedObject, boolean paramBoolean)
  {
    return getInstance(paramASN1TaggedObject.getObject());
  }
  
  public static DERBoolean getInstance(boolean paramBoolean)
  {
    if (paramBoolean) {
      return TRUE;
    }
    return FALSE;
  }
  
  protected boolean asn1Equals(DERObject paramDERObject)
  {
    if ((paramDERObject == null) || (!(paramDERObject instanceof DERBoolean))) {}
    while (this.value != ((DERBoolean)paramDERObject).value) {
      return false;
    }
    return true;
  }
  
  void encode(DEROutputStream paramDEROutputStream)
    throws IOException
  {
    paramDEROutputStream.writeEncoded(1, new byte[] { this.value });
  }
  
  public int hashCode()
  {
    return this.value;
  }
  
  public boolean isTrue()
  {
    return this.value != 0;
  }
  
  public String toString()
  {
    if (this.value != 0) {
      return "TRUE";
    }
    return "FALSE";
  }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/org/bouncycastle/asn1/DERBoolean.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */