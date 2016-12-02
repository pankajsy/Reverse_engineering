package org.bouncycastle.asn1;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import org.bouncycastle.util.Arrays;

public class DERApplicationSpecific
  extends ASN1Object
{
  private final boolean isConstructed;
  private final byte[] octets;
  private final int tag;
  
  public DERApplicationSpecific(int paramInt, ASN1EncodableVector paramASN1EncodableVector)
  {
    this.tag = paramInt;
    this.isConstructed = true;
    ByteArrayOutputStream localByteArrayOutputStream = new ByteArrayOutputStream();
    paramInt = 0;
    while (paramInt != paramASN1EncodableVector.size()) {
      try
      {
        localByteArrayOutputStream.write(((ASN1Encodable)paramASN1EncodableVector.get(paramInt)).getEncoded());
        paramInt += 1;
      }
      catch (IOException paramASN1EncodableVector)
      {
        throw new ASN1ParsingException("malformed object: " + paramASN1EncodableVector, paramASN1EncodableVector);
      }
    }
    this.octets = localByteArrayOutputStream.toByteArray();
  }
  
  public DERApplicationSpecific(int paramInt, DEREncodable paramDEREncodable)
    throws IOException
  {
    this(true, paramInt, paramDEREncodable);
  }
  
  public DERApplicationSpecific(int paramInt, byte[] paramArrayOfByte)
  {
    this(false, paramInt, paramArrayOfByte);
  }
  
  public DERApplicationSpecific(boolean paramBoolean, int paramInt, DEREncodable paramDEREncodable)
    throws IOException
  {
    paramDEREncodable = paramDEREncodable.getDERObject().getDEREncoded();
    this.isConstructed = paramBoolean;
    this.tag = paramInt;
    if (paramBoolean)
    {
      this.octets = paramDEREncodable;
      return;
    }
    paramInt = getLengthOfLength(paramDEREncodable);
    byte[] arrayOfByte = new byte[paramDEREncodable.length - paramInt];
    System.arraycopy(paramDEREncodable, paramInt, arrayOfByte, 0, arrayOfByte.length);
    this.octets = arrayOfByte;
  }
  
  DERApplicationSpecific(boolean paramBoolean, int paramInt, byte[] paramArrayOfByte)
  {
    this.isConstructed = paramBoolean;
    this.tag = paramInt;
    this.octets = paramArrayOfByte;
  }
  
  private int getLengthOfLength(byte[] paramArrayOfByte)
  {
    int i = 2;
    while ((paramArrayOfByte[(i - 1)] & 0x80) != 0) {
      i += 1;
    }
    return i;
  }
  
  private byte[] replaceTagNumber(int paramInt, byte[] paramArrayOfByte)
    throws IOException
  {
    int j = paramArrayOfByte[0];
    int i = 1;
    if ((j & 0x1F) == 31)
    {
      int k = 0;
      i = 1 + 1;
      int m = paramArrayOfByte[1] & 0xFF;
      j = m;
      if ((m & 0x7F) == 0) {
        throw new ASN1ParsingException("corrupted stream - invalid high tag number found");
      }
      while ((j >= 0) && ((j & 0x80) != 0))
      {
        k = (k | j & 0x7F) << 7;
        j = paramArrayOfByte[i] & 0xFF;
        i += 1;
      }
    }
    byte[] arrayOfByte = new byte[paramArrayOfByte.length - i + 1];
    System.arraycopy(paramArrayOfByte, i, arrayOfByte, 1, arrayOfByte.length - 1);
    arrayOfByte[0] = ((byte)paramInt);
    return arrayOfByte;
  }
  
  boolean asn1Equals(DERObject paramDERObject)
  {
    if (!(paramDERObject instanceof DERApplicationSpecific)) {}
    do
    {
      return false;
      paramDERObject = (DERApplicationSpecific)paramDERObject;
    } while ((this.isConstructed != paramDERObject.isConstructed) || (this.tag != paramDERObject.tag) || (!Arrays.areEqual(this.octets, paramDERObject.octets)));
    return true;
  }
  
  void encode(DEROutputStream paramDEROutputStream)
    throws IOException
  {
    int i = 64;
    if (this.isConstructed) {
      i = 0x40 | 0x20;
    }
    paramDEROutputStream.writeEncoded(i, this.tag, this.octets);
  }
  
  public int getApplicationTag()
  {
    return this.tag;
  }
  
  public byte[] getContents()
  {
    return this.octets;
  }
  
  public DERObject getObject()
    throws IOException
  {
    return new ASN1InputStream(getContents()).readObject();
  }
  
  public DERObject getObject(int paramInt)
    throws IOException
  {
    if (paramInt >= 31) {
      throw new IOException("unsupported tag number");
    }
    byte[] arrayOfByte1 = getEncoded();
    byte[] arrayOfByte2 = replaceTagNumber(paramInt, arrayOfByte1);
    if ((arrayOfByte1[0] & 0x20) != 0) {
      arrayOfByte2[0] = ((byte)(arrayOfByte2[0] | 0x20));
    }
    return new ASN1InputStream(arrayOfByte2).readObject();
  }
  
  public int hashCode()
  {
    if (this.isConstructed) {}
    for (int i = 1;; i = 0) {
      return i ^ this.tag ^ Arrays.hashCode(this.octets);
    }
  }
  
  public boolean isConstructed()
  {
    return this.isConstructed;
  }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/org/bouncycastle/asn1/DERApplicationSpecific.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */