package com.keepassdroid.database.edit;

import android.content.Context;
import android.content.DialogInterface.OnClickListener;
import android.net.Uri;
import com.keepassdroid.Database;
import com.keepassdroid.database.PwDatabase;
import com.keepassdroid.database.exception.InvalidKeyFileException;
import com.keepassdroid.dialog.PasswordEncodingDialogHelper;
import com.keepassdroid.utils.UriUtil;
import java.io.IOException;
import java.io.InputStream;

public class SetPassword
  extends RunnableOnFinish
{
  private Context ctx;
  private Database mDb;
  private boolean mDontSave;
  private Uri mKeyfile;
  private String mPassword;
  
  public SetPassword(Context paramContext, Database paramDatabase, String paramString, Uri paramUri, OnFinish paramOnFinish)
  {
    this(paramContext, paramDatabase, paramString, paramUri, paramOnFinish, false);
  }
  
  public SetPassword(Context paramContext, Database paramDatabase, String paramString, Uri paramUri, OnFinish paramOnFinish, boolean paramBoolean)
  {
    super(paramOnFinish);
    this.mDb = paramDatabase;
    this.mPassword = paramString;
    this.mKeyfile = paramUri;
    this.mDontSave = paramBoolean;
    this.ctx = paramContext;
  }
  
  private void erase(byte[] paramArrayOfByte)
  {
    if (paramArrayOfByte == null) {}
    for (;;)
    {
      return;
      int i = 0;
      while (i < paramArrayOfByte.length)
      {
        paramArrayOfByte[i] = 0;
        i += 1;
      }
    }
  }
  
  public void run()
  {
    PwDatabase localPwDatabase = this.mDb.pm;
    byte[] arrayOfByte = new byte[localPwDatabase.masterKey.length];
    System.arraycopy(localPwDatabase.masterKey, 0, arrayOfByte, 0, arrayOfByte.length);
    try
    {
      InputStream localInputStream = UriUtil.getUriInputStream(this.ctx, this.mKeyfile);
      localPwDatabase.setMasterKey(this.mPassword, localInputStream);
      this.mFinish = new AfterSave(arrayOfByte, this.mFinish);
      new SaveDB(this.ctx, this.mDb, this.mFinish, this.mDontSave).run();
      return;
    }
    catch (InvalidKeyFileException localInvalidKeyFileException)
    {
      erase(arrayOfByte);
      finish(false, localInvalidKeyFileException.getMessage());
      return;
    }
    catch (IOException localIOException)
    {
      erase(arrayOfByte);
      finish(false, localIOException.getMessage());
    }
  }
  
  public boolean validatePassword(Context paramContext, DialogInterface.OnClickListener paramOnClickListener)
  {
    boolean bool = true;
    if (!this.mDb.pm.validatePasswordEncoding(this.mPassword))
    {
      new PasswordEncodingDialogHelper().show(paramContext, paramOnClickListener, true);
      bool = false;
    }
    return bool;
  }
  
  private class AfterSave
    extends OnFinish
  {
    private byte[] mBackup;
    
    public AfterSave(byte[] paramArrayOfByte, OnFinish paramOnFinish)
    {
      super();
      this.mBackup = paramArrayOfByte;
    }
    
    public void run()
    {
      if (!this.mSuccess)
      {
        SetPassword.this.erase(SetPassword.this.mDb.pm.masterKey);
        SetPassword.this.mDb.pm.masterKey = this.mBackup;
      }
      super.run();
    }
  }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/com/keepassdroid/database/edit/SetPassword.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */