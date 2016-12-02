package com.keepassdroid.utils;

import android.app.Activity;
import android.content.ActivityNotFoundException;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.text.ClipboardManager;
import android.widget.TextView;

import com.keepassdroid.database.exception.SamsungClipboardException;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

public class Util {
    public static void copyStream(InputStream paramInputStream, OutputStream paramOutputStream)
            throws IOException {
        byte[] arrayOfByte = new byte['Ѐ'];
        for (; ; ) {
            int i = paramInputStream.read(arrayOfByte);
            if (i == -1) {
                break;
            }
            paramOutputStream.write(arrayOfByte, 0, i);
        }
    }

    public static void copyToClipboard(Context paramContext, String paramString)
            throws SamsungClipboardException {
        paramContext = (ClipboardManager) paramContext.getSystemService("clipboard");
        try {
            paramContext.setText(paramString);
            return;
        } catch (NullPointerException paramContext) {
            throw new SamsungClipboardException(paramContext);
        }
    }

    public static String getClipboard(Context paramContext) {
        paramContext = ((ClipboardManager) paramContext.getSystemService("clipboard")).getText();
        if (paramContext == null) {
            return "";
        }
        return paramContext.toString();
    }

    public static String getEditText(Activity paramActivity, int paramInt) {
        paramActivity = (TextView) paramActivity.findViewById(paramInt);
        if (paramActivity != null) {
            return paramActivity.getText().toString();
        }
        return "";
    }

    public static void gotoUrl(Context paramContext, int paramInt)
            throws ActivityNotFoundException {
        gotoUrl(paramContext, paramContext.getString(paramInt));
    }

    public static void gotoUrl(Context paramContext, String paramString)
            throws ActivityNotFoundException {
        if ((paramString != null) && (paramString.length() > 0)) {
            paramContext.startActivity(new Intent("android.intent.action.VIEW", Uri.parse(paramString)));
        }
    }

    public static void setEditText(Activity paramActivity, int paramInt, String paramString) {
        paramActivity = (TextView) paramActivity.findViewById(paramInt);
        if (paramActivity != null) {
            paramActivity.setText(paramString);
        }
    }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/com/keepassdroid/utils/Util.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */