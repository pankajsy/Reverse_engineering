package org.bouncycastle.asn1;

import java.io.ByteArrayOutputStream;
import java.io.IOException;

public class DERExternal
  extends ASN1Object
{
  private ASN1Object dataValueDescriptor;
  private DERObjectIdentifier directReference;
  private int encoding;
  private DERObject externalContent;
  private DERInteger indirectReference;
  
  public DERExternal(ASN1EncodableVector paramASN1EncodableVector)
  {
    int i = 0;
    Object localObject2 = paramASN1EncodableVector.get(0).getDERObject();
    Object localObject1 = localObject2;
    if ((localObject2 instanceof DERObjectIdentifier))
    {
      this.directReference = ((DERObjectIdentifier)localObject2);
      i = 0 + 1;
      localObject1 = paramASN1EncodableVector.get(i).getDERObject();
    }
    localObject2 = localObject1;
    int j = i;
    if ((localObject1 instanceof DERInteger))
    {
      this.indirectReference = ((DERInteger)localObject1);
      j = i + 1;
      localObject2 = paramASN1EncodableVector.get(j).getDERObject();
    }
    localObject1 = localObject2;
    if (!(localObject2 instanceof DERTaggedObject))
    {
      this.dataValueDescriptor = ((ASN1Object)localObject2);
      localObject1 = paramASN1EncodableVector.get(j + 1).getDERObject();
    }
    if (!(localObject1 instanceof DERTaggedObject)) {
      throw new IllegalArgumentException("No tagged object found in vector. Structure doesn't seem to be of type External");
    }
    paramASN1EncodableVector = (DERTaggedObject)localObject1;
    setEncoding(paramASN1EncodableVector.getTagNo());
    this.externalContent = paramASN1EncodableVector.getObject();
  }
  
  public DERExternal(DERObjectIdentifier paramDERObjectIdentifier, DERInteger paramDERInteger, ASN1Object paramASN1Object, int paramInt, DERObject paramDERObject)
  {
    setDirectReference(paramDERObjectIdentifier);
    setIndirectReference(paramDERInteger);
    setDataValueDescriptor(paramASN1Object);
    setEncoding(paramInt);
    setExternalContent(paramDERObject.getDERObject());
  }
  
  public DERExternal(DERObjectIdentifier paramDERObjectIdentifier, DERInteger paramDERInteger, ASN1Object paramASN1Object, DERTaggedObject paramDERTaggedObject)
  {
    this(paramDERObjectIdentifier, paramDERInteger, paramASN1Object, paramDERTaggedObject.getTagNo(), paramDERTaggedObject.getDERObject());
  }
  
  private void setDataValueDescriptor(ASN1Object paramASN1Object)
  {
    this.dataValueDescriptor = paramASN1Object;
  }
  
  private void setDirectReference(DERObjectIdentifier paramDERObjectIdentifier)
  {
    this.directReference = paramDERObjectIdentifier;
  }
  
  private void setEncoding(int paramInt)
  {
    if ((paramInt < 0) || (paramInt > 2)) {
      throw new IllegalArgumentException("invalid encoding value: " + paramInt);
    }
    this.encoding = paramInt;
  }
  
  private void setExternalContent(DERObject paramDERObject)
  {
    this.externalContent = paramDERObject;
  }
  
  private void setIndirectReference(DERInteger paramDERInteger)
  {
    this.indirectReference = paramDERInteger;
  }
  
  boolean asn1Equals(DERObject paramDERObject)
  {
    if (!(paramDERObject instanceof DERExternal)) {}
    do
    {
      return false;
      if (this == paramDERObject) {
        return true;
      }
      paramDERObject = (DERExternal)paramDERObject;
    } while (((this.directReference != null) && ((paramDERObject.directReference == null) || (!paramDERObject.directReference.equals(this.directReference)))) || ((this.indirectReference != null) && ((paramDERObject.indirectReference == null) || (!paramDERObject.indirectReference.equals(this.indirectReference)))) || ((this.dataValueDescriptor != null) && ((paramDERObject.dataValueDescriptor == null) || (!paramDERObject.dataValueDescriptor.equals(this.dataValueDescriptor)))));
    return this.externalContent.equals(paramDERObject.externalContent);
  }
  
  void encode(DEROutputStream paramDEROutputStream)
    throws IOException
  {
    ByteArrayOutputStream localByteArrayOutputStream = new ByteArrayOutputStream();
    if (this.directReference != null) {
      localByteArrayOutputStream.write(this.directReference.getDEREncoded());
    }
    if (this.indirectReference != null) {
      localByteArrayOutputStream.write(this.indirectReference.getDEREncoded());
    }
    if (this.dataValueDescriptor != null) {
      localByteArrayOutputStream.write(this.dataValueDescriptor.getDEREncoded());
    }
    localByteArrayOutputStream.write(new DERTaggedObject(this.encoding, this.externalContent).getDEREncoded());
    paramDEROutputStream.writeEncoded(32, 8, localByteArrayOutputStream.toByteArray());
  }
  
  public ASN1Object getDataValueDescriptor()
  {
    return this.dataValueDescriptor;
  }
  
  public DERObjectIdentifier getDirectReference()
  {
    return this.directReference;
  }
  
  public int getEncoding()
  {
    return this.encoding;
  }
  
  public DERObject getExternalContent()
  {
    return this.externalContent;
  }
  
  public DERInteger getIndirectReference()
  {
    return this.indirectReference;
  }
  
  public int hashCode()
  {
    int j = 0;
    if (this.directReference != null) {
      j = this.directReference.hashCode();
    }
    int i = j;
    if (this.indirectReference != null) {
      i = j ^ this.indirectReference.hashCode();
    }
    j = i;
    if (this.dataValueDescriptor != null) {
      j = i ^ this.dataValueDescriptor.hashCode();
    }
    return j ^ this.externalContent.hashCode();
  }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/org/bouncycastle/asn1/DERExternal.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */