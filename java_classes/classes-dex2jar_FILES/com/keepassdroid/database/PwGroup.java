package com.keepassdroid.database;

import com.keepassdroid.utils.StrUtil;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

public abstract class PwGroup
{
  public List<PwEntry> childEntries = new ArrayList();
  public List<PwGroup> childGroups = new ArrayList();
  public PwIconStandard icon;
  public String name = "";
  
  private boolean searchEntriesSingle(SearchParameters paramSearchParameters, List<PwEntry> paramList)
  {
    paramSearchParameters = (SearchParameters)paramSearchParameters.clone();
    if (paramSearchParameters.searchString.length() <= 0) {}
    for (paramSearchParameters = new EntrySearchHandlerAll(paramSearchParameters, paramList); !preOrderTraverseTree(null, paramSearchParameters); paramSearchParameters = EntrySearchHandler.getInstance(this, paramSearchParameters, paramList)) {
      return false;
    }
    return true;
  }
  
  public PwIcon getIcon()
  {
    return this.icon;
  }
  
  public abstract PwGroupId getId();
  
  public abstract Date getLastMod();
  
  public abstract String getName();
  
  public abstract PwGroup getParent();
  
  public void initNewGroup(String paramString, PwGroupId paramPwGroupId)
  {
    setId(paramPwGroupId);
    this.name = paramString;
  }
  
  public boolean isContainedIn(PwGroup paramPwGroup)
  {
    for (PwGroup localPwGroup = this; localPwGroup != null; localPwGroup = localPwGroup.getParent()) {
      if (localPwGroup == paramPwGroup) {
        return true;
      }
    }
    return false;
  }
  
  public boolean preOrderTraverseTree(GroupHandler<PwGroup> paramGroupHandler, EntryHandler<PwEntry> paramEntryHandler)
  {
    if (paramEntryHandler != null)
    {
      localIterator = this.childEntries.iterator();
      while (localIterator.hasNext()) {
        if (!paramEntryHandler.operate((PwEntry)localIterator.next())) {
          return false;
        }
      }
    }
    Iterator localIterator = this.childGroups.iterator();
    for (;;)
    {
      if (!localIterator.hasNext()) {
        break label95;
      }
      PwGroup localPwGroup = (PwGroup)localIterator.next();
      if ((paramGroupHandler != null) && (!paramGroupHandler.operate(localPwGroup))) {
        break;
      }
      localPwGroup.preOrderTraverseTree(paramGroupHandler, paramEntryHandler);
    }
    label95:
    return true;
  }
  
  public void searchEntries(SearchParameters paramSearchParameters, List<PwEntry> paramList)
  {
    if (paramSearchParameters == null) {}
    while (paramList == null) {
      return;
    }
    List localList = StrUtil.splitSearchTerms(paramSearchParameters.searchString);
    if ((localList.size() <= 1) || (paramSearchParameters.regularExpression))
    {
      searchEntriesSingle(paramSearchParameters, paramList);
      return;
    }
    Collections.sort(localList, new Comparator()
    {
      public int compare(String paramAnonymousString1, String paramAnonymousString2)
      {
        return paramAnonymousString1.length() - paramAnonymousString2.length();
      }
    });
    String str = paramSearchParameters.searchString;
    Object localObject1 = this.childEntries;
    int j = 0;
    Object localObject2 = localObject1;
    if (j < localList.size())
    {
      localObject2 = new ArrayList();
      paramSearchParameters.searchString = ((String)localList.get(j));
      i = 0;
      if (paramSearchParameters.searchString.startsWith("-"))
      {
        paramSearchParameters.searchString.substring(1);
        if (paramSearchParameters.searchString.length() <= 0) {
          break label182;
        }
      }
    }
    label182:
    for (int i = 1; !searchEntriesSingle(paramSearchParameters, (List)localObject2); i = 0)
    {
      localObject2 = null;
      if (localObject2 != null) {
        paramList.addAll((Collection)localObject2);
      }
      paramSearchParameters.searchString = str;
      return;
    }
    ArrayList localArrayList = new ArrayList();
    if (i != 0)
    {
      localObject1 = ((List)localObject1).iterator();
      while (((Iterator)localObject1).hasNext())
      {
        PwEntry localPwEntry = (PwEntry)((Iterator)localObject1).next();
        if (!((List)localObject2).contains(localPwEntry)) {
          localArrayList.add(localPwEntry);
        }
      }
    }
    for (localObject1 = localArrayList;; localObject1 = localObject2)
    {
      j += 1;
      break;
    }
  }
  
  public abstract void setId(PwGroupId paramPwGroupId);
  
  public abstract void setLastAccessTime(Date paramDate);
  
  public abstract void setLastModificationTime(Date paramDate);
  
  public abstract void setParent(PwGroup paramPwGroup);
  
  public void sortEntriesByName()
  {
    Collections.sort(this.childEntries, new PwEntry.EntryNameComparator());
  }
  
  public void sortGroupsByName()
  {
    Collections.sort(this.childGroups, new GroupNameComparator());
  }
  
  public void touch(boolean paramBoolean1, boolean paramBoolean2)
  {
    Object localObject = new Date();
    setLastAccessTime((Date)localObject);
    if (paramBoolean1) {
      setLastModificationTime((Date)localObject);
    }
    localObject = getParent();
    if ((paramBoolean2) && (localObject != null)) {
      ((PwGroup)localObject).touch(paramBoolean1, true);
    }
  }
  
  public static class GroupNameComparator
    implements Comparator<PwGroup>
  {
    public int compare(PwGroup paramPwGroup1, PwGroup paramPwGroup2)
    {
      return paramPwGroup1.getName().compareToIgnoreCase(paramPwGroup2.getName());
    }
  }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/com/keepassdroid/database/PwGroup.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */