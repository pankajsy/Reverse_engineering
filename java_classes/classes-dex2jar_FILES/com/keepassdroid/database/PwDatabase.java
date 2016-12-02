package com.keepassdroid.database;

import com.keepassdroid.crypto.finalkey.FinalKey;
import com.keepassdroid.crypto.finalkey.FinalKeyFactory;
import com.keepassdroid.database.exception.InvalidKeyFileException;
import com.keepassdroid.stream.NullOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.security.DigestOutputStream;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

public abstract class PwDatabase
{
  public Map<UUID, PwEntry> entries = new HashMap();
  public byte[] finalKey;
  public Map<PwGroupId, PwGroup> groups = new HashMap();
  public PwIconFactory iconFactory = new PwIconFactory();
  public byte[] masterKey = new byte[32];
  public String name = "KeePass database";
  public PwGroup rootGroup;
  
  static
  {
    if (!PwDatabase.class.desiredAssertionStatus()) {}
    for (boolean bool = true;; bool = false)
    {
      $assertionsDisabled = bool;
      return;
    }
  }
  
  public static PwDatabase getNewDBInstance(String paramString)
  {
    if (isKDBExtension(paramString)) {
      return new PwDatabaseV3();
    }
    return new PwDatabaseV4();
  }
  
  public static byte[] hexStringToByteArray(String paramString)
  {
    int j = paramString.length();
    byte[] arrayOfByte = new byte[j / 2];
    int i = 0;
    while (i < j)
    {
      arrayOfByte[(i / 2)] = ((byte)((Character.digit(paramString.charAt(i), 16) << 4) + Character.digit(paramString.charAt(i + 1), 16)));
      i += 2;
    }
    return arrayOfByte;
  }
  
  private static boolean isKDBExtension(String paramString)
  {
    if (paramString == null) {}
    int i;
    do
    {
      return false;
      i = paramString.lastIndexOf(".");
    } while (i == -1);
    return paramString.substring(i, paramString.length()).equalsIgnoreCase(".kdb");
  }
  
  private static byte[] transformMasterKey(byte[] paramArrayOfByte1, byte[] paramArrayOfByte2, int paramInt)
    throws IOException
  {
    return FinalKeyFactory.createFinalKey().transformMasterKey(paramArrayOfByte1, paramArrayOfByte2, paramInt);
  }
  
  public void addEntryTo(PwEntry paramPwEntry, PwGroup paramPwGroup)
  {
    if (paramPwGroup != null) {
      paramPwGroup.childEntries.add(paramPwEntry);
    }
    paramPwEntry.setParent(paramPwGroup);
    this.entries.put(paramPwEntry.getUUID(), paramPwEntry);
  }
  
  public void addGroupTo(PwGroup paramPwGroup1, PwGroup paramPwGroup2)
  {
    PwGroup localPwGroup = paramPwGroup2;
    if (paramPwGroup2 == null) {
      localPwGroup = this.rootGroup;
    }
    localPwGroup.childGroups.add(paramPwGroup1);
    paramPwGroup1.setParent(localPwGroup);
    this.groups.put(paramPwGroup1.getId(), paramPwGroup1);
    localPwGroup.touch(true, true);
  }
  
  public abstract boolean appSettingsEnabled();
  
  public boolean canRecycle(PwEntry paramPwEntry)
  {
    return false;
  }
  
  public boolean canRecycle(PwGroup paramPwGroup)
  {
    return false;
  }
  
  public abstract PwGroup createGroup();
  
  public void deleteEntry(PwEntry paramPwEntry)
  {
    PwGroup localPwGroup = paramPwEntry.getParent();
    removeEntryFrom(paramPwEntry, localPwGroup);
    localPwGroup.touch(false, true);
  }
  
  protected byte[] getCompositeKey(String paramString, InputStream paramInputStream)
    throws InvalidKeyFileException, IOException
  {
    assert ((paramString != null) && (paramInputStream != null));
    paramInputStream = getFileKey(paramInputStream);
    paramString = getPasswordKey(paramString);
    try
    {
      MessageDigest localMessageDigest = MessageDigest.getInstance("SHA-256");
      localMessageDigest.update(paramString);
      return localMessageDigest.digest(paramInputStream);
    }
    catch (NoSuchAlgorithmException paramString)
    {
      throw new IOException("SHA-256 not supported");
    }
  }
  
  public abstract PwEncryptionAlgorithm getEncAlgorithm();
  
  public abstract List<PwEntry> getEntries();
  
  /* Error */
  protected byte[] getFileKey(InputStream paramInputStream)
    throws InvalidKeyFileException, IOException
  {
    // Byte code:
    //   0: getstatic 30	com/keepassdroid/database/PwDatabase:$assertionsDisabled	Z
    //   3: ifne +15 -> 18
    //   6: aload_1
    //   7: ifnonnull +11 -> 18
    //   10: new 180	java/lang/AssertionError
    //   13: dup
    //   14: invokespecial 181	java/lang/AssertionError:<init>	()V
    //   17: athrow
    //   18: new 219	java/io/ByteArrayOutputStream
    //   21: dup
    //   22: invokespecial 220	java/io/ByteArrayOutputStream:<init>	()V
    //   25: astore 4
    //   27: aload_1
    //   28: aload 4
    //   30: invokestatic 226	com/keepassdroid/utils/Util:copyStream	(Ljava/io/InputStream;Ljava/io/OutputStream;)V
    //   33: aload 4
    //   35: invokevirtual 230	java/io/ByteArrayOutputStream:toByteArray	()[B
    //   38: astore_1
    //   39: aload_0
    //   40: new 232	java/io/ByteArrayInputStream
    //   43: dup
    //   44: aload_1
    //   45: invokespecial 234	java/io/ByteArrayInputStream:<init>	([B)V
    //   48: invokevirtual 237	com/keepassdroid/database/PwDatabase:loadXmlKeyFile	(Ljava/io/InputStream;)[B
    //   51: astore 4
    //   53: aload 4
    //   55: ifnull +6 -> 61
    //   58: aload 4
    //   60: areturn
    //   61: aload_1
    //   62: arraylength
    //   63: i2l
    //   64: lstore_2
    //   65: lload_2
    //   66: lconst_0
    //   67: lcmp
    //   68: ifne +11 -> 79
    //   71: new 239	com/keepassdroid/database/exception/KeyFileEmptyException
    //   74: dup
    //   75: invokespecial 240	com/keepassdroid/database/exception/KeyFileEmptyException:<init>	()V
    //   78: athrow
    //   79: lload_2
    //   80: ldc2_w 241
    //   83: lcmp
    //   84: ifne +5 -> 89
    //   87: aload_1
    //   88: areturn
    //   89: lload_2
    //   90: ldc2_w 243
    //   93: lcmp
    //   94: ifne +27 -> 121
    //   97: bipush 64
    //   99: newarray <illegal type>
    //   101: astore 4
    //   103: new 68	java/lang/String
    //   106: dup
    //   107: aload_1
    //   108: invokespecial 245	java/lang/String:<init>	([B)V
    //   111: invokestatic 247	com/keepassdroid/database/PwDatabase:hexStringToByteArray	(Ljava/lang/String;)[B
    //   114: astore 4
    //   116: aload 4
    //   118: areturn
    //   119: astore 4
    //   121: ldc -66
    //   123: invokestatic 196	java/security/MessageDigest:getInstance	(Ljava/lang/String;)Ljava/security/MessageDigest;
    //   126: astore 4
    //   128: sipush 2048
    //   131: newarray <illegal type>
    //   133: astore 5
    //   135: aload 4
    //   137: aload_1
    //   138: invokevirtual 200	java/security/MessageDigest:update	([B)V
    //   141: aload 4
    //   143: invokevirtual 249	java/security/MessageDigest:digest	()[B
    //   146: areturn
    //   147: astore_1
    //   148: new 101	java/io/IOException
    //   151: dup
    //   152: ldc -50
    //   154: invokespecial 209	java/io/IOException:<init>	(Ljava/lang/String;)V
    //   157: athrow
    //   158: astore_1
    //   159: getstatic 255	java/lang/System:out	Ljava/io/PrintStream;
    //   162: aload_1
    //   163: invokevirtual 259	java/lang/Exception:toString	()Ljava/lang/String;
    //   166: invokevirtual 264	java/io/PrintStream:println	(Ljava/lang/String;)V
    //   169: goto -28 -> 141
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	172	0	this	PwDatabase
    //   0	172	1	paramInputStream	InputStream
    //   64	26	2	l	long
    //   25	92	4	localObject	Object
    //   119	1	4	localIndexOutOfBoundsException	IndexOutOfBoundsException
    //   126	16	4	localMessageDigest	MessageDigest
    //   133	1	5	arrayOfByte	byte[]
    // Exception table:
    //   from	to	target	type
    //   103	116	119	java/lang/IndexOutOfBoundsException
    //   121	128	147	java/security/NoSuchAlgorithmException
    //   135	141	158	java/lang/Exception
  }
  
  public abstract List<PwGroup> getGroups();
  
  public abstract List<PwGroup> getGrpRoots();
  
  public abstract byte[] getMasterKey(String paramString, InputStream paramInputStream)
    throws InvalidKeyFileException, IOException;
  
  public abstract long getNumRounds();
  
  protected abstract String getPasswordEncoding();
  
  public byte[] getPasswordKey(String paramString)
    throws IOException
  {
    assert (paramString != null);
    if (paramString.length() == 0) {
      throw new IllegalArgumentException("Key cannot be empty.");
    }
    try
    {
      localMessageDigest = MessageDigest.getInstance("SHA-256");
    }
    catch (NoSuchAlgorithmException paramString)
    {
      MessageDigest localMessageDigest;
      byte[] arrayOfByte;
      label53:
      throw new IOException("SHA-256 not supported");
    }
    try
    {
      arrayOfByte = paramString.getBytes(getPasswordEncoding());
      paramString = arrayOfByte;
    }
    catch (UnsupportedEncodingException localUnsupportedEncodingException)
    {
      if ($assertionsDisabled) {
        break label92;
      }
      throw new AssertionError();
      paramString = paramString.getBytes();
      break label53;
    }
    localMessageDigest.update(paramString, 0, paramString.length);
    return localMessageDigest.digest();
  }
  
  public PwGroup getRecycleBin()
  {
    return null;
  }
  
  public abstract void initNew(String paramString);
  
  public abstract boolean isBackup(PwGroup paramPwGroup);
  
  protected boolean isGroupIdUsed(PwGroupId paramPwGroupId)
  {
    List localList = getGroups();
    int i = 0;
    while (i < localList.size())
    {
      if (((PwGroup)localList.get(i)).getId().equals(paramPwGroupId)) {
        return true;
      }
      i += 1;
    }
    return false;
  }
  
  public boolean isGroupSearchable(PwGroup paramPwGroup, boolean paramBoolean)
  {
    return paramPwGroup != null;
  }
  
  protected abstract byte[] loadXmlKeyFile(InputStream paramInputStream);
  
  public void makeFinalKey(byte[] paramArrayOfByte1, byte[] paramArrayOfByte2, int paramInt)
    throws IOException
  {
    try
    {
      MessageDigest localMessageDigest = MessageDigest.getInstance("SHA-256");
      DigestOutputStream localDigestOutputStream = new DigestOutputStream(new NullOutputStream(), localMessageDigest);
      paramArrayOfByte2 = transformMasterKey(paramArrayOfByte2, this.masterKey, paramInt);
      localDigestOutputStream.write(paramArrayOfByte1);
      localDigestOutputStream.write(paramArrayOfByte2);
      this.finalKey = localMessageDigest.digest();
      return;
    }
    catch (NoSuchAlgorithmException paramArrayOfByte1)
    {
      throw new IOException("SHA-256 not implemented here.");
    }
  }
  
  public abstract PwGroupId newGroupId();
  
  public void populateGlobals(PwGroup paramPwGroup)
  {
    List localList = paramPwGroup.childGroups;
    paramPwGroup = paramPwGroup.childEntries;
    int i = 0;
    while (i < paramPwGroup.size())
    {
      PwEntry localPwEntry = (PwEntry)paramPwGroup.get(i);
      this.entries.put(localPwEntry.getUUID(), localPwEntry);
      i += 1;
    }
    i = 0;
    while (i < localList.size())
    {
      paramPwGroup = (PwGroup)localList.get(i);
      this.groups.put(paramPwGroup.getId(), paramPwGroup);
      populateGlobals(paramPwGroup);
      i += 1;
    }
  }
  
  public void recycle(PwEntry paramPwEntry)
  {
    throw new RuntimeException("Call not valid for .kdb databases.");
  }
  
  public void removeEntryFrom(PwEntry paramPwEntry, PwGroup paramPwGroup)
  {
    if (paramPwGroup != null) {
      paramPwGroup.childEntries.remove(paramPwEntry);
    }
    this.entries.remove(paramPwEntry.getUUID());
  }
  
  public void removeGroupFrom(PwGroup paramPwGroup1, PwGroup paramPwGroup2)
  {
    paramPwGroup2.childGroups.remove(paramPwGroup1);
    this.groups.remove(paramPwGroup1.getId());
  }
  
  public void setMasterKey(String paramString, InputStream paramInputStream)
    throws InvalidKeyFileException, IOException
  {
    assert (paramString != null);
    this.masterKey = getMasterKey(paramString, paramInputStream);
  }
  
  public abstract void setNumRounds(long paramLong)
    throws NumberFormatException;
  
  public void undoDeleteEntry(PwEntry paramPwEntry, PwGroup paramPwGroup)
  {
    addEntryTo(paramPwEntry, paramPwGroup);
  }
  
  public void undoRecycle(PwEntry paramPwEntry, PwGroup paramPwGroup)
  {
    throw new RuntimeException("Call not valid for .kdb databases.");
  }
  
  /* Error */
  public boolean validatePasswordEncoding(String paramString)
  {
    // Byte code:
    //   0: aload_0
    //   1: invokevirtual 279	com/keepassdroid/database/PwDatabase:getPasswordEncoding	()Ljava/lang/String;
    //   4: astore_2
    //   5: aload_1
    //   6: aload_2
    //   7: invokevirtual 282	java/lang/String:getBytes	(Ljava/lang/String;)[B
    //   10: astore_3
    //   11: new 68	java/lang/String
    //   14: dup
    //   15: aload_3
    //   16: aload_2
    //   17: invokespecial 357	java/lang/String:<init>	([BLjava/lang/String;)V
    //   20: astore_2
    //   21: aload_1
    //   22: aload_2
    //   23: invokevirtual 358	java/lang/String:equals	(Ljava/lang/Object;)Z
    //   26: ireturn
    //   27: astore_1
    //   28: iconst_0
    //   29: ireturn
    //   30: astore_1
    //   31: iconst_0
    //   32: ireturn
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	33	0	this	PwDatabase
    //   0	33	1	paramString	String
    //   4	19	2	str	String
    //   10	6	3	arrayOfByte	byte[]
    // Exception table:
    //   from	to	target	type
    //   5	11	27	java/io/UnsupportedEncodingException
    //   11	21	30	java/io/UnsupportedEncodingException
  }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/com/keepassdroid/database/PwDatabase.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */