package com.keepassdroid.view;

import android.os.Handler;
import android.view.ContextMenu;
import android.view.MenuItem;
import android.view.View;
import android.widget.ImageView;
import android.widget.TextView;

import com.keepassdroid.Database;
import com.keepassdroid.EntryActivity;
import com.keepassdroid.GroupBaseActivity;
import com.keepassdroid.ProgressTask;
import com.keepassdroid.app.App;
import com.keepassdroid.database.PwEntry;
import com.keepassdroid.database.edit.DeleteEntry;
import com.keepassdroid.database.edit.RunnableOnFinish;
import com.keepassdroid.settings.PrefsUtil;

public class PwEntryView
        extends ClickView {
    protected static final int MENU_OPEN = 1;
    private static final int MENU_DELETE = 2;
    protected GroupBaseActivity mAct;
    protected PwEntry mPw;
    private int mPos;
    private TextView mTv;

    protected PwEntryView(GroupBaseActivity paramGroupBaseActivity, PwEntry paramPwEntry, int paramInt) {
        super(paramGroupBaseActivity);
        this.mAct = paramGroupBaseActivity;
        View localView = View.inflate(this.mAct, 2130903045, null);
        this.mTv = ((TextView) localView.findViewById(2131427376));
        this.mTv.setTextSize(PrefsUtil.getListTextSize(paramGroupBaseActivity));
        populateView(localView, paramPwEntry, paramInt);
        addView(localView, new LinearLayout.LayoutParams(-1, -2));
    }

    public static PwEntryView getInstance(GroupBaseActivity paramGroupBaseActivity, PwEntry paramPwEntry, int paramInt) {
        return new PwEntryView(paramGroupBaseActivity, paramPwEntry, paramInt);
    }

    private void deleteEntry() {
        Object localObject = new Handler();
        GroupBaseActivity localGroupBaseActivity1 = this.mAct;
        Database localDatabase = App.getDB();
        PwEntry localPwEntry = this.mPw;
        GroupBaseActivity localGroupBaseActivity2 = this.mAct;
        localGroupBaseActivity2.getClass();
        localObject = new DeleteEntry(localGroupBaseActivity1, localDatabase, localPwEntry, new GroupBaseActivity.RefreshTask(localGroupBaseActivity2, (Handler) localObject));
        new ProgressTask(this.mAct, (RunnableOnFinish) localObject, 2131099782).run();
    }

    private void launchEntry() {
        EntryActivity.Launch(this.mAct, this.mPw, this.mPos);
    }

    private void populateView(View paramView, PwEntry paramPwEntry, int paramInt) {
        this.mPw = paramPwEntry;
        this.mPos = paramInt;
        paramView = (ImageView) paramView.findViewById(2131427375);
        App.getDB().drawFactory.assignDrawableTo(paramView, getResources(), paramPwEntry.getIcon());
        this.mTv.setText(this.mPw.getDisplayTitle());
    }

    public void convertView(PwEntry paramPwEntry, int paramInt) {
        populateView(this, paramPwEntry, paramInt);
    }

    public void onClick() {
        launchEntry();
    }

    public boolean onContextItemSelected(MenuItem paramMenuItem) {
        switch (paramMenuItem.getItemId()) {
            default:
                return false;
            case 1:
                launchEntry();
                return true;
        }
        deleteEntry();
        return true;
    }

    public void onCreateMenu(ContextMenu paramContextMenu, ContextMenu.ContextMenuInfo paramContextMenuInfo) {
        paramContextMenu.add(0, 1, 0, 2131099757);
        if (!this.readOnly) {
            paramContextMenu.add(0, 2, 0, 2131099751);
        }
    }

    public void refreshTitle() {
        this.mTv.setText(this.mPw.getDisplayTitle());
    }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/com/keepassdroid/view/PwEntryView.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */