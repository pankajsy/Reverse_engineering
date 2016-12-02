package com.keepassdroid.database.edit;

import com.keepassdroid.UpdateStatus;

public abstract class RunnableOnFinish
        implements Runnable {
    public OnFinish mFinish;
    public UpdateStatus mStatus;

    public RunnableOnFinish(OnFinish paramOnFinish) {
        this.mFinish = paramOnFinish;
    }

    protected void finish(boolean paramBoolean) {
        if (this.mFinish != null) {
            this.mFinish.setResult(paramBoolean);
            this.mFinish.run();
        }
    }

    protected void finish(boolean paramBoolean, String paramString) {
        if (this.mFinish != null) {
            this.mFinish.setResult(paramBoolean, paramString);
            this.mFinish.run();
        }
    }

    public abstract void run();

    public void setStatus(UpdateStatus paramUpdateStatus) {
        this.mStatus = paramUpdateStatus;
    }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/com/keepassdroid/database/edit/RunnableOnFinish.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */