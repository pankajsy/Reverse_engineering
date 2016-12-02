package org.bouncycastle.crypto.util;

public abstract class Pack {
    public static int bigEndianToInt(byte[] paramArrayOfByte, int paramInt) {
        int i = paramArrayOfByte[paramInt];
        int j = paramInt + 1;
        paramInt = paramArrayOfByte[j];
        j += 1;
        return i << 24 | (paramInt & 0xFF) << 16 | (paramArrayOfByte[j] & 0xFF) << 8 | paramArrayOfByte[(j + 1)] & 0xFF;
    }

    public static long bigEndianToLong(byte[] paramArrayOfByte, int paramInt) {
        int i = bigEndianToInt(paramArrayOfByte, paramInt);
        paramInt = bigEndianToInt(paramArrayOfByte, paramInt + 4);
        return (i & 0xFFFFFFFF) << 32 | paramInt & 0xFFFFFFFF;
    }

    public static void intToBigEndian(int paramInt1, byte[] paramArrayOfByte, int paramInt2) {
        paramArrayOfByte[paramInt2] = ((byte) (paramInt1 >>> 24));
        paramInt2 += 1;
        paramArrayOfByte[paramInt2] = ((byte) (paramInt1 >>> 16));
        paramInt2 += 1;
        paramArrayOfByte[paramInt2] = ((byte) (paramInt1 >>> 8));
        paramArrayOfByte[(paramInt2 + 1)] = ((byte) paramInt1);
    }

    public static void longToBigEndian(long paramLong, byte[] paramArrayOfByte, int paramInt) {
        intToBigEndian((int) (paramLong >>> 32), paramArrayOfByte, paramInt);
        intToBigEndian((int) (0xFFFFFFFF & paramLong), paramArrayOfByte, paramInt + 4);
    }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/org/bouncycastle/crypto/util/Pack.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */