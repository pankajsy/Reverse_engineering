package org.bouncycastle.crypto.params;

import org.bouncycastle.crypto.CipherParameters;

public class KeyParameter
  implements CipherParameters
{
  private byte[] key;
  
  public KeyParameter(byte[] paramArrayOfByte)
  {
    this(paramArrayOfByte, 0, paramArrayOfByte.length);
  }
  
  public KeyParameter(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
  {
    this.key = new byte[paramInt2];
    System.arraycopy(paramArrayOfByte, paramInt1, this.key, 0, paramInt2);
  }
  
  public byte[] getKey()
  {
    return this.key;
  }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/org/bouncycastle/crypto/params/KeyParameter.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */