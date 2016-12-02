package com.keepassdroid.crypto;

import java.security.Provider;
import org.bouncycastle.jce.provider.JCEBlockCipher.Twofish;

public class BouncyCastleProvider
  extends Provider
{
  private static final long serialVersionUID = -6705090615178002994L;
  
  public BouncyCastleProvider()
  {
    super("BouncyCastleProvider", 1.0D, "");
    put("Cipher.TWOFISH", JCEBlockCipher.Twofish.class.getName());
  }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/com/keepassdroid/crypto/BouncyCastleProvider.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */