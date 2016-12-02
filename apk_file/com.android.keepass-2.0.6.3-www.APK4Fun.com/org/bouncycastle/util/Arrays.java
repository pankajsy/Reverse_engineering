package org.bouncycastle.util;

public final class Arrays {
    public static boolean areEqual(byte[] paramArrayOfByte1, byte[] paramArrayOfByte2) {
        if (paramArrayOfByte1 == paramArrayOfByte2) {
        }
        for (; ; ) {
            return true;
            if ((paramArrayOfByte1 == null) || (paramArrayOfByte2 == null)) {
                return false;
            }
            if (paramArrayOfByte1.length != paramArrayOfByte2.length) {
                return false;
            }
            int i = 0;
            while (i != paramArrayOfByte1.length) {
                if (paramArrayOfByte1[i] != paramArrayOfByte2[i]) {
                    return false;
                }
                i += 1;
            }
        }
    }

    public static boolean areEqual(int[] paramArrayOfInt1, int[] paramArrayOfInt2) {
        if (paramArrayOfInt1 == paramArrayOfInt2) {
        }
        for (; ; ) {
            return true;
            if ((paramArrayOfInt1 == null) || (paramArrayOfInt2 == null)) {
                return false;
            }
            if (paramArrayOfInt1.length != paramArrayOfInt2.length) {
                return false;
            }
            int i = 0;
            while (i != paramArrayOfInt1.length) {
                if (paramArrayOfInt1[i] != paramArrayOfInt2[i]) {
                    return false;
                }
                i += 1;
            }
        }
    }

    public static boolean areEqual(boolean[] paramArrayOfBoolean1, boolean[] paramArrayOfBoolean2) {
        if (paramArrayOfBoolean1 == paramArrayOfBoolean2) {
        }
        for (; ; ) {
            return true;
            if ((paramArrayOfBoolean1 == null) || (paramArrayOfBoolean2 == null)) {
                return false;
            }
            if (paramArrayOfBoolean1.length != paramArrayOfBoolean2.length) {
                return false;
            }
            int i = 0;
            while (i != paramArrayOfBoolean1.length) {
                if (paramArrayOfBoolean1[i] != paramArrayOfBoolean2[i]) {
                    return false;
                }
                i += 1;
            }
        }
    }

    public static byte[] clone(byte[] paramArrayOfByte) {
        if (paramArrayOfByte == null) {
            return null;
        }
        byte[] arrayOfByte = new byte[paramArrayOfByte.length];
        System.arraycopy(paramArrayOfByte, 0, arrayOfByte, 0, paramArrayOfByte.length);
        return arrayOfByte;
    }

    public static int[] clone(int[] paramArrayOfInt) {
        if (paramArrayOfInt == null) {
            return null;
        }
        int[] arrayOfInt = new int[paramArrayOfInt.length];
        System.arraycopy(paramArrayOfInt, 0, arrayOfInt, 0, paramArrayOfInt.length);
        return arrayOfInt;
    }

    public static boolean constantTimeAreEqual(byte[] paramArrayOfByte1, byte[] paramArrayOfByte2) {
        if (paramArrayOfByte1 == paramArrayOfByte2) {
        }
        int j;
        do {
            return true;
            if ((paramArrayOfByte1 == null) || (paramArrayOfByte2 == null)) {
                return false;
            }
            if (paramArrayOfByte1.length != paramArrayOfByte2.length) {
                return false;
            }
            j = 0;
            int i = 0;
            while (i != paramArrayOfByte1.length) {
                j |= paramArrayOfByte1[i] ^ paramArrayOfByte2[i];
                i += 1;
            }
        } while (j == 0);
        return false;
    }

    public static void fill(byte[] paramArrayOfByte, byte paramByte) {
        int i = 0;
        while (i < paramArrayOfByte.length) {
            paramArrayOfByte[i] = paramByte;
            i += 1;
        }
    }

    public static void fill(long[] paramArrayOfLong, long paramLong) {
        int i = 0;
        while (i < paramArrayOfLong.length) {
            paramArrayOfLong[i] = paramLong;
            i += 1;
        }
    }

    public static void fill(short[] paramArrayOfShort, short paramShort) {
        int i = 0;
        while (i < paramArrayOfShort.length) {
            paramArrayOfShort[i] = paramShort;
            i += 1;
        }
    }

    public static int hashCode(byte[] paramArrayOfByte) {
        if (paramArrayOfByte == null) {
            j = 0;
            return j;
        }
        int j = paramArrayOfByte.length;
        int i = j + 1;
        for (; ; ) {
            int k = j - 1;
            j = i;
            if (k < 0) {
                break;
            }
            i = i * 257 ^ paramArrayOfByte[k];
            j = k;
        }
    }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/org/bouncycastle/util/Arrays.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */