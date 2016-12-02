package com.keepassdroid.database;

public abstract class EntryHandler<T extends PwEntry>
{
  public abstract boolean operate(T paramT);
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/com/keepassdroid/database/EntryHandler.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */