package com.keepassdroid;

import android.content.Intent;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.CheckBox;
import android.widget.ImageButton;
import android.widget.LinearLayout;
import android.widget.RelativeLayout.LayoutParams;
import android.widget.ScrollView;
import android.widget.TextView;
import android.widget.Toast;
import com.keepassdroid.app.App;
import com.keepassdroid.database.PwDatabaseV4;
import com.keepassdroid.database.PwEntry;
import com.keepassdroid.database.PwEntryV4;
import com.keepassdroid.database.PwGroupId;
import com.keepassdroid.database.PwGroupIdV4;
import com.keepassdroid.database.PwGroupV4;
import com.keepassdroid.database.security.ProtectedString;
import com.keepassdroid.utils.Types;
import com.keepassdroid.view.EntryEditSection;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

public class EntryEditActivityV4
  extends EntryEditActivity
{
  private LayoutInflater inflater;
  private ScrollView scroll;
  
  protected static void putParentId(Intent paramIntent, String paramString, PwGroupV4 paramPwGroupV4)
  {
    paramIntent.putExtra(paramString, Types.UUIDtoBytes(((PwGroupIdV4)paramPwGroupV4.getId()).getId()));
  }
  
  public void deleteAdvancedString(View paramView)
  {
    paramView = (EntryEditSection)paramView.getParent();
    LinearLayout localLinearLayout = (LinearLayout)findViewById(2131427369);
    int i = 0;
    for (;;)
    {
      if (i < localLinearLayout.getChildCount())
      {
        if ((EntryEditSection)localLinearLayout.getChildAt(i) == paramView)
        {
          localLinearLayout.removeViewAt(i);
          localLinearLayout.invalidate();
        }
      }
      else {
        return;
      }
      i += 1;
    }
  }
  
  protected void fillData()
  {
    super.fillData();
    Object localObject = (PwEntryV4)this.mEntry;
    LinearLayout localLinearLayout = (LinearLayout)findViewById(2131427369);
    if (((PwEntryV4)localObject).strings.size() > 0)
    {
      localObject = ((PwEntryV4)localObject).strings.entrySet().iterator();
      while (((Iterator)localObject).hasNext())
      {
        Map.Entry localEntry = (Map.Entry)((Iterator)localObject).next();
        String str = (String)localEntry.getKey();
        if (!PwEntryV4.IsStandardString(str))
        {
          EntryEditSection localEntryEditSection = (EntryEditSection)this.inflater.inflate(2130903044, localLinearLayout, false);
          localEntryEditSection.setData(str, (ProtectedString)localEntry.getValue());
          localLinearLayout.addView(localEntryEditSection);
        }
      }
    }
  }
  
  protected PwGroupId getParentGroupId(Intent paramIntent, String paramString)
  {
    return new PwGroupIdV4(Types.bytestoUUID(paramIntent.getByteArrayExtra(paramString)));
  }
  
  protected void onCreate(Bundle paramBundle)
  {
    this.inflater = ((LayoutInflater)getSystemService("layout_inflater"));
    super.onCreate(paramBundle);
    this.scroll = ((ScrollView)findViewById(2131427348));
    paramBundle = (ImageButton)findViewById(2131427370);
    paramBundle.setVisibility(0);
    paramBundle.setOnClickListener(new View.OnClickListener()
    {
      public void onClick(View paramAnonymousView)
      {
        paramAnonymousView = (LinearLayout)EntryEditActivityV4.this.findViewById(2131427369);
        EntryEditSection localEntryEditSection = (EntryEditSection)EntryEditActivityV4.this.inflater.inflate(2130903044, paramAnonymousView, false);
        localEntryEditSection.setData("", new ProtectedString(false, ""));
        paramAnonymousView.addView(localEntryEditSection);
        EntryEditActivityV4.this.scroll.post(new Runnable()
        {
          public void run()
          {
            EntryEditActivityV4.this.scroll.fullScroll(130);
          }
        });
      }
    });
    ((ImageButton)findViewById(2131427350)).setVisibility(8);
    ((RelativeLayout.LayoutParams)findViewById(2131427352).getLayoutParams()).addRule(3, 2131427351);
    ((RelativeLayout.LayoutParams)findViewById(2131427353).getLayoutParams()).addRule(3, 2131427352);
  }
  
  protected PwEntry populateNewEntry()
  {
    PwEntryV4 localPwEntryV4 = (PwEntryV4)this.mEntry.clone(true);
    localPwEntryV4.history = ((ArrayList)localPwEntryV4.history.clone());
    localPwEntryV4.createBackup((PwDatabaseV4)App.getDB().pm);
    localPwEntryV4 = (PwEntryV4)super.populateNewEntry(localPwEntryV4);
    HashMap localHashMap = localPwEntryV4.strings;
    Object localObject = localHashMap.entrySet().iterator();
    while (((Iterator)localObject).hasNext()) {
      if (!PwEntryV4.IsStandardString((String)((Map.Entry)((Iterator)localObject).next()).getKey())) {
        ((Iterator)localObject).remove();
      }
    }
    localObject = (LinearLayout)findViewById(2131427369);
    int i = 0;
    while (i < ((LinearLayout)localObject).getChildCount())
    {
      View localView = ((LinearLayout)localObject).getChildAt(i);
      String str1 = ((TextView)localView.findViewById(2131427371)).getText().toString();
      String str2 = ((TextView)localView.findViewById(2131427374)).getText().toString();
      localHashMap.put(str1, new ProtectedString(((CheckBox)localView.findViewById(2131427372)).isChecked(), str2));
      i += 1;
    }
    return localPwEntryV4;
  }
  
  protected boolean validateBeforeSaving()
  {
    if (!super.validateBeforeSaving()) {
      return false;
    }
    LinearLayout localLinearLayout = (LinearLayout)findViewById(2131427369);
    int i = 0;
    while (i < localLinearLayout.getChildCount())
    {
      CharSequence localCharSequence = ((TextView)((EntryEditSection)localLinearLayout.getChildAt(i)).findViewById(2131427371)).getText();
      if ((localCharSequence == null) || (localCharSequence.length() == 0))
      {
        Toast.makeText(this, 2131099804, 1).show();
        return false;
      }
      i += 1;
    }
    return true;
  }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/com/keepassdroid/EntryEditActivityV4.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */