package com.keepassdroid.crypto;

import java.security.Provider;

public final class AESProvider
        extends Provider {
    private static final long serialVersionUID = -3846349284296062658L;

    public AESProvider() {
        super("AESProvider", 1.0D, "");
        put("Cipher.AES", NativeAESCipherSpi.class.getName());
    }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/com/keepassdroid/crypto/AESProvider.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */