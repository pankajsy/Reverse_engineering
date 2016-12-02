package com.keepassdroid.stream;

import java.io.IOException;
import java.io.OutputStream;

public class NullOutputStream
  extends OutputStream
{
  public void close()
    throws IOException
  {
    super.close();
  }
  
  public void flush()
    throws IOException
  {
    super.flush();
  }
  
  public void write(int paramInt)
    throws IOException
  {}
  
  public void write(byte[] paramArrayOfByte)
    throws IOException
  {
    super.write(paramArrayOfByte);
  }
  
  public void write(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
    throws IOException
  {
    super.write(paramArrayOfByte, paramInt1, paramInt2);
  }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/com/keepassdroid/stream/NullOutputStream.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */