package com.keepassdroid.database;

import com.keepassdroid.stream.LEDataInputStream;

import java.io.IOException;

public class PwDbHeaderV3
        extends PwDbHeader {
    public static final int BUF_SIZE = 124;
    public static final int DBSIG_2 = -1253311643;
    public static final int DBVER_DW = 196611;
    public static final int FLAG_ARCFOUR = 4;
    public static final int FLAG_RIJNDAEL = 2;
    public static final int FLAG_SHA2 = 1;
    public static final int FLAG_TWOFISH = 8;
    public byte[] contentsHash = new byte[32];
    public int flags;
    public int numEntries;
    public int numGroups;
    public int numKeyEncRounds;
    public int signature1;
    public int signature2;
    public int version;

    public PwDbHeaderV3() {
        this.masterSeed = new byte[16];
    }

    public static boolean compatibleHeaders(int paramInt1, int paramInt2) {
        return (paramInt1 & 0xFF00) == (paramInt2 & 0xFF00);
    }

    public static boolean matchesHeader(int paramInt1, int paramInt2) {
        return (paramInt1 == -1700603645) && (paramInt2 == -1253311643);
    }

    public void loadFromFile(byte[] paramArrayOfByte, int paramInt)
            throws IOException {
        this.signature1 = LEDataInputStream.readInt(paramArrayOfByte, paramInt + 0);
        this.signature2 = LEDataInputStream.readInt(paramArrayOfByte, paramInt + 4);
        this.flags = LEDataInputStream.readInt(paramArrayOfByte, paramInt + 8);
        this.version = LEDataInputStream.readInt(paramArrayOfByte, paramInt + 12);
        System.arraycopy(paramArrayOfByte, paramInt + 16, this.masterSeed, 0, 16);
        System.arraycopy(paramArrayOfByte, paramInt + 32, this.encryptionIV, 0, 16);
        this.numGroups = LEDataInputStream.readInt(paramArrayOfByte, paramInt + 48);
        this.numEntries = LEDataInputStream.readInt(paramArrayOfByte, paramInt + 52);
        System.arraycopy(paramArrayOfByte, paramInt + 56, this.contentsHash, 0, 32);
        System.arraycopy(paramArrayOfByte, paramInt + 88, this.transformSeed, 0, 32);
        this.numKeyEncRounds = LEDataInputStream.readInt(paramArrayOfByte, paramInt + 120);
        if (this.numKeyEncRounds < 0) {
            throw new IOException("Does not support more than 2147483647 rounds.");
        }
    }

    public boolean matchesVersion() {
        return compatibleHeaders(this.version, 196611);
    }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/com/keepassdroid/database/PwDbHeaderV3.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */