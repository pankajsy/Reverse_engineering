package com.keepassdroid.crypto;

public class NativeLib
{
  private static boolean isLoaded = false;
  private static boolean loadSuccess = false;
  
  public static boolean init()
  {
    if (!isLoaded) {}
    try
    {
      System.loadLibrary("final-key");
      isLoaded = true;
      loadSuccess = true;
      return loadSuccess;
    }
    catch (UnsatisfiedLinkError localUnsatisfiedLinkError) {}
    return false;
  }
  
  public static boolean loaded()
  {
    return init();
  }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/com/keepassdroid/crypto/NativeLib.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */