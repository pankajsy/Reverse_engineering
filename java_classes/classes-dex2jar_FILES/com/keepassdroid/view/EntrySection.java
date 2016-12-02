package com.keepassdroid.view;

import android.content.Context;
import android.util.AttributeSet;
import android.view.LayoutInflater;
import android.widget.LinearLayout;
import android.widget.TextView;

public class EntrySection
  extends LinearLayout
{
  public EntrySection(Context paramContext)
  {
    this(paramContext, null);
  }
  
  public EntrySection(Context paramContext, AttributeSet paramAttributeSet)
  {
    this(paramContext, paramAttributeSet, null, null);
  }
  
  public EntrySection(Context paramContext, AttributeSet paramAttributeSet, String paramString1, String paramString2)
  {
    super(paramContext, paramAttributeSet);
    inflate((LayoutInflater)paramContext.getSystemService("layout_inflater"), paramContext, paramString1, paramString2);
  }
  
  private void setText(int paramInt, String paramString)
  {
    if (paramString != null) {
      ((TextView)findViewById(paramInt)).setText(paramString);
    }
  }
  
  protected int getLayout()
  {
    return 2130903046;
  }
  
  protected void inflate(LayoutInflater paramLayoutInflater, Context paramContext, String paramString1, String paramString2)
  {
    paramLayoutInflater.inflate(getLayout(), this);
    setText(2131427371, paramString1);
    setText(2131427374, paramString2);
  }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/com/keepassdroid/view/EntrySection.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */