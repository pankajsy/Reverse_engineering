package org.bouncycastle.crypto;

public abstract interface Digest {
    public abstract int doFinal(byte[] paramArrayOfByte, int paramInt);

    public abstract String getAlgorithmName();

    public abstract int getDigestSize();

    public abstract void reset();

    public abstract void update(byte paramByte);

    public abstract void update(byte[] paramArrayOfByte, int paramInt1, int paramInt2);
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/org/bouncycastle/crypto/Digest.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */