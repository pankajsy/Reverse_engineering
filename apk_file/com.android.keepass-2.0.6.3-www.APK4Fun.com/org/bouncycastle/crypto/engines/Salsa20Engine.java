package org.bouncycastle.crypto.engines;

import org.bouncycastle.crypto.CipherParameters;
import org.bouncycastle.crypto.DataLengthException;
import org.bouncycastle.crypto.MaxBytesExceededException;
import org.bouncycastle.crypto.StreamCipher;
import org.bouncycastle.crypto.params.KeyParameter;
import org.bouncycastle.crypto.params.ParametersWithIV;

public class Salsa20Engine
        implements StreamCipher {
    private static final byte[] sigma = toByteArray("expand 32-byte k");
    private static final int stateSize = 16;
    private static final byte[] tau = toByteArray("expand 16-byte k");
    private int cW0;
    private int cW1;
    private int cW2;
    private int[] engineState = new int[16];
    private int index = 0;
    private boolean initialised = false;
    private byte[] keyStream = new byte[64];
    private byte[] workingIV = null;
    private byte[] workingKey = null;
    private int[] x = new int[16];

    private static byte[] toByteArray(String paramString) {
        byte[] arrayOfByte = new byte[paramString.length()];
        int i = 0;
        while (i != arrayOfByte.length) {
            arrayOfByte[i] = ((byte) paramString.charAt(i));
            i += 1;
        }
        return arrayOfByte;
    }

    private int byteToIntLittle(byte[] paramArrayOfByte, int paramInt) {
        return paramArrayOfByte[paramInt] & 0xFF | (paramArrayOfByte[(paramInt + 1)] & 0xFF) << 8 | (paramArrayOfByte[(paramInt + 2)] & 0xFF) << 16 | paramArrayOfByte[(paramInt + 3)] << 24;
    }

    private byte[] intToByteLittle(int paramInt1, byte[] paramArrayOfByte, int paramInt2) {
        paramArrayOfByte[paramInt2] = ((byte) paramInt1);
        paramArrayOfByte[(paramInt2 + 1)] = ((byte) (paramInt1 >>> 8));
        paramArrayOfByte[(paramInt2 + 2)] = ((byte) (paramInt1 >>> 16));
        paramArrayOfByte[(paramInt2 + 3)] = ((byte) (paramInt1 >>> 24));
        return paramArrayOfByte;
    }

    private boolean limitExceeded() {
        boolean bool2 = false;
        this.cW0 += 1;
        boolean bool1 = bool2;
        if (this.cW0 == 0) {
            this.cW1 += 1;
            bool1 = bool2;
            if (this.cW1 == 0) {
                this.cW2 += 1;
                bool1 = bool2;
                if ((this.cW2 & 0x20) != 0) {
                    bool1 = true;
                }
            }
        }
        return bool1;
    }

    private boolean limitExceeded(int paramInt) {
        if (this.cW0 >= 0) {
            this.cW0 += paramInt;
        }
        do {
            do {
                do {
                    return false;
                    this.cW0 += paramInt;
                } while (this.cW0 < 0);
                this.cW1 += 1;
            } while (this.cW1 != 0);
            this.cW2 += 1;
        } while ((this.cW2 & 0x20) == 0);
        return true;
    }

    private void resetCounter() {
        this.cW0 = 0;
        this.cW1 = 0;
        this.cW2 = 0;
    }

    private int rotl(int paramInt1, int paramInt2) {
        return paramInt1 << paramInt2 | paramInt1 >>> -paramInt2;
    }

    private void salsa20WordToByte(int[] paramArrayOfInt, byte[] paramArrayOfByte) {
        System.arraycopy(paramArrayOfInt, 0, this.x, 0, paramArrayOfInt.length);
        int i = 0;
        while (i < 10) {
            int[] arrayOfInt = this.x;
            arrayOfInt[4] ^= rotl(this.x[0] + this.x[12], 7);
            arrayOfInt = this.x;
            arrayOfInt[8] ^= rotl(this.x[4] + this.x[0], 9);
            arrayOfInt = this.x;
            arrayOfInt[12] ^= rotl(this.x[8] + this.x[4], 13);
            arrayOfInt = this.x;
            arrayOfInt[0] ^= rotl(this.x[12] + this.x[8], 18);
            arrayOfInt = this.x;
            arrayOfInt[9] ^= rotl(this.x[5] + this.x[1], 7);
            arrayOfInt = this.x;
            arrayOfInt[13] ^= rotl(this.x[9] + this.x[5], 9);
            arrayOfInt = this.x;
            arrayOfInt[1] ^= rotl(this.x[13] + this.x[9], 13);
            arrayOfInt = this.x;
            arrayOfInt[5] ^= rotl(this.x[1] + this.x[13], 18);
            arrayOfInt = this.x;
            arrayOfInt[14] ^= rotl(this.x[10] + this.x[6], 7);
            arrayOfInt = this.x;
            arrayOfInt[2] ^= rotl(this.x[14] + this.x[10], 9);
            arrayOfInt = this.x;
            arrayOfInt[6] ^= rotl(this.x[2] + this.x[14], 13);
            arrayOfInt = this.x;
            arrayOfInt[10] ^= rotl(this.x[6] + this.x[2], 18);
            arrayOfInt = this.x;
            arrayOfInt[3] ^= rotl(this.x[15] + this.x[11], 7);
            arrayOfInt = this.x;
            arrayOfInt[7] ^= rotl(this.x[3] + this.x[15], 9);
            arrayOfInt = this.x;
            arrayOfInt[11] ^= rotl(this.x[7] + this.x[3], 13);
            arrayOfInt = this.x;
            arrayOfInt[15] ^= rotl(this.x[11] + this.x[7], 18);
            arrayOfInt = this.x;
            arrayOfInt[1] ^= rotl(this.x[0] + this.x[3], 7);
            arrayOfInt = this.x;
            arrayOfInt[2] ^= rotl(this.x[1] + this.x[0], 9);
            arrayOfInt = this.x;
            arrayOfInt[3] ^= rotl(this.x[2] + this.x[1], 13);
            arrayOfInt = this.x;
            arrayOfInt[0] ^= rotl(this.x[3] + this.x[2], 18);
            arrayOfInt = this.x;
            arrayOfInt[6] ^= rotl(this.x[5] + this.x[4], 7);
            arrayOfInt = this.x;
            arrayOfInt[7] ^= rotl(this.x[6] + this.x[5], 9);
            arrayOfInt = this.x;
            arrayOfInt[4] ^= rotl(this.x[7] + this.x[6], 13);
            arrayOfInt = this.x;
            arrayOfInt[5] ^= rotl(this.x[4] + this.x[7], 18);
            arrayOfInt = this.x;
            arrayOfInt[11] ^= rotl(this.x[10] + this.x[9], 7);
            arrayOfInt = this.x;
            arrayOfInt[8] ^= rotl(this.x[11] + this.x[10], 9);
            arrayOfInt = this.x;
            arrayOfInt[9] ^= rotl(this.x[8] + this.x[11], 13);
            arrayOfInt = this.x;
            arrayOfInt[10] ^= rotl(this.x[9] + this.x[8], 18);
            arrayOfInt = this.x;
            arrayOfInt[12] ^= rotl(this.x[15] + this.x[14], 7);
            arrayOfInt = this.x;
            arrayOfInt[13] ^= rotl(this.x[12] + this.x[15], 9);
            arrayOfInt = this.x;
            arrayOfInt[14] ^= rotl(this.x[13] + this.x[12], 13);
            arrayOfInt = this.x;
            arrayOfInt[15] ^= rotl(this.x[14] + this.x[13], 18);
            i += 1;
        }
        i = 0;
        int j = 0;
        while (j < 16) {
            intToByteLittle(this.x[j] + paramArrayOfInt[j], paramArrayOfByte, i);
            i += 4;
            j += 1;
        }
        int k = 16;
        j = i;
        i = k;
        while (i < this.x.length) {
            intToByteLittle(this.x[i], paramArrayOfByte, j);
            j += 4;
            i += 1;
        }
    }

    private void setKey(byte[] paramArrayOfByte1, byte[] paramArrayOfByte2) {
        this.workingKey = paramArrayOfByte1;
        this.workingIV = paramArrayOfByte2;
        this.index = 0;
        resetCounter();
        int i = 0;
        this.engineState[1] = byteToIntLittle(this.workingKey, 0);
        this.engineState[2] = byteToIntLittle(this.workingKey, 4);
        this.engineState[3] = byteToIntLittle(this.workingKey, 8);
        this.engineState[4] = byteToIntLittle(this.workingKey, 12);
        if (this.workingKey.length == 32) {
            paramArrayOfByte1 = sigma;
            i = 16;
        }
        for (; ; ) {
            this.engineState[11] = byteToIntLittle(this.workingKey, i);
            this.engineState[12] = byteToIntLittle(this.workingKey, i + 4);
            this.engineState[13] = byteToIntLittle(this.workingKey, i + 8);
            this.engineState[14] = byteToIntLittle(this.workingKey, i + 12);
            this.engineState[0] = byteToIntLittle(paramArrayOfByte1, 0);
            this.engineState[5] = byteToIntLittle(paramArrayOfByte1, 4);
            this.engineState[10] = byteToIntLittle(paramArrayOfByte1, 8);
            this.engineState[15] = byteToIntLittle(paramArrayOfByte1, 12);
            this.engineState[6] = byteToIntLittle(this.workingIV, 0);
            this.engineState[7] = byteToIntLittle(this.workingIV, 4);
            paramArrayOfByte1 = this.engineState;
            this.engineState[9] = 0;
            paramArrayOfByte1[8] = 0;
            this.initialised = true;
            return;
            paramArrayOfByte1 = tau;
        }
    }

    public String getAlgorithmName() {
        return "Salsa20";
    }

    public void init(boolean paramBoolean, CipherParameters paramCipherParameters) {
        if (!(paramCipherParameters instanceof ParametersWithIV)) {
            throw new IllegalArgumentException("Salsa20 Init parameters must include an IV");
        }
        paramCipherParameters = (ParametersWithIV) paramCipherParameters;
        byte[] arrayOfByte = paramCipherParameters.getIV();
        if ((arrayOfByte == null) || (arrayOfByte.length != 8)) {
            throw new IllegalArgumentException("Salsa20 requires exactly 8 bytes of IV");
        }
        if (!(paramCipherParameters.getParameters() instanceof KeyParameter)) {
            throw new IllegalArgumentException("Salsa20 Init parameters must include a key");
        }
        this.workingKey = ((KeyParameter) paramCipherParameters.getParameters()).getKey();
        this.workingIV = arrayOfByte;
        setKey(this.workingKey, this.workingIV);
    }

    public void processBytes(byte[] paramArrayOfByte1, int paramInt1, int paramInt2, byte[] paramArrayOfByte2, int paramInt3) {
        if (!this.initialised) {
            throw new IllegalStateException(getAlgorithmName() + " not initialised");
        }
        if (paramInt1 + paramInt2 > paramArrayOfByte1.length) {
            throw new DataLengthException("input buffer too short");
        }
        if (paramInt3 + paramInt2 > paramArrayOfByte2.length) {
            throw new DataLengthException("output buffer too short");
        }
        if (limitExceeded(paramInt2)) {
            throw new MaxBytesExceededException("2^70 byte limit per IV would be exceeded; Change IV");
        }
        int i = 0;
        while (i < paramInt2) {
            if (this.index == 0) {
                salsa20WordToByte(this.engineState, this.keyStream);
                int[] arrayOfInt = this.engineState;
                arrayOfInt[8] += 1;
                if (this.engineState[8] == 0) {
                    arrayOfInt = this.engineState;
                    arrayOfInt[9] += 1;
                }
            }
            paramArrayOfByte2[(i + paramInt3)] = ((byte) (this.keyStream[this.index] ^ paramArrayOfByte1[(i + paramInt1)]));
            this.index = (this.index + 1 & 0x3F);
            i += 1;
        }
    }

    public void reset() {
        setKey(this.workingKey, this.workingIV);
    }

    public byte returnByte(byte paramByte) {
        if (limitExceeded()) {
            throw new MaxBytesExceededException("2^70 byte limit per IV; Change IV");
        }
        if (this.index == 0) {
            salsa20WordToByte(this.engineState, this.keyStream);
            int[] arrayOfInt = this.engineState;
            arrayOfInt[8] += 1;
            if (this.engineState[8] == 0) {
                arrayOfInt = this.engineState;
                arrayOfInt[9] += 1;
            }
        }
        byte b = (byte) (this.keyStream[this.index] ^ paramByte);
        this.index = (this.index + 1 & 0x3F);
        return b;
    }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/org/bouncycastle/crypto/engines/Salsa20Engine.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */