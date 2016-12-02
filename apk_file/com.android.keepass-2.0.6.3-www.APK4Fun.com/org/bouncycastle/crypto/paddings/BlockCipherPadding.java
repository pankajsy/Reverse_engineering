package org.bouncycastle.crypto.paddings;

import org.bouncycastle.crypto.InvalidCipherTextException;

import java.security.SecureRandom;

public abstract interface BlockCipherPadding {
    public abstract int addPadding(byte[] paramArrayOfByte, int paramInt);

    public abstract String getPaddingName();

    public abstract void init(SecureRandom paramSecureRandom)
            throws IllegalArgumentException;

    public abstract int padCount(byte[] paramArrayOfByte)
            throws InvalidCipherTextException;
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/org/bouncycastle/crypto/paddings/BlockCipherPadding.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */