package com.keepassdroid;

import android.content.ContentResolver;
import android.content.Context;
import android.net.Uri;
import com.keepassdroid.database.PwDatabase;
import com.keepassdroid.database.PwDatabaseV3;
import com.keepassdroid.database.PwGroup;
import com.keepassdroid.database.exception.InvalidDBException;
import com.keepassdroid.database.exception.PwDbOutputException;
import com.keepassdroid.database.load.Importer;
import com.keepassdroid.database.load.ImporterFactory;
import com.keepassdroid.database.save.PwDbOutput;
import com.keepassdroid.icons.DrawableFactory;
import com.keepassdroid.search.SearchDbHelper;
import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileDescriptor;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.SyncFailedException;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

public class Database
{
  public Set<PwGroup> dirty = new HashSet();
  public DrawableFactory drawFactory = new DrawableFactory();
  private boolean loaded = false;
  public Uri mUri;
  public boolean passwordEncodingError = false;
  public PwDatabase pm;
  public boolean readOnly = false;
  public SearchDbHelper searchHelper;
  
  public void LoadData(Context paramContext, Uri paramUri1, String paramString, Uri paramUri2)
    throws IOException, FileNotFoundException, InvalidDBException
  {
    LoadData(paramContext, paramUri1, paramString, paramUri2, new UpdateStatus(), false);
  }
  
  public void LoadData(Context paramContext, Uri paramUri1, String paramString, Uri paramUri2, UpdateStatus paramUpdateStatus)
    throws IOException, FileNotFoundException, InvalidDBException
  {
    LoadData(paramContext, paramUri1, paramString, paramUri2, paramUpdateStatus, false);
  }
  
  /* Error */
  public void LoadData(Context paramContext, Uri paramUri1, String paramString, Uri paramUri2, UpdateStatus paramUpdateStatus, boolean paramBoolean)
    throws IOException, FileNotFoundException, InvalidDBException
  {
    // Byte code:
    //   0: iconst_0
    //   1: istore 7
    //   3: aload_0
    //   4: aload_2
    //   5: putfield 60	com/keepassdroid/Database:mUri	Landroid/net/Uri;
    //   8: aload_0
    //   9: iconst_0
    //   10: putfield 30	com/keepassdroid/Database:readOnly	Z
    //   13: aload_2
    //   14: invokevirtual 66	android/net/Uri:getScheme	()Ljava/lang/String;
    //   17: ldc 68
    //   19: invokevirtual 74	java/lang/String:equals	(Ljava/lang/Object;)Z
    //   22: ifeq +29 -> 51
    //   25: new 76	java/io/File
    //   28: dup
    //   29: aload_2
    //   30: invokevirtual 79	android/net/Uri:getPath	()Ljava/lang/String;
    //   33: invokespecial 82	java/io/File:<init>	(Ljava/lang/String;)V
    //   36: invokevirtual 86	java/io/File:canWrite	()Z
    //   39: ifne +6 -> 45
    //   42: iconst_1
    //   43: istore 7
    //   45: aload_0
    //   46: iload 7
    //   48: putfield 30	com/keepassdroid/Database:readOnly	Z
    //   51: aload_1
    //   52: aload_2
    //   53: invokestatic 92	com/keepassdroid/utils/UriUtil:getUriInputStream	(Landroid/content/Context;Landroid/net/Uri;)Ljava/io/InputStream;
    //   56: astore 8
    //   58: aload_1
    //   59: aload 4
    //   61: invokestatic 92	com/keepassdroid/utils/UriUtil:getUriInputStream	(Landroid/content/Context;Landroid/net/Uri;)Ljava/io/InputStream;
    //   64: astore_2
    //   65: aload_0
    //   66: aload_1
    //   67: aload 8
    //   69: aload_3
    //   70: aload_2
    //   71: aload 5
    //   73: iload 6
    //   75: invokevirtual 95	com/keepassdroid/Database:LoadData	(Landroid/content/Context;Ljava/io/InputStream;Ljava/lang/String;Ljava/io/InputStream;Lcom/keepassdroid/UpdateStatus;Z)V
    //   78: return
    //   79: astore_1
    //   80: ldc 97
    //   82: ldc 99
    //   84: aload_1
    //   85: invokestatic 105	android/util/Log:e	(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    //   88: pop
    //   89: aload_2
    //   90: invokestatic 111	com/keepassdroid/database/exception/ContentFileNotFoundException:getInstance	(Landroid/net/Uri;)Ljava/io/FileNotFoundException;
    //   93: athrow
    //   94: astore_1
    //   95: ldc 97
    //   97: ldc 99
    //   99: aload_1
    //   100: invokestatic 105	android/util/Log:e	(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    //   103: pop
    //   104: aload 4
    //   106: invokestatic 111	com/keepassdroid/database/exception/ContentFileNotFoundException:getInstance	(Landroid/net/Uri;)Ljava/io/FileNotFoundException;
    //   109: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	110	0	this	Database
    //   0	110	1	paramContext	Context
    //   0	110	2	paramUri1	Uri
    //   0	110	3	paramString	String
    //   0	110	4	paramUri2	Uri
    //   0	110	5	paramUpdateStatus	UpdateStatus
    //   0	110	6	paramBoolean	boolean
    //   1	46	7	bool	boolean
    //   56	12	8	localInputStream	InputStream
    // Exception table:
    //   from	to	target	type
    //   51	58	79	java/lang/Exception
    //   58	65	94	java/lang/Exception
  }
  
  public void LoadData(Context paramContext, PwDatabase paramPwDatabase, String paramString, InputStream paramInputStream, UpdateStatus paramUpdateStatus)
  {
    if (paramPwDatabase != null) {
      if (paramPwDatabase.validatePasswordEncoding(paramString)) {
        break label39;
      }
    }
    label39:
    for (boolean bool = true;; bool = false)
    {
      this.passwordEncodingError = bool;
      this.searchHelper = new SearchDbHelper(paramContext);
      this.loaded = true;
      return;
    }
  }
  
  public void LoadData(Context paramContext, InputStream paramInputStream1, String paramString, InputStream paramInputStream2)
    throws IOException, InvalidDBException
  {
    LoadData(paramContext, paramInputStream1, paramString, paramInputStream2, new UpdateStatus(), false);
  }
  
  public void LoadData(Context paramContext, InputStream paramInputStream1, String paramString, InputStream paramInputStream2, UpdateStatus paramUpdateStatus, boolean paramBoolean)
    throws IOException, InvalidDBException
  {
    paramInputStream1 = new BufferedInputStream(paramInputStream1);
    if (!paramInputStream1.markSupported()) {
      throw new IOException("Input stream does not support mark.");
    }
    paramInputStream1.mark(10);
    Importer localImporter = ImporterFactory.createImporter(paramInputStream1, paramBoolean);
    paramInputStream1.reset();
    this.pm = localImporter.openDatabase(paramInputStream1, paramString, paramInputStream2, paramUpdateStatus);
    if (this.pm != null)
    {
      paramInputStream1 = this.pm.rootGroup;
      this.pm.populateGlobals(paramInputStream1);
      LoadData(paramContext, this.pm, paramString, paramInputStream2, paramUpdateStatus);
    }
    this.loaded = true;
  }
  
  public void LoadData(Context paramContext, InputStream paramInputStream1, String paramString, InputStream paramInputStream2, boolean paramBoolean)
    throws IOException, InvalidDBException
  {
    LoadData(paramContext, paramInputStream1, paramString, paramInputStream2, new UpdateStatus(), paramBoolean);
  }
  
  public boolean Loaded()
  {
    return this.loaded;
  }
  
  public void SaveData(Context paramContext)
    throws IOException, PwDbOutputException
  {
    SaveData(paramContext, this.mUri);
  }
  
  public void SaveData(Context paramContext, Uri paramUri)
    throws IOException, PwDbOutputException
  {
    File localFile;
    FileOutputStream localFileOutputStream;
    if (paramUri.getScheme().equals("file"))
    {
      paramContext = paramUri.getPath();
      localFile = new File(paramContext + ".tmp");
      localFileOutputStream = new FileOutputStream(localFile);
      PwDbOutput.getInstance(this.pm, localFileOutputStream).output();
      localFileOutputStream.close();
    }
    try
    {
      localFileOutputStream.getFD().sync();
      if (!localFile.renameTo(new File(paramContext))) {
        throw new IOException("Failed to store database.");
      }
      try
      {
        paramContext = paramContext.getContentResolver().openOutputStream(paramUri);
        PwDbOutput.getInstance(this.pm, paramContext).output();
        paramContext.close();
        this.mUri = paramUri;
        return;
      }
      catch (Exception paramContext)
      {
        throw new IOException("Failed to store database.");
      }
    }
    catch (SyncFailedException localSyncFailedException)
    {
      for (;;) {}
    }
  }
  
  public PwGroup Search(String paramString)
  {
    if (this.searchHelper == null) {
      return null;
    }
    return this.searchHelper.search(this, paramString);
  }
  
  public void clear()
  {
    this.dirty.clear();
    this.drawFactory.clear();
    this.pm = null;
    this.mUri = null;
    this.loaded = false;
    this.passwordEncodingError = false;
  }
  
  public void markAllGroupsAsDirty()
  {
    Iterator localIterator = this.pm.getGroups().iterator();
    while (localIterator.hasNext())
    {
      PwGroup localPwGroup = (PwGroup)localIterator.next();
      this.dirty.add(localPwGroup);
    }
    if ((this.pm instanceof PwDatabaseV3)) {
      this.dirty.add(this.pm.rootGroup);
    }
  }
  
  public void setLoaded()
  {
    this.loaded = true;
  }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/com/keepassdroid/Database.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */