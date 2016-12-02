package com.keepassdroid.database.edit;

import android.net.Uri;

public class FileOnFinish
  extends OnFinish
{
  private Uri mFilename = null;
  protected FileOnFinish mOnFinish;
  
  public FileOnFinish(FileOnFinish paramFileOnFinish)
  {
    super(paramFileOnFinish);
    this.mOnFinish = paramFileOnFinish;
  }
  
  public Uri getFilename()
  {
    return this.mFilename;
  }
  
  public void setFilename(Uri paramUri)
  {
    this.mFilename = paramUri;
  }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/com/keepassdroid/database/edit/FileOnFinish.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */