package org.bouncycastle.asn1;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

public class BERGenerator
  extends ASN1Generator
{
  private boolean _isExplicit;
  private int _tagNo;
  private boolean _tagged = false;
  
  protected BERGenerator(OutputStream paramOutputStream)
  {
    super(paramOutputStream);
  }
  
  public BERGenerator(OutputStream paramOutputStream, int paramInt, boolean paramBoolean)
  {
    super(paramOutputStream);
    this._tagged = true;
    this._isExplicit = paramBoolean;
    this._tagNo = paramInt;
  }
  
  private void writeHdr(int paramInt)
    throws IOException
  {
    this._out.write(paramInt);
    this._out.write(128);
  }
  
  public OutputStream getRawOutputStream()
  {
    return this._out;
  }
  
  protected void writeBERBody(InputStream paramInputStream)
    throws IOException
  {
    for (;;)
    {
      int i = paramInputStream.read();
      if (i < 0) {
        break;
      }
      this._out.write(i);
    }
  }
  
  protected void writeBEREnd()
    throws IOException
  {
    this._out.write(0);
    this._out.write(0);
    if ((this._tagged) && (this._isExplicit))
    {
      this._out.write(0);
      this._out.write(0);
    }
  }
  
  protected void writeBERHeader(int paramInt)
    throws IOException
  {
    if (this._tagged)
    {
      int i = this._tagNo | 0x80;
      if (this._isExplicit)
      {
        writeHdr(i | 0x20);
        writeHdr(paramInt);
        return;
      }
      if ((paramInt & 0x20) != 0)
      {
        writeHdr(i | 0x20);
        return;
      }
      writeHdr(i);
      return;
    }
    writeHdr(paramInt);
  }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/org/bouncycastle/asn1/BERGenerator.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */