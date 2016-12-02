package com.keepassdroid.stream;

import java.io.IOException;
import java.io.InputStream;

public class LEDataInputStream
  extends InputStream
{
  public static final long INT_TO_LONG_MASK = 4294967295L;
  private InputStream baseStream;
  
  public LEDataInputStream(InputStream paramInputStream)
  {
    this.baseStream = paramInputStream;
  }
  
  public static int readInt(InputStream paramInputStream)
    throws IOException
  {
    byte[] arrayOfByte = new byte[4];
    paramInputStream.read(arrayOfByte, 0, 4);
    return readInt(arrayOfByte, 0);
  }
  
  public static int readInt(byte[] paramArrayOfByte, int paramInt)
  {
    return (paramArrayOfByte[(paramInt + 0)] & 0xFF) + ((paramArrayOfByte[(paramInt + 1)] & 0xFF) << 8) + ((paramArrayOfByte[(paramInt + 2)] & 0xFF) << 16) + ((paramArrayOfByte[(paramInt + 3)] & 0xFF) << 24);
  }
  
  public static long readLong(byte[] paramArrayOfByte, int paramInt)
  {
    return (paramArrayOfByte[(paramInt + 0)] & 0xFF) + ((paramArrayOfByte[(paramInt + 1)] & 0xFF) << 8) + ((paramArrayOfByte[(paramInt + 2)] & 0xFF) << 16) + ((paramArrayOfByte[(paramInt + 3)] & 0xFF) << 24) + ((paramArrayOfByte[(paramInt + 4)] & 0xFF) << 32) + ((paramArrayOfByte[(paramInt + 5)] & 0xFF) << 40) + ((paramArrayOfByte[(paramInt + 6)] & 0xFF) << 48) + ((paramArrayOfByte[(paramInt + 7)] & 0xFF) << 56);
  }
  
  public static long readUInt(InputStream paramInputStream)
    throws IOException
  {
    return readInt(paramInputStream) & 0xFFFFFFFF;
  }
  
  public static long readUInt(byte[] paramArrayOfByte, int paramInt)
  {
    return readInt(paramArrayOfByte, paramInt) & 0xFFFFFFFF;
  }
  
  public static int readUShort(InputStream paramInputStream)
    throws IOException
  {
    byte[] arrayOfByte = new byte[2];
    paramInputStream.read(arrayOfByte, 0, 2);
    return readUShort(arrayOfByte, 0);
  }
  
  public static int readUShort(byte[] paramArrayOfByte, int paramInt)
  {
    return (paramArrayOfByte[(paramInt + 0)] & 0xFF) + ((paramArrayOfByte[(paramInt + 1)] & 0xFF) << 8);
  }
  
  public int available()
    throws IOException
  {
    return this.baseStream.available();
  }
  
  public void close()
    throws IOException
  {
    this.baseStream.close();
  }
  
  public void mark(int paramInt)
  {
    this.baseStream.mark(paramInt);
  }
  
  public boolean markSupported()
  {
    return this.baseStream.markSupported();
  }
  
  public int read()
    throws IOException
  {
    return this.baseStream.read();
  }
  
  public int read(byte[] paramArrayOfByte)
    throws IOException
  {
    return super.read(paramArrayOfByte);
  }
  
  public int read(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
    throws IOException
  {
    return this.baseStream.read(paramArrayOfByte, paramInt1, paramInt2);
  }
  
  public byte[] readBytes(int paramInt)
    throws IOException
  {
    byte[] arrayOfByte1 = new byte[paramInt];
    int i = 0;
    while (i < paramInt)
    {
      int j = read(arrayOfByte1, i, paramInt - i);
      if (j == -1)
      {
        byte[] arrayOfByte2 = new byte[i];
        System.arraycopy(arrayOfByte1, 0, arrayOfByte2, 0, i);
        return arrayOfByte2;
      }
      i += j;
    }
    return arrayOfByte1;
  }
  
  public int readInt()
    throws IOException
  {
    return readInt(this.baseStream);
  }
  
  public long readLong()
    throws IOException
  {
    return readLong(readBytes(8), 0);
  }
  
  public long readUInt()
    throws IOException
  {
    return readUInt(this.baseStream);
  }
  
  public int readUShort()
    throws IOException
  {
    return readUShort(this.baseStream);
  }
  
  public void reset()
    throws IOException
  {
    try
    {
      this.baseStream.reset();
      return;
    }
    finally
    {
      localObject = finally;
      throw ((Throwable)localObject);
    }
  }
  
  public long skip(long paramLong)
    throws IOException
  {
    return this.baseStream.skip(paramLong);
  }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/com/keepassdroid/stream/LEDataInputStream.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */