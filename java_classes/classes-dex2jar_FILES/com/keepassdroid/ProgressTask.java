package com.keepassdroid;

import android.app.ProgressDialog;
import android.content.Context;
import android.os.Handler;
import com.keepassdroid.database.edit.OnFinish;
import com.keepassdroid.database.edit.RunnableOnFinish;

public class ProgressTask
  implements Runnable
{
  private Context mCtx;
  private Handler mHandler;
  private ProgressDialog mPd;
  private RunnableOnFinish mTask;
  
  public ProgressTask(Context paramContext, RunnableOnFinish paramRunnableOnFinish, int paramInt)
  {
    this.mCtx = paramContext;
    this.mTask = paramRunnableOnFinish;
    this.mHandler = new Handler();
    this.mPd = new ProgressDialog(this.mCtx);
    this.mPd.setCanceledOnTouchOutside(false);
    this.mPd.setTitle(paramContext.getText(2131099773));
    this.mPd.setMessage(paramContext.getText(paramInt));
    this.mTask.setStatus(new UpdateStatus(paramContext, this.mHandler, this.mPd));
    this.mTask.mFinish = new AfterTask(paramRunnableOnFinish.mFinish, this.mHandler);
  }
  
  public void run()
  {
    this.mPd.show();
    new Thread(this.mTask).start();
  }
  
  private class AfterTask
    extends OnFinish
  {
    public AfterTask(OnFinish paramOnFinish, Handler paramHandler)
    {
      super(paramHandler);
    }
    
    public void run()
    {
      super.run();
      this.mHandler.post(new ProgressTask.CloseProcessDialog(ProgressTask.this, null));
    }
  }
  
  private class CloseProcessDialog
    implements Runnable
  {
    private CloseProcessDialog() {}
    
    public void run()
    {
      ProgressTask.this.mPd.dismiss();
    }
  }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/com/keepassdroid/ProgressTask.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */