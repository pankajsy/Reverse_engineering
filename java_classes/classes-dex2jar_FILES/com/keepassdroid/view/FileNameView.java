package com.keepassdroid.view;

import android.content.Context;
import android.os.Environment;
import android.util.AttributeSet;
import android.view.LayoutInflater;
import android.widget.RelativeLayout;
import android.widget.RelativeLayout.LayoutParams;
import android.widget.TextView;

public class FileNameView
  extends RelativeLayout
{
  public FileNameView(Context paramContext)
  {
    this(paramContext, null);
  }
  
  public FileNameView(Context paramContext, AttributeSet paramAttributeSet)
  {
    super(paramContext, paramAttributeSet);
    inflate(paramContext);
  }
  
  private void inflate(Context paramContext)
  {
    ((LayoutInflater)paramContext.getSystemService("layout_inflater")).inflate(2130903052, this);
  }
  
  public void updateExternalStorageWarning()
  {
    int i = -1;
    Object localObject = Environment.getExternalStorageState();
    TextView localTextView;
    RelativeLayout.LayoutParams localLayoutParams;
    if (((String)localObject).equals("mounted_ro"))
    {
      i = 2131099796;
      localObject = (TextView)findViewById(2131427395);
      localTextView = (TextView)findViewById(2131427396);
      localLayoutParams = new RelativeLayout.LayoutParams(-1, -2);
      if (i == -1) {
        break label95;
      }
      ((TextView)localObject).setText(i);
      ((TextView)localObject).setVisibility(0);
      localLayoutParams.addRule(3, 2131427395);
    }
    for (;;)
    {
      localTextView.setLayoutParams(localLayoutParams);
      return;
      if (((String)localObject).equals("mounted")) {
        break;
      }
      i = 2131099797;
      break;
      label95:
      ((TextView)localObject).setVisibility(4);
    }
  }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/com/keepassdroid/view/FileNameView.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */