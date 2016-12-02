package com.keepassdroid.view;

import android.view.ContextMenu;
import android.view.MenuItem;
import android.view.View;
import android.widget.ImageView;
import android.widget.TextView;

import com.keepassdroid.GroupActivity;
import com.keepassdroid.GroupBaseActivity;
import com.keepassdroid.app.App;
import com.keepassdroid.database.PwGroup;
import com.keepassdroid.database.PwGroupV3;
import com.keepassdroid.settings.PrefsUtil;

public class PwGroupView
        extends ClickView {
    protected static final int MENU_OPEN = 1;
    protected GroupBaseActivity mAct;
    protected PwGroup mPw;
    protected TextView mTv;

    protected PwGroupView(GroupBaseActivity paramGroupBaseActivity, PwGroup paramPwGroup) {
        super(paramGroupBaseActivity);
        this.mAct = paramGroupBaseActivity;
        View localView = View.inflate(paramGroupBaseActivity, 2130903059, null);
        this.mTv = ((TextView) localView.findViewById(2131427428));
        float f = PrefsUtil.getListTextSize(paramGroupBaseActivity);
        this.mTv.setTextSize(f);
        ((TextView) localView.findViewById(2131427429)).setTextSize(f - 8.0F);
        populateView(localView, paramPwGroup);
        addView(localView, new LinearLayout.LayoutParams(-1, -2));
    }

    public static PwGroupView getInstance(GroupBaseActivity paramGroupBaseActivity, PwGroup paramPwGroup) {
        if ((paramPwGroup instanceof PwGroupV3)) {
            return new PwGroupViewV3(paramGroupBaseActivity, paramPwGroup);
        }
        return new PwGroupView(paramGroupBaseActivity, paramPwGroup);
    }

    private void launchGroup() {
        GroupActivity.Launch(this.mAct, this.mPw);
    }

    private void populateView(View paramView, PwGroup paramPwGroup) {
        this.mPw = paramPwGroup;
        paramView = (ImageView) paramView.findViewById(2131427427);
        App.getDB().drawFactory.assignDrawableTo(paramView, getResources(), paramPwGroup.getIcon());
        this.mTv.setText(paramPwGroup.getName());
    }

    public void convertView(PwGroup paramPwGroup) {
        populateView(this, paramPwGroup);
    }

    public void onClick() {
        launchGroup();
    }

    public boolean onContextItemSelected(MenuItem paramMenuItem) {
        switch (paramMenuItem.getItemId()) {
            default:
                return false;
        }
        launchGroup();
        return true;
    }

    public void onCreateMenu(ContextMenu paramContextMenu, ContextMenu.ContextMenuInfo paramContextMenuInfo) {
        paramContextMenu.add(0, 1, 0, 2131099757);
    }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/com/keepassdroid/view/PwGroupView.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */