package com.keepassdroid.database;

public class SearchParametersV4
  extends SearchParameters
  implements Cloneable
{
  public static SearchParametersV4 DEFAULT = new SearchParametersV4();
  public boolean searchInOther = true;
  public boolean searchInTags = true;
  public boolean searchInUUIDs = false;
  
  public Object clone()
  {
    return super.clone();
  }
  
  public void setupNone()
  {
    super.setupNone();
    this.searchInOther = false;
    this.searchInUUIDs = false;
    this.searchInTags = false;
  }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/com/keepassdroid/database/SearchParametersV4.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */