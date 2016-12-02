package org.bouncycastle.crypto.engines;

import org.bouncycastle.crypto.BlockCipher;
import org.bouncycastle.crypto.CipherParameters;
import org.bouncycastle.crypto.DataLengthException;
import org.bouncycastle.crypto.params.KeyParameter;

public final class TwofishEngine
        implements BlockCipher {
    private static final int BLOCK_SIZE = 16;
    private static final int GF256_FDBK = 361;
    private static final int GF256_FDBK_2 = 180;
    private static final int GF256_FDBK_4 = 90;
    private static final int INPUT_WHITEN = 0;
    private static final int MAX_KEY_BITS = 256;
    private static final int MAX_ROUNDS = 16;
    private static final int OUTPUT_WHITEN = 4;
    private static final byte[][] P;
    private static final int P_00 = 1;
    private static final int P_01 = 0;
    private static final int P_02 = 0;
    private static final int P_03 = 1;
    private static final int P_04 = 1;
    private static final int P_10 = 0;
    private static final int P_11 = 0;
    private static final int P_12 = 1;
    private static final int P_13 = 1;
    private static final int P_14 = 0;
    private static final int P_20 = 1;
    private static final int P_21 = 1;
    private static final int P_22 = 0;
    private static final int P_23 = 0;
    private static final int P_24 = 0;
    private static final int P_30 = 0;
    private static final int P_31 = 1;
    private static final int P_32 = 1;
    private static final int P_33 = 0;
    private static final int P_34 = 1;
    private static final int ROUNDS = 16;
    private static final int ROUND_SUBKEYS = 8;
    private static final int RS_GF_FDBK = 333;
    private static final int SK_BUMP = 16843009;
    private static final int SK_ROTL = 9;
    private static final int SK_STEP = 33686018;
    private static final int TOTAL_SUBKEYS = 40;

    static {
        byte[] arrayOfByte = {117, -13, -58, -12, -37, 123, -5, -56, 74, -45, -26, 107, 69, 125, -24, 75, -42, 50, -40, -3, 55, 113, -15, -31, 48, 15, -8, 27, -121, -6, 6, 63, 94, -70, -82, 91, -118, 0, -68, -99, 109, -63, -79, 14, -128, 93, -46, -43, -96, -124, 7, 20, -75, -112, 44, -93, -78, 115, 76, 84, -110, 116, 54, 81, 56, -80, -67, 90, -4, 96, 98, -106, 108, 66, -9, 16, 124, 40, 39, -116, 19, -107, -100, -57, 36, 70, 59, 112, -54, -29, -123, -53, 17, -48, -109, -72, -90, -125, 32, -1, -97, 119, -61, -52, 3, 111, 8, -65, 64, -25, 43, -30, 121, 12, -86, -126, 65, 58, -22, -71, -28, -102, -92, -105, 126, -38, 122, 23, 102, -108, -95, 29, 61, -16, -34, -77, 11, 114, -89, 28, -17, -47, 83, 62, -113, 51, 38, 95, -20, 118, 42, 73, -127, -120, -18, 33, -60, 26, -21, -39, -59, 57, -103, -51, -83, 49, -117, 1, 24, 35, -35, 31, 78, 45, -7, 72, 79, -14, 101, -114, 120, 92, 88, 25, -115, -27, -104, 87, 103, 127, 5, 100, -81, 99, -74, -2, -11, -73, 60, -91, -50, -23, 104, 68, -32, 77, 67, 105, 41, 46, -84, 21, 89, -88, 10, -98, 110, 71, -33, 52, 53, 106, -49, -36, 34, -55, -64, -101, -119, -44, -19, -85, 18, -94, 13, 82, -69, 2, 47, -87, -41, 97, 30, -76, 80, 4, -10, -62, 22, 37, -122, 86, 85, 9, -66, -111};
        P = new byte[][]{{-87, 103, -77, -24, 4, -3, -93, 118, -102, -110, -128, 120, -28, -35, -47, 56, 13, -58, 53, -104, 24, -9, -20, 108, 67, 117, 55, 38, -6, 19, -108, 72, -14, -48, -117, 48, -124, 84, -33, 35, 25, 91, 61, 89, -13, -82, -94, -126, 99, 1, -125, 46, -39, 81, -101, 124, -90, -21, -91, -66, 22, 12, -29, 97, -64, -116, 58, -11, 115, 44, 37, 11, -69, 78, -119, 107, 83, 106, -76, -15, -31, -26, -67, 69, -30, -12, -74, 102, -52, -107, 3, 86, -44, 28, 30, -41, -5, -61, -114, -75, -23, -49, -65, -70, -22, 119, 57, -81, 51, -55, 98, 113, -127, 121, 9, -83, 36, -51, -7, -40, -27, -59, -71, 77, 68, 8, -122, -25, -95, 29, -86, -19, 6, 112, -78, -46, 65, 123, -96, 17, 49, -62, 39, -112, 32, -10, 96, -1, -106, 92, -79, -85, -98, -100, 82, 27, 95, -109, 10, -17, -111, -123, 73, -18, 45, 79, -113, 59, 71, -121, 109, 70, -42, 62, 105, 100, 42, -50, -53, 47, -4, -105, 5, 122, -84, 127, -43, 26, 75, 14, -89, 90, 40, 20, 63, 41, -120, 60, 76, 2, -72, -38, -80, 23, 85, 31, -118, 125, 87, -57, -115, 116, -73, -60, -97, 114, 126, 21, 34, 18, 88, 7, -103, 52, 110, 80, -34, 104, 101, -68, -37, -8, -56, -88, 43, 64, -36, -2, 50, -92, -54, 16, 33, -16, -45, 93, 15, 0, 111, -99, 54, 66, 74, 94, -63, -32}, arrayOfByte};
    }

    private boolean encrypting = false;
    private int[] gMDS0 = new int['Ā'];
    private int[] gMDS1 = new int['Ā'];
    private int[] gMDS2 = new int['Ā'];
    private int[] gMDS3 = new int['Ā'];
    private int[] gSBox;
    private int[] gSubKeys;
    private int k64Cnt = 0;
    private byte[] workingKey = null;

    public TwofishEngine() {
        int[] arrayOfInt1 = new int[2];
        int[] arrayOfInt2 = new int[2];
        int[] arrayOfInt3 = new int[2];
        int i = 0;
        while (i < 256) {
            int j = P[0][i] & 0xFF;
            arrayOfInt1[0] = j;
            arrayOfInt2[0] = (Mx_X(j) & 0xFF);
            arrayOfInt3[0] = (Mx_Y(j) & 0xFF);
            j = P[1][i] & 0xFF;
            arrayOfInt1[1] = j;
            arrayOfInt2[1] = (Mx_X(j) & 0xFF);
            arrayOfInt3[1] = (Mx_Y(j) & 0xFF);
            this.gMDS0[i] = (arrayOfInt1[1] | arrayOfInt2[1] << 8 | arrayOfInt3[1] << 16 | arrayOfInt3[1] << 24);
            this.gMDS1[i] = (arrayOfInt3[0] | arrayOfInt3[0] << 8 | arrayOfInt2[0] << 16 | arrayOfInt1[0] << 24);
            this.gMDS2[i] = (arrayOfInt2[1] | arrayOfInt3[1] << 8 | arrayOfInt1[1] << 16 | arrayOfInt3[1] << 24);
            this.gMDS3[i] = (arrayOfInt2[0] | arrayOfInt1[0] << 8 | arrayOfInt3[0] << 16 | arrayOfInt2[0] << 24);
            i += 1;
        }
    }

    private void Bits32ToBytes(int paramInt1, byte[] paramArrayOfByte, int paramInt2) {
        paramArrayOfByte[paramInt2] = ((byte) paramInt1);
        paramArrayOfByte[(paramInt2 + 1)] = ((byte) (paramInt1 >> 8));
        paramArrayOfByte[(paramInt2 + 2)] = ((byte) (paramInt1 >> 16));
        paramArrayOfByte[(paramInt2 + 3)] = ((byte) (paramInt1 >> 24));
    }

    private int BytesTo32Bits(byte[] paramArrayOfByte, int paramInt) {
        return paramArrayOfByte[paramInt] & 0xFF | (paramArrayOfByte[(paramInt + 1)] & 0xFF) << 8 | (paramArrayOfByte[(paramInt + 2)] & 0xFF) << 16 | (paramArrayOfByte[(paramInt + 3)] & 0xFF) << 24;
    }

    private int F32(int paramInt, int[] paramArrayOfInt) {
        int i3 = b0(paramInt);
        int n = b1(paramInt);
        int j = b2(paramInt);
        int k = b3(paramInt);
        int i7 = paramArrayOfInt[0];
        int i8 = paramArrayOfInt[1];
        int i9 = paramArrayOfInt[2];
        int i10 = paramArrayOfInt[3];
        int i5 = i3;
        int i1 = n;
        int i = j;
        paramInt = k;
        int i6 = i3;
        int i4 = n;
        int i2 = j;
        int m = k;
        switch (this.k64Cnt & 0x3) {
            default:
                return 0;
            case 1:
                return this.gMDS0[(P[0][i3] & 0xFF ^ b0(i7))] ^ this.gMDS1[(P[0][n] & 0xFF ^ b1(i7))] ^ this.gMDS2[(P[1][j] & 0xFF ^ b2(i7))] ^ this.gMDS3[(P[1][k] & 0xFF ^ b3(i7))];
            case 0:
                i5 = P[1][i3] & 0xFF ^ b0(i10);
                i1 = P[0][n] & 0xFF ^ b1(i10);
                i = P[0][j] & 0xFF ^ b2(i10);
                paramInt = P[1][k] & 0xFF ^ b3(i10);
            case 3:
                i6 = P[1][i5] & 0xFF ^ b0(i9);
                i4 = P[1][i1] & 0xFF ^ b1(i9);
                i2 = P[0][i] & 0xFF ^ b2(i9);
                m = P[0][paramInt] & 0xFF ^ b3(i9);
        }
        return this.gMDS0[(P[0][(P[0][i6] & 0xFF ^ b0(i8))] & 0xFF ^ b0(i7))] ^ this.gMDS1[(P[0][(P[1][i4] & 0xFF ^ b1(i8))] & 0xFF ^ b1(i7))] ^ this.gMDS2[(P[1][(P[0][i2] & 0xFF ^ b2(i8))] & 0xFF ^ b2(i7))] ^ this.gMDS3[(P[1][(P[1][m] & 0xFF ^ b3(i8))] & 0xFF ^ b3(i7))];
    }

    private int Fe32_0(int paramInt) {
        return this.gSBox[((paramInt & 0xFF) * 2 + 0)] ^ this.gSBox[((paramInt >>> 8 & 0xFF) * 2 + 1)] ^ this.gSBox[((paramInt >>> 16 & 0xFF) * 2 + 512)] ^ this.gSBox[((paramInt >>> 24 & 0xFF) * 2 + 513)];
    }

    private int Fe32_3(int paramInt) {
        return this.gSBox[((paramInt >>> 24 & 0xFF) * 2 + 0)] ^ this.gSBox[((paramInt & 0xFF) * 2 + 1)] ^ this.gSBox[((paramInt >>> 8 & 0xFF) * 2 + 512)] ^ this.gSBox[((paramInt >>> 16 & 0xFF) * 2 + 513)];
    }

    private int LFSR1(int paramInt) {
        if ((paramInt & 0x1) != 0) {
        }
        for (int i = 180; ; i = 0) {
            return i ^ paramInt >> 1;
        }
    }

    private int LFSR2(int paramInt) {
        int j = 0;
        if ((paramInt & 0x2) != 0) {
        }
        for (int i = 180; ; i = 0) {
            if ((paramInt & 0x1) != 0) {
                j = 90;
            }
            return j ^ i ^ paramInt >> 2;
        }
    }

    private int Mx_X(int paramInt) {
        return LFSR2(paramInt) ^ paramInt;
    }

    private int Mx_Y(int paramInt) {
        return LFSR1(paramInt) ^ paramInt ^ LFSR2(paramInt);
    }

    private int RS_MDS_Encode(int paramInt1, int paramInt2) {
        int j = 0;
        int i = paramInt2;
        paramInt2 = j;
        while (paramInt2 < 4) {
            i = RS_rem(i);
            paramInt2 += 1;
        }
        paramInt2 = i ^ paramInt1;
        paramInt1 = 0;
        while (paramInt1 < 4) {
            paramInt2 = RS_rem(paramInt2);
            paramInt1 += 1;
        }
        return paramInt2;
    }

    private int RS_rem(int paramInt) {
        int j = 0;
        int k = paramInt >>> 24 & 0xFF;
        if ((k & 0x80) != 0) {
        }
        for (int i = 333; ; i = 0) {
            int m = (i ^ k << 1) & 0xFF;
            i = j;
            if ((k & 0x1) != 0) {
                i = 166;
            }
            i = i ^ k >>> 1 ^ m;
            return paramInt << 8 ^ i << 24 ^ m << 16 ^ i << 8 ^ k;
        }
    }

    private int b0(int paramInt) {
        return paramInt & 0xFF;
    }

    private int b1(int paramInt) {
        return paramInt >>> 8 & 0xFF;
    }

    private int b2(int paramInt) {
        return paramInt >>> 16 & 0xFF;
    }

    private int b3(int paramInt) {
        return paramInt >>> 24 & 0xFF;
    }

    private void decryptBlock(byte[] paramArrayOfByte1, int paramInt1, byte[] paramArrayOfByte2, int paramInt2) {
        int n = BytesTo32Bits(paramArrayOfByte1, paramInt1) ^ this.gSubKeys[4];
        int j = BytesTo32Bits(paramArrayOfByte1, paramInt1 + 4) ^ this.gSubKeys[5];
        int k = BytesTo32Bits(paramArrayOfByte1, paramInt1 + 8) ^ this.gSubKeys[6];
        int i1 = BytesTo32Bits(paramArrayOfByte1, paramInt1 + 12) ^ this.gSubKeys[7];
        int i = 0;
        int m = 39;
        paramInt1 = n;
        n = i1;
        while (i < 16) {
            i1 = Fe32_0(paramInt1);
            int i2 = Fe32_3(j);
            paramArrayOfByte1 = this.gSubKeys;
            int i3 = m - 1;
            n ^= i2 * 2 + i1 + paramArrayOfByte1[m];
            paramArrayOfByte1 = this.gSubKeys;
            m = i3 - 1;
            k = (k << 1 | k >>> 31) ^ i1 + i2 + paramArrayOfByte1[i3];
            n = n >>> 1 | n << 31;
            i1 = Fe32_0(k);
            i2 = Fe32_3(n);
            paramArrayOfByte1 = this.gSubKeys;
            i3 = m - 1;
            j ^= i2 * 2 + i1 + paramArrayOfByte1[m];
            paramArrayOfByte1 = this.gSubKeys;
            m = i3 - 1;
            paramInt1 = (paramInt1 << 1 | paramInt1 >>> 31) ^ i1 + i2 + paramArrayOfByte1[i3];
            j = j >>> 1 | j << 31;
            i += 2;
        }
        Bits32ToBytes(this.gSubKeys[0] ^ k, paramArrayOfByte2, paramInt2);
        Bits32ToBytes(this.gSubKeys[1] ^ n, paramArrayOfByte2, paramInt2 + 4);
        Bits32ToBytes(this.gSubKeys[2] ^ paramInt1, paramArrayOfByte2, paramInt2 + 8);
        Bits32ToBytes(this.gSubKeys[3] ^ j, paramArrayOfByte2, paramInt2 + 12);
    }

    private void encryptBlock(byte[] paramArrayOfByte1, int paramInt1, byte[] paramArrayOfByte2, int paramInt2) {
        int j = BytesTo32Bits(paramArrayOfByte1, paramInt1) ^ this.gSubKeys[0];
        int i1 = BytesTo32Bits(paramArrayOfByte1, paramInt1 + 4) ^ this.gSubKeys[1];
        int n = BytesTo32Bits(paramArrayOfByte1, paramInt1 + 8) ^ this.gSubKeys[2];
        int k = BytesTo32Bits(paramArrayOfByte1, paramInt1 + 12) ^ this.gSubKeys[3];
        int i = 0;
        int m = 8;
        paramInt1 = i1;
        while (i < 16) {
            i1 = Fe32_0(j);
            int i2 = Fe32_3(paramInt1);
            paramArrayOfByte1 = this.gSubKeys;
            int i3 = m + 1;
            m = n ^ i1 + i2 + paramArrayOfByte1[m];
            n = m >>> 1 | m << 31;
            paramArrayOfByte1 = this.gSubKeys;
            m = i3 + 1;
            k = (k << 1 | k >>> 31) ^ i2 * 2 + i1 + paramArrayOfByte1[i3];
            i1 = Fe32_0(n);
            i2 = Fe32_3(k);
            paramArrayOfByte1 = this.gSubKeys;
            i3 = m + 1;
            j ^= i1 + i2 + paramArrayOfByte1[m];
            j = j >>> 1 | j << 31;
            paramArrayOfByte1 = this.gSubKeys;
            m = i3 + 1;
            paramInt1 = (paramInt1 << 1 | paramInt1 >>> 31) ^ i2 * 2 + i1 + paramArrayOfByte1[i3];
            i += 2;
        }
        Bits32ToBytes(this.gSubKeys[4] ^ n, paramArrayOfByte2, paramInt2);
        Bits32ToBytes(this.gSubKeys[5] ^ k, paramArrayOfByte2, paramInt2 + 4);
        Bits32ToBytes(this.gSubKeys[6] ^ j, paramArrayOfByte2, paramInt2 + 8);
        Bits32ToBytes(this.gSubKeys[7] ^ paramInt1, paramArrayOfByte2, paramInt2 + 12);
    }

    private void setKey(byte[] paramArrayOfByte) {
        int[] arrayOfInt1 = new int[4];
        int[] arrayOfInt2 = new int[4];
        int[] arrayOfInt3 = new int[4];
        this.gSubKeys = new int[40];
        if (this.k64Cnt < 1) {
            throw new IllegalArgumentException("Key size less than 64 bits");
        }
        if (this.k64Cnt > 4) {
            throw new IllegalArgumentException("Key size larger than 256 bits");
        }
        int i = 0;
        int j;
        while (i < this.k64Cnt) {
            j = i * 8;
            arrayOfInt1[i] = BytesTo32Bits(paramArrayOfByte, j);
            arrayOfInt2[i] = BytesTo32Bits(paramArrayOfByte, j + 4);
            arrayOfInt3[(this.k64Cnt - 1 - i)] = RS_MDS_Encode(arrayOfInt1[i], arrayOfInt2[i]);
            i += 1;
        }
        i = 0;
        int k;
        while (i < 20) {
            k = i * 33686018;
            j = F32(k, arrayOfInt1);
            k = F32(16843009 + k, arrayOfInt2);
            k = k << 8 | k >>> 24;
            j += k;
            this.gSubKeys[(i * 2)] = j;
            j += k;
            this.gSubKeys[(i * 2 + 1)] = (j << 9 | j >>> 23);
            i += 1;
        }
        int i9 = arrayOfInt3[0];
        int i10 = arrayOfInt3[1];
        int i11 = arrayOfInt3[2];
        int i12 = arrayOfInt3[3];
        this.gSBox = new int['Ѐ'];
        i = 0;
        if (i < 256) {
            j = i;
            k = i;
            int m = i;
            int n = i;
            int i7 = n;
            int i4 = m;
            int i2 = k;
            int i1 = j;
            int i8 = n;
            int i6 = m;
            int i5 = k;
            int i3 = j;
            switch (this.k64Cnt & 0x3) {
            }
            for (; ; ) {
                i += 1;
                break;
                this.gSBox[(i * 2)] = this.gMDS0[(P[0][n] & 0xFF ^ b0(i9))];
                this.gSBox[(i * 2 + 1)] = this.gMDS1[(P[0][m] & 0xFF ^ b1(i9))];
                this.gSBox[(i * 2 + 512)] = this.gMDS2[(P[1][k] & 0xFF ^ b2(i9))];
                this.gSBox[(i * 2 + 513)] = this.gMDS3[(P[1][j] & 0xFF ^ b3(i9))];
                continue;
                i7 = P[1][n] & 0xFF ^ b0(i12);
                i4 = P[0][m] & 0xFF ^ b1(i12);
                i2 = P[0][k] & 0xFF ^ b2(i12);
                i1 = P[1][j] & 0xFF ^ b3(i12);
                i8 = P[1][i7] & 0xFF ^ b0(i11);
                i6 = P[1][i4] & 0xFF ^ b1(i11);
                i5 = P[0][i2] & 0xFF ^ b2(i11);
                i3 = P[0][i1] & 0xFF ^ b3(i11);
                this.gSBox[(i * 2)] = this.gMDS0[(P[0][(P[0][i8] & 0xFF ^ b0(i10))] & 0xFF ^ b0(i9))];
                this.gSBox[(i * 2 + 1)] = this.gMDS1[(P[0][(P[1][i6] & 0xFF ^ b1(i10))] & 0xFF ^ b1(i9))];
                this.gSBox[(i * 2 + 512)] = this.gMDS2[(P[1][(P[0][i5] & 0xFF ^ b2(i10))] & 0xFF ^ b2(i9))];
                this.gSBox[(i * 2 + 513)] = this.gMDS3[(P[1][(P[1][i3] & 0xFF ^ b3(i10))] & 0xFF ^ b3(i9))];
            }
        }
    }

    public String getAlgorithmName() {
        return "Twofish";
    }

    public int getBlockSize() {
        return 16;
    }

    public void init(boolean paramBoolean, CipherParameters paramCipherParameters) {
        if ((paramCipherParameters instanceof KeyParameter)) {
            this.encrypting = paramBoolean;
            this.workingKey = ((KeyParameter) paramCipherParameters).getKey();
            this.k64Cnt = (this.workingKey.length / 8);
            setKey(this.workingKey);
            return;
        }
        throw new IllegalArgumentException("invalid parameter passed to Twofish init - " + paramCipherParameters.getClass().getName());
    }

    public int processBlock(byte[] paramArrayOfByte1, int paramInt1, byte[] paramArrayOfByte2, int paramInt2) {
        if (this.workingKey == null) {
            throw new IllegalStateException("Twofish not initialised");
        }
        if (paramInt1 + 16 > paramArrayOfByte1.length) {
            throw new DataLengthException("input buffer too short");
        }
        if (paramInt2 + 16 > paramArrayOfByte2.length) {
            throw new DataLengthException("output buffer too short");
        }
        if (this.encrypting) {
            encryptBlock(paramArrayOfByte1, paramInt1, paramArrayOfByte2, paramInt2);
        }
        for (; ; ) {
            return 16;
            decryptBlock(paramArrayOfByte1, paramInt1, paramArrayOfByte2, paramInt2);
        }
    }

    public void reset() {
        if (this.workingKey != null) {
            setKey(this.workingKey);
        }
    }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/org/bouncycastle/crypto/engines/TwofishEngine.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */