package org.bouncycastle.crypto.generators;

import org.bouncycastle.crypto.CipherParameters;
import org.bouncycastle.crypto.Mac;
import org.bouncycastle.crypto.PBEParametersGenerator;
import org.bouncycastle.crypto.digests.SHA1Digest;
import org.bouncycastle.crypto.macs.HMac;
import org.bouncycastle.crypto.params.KeyParameter;
import org.bouncycastle.crypto.params.ParametersWithIV;

public class PKCS5S2ParametersGenerator
        extends PBEParametersGenerator {
    private Mac hMac = new HMac(new SHA1Digest());

    private void F(byte[] paramArrayOfByte1, byte[] paramArrayOfByte2, int paramInt1, byte[] paramArrayOfByte3, byte[] paramArrayOfByte4, int paramInt2) {
        byte[] arrayOfByte = new byte[this.hMac.getMacSize()];
        paramArrayOfByte1 = new KeyParameter(paramArrayOfByte1);
        this.hMac.init(paramArrayOfByte1);
        if (paramArrayOfByte2 != null) {
            this.hMac.update(paramArrayOfByte2, 0, paramArrayOfByte2.length);
        }
        this.hMac.update(paramArrayOfByte3, 0, paramArrayOfByte3.length);
        this.hMac.doFinal(arrayOfByte, 0);
        System.arraycopy(arrayOfByte, 0, paramArrayOfByte4, paramInt2, arrayOfByte.length);
        if (paramInt1 == 0) {
            throw new IllegalArgumentException("iteration count must be at least 1.");
        }
        int i = 1;
        while (i < paramInt1) {
            this.hMac.init(paramArrayOfByte1);
            this.hMac.update(arrayOfByte, 0, arrayOfByte.length);
            this.hMac.doFinal(arrayOfByte, 0);
            int j = 0;
            while (j != arrayOfByte.length) {
                int k = paramInt2 + j;
                paramArrayOfByte4[k] = ((byte) (paramArrayOfByte4[k] ^ arrayOfByte[j]));
                j += 1;
            }
            i += 1;
        }
    }

    private byte[] generateDerivedKey(int paramInt) {
        int i = this.hMac.getMacSize();
        int j = (paramInt + i - 1) / i;
        byte[] arrayOfByte1 = new byte[4];
        byte[] arrayOfByte2 = new byte[j * i];
        paramInt = 1;
        while (paramInt <= j) {
            intToOctet(arrayOfByte1, paramInt);
            F(this.password, this.salt, this.iterationCount, arrayOfByte1, arrayOfByte2, (paramInt - 1) * i);
            paramInt += 1;
        }
        return arrayOfByte2;
    }

    private void intToOctet(byte[] paramArrayOfByte, int paramInt) {
        paramArrayOfByte[0] = ((byte) (paramInt >>> 24));
        paramArrayOfByte[1] = ((byte) (paramInt >>> 16));
        paramArrayOfByte[2] = ((byte) (paramInt >>> 8));
        paramArrayOfByte[3] = ((byte) paramInt);
    }

    public CipherParameters generateDerivedMacParameters(int paramInt) {
        return generateDerivedParameters(paramInt);
    }

    public CipherParameters generateDerivedParameters(int paramInt) {
        paramInt /= 8;
        return new KeyParameter(generateDerivedKey(paramInt), 0, paramInt);
    }

    public CipherParameters generateDerivedParameters(int paramInt1, int paramInt2) {
        paramInt1 /= 8;
        paramInt2 /= 8;
        byte[] arrayOfByte = generateDerivedKey(paramInt1 + paramInt2);
        return new ParametersWithIV(new KeyParameter(arrayOfByte, 0, paramInt1), arrayOfByte, paramInt1, paramInt2);
    }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/org/bouncycastle/crypto/generators/PKCS5S2ParametersGenerator.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */