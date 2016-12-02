package com.keepassdroid.compat;

import android.content.Intent;
import android.net.Uri;
import java.lang.reflect.Method;

public class ClipDataCompat
{
  private static Class clipData;
  private static Class clipDataItem;
  private static Class clipDescription;
  private static Method getClipDataFromIntent;
  private static Method getDescription;
  private static Method getItemAt;
  private static Method getItemCount;
  private static Method getLabel;
  private static Method getUri;
  private static boolean initSucceded;
  
  static
  {
    try
    {
      clipData = Class.forName("android.content.ClipData");
      getDescription = clipData.getMethod("getDescription", (Class[])null);
      getItemCount = clipData.getMethod("getItemCount", (Class[])null);
      getItemAt = clipData.getMethod("getItemAt", new Class[] { Integer.TYPE });
      clipDescription = Class.forName("android.content.ClipDescription");
      getLabel = clipDescription.getMethod("getLabel", (Class[])null);
      clipDataItem = Class.forName("android.content.ClipData$Item");
      getUri = clipDataItem.getMethod("getUri", (Class[])null);
      getClipDataFromIntent = Intent.class.getMethod("getClipData", (Class[])null);
      initSucceded = true;
      return;
    }
    catch (Exception localException)
    {
      for (;;)
      {
        initSucceded = false;
      }
    }
  }
  
  public static Uri getUriFromIntent(Intent paramIntent, String paramString)
  {
    if (initSucceded) {
      try
      {
        Object localObject1 = getClipDataFromIntent.invoke(paramIntent, null);
        if (localObject1 != null)
        {
          Object localObject2 = getDescription.invoke(localObject1, null);
          if ((((CharSequence)getLabel.invoke(localObject2, null)).equals(paramString)) && (((Integer)getItemCount.invoke(localObject1, null)).intValue() == 1))
          {
            localObject1 = getItemAt.invoke(localObject1, new Object[] { Integer.valueOf(0) });
            if (localObject1 != null)
            {
              localObject1 = (Uri)getUri.invoke(localObject1, null);
              return (Uri)localObject1;
            }
          }
        }
        return null;
      }
      catch (Exception localException) {}
    }
    return (Uri)paramIntent.getParcelableExtra(paramString);
  }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/com/keepassdroid/compat/ClipDataCompat.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */