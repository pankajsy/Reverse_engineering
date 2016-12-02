package com.keepassdroid;

import com.keepassdroid.timeout.TimeoutHelper;

public class LockingClosePreferenceActivity
  extends LockingPreferenceActivity
{
  protected void onResume()
  {
    super.onResume();
    TimeoutHelper.checkShutdown(this);
  }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/com/keepassdroid/LockingClosePreferenceActivity.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */