package com.keepassdroid;

import android.content.ActivityNotFoundException;
import android.content.ComponentName;
import android.content.Intent;
import com.keepassdroid.app.App;

public abstract class LockCloseActivity
  extends LockingActivity
{
  private void checkShutdown()
  {
    if ((App.isShutdown()) && (App.getDB().Loaded()))
    {
      setResult(1);
      finish();
    }
  }
  
  protected void onResume()
  {
    super.onResume();
    checkShutdown();
  }
  
  public void startActivity(Intent paramIntent)
  {
    try
    {
      if ((paramIntent.getComponent() != null) && (paramIntent.getComponent().getShortClassName().equals(".HtcLinkifyDispatcherActivity"))) {
        paramIntent.setComponent(null);
      }
      super.startActivity(paramIntent);
      return;
    }
    catch (ActivityNotFoundException localActivityNotFoundException)
    {
      super.startActivity(Intent.createChooser(paramIntent, null));
    }
  }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/com/keepassdroid/LockCloseActivity.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */