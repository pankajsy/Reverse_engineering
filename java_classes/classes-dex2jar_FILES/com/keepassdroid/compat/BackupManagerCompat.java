package com.keepassdroid.compat;

import android.content.Context;
import java.lang.reflect.Constructor;
import java.lang.reflect.Method;

public class BackupManagerCompat
{
  private static Class classBackupManager;
  private static Constructor constructorBackupManager;
  private static Method dataChanged;
  private Object backupManager;
  
  static
  {
    try
    {
      classBackupManager = Class.forName("android.app.backup.BackupManager");
      constructorBackupManager = classBackupManager.getConstructor(new Class[] { Context.class });
      dataChanged = classBackupManager.getMethod("dataChanged", (Class[])null);
      return;
    }
    catch (Exception localException) {}
  }
  
  public BackupManagerCompat(Context paramContext)
  {
    if (constructorBackupManager != null) {}
    try
    {
      this.backupManager = constructorBackupManager.newInstance(new Object[] { paramContext });
      return;
    }
    catch (Exception paramContext) {}
  }
  
  public void dataChanged()
  {
    if ((this.backupManager != null) && (dataChanged != null)) {}
    try
    {
      dataChanged.invoke(this.backupManager, (Object[])null);
      return;
    }
    catch (Exception localException) {}
  }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/com/keepassdroid/compat/BackupManagerCompat.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */