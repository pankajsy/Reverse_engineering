package org.bouncycastle.asn1;

import java.io.IOException;
import java.math.BigInteger;
import org.bouncycastle.util.Arrays;

public class DEREnumerated
  extends ASN1Object
{
  byte[] bytes;
  
  public DEREnumerated(int paramInt)
  {
    this.bytes = BigInteger.valueOf(paramInt).toByteArray();
  }
  
  public DEREnumerated(BigInteger paramBigInteger)
  {
    this.bytes = paramBigInteger.toByteArray();
  }
  
  public DEREnumerated(byte[] paramArrayOfByte)
  {
    this.bytes = paramArrayOfByte;
  }
  
  public static DEREnumerated getInstance(Object paramObject)
  {
    if ((paramObject == null) || ((paramObject instanceof DEREnumerated))) {
      return (DEREnumerated)paramObject;
    }
    if ((paramObject instanceof ASN1OctetString)) {
      return new DEREnumerated(((ASN1OctetString)paramObject).getOctets());
    }
    if ((paramObject instanceof ASN1TaggedObject)) {
      return getInstance(((ASN1TaggedObject)paramObject).getObject());
    }
    throw new IllegalArgumentException("illegal object in getInstance: " + paramObject.getClass().getName());
  }
  
  public static DEREnumerated getInstance(ASN1TaggedObject paramASN1TaggedObject, boolean paramBoolean)
  {
    return getInstance(paramASN1TaggedObject.getObject());
  }
  
  boolean asn1Equals(DERObject paramDERObject)
  {
    if (!(paramDERObject instanceof DEREnumerated)) {
      return false;
    }
    paramDERObject = (DEREnumerated)paramDERObject;
    return Arrays.areEqual(this.bytes, paramDERObject.bytes);
  }
  
  void encode(DEROutputStream paramDEROutputStream)
    throws IOException
  {
    paramDEROutputStream.writeEncoded(10, this.bytes);
  }
  
  public BigInteger getValue()
  {
    return new BigInteger(this.bytes);
  }
  
  public int hashCode()
  {
    return Arrays.hashCode(this.bytes);
  }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/org/bouncycastle/asn1/DEREnumerated.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */