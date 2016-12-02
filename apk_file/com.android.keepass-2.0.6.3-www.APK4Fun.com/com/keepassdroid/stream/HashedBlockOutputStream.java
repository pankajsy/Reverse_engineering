package com.keepassdroid.stream;

import java.io.IOException;
import java.io.OutputStream;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class HashedBlockOutputStream
        extends OutputStream {
    private static final int DEFAULT_BUFFER_SIZE = 1048576;
    private LEDataOutputStream baseStream;
    private byte[] buffer;
    private long bufferIndex = 0L;
    private int bufferPos = 0;

    public HashedBlockOutputStream(OutputStream paramOutputStream) {
        init(paramOutputStream, 1048576);
    }

    public HashedBlockOutputStream(OutputStream paramOutputStream, int paramInt) {
        int i = paramInt;
        if (paramInt <= 0) {
            i = 1048576;
        }
        init(paramOutputStream, i);
    }

    private void WriteHashedBlock()
            throws IOException {
        this.baseStream.writeUInt(this.bufferIndex);
        this.bufferIndex += 1L;
        if (this.bufferPos > 0) {
        }
        for (; ; ) {
            try {
                Object localObject = MessageDigest.getInstance("SHA-256");
                ((MessageDigest) localObject).update(this.buffer, 0, this.bufferPos);
                localObject = ((MessageDigest) localObject).digest();
                this.baseStream.write((byte[]) localObject);
                this.baseStream.writeInt(this.bufferPos);
                if (this.bufferPos > 0) {
                    this.baseStream.write(this.buffer, 0, this.bufferPos);
                }
                this.bufferPos = 0;
                return;
            } catch (NoSuchAlgorithmException localNoSuchAlgorithmException) {
                throw new IOException("SHA-256 not implemented here.");
            }
            this.baseStream.writeLong(0L);
            this.baseStream.writeLong(0L);
            this.baseStream.writeLong(0L);
            this.baseStream.writeLong(0L);
        }
    }

    private void init(OutputStream paramOutputStream, int paramInt) {
        this.baseStream = new LEDataOutputStream(paramOutputStream);
        this.buffer = new byte[paramInt];
    }

    public void close()
            throws IOException {
        if (this.bufferPos != 0) {
            WriteHashedBlock();
        }
        WriteHashedBlock();
        flush();
        this.baseStream.close();
    }

    public void flush()
            throws IOException {
        this.baseStream.flush();
    }

    public void write(int paramInt)
            throws IOException {
        write(new byte[]{(byte) paramInt}, 0, 1);
    }

    public void write(byte[] paramArrayOfByte)
            throws IOException {
        write(paramArrayOfByte, 0, paramArrayOfByte.length);
    }

    public void write(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
            throws IOException {
        while (paramInt2 > 0) {
            if (this.bufferPos == this.buffer.length) {
                WriteHashedBlock();
            }
            int i = Math.min(this.buffer.length - this.bufferPos, paramInt2);
            System.arraycopy(paramArrayOfByte, paramInt1, this.buffer, this.bufferPos, i);
            paramInt1 += i;
            this.bufferPos += i;
            paramInt2 -= i;
        }
    }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/com/keepassdroid/stream/HashedBlockOutputStream.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */