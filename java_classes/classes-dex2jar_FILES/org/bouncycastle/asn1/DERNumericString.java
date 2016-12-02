package org.bouncycastle.asn1;

import java.io.IOException;

public class DERNumericString
  extends ASN1Object
  implements DERString
{
  String string;
  
  public DERNumericString(String paramString)
  {
    this(paramString, false);
  }
  
  public DERNumericString(String paramString, boolean paramBoolean)
  {
    if ((paramBoolean) && (!isNumericString(paramString))) {
      throw new IllegalArgumentException("string contains illegal characters");
    }
    this.string = paramString;
  }
  
  public DERNumericString(byte[] paramArrayOfByte)
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
  
  public static DERNumericString getInstance(Object paramObject)
  {
    if ((paramObject == null) || ((paramObject instanceof DERNumericString))) {
      return (DERNumericString)paramObject;
    }
    if ((paramObject instanceof ASN1OctetString)) {
      return new DERNumericString(((ASN1OctetString)paramObject).getOctets());
    }
    if ((paramObject instanceof ASN1TaggedObject)) {
      return getInstance(((ASN1TaggedObject)paramObject).getObject());
    }
    throw new IllegalArgumentException("illegal object in getInstance: " + paramObject.getClass().getName());
  }
  
  public static DERNumericString getInstance(ASN1TaggedObject paramASN1TaggedObject, boolean paramBoolean)
  {
    return getInstance(paramASN1TaggedObject.getObject());
  }
  
  public static boolean isNumericString(String paramString)
  {
    int i = paramString.length() - 1;
    while (i >= 0)
    {
      int j = paramString.charAt(i);
      if (j > 127) {}
      while (((48 > j) || (j > 57)) && (j != 32)) {
        return false;
      }
      i -= 1;
    }
    return true;
  }
  
  boolean asn1Equals(DERObject paramDERObject)
  {
    if (!(paramDERObject instanceof DERNumericString)) {
      return false;
    }
    paramDERObject = (DERNumericString)paramDERObject;
    return getString().equals(paramDERObject.getString());
  }
  
  void encode(DEROutputStream paramDEROutputStream)
    throws IOException
  {
    paramDEROutputStream.writeEncoded(18, getOctets());
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


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/org/bouncycastle/asn1/DERNumericString.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */