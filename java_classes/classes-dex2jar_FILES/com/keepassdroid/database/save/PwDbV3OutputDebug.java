package com.keepassdroid.database.save;

import com.keepassdroid.database.PwDatabaseV3;
import com.keepassdroid.database.PwDatabaseV3Debug;
import com.keepassdroid.database.PwDbHeader;
import com.keepassdroid.database.PwDbHeaderV3;
import com.keepassdroid.database.exception.PwDbOutputException;
import java.io.OutputStream;
import java.security.SecureRandom;

public class PwDbV3OutputDebug
  extends PwDbV3Output
{
  PwDatabaseV3Debug debugDb;
  private boolean noHeaderHash;
  
  public PwDbV3OutputDebug(PwDatabaseV3 paramPwDatabaseV3, OutputStream paramOutputStream)
  {
    this(paramPwDatabaseV3, paramOutputStream, false);
  }
  
  public PwDbV3OutputDebug(PwDatabaseV3 paramPwDatabaseV3, OutputStream paramOutputStream, boolean paramBoolean)
  {
    super(paramPwDatabaseV3, paramOutputStream);
    this.debugDb = ((PwDatabaseV3Debug)paramPwDatabaseV3);
    this.noHeaderHash = paramBoolean;
  }
  
  protected SecureRandom setIVs(PwDbHeader paramPwDbHeader)
    throws PwDbOutputException
  {
    paramPwDbHeader = (PwDbHeaderV3)paramPwDbHeader;
    PwDbHeaderV3 localPwDbHeaderV3 = this.debugDb.dbHeader;
    System.arraycopy(localPwDbHeaderV3.encryptionIV, 0, paramPwDbHeader.encryptionIV, 0, localPwDbHeaderV3.encryptionIV.length);
    System.arraycopy(localPwDbHeaderV3.masterSeed, 0, paramPwDbHeader.masterSeed, 0, localPwDbHeaderV3.masterSeed.length);
    System.arraycopy(localPwDbHeaderV3.transformSeed, 0, paramPwDbHeader.transformSeed, 0, localPwDbHeaderV3.transformSeed.length);
    return null;
  }
  
  protected boolean useHeaderHash()
  {
    return !this.noHeaderHash;
  }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/com/keepassdroid/database/save/PwDbV3OutputDebug.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */