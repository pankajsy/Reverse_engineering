package com.keepassdroid.view;

import android.os.Handler;
import android.view.ContextMenu;
import android.view.ContextMenu.ContextMenuInfo;
import android.view.MenuItem;
import com.keepassdroid.Database;
import com.keepassdroid.GroupBaseActivity;
import com.keepassdroid.GroupBaseActivity.AfterDeleteGroup;
import com.keepassdroid.ProgressTask;
import com.keepassdroid.app.App;
import com.keepassdroid.database.PwGroup;
import com.keepassdroid.database.edit.DeleteGroup;

public class PwGroupViewV3
  extends PwGroupView
{
  private static final int MENU_DELETE = 2;
  
  protected PwGroupViewV3(GroupBaseActivity paramGroupBaseActivity, PwGroup paramPwGroup)
  {
    super(paramGroupBaseActivity, paramPwGroup);
  }
  
  public boolean onContextItemSelected(MenuItem paramMenuItem)
  {
    if (!super.onContextItemSelected(paramMenuItem)) {}
    switch (paramMenuItem.getItemId())
    {
    default: 
      return false;
    }
    paramMenuItem = new Handler();
    Database localDatabase = App.getDB();
    PwGroup localPwGroup = this.mPw;
    GroupBaseActivity localGroupBaseActivity1 = this.mAct;
    GroupBaseActivity localGroupBaseActivity2 = this.mAct;
    localGroupBaseActivity2.getClass();
    paramMenuItem = new DeleteGroup(localDatabase, localPwGroup, localGroupBaseActivity1, new GroupBaseActivity.AfterDeleteGroup(localGroupBaseActivity2, paramMenuItem));
    new ProgressTask(this.mAct, paramMenuItem, 2131099782).run();
    return true;
  }
  
  public void onCreateMenu(ContextMenu paramContextMenu, ContextMenu.ContextMenuInfo paramContextMenuInfo)
  {
    super.onCreateMenu(paramContextMenu, paramContextMenuInfo);
    if (!this.readOnly) {
      paramContextMenu.add(0, 2, 0, 2131099751);
    }
  }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/com/keepassdroid/view/PwGroupViewV3.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */