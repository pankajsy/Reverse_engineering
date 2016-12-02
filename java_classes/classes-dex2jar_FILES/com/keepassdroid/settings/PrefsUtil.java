package com.keepassdroid.settings;

import android.content.Context;
import android.content.SharedPreferences;
import android.preference.PreferenceManager;

public class PrefsUtil
{
  public static float getListTextSize(Context paramContext)
  {
    return Float.parseFloat(PreferenceManager.getDefaultSharedPreferences(paramContext).getString(paramContext.getString(2131099840), paramContext.getString(2131099839)));
  }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/com/keepassdroid/settings/PrefsUtil.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */