package com.keepassdroid;

import android.app.Activity;

import com.keepassdroid.timeout.TimeoutHelper;

public abstract class LockingActivity
        extends Activity {
    protected void onPause() {
        super.onPause();
        TimeoutHelper.pause(this);
    }

    protected void onResume() {
        super.onResume();
        TimeoutHelper.resume(this);
    }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/com/keepassdroid/LockingActivity.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */