package com.keepassdroid.database.edit;

import android.content.Context;
import android.os.Handler;
import android.widget.Toast;

public class OnFinish
        implements Runnable {
    protected Handler mHandler;
    protected String mMessage;
    protected OnFinish mOnFinish;
    protected boolean mSuccess;

    public OnFinish() {
    }

    public OnFinish(Handler paramHandler) {
        this.mOnFinish = null;
        this.mHandler = paramHandler;
    }

    public OnFinish(OnFinish paramOnFinish) {
        this.mOnFinish = paramOnFinish;
        this.mHandler = null;
    }

    public OnFinish(OnFinish paramOnFinish, Handler paramHandler) {
        this.mOnFinish = paramOnFinish;
        this.mHandler = paramHandler;
    }

    protected void displayMessage(Context paramContext) {
        if ((this.mMessage != null) && (this.mMessage.length() > 0)) {
            Toast.makeText(paramContext, this.mMessage, 1).show();
        }
    }

    public void run() {
        if (this.mOnFinish != null) {
            this.mOnFinish.setResult(this.mSuccess, this.mMessage);
            if (this.mHandler != null) {
                this.mHandler.post(this.mOnFinish);
            }
        } else {
            return;
        }
        this.mOnFinish.run();
    }

    public void setResult(boolean paramBoolean) {
        this.mSuccess = paramBoolean;
    }

    public void setResult(boolean paramBoolean, String paramString) {
        this.mSuccess = paramBoolean;
        this.mMessage = paramString;
    }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/com/keepassdroid/database/edit/OnFinish.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */