package com.keepassdroid.database;

import android.webkit.URLUtil;
import biz.source_code.base64Coder.Base64Coder;
import com.keepassdroid.crypto.CipherFactory;
import com.keepassdroid.database.exception.InvalidKeyFileException;
import com.keepassdroid.utils.EmptyUtils;
import java.io.IOException;
import java.io.InputStream;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.w3c.dom.Text;

public class PwDatabaseV4
  extends PwDatabase
{
  private static final int DEFAULT_HISTORY_MAX_ITEMS = 10;
  private static final long DEFAULT_HISTORY_MAX_SIZE = 6291456L;
  public static final Date DEFAULT_NOW;
  private static final String KeyDataElementName = "Data";
  private static final String KeyElementName = "Key";
  private static final String RECYCLEBIN_NAME = "RecycleBin";
  private static final String RootElementName = "KeyFile";
  public static final UUID UUID_ZERO;
  public String color = "";
  public PwCompressionAlgorithm compressionAlgorithm = PwCompressionAlgorithm.Gzip;
  public Map<String, String> customData = new HashMap();
  public List<PwIconCustom> customIcons = new ArrayList();
  public UUID dataCipher = CipherFactory.AES_CIPHER;
  public String defaultUserName = "";
  public Date defaultUserNameChanged = DEFAULT_NOW;
  public List<PwDeletedObject> deletedObjects = new ArrayList();
  public String description = "";
  public Date descriptionChanged = DEFAULT_NOW;
  public UUID entryTemplatesGroup = UUID_ZERO;
  public Date entryTemplatesGroupChanged = DEFAULT_NOW;
  public int historyMaxItems = 10;
  public long historyMaxSize = 6291456L;
  public long keyChangeForceDays = 1L;
  public long keyChangeRecDays = -1L;
  public Date keyLastChanged = DEFAULT_NOW;
  public UUID lastSelectedGroup = UUID_ZERO;
  public UUID lastTopVisibleGroup = UUID_ZERO;
  public String localizedAppName = "KeePassDroid";
  public long maintenanceHistoryDays = 365L;
  public MemoryProtectionConfig memoryProtection = new MemoryProtectionConfig();
  public Date nameChanged = DEFAULT_NOW;
  public long numKeyEncRounds = 6000L;
  public Date recycleBinChanged = DEFAULT_NOW;
  public boolean recycleBinEnabled = true;
  public UUID recycleBinUUID = UUID_ZERO;
  
  static
  {
    if (!PwDatabaseV4.class.desiredAssertionStatus()) {}
    for (boolean bool = true;; bool = false)
    {
      $assertionsDisabled = bool;
      DEFAULT_NOW = new Date();
      UUID_ZERO = new UUID(0L, 0L);
      return;
    }
  }
  
  private String dbNameFromPath(String paramString)
  {
    String str = URLUtil.guessFileName(paramString, null, null);
    if (EmptyUtils.isNullOrEmpty(str)) {
      paramString = "KeePass Database";
    }
    int i;
    do
    {
      return paramString;
      i = str.lastIndexOf(".");
      paramString = str;
    } while (i == -1);
    return str.substring(0, i);
  }
  
  private void ensureRecycleBin()
  {
    if (getRecycleBin() == null)
    {
      PwGroupV4 localPwGroupV4 = new PwGroupV4(true, true, "RecycleBin", this.iconFactory.getIcon(43));
      localPwGroupV4.enableAutoType = Boolean.valueOf(false);
      localPwGroupV4.enableSearching = Boolean.valueOf(false);
      localPwGroupV4.isExpanded = false;
      addGroupTo(localPwGroupV4, this.rootGroup);
      this.recycleBinUUID = localPwGroupV4.uuid;
    }
  }
  
  public boolean appSettingsEnabled()
  {
    return false;
  }
  
  public boolean canRecycle(PwEntry paramPwEntry)
  {
    if (!this.recycleBinEnabled) {}
    do
    {
      return false;
      paramPwEntry = paramPwEntry.getParent();
    } while ((paramPwEntry == null) || (!canRecycle(paramPwEntry)));
    return true;
  }
  
  public boolean canRecycle(PwGroup paramPwGroup)
  {
    if (!this.recycleBinEnabled) {}
    PwGroupV4 localPwGroupV4;
    do
    {
      return false;
      localPwGroupV4 = getRecycleBin();
    } while ((localPwGroupV4 != null) && (paramPwGroup.isContainedIn(localPwGroupV4)));
    return true;
  }
  
  public PwGroup createGroup()
  {
    return new PwGroupV4();
  }
  
  public void deleteEntry(PwEntry paramPwEntry)
  {
    super.deleteEntry(paramPwEntry);
    this.deletedObjects.add(new PwDeletedObject(paramPwEntry.getUUID()));
  }
  
  public PwEncryptionAlgorithm getEncAlgorithm()
  {
    return PwEncryptionAlgorithm.Rjindal;
  }
  
  public List<PwEntry> getEntries()
  {
    ArrayList localArrayList = new ArrayList();
    ((PwGroupV4)this.rootGroup).buildChildEntriesRecursive(localArrayList);
    return localArrayList;
  }
  
  public List<PwGroup> getGroups()
  {
    ArrayList localArrayList = new ArrayList();
    ((PwGroupV4)this.rootGroup).buildChildGroupsRecursive(localArrayList);
    return localArrayList;
  }
  
  public List<PwGroup> getGrpRoots()
  {
    return this.rootGroup.childGroups;
  }
  
  public byte[] getMasterKey(String paramString, InputStream paramInputStream)
    throws InvalidKeyFileException, IOException
  {
    assert (paramString != null);
    if ((paramString.length() > 0) && (paramInputStream != null)) {
      return getCompositeKey(paramString, paramInputStream);
    }
    if (paramString.length() > 0) {}
    for (paramString = getPasswordKey(paramString);; paramString = getFileKey(paramInputStream))
    {
      try
      {
        paramInputStream = MessageDigest.getInstance("SHA-256");
        return paramInputStream.digest(paramString);
      }
      catch (NoSuchAlgorithmException paramString)
      {
        throw new IOException("No SHA-256 implementation");
      }
      if (paramInputStream == null) {
        break;
      }
    }
    throw new IllegalArgumentException("Key cannot be empty.");
  }
  
  public long getNumRounds()
  {
    return this.numKeyEncRounds;
  }
  
  protected String getPasswordEncoding()
  {
    return "UTF-8";
  }
  
  public PwGroupV4 getRecycleBin()
  {
    if (this.recycleBinUUID == null) {
      return null;
    }
    PwGroupIdV4 localPwGroupIdV4 = new PwGroupIdV4(this.recycleBinUUID);
    return (PwGroupV4)this.groups.get(localPwGroupIdV4);
  }
  
  public void initNew(String paramString)
  {
    URLUtil.guessFileName(paramString, null, null);
    this.rootGroup = new PwGroupV4(true, true, dbNameFromPath(paramString), this.iconFactory.getIcon(48));
    this.groups.put(this.rootGroup.getId(), this.rootGroup);
  }
  
  public boolean isBackup(PwGroup paramPwGroup)
  {
    if (!this.recycleBinEnabled) {
      return false;
    }
    return paramPwGroup.isContainedIn(getRecycleBin());
  }
  
  public boolean isGroupSearchable(PwGroup paramPwGroup, boolean paramBoolean)
  {
    if (!super.isGroupSearchable(paramPwGroup, paramBoolean)) {
      return false;
    }
    return ((PwGroupV4)paramPwGroup).isSearchEnabled();
  }
  
  protected byte[] loadXmlKeyFile(InputStream paramInputStream)
  {
    for (;;)
    {
      int i;
      try
      {
        paramInputStream = DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(paramInputStream).getDocumentElement();
        if ((paramInputStream == null) || (!paramInputStream.getNodeName().equalsIgnoreCase("KeyFile"))) {
          break label227;
        }
        paramInputStream = paramInputStream.getChildNodes();
        if (paramInputStream.getLength() >= 2) {
          break label229;
        }
        return null;
      }
      catch (Exception paramInputStream)
      {
        Object localObject1;
        int j;
        Object localObject2;
        int k;
        Node localNode;
        return null;
      }
      if (i < paramInputStream.getLength())
      {
        localObject1 = paramInputStream.item(i);
        if (((Node)localObject1).getNodeName().equalsIgnoreCase("Key"))
        {
          localObject1 = ((Node)localObject1).getChildNodes();
          j = 0;
          if (j < ((NodeList)localObject1).getLength())
          {
            localObject2 = ((NodeList)localObject1).item(j);
            if (((Node)localObject2).getNodeName().equalsIgnoreCase("Data"))
            {
              localObject2 = ((Node)localObject2).getChildNodes();
              k = 0;
              if (k < ((NodeList)localObject2).getLength())
              {
                localNode = ((NodeList)localObject2).item(k);
                if (localNode.getNodeType() == 3)
                {
                  paramInputStream = Base64Coder.decode(((Text)localNode).getNodeValue());
                  return paramInputStream;
                }
                k += 1;
                continue;
              }
            }
            j += 1;
            continue;
          }
        }
        i += 1;
      }
      else
      {
        return null;
        label227:
        return null;
        label229:
        i = 0;
      }
    }
  }
  
  public PwGroupIdV4 newGroupId()
  {
    new PwGroupIdV4(UUID_ZERO);
    PwGroupIdV4 localPwGroupIdV4;
    do
    {
      localPwGroupIdV4 = new PwGroupIdV4(UUID.randomUUID());
    } while (isGroupIdUsed(localPwGroupIdV4));
    return localPwGroupIdV4;
  }
  
  public void populateGlobals(PwGroup paramPwGroup)
  {
    this.groups.put(this.rootGroup.getId(), this.rootGroup);
    super.populateGlobals(paramPwGroup);
  }
  
  public void recycle(PwEntry paramPwEntry)
  {
    ensureRecycleBin();
    PwGroup localPwGroup = paramPwEntry.getParent();
    removeEntryFrom(paramPwEntry, localPwGroup);
    localPwGroup.touch(false, true);
    addEntryTo(paramPwEntry, getRecycleBin());
    paramPwEntry.touch(false, true);
    paramPwEntry.touchLocation();
  }
  
  public void setNumRounds(long paramLong)
    throws NumberFormatException
  {
    this.numKeyEncRounds = paramLong;
  }
  
  public void undoDeleteEntry(PwEntry paramPwEntry, PwGroup paramPwGroup)
  {
    super.undoDeleteEntry(paramPwEntry, paramPwGroup);
    this.deletedObjects.remove(paramPwEntry);
  }
  
  public void undoRecycle(PwEntry paramPwEntry, PwGroup paramPwGroup)
  {
    removeEntryFrom(paramPwEntry, getRecycleBin());
    addEntryTo(paramPwEntry, paramPwGroup);
  }
  
  public boolean validatePasswordEncoding(String paramString)
  {
    return true;
  }
  
  public class MemoryProtectionConfig
  {
    public boolean autoEnableVisualHiding = false;
    public boolean protectNotes = false;
    public boolean protectPassword = false;
    public boolean protectTitle = false;
    public boolean protectUrl = false;
    public boolean protectUserName = false;
    
    public MemoryProtectionConfig() {}
    
    public boolean GetProtection(String paramString)
    {
      if (paramString.equalsIgnoreCase("Title")) {
        return this.protectTitle;
      }
      if (paramString.equalsIgnoreCase("UserName")) {
        return this.protectUserName;
      }
      if (paramString.equalsIgnoreCase("Password")) {
        return this.protectPassword;
      }
      if (paramString.equalsIgnoreCase("URL")) {
        return this.protectUrl;
      }
      if (paramString.equalsIgnoreCase("Notes")) {
        return this.protectNotes;
      }
      return false;
    }
  }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/com/keepassdroid/database/PwDatabaseV4.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */