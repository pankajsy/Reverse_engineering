package org.bouncycastle.crypto;

public abstract interface Mac {
    public abstract int doFinal(byte[] paramArrayOfByte, int paramInt)
            throws DataLengthException, IllegalStateException;

    public abstract String getAlgorithmName();

    public abstract int getMacSize();

    public abstract void init(CipherParameters paramCipherParameters)
            throws IllegalArgumentException;

    public abstract void reset();

    public abstract void update(byte paramByte)
            throws IllegalStateException;

    public abstract void update(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
            throws DataLengthException, IllegalStateException;
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/org/bouncycastle/crypto/Mac.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */