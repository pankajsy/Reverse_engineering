package org.bouncycastle.asn1;

import java.io.IOException;

public class BERSequenceParser
  implements ASN1SequenceParser
{
  private ASN1StreamParser _parser;
  
  BERSequenceParser(ASN1StreamParser paramASN1StreamParser)
  {
    this._parser = paramASN1StreamParser;
  }
  
  public DERObject getDERObject()
  {
    try
    {
      BERSequence localBERSequence = new BERSequence(this._parser.readVector());
      return localBERSequence;
    }
    catch (IOException localIOException)
    {
      throw new IllegalStateException(localIOException.getMessage());
    }
  }
  
  public DEREncodable readObject()
    throws IOException
  {
    return this._parser.readObject();
  }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/org/bouncycastle/asn1/BERSequenceParser.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */