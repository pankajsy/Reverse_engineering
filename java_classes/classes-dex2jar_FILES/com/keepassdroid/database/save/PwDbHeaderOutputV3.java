package com.keepassdroid.database.save;

import com.keepassdroid.database.PwDbHeaderV3;
import com.keepassdroid.stream.LEDataOutputStream;
import java.io.IOException;
import java.io.OutputStream;

public class PwDbHeaderOutputV3
{
  private PwDbHeaderV3 mHeader;
  private OutputStream mOS;
  
  public PwDbHeaderOutputV3(PwDbHeaderV3 paramPwDbHeaderV3, OutputStream paramOutputStream)
  {
    this.mHeader = paramPwDbHeaderV3;
    this.mOS = paramOutputStream;
  }
  
  public void close()
    throws IOException
  {
    this.mOS.close();
  }
  
  public void output()
    throws IOException
  {
    outputStart();
    outputContentHash();
    outputEnd();
  }
  
  public void outputContentHash()
    throws IOException
  {
    this.mOS.write(this.mHeader.contentsHash);
  }
  
  public void outputEnd()
    throws IOException
  {
    this.mOS.write(this.mHeader.transformSeed);
    this.mOS.write(LEDataOutputStream.writeIntBuf(this.mHeader.numKeyEncRounds));
  }
  
  public void outputStart()
    throws IOException
  {
    this.mOS.write(LEDataOutputStream.writeIntBuf(this.mHeader.signature1));
    this.mOS.write(LEDataOutputStream.writeIntBuf(this.mHeader.signature2));
    this.mOS.write(LEDataOutputStream.writeIntBuf(this.mHeader.flags));
    this.mOS.write(LEDataOutputStream.writeIntBuf(this.mHeader.version));
    this.mOS.write(this.mHeader.masterSeed);
    this.mOS.write(this.mHeader.encryptionIV);
    this.mOS.write(LEDataOutputStream.writeIntBuf(this.mHeader.numGroups));
    this.mOS.write(LEDataOutputStream.writeIntBuf(this.mHeader.numEntries));
  }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/com/keepassdroid/database/save/PwDbHeaderOutputV3.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */