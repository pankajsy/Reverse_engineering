package com.keepassdroid.view;

import android.content.Context;
import android.util.AttributeSet;
import android.view.LayoutInflater;
import android.widget.RelativeLayout;

public class GroupAddEntryView
  extends RelativeLayout
{
  public GroupAddEntryView(Context paramContext)
  {
    this(paramContext, null);
  }
  
  public GroupAddEntryView(Context paramContext, AttributeSet paramAttributeSet)
  {
    super(paramContext, paramAttributeSet);
    inflate(paramContext);
  }
  
  private void inflate(Context paramContext)
  {
    ((LayoutInflater)paramContext.getSystemService("layout_inflater")).inflate(2130903055, this);
  }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/com/keepassdroid/view/GroupAddEntryView.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */