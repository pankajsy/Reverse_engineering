package com.keepassdroid.database;

import com.keepassdroid.database.iterator.EntrySearchStringIterator;
import java.util.Date;
import java.util.List;

public abstract class EntrySearchHandler
  extends EntryHandler<PwEntry>
{
  private List<PwEntry> listStorage;
  private Date now;
  private SearchParameters sp;
  
  protected EntrySearchHandler(SearchParameters paramSearchParameters, List<PwEntry> paramList)
  {
    this.sp = paramSearchParameters;
    this.listStorage = paramList;
    this.now = new Date();
  }
  
  public static EntrySearchHandler getInstance(PwGroup paramPwGroup, SearchParameters paramSearchParameters, List<PwEntry> paramList)
  {
    if ((paramPwGroup instanceof PwGroupV3)) {
      return new EntrySearchHandlerV4(paramSearchParameters, paramList);
    }
    if ((paramPwGroup instanceof PwGroupV4)) {
      return new EntrySearchHandlerV4(paramSearchParameters, paramList);
    }
    throw new RuntimeException("Not implemented.");
  }
  
  private boolean searchStrings(PwEntry paramPwEntry, String paramString)
  {
    EntrySearchStringIterator localEntrySearchStringIterator = EntrySearchStringIterator.getInstance(paramPwEntry, this.sp);
    label32:
    label84:
    label88:
    while (localEntrySearchStringIterator.hasNext())
    {
      String str = localEntrySearchStringIterator.next();
      int i;
      if (str != null)
      {
        i = 1;
        if (str.length() <= 0) {
          break label84;
        }
      }
      for (int j = 1;; j = 0)
      {
        if ((i & j) == 0) {
          break label88;
        }
        paramPwEntry = str;
        if (this.sp.ignoreCase) {
          paramPwEntry = str.toLowerCase();
        }
        if (paramPwEntry.indexOf(paramString) < 0) {
          break;
        }
        return true;
        i = 0;
        break label32;
      }
    }
    return false;
  }
  
  public boolean operate(PwEntry paramPwEntry)
  {
    if ((this.sp.respectEntrySearchingDisabled) && (!paramPwEntry.isSearchingEnabled())) {}
    do
    {
      do
      {
        return true;
      } while ((this.sp.excludeExpired) && (paramPwEntry.expires()) && (this.now.after(paramPwEntry.getExpiryTime())));
      Object localObject2 = this.sp.searchString;
      Object localObject1 = localObject2;
      if (this.sp.ignoreCase) {
        localObject1 = ((String)localObject2).toLowerCase();
      }
      if (searchStrings(paramPwEntry, (String)localObject1))
      {
        this.listStorage.add(paramPwEntry);
        return true;
      }
      if (this.sp.searchInGroupNames)
      {
        localObject2 = paramPwEntry.getParent();
        if (localObject2 != null)
        {
          String str = ((PwGroup)localObject2).getName();
          if (str != null)
          {
            localObject2 = str;
            if (this.sp.ignoreCase) {
              localObject2 = str.toLowerCase();
            }
            if (((String)localObject2).indexOf((String)localObject1) >= 0)
            {
              this.listStorage.add(paramPwEntry);
              return true;
            }
          }
        }
      }
    } while (!searchID(paramPwEntry));
    this.listStorage.add(paramPwEntry);
    return true;
  }
  
  protected boolean searchID(PwEntry paramPwEntry)
  {
    return false;
  }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/com/keepassdroid/database/EntrySearchHandler.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */