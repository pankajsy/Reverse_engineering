package org.bouncycastle.crypto.params;

import java.math.BigInteger;

public class DHPrivateKeyParameters
        extends DHKeyParameters {
    private BigInteger x;

    public DHPrivateKeyParameters(BigInteger paramBigInteger, DHParameters paramDHParameters) {
        super(true, paramDHParameters);
        this.x = paramBigInteger;
    }

    public boolean equals(Object paramObject) {
        if (!(paramObject instanceof DHPrivateKeyParameters)) {
        }
        while ((!((DHPrivateKeyParameters) paramObject).getX().equals(this.x)) || (!super.equals(paramObject))) {
            return false;
        }
        return true;
    }

    public BigInteger getX() {
        return this.x;
    }

    public int hashCode() {
        return this.x.hashCode() ^ super.hashCode();
    }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/org/bouncycastle/crypto/params/DHPrivateKeyParameters.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */