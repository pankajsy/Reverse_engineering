package com.keepassdroid.compat;

import android.os.Build;
import android.os.Build.VERSION;
import java.lang.reflect.Field;

public class BuildCompat
{
  public static final int VERSION_CODE_GINGERBREAD = 9;
  public static final int VERSION_CODE_ICE_CREAM_SANDWICH = 14;
  public static final int VERSION_CODE_JELLY_BEAN = 16;
  public static final int VERSION_CODE_JELLY_BEAN_MR2 = 18;
  public static final int VERSION_KITKAT = 19;
  private static String manuText;
  private static Field manufacturer;
  private static int versionInt;
  private static Field versionSDK;
  
  static
  {
    try
    {
      manufacturer = Build.class.getField("MANUFACTURER");
      manuText = (String)manufacturer.get(null);
    }
    catch (Exception localException1)
    {
      for (;;)
      {
        try
        {
          versionSDK = Build.VERSION.class.getField("SDK_INT");
          versionInt = versionSDK.getInt(null);
          return;
        }
        catch (Exception localException2)
        {
          try
          {
            versionInt = Integer.parseInt(Build.VERSION.SDK);
            return;
          }
          catch (Exception localException3)
          {
            versionInt = -1;
          }
        }
        localException1 = localException1;
        manuText = "";
      }
    }
  }
  
  public static String getManufacturer()
  {
    return manuText;
  }
  
  public static int getSdkVersion()
  {
    return versionInt;
  }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/com/keepassdroid/compat/BuildCompat.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */