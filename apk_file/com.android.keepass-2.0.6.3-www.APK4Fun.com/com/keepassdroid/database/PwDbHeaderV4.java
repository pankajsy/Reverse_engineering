package com.keepassdroid.database;

import com.keepassdroid.database.exception.InvalidDBVersionException;
import com.keepassdroid.stream.LEDataInputStream;
import com.keepassdroid.utils.Types;

import java.io.IOException;
import java.io.InputStream;
import java.security.DigestInputStream;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class PwDbHeaderV4
        extends PwDbHeader {
    public static final int DBSIG_2 = -1253311641;
    public static final int DBSIG_PRE2 = -1253311642;
    public static final int FILE_VERSION_32 = 196609;
    private static final int FILE_VERSION_CRITICAL_MASK = -65536;
    public CrsAlgorithm innerRandomStream;
    public byte[] protectedStreamKey = new byte[32];
    public byte[] streamStartBytes = new byte[32];
    private PwDatabaseV4 db;

    public PwDbHeaderV4(PwDatabaseV4 paramPwDatabaseV4) {
        this.db = paramPwDatabaseV4;
        this.masterSeed = new byte[32];
    }

    public static boolean matchesHeader(int paramInt1, int paramInt2) {
        return (paramInt1 == -1700603645) && ((paramInt2 == -1253311641) || (paramInt2 == -1253311641));
    }

    private boolean readHeaderField(LEDataInputStream paramLEDataInputStream)
            throws IOException {
        int i = (byte) paramLEDataInputStream.read();
        int j = paramLEDataInputStream.readUShort();
        Object localObject = null;
        if (j > 0) {
            byte[] arrayOfByte = new byte[j];
            localObject = arrayOfByte;
            if (paramLEDataInputStream.read(arrayOfByte) != j) {
                throw new IOException("Header ended early.");
            }
        }
        switch (i) {
            case 1:
            default:
                throw new IOException("Invalid header type.");
            case 0:
                return true;
            case 2:
                setCipher((byte[]) localObject);
        }
        for (; ; ) {
            return false;
            setCompressionFlags((byte[]) localObject);
            continue;
            this.masterSeed = ((byte[]) localObject);
            continue;
            this.transformSeed = ((byte[]) localObject);
            continue;
            setTransformRounds((byte[]) localObject);
            continue;
            this.encryptionIV = ((byte[]) localObject);
            continue;
            this.protectedStreamKey = ((byte[]) localObject);
            continue;
            this.streamStartBytes = ((byte[]) localObject);
            continue;
            setRandomStreamID((byte[]) localObject);
        }
    }

    private void setCipher(byte[] paramArrayOfByte)
            throws IOException {
        if ((paramArrayOfByte == null) || (paramArrayOfByte.length != 16)) {
            throw new IOException("Invalid cipher ID.");
        }
        this.db.dataCipher = Types.bytestoUUID(paramArrayOfByte);
    }

    private void setCompressionFlags(byte[] paramArrayOfByte)
            throws IOException {
        if ((paramArrayOfByte == null) || (paramArrayOfByte.length != 4)) {
            throw new IOException("Invalid compression flags.");
        }
        int i = LEDataInputStream.readInt(paramArrayOfByte, 0);
        if ((i < 0) || (i >= 2)) {
            throw new IOException("Unrecognized compression flag.");
        }
        this.db.compressionAlgorithm = PwCompressionAlgorithm.fromId(i);
    }

    private void setRandomStreamID(byte[] paramArrayOfByte)
            throws IOException {
        if ((paramArrayOfByte == null) || (paramArrayOfByte.length != 4)) {
            throw new IOException("Invalid stream id.");
        }
        int i = LEDataInputStream.readInt(paramArrayOfByte, 0);
        if ((i < 0) || (i >= 3)) {
            throw new IOException("Invalid stream id.");
        }
        this.innerRandomStream = CrsAlgorithm.fromId(i);
    }

    private void setTransformRounds(byte[] paramArrayOfByte)
            throws IOException {
        if ((paramArrayOfByte == null) || (paramArrayOfByte.length != 8)) {
            throw new IOException("Invalid rounds.");
        }
        long l = LEDataInputStream.readLong(paramArrayOfByte, 0);
        if ((l < 0L) || (l > 2147483647L)) {
            throw new IOException("Rounds higher than 2147483647 are not currently supported.");
        }
        this.db.numKeyEncRounds = l;
    }

    private boolean validVersion(long paramLong) {
        return (0xFFFFFFFFFFFF0000 & paramLong) <= 196608L;
    }

    public byte[] loadFromFile(InputStream paramInputStream)
            throws IOException, InvalidDBVersionException {
        MessageDigest localMessageDigest;
        try {
            localMessageDigest = MessageDigest.getInstance("SHA-256");
            paramInputStream = new LEDataInputStream(new DigestInputStream(paramInputStream, localMessageDigest));
            if (!matchesHeader(paramInputStream.readInt(), paramInputStream.readInt())) {
                throw new InvalidDBVersionException();
            }
        } catch (NoSuchAlgorithmException paramInputStream) {
            throw new IOException("No SHA-256 implementation");
        }
        if (!validVersion(paramInputStream.readUInt())) {
            throw new InvalidDBVersionException();
        }
        for (boolean bool = false; !bool; bool = readHeaderField(paramInputStream)) {
        }
        return localMessageDigest.digest();
    }

    public class PwDbHeaderV4Fields {
        public static final byte CipherID = 2;
        public static final byte Comment = 1;
        public static final byte CompressionFlags = 3;
        public static final byte EncryptionIV = 7;
        public static final byte EndOfHeader = 0;
        public static final byte InnerRandomStreamID = 10;
        public static final byte MasterSeed = 4;
        public static final byte ProtectedStreamKey = 8;
        public static final byte StreamStartBytes = 9;
        public static final byte TransformRounds = 6;
        public static final byte TransformSeed = 5;

        public PwDbHeaderV4Fields() {
        }
    }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/com/keepassdroid/database/PwDbHeaderV4.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */