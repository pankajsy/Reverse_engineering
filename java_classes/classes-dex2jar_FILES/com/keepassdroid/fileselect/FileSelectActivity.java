package com.keepassdroid.fileselect;

import android.app.ListActivity;
import android.content.ActivityNotFoundException;
import android.content.Intent;
import android.content.SharedPreferences;
import android.net.Uri;
import android.os.AsyncTask;
import android.os.Bundle;
import android.os.Environment;
import android.preference.PreferenceManager;
import android.view.ContextMenu;
import android.view.ContextMenu.ContextMenuInfo;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.AdapterView.AdapterContextMenuInfo;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ImageButton;
import android.widget.ListView;
import android.widget.TextView;
import android.widget.Toast;
import com.keepassdroid.AboutDialog;
import com.keepassdroid.GroupActivity;
import com.keepassdroid.PasswordActivity;
import com.keepassdroid.ProgressTask;
import com.keepassdroid.SetPasswordDialog;
import com.keepassdroid.app.App;
import com.keepassdroid.compat.StorageAF;
import com.keepassdroid.database.edit.CreateDB;
import com.keepassdroid.database.edit.FileOnFinish;
import com.keepassdroid.database.edit.OnFinish;
import com.keepassdroid.database.exception.ContentFileNotFoundException;
import com.keepassdroid.settings.AppSettingsActivity;
import com.keepassdroid.utils.EmptyUtils;
import com.keepassdroid.utils.Interaction;
import com.keepassdroid.utils.UriUtil;
import com.keepassdroid.utils.Util;
import com.keepassdroid.view.FileNameView;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.net.URLDecoder;

public class FileSelectActivity
  extends ListActivity
{
  private static final int CMENU_CLEAR = 1;
  public static final int FILE_BROWSE = 1;
  public static final int GET_CONTENT = 2;
  public static final int OPEN_DOC = 3;
  private RecentFileHistory fileHistory;
  private boolean recentMode = false;
  
  private void fillData()
  {
    ((EditText)findViewById(2131427392)).setText(Environment.getExternalStorageDirectory().getAbsolutePath() + getString(2131099829));
    setListAdapter(new ArrayAdapter(this, 2130903050, 2131427392, this.fileHistory.getDbList()));
  }
  
  private void refreshList()
  {
    ((ArrayAdapter)getListAdapter()).notifyDataSetChanged();
  }
  
  protected void onActivityResult(int paramInt1, int paramInt2, Intent paramIntent)
  {
    super.onActivityResult(paramInt1, paramInt2, paramIntent);
    fillData();
    Object localObject2 = null;
    Object localObject1;
    if ((paramInt1 == 1) && (paramInt2 == -1))
    {
      paramIntent = paramIntent.getDataString();
      localObject1 = paramIntent;
      if (paramIntent != null)
      {
        localObject1 = paramIntent;
        if (paramIntent.startsWith("file://")) {
          localObject1 = paramIntent.substring(7);
        }
        localObject1 = URLDecoder.decode((String)localObject1);
      }
    }
    for (;;)
    {
      if (localObject1 != null) {
        ((EditText)findViewById(2131427392)).setText((CharSequence)localObject1);
      }
      return;
      if (paramInt1 != 2)
      {
        localObject1 = localObject2;
        if (paramInt1 != 3) {}
      }
      else
      {
        localObject1 = localObject2;
        if (paramInt2 == -1)
        {
          localObject1 = localObject2;
          if (paramIntent != null)
          {
            Uri localUri = paramIntent.getData();
            localObject1 = localObject2;
            if (localUri != null)
            {
              paramIntent = localUri;
              if (paramInt1 == 2) {
                paramIntent = UriUtil.translate(this, localUri);
              }
              localObject1 = paramIntent.toString();
            }
          }
        }
      }
    }
  }
  
  public boolean onContextItemSelected(MenuItem paramMenuItem)
  {
    super.onContextItemSelected(paramMenuItem);
    if (paramMenuItem.getItemId() == 1)
    {
      paramMenuItem = ((TextView)((AdapterView.AdapterContextMenuInfo)paramMenuItem.getMenuInfo()).targetView).getText().toString();
      new AsyncTask()
      {
        protected Void doInBackground(String... paramAnonymousVarArgs)
        {
          String str = paramAnonymousVarArgs[0];
          FileSelectActivity.this.fileHistory.deleteFile(Uri.parse(paramAnonymousVarArgs[0]));
          return null;
        }
        
        protected void onPostExecute(Void paramAnonymousVoid)
        {
          FileSelectActivity.this.refreshList();
        }
      }.execute(new String[] { paramMenuItem });
      return true;
    }
    return false;
  }
  
  protected void onCreate(Bundle paramBundle)
  {
    super.onCreate(paramBundle);
    this.fileHistory = App.getFileHistory();
    if (this.fileHistory.hasRecentFiles())
    {
      this.recentMode = true;
      setContentView(2130903051);
    }
    for (;;)
    {
      ((Button)findViewById(2131427398)).setOnClickListener(new View.OnClickListener()
      {
        public void onClick(View paramAnonymousView)
        {
          paramAnonymousView = Util.getEditText(FileSelectActivity.this, 2131427392);
          try
          {
            PasswordActivity.Launch(FileSelectActivity.this, paramAnonymousView);
            return;
          }
          catch (ContentFileNotFoundException paramAnonymousView)
          {
            Toast.makeText(FileSelectActivity.this, 2131099816, 1).show();
            return;
          }
          catch (FileNotFoundException paramAnonymousView)
          {
            Toast.makeText(FileSelectActivity.this, 2131099650, 1).show();
          }
        }
      });
      ((Button)findViewById(2131427399)).setOnClickListener(new View.OnClickListener()
      {
        public void onClick(View paramAnonymousView)
        {
          paramAnonymousView = Util.getEditText(FileSelectActivity.this, 2131427392);
          if (paramAnonymousView.length() == 0)
          {
            Toast.makeText(FileSelectActivity.this, 2131099708, 1).show();
            return;
          }
          Object localObject = new File(paramAnonymousView);
          try
          {
            if (((File)localObject).exists())
            {
              Toast.makeText(FileSelectActivity.this, 2131099704, 1).show();
              return;
            }
          }
          catch (IOException paramAnonymousView)
          {
            Toast.makeText(FileSelectActivity.this, FileSelectActivity.this.getText(2131099707) + " " + paramAnonymousView.getLocalizedMessage(), 1).show();
            return;
          }
          File localFile = ((File)localObject).getParentFile();
          if ((localFile == null) || ((localFile.exists()) && (!localFile.isDirectory())))
          {
            Toast.makeText(FileSelectActivity.this, 2131099710, 1).show();
            return;
          }
          if ((!localFile.exists()) && (!localFile.mkdirs()))
          {
            Toast.makeText(FileSelectActivity.this, 2131099703, 1).show();
            return;
          }
          ((File)localObject).createNewFile();
          localObject = new FileSelectActivity.CollectPassword(FileSelectActivity.this, new FileSelectActivity.LaunchGroupActivity(FileSelectActivity.this, paramAnonymousView));
          paramAnonymousView = new CreateDB(FileSelectActivity.this, paramAnonymousView, (OnFinish)localObject, true);
          new ProgressTask(FileSelectActivity.this, paramAnonymousView, 2131099772).run();
        }
      });
      ((ImageButton)findViewById(2131427397)).setOnClickListener(new View.OnClickListener()
      {
        private void lookForOpenIntentsFilePicker()
        {
          if (Interaction.isIntentAvailable(FileSelectActivity.this, "org.openintents.action.PICK_FILE"))
          {
            Intent localIntent = new Intent("org.openintents.action.PICK_FILE");
            localIntent.setData(Uri.parse("file://" + Util.getEditText(FileSelectActivity.this, 2131427392)));
            try
            {
              FileSelectActivity.this.startActivityForResult(localIntent, 1);
              return;
            }
            catch (ActivityNotFoundException localActivityNotFoundException)
            {
              showBrowserDialog();
              return;
            }
          }
          showBrowserDialog();
        }
        
        private void showBrowserDialog()
        {
          new BrowserDialog(FileSelectActivity.this).show();
        }
        
        public void onClick(View paramAnonymousView)
        {
          if (StorageAF.useStorageFramework(FileSelectActivity.this))
          {
            paramAnonymousView = new Intent(StorageAF.ACTION_OPEN_DOCUMENT);
            paramAnonymousView.addCategory("android.intent.category.OPENABLE");
            paramAnonymousView.setType("*/*");
            FileSelectActivity.this.startActivityForResult(paramAnonymousView, 3);
            return;
          }
          paramAnonymousView = new Intent("android.intent.action.GET_CONTENT");
          paramAnonymousView.addCategory("android.intent.category.OPENABLE");
          paramAnonymousView.setType("*/*");
          try
          {
            FileSelectActivity.this.startActivityForResult(paramAnonymousView, 2);
            return;
          }
          catch (ActivityNotFoundException paramAnonymousView)
          {
            lookForOpenIntentsFilePicker();
            return;
          }
          catch (SecurityException paramAnonymousView)
          {
            lookForOpenIntentsFilePicker();
          }
        }
      });
      fillData();
      registerForContextMenu(getListView());
      paramBundle = PreferenceManager.getDefaultSharedPreferences(this).getString("defaultFileName", "");
      if (paramBundle.length() > 0)
      {
        paramBundle = UriUtil.parseDefaultFile(paramBundle);
        String str = paramBundle.getScheme();
        if ((EmptyUtils.isNullOrEmpty(str)) || (!str.equalsIgnoreCase("file"))) {
          break;
        }
        paramBundle = paramBundle.getPath();
        if (!new File(paramBundle).exists()) {}
      }
      try
      {
        PasswordActivity.Launch(this, paramBundle);
        return;
      }
      catch (Exception paramBundle) {}
      setContentView(2130903053);
    }
    try
    {
      PasswordActivity.Launch(this, paramBundle.toString());
      return;
    }
    catch (Exception paramBundle) {}
  }
  
  public void onCreateContextMenu(ContextMenu paramContextMenu, View paramView, ContextMenu.ContextMenuInfo paramContextMenuInfo)
  {
    super.onCreateContextMenu(paramContextMenu, paramView, paramContextMenuInfo);
    paramContextMenu.add(0, 1, 0, 2131099776);
  }
  
  public boolean onCreateOptionsMenu(Menu paramMenu)
  {
    super.onCreateOptionsMenu(paramMenu);
    getMenuInflater().inflate(2131361794, paramMenu);
    return true;
  }
  
  protected void onListItemClick(ListView paramListView, View paramView, int paramInt, long paramLong)
  {
    super.onListItemClick(paramListView, paramView, paramInt, paramLong);
    new AsyncTask()
    {
      String fileName;
      String keyFile;
      
      protected Void doInBackground(Integer... paramAnonymousVarArgs)
      {
        int i = paramAnonymousVarArgs[0].intValue();
        this.fileName = FileSelectActivity.this.fileHistory.getDatabaseAt(i);
        this.keyFile = FileSelectActivity.this.fileHistory.getKeyfileAt(i);
        return null;
      }
      
      protected void onPostExecute(Void paramAnonymousVoid)
      {
        try
        {
          PasswordActivity.Launch(FileSelectActivity.this, this.fileName, this.keyFile);
          return;
        }
        catch (ContentFileNotFoundException paramAnonymousVoid)
        {
          Toast.makeText(FileSelectActivity.this, 2131099816, 1).show();
          return;
        }
        catch (FileNotFoundException paramAnonymousVoid)
        {
          Toast.makeText(FileSelectActivity.this, 2131099650, 1).show();
        }
      }
    }.execute(new Integer[] { Integer.valueOf(paramInt) });
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
    case 2131427449: 
      new AboutDialog(this).show();
      return true;
    }
    AppSettingsActivity.Launch(this);
    return true;
  }
  
  protected void onResume()
  {
    super.onResume();
    if (this.fileHistory.hasRecentFiles() != this.recentMode)
    {
      startActivity(getIntent());
      finish();
    }
    ((FileNameView)findViewById(2131427394)).updateExternalStorageWarning();
  }
  
  private class CollectPassword
    extends FileOnFinish
  {
    public CollectPassword(FileOnFinish paramFileOnFinish)
    {
      super();
    }
    
    public void run()
    {
      new SetPasswordDialog(FileSelectActivity.this, this.mOnFinish).show();
    }
  }
  
  private class LaunchGroupActivity
    extends FileOnFinish
  {
    private Uri mUri;
    
    public LaunchGroupActivity(String paramString)
    {
      super();
      this.mUri = UriUtil.parseDefaultFile(paramString);
    }
    
    public void run()
    {
      if (this.mSuccess)
      {
        FileSelectActivity.this.fileHistory.createFile(this.mUri, getFilename());
        GroupActivity.Launch(FileSelectActivity.this);
      }
    }
  }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/com/keepassdroid/fileselect/FileSelectActivity.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */