package com.keepassdroid.stream;

import java.io.IOException;
import java.io.OutputStream;

public class LEDataOutputStream
        extends OutputStream {
    private OutputStream baseStream;

    public LEDataOutputStream(OutputStream paramOutputStream) {
        this.baseStream = paramOutputStream;
    }

    public static void writeInt(int paramInt1, byte[] paramArrayOfByte, int paramInt2) {
        paramArrayOfByte[(paramInt2 + 0)] = ((byte) (paramInt1 & 0xFF));
        paramArrayOfByte[(paramInt2 + 1)] = ((byte) (paramInt1 >>> 8 & 0xFF));
        paramArrayOfByte[(paramInt2 + 2)] = ((byte) (paramInt1 >>> 16 & 0xFF));
        paramArrayOfByte[(paramInt2 + 3)] = ((byte) (paramInt1 >>> 24 & 0xFF));
    }

    public static byte[] writeIntBuf(int paramInt) {
        byte[] arrayOfByte = new byte[4];
        writeInt(paramInt, arrayOfByte, 0);
        return arrayOfByte;
    }

    public static void writeLong(long paramLong, byte[] paramArrayOfByte, int paramInt) {
        paramArrayOfByte[(paramInt + 0)] = ((byte) (int) (paramLong & 0xFF));
        paramArrayOfByte[(paramInt + 1)] = ((byte) (int) (paramLong >>> 8 & 0xFF));
        paramArrayOfByte[(paramInt + 2)] = ((byte) (int) (paramLong >>> 16 & 0xFF));
        paramArrayOfByte[(paramInt + 3)] = ((byte) (int) (paramLong >>> 24 & 0xFF));
        paramArrayOfByte[(paramInt + 4)] = ((byte) (int) (paramLong >>> 32 & 0xFF));
        paramArrayOfByte[(paramInt + 5)] = ((byte) (int) (paramLong >>> 40 & 0xFF));
        paramArrayOfByte[(paramInt + 6)] = ((byte) (int) (paramLong >>> 48 & 0xFF));
        paramArrayOfByte[(paramInt + 7)] = ((byte) (int) (paramLong >>> 56 & 0xFF));
    }

    public static byte[] writeLongBuf(long paramLong) {
        byte[] arrayOfByte = new byte[8];
        writeLong(paramLong, arrayOfByte, 0);
        return arrayOfByte;
    }

    public static void writeUShort(int paramInt1, byte[] paramArrayOfByte, int paramInt2) {
        paramArrayOfByte[(paramInt2 + 0)] = ((byte) (paramInt1 & 0xFF));
        paramArrayOfByte[(paramInt2 + 1)] = ((byte) ((0xFF00 & paramInt1) >> 8));
    }

    public static byte[] writeUShortBuf(int paramInt) {
        byte[] arrayOfByte = new byte[2];
        writeUShort(paramInt, arrayOfByte, 0);
        return arrayOfByte;
    }

    public void close()
            throws IOException {
        this.baseStream.close();
    }

    public void flush()
            throws IOException {
        this.baseStream.flush();
    }

    public void write(int paramInt)
            throws IOException {
        this.baseStream.write(paramInt);
    }

    public void write(byte[] paramArrayOfByte)
            throws IOException {
        this.baseStream.write(paramArrayOfByte);
    }

    public void write(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
            throws IOException {
        this.baseStream.write(paramArrayOfByte, paramInt1, paramInt2);
    }

    public void writeInt(int paramInt)
            throws IOException {
        byte[] arrayOfByte = new byte[4];
        writeInt(paramInt, arrayOfByte, 0);
        this.baseStream.write(arrayOfByte);
    }

    public void writeLong(long paramLong)
            throws IOException {
        byte[] arrayOfByte = new byte[8];
        writeLong(paramLong, arrayOfByte, 0);
        this.baseStream.write(arrayOfByte);
    }

    public void writeUInt(long paramLong)
            throws IOException {
        this.baseStream.write(writeIntBuf((int) paramLong));
    }

    public void writeUShort(int paramInt)
            throws IOException {
        byte[] arrayOfByte = new byte[2];
        writeUShort(paramInt, arrayOfByte, 0);
        this.baseStream.write(arrayOfByte);
    }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/com/keepassdroid/stream/LEDataOutputStream.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */