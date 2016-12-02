package com.keepassdroid.stream;

import java.io.IOException;
import java.io.OutputStream;
import java.io.RandomAccessFile;

public class RandomFileOutputStream
  extends OutputStream
{
  RandomAccessFile mFile;
  
  RandomFileOutputStream(RandomAccessFile paramRandomAccessFile)
  {
    this.mFile = paramRandomAccessFile;
  }
  
  public void close()
    throws IOException
  {
    super.close();
    this.mFile.close();
  }
  
  public void seek(long paramLong)
    throws IOException
  {
    this.mFile.seek(paramLong);
  }
  
  public void write(int paramInt)
    throws IOException
  {
    this.mFile.write(paramInt);
  }
  
  public void write(byte[] paramArrayOfByte)
    throws IOException
  {
    super.write(paramArrayOfByte);
    this.mFile.write(paramArrayOfByte);
  }
  
  public void write(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
    throws IOException
  {
    super.write(paramArrayOfByte, paramInt1, paramInt2);
    this.mFile.write(paramArrayOfByte, paramInt1, paramInt2);
  }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/com/keepassdroid/stream/RandomFileOutputStream.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */