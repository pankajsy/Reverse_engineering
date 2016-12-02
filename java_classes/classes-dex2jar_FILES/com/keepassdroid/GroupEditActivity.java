package com.keepassdroid;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Button;
import android.widget.ImageButton;
import android.widget.TextView;
import android.widget.Toast;
import com.keepassdroid.icons.Icons;

public class GroupEditActivity
  extends Activity
{
  public static final String KEY_ICON_ID = "icon_id";
  public static final String KEY_NAME = "name";
  private int mSelectedIconID;
  
  public static void Launch(Activity paramActivity)
  {
    paramActivity.startActivityForResult(new Intent(paramActivity, GroupEditActivity.class), 0);
  }
  
  protected void onActivityResult(int paramInt1, int paramInt2, Intent paramIntent)
  {
    switch (paramInt2)
    {
    default: 
      return;
    }
    this.mSelectedIconID = paramIntent.getExtras().getInt("icon_id");
    ((ImageButton)findViewById(2131427350)).setImageResource(Icons.iconToResId(this.mSelectedIconID));
  }
  
  protected void onCreate(Bundle paramBundle)
  {
    super.onCreate(paramBundle);
    setContentView(2130903056);
    setTitle(2131099659);
    ((ImageButton)findViewById(2131427350)).setOnClickListener(new View.OnClickListener()
    {
      public void onClick(View paramAnonymousView)
      {
        IconPickerActivity.Launch(GroupEditActivity.this);
      }
    });
    ((Button)findViewById(2131427424)).setOnClickListener(new View.OnClickListener()
    {
      public void onClick(View paramAnonymousView)
      {
        paramAnonymousView = ((TextView)GroupEditActivity.this.findViewById(2131427423)).getText().toString();
        if (paramAnonymousView.length() > 0)
        {
          Intent localIntent = new Intent();
          localIntent.putExtra("name", paramAnonymousView);
          localIntent.putExtra("icon_id", GroupEditActivity.this.mSelectedIconID);
          GroupEditActivity.this.setResult(-1, localIntent);
          GroupEditActivity.this.finish();
          return;
        }
        Toast.makeText(GroupEditActivity.this, 2131099711, 1).show();
      }
    });
    ((Button)findViewById(2131427342)).setOnClickListener(new View.OnClickListener()
    {
      public void onClick(View paramAnonymousView)
      {
        paramAnonymousView = new Intent();
        GroupEditActivity.this.setResult(0, paramAnonymousView);
        GroupEditActivity.this.finish();
      }
    });
  }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/com/keepassdroid/GroupEditActivity.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */