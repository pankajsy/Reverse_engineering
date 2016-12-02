package org.bouncycastle.asn1;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Enumeration;
import java.util.Vector;
import org.bouncycastle.util.Arrays;
import org.bouncycastle.util.encoders.Hex;

public abstract class ASN1OctetString
  extends ASN1Object
  implements ASN1OctetStringParser
{
  byte[] string;
  
  public ASN1OctetString(DEREncodable paramDEREncodable)
  {
    try
    {
      this.string = paramDEREncodable.getDERObject().getEncoded("DER");
      return;
    }
    catch (IOException paramDEREncodable)
    {
      throw new IllegalArgumentException("Error processing object : " + paramDEREncodable.toString());
    }
  }
  
  public ASN1OctetString(byte[] paramArrayOfByte)
  {
    if (paramArrayOfByte == null) {
      throw new NullPointerException("string cannot be null");
    }
    this.string = paramArrayOfByte;
  }
  
  public static ASN1OctetString getInstance(Object paramObject)
  {
    if ((paramObject == null) || ((paramObject instanceof ASN1OctetString))) {
      return (ASN1OctetString)paramObject;
    }
    if ((paramObject instanceof ASN1TaggedObject)) {
      return getInstance(((ASN1TaggedObject)paramObject).getObject());
    }
    if ((paramObject instanceof ASN1Sequence))
    {
      Vector localVector = new Vector();
      paramObject = ((ASN1Sequence)paramObject).getObjects();
      while (((Enumeration)paramObject).hasMoreElements()) {
        localVector.addElement(((Enumeration)paramObject).nextElement());
      }
      return new BERConstructedOctetString(localVector);
    }
    throw new IllegalArgumentException("illegal object in getInstance: " + paramObject.getClass().getName());
  }
  
  public static ASN1OctetString getInstance(ASN1TaggedObject paramASN1TaggedObject, boolean paramBoolean)
  {
    return getInstance(paramASN1TaggedObject.getObject());
  }
  
  boolean asn1Equals(DERObject paramDERObject)
  {
    if (!(paramDERObject instanceof ASN1OctetString)) {
      return false;
    }
    paramDERObject = (ASN1OctetString)paramDERObject;
    return Arrays.areEqual(this.string, paramDERObject.string);
  }
  
  abstract void encode(DEROutputStream paramDEROutputStream)
    throws IOException;
  
  public InputStream getOctetStream()
  {
    return new ByteArrayInputStream(this.string);
  }
  
  public byte[] getOctets()
  {
    return this.string;
  }
  
  public int hashCode()
  {
    return Arrays.hashCode(getOctets());
  }
  
  public ASN1OctetStringParser parser()
  {
    return this;
  }
  
  public String toString()
  {
    return "#" + new String(Hex.encode(this.string));
  }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/org/bouncycastle/asn1/ASN1OctetString.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */