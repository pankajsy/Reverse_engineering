package org.bouncycastle.asn1;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.math.BigInteger;

public class DERObjectIdentifier
  extends ASN1Object
{
  String identifier;
  
  public DERObjectIdentifier(String paramString)
  {
    if (!isValidIdentifier(paramString)) {
      throw new IllegalArgumentException("string " + paramString + " not an OID");
    }
    this.identifier = paramString;
  }
  
  DERObjectIdentifier(byte[] paramArrayOfByte)
  {
    StringBuffer localStringBuffer = new StringBuffer();
    long l1 = 0L;
    Object localObject1 = null;
    int i = 1;
    int k = 0;
    if (k != paramArrayOfByte.length)
    {
      int m = paramArrayOfByte[k] & 0xFF;
      long l2;
      Object localObject2;
      int j;
      if (l1 < 36028797018963968L)
      {
        l2 = 128L * l1 + (m & 0x7F);
        localObject2 = localObject1;
        j = i;
        l1 = l2;
        if ((m & 0x80) == 0)
        {
          j = i;
          l1 = l2;
          if (i != 0) {}
          switch ((int)l2 / 40)
          {
          default: 
            localStringBuffer.append('2');
            l1 = l2 - 80L;
            label140:
            j = 0;
            localStringBuffer.append('.');
            localStringBuffer.append(l1);
            l1 = 0L;
            localObject2 = localObject1;
          }
        }
      }
      for (;;)
      {
        k += 1;
        localObject1 = localObject2;
        i = j;
        break;
        localStringBuffer.append('0');
        l1 = l2;
        break label140;
        localStringBuffer.append('1');
        l1 = l2 - 40L;
        break label140;
        localObject2 = localObject1;
        if (localObject1 == null) {
          localObject2 = BigInteger.valueOf(l1);
        }
        localObject1 = ((BigInteger)localObject2).shiftLeft(7).or(BigInteger.valueOf(m & 0x7F));
        localObject2 = localObject1;
        j = i;
        if ((m & 0x80) == 0)
        {
          localStringBuffer.append('.');
          localStringBuffer.append(localObject1);
          localObject2 = null;
          l1 = 0L;
          j = i;
        }
      }
    }
    this.identifier = localStringBuffer.toString();
  }
  
  public static DERObjectIdentifier getInstance(Object paramObject)
  {
    if ((paramObject == null) || ((paramObject instanceof DERObjectIdentifier))) {
      return (DERObjectIdentifier)paramObject;
    }
    if ((paramObject instanceof ASN1OctetString)) {
      return new DERObjectIdentifier(((ASN1OctetString)paramObject).getOctets());
    }
    if ((paramObject instanceof ASN1TaggedObject)) {
      return getInstance(((ASN1TaggedObject)paramObject).getObject());
    }
    throw new IllegalArgumentException("illegal object in getInstance: " + paramObject.getClass().getName());
  }
  
  public static DERObjectIdentifier getInstance(ASN1TaggedObject paramASN1TaggedObject, boolean paramBoolean)
  {
    return getInstance(paramASN1TaggedObject.getObject());
  }
  
  private static boolean isValidIdentifier(String paramString)
  {
    boolean bool2;
    if ((paramString.length() < 3) || (paramString.charAt(1) != '.')) {
      bool2 = false;
    }
    int i;
    do
    {
      return bool2;
      i = paramString.charAt(0);
      if ((i < 48) || (i > 50)) {
        return false;
      }
      bool1 = false;
      i = paramString.length() - 1;
      bool2 = bool1;
    } while (i < 2);
    int j = paramString.charAt(i);
    if ((48 <= j) && (j <= 57)) {}
    for (boolean bool1 = true;; bool1 = false)
    {
      i -= 1;
      break;
      if (j != 46) {
        break label105;
      }
      if (!bool1) {
        return false;
      }
    }
    label105:
    return false;
  }
  
  private void writeField(OutputStream paramOutputStream, long paramLong)
    throws IOException
  {
    if (paramLong >= 128L)
    {
      if (paramLong >= 16384L)
      {
        if (paramLong >= 2097152L)
        {
          if (paramLong >= 268435456L)
          {
            if (paramLong >= 34359738368L)
            {
              if (paramLong >= 4398046511104L)
              {
                if (paramLong >= 562949953421312L)
                {
                  if (paramLong >= 72057594037927936L) {
                    paramOutputStream.write((int)(paramLong >> 56) | 0x80);
                  }
                  paramOutputStream.write((int)(paramLong >> 49) | 0x80);
                }
                paramOutputStream.write((int)(paramLong >> 42) | 0x80);
              }
              paramOutputStream.write((int)(paramLong >> 35) | 0x80);
            }
            paramOutputStream.write((int)(paramLong >> 28) | 0x80);
          }
          paramOutputStream.write((int)(paramLong >> 21) | 0x80);
        }
        paramOutputStream.write((int)(paramLong >> 14) | 0x80);
      }
      paramOutputStream.write((int)(paramLong >> 7) | 0x80);
    }
    paramOutputStream.write((int)paramLong & 0x7F);
  }
  
  private void writeField(OutputStream paramOutputStream, BigInteger paramBigInteger)
    throws IOException
  {
    int j = (paramBigInteger.bitLength() + 6) / 7;
    if (j == 0)
    {
      paramOutputStream.write(0);
      return;
    }
    byte[] arrayOfByte = new byte[j];
    int i = j - 1;
    while (i >= 0)
    {
      arrayOfByte[i] = ((byte)(paramBigInteger.intValue() & 0x7F | 0x80));
      paramBigInteger = paramBigInteger.shiftRight(7);
      i -= 1;
    }
    i = j - 1;
    arrayOfByte[i] = ((byte)(arrayOfByte[i] & 0x7F));
    paramOutputStream.write(arrayOfByte);
  }
  
  boolean asn1Equals(DERObject paramDERObject)
  {
    if (!(paramDERObject instanceof DERObjectIdentifier)) {
      return false;
    }
    return this.identifier.equals(((DERObjectIdentifier)paramDERObject).identifier);
  }
  
  void encode(DEROutputStream paramDEROutputStream)
    throws IOException
  {
    OIDTokenizer localOIDTokenizer = new OIDTokenizer(this.identifier);
    ByteArrayOutputStream localByteArrayOutputStream = new ByteArrayOutputStream();
    DEROutputStream localDEROutputStream = new DEROutputStream(localByteArrayOutputStream);
    writeField(localByteArrayOutputStream, Integer.parseInt(localOIDTokenizer.nextToken()) * 40 + Integer.parseInt(localOIDTokenizer.nextToken()));
    while (localOIDTokenizer.hasMoreTokens())
    {
      String str = localOIDTokenizer.nextToken();
      if (str.length() < 18) {
        writeField(localByteArrayOutputStream, Long.parseLong(str));
      } else {
        writeField(localByteArrayOutputStream, new BigInteger(str));
      }
    }
    localDEROutputStream.close();
    paramDEROutputStream.writeEncoded(6, localByteArrayOutputStream.toByteArray());
  }
  
  public String getId()
  {
    return this.identifier;
  }
  
  public int hashCode()
  {
    return this.identifier.hashCode();
  }
  
  public String toString()
  {
    return getId();
  }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/org/bouncycastle/asn1/DERObjectIdentifier.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */