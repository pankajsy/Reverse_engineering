package com.keepassdroid.icons;

import android.util.SparseIntArray;

import java.lang.reflect.Field;

public class Icons {
    private static SparseIntArray icons = null;

    private static void buildList() {
        if (icons == null) {
            icons = new SparseIntArray();
            Field[] arrayOfField = R.drawable.class.getFields();
            int i = 0;
            if (i < arrayOfField.length) {
                String str = arrayOfField[i].getName();
                int j;
                if (str.matches("ic\\d{2}.*")) {
                    j = Integer.parseInt(str.substring(2, 4));
                    if (j <= 69) {
                        break label72;
                    }
                }
                for (; ; ) {
                    i += 1;
                    break;
                    try {
                        label72:
                        int k = arrayOfField[i].getInt(null);
                        icons.put(j, k);
                    } catch (Exception localException) {
                    }
                }
            }
        }
    }

    public static int count() {
        buildList();
        return icons.size();
    }

    public static int iconToResId(int paramInt) {
        buildList();
        return icons.get(paramInt, 2130837573);
    }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/com/keepassdroid/icons/Icons.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */