package org.bouncycastle.asn1.util;

import org.bouncycastle.asn1.DEREncodable;
import org.bouncycastle.asn1.DERObject;

public class DERDump
  extends ASN1Dump
{
  public static String dumpAsString(DEREncodable paramDEREncodable)
  {
    StringBuffer localStringBuffer = new StringBuffer();
    _dumpAsString("", false, paramDEREncodable.getDERObject(), localStringBuffer);
    return localStringBuffer.toString();
  }
  
  public static String dumpAsString(DERObject paramDERObject)
  {
    StringBuffer localStringBuffer = new StringBuffer();
    _dumpAsString("", false, paramDERObject, localStringBuffer);
    return localStringBuffer.toString();
  }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/org/bouncycastle/asn1/util/DERDump.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */