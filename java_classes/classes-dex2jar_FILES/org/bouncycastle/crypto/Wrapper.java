package org.bouncycastle.crypto;

public abstract interface Wrapper
{
  public abstract String getAlgorithmName();
  
  public abstract void init(boolean paramBoolean, CipherParameters paramCipherParameters);
  
  public abstract byte[] unwrap(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
    throws InvalidCipherTextException;
  
  public abstract byte[] wrap(byte[] paramArrayOfByte, int paramInt1, int paramInt2);
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/org/bouncycastle/crypto/Wrapper.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */