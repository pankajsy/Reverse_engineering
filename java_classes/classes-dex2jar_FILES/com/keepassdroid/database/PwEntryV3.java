package com.keepassdroid.database;

import com.keepassdroid.utils.Types;
import java.io.UnsupportedEncodingException;
import java.util.Calendar;
import java.util.Date;
import java.util.Random;
import java.util.UUID;

public class PwEntryV3
  extends PwEntry
{
  public static final Date DEFAULT_DATE;
  public static final PwDate DEFAULT_PWDATE;
  public static final Date NEVER_EXPIRE;
  public static final Date NEVER_EXPIRE_BUG;
  public static final String PMS_ID_BINDESC = "bin-stream";
  public static final String PMS_ID_TITLE = "Meta-Info";
  public static final String PMS_ID_URL = "$";
  public static final String PMS_ID_USER = "SYSTEM";
  public static final PwDate PW_NEVER_EXPIRE;
  public static final PwDate PW_NEVER_EXPIRE_BUG;
  public String additional;
  private byte[] binaryData;
  public String binaryDesc;
  public int groupId;
  public PwGroupV3 parent = null;
  private byte[] password;
  public PwDate tCreation;
  public PwDate tExpire;
  public PwDate tLastAccess;
  public PwDate tLastMod;
  public String title;
  public String url;
  public String username;
  private byte[] uuid;
  
  static
  {
    if (!PwEntryV3.class.desiredAssertionStatus()) {}
    for (boolean bool = true;; bool = false)
    {
      $assertionsDisabled = bool;
      NEVER_EXPIRE = getNeverExpire();
      NEVER_EXPIRE_BUG = getNeverExpireBug();
      DEFAULT_DATE = getDefaultDate();
      PW_NEVER_EXPIRE = new PwDate(NEVER_EXPIRE);
      PW_NEVER_EXPIRE_BUG = new PwDate(NEVER_EXPIRE_BUG);
      DEFAULT_PWDATE = new PwDate(DEFAULT_DATE);
      return;
    }
  }
  
  public PwEntryV3() {}
  
  public PwEntryV3(PwGroupV3 paramPwGroupV3)
  {
    this(paramPwGroupV3, true, true);
  }
  
  public PwEntryV3(PwGroupV3 paramPwGroupV3, boolean paramBoolean1, boolean paramBoolean2)
  {
    this.parent = paramPwGroupV3;
    this.groupId = ((PwGroupIdV3)this.parent.getId()).getId();
    if (paramBoolean1)
    {
      paramPwGroupV3 = new Random();
      this.uuid = new byte[16];
      paramPwGroupV3.nextBytes(this.uuid);
    }
    if (paramBoolean2)
    {
      paramPwGroupV3 = Calendar.getInstance().getTime();
      this.tCreation = new PwDate(paramPwGroupV3);
      this.tLastAccess = new PwDate(paramPwGroupV3);
      this.tLastMod = new PwDate(paramPwGroupV3);
      this.tExpire = new PwDate(NEVER_EXPIRE);
    }
  }
  
  public static boolean IsNever(Date paramDate)
  {
    return PwDate.IsSameDate(NEVER_EXPIRE, paramDate);
  }
  
  private void assign(PwEntryV3 paramPwEntryV3)
  {
    this.title = paramPwEntryV3.title;
    this.url = paramPwEntryV3.url;
    this.groupId = paramPwEntryV3.groupId;
    this.username = paramPwEntryV3.username;
    this.additional = paramPwEntryV3.additional;
    this.uuid = paramPwEntryV3.uuid;
    int i = paramPwEntryV3.password.length;
    this.password = new byte[i];
    System.arraycopy(paramPwEntryV3.password, 0, this.password, 0, i);
    this.tCreation = ((PwDate)paramPwEntryV3.tCreation.clone());
    this.tLastMod = ((PwDate)paramPwEntryV3.tLastMod.clone());
    this.tLastAccess = ((PwDate)paramPwEntryV3.tLastAccess.clone());
    this.tExpire = ((PwDate)paramPwEntryV3.tExpire.clone());
    this.binaryDesc = paramPwEntryV3.binaryDesc;
    if (paramPwEntryV3.binaryData != null)
    {
      i = paramPwEntryV3.binaryData.length;
      this.binaryData = new byte[i];
      System.arraycopy(paramPwEntryV3.binaryData, 0, this.binaryData, 0, i);
    }
    this.parent = paramPwEntryV3.parent;
  }
  
  private static void fill(byte[] paramArrayOfByte, byte paramByte)
  {
    int i = 0;
    while (i < paramArrayOfByte.length)
    {
      paramArrayOfByte[i] = paramByte;
      i += 1;
    }
  }
  
  private static Date getDefaultDate()
  {
    Calendar localCalendar = Calendar.getInstance();
    localCalendar.set(1, 2004);
    localCalendar.set(2, 0);
    localCalendar.set(5, 1);
    localCalendar.set(10, 0);
    localCalendar.set(12, 0);
    localCalendar.set(13, 0);
    return localCalendar.getTime();
  }
  
  private static Date getNeverExpire()
  {
    Calendar localCalendar = Calendar.getInstance();
    localCalendar.set(1, 2999);
    localCalendar.set(2, 11);
    localCalendar.set(5, 28);
    localCalendar.set(10, 23);
    localCalendar.set(12, 59);
    localCalendar.set(13, 59);
    return localCalendar.getTime();
  }
  
  private static Date getNeverExpireBug()
  {
    Calendar localCalendar = Calendar.getInstance();
    localCalendar.set(1, 2999);
    localCalendar.set(2, 11);
    localCalendar.set(5, 30);
    localCalendar.set(10, 23);
    localCalendar.set(12, 59);
    localCalendar.set(13, 59);
    return localCalendar.getTime();
  }
  
  public void assign(PwEntry paramPwEntry)
  {
    if (!(paramPwEntry instanceof PwEntryV3)) {
      throw new RuntimeException("DB version mix");
    }
    super.assign(paramPwEntry);
    assign((PwEntryV3)paramPwEntry);
  }
  
  public Object clone()
  {
    PwEntryV3 localPwEntryV3 = (PwEntryV3)super.clone();
    int i;
    if (this.password != null)
    {
      i = this.password.length;
      this.password = new byte[i];
      System.arraycopy(this.password, 0, localPwEntryV3.password, 0, i);
    }
    localPwEntryV3.tCreation = ((PwDate)this.tCreation.clone());
    localPwEntryV3.tLastMod = ((PwDate)this.tLastMod.clone());
    localPwEntryV3.tLastAccess = ((PwDate)this.tLastAccess.clone());
    localPwEntryV3.tExpire = ((PwDate)this.tExpire.clone());
    localPwEntryV3.binaryDesc = this.binaryDesc;
    if (this.binaryData != null)
    {
      i = this.binaryData.length;
      localPwEntryV3.binaryData = new byte[i];
      System.arraycopy(this.binaryData, 0, localPwEntryV3.binaryData, 0, i);
    }
    localPwEntryV3.parent = this.parent;
    return localPwEntryV3;
  }
  
  public boolean expires()
  {
    return !IsNever(this.tExpire.getJDate());
  }
  
  public byte[] getBinaryData()
  {
    return this.binaryData;
  }
  
  public Date getCreationTime()
  {
    return this.tCreation.getJDate();
  }
  
  public Date getExpiryTime()
  {
    return this.tExpire.getJDate();
  }
  
  public Date getLastAccessTime()
  {
    return this.tLastAccess.getJDate();
  }
  
  public Date getLastModificationTime()
  {
    return this.tLastMod.getJDate();
  }
  
  public String getNotes(boolean paramBoolean, PwDatabase paramPwDatabase)
  {
    return this.additional;
  }
  
  public PwGroupV3 getParent()
  {
    return this.parent;
  }
  
  public String getPassword(boolean paramBoolean, PwDatabase paramPwDatabase)
  {
    if (this.password == null) {
      return "";
    }
    return new String(this.password);
  }
  
  public byte[] getPasswordBytes()
  {
    return this.password;
  }
  
  public String getTitle(boolean paramBoolean, PwDatabase paramPwDatabase)
  {
    return this.title;
  }
  
  public UUID getUUID()
  {
    return Types.bytestoUUID(this.uuid);
  }
  
  public String getUrl(boolean paramBoolean, PwDatabase paramPwDatabase)
  {
    return this.url;
  }
  
  public String getUsername(boolean paramBoolean, PwDatabase paramPwDatabase)
  {
    if (this.username == null) {
      return "";
    }
    return this.username;
  }
  
  public boolean isMetaStream()
  {
    if (this.binaryData == null) {}
    while ((this.additional == null) || (this.additional.length() == 0) || (!this.binaryDesc.equals("bin-stream")) || (this.title == null) || (!this.title.equals("Meta-Info")) || (this.username == null) || (!this.username.equals("SYSTEM")) || (this.url == null) || (!this.url.equals("$")) || (!this.icon.isMetaStreamIcon())) {
      return false;
    }
    return true;
  }
  
  public void populateBlankFields(PwDatabaseV3 paramPwDatabaseV3)
  {
    if (this.icon == null) {
      this.icon = paramPwDatabaseV3.iconFactory.getIcon(1);
    }
    if (this.username == null) {
      this.username = "";
    }
    if (this.password == null) {
      this.password = new byte[0];
    }
    if (this.uuid == null) {
      this.uuid = Types.UUIDtoBytes(UUID.randomUUID());
    }
    if (this.title == null) {
      this.title = "";
    }
    if (this.url == null) {
      this.url = "";
    }
    if (this.additional == null) {
      this.additional = "";
    }
    if (this.tCreation == null) {
      this.tCreation = DEFAULT_PWDATE;
    }
    if (this.tLastMod == null) {
      this.tLastMod = DEFAULT_PWDATE;
    }
    if (this.tLastAccess == null) {
      this.tLastAccess = DEFAULT_PWDATE;
    }
    if (this.tExpire == null) {
      this.tExpire = PW_NEVER_EXPIRE;
    }
    if (this.binaryDesc == null) {
      this.binaryDesc = "";
    }
    if (this.binaryData == null) {
      this.binaryData = new byte[0];
    }
  }
  
  public void setBinaryData(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
  {
    if (this.binaryData != null)
    {
      fill(this.binaryData, (byte)0);
      this.binaryData = null;
    }
    this.binaryData = new byte[paramInt2];
    System.arraycopy(paramArrayOfByte, paramInt1, this.binaryData, 0, paramInt2);
  }
  
  public void setCreationTime(Date paramDate)
  {
    this.tCreation = new PwDate(paramDate);
  }
  
  public void setExpires(boolean paramBoolean)
  {
    if (!paramBoolean) {
      this.tExpire = PW_NEVER_EXPIRE;
    }
  }
  
  public void setExpiryTime(Date paramDate)
  {
    this.tExpire = new PwDate(paramDate);
  }
  
  public void setLastAccessTime(Date paramDate)
  {
    this.tLastAccess = new PwDate(paramDate);
  }
  
  public void setLastModificationTime(Date paramDate)
  {
    this.tLastMod = new PwDate(paramDate);
  }
  
  public void setNotes(String paramString, PwDatabase paramPwDatabase)
  {
    this.additional = paramString;
  }
  
  public void setParent(PwGroup paramPwGroup)
  {
    this.parent = ((PwGroupV3)paramPwGroup);
  }
  
  public void setPassword(String paramString, PwDatabase paramPwDatabase)
  {
    try
    {
      paramPwDatabase = paramString.getBytes("UTF-8");
      setPassword(paramPwDatabase, 0, paramPwDatabase.length);
      return;
    }
    catch (UnsupportedEncodingException paramPwDatabase)
    {
      if (!$assertionsDisabled) {
        throw new AssertionError();
      }
      paramString = paramString.getBytes();
      setPassword(paramString, 0, paramString.length);
    }
  }
  
  public void setPassword(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
  {
    if (this.password != null)
    {
      fill(this.password, (byte)0);
      this.password = null;
    }
    this.password = new byte[paramInt2];
    System.arraycopy(paramArrayOfByte, paramInt1, this.password, 0, paramInt2);
  }
  
  public void setTitle(String paramString, PwDatabase paramPwDatabase)
  {
    this.title = paramString;
  }
  
  public void setUUID(UUID paramUUID)
  {
    this.uuid = Types.UUIDtoBytes(paramUUID);
  }
  
  public void setUrl(String paramString, PwDatabase paramPwDatabase)
  {
    this.url = paramString;
  }
  
  public void setUsername(String paramString, PwDatabase paramPwDatabase)
  {
    this.username = paramString;
  }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/com/keepassdroid/database/PwEntryV3.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */