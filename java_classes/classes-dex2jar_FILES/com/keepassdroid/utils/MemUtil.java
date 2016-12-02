package com.keepassdroid.utils;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.zip.GZIPInputStream;
import java.util.zip.GZIPOutputStream;

public class MemUtil
{
  public static byte[] compress(byte[] paramArrayOfByte)
    throws IOException
  {
    paramArrayOfByte = new ByteArrayInputStream(paramArrayOfByte);
    ByteArrayOutputStream localByteArrayOutputStream = new ByteArrayOutputStream();
    GZIPOutputStream localGZIPOutputStream = new GZIPOutputStream(localByteArrayOutputStream);
    Util.copyStream(paramArrayOfByte, localGZIPOutputStream);
    localGZIPOutputStream.close();
    return localByteArrayOutputStream.toByteArray();
  }
  
  public static byte[] decompress(byte[] paramArrayOfByte)
    throws IOException
  {
    paramArrayOfByte = new GZIPInputStream(new ByteArrayInputStream(paramArrayOfByte));
    ByteArrayOutputStream localByteArrayOutputStream = new ByteArrayOutputStream();
    Util.copyStream(paramArrayOfByte, localByteArrayOutputStream);
    return localByteArrayOutputStream.toByteArray();
  }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/com/keepassdroid/utils/MemUtil.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */