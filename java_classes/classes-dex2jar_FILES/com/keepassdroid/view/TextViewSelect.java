package com.keepassdroid.view;

import android.content.Context;
import android.text.method.ArrowKeyMovementMethod;
import android.text.method.MovementMethod;
import android.util.AttributeSet;
import android.widget.TextView;
import android.widget.TextView.BufferType;

public class TextViewSelect
  extends TextView
{
  public TextViewSelect(Context paramContext)
  {
    this(paramContext, null);
  }
  
  public TextViewSelect(Context paramContext, AttributeSet paramAttributeSet)
  {
    this(paramContext, paramAttributeSet, 16842884);
  }
  
  public TextViewSelect(Context paramContext, AttributeSet paramAttributeSet, int paramInt)
  {
    super(paramContext, paramAttributeSet, paramInt);
    setFocusable(true);
    setFocusableInTouchMode(true);
  }
  
  protected boolean getDefaultEditable()
  {
    return false;
  }
  
  protected MovementMethod getDefaultMovementMethod()
  {
    return ArrowKeyMovementMethod.getInstance();
  }
  
  public void setText(CharSequence paramCharSequence, TextView.BufferType paramBufferType)
  {
    super.setText(paramCharSequence, TextView.BufferType.EDITABLE);
  }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/com/keepassdroid/view/TextViewSelect.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */