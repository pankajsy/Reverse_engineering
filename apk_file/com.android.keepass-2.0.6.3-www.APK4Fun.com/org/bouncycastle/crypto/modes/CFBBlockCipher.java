package org.bouncycastle.crypto.modes;

import org.bouncycastle.crypto.BlockCipher;
import org.bouncycastle.crypto.CipherParameters;
import org.bouncycastle.crypto.DataLengthException;
import org.bouncycastle.crypto.params.ParametersWithIV;

public class CFBBlockCipher
        implements BlockCipher {
    private byte[] IV;
    private int blockSize;
    private byte[] cfbOutV;
    private byte[] cfbV;
    private BlockCipher cipher = null;
    private boolean encrypting;

    public CFBBlockCipher(BlockCipher paramBlockCipher, int paramInt) {
        this.cipher = paramBlockCipher;
        this.blockSize = (paramInt / 8);
        this.IV = new byte[paramBlockCipher.getBlockSize()];
        this.cfbV = new byte[paramBlockCipher.getBlockSize()];
        this.cfbOutV = new byte[paramBlockCipher.getBlockSize()];
    }

    public int decryptBlock(byte[] paramArrayOfByte1, int paramInt1, byte[] paramArrayOfByte2, int paramInt2)
            throws DataLengthException, IllegalStateException {
        if (this.blockSize + paramInt1 > paramArrayOfByte1.length) {
            throw new DataLengthException("input buffer too short");
        }
        if (this.blockSize + paramInt2 > paramArrayOfByte2.length) {
            throw new DataLengthException("output buffer too short");
        }
        this.cipher.processBlock(this.cfbV, 0, this.cfbOutV, 0);
        System.arraycopy(this.cfbV, this.blockSize, this.cfbV, 0, this.cfbV.length - this.blockSize);
        System.arraycopy(paramArrayOfByte1, paramInt1, this.cfbV, this.cfbV.length - this.blockSize, this.blockSize);
        int i = 0;
        while (i < this.blockSize) {
            paramArrayOfByte2[(paramInt2 + i)] = ((byte) (this.cfbOutV[i] ^ paramArrayOfByte1[(paramInt1 + i)]));
            i += 1;
        }
        return this.blockSize;
    }

    public int encryptBlock(byte[] paramArrayOfByte1, int paramInt1, byte[] paramArrayOfByte2, int paramInt2)
            throws DataLengthException, IllegalStateException {
        if (this.blockSize + paramInt1 > paramArrayOfByte1.length) {
            throw new DataLengthException("input buffer too short");
        }
        if (this.blockSize + paramInt2 > paramArrayOfByte2.length) {
            throw new DataLengthException("output buffer too short");
        }
        this.cipher.processBlock(this.cfbV, 0, this.cfbOutV, 0);
        int i = 0;
        while (i < this.blockSize) {
            paramArrayOfByte2[(paramInt2 + i)] = ((byte) (this.cfbOutV[i] ^ paramArrayOfByte1[(paramInt1 + i)]));
            i += 1;
        }
        System.arraycopy(this.cfbV, this.blockSize, this.cfbV, 0, this.cfbV.length - this.blockSize);
        System.arraycopy(paramArrayOfByte2, paramInt2, this.cfbV, this.cfbV.length - this.blockSize, this.blockSize);
        return this.blockSize;
    }

    public String getAlgorithmName() {
        return this.cipher.getAlgorithmName() + "/CFB" + this.blockSize * 8;
    }

    public int getBlockSize() {
        return this.blockSize;
    }

    public BlockCipher getUnderlyingCipher() {
        return this.cipher;
    }

    public void init(boolean paramBoolean, CipherParameters paramCipherParameters)
            throws IllegalArgumentException {
        this.encrypting = paramBoolean;
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
        if (this.encrypting) {
            return encryptBlock(paramArrayOfByte1, paramInt1, paramArrayOfByte2, paramInt2);
        }
        return decryptBlock(paramArrayOfByte1, paramInt1, paramArrayOfByte2, paramInt2);
    }

    public void reset() {
        System.arraycopy(this.IV, 0, this.cfbV, 0, this.IV.length);
        this.cipher.reset();
    }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/org/bouncycastle/crypto/modes/CFBBlockCipher.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */