package com.keepassdroid.database;

public abstract class PwDbHeader
{
  public static final int PWM_DBSIG_1 = -1700603645;
  public byte[] encryptionIV = new byte[16];
  public byte[] masterSeed;
  public byte[] transformSeed = new byte[32];
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/com/keepassdroid/database/PwDbHeader.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */