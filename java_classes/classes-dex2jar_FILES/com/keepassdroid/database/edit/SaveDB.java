package com.keepassdroid.database.edit;

import android.content.Context;
import com.keepassdroid.Database;
import com.keepassdroid.database.exception.PwDbOutputException;
import java.io.IOException;

public class SaveDB
  extends RunnableOnFinish
{
  private Context mCtx;
  private Database mDb;
  private boolean mDontSave;
  
  public SaveDB(Context paramContext, Database paramDatabase, OnFinish paramOnFinish)
  {
    super(paramOnFinish);
    this.mDb = paramDatabase;
    this.mDontSave = false;
    this.mCtx = paramContext;
  }
  
  public SaveDB(Context paramContext, Database paramDatabase, OnFinish paramOnFinish, boolean paramBoolean)
  {
    super(paramOnFinish);
    this.mDb = paramDatabase;
    this.mDontSave = paramBoolean;
    this.mCtx = paramContext;
  }
  
  public void run()
  {
    if (!this.mDontSave) {}
    try
    {
      this.mDb.SaveData(this.mCtx);
      finish(true);
      return;
    }
    catch (IOException localIOException)
    {
      finish(false, localIOException.getMessage());
      return;
    }
    catch (PwDbOutputException localPwDbOutputException)
    {
      throw new RuntimeException(localPwDbOutputException);
    }
  }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/com/keepassdroid/database/edit/SaveDB.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */