package com.keepassdroid.view;

import android.content.Context;
import android.util.AttributeSet;
import android.view.LayoutInflater;
import android.widget.RelativeLayout;

public class GroupViewOnlyView
        extends RelativeLayout {
    public GroupViewOnlyView(Context paramContext) {
        this(paramContext, null);
    }

    public GroupViewOnlyView(Context paramContext, AttributeSet paramAttributeSet) {
        super(paramContext, paramAttributeSet);
        inflate(paramContext);
    }

    private void inflate(Context paramContext) {
        ((LayoutInflater) paramContext.getSystemService("layout_inflater")).inflate(2130903055, this);
        findViewById(2131427421).setVisibility(4);
        findViewById(2131427422).setVisibility(4);
        findViewById(2131427332).setVisibility(4);
        ((RelativeLayout.LayoutParams) findViewById(16908298).getLayoutParams()).addRule(12, -1);
    }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/com/keepassdroid/view/GroupViewOnlyView.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */