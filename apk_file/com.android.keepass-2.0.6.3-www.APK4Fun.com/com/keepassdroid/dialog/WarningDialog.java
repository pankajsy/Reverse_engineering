package com.keepassdroid.dialog;

import android.app.AlertDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.preference.PreferenceManager;

public class WarningDialog
        extends AlertDialog {
    protected String warning;
    private int showKey;

    public WarningDialog(Context paramContext, int paramInt) {
        super(paramContext);
        this.showKey = paramInt;
    }

    public WarningDialog(Context paramContext, int paramInt1, int paramInt2) {
        this(paramContext, paramInt2);
        this.warning = paramContext.getString(paramInt1);
    }

    protected void onCreate(Bundle paramBundle) {
        Context localContext = getContext();
        setMessage(this.warning);
        setButton(-1, localContext.getText(17039370), new DialogInterface.OnClickListener() {
            public void onClick(DialogInterface paramAnonymousDialogInterface, int paramAnonymousInt) {
                WarningDialog.this.dismiss();
            }
        });
        setButton(-2, localContext.getText(2131099798), new DialogInterface.OnClickListener() {
            public void onClick(DialogInterface paramAnonymousDialogInterface, int paramAnonymousInt) {
                paramAnonymousDialogInterface = WarningDialog.this.getContext();
                SharedPreferences.Editor localEditor = PreferenceManager.getDefaultSharedPreferences(paramAnonymousDialogInterface).edit();
                localEditor.putBoolean(paramAnonymousDialogInterface.getString(WarningDialog.this.showKey), false);
                localEditor.commit();
                WarningDialog.this.dismiss();
            }
        });
        super.onCreate(paramBundle);
    }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/com/keepassdroid/dialog/WarningDialog.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */