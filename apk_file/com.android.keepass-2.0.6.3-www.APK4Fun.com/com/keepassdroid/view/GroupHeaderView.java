package com.keepassdroid.view;

import android.content.Context;
import android.util.AttributeSet;
import android.view.LayoutInflater;
import android.widget.RelativeLayout;

import com.keepassdroid.app.App;

public class GroupHeaderView
        extends RelativeLayout {
    public GroupHeaderView(Context paramContext) {
        this(paramContext, null);
    }

    public GroupHeaderView(Context paramContext, AttributeSet paramAttributeSet) {
        super(paramContext, paramAttributeSet);
        inflate(paramContext);
    }

    private void inflate(Context paramContext) {
        ((LayoutInflater) paramContext.getSystemService("layout_inflater")).inflate(2130903058, this);
        if (App.getDB().readOnly) {
            findViewById(2131427425).setVisibility(0);
        }
    }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/com/keepassdroid/view/GroupHeaderView.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */