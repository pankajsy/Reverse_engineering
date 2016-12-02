package com.keepassdroid.timeout;

import android.app.Activity;
import android.content.SharedPreferences;
import android.preference.PreferenceManager;

import com.keepassdroid.app.App;
import com.keepassdroid.compat.EditorCompat;
import com.keepassdroid.timers.Timeout;

public class TimeoutHelper {
    private static final long DEFAULT_TIMEOUT = 300000L;

    public static void checkShutdown(Activity paramActivity) {
        if ((App.isShutdown()) && (App.getDB().Loaded())) {
            paramActivity.setResult(1);
            paramActivity.finish();
        }
    }

    public static void pause(Activity paramActivity) {
        long l = System.currentTimeMillis();
        SharedPreferences.Editor localEditor = PreferenceManager.getDefaultSharedPreferences(paramActivity).edit();
        localEditor.putLong(paramActivity.getString(2131099851), l);
        EditorCompat.apply(localEditor);
        if (App.getDB().Loaded()) {
            Timeout.start(paramActivity);
        }
    }

    public static void resume(Activity paramActivity) {
        if (App.getDB().Loaded()) {
            Timeout.cancel(paramActivity);
        }
        long l2 = System.currentTimeMillis();
        SharedPreferences localSharedPreferences = PreferenceManager.getDefaultSharedPreferences(paramActivity);
        long l3 = localSharedPreferences.getLong(paramActivity.getString(2131099851), -1L);
        if (l3 == -1L) {
        }
        for (; ; ) {
            return;
            paramActivity = localSharedPreferences.getString(paramActivity.getString(2131099824), paramActivity.getString(2131099826));
            try {
                l1 = Long.parseLong(paramActivity);
                if ((l1 == -1L) || (l2 - l3 < l1)) {
                    continue;
                }
                App.setShutdown();
                return;
            } catch (NumberFormatException paramActivity) {
                for (; ; ) {
                    long l1 = 300000L;
                }
            }
        }
    }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/com/keepassdroid/timeout/TimeoutHelper.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */