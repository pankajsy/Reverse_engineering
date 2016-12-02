package org.bouncycastle.crypto.params;

import org.bouncycastle.crypto.CipherParameters;

import java.security.SecureRandom;

public class ParametersWithRandom
        implements CipherParameters {
    private CipherParameters parameters;
    private SecureRandom random;

    public ParametersWithRandom(CipherParameters paramCipherParameters) {
        this(paramCipherParameters, new SecureRandom());
    }

    public ParametersWithRandom(CipherParameters paramCipherParameters, SecureRandom paramSecureRandom) {
        this.random = paramSecureRandom;
        this.parameters = paramCipherParameters;
    }

    public CipherParameters getParameters() {
        return this.parameters;
    }

    public SecureRandom getRandom() {
        return this.random;
    }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/org/bouncycastle/crypto/params/ParametersWithRandom.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */