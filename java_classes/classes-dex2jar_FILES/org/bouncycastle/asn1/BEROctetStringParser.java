package org.bouncycastle.asn1;

import java.io.IOException;
import java.io.InputStream;
import org.bouncycastle.util.io.Streams;

public class BEROctetStringParser
  implements ASN1OctetStringParser
{
  private ASN1StreamParser _parser;
  
  protected BEROctetStringParser(ASN1ObjectParser paramASN1ObjectParser)
  {
    this._parser = paramASN1ObjectParser._aIn;
  }
  
  BEROctetStringParser(ASN1StreamParser paramASN1StreamParser)
  {
    this._parser = paramASN1StreamParser;
  }
  
  public DERObject getDERObject()
  {
    try
    {
      BERConstructedOctetString localBERConstructedOctetString = new BERConstructedOctetString(Streams.readAll(getOctetStream()));
      return localBERConstructedOctetString;
    }
    catch (IOException localIOException)
    {
      throw new ASN1ParsingException("IOException converting stream to byte array: " + localIOException.getMessage(), localIOException);
    }
  }
  
  public InputStream getOctetStream()
  {
    return new ConstructedOctetStream(this._parser);
  }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/org/bouncycastle/asn1/BEROctetStringParser.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */