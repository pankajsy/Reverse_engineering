package com.keepassdroid.dialog;

import android.app.AlertDialog;
import android.content.Context;
import android.content.DialogInterface;

public class PasswordEncodingDialogHelper {
    private AlertDialog dialog;

    public void show(Context paramContext, DialogInterface.OnClickListener paramOnClickListener) {
        show(paramContext, paramOnClickListener, false);
    }

    public void show(Context paramContext, DialogInterface.OnClickListener paramOnClickListener, boolean paramBoolean) {
        paramContext = new AlertDialog.Builder(paramContext);
        paramContext.setMessage(2131099821).setTitle(2131099820);
        paramContext.setPositiveButton(17039370, paramOnClickListener);
        if (paramBoolean) {
            paramContext.setNegativeButton(17039360, new DialogInterface.OnClickListener() {
                public void onClick(DialogInterface paramAnonymousDialogInterface, int paramAnonymousInt) {
                    paramAnonymousDialogInterface.cancel();
                }
            });
        }
        this.dialog = paramContext.create();
        this.dialog.show();
    }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/com/keepassdroid/dialog/PasswordEncodingDialogHelper.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */