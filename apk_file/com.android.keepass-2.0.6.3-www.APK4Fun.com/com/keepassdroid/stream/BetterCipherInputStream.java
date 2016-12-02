package com.keepassdroid.stream;

import java.io.FilterInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.security.GeneralSecurityException;

import javax.crypto.Cipher;
import javax.crypto.NullCipher;

public class BetterCipherInputStream
        extends FilterInputStream {
    private static final int I_DEFAULT_BUFFER_SIZE = 8192;
    private final Cipher cipher;
    private final byte[] i_buffer;
    private boolean finished;
    private int index;
    private byte[] o_buffer;

    protected BetterCipherInputStream(InputStream paramInputStream) {
        this(paramInputStream, new NullCipher());
    }

    public BetterCipherInputStream(InputStream paramInputStream, Cipher paramCipher) {
        this(paramInputStream, paramCipher, 8192);
    }

    public BetterCipherInputStream(InputStream paramInputStream, Cipher paramCipher, int paramInt) {
        super(paramInputStream);
        this.cipher = paramCipher;
        this.i_buffer = new byte[paramInt];
    }

    public int available()
            throws IOException {
        return 0;
    }

    public void close()
            throws IOException {
        this.in.close();
        try {
            this.cipher.doFinal();
            return;
        } catch (GeneralSecurityException localGeneralSecurityException) {
        }
    }

    public boolean markSupported() {
        return false;
    }

    public int read()
            throws IOException {
        byte[] arrayOfByte;
        int i;
        if (this.finished) {
            if ((this.o_buffer == null) || (this.index == this.o_buffer.length)) {
                return -1;
            }
            arrayOfByte = this.o_buffer;
            i = this.index;
            this.index = (i + 1);
            return arrayOfByte[i] & 0xFF;
        }
        if ((this.o_buffer != null) && (this.index < this.o_buffer.length)) {
            arrayOfByte = this.o_buffer;
            i = this.index;
            this.index = (i + 1);
            return arrayOfByte[i] & 0xFF;
        }
        this.index = 0;
        for (this.o_buffer = null; ; this.o_buffer = this.cipher.update(this.i_buffer, 0, i)) {
            if (this.o_buffer == null) {
                i = this.in.read(this.i_buffer);
                if (i != -1) {
                }
            } else {
                try {
                    this.o_buffer = this.cipher.doFinal();
                    this.finished = true;
                    return read();
                } catch (Exception localException) {
                    throw new IOException(localException.getMessage());
                }
            }
        }
    }

    public int read(byte[] paramArrayOfByte)
            throws IOException {
        return read(paramArrayOfByte, 0, paramArrayOfByte.length);
    }

    public int read(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
            throws IOException {
        if (this.in == null) {
            throw new NullPointerException("Underlying input stream is null");
        }
        int i = 0;
        for (; ; ) {
            int j = i;
            if (i < paramInt2) {
                j = read();
                if (j != -1) {
                    break label57;
                }
                j = i;
                if (i == 0) {
                    j = -1;
                }
            }
            return j;
            label57:
            if (paramArrayOfByte != null) {
                paramArrayOfByte[(paramInt1 + i)] = ((byte) j);
            }
            i += 1;
        }
    }

    public long skip(long paramLong)
            throws IOException {
        long l3 = 0L;
        int i = available();
        long l2 = l3;
        long l1 = paramLong;
        if (i < paramLong) {
            l1 = i;
        }
        for (l2 = l3; (l2 < l1) && (read() != -1); l2 += 1L) {
        }
        return l2;
    }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/com/keepassdroid/stream/BetterCipherInputStream.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */