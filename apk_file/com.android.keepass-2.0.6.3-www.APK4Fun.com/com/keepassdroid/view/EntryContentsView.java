package com.keepassdroid.view;

import android.content.Context;
import android.util.AttributeSet;
import android.view.LayoutInflater;
import android.widget.LinearLayout;

public class EntryContentsView
        extends LinearLayout {
    public EntryContentsView(Context paramContext) {
        this(paramContext, null);
    }

    public EntryContentsView(Context paramContext, AttributeSet paramAttributeSet) {
        super(paramContext, paramAttributeSet);
        inflate(paramContext);
    }

    private void inflate(Context paramContext) {
        ((LayoutInflater) paramContext.getSystemService("layout_inflater")).inflate(2130903048, this);
    }

    protected LinearLayout.LayoutParams generateDefaultLayoutParams() {
        return new LinearLayout.LayoutParams(-1, -2);
    }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/com/keepassdroid/view/EntryContentsView.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */