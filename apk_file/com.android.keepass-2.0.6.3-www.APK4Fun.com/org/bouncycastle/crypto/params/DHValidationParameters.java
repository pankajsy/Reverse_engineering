package org.bouncycastle.crypto.params;

import org.bouncycastle.util.Arrays;

public class DHValidationParameters {
    private int counter;
    private byte[] seed;

    public DHValidationParameters(byte[] paramArrayOfByte, int paramInt) {
        this.seed = paramArrayOfByte;
        this.counter = paramInt;
    }

    public boolean equals(Object paramObject) {
        if (!(paramObject instanceof DHValidationParameters)) {
        }
        do {
            return false;
            paramObject = (DHValidationParameters) paramObject;
        } while (((DHValidationParameters) paramObject).counter != this.counter);
        return Arrays.areEqual(this.seed, ((DHValidationParameters) paramObject).seed);
    }

    public int getCounter() {
        return this.counter;
    }

    public byte[] getSeed() {
        return this.seed;
    }

    public int hashCode() {
        return this.counter ^ Arrays.hashCode(this.seed);
    }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/org/bouncycastle/crypto/params/DHValidationParameters.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */