package com.keepassdroid;

import android.content.Intent;
import com.keepassdroid.database.PwGroupId;
import com.keepassdroid.database.PwGroupIdV4;
import java.util.UUID;

public class GroupActivityV4
  extends GroupActivity
{
  protected PwGroupId retrieveGroupId(Intent paramIntent)
  {
    paramIntent = paramIntent.getStringExtra("entry");
    if ((paramIntent == null) || (paramIntent.length() == 0)) {
      return null;
    }
    return new PwGroupIdV4(UUID.fromString(paramIntent));
  }
  
  protected void setupButtons()
  {
    super.setupButtons();
    if (!this.readOnly) {}
    for (boolean bool = true;; bool = false)
    {
      this.addEntryEnabled = bool;
      return;
    }
  }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/com/keepassdroid/GroupActivityV4.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */