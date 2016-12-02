package com.keepassdroid.database;

import com.keepassdroid.database.iterator.EntrySearchStringIterator;
import java.util.Comparator;
import java.util.Date;
import java.util.UUID;

public abstract class PwEntry
  implements Cloneable
{
  protected static final String PMS_TAN_ENTRY = "<TAN>";
  public PwIconStandard icon = PwIconStandard.FIRST;
  
  static
  {
    if (!PwEntry.class.desiredAssertionStatus()) {}
    for (boolean bool = true;; bool = false)
    {
      $assertionsDisabled = bool;
      return;
    }
  }
  
  public static PwEntry getInstance(PwGroup paramPwGroup)
  {
    return getInstance(paramPwGroup, true, true);
  }
  
  public static PwEntry getInstance(PwGroup paramPwGroup, boolean paramBoolean1, boolean paramBoolean2)
  {
    if ((paramPwGroup instanceof PwGroupV3)) {
      return new PwEntryV3((PwGroupV3)paramPwGroup);
    }
    if ((paramPwGroup instanceof PwGroupV4)) {
      return new PwEntryV4((PwGroupV4)paramPwGroup);
    }
    throw new RuntimeException("Unknown PwGroup instance.");
  }
  
  public void assign(PwEntry paramPwEntry)
  {
    this.icon = paramPwEntry.icon;
  }
  
  public PwEntry clone(boolean paramBoolean)
  {
    return (PwEntry)clone();
  }
  
  public Object clone()
  {
    try
    {
      PwEntry localPwEntry = (PwEntry)super.clone();
      return localPwEntry;
    }
    catch (CloneNotSupportedException localCloneNotSupportedException)
    {
      if (!$assertionsDisabled) {
        throw new AssertionError();
      }
      throw new RuntimeException("Clone should be supported");
    }
  }
  
  public abstract boolean expires();
  
  public abstract Date getCreationTime();
  
  public String getDisplayTitle()
  {
    if (isTan()) {
      return "<TAN> " + getUsername();
    }
    return getTitle();
  }
  
  public abstract Date getExpiryTime();
  
  public PwIcon getIcon()
  {
    return this.icon;
  }
  
  public abstract Date getLastAccessTime();
  
  public abstract Date getLastModificationTime();
  
  public String getNotes()
  {
    return getNotes(false, null);
  }
  
  public abstract String getNotes(boolean paramBoolean, PwDatabase paramPwDatabase);
  
  public abstract PwGroup getParent();
  
  public String getPassword()
  {
    return getPassword(false, null);
  }
  
  public abstract String getPassword(boolean paramBoolean, PwDatabase paramPwDatabase);
  
  public String getTitle()
  {
    return getTitle(false, null);
  }
  
  public abstract String getTitle(boolean paramBoolean, PwDatabase paramPwDatabase);
  
  public abstract UUID getUUID();
  
  public String getUrl()
  {
    return getUrl(false, null);
  }
  
  public abstract String getUrl(boolean paramBoolean, PwDatabase paramPwDatabase);
  
  public String getUsername()
  {
    return getUsername(false, null);
  }
  
  public abstract String getUsername(boolean paramBoolean, PwDatabase paramPwDatabase);
  
  public boolean isMetaStream()
  {
    return false;
  }
  
  public boolean isSearchingEnabled()
  {
    return false;
  }
  
  public boolean isTan()
  {
    return (getTitle().equals("<TAN>")) && (getUsername().length() > 0);
  }
  
  public abstract void setCreationTime(Date paramDate);
  
  public abstract void setExpires(boolean paramBoolean);
  
  public abstract void setExpiryTime(Date paramDate);
  
  public abstract void setLastAccessTime(Date paramDate);
  
  public abstract void setLastModificationTime(Date paramDate);
  
  public abstract void setNotes(String paramString, PwDatabase paramPwDatabase);
  
  public abstract void setParent(PwGroup paramPwGroup);
  
  public abstract void setPassword(String paramString, PwDatabase paramPwDatabase);
  
  public abstract void setTitle(String paramString, PwDatabase paramPwDatabase);
  
  public abstract void setUUID(UUID paramUUID);
  
  public abstract void setUrl(String paramString, PwDatabase paramPwDatabase);
  
  public abstract void setUsername(String paramString, PwDatabase paramPwDatabase);
  
  public EntrySearchStringIterator stringIterator()
  {
    return EntrySearchStringIterator.getInstance(this);
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
  
  public void touchLocation() {}
  
  public static class EntryNameComparator
    implements Comparator<PwEntry>
  {
    public int compare(PwEntry paramPwEntry1, PwEntry paramPwEntry2)
    {
      return paramPwEntry1.getTitle().compareToIgnoreCase(paramPwEntry2.getTitle());
    }
  }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/com/keepassdroid/database/PwEntry.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */