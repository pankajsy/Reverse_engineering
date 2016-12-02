package com.keepassdroid.database.load;

import com.keepassdroid.UpdateStatus;
import com.keepassdroid.database.PwDatabase;
import com.keepassdroid.database.exception.InvalidDBException;

import java.io.IOException;
import java.io.InputStream;

public abstract class Importer {
    public static final boolean DEBUG = true;

    public abstract PwDatabase openDatabase(InputStream paramInputStream1, String paramString, InputStream paramInputStream2)
            throws IOException, InvalidDBException;

    public abstract PwDatabase openDatabase(InputStream paramInputStream1, String paramString, InputStream paramInputStream2, UpdateStatus paramUpdateStatus)
            throws IOException, InvalidDBException;
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/com/keepassdroid/database/load/Importer.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */