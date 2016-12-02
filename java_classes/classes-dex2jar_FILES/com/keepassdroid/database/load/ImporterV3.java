package com.keepassdroid.database.load;

import android.util.Log;
import com.keepassdroid.UpdateStatus;
import com.keepassdroid.crypto.CipherFactory;
import com.keepassdroid.database.PwDatabaseV3;
import com.keepassdroid.database.PwDate;
import com.keepassdroid.database.PwDbHeaderV3;
import com.keepassdroid.database.PwEncryptionAlgorithm;
import com.keepassdroid.database.PwEntryV3;
import com.keepassdroid.database.PwGroupV3;
import com.keepassdroid.database.PwIconFactory;
import com.keepassdroid.database.exception.InvalidAlgorithmException;
import com.keepassdroid.database.exception.InvalidDBException;
import com.keepassdroid.database.exception.InvalidDBSignatureException;
import com.keepassdroid.database.exception.InvalidDBVersionException;
import com.keepassdroid.database.exception.InvalidPasswordException;
import com.keepassdroid.stream.LEDataInputStream;
import com.keepassdroid.stream.LEDataOutputStream;
import com.keepassdroid.stream.NullOutputStream;
import com.keepassdroid.utils.Types;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.security.DigestOutputStream;
import java.security.InvalidAlgorithmParameterException;
import java.security.InvalidKeyException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Arrays;
import java.util.List;
import javax.crypto.BadPaddingException;
import javax.crypto.Cipher;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import javax.crypto.ShortBufferException;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;

public class ImporterV3
  extends Importer
{
  public static void bsw32(byte[] paramArrayOfByte, int paramInt)
  {
    int i = paramArrayOfByte[paramInt];
    paramArrayOfByte[paramInt] = paramArrayOfByte[(paramInt + 3)];
    paramArrayOfByte[(paramInt + 3)] = i;
    i = paramArrayOfByte[(paramInt + 1)];
    paramArrayOfByte[(paramInt + 1)] = paramArrayOfByte[(paramInt + 2)];
    paramArrayOfByte[(paramInt + 2)] = i;
  }
  
  public static byte[] makePad(byte[] paramArrayOfByte)
  {
    int j = 32 - paramArrayOfByte.length % 32;
    int i = 0;
    if (j < 9) {
      i = 32;
    }
    byte[] arrayOfByte = new byte[j + i];
    arrayOfByte[0] = Byte.MIN_VALUE;
    i = j + i - 8;
    LEDataOutputStream.writeInt(paramArrayOfByte.length >> 29, arrayOfByte, i);
    bsw32(arrayOfByte, i);
    i += 4;
    LEDataOutputStream.writeInt(paramArrayOfByte.length << 3, arrayOfByte, i);
    bsw32(arrayOfByte, i);
    return arrayOfByte;
  }
  
  protected PwDatabaseV3 createDB()
  {
    return new PwDatabaseV3();
  }
  
  public PwDatabaseV3 openDatabase(InputStream paramInputStream1, String paramString, InputStream paramInputStream2)
    throws IOException, InvalidDBException
  {
    return openDatabase(paramInputStream1, paramString, paramInputStream2, new UpdateStatus());
  }
  
  public PwDatabaseV3 openDatabase(InputStream paramInputStream1, String paramString, InputStream paramInputStream2, UpdateStatus paramUpdateStatus)
    throws IOException, InvalidDBException
  {
    int i = paramInputStream1.available();
    byte[] arrayOfByte = new byte[i + 16];
    paramInputStream1.read(arrayOfByte, 0, i);
    paramInputStream1.close();
    if (i < 124) {
      throw new IOException("File too short for header");
    }
    PwDbHeaderV3 localPwDbHeaderV3 = new PwDbHeaderV3();
    localPwDbHeaderV3.loadFromFile(arrayOfByte, 0);
    if ((localPwDbHeaderV3.signature1 != -1700603645) || (localPwDbHeaderV3.signature2 != -1253311643)) {
      throw new InvalidDBSignatureException();
    }
    if (!localPwDbHeaderV3.matchesVersion()) {
      throw new InvalidDBVersionException();
    }
    paramUpdateStatus.updateMessage(2131099675);
    PwDatabaseV3 localPwDatabaseV3 = createDB();
    localPwDatabaseV3.setMasterKey(paramString, paramInputStream2);
    if ((localPwDbHeaderV3.flags & 0x2) != 0)
    {
      localPwDatabaseV3.algorithm = PwEncryptionAlgorithm.Rjindal;
      localPwDatabaseV3.copyHeader(localPwDbHeaderV3);
      localPwDatabaseV3.numKeyEncRounds = localPwDbHeaderV3.numKeyEncRounds;
      localPwDatabaseV3.name = "KeePass Password Manager";
      localPwDatabaseV3.makeFinalKey(localPwDbHeaderV3.masterSeed, localPwDbHeaderV3.transformSeed, localPwDatabaseV3.numKeyEncRounds);
      paramUpdateStatus.updateMessage(2131099679);
    }
    for (;;)
    {
      try
      {
        if (localPwDatabaseV3.algorithm == PwEncryptionAlgorithm.Rjindal) {
          paramInputStream1 = CipherFactory.getInstance("AES/CBC/PKCS5Padding");
        }
      }
      catch (NoSuchAlgorithmException paramInputStream1)
      {
        throw new IOException("No such algorithm");
      }
      catch (NoSuchPaddingException paramInputStream1)
      {
        throw new IOException("No such pdading");
      }
      try
      {
        paramInputStream1.init(2, new SecretKeySpec(localPwDatabaseV3.finalKey, "AES"), new IvParameterSpec(localPwDbHeaderV3.encryptionIV));
      }
      catch (InvalidKeyException paramInputStream1)
      {
        throw new IOException("Invalid key");
      }
      catch (InvalidAlgorithmParameterException paramInputStream1)
      {
        throw new IOException("Invalid algorithm parameter.");
      }
      try
      {
        i = paramInputStream1.doFinal(arrayOfByte, 124, i - 124, arrayOfByte, 124);
        localPwDatabaseV3.copyEncrypted(arrayOfByte, 124, i);
      }
      catch (ShortBufferException paramInputStream1)
      {
        throw new IOException("Buffer too short");
      }
      catch (IllegalBlockSizeException paramInputStream1)
      {
        throw new IOException("Invalid block size");
      }
      catch (BadPaddingException paramInputStream1)
      {
        throw new InvalidPasswordException();
      }
      try
      {
        paramInputStream1 = MessageDigest.getInstance("SHA-256");
        paramString = new DigestOutputStream(new NullOutputStream(), paramInputStream1);
        paramString.write(arrayOfByte, 124, i);
        paramString.close();
        if (Arrays.equals(paramInputStream1.digest(), localPwDbHeaderV3.contentsHash)) {
          break label489;
        }
        Log.w("KeePassDroid", "Database file did not decrypt correctly. (checksum code is broken)");
        throw new InvalidPasswordException();
      }
      catch (NoSuchAlgorithmException paramInputStream1)
      {
        throw new IOException("No SHA-256 algorithm");
      }
      if ((localPwDbHeaderV3.flags & 0x8) != 0)
      {
        localPwDatabaseV3.algorithm = PwEncryptionAlgorithm.Twofish;
        break;
      }
      throw new InvalidAlgorithmException();
      if (localPwDatabaseV3.algorithm != PwEncryptionAlgorithm.Twofish) {
        continue;
      }
      paramInputStream1 = CipherFactory.getInstance("TWOFISH/CBC/PKCS7PADDING");
    }
    throw new IOException("Encryption algorithm is not supported");
    label489:
    i = 124;
    paramInputStream1 = new PwGroupV3();
    int j = 0;
    int k;
    int m;
    if (j < localPwDbHeaderV3.numGroups)
    {
      k = LEDataInputStream.readUShort(arrayOfByte, i);
      m = i + 2;
      i = LEDataInputStream.readInt(arrayOfByte, m);
      m += 4;
      if (k == 65535)
      {
        paramInputStream1.populateBlankFields(localPwDatabaseV3);
        localPwDatabaseV3.groups.add(paramInputStream1);
        paramInputStream1 = new PwGroupV3();
        j += 1;
      }
      for (;;)
      {
        i = m + i;
        break;
        readGroupField(localPwDatabaseV3, paramInputStream1, k, arrayOfByte, m);
      }
    }
    paramInputStream1 = new PwEntryV3();
    j = 0;
    if (j < localPwDbHeaderV3.numEntries)
    {
      m = LEDataInputStream.readUShort(arrayOfByte, i);
      k = LEDataInputStream.readInt(arrayOfByte, i + 2);
      if (m == 65535)
      {
        paramInputStream1.populateBlankFields(localPwDatabaseV3);
        localPwDatabaseV3.entries.add(paramInputStream1);
        paramInputStream1 = new PwEntryV3();
        j += 1;
      }
      for (;;)
      {
        i += k + 6;
        break;
        readEntryField(localPwDatabaseV3, paramInputStream1, arrayOfByte, i);
      }
    }
    localPwDatabaseV3.constructTree(null);
    return localPwDatabaseV3;
  }
  
  void readEntryField(PwDatabaseV3 paramPwDatabaseV3, PwEntryV3 paramPwEntryV3, byte[] paramArrayOfByte, int paramInt)
    throws UnsupportedEncodingException
  {
    int i = LEDataInputStream.readUShort(paramArrayOfByte, paramInt);
    int j = paramInt + 2;
    paramInt = LEDataInputStream.readInt(paramArrayOfByte, j);
    j += 4;
    switch (i)
    {
    case 0: 
    default: 
      return;
    case 1: 
      paramPwEntryV3.setUUID(Types.bytestoUUID(paramArrayOfByte, j));
      return;
    case 2: 
      paramPwEntryV3.groupId = LEDataInputStream.readInt(paramArrayOfByte, j);
      return;
    case 3: 
      i = LEDataInputStream.readInt(paramArrayOfByte, j);
      paramInt = i;
      if (i == -1) {
        paramInt = 0;
      }
      paramPwEntryV3.icon = paramPwDatabaseV3.iconFactory.getIcon(paramInt);
      return;
    case 4: 
      paramPwEntryV3.title = Types.readCString(paramArrayOfByte, j);
      return;
    case 5: 
      paramPwEntryV3.url = Types.readCString(paramArrayOfByte, j);
      return;
    case 6: 
      paramPwEntryV3.username = Types.readCString(paramArrayOfByte, j);
      return;
    case 7: 
      paramPwEntryV3.setPassword(paramArrayOfByte, j, Types.strlen(paramArrayOfByte, j));
      return;
    case 8: 
      paramPwEntryV3.additional = Types.readCString(paramArrayOfByte, j);
      return;
    case 9: 
      paramPwEntryV3.tCreation = new PwDate(paramArrayOfByte, j);
      return;
    case 10: 
      paramPwEntryV3.tLastMod = new PwDate(paramArrayOfByte, j);
      return;
    case 11: 
      paramPwEntryV3.tLastAccess = new PwDate(paramArrayOfByte, j);
      return;
    case 12: 
      paramPwEntryV3.tExpire = new PwDate(paramArrayOfByte, j);
      return;
    case 13: 
      paramPwEntryV3.binaryDesc = Types.readCString(paramArrayOfByte, j);
      return;
    }
    paramPwEntryV3.setBinaryData(paramArrayOfByte, j, paramInt);
  }
  
  void readGroupField(PwDatabaseV3 paramPwDatabaseV3, PwGroupV3 paramPwGroupV3, int paramInt1, byte[] paramArrayOfByte, int paramInt2)
    throws UnsupportedEncodingException
  {
    switch (paramInt1)
    {
    case 0: 
    default: 
      return;
    case 1: 
      paramPwGroupV3.groupId = LEDataInputStream.readInt(paramArrayOfByte, paramInt2);
      return;
    case 2: 
      paramPwGroupV3.name = Types.readCString(paramArrayOfByte, paramInt2);
      return;
    case 3: 
      paramPwGroupV3.tCreation = new PwDate(paramArrayOfByte, paramInt2);
      return;
    case 4: 
      paramPwGroupV3.tLastMod = new PwDate(paramArrayOfByte, paramInt2);
      return;
    case 5: 
      paramPwGroupV3.tLastAccess = new PwDate(paramArrayOfByte, paramInt2);
      return;
    case 6: 
      paramPwGroupV3.tExpire = new PwDate(paramArrayOfByte, paramInt2);
      return;
    case 7: 
      paramPwGroupV3.icon = paramPwDatabaseV3.iconFactory.getIcon(LEDataInputStream.readInt(paramArrayOfByte, paramInt2));
      return;
    case 8: 
      paramPwGroupV3.level = LEDataInputStream.readUShort(paramArrayOfByte, paramInt2);
      return;
    }
    paramPwGroupV3.flags = LEDataInputStream.readInt(paramArrayOfByte, paramInt2);
  }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/com/keepassdroid/database/load/ImporterV3.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */