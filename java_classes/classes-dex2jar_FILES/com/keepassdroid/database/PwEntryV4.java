package com.keepassdroid.database;

import com.keepassdroid.database.security.ProtectedBinary;
import com.keepassdroid.database.security.ProtectedString;
import com.keepassdroid.utils.SprEngine;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map.Entry;
import java.util.Set;
import java.util.UUID;

public class PwEntryV4
  extends PwEntry
  implements ITimeLogger
{
  private static final long FIXED_LENGTH_SIZE = 128L;
  public static final String STR_NOTES = "Notes";
  public static final String STR_PASSWORD = "Password";
  public static final String STR_TITLE = "Title";
  public static final String STR_URL = "URL";
  public static final String STR_USERNAME = "UserName";
  public String additional = "";
  public AutoType autoType = new AutoType();
  public String backgroupColor = "";
  public HashMap<String, ProtectedBinary> binaries = new HashMap();
  private Date creation = PwDatabaseV4.DEFAULT_NOW;
  public PwIconCustom customIcon = PwIconCustom.ZERO;
  private Date expireDate = PwDatabaseV4.DEFAULT_NOW;
  private boolean expires = false;
  public String foregroundColor = "";
  public ArrayList<PwEntryV4> history = new ArrayList();
  private Date lastAccess = PwDatabaseV4.DEFAULT_NOW;
  private Date lastMod = PwDatabaseV4.DEFAULT_NOW;
  public String overrideURL = "";
  public PwGroupV4 parent;
  private Date parentGroupLastMod = PwDatabaseV4.DEFAULT_NOW;
  public HashMap<String, ProtectedString> strings = new HashMap();
  public String tags = "";
  public String url = "";
  private long usageCount = 0L;
  public UUID uuid = PwDatabaseV4.UUID_ZERO;
  
  public PwEntryV4() {}
  
  public PwEntryV4(PwGroupV4 paramPwGroupV4)
  {
    this(paramPwGroupV4, true, true);
  }
  
  public PwEntryV4(PwGroupV4 paramPwGroupV4, boolean paramBoolean1, boolean paramBoolean2)
  {
    this.parent = paramPwGroupV4;
    if (paramBoolean1) {
      this.uuid = UUID.randomUUID();
    }
    if (paramBoolean2)
    {
      paramPwGroupV4 = Calendar.getInstance().getTime();
      this.creation = paramPwGroupV4;
      this.lastAccess = paramPwGroupV4;
      this.lastMod = paramPwGroupV4;
      this.expires = false;
    }
  }
  
  public static boolean IsStandardString(String paramString)
  {
    return (paramString.equals("Title")) || (paramString.equals("UserName")) || (paramString.equals("Password")) || (paramString.equals("URL")) || (paramString.equals("Notes"));
  }
  
  private void assign(PwEntryV4 paramPwEntryV4)
  {
    this.parent = paramPwEntryV4.parent;
    this.uuid = paramPwEntryV4.uuid;
    this.strings = paramPwEntryV4.strings;
    this.binaries = paramPwEntryV4.binaries;
    this.customIcon = paramPwEntryV4.customIcon;
    this.foregroundColor = paramPwEntryV4.foregroundColor;
    this.backgroupColor = paramPwEntryV4.backgroupColor;
    this.overrideURL = paramPwEntryV4.overrideURL;
    this.autoType = paramPwEntryV4.autoType;
    this.history = paramPwEntryV4.history;
    this.parentGroupLastMod = paramPwEntryV4.parentGroupLastMod;
    this.creation = paramPwEntryV4.creation;
    this.lastMod = paramPwEntryV4.lastMod;
    this.lastAccess = paramPwEntryV4.lastAccess;
    this.expireDate = paramPwEntryV4.expireDate;
    this.expires = paramPwEntryV4.expires;
    this.usageCount = paramPwEntryV4.usageCount;
    this.url = paramPwEntryV4.url;
    this.additional = paramPwEntryV4.additional;
  }
  
  private String decodeRef(String paramString, PwDatabase paramPwDatabase)
  {
    if (paramPwDatabase == null) {
      return paramString;
    }
    return SprEngine.getInstance(paramPwDatabase).compile(paramString, this, paramPwDatabase);
  }
  
  private String decodeRefKey(boolean paramBoolean, String paramString, PwDatabase paramPwDatabase)
  {
    String str = getString(paramString);
    paramString = str;
    if (paramBoolean) {
      paramString = decodeRef(str, paramPwDatabase);
    }
    return paramString;
  }
  
  private boolean maintainBackups(PwDatabaseV4 paramPwDatabaseV4)
  {
    boolean bool1 = false;
    boolean bool2 = false;
    int i = paramPwDatabaseV4.historyMaxItems;
    if (i >= 0) {
      for (bool1 = bool2; this.history.size() > i; bool1 = true) {
        removeOldestBackup();
      }
    }
    long l2 = paramPwDatabaseV4.historyMaxSize;
    bool2 = bool1;
    if (l2 >= 0L) {
      for (;;)
      {
        long l1 = 0L;
        paramPwDatabaseV4 = this.history.iterator();
        while (paramPwDatabaseV4.hasNext()) {
          l1 += ((PwEntryV4)paramPwDatabaseV4.next()).getSize();
        }
        bool2 = bool1;
        if (l1 <= l2) {
          break;
        }
        removeOldestBackup();
        bool1 = true;
      }
    }
    return bool2;
  }
  
  private void removeOldestBackup()
  {
    Object localObject1 = null;
    int j = -1;
    int i = 0;
    while (i < this.history.size())
    {
      Date localDate = ((PwEntry)this.history.get(i)).getLastModificationTime();
      Object localObject2;
      if (localObject1 != null)
      {
        localObject2 = localObject1;
        if (!localDate.before((Date)localObject1)) {}
      }
      else
      {
        j = i;
        localObject2 = localDate;
      }
      i += 1;
      localObject1 = localObject2;
    }
    if (j != -1) {
      this.history.remove(j);
    }
  }
  
  public void assign(PwEntry paramPwEntry)
  {
    if (!(paramPwEntry instanceof PwEntryV4)) {
      throw new RuntimeException("DB version mix.");
    }
    super.assign(paramPwEntry);
    assign((PwEntryV4)paramPwEntry);
  }
  
  public PwEntry clone(boolean paramBoolean)
  {
    PwEntryV4 localPwEntryV4 = (PwEntryV4)super.clone(paramBoolean);
    if (paramBoolean) {
      localPwEntryV4.strings = ((HashMap)this.strings.clone());
    }
    return localPwEntryV4;
  }
  
  public Object clone()
  {
    return (PwEntryV4)super.clone();
  }
  
  public PwEntryV4 cloneDeep()
  {
    PwEntryV4 localPwEntryV4 = (PwEntryV4)clone(true);
    localPwEntryV4.binaries = ((HashMap)this.binaries.clone());
    localPwEntryV4.history = ((ArrayList)this.history.clone());
    localPwEntryV4.autoType = ((AutoType)this.autoType.clone());
    return localPwEntryV4;
  }
  
  public void createBackup(PwDatabaseV4 paramPwDatabaseV4)
  {
    PwEntryV4 localPwEntryV4 = cloneDeep();
    localPwEntryV4.history = new ArrayList();
    this.history.add(localPwEntryV4);
    if (paramPwDatabaseV4 != null) {
      maintainBackups(paramPwDatabaseV4);
    }
  }
  
  public boolean expires()
  {
    return this.expires;
  }
  
  public Date getCreationTime()
  {
    return this.creation;
  }
  
  public Date getExpiryTime()
  {
    return this.expireDate;
  }
  
  public PwIcon getIcon()
  {
    if ((this.customIcon == null) || (this.customIcon.uuid.equals(PwDatabaseV4.UUID_ZERO))) {
      return super.getIcon();
    }
    return this.customIcon;
  }
  
  public Date getLastAccessTime()
  {
    return this.lastAccess;
  }
  
  public Date getLastModificationTime()
  {
    return this.lastMod;
  }
  
  public Date getLocationChanged()
  {
    return this.parentGroupLastMod;
  }
  
  public String getNotes(boolean paramBoolean, PwDatabase paramPwDatabase)
  {
    return decodeRefKey(paramBoolean, "Notes", paramPwDatabase);
  }
  
  public PwGroupV4 getParent()
  {
    return this.parent;
  }
  
  public String getPassword(boolean paramBoolean, PwDatabase paramPwDatabase)
  {
    return decodeRefKey(paramBoolean, "Password", paramPwDatabase);
  }
  
  public long getSize()
  {
    long l = 128L;
    Iterator localIterator = this.strings.entrySet().iterator();
    Map.Entry localEntry;
    while (localIterator.hasNext())
    {
      localEntry = (Map.Entry)localIterator.next();
      l = l + ((String)localEntry.getKey()).length() + ((ProtectedString)localEntry.getValue()).length();
    }
    localIterator = this.binaries.entrySet().iterator();
    while (localIterator.hasNext())
    {
      localEntry = (Map.Entry)localIterator.next();
      l = l + ((String)localEntry.getKey()).length() + ((ProtectedBinary)localEntry.getValue()).length();
    }
    l += this.autoType.defaultSequence.length();
    localIterator = this.autoType.entrySet().iterator();
    while (localIterator.hasNext())
    {
      localEntry = (Map.Entry)localIterator.next();
      l = l + ((String)localEntry.getKey()).length() + ((String)localEntry.getValue()).length();
    }
    localIterator = this.history.iterator();
    while (localIterator.hasNext()) {
      l += ((PwEntryV4)localIterator.next()).getSize();
    }
    return l + this.overrideURL.length() + this.tags.length();
  }
  
  public String getString(String paramString)
  {
    paramString = (ProtectedString)this.strings.get(paramString);
    if (paramString == null) {
      return new String("");
    }
    return paramString.toString();
  }
  
  public String getTitle(boolean paramBoolean, PwDatabase paramPwDatabase)
  {
    return decodeRefKey(paramBoolean, "Title", paramPwDatabase);
  }
  
  public UUID getUUID()
  {
    return this.uuid;
  }
  
  public String getUrl(boolean paramBoolean, PwDatabase paramPwDatabase)
  {
    return decodeRefKey(paramBoolean, "URL", paramPwDatabase);
  }
  
  public long getUsageCount()
  {
    return this.usageCount;
  }
  
  public String getUsername(boolean paramBoolean, PwDatabase paramPwDatabase)
  {
    return decodeRefKey(paramBoolean, "UserName", paramPwDatabase);
  }
  
  public boolean isSearchingEnabled()
  {
    if (this.parent != null) {
      return this.parent.isSearchEnabled();
    }
    return true;
  }
  
  public void setCreationTime(Date paramDate)
  {
    this.creation = paramDate;
  }
  
  public void setExpires(boolean paramBoolean)
  {
    this.expires = paramBoolean;
  }
  
  public void setExpiryTime(Date paramDate)
  {
    this.expireDate = paramDate;
  }
  
  public void setLastAccessTime(Date paramDate)
  {
    this.lastAccess = paramDate;
  }
  
  public void setLastModificationTime(Date paramDate)
  {
    this.lastMod = paramDate;
  }
  
  public void setLocationChanged(Date paramDate)
  {
    this.parentGroupLastMod = paramDate;
  }
  
  public void setNotes(String paramString, PwDatabase paramPwDatabase)
  {
    setString("Notes", paramString, ((PwDatabaseV4)paramPwDatabase).memoryProtection.protectNotes);
  }
  
  public void setParent(PwGroup paramPwGroup)
  {
    this.parent = ((PwGroupV4)paramPwGroup);
  }
  
  public void setPassword(String paramString, PwDatabase paramPwDatabase)
  {
    setString("Password", paramString, ((PwDatabaseV4)paramPwDatabase).memoryProtection.protectPassword);
  }
  
  public void setString(String paramString1, String paramString2, boolean paramBoolean)
  {
    paramString2 = new ProtectedString(paramBoolean, paramString2);
    this.strings.put(paramString1, paramString2);
  }
  
  public void setTitle(String paramString, PwDatabase paramPwDatabase)
  {
    setString("Title", paramString, ((PwDatabaseV4)paramPwDatabase).memoryProtection.protectTitle);
  }
  
  public void setUUID(UUID paramUUID)
  {
    this.uuid = paramUUID;
  }
  
  public void setUrl(String paramString, PwDatabase paramPwDatabase)
  {
    setString("URL", paramString, ((PwDatabaseV4)paramPwDatabase).memoryProtection.protectUrl);
  }
  
  public void setUsageCount(long paramLong)
  {
    this.usageCount = paramLong;
  }
  
  public void setUsername(String paramString, PwDatabase paramPwDatabase)
  {
    setString("UserName", paramString, ((PwDatabaseV4)paramPwDatabase).memoryProtection.protectUserName);
  }
  
  public void touch(boolean paramBoolean1, boolean paramBoolean2)
  {
    super.touch(paramBoolean1, paramBoolean2);
    this.usageCount += 1L;
  }
  
  public void touchLocation()
  {
    this.parentGroupLastMod = new Date();
  }
  
  public class AutoType
    implements Cloneable
  {
    private static final long OBF_OPT_NONE = 0L;
    public String defaultSequence = "";
    public boolean enabled = true;
    public long obfuscationOptions = 0L;
    private HashMap<String, String> windowSeqPairs = new HashMap();
    
    static
    {
      if (!PwEntryV4.class.desiredAssertionStatus()) {}
      for (boolean bool = true;; bool = false)
      {
        $assertionsDisabled = bool;
        return;
      }
    }
    
    public AutoType() {}
    
    public Object clone()
    {
      try
      {
        AutoType localAutoType = (AutoType)super.clone();
        localAutoType.windowSeqPairs = ((HashMap)this.windowSeqPairs.clone());
        return localAutoType;
      }
      catch (CloneNotSupportedException localCloneNotSupportedException)
      {
        if (!$assertionsDisabled) {
          throw new AssertionError();
        }
        throw new RuntimeException(localCloneNotSupportedException);
      }
    }
    
    public Set<Map.Entry<String, String>> entrySet()
    {
      return this.windowSeqPairs.entrySet();
    }
    
    public void put(String paramString1, String paramString2)
    {
      this.windowSeqPairs.put(paramString1, paramString2);
    }
  }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/com/keepassdroid/database/PwEntryV4.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */