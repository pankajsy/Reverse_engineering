package org.bouncycastle.crypto;

public abstract interface StreamCipher
{
  public abstract String getAlgorithmName();
  
  public abstract void init(boolean paramBoolean, CipherParameters paramCipherParameters)
    throws IllegalArgumentException;
  
  public abstract void processBytes(byte[] paramArrayOfByte1, int paramInt1, int paramInt2, byte[] paramArrayOfByte2, int paramInt3)
    throws DataLengthException;
  
  public abstract void reset();
  
  public abstract byte returnByte(byte paramByte);
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/org/bouncycastle/crypto/StreamCipher.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */