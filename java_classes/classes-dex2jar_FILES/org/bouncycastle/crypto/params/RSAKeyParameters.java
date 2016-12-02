package org.bouncycastle.crypto.params;

import java.math.BigInteger;

public class RSAKeyParameters
  extends AsymmetricKeyParameter
{
  private BigInteger exponent;
  private BigInteger modulus;
  
  public RSAKeyParameters(boolean paramBoolean, BigInteger paramBigInteger1, BigInteger paramBigInteger2)
  {
    super(paramBoolean);
    this.modulus = paramBigInteger1;
    this.exponent = paramBigInteger2;
  }
  
  public BigInteger getExponent()
  {
    return this.exponent;
  }
  
  public BigInteger getModulus()
  {
    return this.modulus;
  }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/org/bouncycastle/crypto/params/RSAKeyParameters.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */