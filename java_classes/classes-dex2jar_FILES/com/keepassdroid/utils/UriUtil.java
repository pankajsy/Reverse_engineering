package com.keepassdroid.utils;

import android.content.ContentResolver;
import android.content.Context;
import android.database.Cursor;
import android.net.Uri;
import android.net.Uri.Builder;
import com.keepassdroid.compat.StorageAF;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;

public class UriUtil
{
  public static boolean equalsDefaultfile(Uri paramUri, String paramString)
  {
    return parseDefaultFile(paramUri).equals(parseDefaultFile(paramString));
  }
  
  public static InputStream getUriInputStream(Context paramContext, Uri paramUri)
    throws FileNotFoundException
  {
    if (paramUri == null) {}
    String str;
    do
    {
      return null;
      str = paramUri.getScheme();
      if ((EmptyUtils.isNullOrEmpty(str)) || (str.equals("file"))) {
        return new FileInputStream(paramUri.getPath());
      }
    } while (!str.equals("content"));
    return paramContext.getContentResolver().openInputStream(paramUri);
  }
  
  private static boolean hasWritableContentUri(Uri paramUri)
  {
    String str = paramUri.getScheme();
    if (EmptyUtils.isNullOrEmpty(str)) {}
    while (!str.equalsIgnoreCase("content")) {
      return false;
    }
    paramUri = paramUri.getAuthority();
    int i = -1;
    switch (paramUri.hashCode())
    {
    }
    for (;;)
    {
      switch (i)
      {
      default: 
        return false;
      }
      return true;
      if (paramUri.equals("com.google.android.apps.docs.storage")) {
        i = 0;
      }
    }
  }
  
  private static boolean isValidFilePath(String paramString)
  {
    if (EmptyUtils.isNullOrEmpty(paramString)) {}
    do
    {
      return false;
      paramString = new File(paramString);
    } while ((!paramString.exists()) || (!paramString.canRead()));
    return true;
  }
  
  public static Uri parseDefaultFile(Uri paramUri)
  {
    Uri localUri = paramUri;
    if (EmptyUtils.isNullOrEmpty(paramUri.getScheme())) {
      localUri = paramUri.buildUpon().scheme("file").authority("").build();
    }
    return localUri;
  }
  
  public static Uri parseDefaultFile(String paramString)
  {
    if (EmptyUtils.isNullOrEmpty(paramString)) {
      paramString = null;
    }
    Uri localUri;
    do
    {
      return paramString;
      localUri = Uri.parse(paramString);
      paramString = localUri;
    } while (!EmptyUtils.isNullOrEmpty(localUri.getScheme()));
    return localUri.buildUpon().scheme("file").authority("").build();
  }
  
  public static Uri translate(Context paramContext, Uri paramUri)
  {
    if ((StorageAF.useStorageFramework(paramContext)) || (hasWritableContentUri(paramUri))) {
      return paramUri;
    }
    Object localObject3 = paramUri.getScheme();
    if (EmptyUtils.isNullOrEmpty((String)localObject3)) {
      return paramUri;
    }
    Object localObject2 = null;
    Object localObject1 = localObject2;
    try
    {
      if (((String)localObject3).equalsIgnoreCase("content"))
      {
        localObject3 = paramContext.getContentResolver().query(paramUri, new String[] { "_data" }, null, null, null);
        ((Cursor)localObject3).moveToFirst();
        localObject1 = localObject2;
        if (localObject3 != null)
        {
          paramContext = ((Cursor)localObject3).getString(0);
          ((Cursor)localObject3).close();
          localObject1 = paramContext;
          if (!isValidFilePath(paramContext)) {
            localObject1 = null;
          }
        }
      }
      paramContext = (Context)localObject1;
      if (EmptyUtils.isNullOrEmpty((String)localObject1))
      {
        paramContext = paramUri.getEncodedPath();
        boolean bool = isValidFilePath(paramContext);
        if (!bool) {
          paramContext = null;
        }
      }
    }
    catch (Exception paramContext)
    {
      for (;;)
      {
        paramContext = null;
      }
    }
    if (!EmptyUtils.isNullOrEmpty(paramContext)) {
      paramUri = new Uri.Builder().scheme("file").authority("").path(paramContext).build();
    }
    return paramUri;
  }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/com/keepassdroid/utils/UriUtil.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */