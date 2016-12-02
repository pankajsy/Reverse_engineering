package com.keepassdroid;

import android.app.Activity;
import android.app.Dialog;
import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.os.Handler;
import android.preference.PreferenceManager;
import android.util.Log;
import android.view.ContextMenu;
import android.view.ContextMenu.ContextMenuInfo;
import android.view.MenuItem;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.AdapterView.AdapterContextMenuInfo;
import android.widget.Button;
import com.keepassdroid.app.App;
import com.keepassdroid.database.PwDatabase;
import com.keepassdroid.database.PwDatabaseV3;
import com.keepassdroid.database.PwDatabaseV4;
import com.keepassdroid.database.PwGroup;
import com.keepassdroid.database.PwGroupId;
import com.keepassdroid.database.PwGroupV3;
import com.keepassdroid.database.PwGroupV4;
import com.keepassdroid.database.edit.AddGroup;
import com.keepassdroid.dialog.ReadOnlyDialog;
import com.keepassdroid.view.ClickView;
import com.keepassdroid.view.GroupAddEntryView;
import com.keepassdroid.view.GroupRootView;
import com.keepassdroid.view.GroupViewOnlyView;
import java.util.Map;
import java.util.UUID;

public abstract class GroupActivity
  extends GroupBaseActivity
{
  private static final String TAG = "Group Activity:";
  public static final int UNINIT = -1;
  protected boolean addEntryEnabled = false;
  protected boolean addGroupEnabled = false;
  protected boolean isRoot = false;
  protected boolean readOnly = false;
  
  public static void Launch(Activity paramActivity)
  {
    Launch(paramActivity, null);
  }
  
  public static void Launch(Activity paramActivity, PwGroup paramPwGroup)
  {
    Object localObject = App.getDB().pm;
    Intent localIntent;
    if ((localObject instanceof PwDatabaseV3))
    {
      localIntent = new Intent(paramActivity, GroupActivityV3.class);
      localObject = localIntent;
      if (paramPwGroup != null)
      {
        localIntent.putExtra("entry", ((PwGroupV3)paramPwGroup).groupId);
        localObject = localIntent;
      }
    }
    for (;;)
    {
      paramActivity.startActivityForResult((Intent)localObject, 0);
      return;
      if (!(localObject instanceof PwDatabaseV4)) {
        break;
      }
      localIntent = new Intent(paramActivity, GroupActivityV4.class);
      localObject = localIntent;
      if (paramPwGroup != null)
      {
        localIntent.putExtra("entry", ((PwGroupV4)paramPwGroup).uuid.toString());
        localObject = localIntent;
      }
    }
    Log.d("Group Activity:", "Tried to launch with null db");
  }
  
  protected void onActivityResult(int paramInt1, int paramInt2, Intent paramIntent)
  {
    switch (paramInt2)
    {
    default: 
      return;
    }
    String str = paramIntent.getExtras().getString("name");
    paramInt1 = paramIntent.getExtras().getInt("icon_id");
    paramIntent = new Handler();
    Database localDatabase = App.getDB();
    PwGroup localPwGroup = this.mGroup;
    getClass();
    new ProgressTask(this, AddGroup.getInstance(this, localDatabase, str, paramInt1, localPwGroup, new GroupBaseActivity.RefreshTask(this, paramIntent), false), 2131099782).run();
  }
  
  public boolean onContextItemSelected(MenuItem paramMenuItem)
  {
    return ((ClickView)((AdapterView.AdapterContextMenuInfo)paramMenuItem.getMenuInfo()).targetView).onContextItemSelected(paramMenuItem);
  }
  
  protected void onCreate(Bundle paramBundle)
  {
    super.onCreate(paramBundle);
    if (isFinishing()) {
      return;
    }
    setResult(0);
    Log.w("Group Activity:", "Creating group view");
    paramBundle = retrieveGroupId(getIntent());
    Database localDatabase = App.getDB();
    this.readOnly = localDatabase.readOnly;
    PwGroup localPwGroup = localDatabase.pm.rootGroup;
    if (paramBundle == null) {}
    for (this.mGroup = localPwGroup;; this.mGroup = ((PwGroup)localDatabase.pm.groups.get(paramBundle)))
    {
      Log.w("Group Activity:", "Retrieved group");
      if (this.mGroup != null) {
        break;
      }
      Log.w("Group Activity:", "Group was null");
      return;
    }
    boolean bool;
    if (this.mGroup == localPwGroup)
    {
      bool = true;
      label124:
      this.isRoot = bool;
      setupButtons();
      if ((!this.addGroupEnabled) || (!this.addEntryEnabled)) {
        break label279;
      }
      setContentView(new GroupAddEntryView(this));
    }
    for (;;)
    {
      Log.w("Group Activity:", "Set view");
      if (this.addGroupEnabled) {
        ((Button)findViewById(2131427421)).setOnClickListener(new View.OnClickListener()
        {
          public void onClick(View paramAnonymousView)
          {
            GroupEditActivity.Launch(GroupActivity.this);
          }
        });
      }
      if (this.addEntryEnabled) {
        ((Button)findViewById(2131427422)).setOnClickListener(new View.OnClickListener()
        {
          public void onClick(View paramAnonymousView)
          {
            EntryEditActivity.Launch(GroupActivity.this, GroupActivity.this.mGroup);
          }
        });
      }
      setGroupTitle();
      setGroupIcon();
      setListAdapter(new PwGroupListAdapter(this, this.mGroup));
      registerForContextMenu(getListView());
      Log.w("Group Activity:", "Finished creating group");
      if (!this.isRoot) {
        break;
      }
      showWarnings();
      return;
      bool = false;
      break label124;
      label279:
      if (this.addGroupEnabled)
      {
        setContentView(new GroupRootView(this));
      }
      else if (this.addEntryEnabled)
      {
        setContentView(new GroupAddEntryView(this));
        ((Button)findViewById(2131427421)).setVisibility(8);
      }
      else
      {
        setContentView(new GroupViewOnlyView(this));
      }
    }
  }
  
  public void onCreateContextMenu(ContextMenu paramContextMenu, View paramView, ContextMenu.ContextMenuInfo paramContextMenuInfo)
  {
    ((ClickView)((AdapterView.AdapterContextMenuInfo)paramContextMenuInfo).targetView).onCreateMenu(paramContextMenu, paramContextMenuInfo);
  }
  
  protected abstract PwGroupId retrieveGroupId(Intent paramIntent);
  
  protected void setupButtons()
  {
    if (!this.readOnly) {}
    for (boolean bool = true;; bool = false)
    {
      this.addGroupEnabled = bool;
      return;
    }
  }
  
  protected void showWarnings()
  {
    if ((App.getDB().readOnly) && (PreferenceManager.getDefaultSharedPreferences(this).getBoolean(getString(2131099849), true))) {
      new ReadOnlyDialog(this).show();
    }
  }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/com/keepassdroid/GroupActivity.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */