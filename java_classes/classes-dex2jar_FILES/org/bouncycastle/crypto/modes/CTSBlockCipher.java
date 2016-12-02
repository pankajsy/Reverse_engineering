package org.bouncycastle.crypto.modes;

import org.bouncycastle.crypto.BlockCipher;
import org.bouncycastle.crypto.BufferedBlockCipher;
import org.bouncycastle.crypto.DataLengthException;
import org.bouncycastle.crypto.InvalidCipherTextException;

public class CTSBlockCipher
  extends BufferedBlockCipher
{
  private int blockSize;
  
  public CTSBlockCipher(BlockCipher paramBlockCipher)
  {
    if (((paramBlockCipher instanceof OFBBlockCipher)) || ((paramBlockCipher instanceof CFBBlockCipher))) {
      throw new IllegalArgumentException("CTSBlockCipher can only accept ECB, or CBC ciphers");
    }
    this.cipher = paramBlockCipher;
    this.blockSize = paramBlockCipher.getBlockSize();
    this.buf = new byte[this.blockSize * 2];
    this.bufOff = 0;
  }
  
  public int doFinal(byte[] paramArrayOfByte, int paramInt)
    throws DataLengthException, IllegalStateException, InvalidCipherTextException
  {
    if (this.bufOff + paramInt > paramArrayOfByte.length) {
      throw new DataLengthException("output buffer to small in doFinal");
    }
    int i = this.cipher.getBlockSize();
    int k = this.bufOff - i;
    byte[] arrayOfByte1 = new byte[i];
    int j;
    byte[] arrayOfByte2;
    if (this.forEncryption)
    {
      this.cipher.processBlock(this.buf, 0, arrayOfByte1, 0);
      if (this.bufOff < i) {
        throw new DataLengthException("need at least one block of input for CTS");
      }
      j = this.bufOff;
      while (j != this.buf.length)
      {
        this.buf[j] = arrayOfByte1[(j - i)];
        j += 1;
      }
      j = i;
      while (j != this.bufOff)
      {
        arrayOfByte2 = this.buf;
        arrayOfByte2[j] = ((byte)(arrayOfByte2[j] ^ arrayOfByte1[(j - i)]));
        j += 1;
      }
      if ((this.cipher instanceof CBCBlockCipher))
      {
        ((CBCBlockCipher)this.cipher).getUnderlyingCipher().processBlock(this.buf, i, paramArrayOfByte, paramInt);
        System.arraycopy(arrayOfByte1, 0, paramArrayOfByte, paramInt + i, k);
      }
    }
    for (;;)
    {
      paramInt = this.bufOff;
      reset();
      return paramInt;
      this.cipher.processBlock(this.buf, i, paramArrayOfByte, paramInt);
      break;
      arrayOfByte2 = new byte[i];
      if ((this.cipher instanceof CBCBlockCipher)) {
        ((CBCBlockCipher)this.cipher).getUnderlyingCipher().processBlock(this.buf, 0, arrayOfByte1, 0);
      }
      for (;;)
      {
        j = i;
        while (j != this.bufOff)
        {
          arrayOfByte2[(j - i)] = ((byte)(arrayOfByte1[(j - i)] ^ this.buf[j]));
          j += 1;
        }
        this.cipher.processBlock(this.buf, 0, arrayOfByte1, 0);
      }
      System.arraycopy(this.buf, i, arrayOfByte1, 0, k);
      this.cipher.processBlock(arrayOfByte1, 0, paramArrayOfByte, paramInt);
      System.arraycopy(arrayOfByte2, 0, paramArrayOfByte, paramInt + i, k);
    }
  }
  
  public int getOutputSize(int paramInt)
  {
    return this.bufOff + paramInt;
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
  
  public int processByte(byte paramByte, byte[] paramArrayOfByte, int paramInt)
    throws DataLengthException, IllegalStateException
  {
    int i = 0;
    if (this.bufOff == this.buf.length)
    {
      i = this.cipher.processBlock(this.buf, 0, paramArrayOfByte, paramInt);
      System.arraycopy(this.buf, this.blockSize, this.buf, 0, this.blockSize);
      this.bufOff = this.blockSize;
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
      System.arraycopy(this.buf, n, this.buf, 0, n);
      this.bufOff = n;
      paramInt2 -= i1;
      paramInt1 += i1;
      for (;;)
      {
        j = i;
        k = paramInt1;
        m = paramInt2;
        if (paramInt2 <= n) {
          break;
        }
        System.arraycopy(paramArrayOfByte1, paramInt1, this.buf, this.bufOff, n);
        i += this.cipher.processBlock(this.buf, 0, paramArrayOfByte2, paramInt3 + i);
        System.arraycopy(this.buf, n, this.buf, 0, n);
        paramInt2 -= n;
        paramInt1 += n;
      }
    }
    System.arraycopy(paramArrayOfByte1, k, this.buf, this.bufOff, m);
    this.bufOff += m;
    return j;
  }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/org/bouncycastle/crypto/modes/CTSBlockCipher.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */