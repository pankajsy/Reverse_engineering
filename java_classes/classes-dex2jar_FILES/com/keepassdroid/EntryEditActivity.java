package com.keepassdroid;

import android.app.Activity;
import android.content.ActivityNotFoundException;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.res.Resources;
import android.os.Bundle;
import android.os.Handler;
import android.preference.PreferenceManager;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ImageButton;
import android.widget.ImageView;
import android.widget.TextView;
import android.widget.Toast;
import com.keepassdroid.app.App;
import com.keepassdroid.database.PwDatabase;
import com.keepassdroid.database.PwEntry;
import com.keepassdroid.database.PwEntryV3;
import com.keepassdroid.database.PwEntryV4;
import com.keepassdroid.database.PwGroup;
import com.keepassdroid.database.PwGroupId;
import com.keepassdroid.database.PwGroupV3;
import com.keepassdroid.database.PwGroupV4;
import com.keepassdroid.database.edit.AddEntry;
import com.keepassdroid.database.edit.OnFinish;
import com.keepassdroid.database.edit.UpdateEntry;
import com.keepassdroid.icons.DrawableFactory;
import com.keepassdroid.icons.Icons;
import com.keepassdroid.utils.Types;
import com.keepassdroid.utils.Util;
import java.util.Calendar;
import java.util.Date;
import java.util.Map;

public abstract class EntryEditActivity
  extends LockCloseHideActivity
{
  public static final String KEY_ENTRY = "entry";
  public static final String KEY_PARENT = "parent";
  public static final int RESULT_OK_ICON_PICKER = 1000;
  public static final int RESULT_OK_PASSWORD_GENERATOR = 1001;
  protected PwEntry mEntry;
  protected boolean mIsNew;
  protected int mSelectedIconID = -1;
  private boolean mShowPassword = false;
  
  static
  {
    if (!EntryEditActivity.class.desiredAssertionStatus()) {}
    for (boolean bool = true;; bool = false)
    {
      $assertionsDisabled = bool;
      return;
    }
  }
  
  public static void Launch(Activity paramActivity, PwEntry paramPwEntry)
  {
    if ((paramPwEntry instanceof PwEntryV3)) {}
    for (Intent localIntent = new Intent(paramActivity, EntryEditActivityV3.class);; localIntent = new Intent(paramActivity, EntryEditActivityV4.class))
    {
      localIntent.putExtra("entry", Types.UUIDtoBytes(paramPwEntry.getUUID()));
      paramActivity.startActivityForResult(localIntent, 0);
      return;
      if (!(paramPwEntry instanceof PwEntryV4)) {
        break;
      }
    }
    throw new RuntimeException("Not yet implemented.");
  }
  
  public static void Launch(Activity paramActivity, PwGroup paramPwGroup)
  {
    Intent localIntent;
    if ((paramPwGroup instanceof PwGroupV3))
    {
      localIntent = new Intent(paramActivity, EntryEditActivityV3.class);
      EntryEditActivityV3.putParentId(localIntent, "parent", (PwGroupV3)paramPwGroup);
    }
    for (paramPwGroup = localIntent;; paramPwGroup = localIntent)
    {
      paramActivity.startActivityForResult(paramPwGroup, 0);
      return;
      if (!(paramPwGroup instanceof PwGroupV4)) {
        break;
      }
      localIntent = new Intent(paramActivity, EntryEditActivityV4.class);
      EntryEditActivityV4.putParentId(localIntent, "parent", (PwGroupV4)paramPwGroup);
    }
    throw new RuntimeException("Not yet implemented.");
  }
  
  private void populateText(int paramInt, String paramString)
  {
    ((TextView)findViewById(paramInt)).setText(paramString);
  }
  
  private void setPasswordStyle()
  {
    TextView localTextView1 = (TextView)findViewById(2131427361);
    TextView localTextView2 = (TextView)findViewById(2131427364);
    if (this.mShowPassword)
    {
      localTextView1.setInputType(145);
      localTextView2.setInputType(145);
      return;
    }
    localTextView1.setInputType(129);
    localTextView2.setInputType(129);
  }
  
  protected void fillData()
  {
    Object localObject = (ImageButton)findViewById(2131427350);
    App.getDB().drawFactory.assignDrawableTo((ImageView)localObject, getResources(), this.mEntry.getIcon());
    populateText(2131427351, this.mEntry.getTitle());
    populateText(2131427354, this.mEntry.getUsername());
    populateText(2131427357, this.mEntry.getUrl());
    localObject = new String(this.mEntry.getPassword());
    populateText(2131427361, (String)localObject);
    populateText(2131427364, (String)localObject);
    setPasswordStyle();
    populateText(2131427367, this.mEntry.getNotes());
  }
  
  protected abstract PwGroupId getParentGroupId(Intent paramIntent, String paramString);
  
  protected void onActivityResult(int paramInt1, int paramInt2, Intent paramIntent)
  {
    switch (paramInt2)
    {
    default: 
      return;
    case 1000: 
      this.mSelectedIconID = paramIntent.getExtras().getInt("icon_id");
      ((ImageButton)findViewById(2131427350)).setImageResource(Icons.iconToResId(this.mSelectedIconID));
      return;
    }
    paramIntent = paramIntent.getStringExtra("com.keepassdroid.password.generated_password");
    EditText localEditText1 = (EditText)findViewById(2131427361);
    EditText localEditText2 = (EditText)findViewById(2131427364);
    localEditText1.setText(paramIntent);
    localEditText2.setText(paramIntent);
  }
  
  protected void onCreate(Bundle paramBundle)
  {
    if (!PreferenceManager.getDefaultSharedPreferences(this).getBoolean(getString(2131099841), getResources().getBoolean(2131230721))) {}
    for (boolean bool = true;; bool = false)
    {
      this.mShowPassword = bool;
      super.onCreate(paramBundle);
      setContentView(2130903043);
      setResult(0);
      paramBundle = App.getDB();
      if (paramBundle.Loaded()) {
        break;
      }
      finish();
      return;
    }
    Object localObject = getIntent();
    byte[] arrayOfByte = ((Intent)localObject).getByteArrayExtra("entry");
    paramBundle = paramBundle.pm;
    if (arrayOfByte == null)
    {
      localObject = getParentGroupId((Intent)localObject, "parent");
      this.mEntry = PwEntry.getInstance((PwGroup)paramBundle.groups.get(localObject));
      this.mIsNew = true;
    }
    for (;;)
    {
      findViewById(2131427348).setScrollBarStyle(16777216);
      ((ImageButton)findViewById(2131427350)).setOnClickListener(new View.OnClickListener()
      {
        public void onClick(View paramAnonymousView)
        {
          IconPickerActivity.Launch(EntryEditActivity.this);
        }
      });
      ((Button)findViewById(2131427360)).setOnClickListener(new View.OnClickListener()
      {
        public void onClick(View paramAnonymousView)
        {
          GeneratePasswordActivity.Launch(EntryEditActivity.this);
        }
      });
      ((Button)findViewById(2131427345)).setOnClickListener(new View.OnClickListener()
      {
        public void onClick(View paramAnonymousView)
        {
          EntryEditActivity localEntryEditActivity = EntryEditActivity.this;
          if (!EntryEditActivity.this.validateBeforeSaving()) {
            return;
          }
          paramAnonymousView = EntryEditActivity.this.populateNewEntry();
          EntryEditActivity.AfterSave localAfterSave;
          if (paramAnonymousView.getTitle().equals(EntryEditActivity.this.mEntry.getTitle()))
          {
            EntryEditActivity.this.setResult(2);
            localEntryEditActivity.getClass();
            localAfterSave = new EntryEditActivity.AfterSave(localEntryEditActivity, new Handler());
            if (!EntryEditActivity.this.mIsNew) {
              break label122;
            }
          }
          label122:
          for (paramAnonymousView = AddEntry.getInstance(EntryEditActivity.this, App.getDB(), paramAnonymousView, localAfterSave);; paramAnonymousView = new UpdateEntry(EntryEditActivity.this, App.getDB(), EntryEditActivity.this.mEntry, paramAnonymousView, localAfterSave))
          {
            new ProgressTask(localEntryEditActivity, paramAnonymousView, 2131099782).run();
            return;
            EntryEditActivity.this.setResult(3);
            break;
          }
        }
      });
      ((Button)findViewById(2131427346)).setOnClickListener(new View.OnClickListener()
      {
        public void onClick(View paramAnonymousView)
        {
          EntryEditActivity.this.finish();
        }
      });
      if (!this.mShowPassword) {
        break;
      }
      paramBundle = (EditText)findViewById(2131427361);
      localObject = (EditText)findViewById(2131427364);
      paramBundle.setInputType(145);
      ((EditText)localObject).setInputType(145);
      return;
      localObject = Types.bytestoUUID(arrayOfByte);
      assert (localObject != null);
      this.mEntry = ((PwEntry)paramBundle.entries.get(localObject));
      this.mIsNew = false;
      fillData();
    }
  }
  
  public boolean onCreateOptionsMenu(Menu paramMenu)
  {
    super.onCreateOptionsMenu(paramMenu);
    getMenuInflater().inflate(2131361793, paramMenu);
    paramMenu = paramMenu.findItem(2131427443);
    if (this.mShowPassword) {
      paramMenu.setTitle(2131099754);
    }
    for (;;)
    {
      return true;
      paramMenu.setTitle(2131099760);
    }
  }
  
  public boolean onOptionsItemSelected(MenuItem paramMenuItem)
  {
    switch (paramMenuItem.getItemId())
    {
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
    }
    if (this.mShowPassword) {
      paramMenuItem.setTitle(2131099760);
    }
    for (this.mShowPassword = false;; this.mShowPassword = true)
    {
      setPasswordStyle();
      return true;
      paramMenuItem.setTitle(2131099754);
    }
  }
  
  protected PwEntry populateNewEntry()
  {
    return populateNewEntry(null);
  }
  
  protected PwEntry populateNewEntry(PwEntry paramPwEntry)
  {
    if (paramPwEntry == null) {
      paramPwEntry = this.mEntry.clone(true);
    }
    for (;;)
    {
      Object localObject = Calendar.getInstance().getTime();
      paramPwEntry.setLastAccessTime((Date)localObject);
      paramPwEntry.setLastModificationTime((Date)localObject);
      localObject = App.getDB().pm;
      paramPwEntry.setTitle(Util.getEditText(this, 2131427351), (PwDatabase)localObject);
      paramPwEntry.setUrl(Util.getEditText(this, 2131427357), (PwDatabase)localObject);
      paramPwEntry.setUsername(Util.getEditText(this, 2131427354), (PwDatabase)localObject);
      paramPwEntry.setNotes(Util.getEditText(this, 2131427367), (PwDatabase)localObject);
      paramPwEntry.setPassword(Util.getEditText(this, 2131427361), (PwDatabase)localObject);
      return paramPwEntry;
    }
  }
  
  protected boolean validateBeforeSaving()
  {
    if (Util.getEditText(this, 2131427351).length() == 0)
    {
      Toast.makeText(this, 2131099718, 1).show();
      return false;
    }
    if (!Util.getEditText(this, 2131427361).equals(Util.getEditText(this, 2131427364)))
    {
      Toast.makeText(this, 2131099715, 1).show();
      return false;
    }
    return true;
  }
  
  private final class AfterSave
    extends OnFinish
  {
    public AfterSave(Handler paramHandler)
    {
      super();
    }
    
    public void run()
    {
      if (this.mSuccess)
      {
        EntryEditActivity.this.finish();
        return;
      }
      displayMessage(EntryEditActivity.this);
    }
  }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/com/keepassdroid/EntryEditActivity.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */