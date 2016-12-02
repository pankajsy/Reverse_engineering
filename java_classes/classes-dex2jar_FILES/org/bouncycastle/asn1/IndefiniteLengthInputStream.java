package org.bouncycastle.asn1;

import java.io.EOFException;
import java.io.IOException;
import java.io.InputStream;

class IndefiniteLengthInputStream
  extends LimitedInputStream
{
  private int _b1;
  private int _b2;
  private boolean _eofOn00 = true;
  private boolean _eofReached = false;
  
  IndefiniteLengthInputStream(InputStream paramInputStream)
    throws IOException
  {
    super(paramInputStream);
    this._b1 = paramInputStream.read();
    this._b2 = paramInputStream.read();
    if (this._b2 < 0) {
      throw new EOFException();
    }
    checkForEof();
  }
  
  private boolean checkForEof()
  {
    if ((!this._eofReached) && (this._eofOn00) && (this._b1 == 0) && (this._b2 == 0))
    {
      this._eofReached = true;
      setParentEofDetect(true);
    }
    return this._eofReached;
  }
  
  public int read()
    throws IOException
  {
    if (checkForEof()) {
      return -1;
    }
    int i = this._in.read();
    if (i < 0) {
      throw new EOFException();
    }
    int j = this._b1;
    this._b1 = this._b2;
    this._b2 = i;
    return j;
  }
  
  public int read(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
    throws IOException
  {
    if ((this._eofOn00) || (paramInt2 < 3)) {
      return super.read(paramArrayOfByte, paramInt1, paramInt2);
    }
    if (this._eofReached) {
      return -1;
    }
    paramInt2 = this._in.read(paramArrayOfByte, paramInt1 + 2, paramInt2 - 2);
    if (paramInt2 < 0) {
      throw new EOFException();
    }
    paramArrayOfByte[paramInt1] = ((byte)this._b1);
    paramArrayOfByte[(paramInt1 + 1)] = ((byte)this._b2);
    this._b1 = this._in.read();
    this._b2 = this._in.read();
    if (this._b2 < 0) {
      throw new EOFException();
    }
    return paramInt2 + 2;
  }
  
  void setEofOn00(boolean paramBoolean)
  {
    this._eofOn00 = paramBoolean;
    checkForEof();
  }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/org/bouncycastle/asn1/IndefiniteLengthInputStream.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */