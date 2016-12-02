package com.keepassdroid.view;

import android.content.Context;
import android.graphics.Typeface;
import android.util.AttributeSet;
import android.widget.EditText;
import com.keepassdroid.assets.TypefaceFactory;

public class PasswordEditText
  extends EditText
{
  public PasswordEditText(Context paramContext)
  {
    super(paramContext);
  }
  
  public PasswordEditText(Context paramContext, AttributeSet paramAttributeSet)
  {
    super(paramContext, paramAttributeSet);
  }
  
  public PasswordEditText(Context paramContext, AttributeSet paramAttributeSet, int paramInt)
  {
    super(paramContext, paramAttributeSet, paramInt);
  }
  
  private Typeface getTypeface(Typeface paramTypeface)
  {
    Typeface localTypeface = TypefaceFactory.getTypeface(getContext(), "fonts/DejaVuSansMono.ttf");
    if (localTypeface != null) {
      return localTypeface;
    }
    return paramTypeface;
  }
  
  public void setTypeface(Typeface paramTypeface)
  {
    super.setTypeface(getTypeface(paramTypeface));
  }
  
  public void setTypeface(Typeface paramTypeface, int paramInt)
  {
    super.setTypeface(getTypeface(paramTypeface), paramInt);
  }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/com/keepassdroid/view/PasswordEditText.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */