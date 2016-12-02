package org.bouncycastle.crypto.paddings;

import org.bouncycastle.crypto.BlockCipher;
import org.bouncycastle.crypto.BufferedBlockCipher;
import org.bouncycastle.crypto.CipherParameters;
import org.bouncycastle.crypto.DataLengthException;
import org.bouncycastle.crypto.InvalidCipherTextException;
import org.bouncycastle.crypto.params.ParametersWithRandom;

public class PaddedBufferedBlockCipher
  extends BufferedBlockCipher
{
  BlockCipherPadding padding;
  
  public PaddedBufferedBlockCipher(BlockCipher paramBlockCipher)
  {
    this(paramBlockCipher, new PKCS7Padding());
  }
  
  public PaddedBufferedBlockCipher(BlockCipher paramBlockCipher, BlockCipherPadding paramBlockCipherPadding)
  {
    this.cipher = paramBlockCipher;
    this.padding = paramBlockCipherPadding;
    this.buf = new byte[paramBlockCipher.getBlockSize()];
    this.bufOff = 0;
  }
  
  public int doFinal(byte[] paramArrayOfByte, int paramInt)
    throws DataLengthException, IllegalStateException, InvalidCipherTextException
  {
    int j = this.cipher.getBlockSize();
    int i = 0;
    if (this.forEncryption)
    {
      if (this.bufOff == j)
      {
        if (j * 2 + paramInt > paramArrayOfByte.length)
        {
          reset();
          throw new DataLengthException("output buffer too short");
        }
        i = this.cipher.processBlock(this.buf, 0, paramArrayOfByte, paramInt);
        this.bufOff = 0;
      }
      this.padding.addPadding(this.buf, this.bufOff);
      paramInt = this.cipher.processBlock(this.buf, 0, paramArrayOfByte, paramInt + i);
      reset();
      return i + paramInt;
    }
    if (this.bufOff == j)
    {
      i = this.cipher.processBlock(this.buf, 0, this.buf, 0);
      this.bufOff = 0;
    }
    try
    {
      i -= this.padding.padCount(this.buf);
      System.arraycopy(this.buf, 0, paramArrayOfByte, paramInt, i);
      reset();
      return i;
    }
    finally
    {
      reset();
    }
    reset();
    throw new DataLengthException("last block incomplete in decryption");
  }
  
  public int getOutputSize(int paramInt)
  {
    int i = paramInt + this.bufOff;
    paramInt = i % this.buf.length;
    if (paramInt == 0)
    {
      paramInt = i;
      if (this.forEncryption) {
        paramInt = i + this.buf.length;
      }
      return paramInt;
    }
    return i - paramInt + this.buf.length;
  }
  
  public int getUpdateOutputSize(int paramInt)
  {
    paramInt += this.bufOff;
    int i = paramInt % this.buf.length;
    if (i == 0) {
      return paramInt - this.buf.length;
    }
    return paramInt - i;
  }
  
  public void init(boolean paramBoolean, CipherParameters paramCipherParameters)
    throws IllegalArgumentException
  {
    this.forEncryption = paramBoolean;
    reset();
    if ((paramCipherParameters instanceof ParametersWithRandom))
    {
      paramCipherParameters = (ParametersWithRandom)paramCipherParameters;
      this.padding.init(paramCipherParameters.getRandom());
      this.cipher.init(paramBoolean, paramCipherParameters.getParameters());
      return;
    }
    this.padding.init(null);
    this.cipher.init(paramBoolean, paramCipherParameters);
  }
  
  public int processByte(byte paramByte, byte[] paramArrayOfByte, int paramInt)
    throws DataLengthException, IllegalStateException
  {
    int i = 0;
    if (this.bufOff == this.buf.length)
    {
      i = this.cipher.processBlock(this.buf, 0, paramArrayOfByte, paramInt);
      this.bufOff = 0;
    }
    paramArrayOfByte = this.buf;
    paramInt = this.bufOff;
    this.bufOff = (paramInt + 1);
    paramArrayOfByte[paramInt] = paramByte;
    return i;
  }
  
  public int processBytes(byte[] paramArrayOfByte1, int paramInt1, int paramInt2, byte[] paramArrayOfByte2, int paramInt3)
    throws DataLengthException, IllegalStateException
  {
    if (paramInt2 < 0) {
      throw new IllegalArgumentException("Can't have a negative input length!");
    }
    int n = getBlockSize();
    int i = getUpdateOutputSize(paramInt2);
    if ((i > 0) && (paramInt3 + i > paramArrayOfByte2.length)) {
      throw new DataLengthException("output buffer too short");
    }
    int j = 0;
    int i1 = this.buf.length - this.bufOff;
    int k = paramInt1;
    int m = paramInt2;
    if (paramInt2 > i1)
    {
      System.arraycopy(paramArrayOfByte1, paramInt1, this.buf, this.bufOff, i1);
      i = 0 + this.cipher.processBlock(this.buf, 0, paramArrayOfByte2, paramInt3);
      this.bufOff = 0;
      paramInt2 -= i1;
      paramInt1 += i1;
      for (;;)
      {
        j = i;
        k = paramInt1;
        m = paramInt2;
        if (paramInt2 <= this.buf.length) {
          break;
        }
        i += this.cipher.processBlock(paramArrayOfByte1, paramInt1, paramArrayOfByte2, paramInt3 + i);
        paramInt2 -= n;
        paramInt1 += n;
      }
    }
    System.arraycopy(paramArrayOfByte1, k, this.buf, this.bufOff, m);
    this.bufOff += m;
    return j;
  }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/org/bouncycastle/crypto/paddings/PaddedBufferedBlockCipher.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */