package org.bouncycastle.asn1;

import java.io.IOException;

public class DERGeneralString
  extends ASN1Object
  implements DERString
{
  private String string;
  
  public DERGeneralString(String paramString)
  {
    this.string = paramString;
  }
  
  public DERGeneralString(byte[] paramArrayOfByte)
  {
    char[] arrayOfChar = new char[paramArrayOfByte.length];
    int i = 0;
    while (i != arrayOfChar.length)
    {
      arrayOfChar[i] = ((char)(paramArrayOfByte[i] & 0xFF));
      i += 1;
    }
    this.string = new String(arrayOfChar);
  }
  
  public static DERGeneralString getInstance(Object paramObject)
  {
    if ((paramObject == null) || ((paramObject instanceof DERGeneralString))) {
      return (DERGeneralString)paramObject;
    }
    if ((paramObject instanceof ASN1OctetString)) {
      return new DERGeneralString(((ASN1OctetString)paramObject).getOctets());
    }
    if ((paramObject instanceof ASN1TaggedObject)) {
      return getInstance(((ASN1TaggedObject)paramObject).getObject());
    }
    throw new IllegalArgumentException("illegal object in getInstance: " + paramObject.getClass().getName());
  }
  
  public static DERGeneralString getInstance(ASN1TaggedObject paramASN1TaggedObject, boolean paramBoolean)
  {
    return getInstance(paramASN1TaggedObject.getObject());
  }
  
  boolean asn1Equals(DERObject paramDERObject)
  {
    if (!(paramDERObject instanceof DERGeneralString)) {
      return false;
    }
    paramDERObject = (DERGeneralString)paramDERObject;
    return getString().equals(paramDERObject.getString());
  }
  
  void encode(DEROutputStream paramDEROutputStream)
    throws IOException
  {
    paramDEROutputStream.writeEncoded(27, getOctets());
  }
  
  public byte[] getOctets()
  {
    char[] arrayOfChar = this.string.toCharArray();
    byte[] arrayOfByte = new byte[arrayOfChar.length];
    int i = 0;
    while (i != arrayOfChar.length)
    {
      arrayOfByte[i] = ((byte)arrayOfChar[i]);
      i += 1;
    }
    return arrayOfByte;
  }
  
  public String getString()
  {
    return this.string;
  }
  
  public int hashCode()
  {
    return getString().hashCode();
  }
  
  public String toString()
  {
    return this.string;
  }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/org/bouncycastle/asn1/DERGeneralString.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */