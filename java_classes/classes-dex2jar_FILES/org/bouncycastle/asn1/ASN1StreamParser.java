package org.bouncycastle.asn1;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;

public class ASN1StreamParser
{
  private final InputStream _in;
  private final int _limit;
  
  public ASN1StreamParser(InputStream paramInputStream)
  {
    this(paramInputStream, findLimit(paramInputStream));
  }
  
  public ASN1StreamParser(InputStream paramInputStream, int paramInt)
  {
    this._in = paramInputStream;
    this._limit = paramInt;
  }
  
  public ASN1StreamParser(byte[] paramArrayOfByte)
  {
    this(new ByteArrayInputStream(paramArrayOfByte), paramArrayOfByte.length);
  }
  
  private static int findLimit(InputStream paramInputStream)
  {
    if ((paramInputStream instanceof DefiniteLengthInputStream)) {
      return ((DefiniteLengthInputStream)paramInputStream).getRemaining();
    }
    return Integer.MAX_VALUE;
  }
  
  private void set00Check(boolean paramBoolean)
  {
    if ((this._in instanceof IndefiniteLengthInputStream)) {
      ((IndefiniteLengthInputStream)this._in).setEofOn00(paramBoolean);
    }
  }
  
  public DEREncodable readObject()
    throws IOException
  {
    boolean bool = false;
    int i = this._in.read();
    if (i == -1) {
      return null;
    }
    set00Check(false);
    int j = ASN1InputStream.readTagNumber(this._in, i);
    if ((i & 0x20) != 0) {
      bool = true;
    }
    int k = ASN1InputStream.readLength(this._in, this._limit);
    if (k < 0)
    {
      if (!bool) {
        throw new IOException("indefinite length primitive encoding encountered");
      }
      localObject = new IndefiniteLengthInputStream(this._in);
      if ((i & 0x40) != 0) {
        return new BERApplicationSpecificParser(j, new ASN1StreamParser((InputStream)localObject, this._limit));
      }
      if ((i & 0x80) != 0) {
        return new BERTaggedObjectParser(i, j, (InputStream)localObject);
      }
      localObject = new ASN1StreamParser((InputStream)localObject, this._limit);
      switch (j)
      {
      default: 
        throw new IOException("unknown BER object encountered: 0x" + Integer.toHexString(j));
      case 4: 
        return new BEROctetStringParser((ASN1StreamParser)localObject);
      case 16: 
        return new BERSequenceParser((ASN1StreamParser)localObject);
      case 17: 
        return new BERSetParser((ASN1StreamParser)localObject);
      }
      return new DERExternalParser((ASN1StreamParser)localObject);
    }
    Object localObject = new DefiniteLengthInputStream(this._in, k);
    if ((i & 0x40) != 0) {
      return new DERApplicationSpecific(bool, j, ((DefiniteLengthInputStream)localObject).toByteArray());
    }
    if ((i & 0x80) != 0) {
      return new BERTaggedObjectParser(i, j, (InputStream)localObject);
    }
    if (bool)
    {
      switch (j)
      {
      default: 
        return new DERUnknownTag(true, j, ((DefiniteLengthInputStream)localObject).toByteArray());
      case 4: 
        return new BEROctetStringParser(new ASN1StreamParser((InputStream)localObject));
      case 16: 
        return new DERSequenceParser(new ASN1StreamParser((InputStream)localObject));
      case 17: 
        return new DERSetParser(new ASN1StreamParser((InputStream)localObject));
      }
      return new DERExternalParser(new ASN1StreamParser((InputStream)localObject));
    }
    switch (j)
    {
    default: 
      return ASN1InputStream.createPrimitiveDERObject(j, ((DefiniteLengthInputStream)localObject).toByteArray());
    }
    return new DEROctetStringParser((DefiniteLengthInputStream)localObject);
  }
  
  ASN1EncodableVector readVector()
    throws IOException
  {
    ASN1EncodableVector localASN1EncodableVector = new ASN1EncodableVector();
    for (;;)
    {
      DEREncodable localDEREncodable = readObject();
      if (localDEREncodable == null) {
        break;
      }
      localASN1EncodableVector.add(localDEREncodable.getDERObject());
    }
    return localASN1EncodableVector;
  }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/org/bouncycastle/asn1/ASN1StreamParser.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */