package com.keepassdroid.database.save;

import com.keepassdroid.database.CrsAlgorithm;
import com.keepassdroid.database.PwCompressionAlgorithm;
import com.keepassdroid.database.PwDatabaseV4;
import com.keepassdroid.database.PwDbHeaderV4;
import com.keepassdroid.database.exception.PwDbOutputException;
import com.keepassdroid.stream.LEDataOutputStream;
import com.keepassdroid.utils.Types;
import java.io.IOException;
import java.io.OutputStream;
import java.security.DigestOutputStream;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class PwDbHeaderOutputV4
  extends PwDbHeaderOutput
{
  private static byte[] EndHeaderValue = { 13, 10, 13, 10 };
  private PwDatabaseV4 db;
  private DigestOutputStream dos;
  private PwDbHeaderV4 header;
  private LEDataOutputStream los;
  
  public PwDbHeaderOutputV4(PwDatabaseV4 paramPwDatabaseV4, PwDbHeaderV4 paramPwDbHeaderV4, OutputStream paramOutputStream)
    throws PwDbOutputException
  {
    this.db = paramPwDatabaseV4;
    this.header = paramPwDbHeaderV4;
    try
    {
      paramPwDatabaseV4 = MessageDigest.getInstance("SHA-256");
      this.dos = new DigestOutputStream(paramOutputStream, paramPwDatabaseV4);
      this.los = new LEDataOutputStream(this.dos);
      return;
    }
    catch (NoSuchAlgorithmException paramPwDatabaseV4)
    {
      throw new PwDbOutputException("SHA-256 not implemented here.");
    }
  }
  
  private void writeHeaderField(byte paramByte, byte[] paramArrayOfByte)
    throws IOException
  {
    this.los.write(paramByte);
    if (paramArrayOfByte != null)
    {
      this.los.writeUShort(paramArrayOfByte.length);
      this.los.write(paramArrayOfByte);
      return;
    }
    this.los.writeUShort(0);
  }
  
  public void output()
    throws IOException
  {
    this.los.writeUInt(-1700603645L);
    this.los.writeUInt(-1253311641L);
    this.los.writeUInt(196609L);
    writeHeaderField((byte)2, Types.UUIDtoBytes(this.db.dataCipher));
    writeHeaderField((byte)3, LEDataOutputStream.writeIntBuf(this.db.compressionAlgorithm.id));
    writeHeaderField((byte)4, this.header.masterSeed);
    writeHeaderField((byte)5, this.header.transformSeed);
    writeHeaderField((byte)6, LEDataOutputStream.writeLongBuf(this.db.numKeyEncRounds));
    writeHeaderField((byte)7, this.header.encryptionIV);
    writeHeaderField((byte)8, this.header.protectedStreamKey);
    writeHeaderField((byte)9, this.header.streamStartBytes);
    writeHeaderField((byte)10, LEDataOutputStream.writeIntBuf(this.header.innerRandomStream.id));
    writeHeaderField((byte)0, EndHeaderValue);
    this.los.flush();
    this.hashOfHeader = this.dos.getMessageDigest().digest();
  }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/com/keepassdroid/database/save/PwDbHeaderOutputV4.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */