package org.bouncycastle.asn1;

import java.io.InputStream;

public class ASN1ObjectParser
{
  ASN1StreamParser _aIn;
  
  protected ASN1ObjectParser(int paramInt1, int paramInt2, InputStream paramInputStream)
  {
    this._aIn = new ASN1StreamParser(paramInputStream);
  }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/org/bouncycastle/asn1/ASN1ObjectParser.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */