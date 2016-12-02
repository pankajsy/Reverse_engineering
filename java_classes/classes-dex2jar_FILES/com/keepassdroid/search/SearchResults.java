package com.keepassdroid.search;

import android.content.Intent;
import android.os.Bundle;
import com.keepassdroid.Database;
import com.keepassdroid.GroupBaseActivity;
import com.keepassdroid.PwGroupListAdapter;
import com.keepassdroid.app.App;
import com.keepassdroid.database.PwGroup;
import com.keepassdroid.view.GroupEmptyView;
import com.keepassdroid.view.GroupViewOnlyView;
import java.util.List;

public class SearchResults
  extends GroupBaseActivity
{
  private Database mDb;
  
  private String getSearchStr(Intent paramIntent)
  {
    if ("android.intent.action.SEARCH".equals(paramIntent.getAction())) {
      return paramIntent.getStringExtra("query");
    }
    return "";
  }
  
  private void performSearch(String paramString)
  {
    query(paramString.trim());
  }
  
  private void query(String paramString)
  {
    this.mGroup = this.mDb.Search(paramString);
    if ((this.mGroup == null) || (this.mGroup.childEntries.size() < 1)) {
      setContentView(new GroupEmptyView(this));
    }
    for (;;)
    {
      setGroupTitle();
      setListAdapter(new PwGroupListAdapter(this, this.mGroup));
      return;
      setContentView(new GroupViewOnlyView(this));
    }
  }
  
  protected void onCreate(Bundle paramBundle)
  {
    super.onCreate(paramBundle);
    if (isFinishing()) {
      return;
    }
    setResult(0);
    this.mDb = App.getDB();
    if (!this.mDb.Loaded()) {
      finish();
    }
    performSearch(getSearchStr(getIntent()));
  }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/com/keepassdroid/search/SearchResults.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */