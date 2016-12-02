package com.keepassdroid;

import android.app.ProgressDialog;
import android.content.Context;
import android.os.Handler;

public class UpdateStatus
{
  private Context mCtx;
  private Handler mHandler;
  private ProgressDialog mPD;
  
  public UpdateStatus() {}
  
  public UpdateStatus(Context paramContext, Handler paramHandler, ProgressDialog paramProgressDialog)
  {
    this.mCtx = paramContext;
    this.mPD = paramProgressDialog;
    this.mHandler = paramHandler;
  }
  
  public void updateMessage(int paramInt)
  {
    if ((this.mCtx != null) && (this.mPD != null) && (this.mHandler != null)) {
      this.mHandler.post(new UpdateMessage(paramInt));
    }
  }
  
  private class UpdateMessage
    implements Runnable
  {
    private int mResId;
    
    public UpdateMessage(int paramInt)
    {
      this.mResId = paramInt;
    }
    
    public void run()
    {
      UpdateStatus.this.mPD.setMessage(UpdateStatus.this.mCtx.getString(this.mResId));
    }
  }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/com/keepassdroid/UpdateStatus.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */