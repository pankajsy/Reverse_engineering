package com.keepassdroid.stream;

import java.io.IOException;
import java.io.InputStream;

public class CountInputStream
        extends InputStream {
    long bytes = 0L;
    InputStream is;

    public CountInputStream(InputStream paramInputStream) {
        this.is = paramInputStream;
    }

    public int available()
            throws IOException {
        return this.is.available();
    }

    public void close()
            throws IOException {
        this.is.close();
    }

    public void mark(int paramInt) {
        this.is.mark(paramInt);
    }

    public boolean markSupported() {
        return this.is.markSupported();
    }

    public int read()
            throws IOException {
        this.bytes += 1L;
        return this.is.read();
    }

    public int read(byte[] paramArrayOfByte)
            throws IOException {
        this.bytes += paramArrayOfByte.length;
        return this.is.read(paramArrayOfByte);
    }

    public int read(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
            throws IOException {
        this.bytes += paramInt2;
        return this.is.read(paramArrayOfByte, paramInt1, paramInt2);
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
        this.bytes += paramLong;
        return this.is.skip(paramLong);
    }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/com/keepassdroid/stream/CountInputStream.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */