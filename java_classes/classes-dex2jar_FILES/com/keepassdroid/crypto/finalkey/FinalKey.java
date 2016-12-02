package com.keepassdroid.crypto.finalkey;

import java.io.IOException;

public abstract class FinalKey
{
  public abstract byte[] transformMasterKey(byte[] paramArrayOfByte1, byte[] paramArrayOfByte2, int paramInt)
    throws IOException;
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/com/keepassdroid/crypto/finalkey/FinalKey.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */