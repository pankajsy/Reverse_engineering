package com.keepassdroid.database.save;

import com.keepassdroid.database.PwEntryV3;
import com.keepassdroid.stream.LEDataOutputStream;
import com.keepassdroid.utils.Types;

import java.io.IOException;
import java.io.OutputStream;

public class PwEntryOutputV3 {
    public static final byte[] ACCESS_FIELD_TYPE;
    public static final byte[] ADDITIONAL_FIELD_TYPE;
    public static final byte[] BINARY_DATA_FIELD_TYPE;
    public static final byte[] BINARY_DESC_FIELD_TYPE;
    public static final byte[] CREATE_FIELD_TYPE;
    public static final byte[] DATE_FIELD_SIZE;
    public static final byte[] END_FIELD_TYPE;
    public static final byte[] EXPIRE_FIELD_TYPE;
    public static final byte[] FLAGS_FIELD_SIZE;
    public static final byte[] GROUPID_FIELD_TYPE;
    public static final byte[] IMAGEID_FIELD_SIZE;
    public static final byte[] IMAGEID_FIELD_TYPE;
    public static final byte[] LEVEL_FIELD_SIZE;
    public static final byte[] LONG_FOUR;
    public static final byte[] MOD_FIELD_TYPE;
    public static final byte[] PASSWORD_FIELD_TYPE;
    public static final byte[] TEST = {51, 51, 51, 51};
    public static final byte[] TITLE_FIELD_TYPE;
    public static final byte[] URL_FIELD_TYPE;
    public static final byte[] USERNAME_FIELD_TYPE;
    public static final byte[] UUID_FIELD_SIZE;
    public static final byte[] UUID_FIELD_TYPE = LEDataOutputStream.writeUShortBuf(1);
    public static final byte[] ZERO_FIELD_SIZE;
    public static final byte[] ZERO_FIVE;

    static {
        GROUPID_FIELD_TYPE = LEDataOutputStream.writeUShortBuf(2);
        IMAGEID_FIELD_TYPE = LEDataOutputStream.writeUShortBuf(3);
        TITLE_FIELD_TYPE = LEDataOutputStream.writeUShortBuf(4);
        URL_FIELD_TYPE = LEDataOutputStream.writeUShortBuf(5);
        USERNAME_FIELD_TYPE = LEDataOutputStream.writeUShortBuf(6);
        PASSWORD_FIELD_TYPE = LEDataOutputStream.writeUShortBuf(7);
        ADDITIONAL_FIELD_TYPE = LEDataOutputStream.writeUShortBuf(8);
        CREATE_FIELD_TYPE = LEDataOutputStream.writeUShortBuf(9);
        MOD_FIELD_TYPE = LEDataOutputStream.writeUShortBuf(10);
        ACCESS_FIELD_TYPE = LEDataOutputStream.writeUShortBuf(11);
        EXPIRE_FIELD_TYPE = LEDataOutputStream.writeUShortBuf(12);
        BINARY_DESC_FIELD_TYPE = LEDataOutputStream.writeUShortBuf(13);
        BINARY_DATA_FIELD_TYPE = LEDataOutputStream.writeUShortBuf(14);
        END_FIELD_TYPE = LEDataOutputStream.writeUShortBuf(65535);
        LONG_FOUR = LEDataOutputStream.writeIntBuf(4);
        UUID_FIELD_SIZE = LEDataOutputStream.writeIntBuf(16);
        DATE_FIELD_SIZE = LEDataOutputStream.writeIntBuf(5);
        IMAGEID_FIELD_SIZE = LONG_FOUR;
        LEVEL_FIELD_SIZE = LONG_FOUR;
        FLAGS_FIELD_SIZE = LONG_FOUR;
        ZERO_FIELD_SIZE = LEDataOutputStream.writeIntBuf(0);
        ZERO_FIVE = new byte[]{0, 0, 0, 0, 0};
    }

    private OutputStream mOS;
    private PwEntryV3 mPE;
    private long outputBytes = 0L;

    public PwEntryOutputV3(PwEntryV3 paramPwEntryV3, OutputStream paramOutputStream) {
        this.mPE = paramPwEntryV3;
        this.mOS = paramOutputStream;
    }

    private int writeByteArray(byte[] paramArrayOfByte)
            throws IOException {
        if (paramArrayOfByte != null) {
        }
        for (int i = paramArrayOfByte.length; ; i = 0) {
            this.mOS.write(BINARY_DATA_FIELD_TYPE);
            this.mOS.write(LEDataOutputStream.writeIntBuf(i));
            if (paramArrayOfByte != null) {
                this.mOS.write(paramArrayOfByte);
            }
            return i;
        }
    }

    private void writeDate(byte[] paramArrayOfByte1, byte[] paramArrayOfByte2)
            throws IOException {
        this.mOS.write(paramArrayOfByte1);
        this.mOS.write(DATE_FIELD_SIZE);
        if (paramArrayOfByte2 != null) {
            this.mOS.write(paramArrayOfByte2);
            return;
        }
        this.mOS.write(ZERO_FIVE);
    }

    public long getLength() {
        return this.outputBytes;
    }

    public void output()
            throws IOException {
        this.outputBytes += 134L;
        this.mOS.write(UUID_FIELD_TYPE);
        this.mOS.write(UUID_FIELD_SIZE);
        this.mOS.write(Types.UUIDtoBytes(this.mPE.getUUID()));
        this.mOS.write(GROUPID_FIELD_TYPE);
        this.mOS.write(LONG_FOUR);
        this.mOS.write(LEDataOutputStream.writeIntBuf(this.mPE.groupId));
        this.mOS.write(IMAGEID_FIELD_TYPE);
        this.mOS.write(LONG_FOUR);
        this.mOS.write(LEDataOutputStream.writeIntBuf(this.mPE.icon.iconId));
        this.mOS.write(TITLE_FIELD_TYPE);
        int i = Types.writeCString(this.mPE.title, this.mOS);
        this.outputBytes += i;
        this.mOS.write(URL_FIELD_TYPE);
        i = Types.writeCString(this.mPE.url, this.mOS);
        this.outputBytes += i;
        this.mOS.write(USERNAME_FIELD_TYPE);
        i = Types.writeCString(this.mPE.username, this.mOS);
        this.outputBytes += i;
        byte[] arrayOfByte = this.mPE.getPasswordBytes();
        this.mOS.write(PASSWORD_FIELD_TYPE);
        this.mOS.write(LEDataOutputStream.writeIntBuf(arrayOfByte.length + 1));
        this.mOS.write(arrayOfByte);
        this.mOS.write(0);
        this.outputBytes += arrayOfByte.length + 1;
        this.mOS.write(ADDITIONAL_FIELD_TYPE);
        i = Types.writeCString(this.mPE.additional, this.mOS);
        this.outputBytes += i;
        writeDate(CREATE_FIELD_TYPE, this.mPE.tCreation.getCDate());
        writeDate(MOD_FIELD_TYPE, this.mPE.tLastMod.getCDate());
        writeDate(ACCESS_FIELD_TYPE, this.mPE.tLastAccess.getCDate());
        writeDate(EXPIRE_FIELD_TYPE, this.mPE.tExpire.getCDate());
        this.mOS.write(BINARY_DESC_FIELD_TYPE);
        i = Types.writeCString(this.mPE.binaryDesc, this.mOS);
        this.outputBytes += i;
        i = writeByteArray(this.mPE.getBinaryData());
        this.outputBytes += i;
        this.mOS.write(END_FIELD_TYPE);
        this.mOS.write(ZERO_FIELD_SIZE);
    }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/com/keepassdroid/database/save/PwEntryOutputV3.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */