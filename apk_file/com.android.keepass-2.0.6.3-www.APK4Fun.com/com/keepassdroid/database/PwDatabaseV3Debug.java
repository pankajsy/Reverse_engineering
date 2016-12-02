package com.keepassdroid.database;

public class PwDatabaseV3Debug
        extends PwDatabaseV3 {
    public PwDbHeaderV3 dbHeader;
    public byte[] postHeader;

    public void copyEncrypted(byte[] paramArrayOfByte, int paramInt1, int paramInt2) {
        this.postHeader = new byte[paramInt2];
        System.arraycopy(paramArrayOfByte, paramInt1, this.postHeader, 0, paramInt2);
    }

    public void copyHeader(PwDbHeaderV3 paramPwDbHeaderV3) {
        this.dbHeader = paramPwDbHeaderV3;
    }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/com/keepassdroid/database/PwDatabaseV3Debug.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */