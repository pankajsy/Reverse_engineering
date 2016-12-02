package com.keepassdroid.compat;

import android.app.Activity;

import java.lang.reflect.Method;

public class EditorCompat {
    private static Method apply;

    static {
        try {
            apply = Activity.class.getMethod("apply", (Class[]) null);
            return;
        } catch (Exception localException1) {
            try {
                apply = Activity.class.getMethod("commit", (Class[]) null);
                return;
            } catch (Exception localException2) {
            }
        }
    }

    public static void apply(SharedPreferences.Editor paramEditor) {
        try {
            apply.invoke(paramEditor, (Object[]) null);
            return;
        } catch (Exception localException) {
            paramEditor.commit();
        }
    }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/com/keepassdroid/compat/EditorCompat.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */