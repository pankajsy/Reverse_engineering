package com.keepassdroid.dialog;

import android.content.Context;

import com.keepassdroid.compat.BuildCompat;

public class ReadOnlyDialog
        extends WarningDialog {
    public ReadOnlyDialog(Context paramContext) {
        super(paramContext, 2131099849);
        this.warning = paramContext.getString(2131099812);
        if (BuildCompat.getSdkVersion() >= 19) {
            this.warning = this.warning.concat("\n\n").concat(paramContext.getString(2131099811));
        }
    }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/com/keepassdroid/dialog/ReadOnlyDialog.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */