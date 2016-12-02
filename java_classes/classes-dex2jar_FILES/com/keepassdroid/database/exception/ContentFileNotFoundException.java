package com.keepassdroid.database.exception;

import android.net.Uri;
import com.keepassdroid.utils.EmptyUtils;
import java.io.FileNotFoundException;

public class ContentFileNotFoundException
  extends FileNotFoundException
{
  public static FileNotFoundException getInstance(Uri paramUri)
  {
    if (paramUri == null) {
      return new FileNotFoundException();
    }
    paramUri = paramUri.getScheme();
    if ((!EmptyUtils.isNullOrEmpty(paramUri)) && (paramUri.equalsIgnoreCase("content"))) {
      return new ContentFileNotFoundException();
    }
    return new FileNotFoundException();
  }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/com/keepassdroid/database/exception/ContentFileNotFoundException.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */