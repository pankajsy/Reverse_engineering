package org.bouncycastle.asn1;

import java.io.IOException;

public class DERExternalParser
  implements DEREncodable
{
  private ASN1StreamParser _parser;
  
  public DERExternalParser(ASN1StreamParser paramASN1StreamParser)
  {
    this._parser = paramASN1StreamParser;
  }
  
  public DERObject getDERObject()
  {
    try
    {
      DERExternal localDERExternal = new DERExternal(this._parser.readVector());
      return localDERExternal;
    }
    catch (IOException localIOException)
    {
      throw new ASN1ParsingException("unable to get DER object", localIOException);
    }
    catch (IllegalArgumentException localIllegalArgumentException)
    {
      throw new ASN1ParsingException("unable to get DER object", localIllegalArgumentException);
    }
  }
  
  public DEREncodable readObject()
    throws IOException
  {
    return this._parser.readObject();
  }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/org/bouncycastle/asn1/DERExternalParser.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */