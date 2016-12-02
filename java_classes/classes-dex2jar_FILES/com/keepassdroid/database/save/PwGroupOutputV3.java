package com.keepassdroid.database.save;

import com.keepassdroid.database.PwDate;
import com.keepassdroid.database.PwGroupV3;
import com.keepassdroid.database.PwIconStandard;
import com.keepassdroid.stream.LEDataOutputStream;
import com.keepassdroid.utils.Types;
import java.io.IOException;
import java.io.OutputStream;

public class PwGroupOutputV3
{
  public static final byte[] ACCESS_FIELD_TYPE;
  public static final byte[] CREATE_FIELD_TYPE;
  public static final byte[] DATE_FIELD_SIZE;
  public static final byte[] END_FIELD_TYPE;
  public static final byte[] EXPIRE_FIELD_TYPE;
  public static final byte[] FLAGS_FIELD_SIZE = LONG_FOUR;
  public static final byte[] FLAGS_FIELD_TYPE;
  public static final byte[] GROUPID_FIELD_SIZE;
  public static final byte[] GROUPID_FIELD_TYPE = LEDataOutputStream.writeUShortBuf(1);
  public static final byte[] IMAGEID_FIELD_SIZE;
  public static final byte[] IMAGEID_FIELD_TYPE;
  public static final byte[] LEVEL_FIELD_SIZE;
  public static final byte[] LEVEL_FIELD_TYPE;
  public static final byte[] LONG_FOUR;
  public static final byte[] MOD_FIELD_TYPE;
  public static final byte[] NAME_FIELD_TYPE = LEDataOutputStream.writeUShortBuf(2);
  public static final byte[] ZERO_FIELD_SIZE = LEDataOutputStream.writeIntBuf(0);
  private OutputStream mOS;
  private PwGroupV3 mPG;
  
  static
  {
    CREATE_FIELD_TYPE = LEDataOutputStream.writeUShortBuf(3);
    MOD_FIELD_TYPE = LEDataOutputStream.writeUShortBuf(4);
    ACCESS_FIELD_TYPE = LEDataOutputStream.writeUShortBuf(5);
    EXPIRE_FIELD_TYPE = LEDataOutputStream.writeUShortBuf(6);
    IMAGEID_FIELD_TYPE = LEDataOutputStream.writeUShortBuf(7);
    LEVEL_FIELD_TYPE = LEDataOutputStream.writeUShortBuf(8);
    FLAGS_FIELD_TYPE = LEDataOutputStream.writeUShortBuf(9);
    END_FIELD_TYPE = LEDataOutputStream.writeUShortBuf(65535);
    LONG_FOUR = LEDataOutputStream.writeIntBuf(4);
    GROUPID_FIELD_SIZE = LONG_FOUR;
    DATE_FIELD_SIZE = LEDataOutputStream.writeIntBuf(5);
    IMAGEID_FIELD_SIZE = LONG_FOUR;
    LEVEL_FIELD_SIZE = LEDataOutputStream.writeIntBuf(2);
  }
  
  public PwGroupOutputV3(PwGroupV3 paramPwGroupV3, OutputStream paramOutputStream)
  {
    this.mPG = paramPwGroupV3;
    this.mOS = paramOutputStream;
  }
  
  public void output()
    throws IOException
  {
    this.mOS.write(GROUPID_FIELD_TYPE);
    this.mOS.write(GROUPID_FIELD_SIZE);
    this.mOS.write(LEDataOutputStream.writeIntBuf(this.mPG.groupId));
    this.mOS.write(NAME_FIELD_TYPE);
    Types.writeCString(this.mPG.name, this.mOS);
    this.mOS.write(CREATE_FIELD_TYPE);
    this.mOS.write(DATE_FIELD_SIZE);
    this.mOS.write(this.mPG.tCreation.getCDate());
    this.mOS.write(MOD_FIELD_TYPE);
    this.mOS.write(DATE_FIELD_SIZE);
    this.mOS.write(this.mPG.tLastMod.getCDate());
    this.mOS.write(ACCESS_FIELD_TYPE);
    this.mOS.write(DATE_FIELD_SIZE);
    this.mOS.write(this.mPG.tLastAccess.getCDate());
    this.mOS.write(EXPIRE_FIELD_TYPE);
    this.mOS.write(DATE_FIELD_SIZE);
    this.mOS.write(this.mPG.tExpire.getCDate());
    this.mOS.write(IMAGEID_FIELD_TYPE);
    this.mOS.write(IMAGEID_FIELD_SIZE);
    this.mOS.write(LEDataOutputStream.writeIntBuf(this.mPG.icon.iconId));
    this.mOS.write(LEVEL_FIELD_TYPE);
    this.mOS.write(LEVEL_FIELD_SIZE);
    this.mOS.write(LEDataOutputStream.writeUShortBuf(this.mPG.level));
    this.mOS.write(FLAGS_FIELD_TYPE);
    this.mOS.write(FLAGS_FIELD_SIZE);
    this.mOS.write(LEDataOutputStream.writeIntBuf(this.mPG.flags));
    this.mOS.write(END_FIELD_TYPE);
    this.mOS.write(ZERO_FIELD_SIZE);
  }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/com/keepassdroid/database/save/PwGroupOutputV3.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */