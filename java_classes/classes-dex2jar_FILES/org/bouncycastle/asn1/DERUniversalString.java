package org.bouncycastle.asn1;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.OutputStream;

public class DERUniversalString
  extends ASN1Object
  implements DERString
{
  private static final char[] table = { 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 65, 66, 67, 68, 69, 70 };
  private byte[] string;
  
  public DERUniversalString(byte[] paramArrayOfByte)
  {
    this.string = paramArrayOfByte;
  }
  
  public static DERUniversalString getInstance(Object paramObject)
  {
    if ((paramObject == null) || ((paramObject instanceof DERUniversalString))) {
      return (DERUniversalString)paramObject;
    }
    if ((paramObject instanceof ASN1OctetString)) {
      return new DERUniversalString(((ASN1OctetString)paramObject).getOctets());
    }
    throw new IllegalArgumentException("illegal object in getInstance: " + paramObject.getClass().getName());
  }
  
  public static DERUniversalString getInstance(ASN1TaggedObject paramASN1TaggedObject, boolean paramBoolean)
  {
    return getInstance(paramASN1TaggedObject.getObject());
  }
  
  boolean asn1Equals(DERObject paramDERObject)
  {
    if (!(paramDERObject instanceof DERUniversalString)) {
      return false;
    }
    return getString().equals(((DERUniversalString)paramDERObject).getString());
  }
  
  void encode(DEROutputStream paramDEROutputStream)
    throws IOException
  {
    paramDEROutputStream.writeEncoded(28, getOctets());
  }
  
  public byte[] getOctets()
  {
    return this.string;
  }
  
  public String getString()
  {
    StringBuffer localStringBuffer = new StringBuffer("#");
    Object localObject = new ByteArrayOutputStream();
    ASN1OutputStream localASN1OutputStream = new ASN1OutputStream((OutputStream)localObject);
    try
    {
      localASN1OutputStream.writeObject(this);
      localObject = ((ByteArrayOutputStream)localObject).toByteArray();
      int i = 0;
      while (i != localObject.length)
      {
        localStringBuffer.append(table[(localObject[i] >>> 4 & 0xF)]);
        localStringBuffer.append(table[(localObject[i] & 0xF)]);
        i += 1;
      }
      return localIOException.toString();
    }
    catch (IOException localIOException)
    {
      throw new RuntimeException("internal error encoding BitString");
    }
  }
  
  public int hashCode()
  {
    return getString().hashCode();
  }
  
  public String toString()
  {
    return getString();
  }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/org/bouncycastle/asn1/DERUniversalString.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */