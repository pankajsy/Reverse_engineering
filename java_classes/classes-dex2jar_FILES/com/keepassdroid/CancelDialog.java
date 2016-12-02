package com.keepassdroid;

import android.app.Dialog;
import android.content.Context;

public class CancelDialog
  extends Dialog
{
  private boolean mCanceled = false;
  
  public CancelDialog(Context paramContext)
  {
    super(paramContext);
  }
  
  public void cancel()
  {
    super.cancel();
    this.mCanceled = true;
  }
  
  public boolean canceled()
  {
    return this.mCanceled;
  }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/com/keepassdroid/CancelDialog.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */