package com.keepassdroid.crypto;

import com.keepassdroid.database.CrsAlgorithm;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import org.bouncycastle.crypto.StreamCipher;
import org.bouncycastle.crypto.engines.Salsa20Engine;
import org.bouncycastle.crypto.params.KeyParameter;
import org.bouncycastle.crypto.params.ParametersWithIV;

public class PwStreamCipherFactory
{
  private static final byte[] SALSA_IV = { -24, 48, 9, 75, -105, 32, 93, 42 };
  
  public static StreamCipher getInstance(CrsAlgorithm paramCrsAlgorithm, byte[] paramArrayOfByte)
  {
    if (paramCrsAlgorithm == CrsAlgorithm.Salsa20) {
      return getSalsa20(paramArrayOfByte);
    }
    return null;
  }
  
  private static StreamCipher getSalsa20(byte[] paramArrayOfByte)
  {
    try
    {
      Object localObject = MessageDigest.getInstance("SHA-256");
      paramArrayOfByte = new ParametersWithIV(new KeyParameter(((MessageDigest)localObject).digest(paramArrayOfByte)), SALSA_IV);
      localObject = new Salsa20Engine();
      ((StreamCipher)localObject).init(true, paramArrayOfByte);
      return (StreamCipher)localObject;
    }
    catch (NoSuchAlgorithmException paramArrayOfByte)
    {
      paramArrayOfByte.printStackTrace();
      throw new RuntimeException("SHA 256 not supported");
    }
  }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/com/keepassdroid/crypto/PwStreamCipherFactory.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */