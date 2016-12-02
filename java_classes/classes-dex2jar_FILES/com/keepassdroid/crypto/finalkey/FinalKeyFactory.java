package com.keepassdroid.crypto.finalkey;

import com.keepassdroid.crypto.CipherFactory;

public class FinalKeyFactory
{
  public static FinalKey createFinalKey()
  {
    return createFinalKey(false);
  }
  
  public static FinalKey createFinalKey(boolean paramBoolean)
  {
    if ((!CipherFactory.deviceBlacklisted()) && (!paramBoolean) && (NativeFinalKey.availble())) {
      return new NativeFinalKey();
    }
    return new AndroidFinalKey();
  }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/com/keepassdroid/crypto/finalkey/FinalKeyFactory.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */