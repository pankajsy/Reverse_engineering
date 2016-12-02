package com.keepassdroid.compat;

import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.drawable.BitmapDrawable;

import java.lang.reflect.Constructor;

public class BitmapDrawableCompat {
    private static Constructor<BitmapDrawable> constResBitmap;

    static {
        try {
            constResBitmap = BitmapDrawable.class.getConstructor(new Class[]{Resources.class, Bitmap.class});
            return;
        } catch (Exception localException) {
        }
    }

    public static BitmapDrawable getBitmapDrawable(Resources paramResources, Bitmap paramBitmap) {
        if (constResBitmap != null) {
            try {
                paramResources = (BitmapDrawable) constResBitmap.newInstance(new Object[]{paramResources, paramBitmap});
                return paramResources;
            } catch (Exception paramResources) {
            }
        }
        return new BitmapDrawable(paramBitmap);
    }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/com/keepassdroid/compat/BitmapDrawableCompat.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */