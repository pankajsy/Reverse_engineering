package org.bouncycastle.asn1;

import java.io.IOException;
import java.io.OutputStream;

public class BERSequenceGenerator
  extends BERGenerator
{
  public BERSequenceGenerator(OutputStream paramOutputStream)
    throws IOException
  {
    super(paramOutputStream);
    writeBERHeader(48);
  }
  
  public BERSequenceGenerator(OutputStream paramOutputStream, int paramInt, boolean paramBoolean)
    throws IOException
  {
    super(paramOutputStream, paramInt, paramBoolean);
    writeBERHeader(48);
  }
  
  public void addObject(DEREncodable paramDEREncodable)
    throws IOException
  {
    paramDEREncodable.getDERObject().encode(new BEROutputStream(this._out));
  }
  
  public void close()
    throws IOException
  {
    writeBEREnd();
  }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/org/bouncycastle/asn1/BERSequenceGenerator.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */