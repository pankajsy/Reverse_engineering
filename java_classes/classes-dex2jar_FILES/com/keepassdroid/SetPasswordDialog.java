package com.keepassdroid;

import android.content.Context;
import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import android.net.Uri;
import android.os.Bundle;
import android.os.Handler;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Button;
import android.widget.TextView;
import android.widget.Toast;
import com.keepassdroid.app.App;
import com.keepassdroid.database.edit.FileOnFinish;
import com.keepassdroid.database.edit.OnFinish;
import com.keepassdroid.database.edit.SetPassword;
import com.keepassdroid.utils.EmptyUtils;
import com.keepassdroid.utils.UriUtil;

public class SetPasswordDialog
  extends CancelDialog
{
  private FileOnFinish mFinish;
  private Uri mKeyfile;
  private byte[] masterKey;
  
  public SetPasswordDialog(Context paramContext)
  {
    super(paramContext);
  }
  
  public SetPasswordDialog(Context paramContext, FileOnFinish paramFileOnFinish)
  {
    super(paramContext);
    this.mFinish = paramFileOnFinish;
  }
  
  public byte[] getKey()
  {
    return this.masterKey;
  }
  
  public Uri keyfile()
  {
    return this.mKeyfile;
  }
  
  protected void onCreate(Bundle paramBundle)
  {
    super.onCreate(paramBundle);
    setContentView(2130903063);
    setTitle(2131099771);
    ((Button)findViewById(2131427424)).setOnClickListener(new View.OnClickListener()
    {
      public void onClick(View paramAnonymousView)
      {
        paramAnonymousView = ((TextView)SetPasswordDialog.this.findViewById(2131427440)).getText().toString();
        if (!paramAnonymousView.equals(((TextView)SetPasswordDialog.this.findViewById(2131427441)).getText().toString())) {
          Toast.makeText(SetPasswordDialog.this.getContext(), 2131099715, 1).show();
        }
        final Object localObject;
        do
        {
          return;
          localObject = UriUtil.parseDefaultFile(((TextView)SetPasswordDialog.this.findViewById(2131427437)).getText().toString());
          SetPasswordDialog.access$002(SetPasswordDialog.this, (Uri)localObject);
          if ((paramAnonymousView.length() == 0) && (EmptyUtils.isNullOrEmpty((Uri)localObject)))
          {
            Toast.makeText(SetPasswordDialog.this.getContext(), 2131099712, 1).show();
            return;
          }
          paramAnonymousView = new SetPassword(SetPasswordDialog.this.getContext(), App.getDB(), paramAnonymousView, (Uri)localObject, new SetPasswordDialog.AfterSave(SetPasswordDialog.this, SetPasswordDialog.this.mFinish, new Handler()));
          localObject = new ProgressTask(SetPasswordDialog.this.getContext(), paramAnonymousView, 2131099782);
        } while (!paramAnonymousView.validatePassword(SetPasswordDialog.this.getContext(), new DialogInterface.OnClickListener()
        {
          public void onClick(DialogInterface paramAnonymous2DialogInterface, int paramAnonymous2Int)
          {
            localObject.run();
          }
        }));
        ((ProgressTask)localObject).run();
      }
    });
    ((Button)findViewById(2131427342)).setOnClickListener(new View.OnClickListener()
    {
      public void onClick(View paramAnonymousView)
      {
        SetPasswordDialog.this.cancel();
        if (SetPasswordDialog.this.mFinish != null) {
          SetPasswordDialog.this.mFinish.run();
        }
      }
    });
  }
  
  private class AfterSave
    extends OnFinish
  {
    private FileOnFinish mFinish;
    
    public AfterSave(FileOnFinish paramFileOnFinish, Handler paramHandler)
    {
      super(paramHandler);
      this.mFinish = paramFileOnFinish;
    }
    
    public void run()
    {
      if (this.mSuccess)
      {
        if (this.mFinish != null) {
          this.mFinish.setFilename(SetPasswordDialog.this.mKeyfile);
        }
        SetPasswordDialog.this.dismiss();
      }
      for (;;)
      {
        super.run();
        return;
        displayMessage(SetPasswordDialog.this.getContext());
      }
    }
  }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/com/keepassdroid/SetPasswordDialog.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */