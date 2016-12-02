package org.bouncycastle.crypto.generators;

import org.bouncycastle.crypto.CipherParameters;
import org.bouncycastle.crypto.Digest;
import org.bouncycastle.crypto.ExtendedDigest;
import org.bouncycastle.crypto.PBEParametersGenerator;
import org.bouncycastle.crypto.params.KeyParameter;
import org.bouncycastle.crypto.params.ParametersWithIV;

public class PKCS12ParametersGenerator
  extends PBEParametersGenerator
{
  public static final int IV_MATERIAL = 2;
  public static final int KEY_MATERIAL = 1;
  public static final int MAC_MATERIAL = 3;
  private Digest digest;
  private int u;
  private int v;
  
  public PKCS12ParametersGenerator(Digest paramDigest)
  {
    this.digest = paramDigest;
    if ((paramDigest instanceof ExtendedDigest))
    {
      this.u = paramDigest.getDigestSize();
      this.v = ((ExtendedDigest)paramDigest).getByteLength();
      return;
    }
    throw new IllegalArgumentException("Digest " + paramDigest.getAlgorithmName() + " unsupported");
  }
  
  private void adjust(byte[] paramArrayOfByte1, int paramInt, byte[] paramArrayOfByte2)
  {
    int i = (paramArrayOfByte2[(paramArrayOfByte2.length - 1)] & 0xFF) + (paramArrayOfByte1[(paramArrayOfByte2.length + paramInt - 1)] & 0xFF) + 1;
    paramArrayOfByte1[(paramArrayOfByte2.length + paramInt - 1)] = ((byte)i);
    int j = i >>> 8;
    i = paramArrayOfByte2.length - 2;
    while (i >= 0)
    {
      j += (paramArrayOfByte2[i] & 0xFF) + (paramArrayOfByte1[(paramInt + i)] & 0xFF);
      paramArrayOfByte1[(paramInt + i)] = ((byte)j);
      j >>>= 8;
      i -= 1;
    }
  }
  
  private byte[] generateDerivedKey(int paramInt1, int paramInt2)
  {
    byte[] arrayOfByte2 = new byte[this.v];
    byte[] arrayOfByte3 = new byte[paramInt2];
    int i = 0;
    while (i != arrayOfByte2.length)
    {
      arrayOfByte2[i] = ((byte)paramInt1);
      i += 1;
    }
    if ((this.salt != null) && (this.salt.length != 0))
    {
      localObject2 = new byte[this.v * ((this.salt.length + this.v - 1) / this.v)];
      paramInt1 = 0;
      for (;;)
      {
        localObject1 = localObject2;
        if (paramInt1 == localObject2.length) {
          break;
        }
        localObject2[paramInt1] = this.salt[(paramInt1 % this.salt.length)];
        paramInt1 += 1;
      }
    }
    Object localObject1 = new byte[0];
    if ((this.password != null) && (this.password.length != 0))
    {
      arrayOfByte1 = new byte[this.v * ((this.password.length + this.v - 1) / this.v)];
      paramInt1 = 0;
      for (;;)
      {
        localObject2 = arrayOfByte1;
        if (paramInt1 == arrayOfByte1.length) {
          break;
        }
        arrayOfByte1[paramInt1] = this.password[(paramInt1 % this.password.length)];
        paramInt1 += 1;
      }
    }
    Object localObject2 = new byte[0];
    byte[] arrayOfByte1 = new byte[localObject1.length + localObject2.length];
    System.arraycopy(localObject1, 0, arrayOfByte1, 0, localObject1.length);
    System.arraycopy(localObject2, 0, arrayOfByte1, localObject1.length, localObject2.length);
    localObject1 = new byte[this.v];
    i = (this.u + paramInt2 - 1) / this.u;
    paramInt1 = 1;
    if (paramInt1 <= i)
    {
      localObject2 = new byte[this.u];
      this.digest.update(arrayOfByte2, 0, arrayOfByte2.length);
      this.digest.update(arrayOfByte1, 0, arrayOfByte1.length);
      this.digest.doFinal((byte[])localObject2, 0);
      paramInt2 = 1;
      while (paramInt2 != this.iterationCount)
      {
        this.digest.update((byte[])localObject2, 0, localObject2.length);
        this.digest.doFinal((byte[])localObject2, 0);
        paramInt2 += 1;
      }
      paramInt2 = 0;
      while (paramInt2 != localObject1.length)
      {
        localObject1[paramInt2] = localObject2[(paramInt2 % localObject2.length)];
        paramInt2 += 1;
      }
      paramInt2 = 0;
      while (paramInt2 != arrayOfByte1.length / this.v)
      {
        adjust(arrayOfByte1, this.v * paramInt2, (byte[])localObject1);
        paramInt2 += 1;
      }
      if (paramInt1 == i) {
        System.arraycopy(localObject2, 0, arrayOfByte3, (paramInt1 - 1) * this.u, arrayOfByte3.length - (paramInt1 - 1) * this.u);
      }
      for (;;)
      {
        paramInt1 += 1;
        break;
        System.arraycopy(localObject2, 0, arrayOfByte3, (paramInt1 - 1) * this.u, localObject2.length);
      }
    }
    return arrayOfByte3;
  }
  
  public CipherParameters generateDerivedMacParameters(int paramInt)
  {
    paramInt /= 8;
    return new KeyParameter(generateDerivedKey(3, paramInt), 0, paramInt);
  }
  
  public CipherParameters generateDerivedParameters(int paramInt)
  {
    paramInt /= 8;
    return new KeyParameter(generateDerivedKey(1, paramInt), 0, paramInt);
  }
  
  public CipherParameters generateDerivedParameters(int paramInt1, int paramInt2)
  {
    paramInt1 /= 8;
    paramInt2 /= 8;
    byte[] arrayOfByte1 = generateDerivedKey(1, paramInt1);
    byte[] arrayOfByte2 = generateDerivedKey(2, paramInt2);
    return new ParametersWithIV(new KeyParameter(arrayOfByte1, 0, paramInt1), arrayOfByte2, 0, paramInt2);
  }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/org/bouncycastle/crypto/generators/PKCS12ParametersGenerator.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */