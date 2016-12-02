package com.keepassdroid.database;

public class SearchParametersFactory {
    public static SearchParameters getInstance(PwDatabase paramPwDatabase) {
        if ((paramPwDatabase instanceof PwDatabase)) {
            return new SearchParametersV4();
        }
        return new SearchParameters();
    }

    public static SearchParameters getInstance(PwGroup paramPwGroup) {
        if ((paramPwGroup instanceof PwGroupV4)) {
            return new SearchParametersV4();
        }
        return new SearchParameters();
    }

    public static SearchParameters getNone(PwDatabase paramPwDatabase) {
        paramPwDatabase = getInstance(paramPwDatabase);
        paramPwDatabase.setupNone();
        return paramPwDatabase;
    }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/com/keepassdroid/database/SearchParametersFactory.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */