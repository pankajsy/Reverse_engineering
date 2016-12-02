package com.keepassdroid.view;

import android.content.Context;
import android.view.ContextMenu;
import android.view.MenuItem;
import android.widget.LinearLayout;

public abstract class ClickView
        extends LinearLayout {
    protected boolean readOnly = false;

    public ClickView(Context paramContext) {
        super(paramContext);
    }

    public abstract void onClick();

    public abstract boolean onContextItemSelected(MenuItem paramMenuItem);

    public abstract void onCreateMenu(ContextMenu paramContextMenu, ContextMenu.ContextMenuInfo paramContextMenuInfo);
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/com/keepassdroid/view/ClickView.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */