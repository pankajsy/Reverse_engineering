package org.bouncycastle.crypto.params;

public class DSAKeyParameters
  extends AsymmetricKeyParameter
{
  private DSAParameters params;
  
  public DSAKeyParameters(boolean paramBoolean, DSAParameters paramDSAParameters)
  {
    super(paramBoolean);
    this.params = paramDSAParameters;
  }
  
  public DSAParameters getParameters()
  {
    return this.params;
  }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/org/bouncycastle/crypto/params/DSAKeyParameters.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */