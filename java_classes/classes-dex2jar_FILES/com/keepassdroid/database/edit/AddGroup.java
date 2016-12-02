package com.keepassdroid.database.edit;

import android.content.Context;
import com.keepassdroid.Database;
import com.keepassdroid.database.PwDatabase;
import com.keepassdroid.database.PwGroup;
import com.keepassdroid.database.PwIconFactory;
import java.util.Set;

public class AddGroup
  extends RunnableOnFinish
{
  private Context ctx;
  protected Database mDb;
  protected boolean mDontSave;
  private PwGroup mGroup;
  private int mIconID;
  private String mName;
  private PwGroup mParent;
  
  private AddGroup(Context paramContext, Database paramDatabase, String paramString, int paramInt, PwGroup paramPwGroup, OnFinish paramOnFinish, boolean paramBoolean)
  {
    super(paramOnFinish);
    this.mDb = paramDatabase;
    this.mName = paramString;
    this.mIconID = paramInt;
    this.mParent = paramPwGroup;
    this.mDontSave = paramBoolean;
    this.ctx = paramContext;
    this.mFinish = new AfterAdd(this.mFinish);
  }
  
  public static AddGroup getInstance(Context paramContext, Database paramDatabase, String paramString, int paramInt, PwGroup paramPwGroup, OnFinish paramOnFinish, boolean paramBoolean)
  {
    return new AddGroup(paramContext, paramDatabase, paramString, paramInt, paramPwGroup, paramOnFinish, paramBoolean);
  }
  
  public void run()
  {
    PwDatabase localPwDatabase = this.mDb.pm;
    this.mGroup = localPwDatabase.createGroup();
    this.mGroup.initNewGroup(this.mName, localPwDatabase.newGroupId());
    this.mGroup.icon = this.mDb.pm.iconFactory.getIcon(this.mIconID);
    localPwDatabase.addGroupTo(this.mGroup, this.mParent);
    new SaveDB(this.ctx, this.mDb, this.mFinish, this.mDontSave).run();
  }
  
  private class AfterAdd
    extends OnFinish
  {
    public AfterAdd(OnFinish paramOnFinish)
    {
      super();
    }
    
    public void run()
    {
      PwDatabase localPwDatabase = AddGroup.this.mDb.pm;
      if (this.mSuccess) {
        AddGroup.this.mDb.dirty.add(AddGroup.this.mParent);
      }
      for (;;)
      {
        super.run();
        return;
        localPwDatabase.removeGroupFrom(AddGroup.this.mGroup, AddGroup.this.mParent);
      }
    }
  }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/com/keepassdroid/database/edit/AddGroup.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */