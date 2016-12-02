package com.keepassdroid.compat;

import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.res.Resources;
import android.preference.PreferenceManager;
import java.lang.reflect.Field;

public class StorageAF
{
  public static String ACTION_OPEN_DOCUMENT;
  
  static
  {
    try
    {
      ACTION_OPEN_DOCUMENT = (String)Intent.class.getField("ACTION_OPEN_DOCUMENT").get(null);
      return;
    }
    catch (Exception localException)
    {
      ACTION_OPEN_DOCUMENT = "android.intent.action.OPEN_DOCUMENT";
    }
  }
  
  public static boolean supportsStorageFramework()
  {
    return BuildCompat.getSdkVersion() >= 19;
  }
  
  public static boolean useStorageFramework(Context paramContext)
  {
    if (!supportsStorageFramework()) {
      return false;
    }
    return PreferenceManager.getDefaultSharedPreferences(paramContext).getBoolean(paramContext.getString(2131099847), paramContext.getResources().getBoolean(2131230724));
  }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/com/keepassdroid/compat/StorageAF.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */