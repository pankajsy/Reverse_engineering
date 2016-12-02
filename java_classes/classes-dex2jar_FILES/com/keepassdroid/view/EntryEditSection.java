package com.keepassdroid.view;

import android.content.Context;
import android.util.AttributeSet;
import android.widget.CheckBox;
import android.widget.RelativeLayout;
import android.widget.TextView;
import com.keepassdroid.database.security.ProtectedString;

public class EntryEditSection
  extends RelativeLayout
{
  public EntryEditSection(Context paramContext)
  {
    super(paramContext);
  }
  
  public EntryEditSection(Context paramContext, AttributeSet paramAttributeSet)
  {
    super(paramContext, paramAttributeSet);
  }
  
  public EntryEditSection(Context paramContext, AttributeSet paramAttributeSet, int paramInt)
  {
    super(paramContext, paramAttributeSet, paramInt);
  }
  
  private void setText(int paramInt, String paramString)
  {
    if (paramString != null) {
      ((TextView)findViewById(paramInt)).setText(paramString);
    }
  }
  
  public void setData(String paramString, ProtectedString paramProtectedString)
  {
    setText(2131427371, paramString);
    setText(2131427374, paramProtectedString.toString());
    ((CheckBox)findViewById(2131427372)).setChecked(paramProtectedString.isProtected());
  }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/com/keepassdroid/view/EntryEditSection.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */