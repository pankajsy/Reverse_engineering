package com.keepassdroid.app;

import android.app.Application;
import com.keepassdroid.Database;
import com.keepassdroid.compat.PRNGFixes;
import com.keepassdroid.fileselect.RecentFileHistory;
import java.util.Calendar;

public class App
  extends Application
{
  private static Calendar calendar = null;
  private static Database db = null;
  private static RecentFileHistory fileHistory = null;
  private static boolean shutdown = false;
  
  public static void clearShutdown()
  {
    shutdown = false;
  }
  
  public static Calendar getCalendar()
  {
    if (calendar == null) {
      calendar = Calendar.getInstance();
    }
    return calendar;
  }
  
  public static Database getDB()
  {
    if (db == null) {
      db = new Database();
    }
    return db;
  }
  
  public static RecentFileHistory getFileHistory()
  {
    return fileHistory;
  }
  
  public static boolean isShutdown()
  {
    return shutdown;
  }
  
  public static void setDB(Database paramDatabase)
  {
    db = paramDatabase;
  }
  
  public static void setShutdown()
  {
    shutdown = true;
  }
  
  public void onCreate()
  {
    super.onCreate();
    fileHistory = new RecentFileHistory(this);
    PRNGFixes.apply();
  }
  
  public void onTerminate()
  {
    if (db != null) {
      db.clear();
    }
    super.onTerminate();
  }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/com/keepassdroid/app/App.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */