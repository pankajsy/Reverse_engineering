package org.bouncycastle.asn1;

import java.io.IOException;

public abstract class ASN1TaggedObject
  extends ASN1Object
  implements ASN1TaggedObjectParser
{
  boolean empty = false;
  boolean explicit = true;
  DEREncodable obj = null;
  int tagNo;
  
  public ASN1TaggedObject(int paramInt, DEREncodable paramDEREncodable)
  {
    this.explicit = true;
    this.tagNo = paramInt;
    this.obj = paramDEREncodable;
  }
  
  public ASN1TaggedObject(boolean paramBoolean, int paramInt, DEREncodable paramDEREncodable)
  {
    if ((paramDEREncodable instanceof ASN1Choice)) {}
    for (this.explicit = true;; this.explicit = paramBoolean)
    {
      this.tagNo = paramInt;
      this.obj = paramDEREncodable;
      return;
    }
  }
  
  public static ASN1TaggedObject getInstance(Object paramObject)
  {
    if ((paramObject == null) || ((paramObject instanceof ASN1TaggedObject))) {
      return (ASN1TaggedObject)paramObject;
    }
    throw new IllegalArgumentException("unknown object in getInstance: " + paramObject.getClass().getName());
  }
  
  public static ASN1TaggedObject getInstance(ASN1TaggedObject paramASN1TaggedObject, boolean paramBoolean)
  {
    if (paramBoolean) {
      return (ASN1TaggedObject)paramASN1TaggedObject.getObject();
    }
    throw new IllegalArgumentException("implicitly tagged tagged object");
  }
  
  boolean asn1Equals(DERObject paramDERObject)
  {
    if (!(paramDERObject instanceof ASN1TaggedObject)) {}
    do
    {
      do
      {
        return false;
        paramDERObject = (ASN1TaggedObject)paramDERObject;
      } while ((this.tagNo != paramDERObject.tagNo) || (this.empty != paramDERObject.empty) || (this.explicit != paramDERObject.explicit));
      if (this.obj != null) {
        break;
      }
    } while (paramDERObject.obj != null);
    while (this.obj.getDERObject().equals(paramDERObject.obj.getDERObject())) {
      return true;
    }
    return false;
  }
  
  abstract void encode(DEROutputStream paramDEROutputStream)
    throws IOException;
  
  public DERObject getObject()
  {
    if (this.obj != null) {
      return this.obj.getDERObject();
    }
    return null;
  }
  
  public DEREncodable getObjectParser(int paramInt, boolean paramBoolean)
  {
    switch (paramInt)
    {
    default: 
      if (paramBoolean) {
        return getObject();
      }
      break;
    case 17: 
      return ASN1Set.getInstance(this, paramBoolean).parser();
    case 16: 
      return ASN1Sequence.getInstance(this, paramBoolean).parser();
    case 4: 
      return ASN1OctetString.getInstance(this, paramBoolean).parser();
    }
    throw new RuntimeException("implicit tagging not implemented for tag: " + paramInt);
  }
  
  public int getTagNo()
  {
    return this.tagNo;
  }
  
  public int hashCode()
  {
    int j = this.tagNo;
    int i = j;
    if (this.obj != null) {
      i = j ^ this.obj.hashCode();
    }
    return i;
  }
  
  public boolean isEmpty()
  {
    return this.empty;
  }
  
  public boolean isExplicit()
  {
    return this.explicit;
  }
  
  public String toString()
  {
    return "[" + this.tagNo + "]" + this.obj;
  }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/org/bouncycastle/asn1/ASN1TaggedObject.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */