package com.keepassdroid.database.security;

import java.util.Arrays;

public class ProtectedBinary {
    public static final ProtectedBinary EMPTY = new ProtectedBinary();
    private byte[] data;
    private boolean protect;

    public ProtectedBinary() {
        this(false, new byte[0]);
    }

    public ProtectedBinary(boolean paramBoolean, byte[] paramArrayOfByte) {
        this.protect = paramBoolean;
        this.data = paramArrayOfByte;
    }

    public boolean equals(ProtectedBinary paramProtectedBinary) {
        return (this.protect == paramProtectedBinary.protect) && (Arrays.equals(this.data, paramProtectedBinary.data));
    }

    public byte[] getData() {
        return this.data;
    }

    public boolean isProtected() {
        return this.protect;
    }

    public int length() {
        if (this.data == null) {
            return 0;
        }
        return this.data.length;
    }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/com/keepassdroid/database/security/ProtectedBinary.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */