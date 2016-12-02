package org.bouncycastle.asn1;

import java.io.IOException;
import java.math.BigInteger;
import org.bouncycastle.util.Arrays;

public class DERInteger
  extends ASN1Object
{
  byte[] bytes;
  
  public DERInteger(int paramInt)
  {
    this.bytes = BigInteger.valueOf(paramInt).toByteArray();
  }
  
  public DERInteger(BigInteger paramBigInteger)
  {
    this.bytes = paramBigInteger.toByteArray();
  }
  
  public DERInteger(byte[] paramArrayOfByte)
  {
    this.bytes = paramArrayOfByte;
  }
  
  public static DERInteger getInstance(Object paramObject)
  {
    if ((paramObject == null) || ((paramObject instanceof DERInteger))) {
      return (DERInteger)paramObject;
    }
    if ((paramObject instanceof ASN1OctetString)) {
      return new DERInteger(((ASN1OctetString)paramObject).getOctets());
    }
    if ((paramObject instanceof ASN1TaggedObject)) {
      return getInstance(((ASN1TaggedObject)paramObject).getObject());
    }
    throw new IllegalArgumentException("illegal object in getInstance: " + paramObject.getClass().getName());
  }
  
  public static DERInteger getInstance(ASN1TaggedObject paramASN1TaggedObject, boolean paramBoolean)
  {
    return getInstance(paramASN1TaggedObject.getObject());
  }
  
  boolean asn1Equals(DERObject paramDERObject)
  {
    if (!(paramDERObject instanceof DERInteger)) {
      return false;
    }
    paramDERObject = (DERInteger)paramDERObject;
    return Arrays.areEqual(this.bytes, paramDERObject.bytes);
  }
  
  void encode(DEROutputStream paramDEROutputStream)
    throws IOException
  {
    paramDEROutputStream.writeEncoded(2, this.bytes);
  }
  
  public BigInteger getPositiveValue()
  {
    return new BigInteger(1, this.bytes);
  }
  
  public BigInteger getValue()
  {
    return new BigInteger(this.bytes);
  }
  
  public int hashCode()
  {
    int j = 0;
    int i = 0;
    while (i != this.bytes.length)
    {
      j ^= (this.bytes[i] & 0xFF) << i % 4;
      i += 1;
    }
    return j;
  }
  
  public String toString()
  {
    return getValue().toString();
  }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/org/bouncycastle/asn1/DERInteger.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */