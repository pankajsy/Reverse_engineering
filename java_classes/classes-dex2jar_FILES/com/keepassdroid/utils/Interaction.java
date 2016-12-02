package com.keepassdroid.utils;

import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageManager;
import java.util.List;

public class Interaction
{
  public static boolean isIntentAvailable(Context paramContext, String paramString)
  {
    return paramContext.getPackageManager().queryIntentActivities(new Intent(paramString), 65536).size() > 0;
  }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/com/keepassdroid/utils/Interaction.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */