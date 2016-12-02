package com.keepassdroid;

import android.os.Bundle;
import android.view.Window;
import com.keepassdroid.compat.BuildCompat;

public abstract class LockCloseHideActivity
  extends LockCloseActivity
{
  protected void onCreate(Bundle paramBundle)
  {
    super.onCreate(paramBundle);
    int i = BuildCompat.getSdkVersion();
    if ((i >= 14) || (i < 9)) {
      getWindow().setFlags(8192, 8192);
    }
  }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/com/keepassdroid/LockCloseHideActivity.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */