package com.keepassdroid.utils;

import android.net.Uri;

import com.keepassdroid.database.PwDate;
import com.keepassdroid.database.PwEntryV3;

public class EmptyUtils {
    public static boolean isNullOrEmpty(Uri paramUri) {
        return (paramUri == null) || (paramUri.toString().length() == 0);
    }

    public static boolean isNullOrEmpty(PwDate paramPwDate) {
        return (paramPwDate == null) || (paramPwDate.equals(PwEntryV3.DEFAULT_PWDATE));
    }

    public static boolean isNullOrEmpty(String paramString) {
        return (paramString == null) || (paramString.length() == 0);
    }

    public static boolean isNullOrEmpty(byte[] paramArrayOfByte) {
        return (paramArrayOfByte == null) || (paramArrayOfByte.length == 0);
    }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/com/keepassdroid/utils/EmptyUtils.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */