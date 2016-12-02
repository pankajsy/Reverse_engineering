package com.keepassdroid.services;

import android.app.NotificationManager;
import android.app.Service;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.os.Binder;
import android.os.IBinder;
import android.util.Log;
import com.keepassdroid.app.App;

public class TimeoutService
  extends Service
{
  private static final String TAG = "KeePassDroid Timer";
  private final IBinder mBinder = new TimeoutBinder();
  private BroadcastReceiver mIntentReceiver;
  
  private void timeout(Context paramContext)
  {
    Log.d("KeePassDroid Timer", "Timeout");
    App.setShutdown();
    ((NotificationManager)getSystemService("notification")).cancelAll();
    stopSelf();
  }
  
  public IBinder onBind(Intent paramIntent)
  {
    return this.mBinder;
  }
  
  public void onCreate()
  {
    super.onCreate();
    this.mIntentReceiver = new BroadcastReceiver()
    {
      public void onReceive(Context paramAnonymousContext, Intent paramAnonymousIntent)
      {
        if (paramAnonymousIntent.getAction().equals("com.keepassdroid.timeout")) {
          TimeoutService.this.timeout(paramAnonymousContext);
        }
      }
    };
    IntentFilter localIntentFilter = new IntentFilter();
    localIntentFilter.addAction("com.keepassdroid.timeout");
    registerReceiver(this.mIntentReceiver, localIntentFilter);
  }
  
  public void onDestroy()
  {
    super.onDestroy();
    Log.d("KeePassDroid Timer", "Timeout service stopped");
    unregisterReceiver(this.mIntentReceiver);
  }
  
  public void onStart(Intent paramIntent, int paramInt)
  {
    super.onStart(paramIntent, paramInt);
    Log.d("KeePassDroid Timer", "Timeout service started");
  }
  
  public class TimeoutBinder
    extends Binder
  {
    public TimeoutBinder() {}
    
    public TimeoutService getService()
    {
      return TimeoutService.this;
    }
  }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/com/keepassdroid/services/TimeoutService.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */