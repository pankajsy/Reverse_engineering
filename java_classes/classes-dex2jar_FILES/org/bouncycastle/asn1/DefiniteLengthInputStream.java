package org.bouncycastle.asn1;

import java.io.EOFException;
import java.io.IOException;
import java.io.InputStream;
import org.bouncycastle.util.io.Streams;

class DefiniteLengthInputStream
  extends LimitedInputStream
{
  private static final byte[] EMPTY_BYTES = new byte[0];
  private final int _originalLength;
  private int _remaining;
  
  DefiniteLengthInputStream(InputStream paramInputStream, int paramInt)
  {
    super(paramInputStream);
    if (paramInt < 0) {
      throw new IllegalArgumentException("negative lengths not allowed");
    }
    this._originalLength = paramInt;
    this._remaining = paramInt;
    if (paramInt == 0) {
      setParentEofDetect(true);
    }
  }
  
  int getRemaining()
  {
    return this._remaining;
  }
  
  public int read()
    throws IOException
  {
    int i;
    if (this._remaining == 0) {
      i = -1;
    }
    int j;
    int k;
    do
    {
      return i;
      j = this._in.read();
      if (j < 0) {
        throw new EOFException("DEF length " + this._originalLength + " object truncated by " + this._remaining);
      }
      k = this._remaining - 1;
      this._remaining = k;
      i = j;
    } while (k != 0);
    setParentEofDetect(true);
    return j;
  }
  
  public int read(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
    throws IOException
  {
    if (this._remaining == 0) {
      paramInt1 = -1;
    }
    int i;
    do
    {
      return paramInt1;
      paramInt2 = Math.min(paramInt2, this._remaining);
      paramInt2 = this._in.read(paramArrayOfByte, paramInt1, paramInt2);
      if (paramInt2 < 0) {
        throw new EOFException("DEF length " + this._originalLength + " object truncated by " + this._remaining);
      }
      i = this._remaining - paramInt2;
      this._remaining = i;
      paramInt1 = paramInt2;
    } while (i != 0);
    setParentEofDetect(true);
    return paramInt2;
  }
  
  byte[] toByteArray()
    throws IOException
  {
    if (this._remaining == 0) {
      return EMPTY_BYTES;
    }
    byte[] arrayOfByte = new byte[this._remaining];
    int i = this._remaining - Streams.readFully(this._in, arrayOfByte);
    this._remaining = i;
    if (i != 0) {
      throw new EOFException("DEF length " + this._originalLength + " object truncated by " + this._remaining);
    }
    setParentEofDetect(true);
    return arrayOfByte;
  }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/org/bouncycastle/asn1/DefiniteLengthInputStream.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */