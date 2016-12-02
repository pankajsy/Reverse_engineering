package com.keepassdroid;

import android.app.Dialog;
import android.content.Context;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.content.pm.PackageManager.NameNotFoundException;
import android.os.Bundle;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Button;
import android.widget.TextView;

public class AboutDialog
  extends Dialog
{
  public AboutDialog(Context paramContext)
  {
    super(paramContext);
  }
  
  private void setVersion()
  {
    Object localObject = getContext();
    try
    {
      localObject = ((Context)localObject).getPackageManager().getPackageInfo(((Context)localObject).getPackageName(), 0).versionName;
      ((TextView)findViewById(2131427331)).setText((CharSequence)localObject);
      return;
    }
    catch (PackageManager.NameNotFoundException localNameNotFoundException)
    {
      for (;;)
      {
        localNameNotFoundException.printStackTrace();
        String str = "";
      }
    }
  }
  
  protected void onCreate(Bundle paramBundle)
  {
    super.onCreate(paramBundle);
    setContentView(2130903040);
    setTitle(2131099662);
    setVersion();
    ((Button)findViewById(2131427338)).setOnClickListener(new View.OnClickListener()
    {
      public void onClick(View paramAnonymousView)
      {
        AboutDialog.this.dismiss();
      }
    });
  }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/com/keepassdroid/AboutDialog.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */