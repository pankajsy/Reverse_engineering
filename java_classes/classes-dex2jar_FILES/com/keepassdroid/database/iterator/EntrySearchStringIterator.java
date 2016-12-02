package com.keepassdroid.database.iterator;

import com.keepassdroid.database.PwEntry;
import com.keepassdroid.database.PwEntryV3;
import com.keepassdroid.database.PwEntryV4;
import com.keepassdroid.database.SearchParameters;
import com.keepassdroid.database.SearchParametersV4;
import java.util.Iterator;

public abstract class EntrySearchStringIterator
  implements Iterator<String>
{
  public static EntrySearchStringIterator getInstance(PwEntry paramPwEntry)
  {
    if ((paramPwEntry instanceof PwEntryV3)) {
      return new EntrySearchStringIteratorV3((PwEntryV3)paramPwEntry);
    }
    if ((paramPwEntry instanceof PwEntryV4)) {
      return new EntrySearchStringIteratorV4((PwEntryV4)paramPwEntry);
    }
    throw new RuntimeException("This should not be possible");
  }
  
  public static EntrySearchStringIterator getInstance(PwEntry paramPwEntry, SearchParameters paramSearchParameters)
  {
    if ((paramPwEntry instanceof PwEntryV3)) {
      return new EntrySearchStringIteratorV3((PwEntryV3)paramPwEntry, paramSearchParameters);
    }
    if ((paramPwEntry instanceof PwEntryV4)) {
      return new EntrySearchStringIteratorV4((PwEntryV4)paramPwEntry, (SearchParametersV4)paramSearchParameters);
    }
    throw new RuntimeException("This should not be possible");
  }
  
  public abstract boolean hasNext();
  
  public abstract String next();
  
  public void remove()
  {
    throw new UnsupportedOperationException("This iterator cannot be used to remove strings.");
  }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/com/keepassdroid/database/iterator/EntrySearchStringIterator.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */