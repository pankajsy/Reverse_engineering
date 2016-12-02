package com.keepassdroid.database;

public class PwDbHeaderFactory {
    public static PwDbHeader getInstance(PwDatabase paramPwDatabase) {
        if ((paramPwDatabase instanceof PwDatabaseV3)) {
            return new PwDbHeaderV3();
        }
        if ((paramPwDatabase instanceof PwDatabaseV4)) {
            return new PwDbHeaderV4((PwDatabaseV4) paramPwDatabase);
        }
        throw new RuntimeException("Not implemented.");
    }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/com/keepassdroid/database/PwDbHeaderFactory.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */