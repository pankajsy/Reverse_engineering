package com.keepassdroid.view;

import android.content.Context;
import android.util.AttributeSet;
import android.view.View;
import android.widget.ScrollView;

import java.util.ArrayList;

public class NoFocusScrollView
        extends ScrollView {
    public NoFocusScrollView(Context paramContext) {
        super(paramContext);
    }

    public NoFocusScrollView(Context paramContext, AttributeSet paramAttributeSet) {
        super(paramContext, paramAttributeSet);
    }

    public NoFocusScrollView(Context paramContext, AttributeSet paramAttributeSet, int paramInt) {
        super(paramContext, paramAttributeSet, paramInt);
    }

    public ArrayList<View> getFocusables(int paramInt) {
        return new ArrayList();
    }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/com/keepassdroid/view/NoFocusScrollView.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */