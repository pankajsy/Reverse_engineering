package org.bouncycastle.crypto.digests;

import org.bouncycastle.crypto.ExtendedDigest;

public abstract class GeneralDigest
  implements ExtendedDigest
{
  private static final int BYTE_LENGTH = 64;
  private long byteCount;
  private byte[] xBuf;
  private int xBufOff;
  
  protected GeneralDigest()
  {
    this.xBuf = new byte[4];
    this.xBufOff = 0;
  }
  
  protected GeneralDigest(GeneralDigest paramGeneralDigest)
  {
    this.xBuf = new byte[paramGeneralDigest.xBuf.length];
    System.arraycopy(paramGeneralDigest.xBuf, 0, this.xBuf, 0, paramGeneralDigest.xBuf.length);
    this.xBufOff = paramGeneralDigest.xBufOff;
    this.byteCount = paramGeneralDigest.byteCount;
  }
  
  public void finish()
  {
    long l = this.byteCount;
    update((byte)Byte.MIN_VALUE);
    while (this.xBufOff != 0) {
      update((byte)0);
    }
    processLength(l << 3);
    processBlock();
  }
  
  public int getByteLength()
  {
    return 64;
  }
  
  protected abstract void processBlock();
  
  protected abstract void processLength(long paramLong);
  
  protected abstract void processWord(byte[] paramArrayOfByte, int paramInt);
  
  public void reset()
  {
    this.byteCount = 0L;
    this.xBufOff = 0;
    int i = 0;
    while (i < this.xBuf.length)
    {
      this.xBuf[i] = 0;
      i += 1;
    }
  }
  
  public void update(byte paramByte)
  {
    byte[] arrayOfByte = this.xBuf;
    int i = this.xBufOff;
    this.xBufOff = (i + 1);
    arrayOfByte[i] = paramByte;
    if (this.xBufOff == this.xBuf.length)
    {
      processWord(this.xBuf, 0);
      this.xBufOff = 0;
    }
    this.byteCount += 1L;
  }
  
  public void update(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
  {
    int i = paramInt2;
    int j = paramInt1;
    for (;;)
    {
      paramInt1 = j;
      paramInt2 = i;
      if (this.xBufOff == 0) {
        break;
      }
      paramInt1 = j;
      paramInt2 = i;
      if (i <= 0) {
        break;
      }
      update(paramArrayOfByte[j]);
      j += 1;
      i -= 1;
    }
    for (;;)
    {
      i = paramInt1;
      j = paramInt2;
      if (paramInt2 <= this.xBuf.length) {
        break;
      }
      processWord(paramArrayOfByte, paramInt1);
      paramInt1 += this.xBuf.length;
      paramInt2 -= this.xBuf.length;
      this.byteCount += this.xBuf.length;
    }
    while (j > 0)
    {
      update(paramArrayOfByte[i]);
      i += 1;
      j -= 1;
    }
  }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/org/bouncycastle/crypto/digests/GeneralDigest.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */