package com.keepassdroid.database.edit;

import android.content.Context;
import android.net.Uri.Builder;
import com.keepassdroid.Database;
import com.keepassdroid.app.App;
import com.keepassdroid.database.PwDatabase;
import com.keepassdroid.utils.UriUtil;

public class CreateDB
  extends RunnableOnFinish
{
  private final int DEFAULT_ENCRYPTION_ROUNDS = 300;
  private Context ctx;
  private boolean mDontSave;
  private String mFilename;
  
  public CreateDB(Context paramContext, String paramString, OnFinish paramOnFinish, boolean paramBoolean)
  {
    super(paramOnFinish);
    this.mFilename = paramString;
    this.mDontSave = paramBoolean;
    this.ctx = paramContext;
  }
  
  public void run()
  {
    Object localObject = new Database();
    App.setDB((Database)localObject);
    PwDatabase localPwDatabase = PwDatabase.getNewDBInstance(this.mFilename);
    localPwDatabase.initNew(this.mFilename);
    ((Database)localObject).pm = localPwDatabase;
    new Uri.Builder();
    ((Database)localObject).mUri = UriUtil.parseDefaultFile(this.mFilename);
    ((Database)localObject).setLoaded();
    App.clearShutdown();
    localObject = new SaveDB(this.ctx, (Database)localObject, this.mFinish, this.mDontSave);
    this.mFinish = null;
    ((SaveDB)localObject).run();
  }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/com/keepassdroid/database/edit/CreateDB.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */