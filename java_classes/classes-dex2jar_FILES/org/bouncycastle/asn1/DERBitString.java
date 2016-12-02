package org.bouncycastle.asn1;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import org.bouncycastle.util.Arrays;

public class DERBitString
  extends ASN1Object
  implements DERString
{
  private static final char[] table = { 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 65, 66, 67, 68, 69, 70 };
  protected byte[] data;
  protected int padBits;
  
  protected DERBitString(byte paramByte, int paramInt)
  {
    this.data = new byte[1];
    this.data[0] = paramByte;
    this.padBits = paramInt;
  }
  
  public DERBitString(DEREncodable paramDEREncodable)
  {
    try
    {
      this.data = paramDEREncodable.getDERObject().getEncoded("DER");
      this.padBits = 0;
      return;
    }
    catch (IOException paramDEREncodable)
    {
      throw new IllegalArgumentException("Error processing object : " + paramDEREncodable.toString());
    }
  }
  
  public DERBitString(byte[] paramArrayOfByte)
  {
    this(paramArrayOfByte, 0);
  }
  
  public DERBitString(byte[] paramArrayOfByte, int paramInt)
  {
    this.data = paramArrayOfByte;
    this.padBits = paramInt;
  }
  
  protected static byte[] getBytes(int paramInt)
  {
    int i = 4;
    int j = 3;
    byte[] arrayOfByte;
    for (;;)
    {
      if ((j < 1) || ((255 << j * 8 & paramInt) != 0))
      {
        arrayOfByte = new byte[i];
        j = 0;
        while (j < i)
        {
          arrayOfByte[j] = ((byte)(paramInt >> j * 8 & 0xFF));
          j += 1;
        }
      }
      i -= 1;
      j -= 1;
    }
    return arrayOfByte;
  }
  
  public static DERBitString getInstance(Object paramObject)
  {
    if ((paramObject == null) || ((paramObject instanceof DERBitString))) {
      return (DERBitString)paramObject;
    }
    if ((paramObject instanceof ASN1OctetString))
    {
      paramObject = ((ASN1OctetString)paramObject).getOctets();
      int i = paramObject[0];
      byte[] arrayOfByte = new byte[paramObject.length - 1];
      System.arraycopy(paramObject, 1, arrayOfByte, 0, paramObject.length - 1);
      return new DERBitString(arrayOfByte, i);
    }
    if ((paramObject instanceof ASN1TaggedObject)) {
      return getInstance(((ASN1TaggedObject)paramObject).getObject());
    }
    throw new IllegalArgumentException("illegal object in getInstance: " + paramObject.getClass().getName());
  }
  
  public static DERBitString getInstance(ASN1TaggedObject paramASN1TaggedObject, boolean paramBoolean)
  {
    return getInstance(paramASN1TaggedObject.getObject());
  }
  
  protected static int getPadBits(int paramInt)
  {
    int k = 0;
    int j = 3;
    int i;
    for (;;)
    {
      i = k;
      if (j >= 0)
      {
        if (j == 0) {
          break label41;
        }
        if (paramInt >> j * 8 == 0) {
          break label54;
        }
      }
      for (i = paramInt >> j * 8 & 0xFF;; i = paramInt & 0xFF)
      {
        if (i != 0) {
          break label61;
        }
        return 7;
        label41:
        if (paramInt == 0) {
          break;
        }
      }
      label54:
      j -= 1;
    }
    label61:
    paramInt = 1;
    for (;;)
    {
      i <<= 1;
      if ((i & 0xFF) == 0) {
        break;
      }
      paramInt += 1;
    }
    return 8 - paramInt;
  }
  
  protected boolean asn1Equals(DERObject paramDERObject)
  {
    if (!(paramDERObject instanceof DERBitString)) {}
    do
    {
      return false;
      paramDERObject = (DERBitString)paramDERObject;
    } while ((this.padBits != paramDERObject.padBits) || (!Arrays.areEqual(this.data, paramDERObject.data)));
    return true;
  }
  
  void encode(DEROutputStream paramDEROutputStream)
    throws IOException
  {
    byte[] arrayOfByte = new byte[getBytes().length + 1];
    arrayOfByte[0] = ((byte)getPadBits());
    System.arraycopy(getBytes(), 0, arrayOfByte, 1, arrayOfByte.length - 1);
    paramDEROutputStream.writeEncoded(3, arrayOfByte);
  }
  
  public byte[] getBytes()
  {
    return this.data;
  }
  
  public int getPadBits()
  {
    return this.padBits;
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
    return this.padBits ^ Arrays.hashCode(this.data);
  }
  
  public int intValue()
  {
    int j = 0;
    int i = 0;
    while ((i != this.data.length) && (i != 4))
    {
      j |= (this.data[i] & 0xFF) << i * 8;
      i += 1;
    }
    return j;
  }
  
  public String toString()
  {
    return getString();
  }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/org/bouncycastle/asn1/DERBitString.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */