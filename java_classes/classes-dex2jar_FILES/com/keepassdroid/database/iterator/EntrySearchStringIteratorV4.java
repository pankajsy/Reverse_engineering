package com.keepassdroid.database.iterator;

import com.keepassdroid.database.PwEntryV4;
import com.keepassdroid.database.SearchParametersV4;
import com.keepassdroid.database.security.ProtectedString;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map.Entry;
import java.util.NoSuchElementException;
import java.util.Set;

public class EntrySearchStringIteratorV4
  extends EntrySearchStringIterator
{
  private String current;
  private Iterator<Map.Entry<String, ProtectedString>> setIterator;
  private SearchParametersV4 sp;
  
  public EntrySearchStringIteratorV4(PwEntryV4 paramPwEntryV4)
  {
    this.sp = SearchParametersV4.DEFAULT;
    this.setIterator = paramPwEntryV4.strings.entrySet().iterator();
    advance();
  }
  
  public EntrySearchStringIteratorV4(PwEntryV4 paramPwEntryV4, SearchParametersV4 paramSearchParametersV4)
  {
    this.sp = paramSearchParametersV4;
    this.setIterator = paramPwEntryV4.strings.entrySet().iterator();
    advance();
  }
  
  private void advance()
  {
    while (this.setIterator.hasNext())
    {
      Map.Entry localEntry = (Map.Entry)this.setIterator.next();
      if (searchInField((String)localEntry.getKey()))
      {
        this.current = ((ProtectedString)localEntry.getValue()).toString();
        return;
      }
    }
    this.current = null;
  }
  
  private boolean searchInField(String paramString)
  {
    if (paramString.equals("Title")) {
      return this.sp.searchInTitles;
    }
    if (paramString.equals("UserName")) {
      return this.sp.searchInUserNames;
    }
    if (paramString.equals("Password")) {
      return this.sp.searchInPasswords;
    }
    if (paramString.equals("URL")) {
      return this.sp.searchInUrls;
    }
    if (paramString.equals("Notes")) {
      return this.sp.searchInNotes;
    }
    return this.sp.searchInOther;
  }
  
  public boolean hasNext()
  {
    return this.current != null;
  }
  
  public String next()
  {
    if (this.current == null) {
      throw new NoSuchElementException("Past the end of the list.");
    }
    String str = this.current;
    advance();
    return str;
  }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/com/keepassdroid/database/iterator/EntrySearchStringIteratorV4.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */