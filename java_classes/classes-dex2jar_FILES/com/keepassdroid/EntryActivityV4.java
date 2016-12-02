package com.keepassdroid;

import android.view.ViewGroup;
import com.keepassdroid.app.App;
import com.keepassdroid.database.PwDatabase;
import com.keepassdroid.database.PwEntryV4;
import com.keepassdroid.database.security.ProtectedString;
import com.keepassdroid.utils.SprEngine;
import com.keepassdroid.utils.SprEngineV4;
import com.keepassdroid.view.EntrySection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map.Entry;
import java.util.Set;

public class EntryActivityV4
  extends EntryActivity
{
  protected void fillData(boolean paramBoolean)
  {
    super.fillData(paramBoolean);
    ViewGroup localViewGroup = (ViewGroup)findViewById(2131427382);
    if (paramBoolean) {
      localViewGroup.removeAllViews();
    }
    PwEntryV4 localPwEntryV4 = (PwEntryV4)this.mEntry;
    PwDatabase localPwDatabase = App.getDB().pm;
    SprEngine localSprEngine = SprEngineV4.getInstance(localPwDatabase);
    if (localPwEntryV4.strings.size() > 0)
    {
      Iterator localIterator = localPwEntryV4.strings.entrySet().iterator();
      while (localIterator.hasNext())
      {
        Map.Entry localEntry = (Map.Entry)localIterator.next();
        String str = (String)localEntry.getKey();
        if (!PwEntryV4.IsStandardString(str)) {
          localViewGroup.addView(new EntrySection(this, null, str, localSprEngine.compile(((ProtectedString)localEntry.getValue()).toString(), localPwEntryV4, localPwDatabase)));
        }
      }
    }
  }
  
  protected void setEntryView()
  {
    setContentView(2130903049);
  }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/com/keepassdroid/EntryActivityV4.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */