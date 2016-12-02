package org.bouncycastle.crypto.params;

import org.bouncycastle.crypto.CipherParameters;

import java.math.BigInteger;

public class DSAParameters
        implements CipherParameters {
    private BigInteger g;
    private BigInteger p;
    private BigInteger q;
    private DSAValidationParameters validation;

    public DSAParameters(BigInteger paramBigInteger1, BigInteger paramBigInteger2, BigInteger paramBigInteger3) {
        this.g = paramBigInteger3;
        this.p = paramBigInteger1;
        this.q = paramBigInteger2;
    }

    public DSAParameters(BigInteger paramBigInteger1, BigInteger paramBigInteger2, BigInteger paramBigInteger3, DSAValidationParameters paramDSAValidationParameters) {
        this.g = paramBigInteger3;
        this.p = paramBigInteger1;
        this.q = paramBigInteger2;
        this.validation = paramDSAValidationParameters;
    }

    public boolean equals(Object paramObject) {
        if (!(paramObject instanceof DSAParameters)) {
        }
        do {
            return false;
            paramObject = (DSAParameters) paramObject;
        }
        while ((!((DSAParameters) paramObject).getP().equals(this.p)) || (!((DSAParameters) paramObject).getQ().equals(this.q)) || (!((DSAParameters) paramObject).getG().equals(this.g)));
        return true;
    }

    public BigInteger getG() {
        return this.g;
    }

    public BigInteger getP() {
        return this.p;
    }

    public BigInteger getQ() {
        return this.q;
    }

    public DSAValidationParameters getValidationParameters() {
        return this.validation;
    }

    public int hashCode() {
        return getP().hashCode() ^ getQ().hashCode() ^ getG().hashCode();
    }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/org/bouncycastle/crypto/params/DSAParameters.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */