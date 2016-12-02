package com.keepassdroid.fileselect;

import android.content.ContentValues;
import android.content.Context;
import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import android.database.Cursor;
import android.database.SQLException;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;
import com.keepassdroid.compat.EditorCompat;
import java.io.File;
import java.io.FileFilter;

public class FileDbHelper
{
  private static final String DATABASE_CREATE = "create table files ( _id integer primary key autoincrement, fileName text not null, keyFile text, updated integer not null);";
  public static final String DATABASE_NAME = "keepassdroid";
  private static final int DATABASE_VERSION = 1;
  private static final String FILE_TABLE = "files";
  public static final String KEY_FILE_FILENAME = "fileName";
  public static final String KEY_FILE_ID = "_id";
  public static final String KEY_FILE_KEYFILE = "keyFile";
  public static final String KEY_FILE_UPDATED = "updated";
  public static final String LAST_FILENAME = "lastFile";
  public static final String LAST_KEYFILE = "lastKey";
  public static final int MAX_FILES = 5;
  private final Context mCtx;
  private SQLiteDatabase mDb;
  private DatabaseHelper mDbHelper;
  
  public FileDbHelper(Context paramContext)
  {
    this.mCtx = paramContext;
  }
  
  private void deleteAllBut(int paramInt)
  {
    Cursor localCursor = this.mDb.query("files", new String[] { "updated" }, null, null, null, null, "updated");
    if (localCursor.getCount() > paramInt)
    {
      localCursor.moveToFirst();
      long l = localCursor.getLong(localCursor.getColumnIndexOrThrow("updated"));
      this.mDb.execSQL("DELETE FROM files WHERE updated<" + l + ";");
    }
    localCursor.close();
  }
  
  public static boolean deleteDatabase(Context paramContext)
  {
    paramContext = paramContext.getDatabasePath("keepassdroid");
    if (paramContext == null) {
      throw new IllegalArgumentException("file must not be null");
    }
    boolean bool1 = false | paramContext.delete() | new File(paramContext.getPath() + "-journal").delete() | new File(paramContext.getPath() + "-shm").delete() | new File(paramContext.getPath() + "-wal").delete();
    File localFile = paramContext.getParentFile();
    boolean bool2 = bool1;
    if (localFile != null)
    {
      paramContext = localFile.listFiles(new FileFilter()
      {
        public boolean accept(File paramAnonymousFile)
        {
          return paramAnonymousFile.getName().startsWith(this.val$prefix);
        }
      });
      int j = paramContext.length;
      int i = 0;
      for (;;)
      {
        bool2 = bool1;
        if (i >= j) {
          break;
        }
        bool1 |= paramContext[i].delete();
        i += 1;
      }
    }
    return bool2;
  }
  
  public void close()
  {
    this.mDb.close();
  }
  
  /* Error */
  public long createFile(String paramString1, String paramString2)
  {
    // Byte code:
    //   0: aload_0
    //   1: getfield 60	com/keepassdroid/fileselect/FileDbHelper:mDb	Landroid/database/sqlite/SQLiteDatabase;
    //   4: iconst_1
    //   5: ldc 22
    //   7: iconst_1
    //   8: anewarray 62	java/lang/String
    //   11: dup
    //   12: iconst_0
    //   13: ldc 28
    //   15: aastore
    //   16: ldc -95
    //   18: iconst_1
    //   19: anewarray 62	java/lang/String
    //   22: dup
    //   23: iconst_0
    //   24: aload_1
    //   25: aastore
    //   26: aconst_null
    //   27: aconst_null
    //   28: aconst_null
    //   29: aconst_null
    //   30: invokevirtual 164	android/database/sqlite/SQLiteDatabase:query	(ZLjava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    //   33: astore 5
    //   35: aload 5
    //   37: invokeinterface 74 1 0
    //   42: ifle +106 -> 148
    //   45: aload 5
    //   47: invokeinterface 78 1 0
    //   52: pop
    //   53: aload 5
    //   55: aload 5
    //   57: ldc 28
    //   59: invokeinterface 82 2 0
    //   64: invokeinterface 86 2 0
    //   69: lstore_3
    //   70: new 166	android/content/ContentValues
    //   73: dup
    //   74: invokespecial 167	android/content/ContentValues:<init>	()V
    //   77: astore_1
    //   78: aload_1
    //   79: ldc 31
    //   81: aload_2
    //   82: invokevirtual 171	android/content/ContentValues:put	(Ljava/lang/String;Ljava/lang/String;)V
    //   85: aload_1
    //   86: ldc 34
    //   88: invokestatic 177	java/lang/System:currentTimeMillis	()J
    //   91: invokestatic 183	java/lang/Long:valueOf	(J)Ljava/lang/Long;
    //   94: invokevirtual 186	android/content/ContentValues:put	(Ljava/lang/String;Ljava/lang/Long;)V
    //   97: aload_0
    //   98: getfield 60	com/keepassdroid/fileselect/FileDbHelper:mDb	Landroid/database/sqlite/SQLiteDatabase;
    //   101: ldc 22
    //   103: aload_1
    //   104: new 88	java/lang/StringBuilder
    //   107: dup
    //   108: invokespecial 89	java/lang/StringBuilder:<init>	()V
    //   111: ldc -68
    //   113: invokevirtual 95	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   116: lload_3
    //   117: invokevirtual 98	java/lang/StringBuilder:append	(J)Ljava/lang/StringBuilder;
    //   120: invokevirtual 104	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   123: aconst_null
    //   124: invokevirtual 192	android/database/sqlite/SQLiteDatabase:update	(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I
    //   127: i2l
    //   128: lstore_3
    //   129: aload_0
    //   130: iconst_5
    //   131: invokespecial 194	com/keepassdroid/fileselect/FileDbHelper:deleteAllBut	(I)V
    //   134: aload 5
    //   136: invokeinterface 111 1 0
    //   141: lload_3
    //   142: lreturn
    //   143: astore_1
    //   144: ldc2_w 195
    //   147: lreturn
    //   148: new 166	android/content/ContentValues
    //   151: dup
    //   152: invokespecial 167	android/content/ContentValues:<init>	()V
    //   155: astore 6
    //   157: aload 6
    //   159: ldc 25
    //   161: aload_1
    //   162: invokevirtual 171	android/content/ContentValues:put	(Ljava/lang/String;Ljava/lang/String;)V
    //   165: aload 6
    //   167: ldc 31
    //   169: aload_2
    //   170: invokevirtual 171	android/content/ContentValues:put	(Ljava/lang/String;Ljava/lang/String;)V
    //   173: aload 6
    //   175: ldc 34
    //   177: invokestatic 177	java/lang/System:currentTimeMillis	()J
    //   180: invokestatic 183	java/lang/Long:valueOf	(J)Ljava/lang/Long;
    //   183: invokevirtual 186	android/content/ContentValues:put	(Ljava/lang/String;Ljava/lang/Long;)V
    //   186: aload_0
    //   187: getfield 60	com/keepassdroid/fileselect/FileDbHelper:mDb	Landroid/database/sqlite/SQLiteDatabase;
    //   190: ldc 22
    //   192: aconst_null
    //   193: aload 6
    //   195: invokevirtual 200	android/database/sqlite/SQLiteDatabase:insert	(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J
    //   198: lstore_3
    //   199: goto -70 -> 129
    //   202: astore_1
    //   203: aload_1
    //   204: invokevirtual 203	java/lang/Exception:printStackTrace	()V
    //   207: goto -73 -> 134
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	210	0	this	FileDbHelper
    //   0	210	1	paramString1	String
    //   0	210	2	paramString2	String
    //   69	130	3	l	long
    //   33	102	5	localCursor	Cursor
    //   155	39	6	localContentValues	ContentValues
    // Exception table:
    //   from	to	target	type
    //   0	35	143	java/lang/Exception
    //   129	134	202	java/lang/Exception
  }
  
  public void deleteAllKeys()
  {
    ContentValues localContentValues = new ContentValues();
    localContentValues.put("keyFile", "");
    this.mDb.update("files", localContentValues, null, null);
  }
  
  public void deleteFile(String paramString)
  {
    this.mDb.delete("files", "fileName = ?", new String[] { paramString });
  }
  
  public Cursor fetchAllFiles()
  {
    SQLiteDatabase localSQLiteDatabase = this.mDb;
    String str = Integer.toString(5);
    return localSQLiteDatabase.query("files", new String[] { "_id", "fileName", "keyFile" }, null, null, null, null, "updated DESC", str);
  }
  
  public Cursor fetchFile(long paramLong)
    throws SQLException
  {
    Object localObject = this.mDb;
    String str = "_id=" + paramLong;
    localObject = ((SQLiteDatabase)localObject).query(true, "files", new String[] { "fileName", "keyFile" }, str, null, null, null, null, null);
    if (localObject != null) {
      ((Cursor)localObject).moveToFirst();
    }
    return (Cursor)localObject;
  }
  
  public String getFileByName(String paramString)
  {
    Cursor localCursor = this.mDb.query(true, "files", new String[] { "keyFile" }, "fileName= ?", new String[] { paramString }, null, null, null, null);
    if (localCursor == null) {
      return "";
    }
    if (localCursor.moveToFirst()) {}
    for (paramString = localCursor.getString(0);; paramString = "")
    {
      localCursor.close();
      return paramString;
    }
  }
  
  public boolean hasRecentFiles()
  {
    Cursor localCursor = fetchAllFiles();
    if (localCursor.getCount() > 0) {}
    for (boolean bool = true;; bool = false)
    {
      localCursor.close();
      return bool;
    }
  }
  
  public boolean isOpen()
  {
    return this.mDb.isOpen();
  }
  
  public FileDbHelper open()
    throws SQLException
  {
    this.mDbHelper = new DatabaseHelper(this.mCtx);
    this.mDb = this.mDbHelper.getWritableDatabase();
    return this;
  }
  
  private static class DatabaseHelper
    extends SQLiteOpenHelper
  {
    private final Context mCtx;
    
    DatabaseHelper(Context paramContext)
    {
      super("keepassdroid", null, 1);
      this.mCtx = paramContext;
    }
    
    private void deletePrefs(SharedPreferences paramSharedPreferences)
    {
      try
      {
        paramSharedPreferences = paramSharedPreferences.edit();
        paramSharedPreferences.remove("lastFile");
        paramSharedPreferences.remove("lastKey");
        EditorCompat.apply(paramSharedPreferences);
        return;
      }
      catch (Exception paramSharedPreferences) {}
    }
    
    public void onCreate(SQLiteDatabase paramSQLiteDatabase)
    {
      paramSQLiteDatabase.execSQL("create table files ( _id integer primary key autoincrement, fileName text not null, keyFile text, updated integer not null);");
      SharedPreferences localSharedPreferences = this.mCtx.getSharedPreferences("PasswordActivity", 0);
      String str1 = localSharedPreferences.getString("lastFile", "");
      String str2 = localSharedPreferences.getString("lastKey", "");
      if (str1.length() > 0)
      {
        ContentValues localContentValues = new ContentValues();
        localContentValues.put("fileName", str1);
        localContentValues.put("updated", Long.valueOf(System.currentTimeMillis()));
        if (str2.length() > 0) {
          localContentValues.put("keyFile", str2);
        }
        paramSQLiteDatabase.insert("files", null, localContentValues);
        deletePrefs(localSharedPreferences);
      }
    }
    
    public void onUpgrade(SQLiteDatabase paramSQLiteDatabase, int paramInt1, int paramInt2) {}
  }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/com/keepassdroid/fileselect/FileDbHelper.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */