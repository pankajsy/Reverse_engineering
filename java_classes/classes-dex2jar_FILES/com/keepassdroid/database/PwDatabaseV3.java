package com.keepassdroid.database;

import com.keepassdroid.database.exception.InvalidKeyFileException;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

public class PwDatabaseV3
  extends PwDatabase
{
  private final int DEFAULT_ENCRYPTION_ROUNDS = 300;
  public PwEncryptionAlgorithm algorithm;
  public List<PwEntry> entries = new ArrayList();
  public List<PwGroup> groups = new ArrayList();
  public PwEntry metaInfo;
  public int numKeyEncRounds;
  
  static
  {
    if (!PwDatabaseV3.class.desiredAssertionStatus()) {}
    for (boolean bool = true;; bool = false)
    {
      $assertionsDisabled = bool;
      return;
    }
  }
  
  private void initAndAddGroup(String paramString, int paramInt, PwGroup paramPwGroup)
  {
    PwGroup localPwGroup = createGroup();
    localPwGroup.initNewGroup(paramString, newGroupId());
    localPwGroup.icon = this.iconFactory.getIcon(paramInt);
    addGroupTo(localPwGroup, paramPwGroup);
  }
  
  public void addEntryTo(PwEntry paramPwEntry, PwGroup paramPwGroup)
  {
    super.addEntryTo(paramPwEntry, paramPwGroup);
    this.entries.add(paramPwEntry);
  }
  
  public void addGroupTo(PwGroup paramPwGroup1, PwGroup paramPwGroup2)
  {
    super.addGroupTo(paramPwGroup1, paramPwGroup2);
    this.groups.add(paramPwGroup1);
  }
  
  public boolean appSettingsEnabled()
  {
    return true;
  }
  
  public void constructTree(PwGroupV3 paramPwGroupV3)
  {
    if (paramPwGroupV3 == null)
    {
      paramPwGroupV3 = new PwGroupV3();
      this.rootGroup = paramPwGroupV3;
      List localList = getGrpRoots();
      paramPwGroupV3.setGroups(localList);
      paramPwGroupV3.childEntries = new ArrayList();
      paramPwGroupV3.level = -1;
      i = 0;
      while (i < localList.size())
      {
        PwGroupV3 localPwGroupV3 = (PwGroupV3)localList.get(i);
        localPwGroupV3.parent = paramPwGroupV3;
        constructTree(localPwGroupV3);
        i += 1;
      }
    }
    paramPwGroupV3.setGroups(getGrpChildren(paramPwGroupV3));
    paramPwGroupV3.childEntries = getEntries(paramPwGroupV3);
    int i = 0;
    while (i < paramPwGroupV3.childEntries.size())
    {
      ((PwEntryV3)paramPwGroupV3.childEntries.get(i)).parent = paramPwGroupV3;
      i += 1;
    }
    i = 0;
    while (i < paramPwGroupV3.childGroups.size())
    {
      ((PwGroupV3)paramPwGroupV3.childGroups.get(i)).parent = paramPwGroupV3;
      constructTree((PwGroupV3)paramPwGroupV3.childGroups.get(i));
      i += 1;
    }
  }
  
  public void copyEncrypted(byte[] paramArrayOfByte, int paramInt1, int paramInt2) {}
  
  public void copyHeader(PwDbHeaderV3 paramPwDbHeaderV3) {}
  
  public PwGroup createGroup()
  {
    return new PwGroupV3();
  }
  
  public PwEncryptionAlgorithm getEncAlgorithm()
  {
    return this.algorithm;
  }
  
  public List<PwEntry> getEntries()
  {
    return this.entries;
  }
  
  public List<PwEntry> getEntries(PwGroupV3 paramPwGroupV3)
  {
    ArrayList localArrayList = new ArrayList();
    int i = 0;
    while (i < this.entries.size())
    {
      PwEntryV3 localPwEntryV3 = (PwEntryV3)this.entries.get(i);
      if (localPwEntryV3.groupId == paramPwGroupV3.groupId) {
        localArrayList.add(localPwEntryV3);
      }
      i += 1;
    }
    return localArrayList;
  }
  
  public List<PwGroup> getGroups()
  {
    return this.groups;
  }
  
  public List<PwGroup> getGrpChildren(PwGroupV3 paramPwGroupV3)
  {
    int i = this.groups.indexOf(paramPwGroupV3);
    int k = paramPwGroupV3.level + 1;
    paramPwGroupV3 = new ArrayList();
    for (;;)
    {
      int j = i + 1;
      PwGroupV3 localPwGroupV3;
      if (j < this.groups.size())
      {
        localPwGroupV3 = (PwGroupV3)this.groups.get(j);
        if (localPwGroupV3.level >= k) {}
      }
      else
      {
        return paramPwGroupV3;
      }
      i = j;
      if (localPwGroupV3.level == k)
      {
        paramPwGroupV3.add(localPwGroupV3);
        i = j;
      }
    }
  }
  
  public List<PwGroup> getGrpRoots()
  {
    ArrayList localArrayList = new ArrayList();
    int i = 0;
    while (i < this.groups.size())
    {
      PwGroupV3 localPwGroupV3 = (PwGroupV3)this.groups.get(i);
      if (localPwGroupV3.level == 0) {
        localArrayList.add(localPwGroupV3);
      }
      i += 1;
    }
    return localArrayList;
  }
  
  public byte[] getMasterKey(String paramString, InputStream paramInputStream)
    throws InvalidKeyFileException, IOException
  {
    assert (paramString != null);
    if ((paramString.length() > 0) && (paramInputStream != null)) {
      return getCompositeKey(paramString, paramInputStream);
    }
    if (paramString.length() > 0) {
      return getPasswordKey(paramString);
    }
    if (paramInputStream != null) {
      return getFileKey(paramInputStream);
    }
    throw new IllegalArgumentException("Key cannot be empty.");
  }
  
  public int getNumKeyEncRecords()
  {
    return this.numKeyEncRounds;
  }
  
  public long getNumRounds()
  {
    return this.numKeyEncRounds;
  }
  
  protected String getPasswordEncoding()
  {
    return "ISO-8859-1";
  }
  
  public int getRootGroupId()
  {
    int i = 0;
    while (i < this.groups.size())
    {
      PwGroupV3 localPwGroupV3 = (PwGroupV3)this.groups.get(i);
      if (localPwGroupV3.level == 0) {
        return localPwGroupV3.groupId;
      }
      i += 1;
    }
    return -1;
  }
  
  public void initNew(String paramString)
  {
    this.algorithm = PwEncryptionAlgorithm.Rjindal;
    this.numKeyEncRounds = 300;
    this.name = "KeePass Password Manager";
    constructTree(null);
    initAndAddGroup("Internet", 1, this.rootGroup);
    initAndAddGroup("eMail", 19, this.rootGroup);
  }
  
  public boolean isBackup(PwGroup paramPwGroup)
  {
    for (paramPwGroup = (PwGroupV3)paramPwGroup; paramPwGroup != null; paramPwGroup = paramPwGroup.parent) {
      if ((paramPwGroup.level == 0) && (paramPwGroup.name.equalsIgnoreCase("Backup"))) {
        return true;
      }
    }
    return false;
  }
  
  public boolean isGroupSearchable(PwGroup paramPwGroup, boolean paramBoolean)
  {
    if (!super.isGroupSearchable(paramPwGroup, paramBoolean)) {}
    while ((paramBoolean) && (isBackup(paramPwGroup))) {
      return false;
    }
    return true;
  }
  
  protected byte[] loadXmlKeyFile(InputStream paramInputStream)
  {
    return null;
  }
  
  public PwGroupIdV3 newGroupId()
  {
    new PwGroupIdV3(0);
    Random localRandom = new Random();
    PwGroupIdV3 localPwGroupIdV3;
    do
    {
      localPwGroupIdV3 = new PwGroupIdV3(localRandom.nextInt());
    } while (isGroupIdUsed(localPwGroupIdV3));
    return localPwGroupIdV3;
  }
  
  public void removeEntryFrom(PwEntry paramPwEntry, PwGroup paramPwGroup)
  {
    super.removeEntryFrom(paramPwEntry, paramPwGroup);
    this.entries.remove(paramPwEntry);
  }
  
  public void removeGroupFrom(PwGroup paramPwGroup1, PwGroup paramPwGroup2)
  {
    super.removeGroupFrom(paramPwGroup1, paramPwGroup2);
    this.groups.remove(paramPwGroup1);
  }
  
  public void setGroups(List<PwGroup> paramList)
  {
    this.groups = paramList;
  }
  
  public void setNumRounds(long paramLong)
    throws NumberFormatException
  {
    if ((paramLong > 2147483647L) || (paramLong < -2147483648L)) {
      throw new NumberFormatException();
    }
    this.numKeyEncRounds = ((int)paramLong);
  }
  
  public String toString()
  {
    return this.name;
  }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/com/keepassdroid/database/PwDatabaseV3.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */