package org.bouncycastle.asn1;

import java.io.IOException;
import java.io.InputStream;

public class BERTaggedObjectParser
  implements ASN1TaggedObjectParser
{
  private int _baseTag;
  private InputStream _contentStream;
  private boolean _indefiniteLength;
  private int _tagNumber;
  
  protected BERTaggedObjectParser(int paramInt1, int paramInt2, InputStream paramInputStream)
  {
    this._baseTag = paramInt1;
    this._tagNumber = paramInt2;
    this._contentStream = paramInputStream;
    this._indefiniteLength = (paramInputStream instanceof IndefiniteLengthInputStream);
  }
  
  private ASN1EncodableVector rLoadVector(InputStream paramInputStream)
  {
    try
    {
      paramInputStream = new ASN1StreamParser(paramInputStream).readVector();
      return paramInputStream;
    }
    catch (IOException paramInputStream)
    {
      throw new ASN1ParsingException(paramInputStream.getMessage(), paramInputStream);
    }
  }
  
  public DERObject getDERObject()
  {
    Object localObject;
    if (this._indefiniteLength)
    {
      localObject = rLoadVector(this._contentStream);
      if (((ASN1EncodableVector)localObject).size() == 1) {
        return new BERTaggedObject(true, this._tagNumber, ((ASN1EncodableVector)localObject).get(0));
      }
      return new BERTaggedObject(false, this._tagNumber, BERFactory.createSequence((ASN1EncodableVector)localObject));
    }
    if (isConstructed())
    {
      localObject = rLoadVector(this._contentStream);
      if (((ASN1EncodableVector)localObject).size() == 1) {
        return new DERTaggedObject(true, this._tagNumber, ((ASN1EncodableVector)localObject).get(0));
      }
      return new DERTaggedObject(false, this._tagNumber, DERFactory.createSequence((ASN1EncodableVector)localObject));
    }
    try
    {
      localObject = (DefiniteLengthInputStream)this._contentStream;
      localObject = new DERTaggedObject(false, this._tagNumber, new DEROctetString(((DefiniteLengthInputStream)localObject).toByteArray()));
      return (DERObject)localObject;
    }
    catch (IOException localIOException)
    {
      throw new IllegalStateException(localIOException.getMessage());
    }
  }
  
  public DEREncodable getObjectParser(int paramInt, boolean paramBoolean)
    throws IOException
  {
    if (paramBoolean) {
      return new ASN1StreamParser(this._contentStream).readObject();
    }
    switch (paramInt)
    {
    default: 
      throw new RuntimeException("implicit tagging not implemented");
    case 17: 
      if (this._indefiniteLength) {
        return new BERSetParser(new ASN1StreamParser(this._contentStream));
      }
      return new DERSetParser(new ASN1StreamParser(this._contentStream));
    case 16: 
      if (this._indefiniteLength) {
        return new BERSequenceParser(new ASN1StreamParser(this._contentStream));
      }
      return new DERSequenceParser(new ASN1StreamParser(this._contentStream));
    }
    if ((this._indefiniteLength) || (isConstructed())) {
      return new BEROctetStringParser(new ASN1StreamParser(this._contentStream));
    }
    return new DEROctetStringParser((DefiniteLengthInputStream)this._contentStream);
  }
  
  public int getTagNo()
  {
    return this._tagNumber;
  }
  
  public boolean isConstructed()
  {
    return (this._baseTag & 0x20) != 0;
  }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/org/bouncycastle/asn1/BERTaggedObjectParser.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */