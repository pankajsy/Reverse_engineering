package com.keepassdroid.stream;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

public class CopyInputStream
        extends InputStream {
    private InputStream is;
    private OutputStream os;

    public CopyInputStream(InputStream paramInputStream, OutputStream paramOutputStream) {
        this.is = paramInputStream;
        this.os = paramOutputStream;
    }

    public int available()
            throws IOException {
        return this.is.available();
    }

    public void close()
            throws IOException {
        this.is.close();
        this.os.close();
    }

    public void mark(int paramInt) {
        this.is.mark(paramInt);
    }

    public boolean markSupported() {
        return this.is.markSupported();
    }

    public int read()
            throws IOException {
        int i = this.is.read();
        if (i != -1) {
            this.os.write(i);
        }
        return i;
    }

    public int read(byte[] paramArrayOfByte)
            throws IOException {
        int i = this.is.read(paramArrayOfByte);
        if (i != -1) {
            this.os.write(paramArrayOfByte, 0, i);
        }
        return i;
    }

    public int read(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
            throws IOException {
        paramInt2 = this.is.read(paramArrayOfByte, paramInt1, paramInt2);
        if (paramInt2 != -1) {
            this.os.write(paramArrayOfByte, paramInt1, paramInt2);
        }
        return paramInt2;
    }

    public void reset()
            throws IOException {
        try {
            this.is.reset();
            return;
        } finally {
            localObject =finally;
            throw ((Throwable) localObject);
        }
    }

    public long skip(long paramLong)
            throws IOException {
        return this.is.skip(paramLong);
    }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/com/keepassdroid/stream/CopyInputStream.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */