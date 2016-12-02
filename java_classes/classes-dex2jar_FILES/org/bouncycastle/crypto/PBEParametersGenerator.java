package org.bouncycastle.crypto;

import org.bouncycastle.util.Strings;

public abstract class PBEParametersGenerator
{
  protected int iterationCount;
  protected byte[] password;
  protected byte[] salt;
  
  public static byte[] PKCS12PasswordToBytes(char[] paramArrayOfChar)
  {
    if (paramArrayOfChar.length > 0)
    {
      byte[] arrayOfByte2 = new byte[(paramArrayOfChar.length + 1) * 2];
      int i = 0;
      for (;;)
      {
        arrayOfByte1 = arrayOfByte2;
        if (i == paramArrayOfChar.length) {
          break;
        }
        arrayOfByte2[(i * 2)] = ((byte)(paramArrayOfChar[i] >>> '\b'));
        arrayOfByte2[(i * 2 + 1)] = ((byte)paramArrayOfChar[i]);
        i += 1;
      }
    }
    byte[] arrayOfByte1 = new byte[0];
    return arrayOfByte1;
  }
  
  public static byte[] PKCS5PasswordToBytes(char[] paramArrayOfChar)
  {
    byte[] arrayOfByte = new byte[paramArrayOfChar.length];
    int i = 0;
    while (i != arrayOfByte.length)
    {
      arrayOfByte[i] = ((byte)paramArrayOfChar[i]);
      i += 1;
    }
    return arrayOfByte;
  }
  
  public static byte[] PKCS5PasswordToUTF8Bytes(char[] paramArrayOfChar)
  {
    return Strings.toUTF8ByteArray(paramArrayOfChar);
  }
  
  public abstract CipherParameters generateDerivedMacParameters(int paramInt);
  
  public abstract CipherParameters generateDerivedParameters(int paramInt);
  
  public abstract CipherParameters generateDerivedParameters(int paramInt1, int paramInt2);
  
  public int getIterationCount()
  {
    return this.iterationCount;
  }
  
  public byte[] getPassword()
  {
    return this.password;
  }
  
  public byte[] getSalt()
  {
    return this.salt;
  }
  
  public void init(byte[] paramArrayOfByte1, byte[] paramArrayOfByte2, int paramInt)
  {
    this.password = paramArrayOfByte1;
    this.salt = paramArrayOfByte2;
    this.iterationCount = paramInt;
  }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/org/bouncycastle/crypto/PBEParametersGenerator.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */