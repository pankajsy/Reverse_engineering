package com.keepassdroid;

import android.content.Context;
import android.widget.Toast;

public class UIToastTask
        implements Runnable {
    private Context mCtx;
    private String mText;

    public UIToastTask(Context paramContext, int paramInt) {
        this.mCtx = paramContext;
        this.mText = paramContext.getString(paramInt);
    }

    public UIToastTask(Context paramContext, String paramString) {
        this.mCtx = paramContext;
        this.mText = paramString;
    }

    public void run() {
        Toast.makeText(this.mCtx, this.mText, 1).show();
    }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/com/keepassdroid/UIToastTask.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */