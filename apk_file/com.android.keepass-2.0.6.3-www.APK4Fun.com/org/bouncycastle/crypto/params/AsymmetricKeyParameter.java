package org.bouncycastle.crypto.params;

import org.bouncycastle.crypto.CipherParameters;

public class AsymmetricKeyParameter
        implements CipherParameters {
    boolean privateKey;

    public AsymmetricKeyParameter(boolean paramBoolean) {
        this.privateKey = paramBoolean;
    }

    public boolean isPrivate() {
        return this.privateKey;
    }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/org/bouncycastle/crypto/params/AsymmetricKeyParameter.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */