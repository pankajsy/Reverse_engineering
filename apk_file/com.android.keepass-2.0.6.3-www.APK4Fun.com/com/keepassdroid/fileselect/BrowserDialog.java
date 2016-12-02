package com.keepassdroid.fileselect;

import android.app.Dialog;
import android.content.Context;
import android.content.pm.PackageManager;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;

import com.keepassdroid.utils.Util;

public class BrowserDialog
        extends Dialog {
    public BrowserDialog(Context paramContext) {
        super(paramContext);
    }

    private boolean isMarketInstalled() {
        PackageManager localPackageManager = getContext().getPackageManager();
        try {
            localPackageManager.getPackageInfo("com.android.vending", 0);
            return true;
        } catch (PackageManager.NameNotFoundException localNameNotFoundException) {
        }
        return false;
    }

    protected void onCreate(Bundle paramBundle) {
        super.onCreate(paramBundle);
        setContentView(2130903041);
        setTitle(2131099720);
        ((Button) findViewById(2131427342)).setOnClickListener(new View.OnClickListener() {
            public void onClick(View paramAnonymousView) {
                BrowserDialog.this.cancel();
            }
        });
        paramBundle = (Button) findViewById(2131427340);
        paramBundle.setOnClickListener(new View.OnClickListener() {
            public void onClick(View paramAnonymousView) {
                Util.gotoUrl(BrowserDialog.this.getContext(), 2131099842);
                BrowserDialog.this.cancel();
            }
        });
        if (!isMarketInstalled()) {
            paramBundle.setVisibility(8);
        }
        ((Button) findViewById(2131427341)).setOnClickListener(new View.OnClickListener() {
            public void onClick(View paramAnonymousView) {
                Util.gotoUrl(BrowserDialog.this.getContext(), 2131099843);
                BrowserDialog.this.cancel();
            }
        });
    }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/com/keepassdroid/fileselect/BrowserDialog.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */