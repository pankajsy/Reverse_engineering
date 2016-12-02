package com.keepassdroid;

import android.content.SharedPreferences;
import android.content.res.Resources;
import android.preference.PreferenceManager;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import com.keepassdroid.database.PwEntry;
import com.keepassdroid.database.PwEntry.EntryNameComparator;
import com.keepassdroid.database.PwGroup;
import com.keepassdroid.database.PwGroup.GroupNameComparator;
import com.keepassdroid.view.PwEntryView;
import com.keepassdroid.view.PwGroupView;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

public class PwGroupListAdapter
  extends BaseAdapter
{
  private List<PwEntry> entriesForViewing;
  private Comparator<PwEntry> entryComp = new PwEntry.EntryNameComparator();
  private Comparator<PwGroup> groupComp = new PwGroup.GroupNameComparator();
  private List<PwGroup> groupsForViewing;
  private GroupBaseActivity mAct;
  private PwGroup mGroup;
  private SharedPreferences prefs;
  
  public PwGroupListAdapter(GroupBaseActivity paramGroupBaseActivity, PwGroup paramPwGroup)
  {
    this.mAct = paramGroupBaseActivity;
    this.mGroup = paramPwGroup;
    this.prefs = PreferenceManager.getDefaultSharedPreferences(paramGroupBaseActivity);
    filterAndSort();
  }
  
  private PwEntryView createEntryView(int paramInt, View paramView)
  {
    PwEntry localPwEntry = (PwEntry)this.entriesForViewing.get(paramInt);
    if ((paramView == null) || (!(paramView instanceof PwEntryView))) {
      return PwEntryView.getInstance(this.mAct, localPwEntry, paramInt);
    }
    paramView = (PwEntryView)paramView;
    paramView.convertView(localPwEntry, paramInt);
    return paramView;
  }
  
  private View createGroupView(int paramInt, View paramView)
  {
    PwGroup localPwGroup = (PwGroup)this.groupsForViewing.get(paramInt);
    if ((paramView == null) || (!(paramView instanceof PwGroupView))) {
      return PwGroupView.getInstance(this.mAct, localPwGroup);
    }
    paramView = (PwGroupView)paramView;
    paramView.convertView(localPwGroup);
    return paramView;
  }
  
  private void filterAndSort()
  {
    this.entriesForViewing = new ArrayList();
    int i = 0;
    while (i < this.mGroup.childEntries.size())
    {
      PwEntry localPwEntry = (PwEntry)this.mGroup.childEntries.get(i);
      if (!localPwEntry.isMetaStream()) {
        this.entriesForViewing.add(localPwEntry);
      }
      i += 1;
    }
    if (this.prefs.getBoolean(this.mAct.getString(2131099850), this.mAct.getResources().getBoolean(2131230725)))
    {
      this.groupsForViewing = new ArrayList(this.mGroup.childGroups);
      Collections.sort(this.entriesForViewing, this.entryComp);
      Collections.sort(this.groupsForViewing, this.groupComp);
      return;
    }
    this.groupsForViewing = this.mGroup.childGroups;
  }
  
  public int getCount()
  {
    return this.groupsForViewing.size() + this.entriesForViewing.size();
  }
  
  public Object getItem(int paramInt)
  {
    return Integer.valueOf(paramInt);
  }
  
  public long getItemId(int paramInt)
  {
    return paramInt;
  }
  
  public View getView(int paramInt, View paramView, ViewGroup paramViewGroup)
  {
    int i = this.groupsForViewing.size();
    if (paramInt < i) {
      return createGroupView(paramInt, paramView);
    }
    return createEntryView(paramInt - i, paramView);
  }
  
  public void notifyDataSetChanged()
  {
    super.notifyDataSetChanged();
    filterAndSort();
  }
  
  public void notifyDataSetInvalidated()
  {
    super.notifyDataSetInvalidated();
    filterAndSort();
  }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/com/keepassdroid/PwGroupListAdapter.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */