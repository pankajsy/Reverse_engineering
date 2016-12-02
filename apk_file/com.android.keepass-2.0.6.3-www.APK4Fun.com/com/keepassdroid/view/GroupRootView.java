package com.keepassdroid.view;

import android.content.Context;
import android.util.AttributeSet;
import android.view.LayoutInflater;
import android.widget.Button;
import android.widget.RelativeLayout;

public class GroupRootView
        extends RelativeLayout {
    public GroupRootView(Context paramContext) {
        this(paramContext, null);
    }

    public GroupRootView(Context paramContext, AttributeSet paramAttributeSet) {
        super(paramContext, paramAttributeSet);
        inflate(paramContext);
    }

    private void inflate(Context paramContext) {
        ((LayoutInflater) paramContext.getSystemService("layout_inflater")).inflate(2130903055, this);
        ((Button) findViewById(2131427422)).setVisibility(4);
    }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/com/keepassdroid/view/GroupRootView.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */