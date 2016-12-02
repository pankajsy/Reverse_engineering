package org.bouncycastle.asn1;

import java.io.IOException;
import org.bouncycastle.util.Arrays;

public class DERUnknownTag
  extends DERObject
{
  private byte[] data;
  private boolean isConstructed;
  private int tag;
  
  public DERUnknownTag(int paramInt, byte[] paramArrayOfByte)
  {
    this(false, paramInt, paramArrayOfByte);
  }
  
  public DERUnknownTag(boolean paramBoolean, int paramInt, byte[] paramArrayOfByte)
  {
    this.isConstructed = paramBoolean;
    this.tag = paramInt;
    this.data = paramArrayOfByte;
  }
  
  void encode(DEROutputStream paramDEROutputStream)
    throws IOException
  {
    if (this.isConstructed) {}
    for (int i = 32;; i = 0)
    {
      paramDEROutputStream.writeEncoded(i, this.tag, this.data);
      return;
    }
  }
  
  public boolean equals(Object paramObject)
  {
    if (!(paramObject instanceof DERUnknownTag)) {}
    do
    {
      return false;
      paramObject = (DERUnknownTag)paramObject;
    } while ((this.isConstructed != ((DERUnknownTag)paramObject).isConstructed) || (this.tag != ((DERUnknownTag)paramObject).tag) || (!Arrays.areEqual(this.data, ((DERUnknownTag)paramObject).data)));
    return true;
  }
  
  public byte[] getData()
  {
    return this.data;
  }
  
  public int getTag()
  {
    return this.tag;
  }
  
  public int hashCode()
  {
    if (this.isConstructed) {}
    for (int i = -1;; i = 0) {
      return i ^ this.tag ^ Arrays.hashCode(this.data);
    }
  }
  
  public boolean isConstructed()
  {
    return this.isConstructed;
  }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/org/bouncycastle/asn1/DERUnknownTag.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */