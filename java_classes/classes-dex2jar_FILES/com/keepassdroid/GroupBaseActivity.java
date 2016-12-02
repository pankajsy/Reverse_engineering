package com.keepassdroid;

import android.content.ActivityNotFoundException;
import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import android.content.res.Resources;
import android.os.Bundle;
import android.os.Handler;
import android.preference.PreferenceManager;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.widget.BaseAdapter;
import android.widget.ImageView;
import android.widget.ListAdapter;
import android.widget.ListView;
import android.widget.TextView;
import android.widget.Toast;
import com.keepassdroid.app.App;
import com.keepassdroid.compat.ActivityCompat;
import com.keepassdroid.compat.EditorCompat;
import com.keepassdroid.database.PwGroup;
import com.keepassdroid.database.edit.OnFinish;
import com.keepassdroid.icons.DrawableFactory;
import com.keepassdroid.settings.AppSettingsActivity;
import com.keepassdroid.utils.Util;
import com.keepassdroid.view.ClickView;
import com.keepassdroid.view.GroupViewOnlyView;
import java.util.Set;

public abstract class GroupBaseActivity
  extends LockCloseListActivity
{
  public static final String KEY_ENTRY = "entry";
  public static final String KEY_MODE = "mode";
  protected PwGroup mGroup;
  private SharedPreferences prefs;
  
  private void setPassword()
  {
    new SetPasswordDialog(this).show();
  }
  
  private void setSortMenuText(Menu paramMenu)
  {
    boolean bool = false;
    if (this.prefs != null) {
      bool = this.prefs.getBoolean(getString(2131099850), getResources().getBoolean(2131230725));
    }
    if (bool) {}
    for (int i = 2131099787;; i = 2131099788)
    {
      paramMenu.findItem(2131427452).setTitle(i);
      return;
    }
  }
  
  private void toggleSort()
  {
    Object localObject = getString(2131099850);
    boolean bool = this.prefs.getBoolean((String)localObject, getResources().getBoolean(2131230725));
    SharedPreferences.Editor localEditor = this.prefs.edit();
    if (!bool) {}
    for (bool = true;; bool = false)
    {
      localEditor.putBoolean((String)localObject, bool);
      EditorCompat.apply(localEditor);
      ActivityCompat.invalidateOptionsMenu(this);
      localObject = App.getDB();
      ((Database)localObject).markAllGroupsAsDirty();
      ((Database)localObject).dirty.remove(this.mGroup);
      ((BaseAdapter)getListAdapter()).notifyDataSetChanged();
      return;
    }
  }
  
  protected void onCreate(Bundle paramBundle)
  {
    super.onCreate(paramBundle);
    if (!App.getDB().Loaded())
    {
      finish();
      return;
    }
    this.prefs = PreferenceManager.getDefaultSharedPreferences(this);
    ActivityCompat.invalidateOptionsMenu(this);
    setContentView(new GroupViewOnlyView(this));
    setResult(0);
    styleScrollBars();
  }
  
  public boolean onCreateOptionsMenu(Menu paramMenu)
  {
    super.onCreateOptionsMenu(paramMenu);
    getMenuInflater().inflate(2131361795, paramMenu);
    return true;
  }
  
  protected void onListItemClick(ListView paramListView, View paramView, int paramInt, long paramLong)
  {
    super.onListItemClick(paramListView, paramView, paramInt, paramLong);
    ((ClickView)getListAdapter().getView(paramInt, null, null)).onClick();
  }
  
  public boolean onOptionsItemSelected(MenuItem paramMenuItem)
  {
    switch (paramMenuItem.getItemId())
    {
    case 2131427443: 
    case 2131427444: 
    case 2131427445: 
    case 2131427446: 
    case 2131427449: 
    default: 
      return super.onOptionsItemSelected(paramMenuItem);
    case 2131427442: 
      try
      {
        Util.gotoUrl(this, 2131099830);
        return true;
      }
      catch (ActivityNotFoundException paramMenuItem)
      {
        Toast.makeText(this, 2131099706, 1).show();
        return false;
      }
    case 2131427447: 
      App.setShutdown();
      setResult(1);
      finish();
      return true;
    case 2131427450: 
      onSearchRequested();
      return true;
    case 2131427448: 
      AppSettingsActivity.Launch(this);
      return true;
    case 2131427451: 
      setPassword();
      return true;
    }
    toggleSort();
    return true;
  }
  
  public boolean onPrepareOptionsMenu(Menu paramMenu)
  {
    if (!super.onPrepareOptionsMenu(paramMenu)) {
      return false;
    }
    setSortMenuText(paramMenu);
    return true;
  }
  
  protected void onResume()
  {
    super.onResume();
    refreshIfDirty();
  }
  
  public void refreshIfDirty()
  {
    Database localDatabase = App.getDB();
    if (localDatabase.dirty.contains(this.mGroup))
    {
      localDatabase.dirty.remove(this.mGroup);
      ((BaseAdapter)getListAdapter()).notifyDataSetChanged();
    }
  }
  
  protected void setGroupIcon()
  {
    if (this.mGroup != null)
    {
      ImageView localImageView = (ImageView)findViewById(2131427426);
      App.getDB().drawFactory.assignDrawableTo(localImageView, getResources(), this.mGroup.getIcon());
    }
  }
  
  protected void setGroupTitle()
  {
    Object localObject;
    if (this.mGroup != null)
    {
      localObject = this.mGroup.getName();
      if ((localObject == null) || (((String)localObject).length() <= 0)) {
        break label47;
      }
      TextView localTextView = (TextView)findViewById(2131427423);
      if (localTextView != null) {
        localTextView.setText((CharSequence)localObject);
      }
    }
    label47:
    do
    {
      return;
      localObject = (TextView)findViewById(2131427423);
    } while (localObject == null);
    ((TextView)localObject).setText(getText(2131099778));
  }
  
  protected void styleScrollBars()
  {
    ListView localListView = getListView();
    localListView.setScrollBarStyle(16777216);
    localListView.setTextFilterEnabled(true);
  }
  
  public class AfterDeleteGroup
    extends OnFinish
  {
    public AfterDeleteGroup(Handler paramHandler)
    {
      super();
    }
    
    public void run()
    {
      if (this.mSuccess)
      {
        GroupBaseActivity.this.refreshIfDirty();
        return;
      }
      this.mHandler.post(new UIToastTask(GroupBaseActivity.this, "Unrecoverable error: " + this.mMessage));
      App.setShutdown();
      GroupBaseActivity.this.finish();
    }
  }
  
  public class RefreshTask
    extends OnFinish
  {
    public RefreshTask(Handler paramHandler)
    {
      super();
    }
    
    public void run()
    {
      if (this.mSuccess)
      {
        GroupBaseActivity.this.refreshIfDirty();
        return;
      }
      displayMessage(GroupBaseActivity.this);
    }
  }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/com/keepassdroid/GroupBaseActivity.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */