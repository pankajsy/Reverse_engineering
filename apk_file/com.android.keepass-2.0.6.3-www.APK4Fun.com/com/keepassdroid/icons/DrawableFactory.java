package com.keepassdroid.icons;

import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.drawable.Drawable;
import android.widget.ImageView;

import com.keepassdroid.compat.BitmapDrawableCompat;
import com.keepassdroid.database.PwIcon;
import com.keepassdroid.database.PwIconCustom;
import com.keepassdroid.database.PwIconStandard;

import org.apache.commons.collections.map.ReferenceMap;

public class DrawableFactory {
    private static Drawable blank = null;
    private static int blankHeight = -1;
    private static int blankWidth = -1;
    private ReferenceMap customIconMap = new ReferenceMap(0, 2);
    private ReferenceMap standardIconMap = new ReferenceMap(0, 2);

    private static void initBlank(Resources paramResources) {
        if (blank == null) {
            blank = paramResources.getDrawable(2130837573);
            blankWidth = blank.getIntrinsicWidth();
            blankHeight = blank.getIntrinsicHeight();
        }
    }

    private Drawable getIconDrawable(Resources paramResources, PwIcon paramPwIcon) {
        if ((paramPwIcon instanceof PwIconStandard)) {
            return getIconDrawable(paramResources, (PwIconStandard) paramPwIcon);
        }
        return getIconDrawable(paramResources, (PwIconCustom) paramPwIcon);
    }

    private Bitmap resize(Bitmap paramBitmap) {
        int i = paramBitmap.getWidth();
        int j = paramBitmap.getHeight();
        if ((i == blankWidth) && (j == blankHeight)) {
            return paramBitmap;
        }
        return Bitmap.createScaledBitmap(paramBitmap, blankWidth, blankHeight, true);
    }

    public void assignDrawableTo(ImageView paramImageView, Resources paramResources, PwIcon paramPwIcon) {
        paramImageView.setImageDrawable(getIconDrawable(paramResources, paramPwIcon));
    }

    public void clear() {
        this.standardIconMap.clear();
        this.customIconMap.clear();
    }

    public Drawable getIconDrawable(Resources paramResources, PwIconCustom paramPwIconCustom) {
        initBlank(paramResources);
        if (paramPwIconCustom == null) {
            localObject = blank;
        }
        Drawable localDrawable;
        do {
            return (Drawable) localObject;
            localDrawable = (Drawable) this.customIconMap.get(paramPwIconCustom.uuid);
            localObject = localDrawable;
        } while (localDrawable != null);
        if (paramPwIconCustom.imageData == null) {
            return blank;
        }
        Object localObject = BitmapFactory.decodeByteArray(paramPwIconCustom.imageData, 0, paramPwIconCustom.imageData.length);
        if (localObject == null) {
            return blank;
        }
        paramResources = BitmapDrawableCompat.getBitmapDrawable(paramResources, resize((Bitmap) localObject));
        this.customIconMap.put(paramPwIconCustom.uuid, paramResources);
        return paramResources;
    }

    public Drawable getIconDrawable(Resources paramResources, PwIconStandard paramPwIconStandard) {
        int i = Icons.iconToResId(paramPwIconStandard.iconId);
        Drawable localDrawable = (Drawable) this.standardIconMap.get(Integer.valueOf(i));
        paramPwIconStandard = localDrawable;
        if (localDrawable == null) {
            paramPwIconStandard = paramResources.getDrawable(i);
            this.standardIconMap.put(Integer.valueOf(i), paramPwIconStandard);
        }
        return paramPwIconStandard;
    }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/com/keepassdroid/icons/DrawableFactory.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */