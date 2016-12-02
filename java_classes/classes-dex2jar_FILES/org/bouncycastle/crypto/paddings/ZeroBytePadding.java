package org.bouncycastle.crypto.paddings;

import java.security.SecureRandom;
import org.bouncycastle.crypto.InvalidCipherTextException;

public class ZeroBytePadding
  implements BlockCipherPadding
{
  public int addPadding(byte[] paramArrayOfByte, int paramInt)
  {
    int j = paramArrayOfByte.length;
    int i = paramInt;
    while (i < paramArrayOfByte.length)
    {
      paramArrayOfByte[i] = 0;
      i += 1;
    }
    return j - paramInt;
  }
  
  public String getPaddingName()
  {
    return "ZeroByte";
  }
  
  public void init(SecureRandom paramSecureRandom)
    throws IllegalArgumentException
  {}
  
  public int padCount(byte[] paramArrayOfByte)
    throws InvalidCipherTextException
  {
    int i = paramArrayOfByte.length;
    for (;;)
    {
      if ((i <= 0) || (paramArrayOfByte[(i - 1)] != 0)) {
        return paramArrayOfByte.length - i;
      }
      i -= 1;
    }
  }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/org/bouncycastle/crypto/paddings/ZeroBytePadding.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */