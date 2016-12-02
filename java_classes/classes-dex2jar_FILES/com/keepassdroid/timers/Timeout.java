package com.keepassdroid.timers;

import android.app.AlarmManager;
import android.app.PendingIntent;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.preference.PreferenceManager;
import android.util.Log;
import com.keepassdroid.services.TimeoutService;

public class Timeout
{
  private static final long DEFAULT_TIMEOUT = 300000L;
  private static final int REQUEST_ID = 0;
  private static String TAG = "KeePass Timeout";
  
  private static PendingIntent buildIntent(Context paramContext)
  {
    return PendingIntent.getBroadcast(paramContext, 0, new Intent("com.keepassdroid.timeout"), 268435456);
  }
  
  public static void cancel(Context paramContext)
  {
    AlarmManager localAlarmManager = (AlarmManager)paramContext.getSystemService("alarm");
    Log.d(TAG, "Timeout cancel");
    localAlarmManager.cancel(buildIntent(paramContext));
    paramContext.stopService(new Intent(paramContext, TimeoutService.class));
  }
  
  public static void start(Context paramContext)
  {
    String str = PreferenceManager.getDefaultSharedPreferences(paramContext).getString(paramContext.getString(2131099824), paramContext.getString(2131099826));
    try
    {
      l1 = Long.parseLong(str);
      if (l1 == -1L) {
        return;
      }
    }
    catch (NumberFormatException localNumberFormatException)
    {
      long l1;
      for (;;)
      {
        l1 = 300000L;
      }
      paramContext.startService(new Intent(paramContext, TimeoutService.class));
      long l2 = System.currentTimeMillis();
      AlarmManager localAlarmManager = (AlarmManager)paramContext.getSystemService("alarm");
      Log.d(TAG, "Timeout start");
      localAlarmManager.set(1, l2 + l1, buildIntent(paramContext));
    }
  }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/com/keepassdroid/timers/Timeout.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */