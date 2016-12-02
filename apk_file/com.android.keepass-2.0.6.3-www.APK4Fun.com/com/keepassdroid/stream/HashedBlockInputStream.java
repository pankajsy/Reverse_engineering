package com.keepassdroid.stream;

import com.keepassdroid.utils.Types;

import java.io.IOException;
import java.io.InputStream;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Arrays;

public class HashedBlockInputStream
        extends InputStream {
    private static final int HASH_SIZE = 32;
    private boolean atEnd = false;
    private LEDataInputStream baseStream;
    private byte[] buffer = new byte[0];
    private long bufferIndex = 0L;
    private int bufferPos = 0;

    public HashedBlockInputStream(InputStream paramInputStream) {
        this.baseStream = new LEDataInputStream(paramInputStream);
    }

    private boolean ReadHashedBlock()
            throws IOException {
        if (this.atEnd) {
            return false;
        }
        this.bufferPos = 0;
        if (this.baseStream.readUInt() != this.bufferIndex) {
            throw new IOException("Invalid data format");
        }
        this.bufferIndex += 1L;
        byte[] arrayOfByte = this.baseStream.readBytes(32);
        if ((arrayOfByte == null) || (arrayOfByte.length != 32)) {
            throw new IOException("Invalid data format");
        }
        int i = LEDataInputStream.readInt(this.baseStream);
        if (i < 0) {
            throw new IOException("Invalid data format");
        }
        if (i == 0) {
            i = 0;
            while (i < 32) {
                if (arrayOfByte[i] != 0) {
                    throw new IOException("Invalid data format");
                }
                i += 1;
            }
            this.atEnd = true;
            this.buffer = new byte[0];
            return false;
        }
        this.buffer = this.baseStream.readBytes(i);
        if ((this.buffer == null) || (this.buffer.length != i)) {
            throw new IOException("Invalid data format");
        }
        Object localObject;
        try {
            localObject = MessageDigest.getInstance("SHA-256");
            localObject = ((MessageDigest) localObject).digest(this.buffer);
            if ((localObject == null) || (localObject.length != 32)) {
                throw new IOException("Hash wrong size");
            }
        } catch (NoSuchAlgorithmException localNoSuchAlgorithmException) {
            throw new IOException("SHA-256 not implemented here.");
        }
        if (!Arrays.equals(localNoSuchAlgorithmException, (byte[]) localObject)) {
            throw new IOException("Hashes didn't match.");
        }
        return true;
    }

    public void close()
            throws IOException {
        this.baseStream.close();
    }

    public int read()
            throws IOException {
        if (this.atEnd) {
        }
        while ((this.bufferPos == this.buffer.length) && (!ReadHashedBlock())) {
            return -1;
        }
        int i = Types.readUByte(this.buffer, this.bufferPos);
        this.bufferPos += 1;
        return i;
    }

    public int read(byte[] paramArrayOfByte)
            throws IOException {
        return read(paramArrayOfByte, 0, paramArrayOfByte.length);
    }

    public int read(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
            throws IOException {
        if (this.atEnd) {
            j = -1;
            return j;
        }
        int j = paramInt2;
        int i = paramInt1;
        paramInt1 = j;
        for (; ; ) {
            j = paramInt2;
            if (paramInt1 <= 0) {
                break;
            }
            if ((this.bufferPos == this.buffer.length) && (!ReadHashedBlock())) {
                return paramInt2 - paramInt1;
            }
            j = Math.min(this.buffer.length - this.bufferPos, paramInt1);
            System.arraycopy(this.buffer, this.bufferPos, paramArrayOfByte, i, j);
            i += j;
            this.bufferPos += j;
            paramInt1 -= j;
        }
    }

    public long skip(long paramLong)
            throws IOException {
        return 0L;
    }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/com/keepassdroid/stream/HashedBlockInputStream.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */