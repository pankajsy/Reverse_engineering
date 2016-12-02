package com.keepassdroid;

import android.content.Intent;
import com.keepassdroid.app.App;
import com.keepassdroid.database.PwDatabase;
import com.keepassdroid.database.PwEntry;
import com.keepassdroid.database.PwGroupId;
import com.keepassdroid.database.PwGroupIdV3;
import com.keepassdroid.database.PwGroupV3;
import com.keepassdroid.database.PwIconFactory;

public class EntryEditActivityV3
  extends EntryEditActivity
{
  protected static void putParentId(Intent paramIntent, String paramString, PwGroupV3 paramPwGroupV3)
  {
    paramIntent.putExtra(paramString, paramPwGroupV3.groupId);
  }
  
  protected PwGroupId getParentGroupId(Intent paramIntent, String paramString)
  {
    return new PwGroupIdV3(paramIntent.getIntExtra(paramString, -1));
  }
  
  protected PwEntry populateNewEntry(PwEntry paramPwEntry)
  {
    paramPwEntry = super.populateNewEntry(paramPwEntry);
    if (this.mSelectedIconID == -1)
    {
      if (this.mIsNew)
      {
        paramPwEntry.icon = App.getDB().pm.iconFactory.getIcon(0);
        return paramPwEntry;
      }
      paramPwEntry.icon = this.mEntry.icon;
      return paramPwEntry;
    }
    paramPwEntry.icon = App.getDB().pm.iconFactory.getIcon(this.mSelectedIconID);
    return paramPwEntry;
  }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/com/keepassdroid/EntryEditActivityV3.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */