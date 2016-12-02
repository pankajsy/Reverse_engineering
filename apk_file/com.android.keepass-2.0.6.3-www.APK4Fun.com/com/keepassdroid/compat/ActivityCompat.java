package com.keepassdroid.compat;

import android.app.Activity;

import java.lang.reflect.Method;

public class ActivityCompat {
    private static Method invalidateOptMenu;

    static {
        try {
            invalidateOptMenu = Activity.class.getMethod("invalidateOptionsMenu", (Class[]) null);
            return;
        } catch (Exception localException) {
        }
    }

    public static void invalidateOptionsMenu(Activity paramActivity) {
        if (invalidateOptMenu != null) {
        }
        try {
            invalidateOptMenu.invoke(paramActivity, (Object[]) null);
            return;
        } catch (Exception paramActivity) {
        }
    }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/com/keepassdroid/compat/ActivityCompat.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */