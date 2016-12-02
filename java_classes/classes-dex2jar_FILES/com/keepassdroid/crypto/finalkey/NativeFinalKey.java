package com.keepassdroid.crypto.finalkey;

import com.keepassdroid.crypto.NativeLib;
import java.io.IOException;

public class NativeFinalKey
  extends FinalKey
{
  public static boolean availble()
  {
    return NativeLib.init();
  }
  
  private static native byte[] nTransformMasterKey(byte[] paramArrayOfByte1, byte[] paramArrayOfByte2, int paramInt);
  
  public byte[] transformMasterKey(byte[] paramArrayOfByte1, byte[] paramArrayOfByte2, int paramInt)
    throws IOException
  {
    NativeLib.init();
    return nTransformMasterKey(paramArrayOfByte1, paramArrayOfByte2, paramInt);
  }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/com/keepassdroid/crypto/finalkey/NativeFinalKey.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */