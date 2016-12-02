package com.keepassdroid.database.save;

import android.util.Xml;
import biz.source_code.base64Coder.Base64Coder;
import com.keepassdroid.crypto.CipherFactory;
import com.keepassdroid.crypto.PwStreamCipherFactory;
import com.keepassdroid.database.BinaryPool;
import com.keepassdroid.database.CrsAlgorithm;
import com.keepassdroid.database.EntryHandler;
import com.keepassdroid.database.GroupHandler;
import com.keepassdroid.database.ITimeLogger;
import com.keepassdroid.database.PwCompressionAlgorithm;
import com.keepassdroid.database.PwDatabaseV4;
import com.keepassdroid.database.PwDatabaseV4.MemoryProtectionConfig;
import com.keepassdroid.database.PwDatabaseV4XML;
import com.keepassdroid.database.PwDbHeader;
import com.keepassdroid.database.PwDbHeaderV4;
import com.keepassdroid.database.PwDeletedObject;
import com.keepassdroid.database.PwEntry;
import com.keepassdroid.database.PwEntryV4;
import com.keepassdroid.database.PwEntryV4.AutoType;
import com.keepassdroid.database.PwGroup;
import com.keepassdroid.database.PwGroupV4;
import com.keepassdroid.database.PwIconCustom;
import com.keepassdroid.database.PwIconStandard;
import com.keepassdroid.database.exception.PwDbOutputException;
import com.keepassdroid.database.security.ProtectedBinary;
import com.keepassdroid.database.security.ProtectedString;
import com.keepassdroid.utils.EmptyUtils;
import com.keepassdroid.utils.MemUtil;
import com.keepassdroid.utils.Types;
import java.io.IOException;
import java.io.OutputStream;
import java.security.SecureRandom;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;
import java.util.Stack;
import java.util.UUID;
import javax.crypto.CipherOutputStream;
import org.bouncycastle.crypto.StreamCipher;
import org.xmlpull.v1.XmlSerializer;

public class PwDbV4Output
  extends PwDbOutput
{
  private BinaryPool binPool;
  private byte[] hashOfHeader;
  private PwDbHeaderV4 header;
  PwDatabaseV4 mPM;
  private StreamCipher randomStream;
  private XmlSerializer xml;
  
  static
  {
    if (!PwDbV4Output.class.desiredAssertionStatus()) {}
    for (boolean bool = true;; bool = false)
    {
      $assertionsDisabled = bool;
      return;
    }
  }
  
  protected PwDbV4Output(PwDatabaseV4 paramPwDatabaseV4, OutputStream paramOutputStream)
  {
    super(paramOutputStream);
    this.mPM = paramPwDatabaseV4;
  }
  
  private CipherOutputStream attachStreamEncryptor(PwDbHeaderV4 paramPwDbHeaderV4, OutputStream paramOutputStream)
    throws PwDbOutputException
  {
    try
    {
      this.mPM.makeFinalKey(paramPwDbHeaderV4.masterSeed, paramPwDbHeaderV4.transformSeed, (int)this.mPM.numKeyEncRounds);
      paramPwDbHeaderV4 = CipherFactory.getInstance(this.mPM.dataCipher, 1, this.mPM.finalKey, paramPwDbHeaderV4.encryptionIV);
      return new CipherOutputStream(paramOutputStream, paramPwDbHeaderV4);
    }
    catch (Exception paramPwDbHeaderV4)
    {
      throw new PwDbOutputException("Invalid algorithm.");
    }
  }
  
  private void endGroup()
    throws IllegalArgumentException, IllegalStateException, IOException
  {
    this.xml.endTag(null, "Group");
  }
  
  private void outputDatabase(OutputStream paramOutputStream)
    throws IllegalArgumentException, IllegalStateException, IOException
  {
    this.binPool = new BinaryPool((PwGroupV4)this.mPM.rootGroup);
    this.xml = Xml.newSerializer();
    this.xml.setOutput(paramOutputStream, "UTF-8");
    this.xml.startDocument("UTF-8", Boolean.valueOf(true));
    this.xml.startTag(null, "KeePassFile");
    writeMeta();
    paramOutputStream = (PwGroupV4)this.mPM.rootGroup;
    this.xml.startTag(null, "Root");
    startGroup(paramOutputStream);
    Stack localStack = new Stack();
    localStack.push(paramOutputStream);
    if (!paramOutputStream.preOrderTraverseTree(new GroupWriter(localStack), new EntryWriter(null))) {
      throw new RuntimeException("Writing groups failed");
    }
    while (localStack.size() > 1)
    {
      this.xml.endTag(null, "Group");
      localStack.pop();
    }
    endGroup();
    writeList("DeletedObjects", this.mPM.deletedObjects);
    this.xml.endTag(null, "Root");
    this.xml.endTag(null, "KeePassFile");
    this.xml.endDocument();
  }
  
  private String safeXmlString(String paramString)
  {
    if (EmptyUtils.isNullOrEmpty(paramString)) {
      return paramString;
    }
    StringBuilder localStringBuilder = new StringBuilder();
    int j = 0;
    while (j < paramString.length())
    {
      int i = paramString.charAt(j);
      if (((i >= 32) && (i <= 55295)) || (i == 9) || (i == 10) || (i == 13) || ((i >= 57344) && (i <= 65533))) {
        localStringBuilder.append(i);
      }
      j += 1;
    }
    return localStringBuilder.toString();
  }
  
  private void startGroup(PwGroupV4 paramPwGroupV4)
    throws IllegalArgumentException, IllegalStateException, IOException
  {
    this.xml.startTag(null, "Group");
    writeObject("UUID", paramPwGroupV4.uuid);
    writeObject("Name", paramPwGroupV4.name);
    writeObject("Notes", paramPwGroupV4.notes);
    writeObject("IconID", paramPwGroupV4.icon.iconId);
    if (!paramPwGroupV4.customIcon.equals(PwIconCustom.ZERO)) {
      writeObject("CustomIconUUID", paramPwGroupV4.customIcon.uuid);
    }
    writeList("Times", paramPwGroupV4);
    writeObject("IsExpanded", Boolean.valueOf(paramPwGroupV4.isExpanded));
    writeObject("DefaultAutoTypeSequence", paramPwGroupV4.defaultAutoTypeSequence);
    writeObject("EnableAutoType", paramPwGroupV4.enableAutoType);
    writeObject("EnableSearching", paramPwGroupV4.enableSearching);
    writeObject("LastTopVisibleEntry", paramPwGroupV4.lastTopVisibleEntry);
  }
  
  private void subWriteValue(ProtectedBinary paramProtectedBinary)
    throws IllegalArgumentException, IllegalStateException, IOException
  {
    if (paramProtectedBinary.isProtected())
    {
      this.xml.attribute(null, "Protected", "True");
      int i = paramProtectedBinary.length();
      if (i > 0)
      {
        byte[] arrayOfByte = new byte[i];
        this.randomStream.processBytes(paramProtectedBinary.getData(), 0, i, arrayOfByte, 0);
        this.xml.text(String.valueOf(Base64Coder.encode(arrayOfByte)));
      }
      return;
    }
    if (this.mPM.compressionAlgorithm == PwCompressionAlgorithm.Gzip)
    {
      this.xml.attribute(null, "Compressed", "True");
      paramProtectedBinary = MemUtil.compress(paramProtectedBinary.getData());
      this.xml.text(String.valueOf(Base64Coder.encode(paramProtectedBinary)));
      return;
    }
    paramProtectedBinary = paramProtectedBinary.getData();
    this.xml.text(String.valueOf(Base64Coder.encode(paramProtectedBinary)));
  }
  
  private void writeBinPool()
    throws IllegalArgumentException, IllegalStateException, IOException
  {
    this.xml.startTag(null, "Binaries");
    Iterator localIterator = this.binPool.entrySet().iterator();
    while (localIterator.hasNext())
    {
      Map.Entry localEntry = (Map.Entry)localIterator.next();
      this.xml.startTag(null, "Binary");
      this.xml.attribute(null, "ID", (String)localEntry.getKey());
      subWriteValue((ProtectedBinary)localEntry.getValue());
      this.xml.endTag(null, "Binary");
    }
    this.xml.endTag(null, "Binaries");
  }
  
  private void writeCustomIconList()
    throws IllegalArgumentException, IllegalStateException, IOException
  {
    Object localObject = this.mPM.customIcons;
    if (((List)localObject).size() == 0) {
      return;
    }
    this.xml.startTag(null, "CustomIcons");
    localObject = ((List)localObject).iterator();
    while (((Iterator)localObject).hasNext())
    {
      PwIconCustom localPwIconCustom = (PwIconCustom)((Iterator)localObject).next();
      this.xml.startTag(null, "Icon");
      writeObject("UUID", localPwIconCustom.uuid);
      writeObject("Data", String.valueOf(Base64Coder.encode(localPwIconCustom.imageData)));
      this.xml.endTag(null, "Icon");
    }
    this.xml.endTag(null, "CustomIcons");
  }
  
  private void writeEntry(PwEntryV4 paramPwEntryV4, boolean paramBoolean)
    throws IllegalArgumentException, IllegalStateException, IOException
  {
    assert (paramPwEntryV4 != null);
    this.xml.startTag(null, "Entry");
    writeObject("UUID", paramPwEntryV4.uuid);
    writeObject("IconID", paramPwEntryV4.icon.iconId);
    if (!paramPwEntryV4.customIcon.equals(PwIconCustom.ZERO)) {
      writeObject("CustomIconUUID", paramPwEntryV4.customIcon.uuid);
    }
    writeObject("ForegroundColor", paramPwEntryV4.foregroundColor);
    writeObject("BackgroundColor", paramPwEntryV4.backgroupColor);
    writeObject("OverrideURL", paramPwEntryV4.overrideURL);
    writeObject("Tags", paramPwEntryV4.tags);
    writeList("Times", paramPwEntryV4);
    writeList(paramPwEntryV4.strings, true);
    writeList(paramPwEntryV4.binaries);
    writeList("AutoType", paramPwEntryV4.autoType);
    if (!paramBoolean) {
      writeList("History", paramPwEntryV4.history, true);
    }
    while (($assertionsDisabled) || (paramPwEntryV4.history.size() == 0))
    {
      this.xml.endTag(null, "Entry");
      return;
    }
    throw new AssertionError();
  }
  
  private void writeList(String paramString, ITimeLogger paramITimeLogger)
    throws IllegalArgumentException, IllegalStateException, IOException
  {
    assert ((paramString != null) && (paramITimeLogger != null));
    this.xml.startTag(null, paramString);
    writeObject("LastModificationTime", paramITimeLogger.getLastModificationTime());
    writeObject("CreationTime", paramITimeLogger.getCreationTime());
    writeObject("LastAccessTime", paramITimeLogger.getLastAccessTime());
    writeObject("ExpiryTime", paramITimeLogger.getExpiryTime());
    writeObject("Expires", Boolean.valueOf(paramITimeLogger.expires()));
    writeObject("UsageCount", paramITimeLogger.getUsageCount());
    writeObject("LocationChanged", paramITimeLogger.getLocationChanged());
    this.xml.endTag(null, paramString);
  }
  
  private void writeList(String paramString, PwDatabaseV4.MemoryProtectionConfig paramMemoryProtectionConfig)
    throws IllegalArgumentException, IllegalStateException, IOException
  {
    assert ((paramString != null) && (paramMemoryProtectionConfig != null));
    this.xml.startTag(null, paramString);
    writeObject("ProtectTitle", Boolean.valueOf(paramMemoryProtectionConfig.protectTitle));
    writeObject("ProtectUserName", Boolean.valueOf(paramMemoryProtectionConfig.protectUserName));
    writeObject("ProtectPassword", Boolean.valueOf(paramMemoryProtectionConfig.protectPassword));
    writeObject("ProtectURL", Boolean.valueOf(paramMemoryProtectionConfig.protectUrl));
    writeObject("ProtectNotes", Boolean.valueOf(paramMemoryProtectionConfig.protectNotes));
    this.xml.endTag(null, paramString);
  }
  
  private void writeList(String paramString, PwEntryV4.AutoType paramAutoType)
    throws IllegalArgumentException, IllegalStateException, IOException
  {
    assert ((paramString != null) && (paramAutoType != null));
    this.xml.startTag(null, paramString);
    writeObject("Enabled", Boolean.valueOf(paramAutoType.enabled));
    writeObject("DataTransferObfuscation", paramAutoType.obfuscationOptions);
    if (paramAutoType.defaultSequence.length() > 0) {
      writeObject("DefaultSequence", paramAutoType.defaultSequence, true);
    }
    paramAutoType = paramAutoType.entrySet().iterator();
    while (paramAutoType.hasNext())
    {
      Map.Entry localEntry = (Map.Entry)paramAutoType.next();
      writeObject("Association", "Window", (String)localEntry.getKey(), "KeystrokeSequence", (String)localEntry.getValue());
    }
    this.xml.endTag(null, paramString);
  }
  
  private void writeList(String paramString, List<PwDeletedObject> paramList)
    throws IllegalArgumentException, IllegalStateException, IOException
  {
    assert ((paramString != null) && (paramList != null));
    this.xml.startTag(null, paramString);
    paramList = paramList.iterator();
    while (paramList.hasNext()) {
      writeObject("DeletedObject", (PwDeletedObject)paramList.next());
    }
    this.xml.endTag(null, paramString);
  }
  
  private void writeList(String paramString, List<PwEntryV4> paramList, boolean paramBoolean)
    throws IllegalArgumentException, IllegalStateException, IOException
  {
    assert ((paramString != null) && (paramList != null));
    this.xml.startTag(null, paramString);
    paramList = paramList.iterator();
    while (paramList.hasNext()) {
      writeEntry((PwEntryV4)paramList.next(), paramBoolean);
    }
    this.xml.endTag(null, paramString);
  }
  
  private void writeList(String paramString, Map<String, String> paramMap)
    throws IllegalArgumentException, IllegalStateException, IOException
  {
    assert ((paramString != null) && (paramMap != null));
    this.xml.startTag(null, paramString);
    paramMap = paramMap.entrySet().iterator();
    while (paramMap.hasNext())
    {
      Map.Entry localEntry = (Map.Entry)paramMap.next();
      writeObject("Item", "Key", (String)localEntry.getKey(), "Value", (String)localEntry.getValue());
    }
    this.xml.endTag(null, paramString);
  }
  
  private void writeList(Map<String, ProtectedBinary> paramMap)
    throws IllegalArgumentException, IllegalStateException, IOException
  {
    assert (paramMap != null);
    paramMap = paramMap.entrySet().iterator();
    while (paramMap.hasNext())
    {
      Map.Entry localEntry = (Map.Entry)paramMap.next();
      writeObject((String)localEntry.getKey(), (ProtectedBinary)localEntry.getValue(), true);
    }
  }
  
  private void writeList(Map<String, ProtectedString> paramMap, boolean paramBoolean)
    throws IllegalArgumentException, IllegalStateException, IOException
  {
    assert (paramMap != null);
    paramMap = paramMap.entrySet().iterator();
    while (paramMap.hasNext())
    {
      Map.Entry localEntry = (Map.Entry)paramMap.next();
      writeObject((String)localEntry.getKey(), (ProtectedString)localEntry.getValue(), paramBoolean);
    }
  }
  
  private void writeMeta()
    throws IllegalArgumentException, IllegalStateException, IOException
  {
    this.xml.startTag(null, "Meta");
    writeObject("Generator", this.mPM.localizedAppName);
    if (this.hashOfHeader != null) {
      writeObject("HeaderHash", String.valueOf(Base64Coder.encode(this.hashOfHeader)));
    }
    writeObject("DatabaseName", this.mPM.name, true);
    writeObject("DatabaseNameChanged", this.mPM.nameChanged);
    writeObject("DatabaseDescription", this.mPM.description, true);
    writeObject("DatabaseDescriptionChanged", this.mPM.descriptionChanged);
    writeObject("DefaultUserName", this.mPM.defaultUserName, true);
    writeObject("DefaultUserNameChanged", this.mPM.defaultUserNameChanged);
    writeObject("MaintenanceHistoryDays", this.mPM.maintenanceHistoryDays);
    writeObject("Color", this.mPM.color);
    writeObject("MasterKeyChanged", this.mPM.keyLastChanged);
    writeObject("MasterKeyChangeRec", this.mPM.keyChangeRecDays);
    writeObject("MasterKeyChangeForce", this.mPM.keyChangeForceDays);
    writeList("MemoryProtection", this.mPM.memoryProtection);
    writeCustomIconList();
    writeObject("RecycleBinEnabled", Boolean.valueOf(this.mPM.recycleBinEnabled));
    writeObject("RecycleBinUUID", this.mPM.recycleBinUUID);
    writeObject("RecycleBinChanged", this.mPM.recycleBinChanged);
    writeObject("EntryTemplatesGroup", this.mPM.entryTemplatesGroup);
    writeObject("EntryTemplatesGroupChanged", this.mPM.entryTemplatesGroupChanged);
    writeObject("HistoryMaxItems", this.mPM.historyMaxItems);
    writeObject("HistoryMaxSize", this.mPM.historyMaxSize);
    writeObject("LastSelectedGroup", this.mPM.lastSelectedGroup);
    writeObject("LastTopVisibleGroup", this.mPM.lastTopVisibleGroup);
    writeBinPool();
    writeList("CustomData", this.mPM.customData);
    this.xml.endTag(null, "Meta");
  }
  
  private void writeObject(String paramString, long paramLong)
    throws IllegalArgumentException, IllegalStateException, IOException
  {
    writeObject(paramString, String.valueOf(paramLong));
  }
  
  private void writeObject(String paramString, PwDeletedObject paramPwDeletedObject)
    throws IllegalArgumentException, IllegalStateException, IOException
  {
    assert ((paramString != null) && (paramPwDeletedObject != null));
    this.xml.startTag(null, paramString);
    writeObject("UUID", paramPwDeletedObject.uuid);
    writeObject("DeletionTime", paramPwDeletedObject.getDeletionTime());
    this.xml.endTag(null, paramString);
  }
  
  private void writeObject(String paramString, ProtectedBinary paramProtectedBinary, boolean paramBoolean)
    throws IllegalArgumentException, IllegalStateException, IOException
  {
    assert ((paramString != null) && (paramProtectedBinary != null));
    this.xml.startTag(null, "Binary");
    this.xml.startTag(null, "Key");
    this.xml.text(safeXmlString(paramString));
    this.xml.endTag(null, "Key");
    this.xml.startTag(null, "Value");
    paramString = null;
    if (paramBoolean) {
      paramString = this.binPool.poolFind(paramProtectedBinary);
    }
    if (paramString != null) {
      this.xml.attribute(null, "Ref", paramString);
    }
    for (;;)
    {
      this.xml.endTag(null, "Value");
      this.xml.endTag(null, "Binary");
      return;
      subWriteValue(paramProtectedBinary);
    }
  }
  
  private void writeObject(String paramString, ProtectedString paramProtectedString, boolean paramBoolean)
    throws IllegalArgumentException, IllegalStateException, IOException
  {
    assert ((paramString != null) && (paramProtectedString != null));
    this.xml.startTag(null, "String");
    this.xml.startTag(null, "Key");
    this.xml.text(safeXmlString(paramString));
    this.xml.endTag(null, "Key");
    this.xml.startTag(null, "Value");
    boolean bool2 = paramProtectedString.isProtected();
    boolean bool1 = bool2;
    if (paramBoolean)
    {
      if (paramString.equals("Title")) {
        bool1 = this.mPM.memoryProtection.protectTitle;
      }
    }
    else
    {
      if (!bool1) {
        break label340;
      }
      this.xml.attribute(null, "Protected", "True");
      paramString = paramProtectedString.toString().getBytes("UTF-8");
      int i = paramString.length;
      if (i > 0)
      {
        paramProtectedString = new byte[i];
        this.randomStream.processBytes(paramString, 0, i, paramProtectedString, 0);
        this.xml.text(String.valueOf(Base64Coder.encode(paramProtectedString)));
      }
    }
    for (;;)
    {
      this.xml.endTag(null, "Value");
      this.xml.endTag(null, "String");
      return;
      if (paramString.equals("UserName"))
      {
        bool1 = this.mPM.memoryProtection.protectUserName;
        break;
      }
      if (paramString.equals("Password"))
      {
        bool1 = this.mPM.memoryProtection.protectPassword;
        break;
      }
      if (paramString.equals("URL"))
      {
        bool1 = this.mPM.memoryProtection.protectUrl;
        break;
      }
      bool1 = bool2;
      if (!paramString.equals("Notes")) {
        break;
      }
      bool1 = this.mPM.memoryProtection.protectNotes;
      break;
      label340:
      this.xml.text(safeXmlString(paramProtectedString.toString()));
    }
  }
  
  private void writeObject(String paramString, Boolean paramBoolean)
    throws IllegalArgumentException, IllegalStateException, IOException
  {
    if (paramBoolean == null) {
      paramBoolean = "null";
    }
    for (;;)
    {
      writeObject(paramString, paramBoolean);
      return;
      if (paramBoolean.booleanValue()) {
        paramBoolean = "True";
      } else {
        paramBoolean = "False";
      }
    }
  }
  
  private void writeObject(String paramString1, String paramString2)
    throws IllegalArgumentException, IllegalStateException, IOException
  {
    writeObject(paramString1, paramString2, false);
  }
  
  private void writeObject(String paramString1, String paramString2, String paramString3, String paramString4, String paramString5)
    throws IllegalArgumentException, IllegalStateException, IOException
  {
    this.xml.startTag(null, paramString1);
    this.xml.startTag(null, paramString2);
    this.xml.text(safeXmlString(paramString3));
    this.xml.endTag(null, paramString2);
    this.xml.startTag(null, paramString4);
    this.xml.text(safeXmlString(paramString5));
    this.xml.endTag(null, paramString4);
    this.xml.endTag(null, paramString1);
  }
  
  private void writeObject(String paramString1, String paramString2, boolean paramBoolean)
    throws IllegalArgumentException, IllegalStateException, IOException
  {
    assert ((paramString1 != null) && (paramString2 != null));
    this.xml.startTag(null, paramString1);
    String str = paramString2;
    if (paramBoolean) {
      str = safeXmlString(paramString2);
    }
    this.xml.text(str);
    this.xml.endTag(null, paramString1);
  }
  
  private void writeObject(String paramString, Date paramDate)
    throws IllegalArgumentException, IllegalStateException, IOException
  {
    writeObject(paramString, PwDatabaseV4XML.dateFormat.format(paramDate));
  }
  
  private void writeObject(String paramString, UUID paramUUID)
    throws IllegalArgumentException, IllegalStateException, IOException
  {
    writeObject(paramString, String.valueOf(Base64Coder.encode(Types.UUIDtoBytes(paramUUID))));
  }
  
  /* Error */
  public void output()
    throws PwDbOutputException
  {
    // Byte code:
    //   0: aload_0
    //   1: aload_0
    //   2: aload_0
    //   3: getfield 834	com/keepassdroid/database/save/PwDbV4Output:mOS	Ljava/io/OutputStream;
    //   6: invokevirtual 838	com/keepassdroid/database/save/PwDbV4Output:outputHeader	(Ljava/io/OutputStream;)Lcom/keepassdroid/database/PwDbHeader;
    //   9: checkcast 76	com/keepassdroid/database/PwDbHeaderV4
    //   12: putfield 840	com/keepassdroid/database/save/PwDbV4Output:header	Lcom/keepassdroid/database/PwDbHeaderV4;
    //   15: aload_0
    //   16: aload_0
    //   17: getfield 840	com/keepassdroid/database/save/PwDbV4Output:header	Lcom/keepassdroid/database/PwDbHeaderV4;
    //   20: aload_0
    //   21: getfield 834	com/keepassdroid/database/save/PwDbV4Output:mOS	Ljava/io/OutputStream;
    //   24: invokespecial 842	com/keepassdroid/database/save/PwDbV4Output:attachStreamEncryptor	(Lcom/keepassdroid/database/PwDbHeaderV4;Ljava/io/OutputStream;)Ljavax/crypto/CipherOutputStream;
    //   27: astore_1
    //   28: aload_1
    //   29: aload_0
    //   30: getfield 840	com/keepassdroid/database/save/PwDbV4Output:header	Lcom/keepassdroid/database/PwDbHeaderV4;
    //   33: getfield 845	com/keepassdroid/database/PwDbHeaderV4:streamStartBytes	[B
    //   36: invokevirtual 849	javax/crypto/CipherOutputStream:write	([B)V
    //   39: new 851	com/keepassdroid/stream/HashedBlockOutputStream
    //   42: dup
    //   43: aload_1
    //   44: invokespecial 852	com/keepassdroid/stream/HashedBlockOutputStream:<init>	(Ljava/io/OutputStream;)V
    //   47: astore_1
    //   48: aload_0
    //   49: getfield 44	com/keepassdroid/database/save/PwDbV4Output:mPM	Lcom/keepassdroid/database/PwDatabaseV4;
    //   52: getfield 380	com/keepassdroid/database/PwDatabaseV4:compressionAlgorithm	Lcom/keepassdroid/database/PwCompressionAlgorithm;
    //   55: getstatic 385	com/keepassdroid/database/PwCompressionAlgorithm:Gzip	Lcom/keepassdroid/database/PwCompressionAlgorithm;
    //   58: if_acmpne +22 -> 80
    //   61: new 854	java/util/zip/GZIPOutputStream
    //   64: dup
    //   65: aload_1
    //   66: invokespecial 855	java/util/zip/GZIPOutputStream:<init>	(Ljava/io/OutputStream;)V
    //   69: astore_1
    //   70: aload_0
    //   71: aload_1
    //   72: invokespecial 857	com/keepassdroid/database/save/PwDbV4Output:outputDatabase	(Ljava/io/OutputStream;)V
    //   75: aload_1
    //   76: invokevirtual 862	java/io/OutputStream:close	()V
    //   79: return
    //   80: goto -10 -> 70
    //   83: astore_1
    //   84: new 72	com/keepassdroid/database/exception/PwDbOutputException
    //   87: dup
    //   88: aload_1
    //   89: invokespecial 865	com/keepassdroid/database/exception/PwDbOutputException:<init>	(Ljava/lang/Exception;)V
    //   92: athrow
    //   93: astore_1
    //   94: new 72	com/keepassdroid/database/exception/PwDbOutputException
    //   97: dup
    //   98: aload_1
    //   99: invokespecial 865	com/keepassdroid/database/exception/PwDbOutputException:<init>	(Ljava/lang/Exception;)V
    //   102: athrow
    //   103: astore_1
    //   104: new 72	com/keepassdroid/database/exception/PwDbOutputException
    //   107: dup
    //   108: aload_1
    //   109: invokespecial 865	com/keepassdroid/database/exception/PwDbOutputException:<init>	(Ljava/lang/Exception;)V
    //   112: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	113	0	this	PwDbV4Output
    //   27	49	1	localObject	Object
    //   83	6	1	localIllegalArgumentException	IllegalArgumentException
    //   93	6	1	localIllegalStateException	IllegalStateException
    //   103	6	1	localIOException	IOException
    // Exception table:
    //   from	to	target	type
    //   28	70	83	java/lang/IllegalArgumentException
    //   70	79	83	java/lang/IllegalArgumentException
    //   28	70	93	java/lang/IllegalStateException
    //   70	79	93	java/lang/IllegalStateException
    //   28	70	103	java/io/IOException
    //   70	79	103	java/io/IOException
  }
  
  public PwDbHeader outputHeader(OutputStream paramOutputStream)
    throws PwDbOutputException
  {
    PwDbHeaderV4 localPwDbHeaderV4 = new PwDbHeaderV4(this.mPM);
    setIVs(localPwDbHeaderV4);
    paramOutputStream = new PwDbHeaderOutputV4(this.mPM, localPwDbHeaderV4, paramOutputStream);
    try
    {
      paramOutputStream.output();
      this.hashOfHeader = paramOutputStream.getHashOfHeader();
      return localPwDbHeaderV4;
    }
    catch (IOException paramOutputStream)
    {
      throw new PwDbOutputException("Failed to output the header.");
    }
  }
  
  protected SecureRandom setIVs(PwDbHeader paramPwDbHeader)
    throws PwDbOutputException
  {
    SecureRandom localSecureRandom = super.setIVs(paramPwDbHeader);
    paramPwDbHeader = (PwDbHeaderV4)paramPwDbHeader;
    localSecureRandom.nextBytes(paramPwDbHeader.masterSeed);
    localSecureRandom.nextBytes(paramPwDbHeader.transformSeed);
    localSecureRandom.nextBytes(paramPwDbHeader.encryptionIV);
    localSecureRandom.nextBytes(paramPwDbHeader.protectedStreamKey);
    paramPwDbHeader.innerRandomStream = CrsAlgorithm.Salsa20;
    this.randomStream = PwStreamCipherFactory.getInstance(paramPwDbHeader.innerRandomStream, paramPwDbHeader.protectedStreamKey);
    if (this.randomStream == null) {
      throw new PwDbOutputException("Invalid random cipher");
    }
    localSecureRandom.nextBytes(paramPwDbHeader.streamStartBytes);
    return localSecureRandom;
  }
  
  private class EntryWriter
    extends EntryHandler<PwEntry>
  {
    static
    {
      if (!PwDbV4Output.class.desiredAssertionStatus()) {}
      for (boolean bool = true;; bool = false)
      {
        $assertionsDisabled = bool;
        return;
      }
    }
    
    private EntryWriter() {}
    
    public boolean operate(PwEntry paramPwEntry)
    {
      paramPwEntry = (PwEntryV4)paramPwEntry;
      assert (paramPwEntry != null);
      try
      {
        PwDbV4Output.this.writeEntry(paramPwEntry, false);
        return true;
      }
      catch (IOException paramPwEntry)
      {
        throw new RuntimeException(paramPwEntry);
      }
    }
  }
  
  private class GroupWriter
    extends GroupHandler<PwGroup>
  {
    private Stack<PwGroupV4> groupStack;
    
    static
    {
      if (!PwDbV4Output.class.desiredAssertionStatus()) {}
      for (boolean bool = true;; bool = false)
      {
        $assertionsDisabled = bool;
        return;
      }
    }
    
    public GroupWriter()
    {
      Stack localStack;
      this.groupStack = localStack;
    }
    
    public boolean operate(PwGroup paramPwGroup)
    {
      paramPwGroup = (PwGroupV4)paramPwGroup;
      assert (paramPwGroup != null);
      try
      {
        int i;
        do
        {
          PwDbV4Output.this.endGroup();
          if (paramPwGroup.parent == this.groupStack.peek())
          {
            this.groupStack.push(paramPwGroup);
            PwDbV4Output.this.startGroup(paramPwGroup);
            return true;
          }
          this.groupStack.pop();
          i = this.groupStack.size();
        } while (i > 0);
        return false;
      }
      catch (IOException paramPwGroup)
      {
        throw new RuntimeException(paramPwGroup);
      }
    }
  }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/com/keepassdroid/database/save/PwDbV4Output.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */