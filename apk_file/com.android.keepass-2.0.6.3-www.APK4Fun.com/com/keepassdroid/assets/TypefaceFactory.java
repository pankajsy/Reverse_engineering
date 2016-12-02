package com.keepassdroid.assets;

import android.content.Context;
import android.graphics.Typeface;

import org.apache.commons.collections.map.ReferenceMap;

public class TypefaceFactory {
    private static ReferenceMap typefaceMap = new ReferenceMap(0, 2);

    public static Typeface getTypeface(Context paramContext, String paramString) {
        Typeface localTypeface = (Typeface) typefaceMap.get(paramString);
        if (localTypeface != null) {
            return localTypeface;
        }
        try {
            paramContext = Typeface.createFromAsset(paramContext.getAssets(), paramString);
            return paramContext;
        } catch (Exception paramContext) {
        }
        return null;
    }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/com/keepassdroid/assets/TypefaceFactory.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */