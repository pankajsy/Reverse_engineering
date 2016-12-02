package org.bouncycastle.crypto.paddings;

import java.security.SecureRandom;
import org.bouncycastle.crypto.InvalidCipherTextException;

public class PKCS7Padding
  implements BlockCipherPadding
{
  public int addPadding(byte[] paramArrayOfByte, int paramInt)
  {
    int i = (byte)(paramArrayOfByte.length - paramInt);
    while (paramInt < paramArrayOfByte.length)
    {
      paramArrayOfByte[paramInt] = i;
      paramInt += 1;
    }
    return i;
  }
  
  public String getPaddingName()
  {
    return "PKCS7";
  }
  
  public void init(SecureRandom paramSecureRandom)
    throws IllegalArgumentException
  {}
  
  public int padCount(byte[] paramArrayOfByte)
    throws InvalidCipherTextException
  {
    int j = paramArrayOfByte[(paramArrayOfByte.length - 1)] & 0xFF;
    if ((j > paramArrayOfByte.length) || (j == 0)) {
      throw new InvalidCipherTextException("pad block corrupted");
    }
    int i = 1;
    while (i <= j)
    {
      if (paramArrayOfByte[(paramArrayOfByte.length - i)] != j) {
        throw new InvalidCipherTextException("pad block corrupted");
      }
      i += 1;
    }
    return j;
  }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/org/bouncycastle/crypto/paddings/PKCS7Padding.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */