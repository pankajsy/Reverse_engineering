package org.bouncycastle.crypto.modes;

import org.bouncycastle.crypto.BlockCipher;
import org.bouncycastle.crypto.CipherParameters;
import org.bouncycastle.crypto.DataLengthException;
import org.bouncycastle.crypto.params.ParametersWithIV;
import org.bouncycastle.util.Arrays;

public class CBCBlockCipher
  implements BlockCipher
{
  private byte[] IV;
  private int blockSize;
  private byte[] cbcNextV;
  private byte[] cbcV;
  private BlockCipher cipher = null;
  private boolean encrypting;
  
  public CBCBlockCipher(BlockCipher paramBlockCipher)
  {
    this.cipher = paramBlockCipher;
    this.blockSize = paramBlockCipher.getBlockSize();
    this.IV = new byte[this.blockSize];
    this.cbcV = new byte[this.blockSize];
    this.cbcNextV = new byte[this.blockSize];
  }
  
  private int decryptBlock(byte[] paramArrayOfByte1, int paramInt1, byte[] paramArrayOfByte2, int paramInt2)
    throws DataLengthException, IllegalStateException
  {
    if (this.blockSize + paramInt1 > paramArrayOfByte1.length) {
      throw new DataLengthException("input buffer too short");
    }
    System.arraycopy(paramArrayOfByte1, paramInt1, this.cbcNextV, 0, this.blockSize);
    int i = this.cipher.processBlock(paramArrayOfByte1, paramInt1, paramArrayOfByte2, paramInt2);
    paramInt1 = 0;
    while (paramInt1 < this.blockSize)
    {
      int j = paramInt2 + paramInt1;
      paramArrayOfByte2[j] = ((byte)(paramArrayOfByte2[j] ^ this.cbcV[paramInt1]));
      paramInt1 += 1;
    }
    paramArrayOfByte1 = this.cbcV;
    this.cbcV = this.cbcNextV;
    this.cbcNextV = paramArrayOfByte1;
    return i;
  }
  
  private int encryptBlock(byte[] paramArrayOfByte1, int paramInt1, byte[] paramArrayOfByte2, int paramInt2)
    throws DataLengthException, IllegalStateException
  {
    if (this.blockSize + paramInt1 > paramArrayOfByte1.length) {
      throw new DataLengthException("input buffer too short");
    }
    int i = 0;
    while (i < this.blockSize)
    {
      byte[] arrayOfByte = this.cbcV;
      arrayOfByte[i] = ((byte)(arrayOfByte[i] ^ paramArrayOfByte1[(paramInt1 + i)]));
      i += 1;
    }
    paramInt1 = this.cipher.processBlock(this.cbcV, 0, paramArrayOfByte2, paramInt2);
    System.arraycopy(paramArrayOfByte2, paramInt2, this.cbcV, 0, this.cbcV.length);
    return paramInt1;
  }
  
  public String getAlgorithmName()
  {
    return this.cipher.getAlgorithmName() + "/CBC";
  }
  
  public int getBlockSize()
  {
    return this.cipher.getBlockSize();
  }
  
  public BlockCipher getUnderlyingCipher()
  {
    return this.cipher;
  }
  
  public void init(boolean paramBoolean, CipherParameters paramCipherParameters)
    throws IllegalArgumentException
  {
    this.encrypting = paramBoolean;
    if ((paramCipherParameters instanceof ParametersWithIV))
    {
      paramCipherParameters = (ParametersWithIV)paramCipherParameters;
      byte[] arrayOfByte = paramCipherParameters.getIV();
      if (arrayOfByte.length != this.blockSize) {
        throw new IllegalArgumentException("initialisation vector must be the same length as block size");
      }
      System.arraycopy(arrayOfByte, 0, this.IV, 0, arrayOfByte.length);
      reset();
      this.cipher.init(paramBoolean, paramCipherParameters.getParameters());
      return;
    }
    reset();
    this.cipher.init(paramBoolean, paramCipherParameters);
  }
  
  public int processBlock(byte[] paramArrayOfByte1, int paramInt1, byte[] paramArrayOfByte2, int paramInt2)
    throws DataLengthException, IllegalStateException
  {
    if (this.encrypting) {
      return encryptBlock(paramArrayOfByte1, paramInt1, paramArrayOfByte2, paramInt2);
    }
    return decryptBlock(paramArrayOfByte1, paramInt1, paramArrayOfByte2, paramInt2);
  }
  
  public void reset()
  {
    System.arraycopy(this.IV, 0, this.cbcV, 0, this.IV.length);
    Arrays.fill(this.cbcNextV, (byte)0);
    this.cipher.reset();
  }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/org/bouncycastle/crypto/modes/CBCBlockCipher.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */