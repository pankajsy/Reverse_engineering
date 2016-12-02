package com.keepassdroid.database;

public class SearchParameters
  implements Cloneable
{
  public static final SearchParameters DEFAULT = new SearchParameters();
  public boolean excludeExpired = false;
  public boolean ignoreCase = true;
  public boolean ignoreExpired = false;
  public boolean regularExpression = false;
  public boolean respectEntrySearchingDisabled = true;
  public boolean searchInGroupNames = false;
  public boolean searchInNotes = true;
  public boolean searchInPasswords = false;
  public boolean searchInTitles = true;
  public boolean searchInUrls = true;
  public boolean searchInUserNames = true;
  public String searchString;
  
  public Object clone()
  {
    try
    {
      Object localObject = super.clone();
      return localObject;
    }
    catch (CloneNotSupportedException localCloneNotSupportedException) {}
    return null;
  }
  
  public void setupNone()
  {
    this.searchInTitles = false;
    this.searchInUserNames = false;
    this.searchInPasswords = false;
    this.searchInUrls = false;
    this.searchInGroupNames = false;
    this.searchInNotes = false;
  }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/com/keepassdroid/database/SearchParameters.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */