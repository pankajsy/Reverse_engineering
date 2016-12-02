package org.bouncycastle.crypto.params;

public class DHKeyParameters
  extends AsymmetricKeyParameter
{
  private DHParameters params;
  
  protected DHKeyParameters(boolean paramBoolean, DHParameters paramDHParameters)
  {
    super(paramBoolean);
    this.params = paramDHParameters;
  }
  
  public boolean equals(Object paramObject)
  {
    if (!(paramObject instanceof DHKeyParameters)) {}
    do
    {
      return false;
      paramObject = (DHKeyParameters)paramObject;
      if (this.params != null) {
        break;
      }
    } while (((DHKeyParameters)paramObject).getParameters() != null);
    return true;
    return this.params.equals(((DHKeyParameters)paramObject).getParameters());
  }
  
  public DHParameters getParameters()
  {
    return this.params;
  }
  
  public int hashCode()
  {
    if (isPrivate()) {}
    for (int i = 0;; i = 1)
    {
      int j = i;
      if (this.params != null) {
        j = i ^ this.params.hashCode();
      }
      return j;
    }
  }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/org/bouncycastle/crypto/params/DHKeyParameters.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */