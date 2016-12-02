package org.bouncycastle.asn1;

public class OIDTokenizer
{
  private int index;
  private String oid;
  
  public OIDTokenizer(String paramString)
  {
    this.oid = paramString;
    this.index = 0;
  }
  
  public boolean hasMoreTokens()
  {
    return this.index != -1;
  }
  
  public String nextToken()
  {
    if (this.index == -1) {
      return null;
    }
    int i = this.oid.indexOf('.', this.index);
    if (i == -1)
    {
      str = this.oid.substring(this.index);
      this.index = -1;
      return str;
    }
    String str = this.oid.substring(this.index, i);
    this.index = (i + 1);
    return str;
  }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/org/bouncycastle/asn1/OIDTokenizer.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */