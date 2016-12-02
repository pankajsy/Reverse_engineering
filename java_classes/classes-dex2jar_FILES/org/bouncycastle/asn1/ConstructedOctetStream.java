package org.bouncycastle.asn1;

import java.io.IOException;
import java.io.InputStream;

class ConstructedOctetStream
  extends InputStream
{
  private InputStream _currentStream;
  private boolean _first = true;
  private final ASN1StreamParser _parser;
  
  ConstructedOctetStream(ASN1StreamParser paramASN1StreamParser)
  {
    this._parser = paramASN1StreamParser;
  }
  
  public int read()
    throws IOException
  {
    int i;
    ASN1OctetStringParser localASN1OctetStringParser;
    if (this._currentStream == null)
    {
      if (!this._first)
      {
        i = -1;
        return i;
      }
      localASN1OctetStringParser = (ASN1OctetStringParser)this._parser.readObject();
      if (localASN1OctetStringParser == null) {
        return -1;
      }
      this._first = false;
    }
    for (this._currentStream = localASN1OctetStringParser.getOctetStream();; this._currentStream = localASN1OctetStringParser.getOctetStream())
    {
      int j = this._currentStream.read();
      i = j;
      if (j >= 0) {
        break;
      }
      localASN1OctetStringParser = (ASN1OctetStringParser)this._parser.readObject();
      if (localASN1OctetStringParser == null)
      {
        this._currentStream = null;
        return -1;
      }
    }
  }
  
  public int read(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
    throws IOException
  {
    ASN1OctetStringParser localASN1OctetStringParser;
    if (this._currentStream == null)
    {
      if (!this._first) {}
      do
      {
        return -1;
        localASN1OctetStringParser = (ASN1OctetStringParser)this._parser.readObject();
      } while (localASN1OctetStringParser == null);
      this._first = false;
      this._currentStream = localASN1OctetStringParser.getOctetStream();
    }
    int i = 0;
    for (;;)
    {
      int j = this._currentStream.read(paramArrayOfByte, paramInt1 + i, paramInt2 - i);
      if (j >= 0)
      {
        j = i + j;
        i = j;
        if (j == paramInt2) {
          return j;
        }
      }
      else
      {
        localASN1OctetStringParser = (ASN1OctetStringParser)this._parser.readObject();
        if (localASN1OctetStringParser == null)
        {
          this._currentStream = null;
          paramInt1 = i;
          if (i < 1) {
            paramInt1 = -1;
          }
          return paramInt1;
        }
        this._currentStream = localASN1OctetStringParser.getOctetStream();
      }
    }
  }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/org/bouncycastle/asn1/ConstructedOctetStream.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */