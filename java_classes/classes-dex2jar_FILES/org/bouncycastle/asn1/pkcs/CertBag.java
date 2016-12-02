package org.bouncycastle.asn1.pkcs;

import org.bouncycastle.asn1.ASN1Encodable;
import org.bouncycastle.asn1.ASN1EncodableVector;
import org.bouncycastle.asn1.ASN1Sequence;
import org.bouncycastle.asn1.DERObject;
import org.bouncycastle.asn1.DERObjectIdentifier;
import org.bouncycastle.asn1.DERSequence;
import org.bouncycastle.asn1.DERTaggedObject;

public class CertBag
  extends ASN1Encodable
{
  DERObjectIdentifier certId;
  DERObject certValue;
  ASN1Sequence seq;
  
  public CertBag(ASN1Sequence paramASN1Sequence)
  {
    this.seq = paramASN1Sequence;
    this.certId = ((DERObjectIdentifier)paramASN1Sequence.getObjectAt(0));
    this.certValue = ((DERTaggedObject)paramASN1Sequence.getObjectAt(1)).getObject();
  }
  
  public CertBag(DERObjectIdentifier paramDERObjectIdentifier, DERObject paramDERObject)
  {
    this.certId = paramDERObjectIdentifier;
    this.certValue = paramDERObject;
  }
  
  public DERObjectIdentifier getCertId()
  {
    return this.certId;
  }
  
  public DERObject getCertValue()
  {
    return this.certValue;
  }
  
  public DERObject toASN1Object()
  {
    ASN1EncodableVector localASN1EncodableVector = new ASN1EncodableVector();
    localASN1EncodableVector.add(this.certId);
    localASN1EncodableVector.add(new DERTaggedObject(0, this.certValue));
    return new DERSequence(localASN1EncodableVector);
  }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/org/bouncycastle/asn1/pkcs/CertBag.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */