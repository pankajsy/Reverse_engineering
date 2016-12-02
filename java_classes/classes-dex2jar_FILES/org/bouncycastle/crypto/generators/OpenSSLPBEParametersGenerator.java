package org.bouncycastle.crypto.generators;

import org.bouncycastle.crypto.CipherParameters;
import org.bouncycastle.crypto.Digest;
import org.bouncycastle.crypto.PBEParametersGenerator;
import org.bouncycastle.crypto.digests.MD5Digest;
import org.bouncycastle.crypto.params.KeyParameter;
import org.bouncycastle.crypto.params.ParametersWithIV;

public class OpenSSLPBEParametersGenerator
  extends PBEParametersGenerator
{
  private Digest digest = new MD5Digest();
  
  private byte[] generateDerivedKey(int paramInt)
  {
    byte[] arrayOfByte1 = new byte[this.digest.getDigestSize()];
    byte[] arrayOfByte2 = new byte[paramInt];
    int i = 0;
    for (;;)
    {
      this.digest.update(this.password, 0, this.password.length);
      this.digest.update(this.salt, 0, this.salt.length);
      this.digest.doFinal(arrayOfByte1, 0);
      if (paramInt > arrayOfByte1.length) {}
      for (int j = arrayOfByte1.length;; j = paramInt)
      {
        System.arraycopy(arrayOfByte1, 0, arrayOfByte2, i, j);
        i += j;
        paramInt -= j;
        if (paramInt != 0) {
          break;
        }
        return arrayOfByte2;
      }
      this.digest.reset();
      this.digest.update(arrayOfByte1, 0, arrayOfByte1.length);
    }
  }
  
  public CipherParameters generateDerivedMacParameters(int paramInt)
  {
    return generateDerivedParameters(paramInt);
  }
  
  public CipherParameters generateDerivedParameters(int paramInt)
  {
    paramInt /= 8;
    return new KeyParameter(generateDerivedKey(paramInt), 0, paramInt);
  }
  
  public CipherParameters generateDerivedParameters(int paramInt1, int paramInt2)
  {
    paramInt1 /= 8;
    paramInt2 /= 8;
    byte[] arrayOfByte = generateDerivedKey(paramInt1 + paramInt2);
    return new ParametersWithIV(new KeyParameter(arrayOfByte, 0, paramInt1), arrayOfByte, paramInt1, paramInt2);
  }
  
  public void init(byte[] paramArrayOfByte1, byte[] paramArrayOfByte2)
  {
    super.init(paramArrayOfByte1, paramArrayOfByte2, 1);
  }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/org/bouncycastle/crypto/generators/OpenSSLPBEParametersGenerator.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */