package org.bouncycastle.asn1;

import java.io.IOException;

public class BERApplicationSpecificParser
  implements ASN1ApplicationSpecificParser
{
  private final ASN1StreamParser parser;
  private final int tag;
  
  BERApplicationSpecificParser(int paramInt, ASN1StreamParser paramASN1StreamParser)
  {
    this.tag = paramInt;
    this.parser = paramASN1StreamParser;
  }
  
  public DERObject getDERObject()
  {
    try
    {
      BERApplicationSpecific localBERApplicationSpecific = new BERApplicationSpecific(this.tag, this.parser.readVector());
      return localBERApplicationSpecific;
    }
    catch (IOException localIOException)
    {
      throw new ASN1ParsingException(localIOException.getMessage(), localIOException);
    }
  }
  
  public DEREncodable readObject()
    throws IOException
  {
    return this.parser.readObject();
  }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/org/bouncycastle/asn1/BERApplicationSpecificParser.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */