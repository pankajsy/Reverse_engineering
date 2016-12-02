package org.bouncycastle.asn1;

import java.io.InputStream;

abstract class LimitedInputStream
  extends InputStream
{
  protected final InputStream _in;
  
  LimitedInputStream(InputStream paramInputStream)
  {
    this._in = paramInputStream;
  }
  
  protected void setParentEofDetect(boolean paramBoolean)
  {
    if ((this._in instanceof IndefiniteLengthInputStream)) {
      ((IndefiniteLengthInputStream)this._in).setEofOn00(paramBoolean);
    }
  }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/org/bouncycastle/asn1/LimitedInputStream.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */