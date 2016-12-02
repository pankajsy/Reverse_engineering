package org.bouncycastle.crypto;

public class BufferedBlockCipher
{
  protected byte[] buf;
  protected int bufOff;
  protected BlockCipher cipher;
  protected boolean forEncryption;
  protected boolean partialBlockOkay;
  protected boolean pgpCFB;
  
  protected BufferedBlockCipher() {}
  
  public BufferedBlockCipher(BlockCipher paramBlockCipher)
  {
    this.cipher = paramBlockCipher;
    this.buf = new byte[paramBlockCipher.getBlockSize()];
    this.bufOff = 0;
    paramBlockCipher = paramBlockCipher.getAlgorithmName();
    int i = paramBlockCipher.indexOf('/') + 1;
    if ((i > 0) && (paramBlockCipher.startsWith("PGP", i))) {}
    for (boolean bool1 = true;; bool1 = false)
    {
      this.pgpCFB = bool1;
      if (!this.pgpCFB) {
        break;
      }
      this.partialBlockOkay = true;
      return;
    }
    if (i > 0)
    {
      bool1 = bool2;
      if (!paramBlockCipher.startsWith("CFB", i))
      {
        bool1 = bool2;
        if (!paramBlockCipher.startsWith("OFB", i))
        {
          bool1 = bool2;
          if (!paramBlockCipher.startsWith("OpenPGP", i))
          {
            bool1 = bool2;
            if (!paramBlockCipher.startsWith("SIC", i)) {
              if (!paramBlockCipher.startsWith("GCTR", i)) {
                break label159;
              }
            }
          }
        }
      }
    }
    label159:
    for (bool1 = bool2;; bool1 = false)
    {
      this.partialBlockOkay = bool1;
      return;
    }
  }
  
  public int doFinal(byte[] paramArrayOfByte, int paramInt)
    throws DataLengthException, IllegalStateException, InvalidCipherTextException
  {
    int i = 0;
    if (this.bufOff + paramInt > paramArrayOfByte.length) {
      throw new DataLengthException("output buffer too short for doFinal()");
    }
    if ((this.bufOff != 0) && (this.partialBlockOkay))
    {
      this.cipher.processBlock(this.buf, 0, this.buf, 0);
      i = this.bufOff;
      this.bufOff = 0;
      System.arraycopy(this.buf, 0, paramArrayOfByte, paramInt, i);
      paramInt = i;
    }
    do
    {
      reset();
      return paramInt;
      paramInt = i;
    } while (this.bufOff == 0);
    throw new DataLengthException("data not block size aligned");
  }
  
  public int getBlockSize()
  {
    return this.cipher.getBlockSize();
  }
  
  public int getOutputSize(int paramInt)
  {
    return this.bufOff + paramInt;
  }
  
  public BlockCipher getUnderlyingCipher()
  {
    return this.cipher;
  }
  
  public int getUpdateOutputSize(int paramInt)
  {
    int i = paramInt + this.bufOff;
    if (this.pgpCFB) {}
    for (paramInt = i % this.buf.length - (this.cipher.getBlockSize() + 2);; paramInt = i % this.buf.length) {
      return i - paramInt;
    }
  }
  
  public void init(boolean paramBoolean, CipherParameters paramCipherParameters)
    throws IllegalArgumentException
  {
    this.forEncryption = paramBoolean;
    reset();
    this.cipher.init(paramBoolean, paramCipherParameters);
  }
  
  public int processByte(byte paramByte, byte[] paramArrayOfByte, int paramInt)
    throws DataLengthException, IllegalStateException
  {
    int i = 0;
    byte[] arrayOfByte = this.buf;
    int j = this.bufOff;
    this.bufOff = (j + 1);
    arrayOfByte[j] = paramByte;
    if (this.bufOff == this.buf.length)
    {
      i = this.cipher.processBlock(this.buf, 0, paramArrayOfByte, paramInt);
      this.bufOff = 0;
    }
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
    i = 0;
    int i1 = this.buf.length - this.bufOff;
    int k = paramInt1;
    int m = paramInt2;
    if (paramInt2 > i1)
    {
      System.arraycopy(paramArrayOfByte1, paramInt1, this.buf, this.bufOff, i1);
      int j = 0 + this.cipher.processBlock(this.buf, 0, paramArrayOfByte2, paramInt3);
      this.bufOff = 0;
      paramInt2 -= i1;
      paramInt1 += i1;
      for (;;)
      {
        i = j;
        k = paramInt1;
        m = paramInt2;
        if (paramInt2 <= this.buf.length) {
          break;
        }
        j += this.cipher.processBlock(paramArrayOfByte1, paramInt1, paramArrayOfByte2, paramInt3 + j);
        paramInt2 -= n;
        paramInt1 += n;
      }
    }
    System.arraycopy(paramArrayOfByte1, k, this.buf, this.bufOff, m);
    this.bufOff += m;
    paramInt1 = i;
    if (this.bufOff == this.buf.length)
    {
      paramInt1 = i + this.cipher.processBlock(this.buf, 0, paramArrayOfByte2, paramInt3 + i);
      this.bufOff = 0;
    }
    return paramInt1;
  }
  
  public void reset()
  {
    int i = 0;
    while (i < this.buf.length)
    {
      this.buf[i] = 0;
      i += 1;
    }
    this.bufOff = 0;
    this.cipher.reset();
  }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/org/bouncycastle/crypto/BufferedBlockCipher.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */