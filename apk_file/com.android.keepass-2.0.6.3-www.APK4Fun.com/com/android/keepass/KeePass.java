package com.android.keepass;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;

import com.keepassdroid.fileselect.FileSelectActivity;

public class KeePass
        extends Activity {
    public static final int EXIT_LOCK = 1;
    public static final int EXIT_NORMAL = 0;
    public static final int EXIT_REFRESH = 2;
    public static final int EXIT_REFRESH_TITLE = 3;

    private void startFileSelect() {
        startActivityForResult(new Intent(this, FileSelectActivity.class), 0);
    }

    protected void onActivityResult(int paramInt1, int paramInt2, Intent paramIntent) {
        super.onActivityResult(paramInt1, paramInt2, paramIntent);
        if (paramInt2 == 0) {
            finish();
        }
    }

    protected void onCreate(Bundle paramBundle) {
        super.onCreate(paramBundle);
    }

    protected void onDestroy() {
        super.onDestroy();
    }

    protected void onStart() {
        super.onStart();
        startFileSelect();
    }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/com/android/keepass/KeePass.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */