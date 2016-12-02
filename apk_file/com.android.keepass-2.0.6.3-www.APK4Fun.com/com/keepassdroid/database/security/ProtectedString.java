package com.keepassdroid.database.security;

public class ProtectedString {
    private boolean protect;
    private String string;

    public ProtectedString() {
        this(false, "");
    }

    public ProtectedString(boolean paramBoolean, String paramString) {
        this.protect = paramBoolean;
        this.string = paramString;
    }

    public boolean isProtected() {
        return this.protect;
    }

    public int length() {
        if (this.string == null) {
            return 0;
        }
        return this.string.length();
    }

    public String toString() {
        return this.string;
    }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/com/keepassdroid/database/security/ProtectedString.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */