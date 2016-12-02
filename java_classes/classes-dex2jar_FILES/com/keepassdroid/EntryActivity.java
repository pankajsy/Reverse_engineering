package com.keepassdroid;

import android.app.Activity;
import android.app.AlertDialog.Builder;
import android.app.Notification;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.content.ActivityNotFoundException;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.SharedPreferences;
import android.content.res.Resources;
import android.os.Bundle;
import android.os.Handler;
import android.preference.PreferenceManager;
import android.text.SpannableString;
import android.text.method.LinkMovementMethod;
import android.text.method.PasswordTransformationMethod;
import android.text.util.Linkify;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.TextView;
import android.widget.Toast;
import com.keepassdroid.app.App;
import com.keepassdroid.compat.ActivityCompat;
import com.keepassdroid.database.PwDatabase;
import com.keepassdroid.database.PwEntry;
import com.keepassdroid.database.PwEntryV4;
import com.keepassdroid.database.exception.SamsungClipboardException;
import com.keepassdroid.icons.DrawableFactory;
import com.keepassdroid.utils.EmptyUtils;
import com.keepassdroid.utils.Types;
import com.keepassdroid.utils.Util;
import java.util.Date;
import java.util.Map;
import java.util.Timer;
import java.util.TimerTask;
import java.util.UUID;

public class EntryActivity
  extends LockCloseHideActivity
{
  public static final String KEY_ENTRY = "entry";
  public static final String KEY_REFRESH_POS = "refresh_pos";
  public static final int NOTIFY_PASSWORD = 2;
  public static final int NOTIFY_USERNAME = 1;
  private java.text.DateFormat dateFormat;
  protected PwEntry mEntry;
  private BroadcastReceiver mIntentReceiver;
  private NotificationManager mNM;
  private int mPos;
  private boolean mShowPassword;
  private Timer mTimer = new Timer();
  protected boolean readOnly = false;
  private java.text.DateFormat timeFormat;
  final Handler uiThreadCallback = new Handler();
  
  static
  {
    if (!EntryActivity.class.desiredAssertionStatus()) {}
    for (boolean bool = true;; bool = false)
    {
      $assertionsDisabled = bool;
      return;
    }
  }
  
  public static void Launch(Activity paramActivity, PwEntry paramPwEntry, int paramInt)
  {
    if ((paramPwEntry instanceof PwEntryV4)) {}
    for (Intent localIntent = new Intent(paramActivity, EntryActivityV4.class);; localIntent = new Intent(paramActivity, EntryActivity.class))
    {
      localIntent.putExtra("entry", Types.UUIDtoBytes(paramPwEntry.getUUID()));
      localIntent.putExtra("refresh_pos", paramInt);
      paramActivity.startActivityForResult(localIntent, 0);
      return;
    }
  }
  
  private String getDateTime(Date paramDate)
  {
    return this.dateFormat.format(paramDate) + " " + this.timeFormat.format(paramDate);
  }
  
  private Notification getNotification(String paramString, int paramInt)
  {
    String str = getString(paramInt);
    Notification localNotification = new Notification(2130837576, str, System.currentTimeMillis());
    paramString = PendingIntent.getBroadcast(this, 0, new Intent(paramString), 268435456);
    localNotification.setLatestEventInfo(this, getString(2131099662), str, paramString);
    return localNotification;
  }
  
  private void populateText(int paramInt1, int paramInt2)
  {
    ((TextView)findViewById(paramInt1)).setText(paramInt2);
  }
  
  private void populateText(int paramInt, String paramString)
  {
    ((TextView)findViewById(paramInt)).setText(paramString);
  }
  
  private void setPasswordStyle()
  {
    TextView localTextView = (TextView)findViewById(2131427361);
    if (this.mShowPassword)
    {
      localTextView.setTransformationMethod(null);
      return;
    }
    localTextView.setTransformationMethod(PasswordTransformationMethod.getInstance());
  }
  
  private void showSamsungDialog()
  {
    SpannableString localSpannableString = new SpannableString(getString(2131099800).concat(System.getProperty("line.separator")).concat(getString(2131099825)));
    TextView localTextView = new TextView(this);
    localTextView.setText(localSpannableString);
    localTextView.setAutoLinkMask(-1);
    localTextView.setMovementMethod(LinkMovementMethod.getInstance());
    Linkify.addLinks(localSpannableString, 1);
    new AlertDialog.Builder(this).setTitle(2131099802).setPositiveButton(17039370, new DialogInterface.OnClickListener()
    {
      public void onClick(DialogInterface paramAnonymousDialogInterface, int paramAnonymousInt)
      {
        paramAnonymousDialogInterface.dismiss();
      }
    }).setView(localTextView).show();
  }
  
  private void timeoutCopyToClipboard(String paramString)
  {
    try
    {
      Util.copyToClipboard(this, paramString);
      long l = Long.parseLong(PreferenceManager.getDefaultSharedPreferences(this).getString(getString(2131099827), getString(2131099826)));
      if (l > 0L) {
        this.mTimer.schedule(new ClearClipboardTask(this, paramString), l);
      }
      return;
    }
    catch (SamsungClipboardException paramString)
    {
      showSamsungDialog();
    }
  }
  
  protected void fillData(boolean paramBoolean)
  {
    Object localObject1 = (ImageView)findViewById(2131427375);
    Object localObject2 = App.getDB();
    ((Database)localObject2).drawFactory.assignDrawableTo((ImageView)localObject1, getResources(), this.mEntry.getIcon());
    localObject1 = ((Database)localObject2).pm;
    populateText(2131427351, this.mEntry.getTitle(true, (PwDatabase)localObject1));
    populateText(2131427354, this.mEntry.getUsername(true, (PwDatabase)localObject1));
    populateText(2131427357, this.mEntry.getUrl(true, (PwDatabase)localObject1));
    populateText(2131427361, this.mEntry.getPassword(true, (PwDatabase)localObject1));
    setPasswordStyle();
    populateText(2131427384, getDateTime(this.mEntry.getCreationTime()));
    populateText(2131427386, getDateTime(this.mEntry.getLastModificationTime()));
    populateText(2131427388, getDateTime(this.mEntry.getLastAccessTime()));
    localObject2 = this.mEntry.getExpiryTime();
    if (this.mEntry.expires()) {
      populateText(2131427390, getDateTime((Date)localObject2));
    }
    for (;;)
    {
      populateText(2131427367, this.mEntry.getNotes(true, (PwDatabase)localObject1));
      return;
      populateText(2131427390, 2131099763);
    }
  }
  
  protected void onActivityResult(int paramInt1, int paramInt2, Intent paramIntent)
  {
    super.onActivityResult(paramInt1, paramInt2, paramIntent);
    if ((paramInt2 == 2) || (paramInt2 == 3))
    {
      fillData(true);
      if (paramInt2 == 3)
      {
        paramIntent = new Intent();
        paramIntent.putExtra("refresh_pos", this.mPos);
        setResult(2, paramIntent);
      }
    }
  }
  
  protected void onCreate(Bundle paramBundle)
  {
    if (!PreferenceManager.getDefaultSharedPreferences(this).getBoolean(getString(2131099841), getResources().getBoolean(2131230721))) {}
    for (boolean bool = true;; bool = false)
    {
      this.mShowPassword = bool;
      super.onCreate(paramBundle);
      setEntryView();
      paramBundle = getApplicationContext();
      this.dateFormat = android.text.format.DateFormat.getDateFormat(paramBundle);
      this.timeFormat = android.text.format.DateFormat.getTimeFormat(paramBundle);
      paramBundle = App.getDB();
      if (paramBundle.Loaded()) {
        break;
      }
      finish();
      return;
    }
    this.readOnly = paramBundle.readOnly;
    setResult(0);
    Intent localIntent = getIntent();
    UUID localUUID = Types.bytestoUUID(localIntent.getByteArrayExtra("entry"));
    this.mPos = localIntent.getIntExtra("refresh_pos", -1);
    assert (localUUID != null);
    this.mEntry = ((PwEntry)paramBundle.pm.entries.get(localUUID));
    if (this.mEntry == null)
    {
      Toast.makeText(this, 2131099803, 1).show();
      finish();
      return;
    }
    ActivityCompat.invalidateOptionsMenu(this);
    this.mEntry.touch(false, false);
    fillData(false);
    setupEditButtons();
    this.mNM = ((NotificationManager)getSystemService("notification"));
    if (this.mEntry.getPassword().length() > 0)
    {
      paramBundle = getNotification("com.keepassdroid.copy_password", 2131099673);
      this.mNM.notify(2, paramBundle);
    }
    if (this.mEntry.getUsername().length() > 0)
    {
      paramBundle = getNotification("com.keepassdroid.copy_username", 2131099674);
      this.mNM.notify(1, paramBundle);
    }
    this.mIntentReceiver = new BroadcastReceiver()
    {
      public void onReceive(Context paramAnonymousContext, Intent paramAnonymousIntent)
      {
        paramAnonymousContext = paramAnonymousIntent.getAction();
        if (paramAnonymousContext.equals("com.keepassdroid.copy_username"))
        {
          paramAnonymousContext = EntryActivity.this.mEntry.getUsername();
          if (paramAnonymousContext.length() > 0) {
            EntryActivity.this.timeoutCopyToClipboard(paramAnonymousContext);
          }
        }
        while ((!paramAnonymousContext.equals("com.keepassdroid.copy_password")) || (new String(EntryActivity.this.mEntry.getPassword()).length() <= 0)) {
          return;
        }
        EntryActivity.this.timeoutCopyToClipboard(new String(EntryActivity.this.mEntry.getPassword()));
      }
    };
    paramBundle = new IntentFilter();
    paramBundle.addAction("com.keepassdroid.copy_username");
    paramBundle.addAction("com.keepassdroid.copy_password");
    registerReceiver(this.mIntentReceiver, paramBundle);
  }
  
  public boolean onCreateOptionsMenu(Menu paramMenu)
  {
    super.onCreateOptionsMenu(paramMenu);
    getMenuInflater().inflate(2131361792, paramMenu);
    MenuItem localMenuItem1 = paramMenu.findItem(2131427443);
    MenuItem localMenuItem2;
    if (this.mShowPassword)
    {
      localMenuItem1.setTitle(2131099754);
      localMenuItem1 = paramMenu.findItem(2131427444);
      localMenuItem2 = paramMenu.findItem(2131427445);
      paramMenu = paramMenu.findItem(2131427446);
      if (this.mEntry != null) {
        break label120;
      }
      localMenuItem1.setVisible(false);
      localMenuItem2.setVisible(false);
      paramMenu.setVisible(false);
    }
    for (;;)
    {
      return true;
      localMenuItem1.setTitle(2131099760);
      break;
      label120:
      if (EmptyUtils.isNullOrEmpty(this.mEntry.getUrl())) {
        localMenuItem1.setVisible(false);
      }
      if (this.mEntry.getUsername().length() == 0) {
        localMenuItem2.setVisible(false);
      }
      if (this.mEntry.getPassword().length() == 0) {
        paramMenu.setVisible(false);
      }
    }
  }
  
  protected void onDestroy()
  {
    if (this.mIntentReceiver != null) {
      unregisterReceiver(this.mIntentReceiver);
    }
    if (this.mNM != null) {}
    try
    {
      this.mNM.cancelAll();
      super.onDestroy();
      return;
    }
    catch (SecurityException localSecurityException)
    {
      for (;;) {}
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
    case 2131427443: 
      if (this.mShowPassword) {
        paramMenuItem.setTitle(2131099760);
      }
      for (this.mShowPassword = false;; this.mShowPassword = true)
      {
        setPasswordStyle();
        return true;
        paramMenuItem.setTitle(2131099754);
      }
    case 2131427444: 
      String str = this.mEntry.getUrl();
      paramMenuItem = str;
      if (!str.contains("://")) {
        paramMenuItem = "http://" + str;
      }
      try
      {
        Util.gotoUrl(this, paramMenuItem);
        return true;
      }
      catch (ActivityNotFoundException paramMenuItem)
      {
        Toast.makeText(this, 2131099766, 1).show();
        return true;
      }
    case 2131427445: 
      timeoutCopyToClipboard(this.mEntry.getUsername(true, App.getDB().pm));
      return true;
    case 2131427446: 
      timeoutCopyToClipboard(new String(this.mEntry.getPassword(true, App.getDB().pm)));
      return true;
    }
    App.setShutdown();
    setResult(1);
    finish();
    return true;
  }
  
  protected void setEntryView()
  {
    setContentView(2130903047);
  }
  
  protected void setupEditButtons()
  {
    Button localButton = (Button)findViewById(2131427378);
    localButton.setOnClickListener(new View.OnClickListener()
    {
      public void onClick(View paramAnonymousView)
      {
        EntryEditActivity.Launch(EntryActivity.this, EntryActivity.this.mEntry);
      }
    });
    if (this.readOnly)
    {
      localButton.setVisibility(8);
      findViewById(2131427379).setVisibility(8);
    }
  }
  
  private class ClearClipboardTask
    extends TimerTask
  {
    private final String mClearText;
    private final Context mCtx;
    
    ClearClipboardTask(Context paramContext, String paramString)
    {
      this.mClearText = paramString;
      this.mCtx = paramContext;
    }
    
    public void run()
    {
      if (Util.getClipboard(this.mCtx).equals(this.mClearText)) {}
      try
      {
        Util.copyToClipboard(this.mCtx, "");
        EntryActivity.this.uiThreadCallback.post(new UIToastTask(this.mCtx, 2131099649));
        return;
      }
      catch (SamsungClipboardException localSamsungClipboardException)
      {
        EntryActivity.this.uiThreadCallback.post(new UIToastTask(this.mCtx, 2131099801));
      }
    }
  }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/com/keepassdroid/EntryActivity.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */