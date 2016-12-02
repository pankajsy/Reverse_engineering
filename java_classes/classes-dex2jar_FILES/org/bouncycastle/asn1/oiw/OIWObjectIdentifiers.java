package org.bouncycastle.asn1.oiw;

import org.bouncycastle.asn1.DERObjectIdentifier;

public abstract interface OIWObjectIdentifiers
{
  public static final DERObjectIdentifier desCBC;
  public static final DERObjectIdentifier desCFB;
  public static final DERObjectIdentifier desECB;
  public static final DERObjectIdentifier desEDE;
  public static final DERObjectIdentifier desOFB;
  public static final DERObjectIdentifier dsaWithSHA1;
  public static final DERObjectIdentifier elGamalAlgorithm = new DERObjectIdentifier("1.3.14.7.2.1.1");
  public static final DERObjectIdentifier idSHA1;
  public static final DERObjectIdentifier md4WithRSA = new DERObjectIdentifier("1.3.14.3.2.2");
  public static final DERObjectIdentifier md4WithRSAEncryption;
  public static final DERObjectIdentifier md5WithRSA = new DERObjectIdentifier("1.3.14.3.2.3");
  public static final DERObjectIdentifier sha1WithRSA;
  
  static
  {
    md4WithRSAEncryption = new DERObjectIdentifier("1.3.14.3.2.4");
    desECB = new DERObjectIdentifier("1.3.14.3.2.6");
    desCBC = new DERObjectIdentifier("1.3.14.3.2.7");
    desOFB = new DERObjectIdentifier("1.3.14.3.2.8");
    desCFB = new DERObjectIdentifier("1.3.14.3.2.9");
    desEDE = new DERObjectIdentifier("1.3.14.3.2.17");
    idSHA1 = new DERObjectIdentifier("1.3.14.3.2.26");
    dsaWithSHA1 = new DERObjectIdentifier("1.3.14.3.2.27");
    sha1WithRSA = new DERObjectIdentifier("1.3.14.3.2.29");
  }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/org/bouncycastle/asn1/oiw/OIWObjectIdentifiers.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */