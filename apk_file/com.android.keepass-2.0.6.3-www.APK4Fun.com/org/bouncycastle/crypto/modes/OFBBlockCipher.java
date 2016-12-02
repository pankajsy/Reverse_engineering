package org.bouncycastle.crypto.modes;

import org.bouncycastle.crypto.BlockCipher;
import org.bouncycastle.crypto.CipherParameters;
import org.bouncycastle.crypto.DataLengthException;
import org.bouncycastle.crypto.params.ParametersWithIV;

public class OFBBlockCipher
        implements BlockCipher {
    private final int blockSize;
    private final BlockCipher cipher;
    private byte[] IV;
    private byte[] ofbOutV;
    private byte[] ofbV;

    public OFBBlockCipher(BlockCipher paramBlockCipher, int paramInt) {
        this.cipher = paramBlockCipher;
        this.blockSize = (paramInt / 8);
        this.IV = new byte[paramBlockCipher.getBlockSize()];
        this.ofbV = new byte[paramBlockCipher.getBlockSize()];
        this.ofbOutV = new byte[paramBlockCipher.getBlockSize()];
    }

    public String getAlgorithmName() {
        return this.cipher.getAlgorithmName() + "/OFB" + this.blockSize * 8;
    }

    public int getBlockSize() {
        return this.blockSize;
    }

    public BlockCipher getUnderlyingCipher() {
        return this.cipher;
    }

    public void init(boolean paramBoolean, CipherParameters paramCipherParameters)
            throws IllegalArgumentException {
        if ((paramCipherParameters instanceof ParametersWithIV)) {
            paramCipherParameters = (ParametersWithIV) paramCipherParameters;
            byte[] arrayOfByte = paramCipherParameters.getIV();
            if (arrayOfByte.length < this.IV.length) {
                System.arraycopy(arrayOfByte, 0, this.IV, this.IV.length - arrayOfByte.length, arrayOfByte.length);
                int i = 0;
                while (i < this.IV.length - arrayOfByte.length) {
                    this.IV[i] = 0;
                    i += 1;
                }
            }
            System.arraycopy(arrayOfByte, 0, this.IV, 0, this.IV.length);
            reset();
            this.cipher.init(true, paramCipherParameters.getParameters());
            return;
        }
        reset();
        this.cipher.init(true, paramCipherParameters);
    }

    public int processBlock(byte[] paramArrayOfByte1, int paramInt1, byte[] paramArrayOfByte2, int paramInt2)
            throws DataLengthException, IllegalStateException {
        if (this.blockSize + paramInt1 > paramArrayOfByte1.length) {
            throw new DataLengthException("input buffer too short");
        }
        if (this.blockSize + paramInt2 > paramArrayOfByte2.length) {
            throw new DataLengthException("output buffer too short");
        }
        this.cipher.processBlock(this.ofbV, 0, this.ofbOutV, 0);
        int i = 0;
        while (i < this.blockSize) {
            paramArrayOfByte2[(paramInt2 + i)] = ((byte) (this.ofbOutV[i] ^ paramArrayOfByte1[(paramInt1 + i)]));
            i += 1;
        }
        System.arraycopy(this.ofbV, this.blockSize, this.ofbV, 0, this.ofbV.length - this.blockSize);
        System.arraycopy(this.ofbOutV, 0, this.ofbV, this.ofbV.length - this.blockSize, this.blockSize);
        return this.blockSize;
    }

    public void reset() {
        System.arraycopy(this.IV, 0, this.ofbV, 0, this.IV.length);
        this.cipher.reset();
    }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/org/bouncycastle/crypto/modes/OFBBlockCipher.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */