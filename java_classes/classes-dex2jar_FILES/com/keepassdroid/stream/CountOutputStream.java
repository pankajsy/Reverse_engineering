package com.keepassdroid.stream;

import java.io.IOException;
import java.io.OutputStream;

public class CountOutputStream
  extends OutputStream
{
  long bytes = 0L;
  OutputStream os;
  
  public CountOutputStream(OutputStream paramOutputStream)
  {
    this.os = paramOutputStream;
  }
  
  public void close()
    throws IOException
  {
    this.os.close();
  }
  
  public void flush()
    throws IOException
  {
    this.os.flush();
  }
  
  public void write(int paramInt)
    throws IOException
  {
    this.bytes += 1L;
    this.os.write(paramInt);
  }
  
  public void write(byte[] paramArrayOfByte)
    throws IOException
  {
    this.bytes += paramArrayOfByte.length;
    this.os.write(paramArrayOfByte);
  }
  
  public void write(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
    throws IOException
  {
    this.bytes += paramInt2;
    this.os.write(paramArrayOfByte, paramInt1, paramInt2);
  }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/com/keepassdroid/stream/CountOutputStream.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */