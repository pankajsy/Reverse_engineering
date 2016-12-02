package com.keepassdroid.database.load;

import com.keepassdroid.UpdateStatus;
import com.keepassdroid.database.PwDatabaseV4Debug;
import com.keepassdroid.database.exception.InvalidDBException;
import java.io.IOException;
import java.io.InputStream;

public class ImporterV4Debug
  extends ImporterV4
{
  protected PwDatabaseV4Debug createDB()
  {
    return new PwDatabaseV4Debug();
  }
  
  public PwDatabaseV4Debug openDatabase(InputStream paramInputStream1, String paramString, InputStream paramInputStream2, UpdateStatus paramUpdateStatus)
    throws IOException, InvalidDBException
  {
    return (PwDatabaseV4Debug)super.openDatabase(paramInputStream1, paramString, paramInputStream2, paramUpdateStatus);
  }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/com/keepassdroid/database/load/ImporterV4Debug.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */