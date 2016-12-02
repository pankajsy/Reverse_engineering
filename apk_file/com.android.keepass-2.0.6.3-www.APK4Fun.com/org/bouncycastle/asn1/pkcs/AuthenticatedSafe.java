package org.bouncycastle.asn1.pkcs;

import org.bouncycastle.asn1.ASN1Encodable;
import org.bouncycastle.asn1.ASN1EncodableVector;
import org.bouncycastle.asn1.ASN1Sequence;
import org.bouncycastle.asn1.BERSequence;
import org.bouncycastle.asn1.DERObject;

public class AuthenticatedSafe
        extends ASN1Encodable {
    ContentInfo[] info;

    public AuthenticatedSafe(ASN1Sequence paramASN1Sequence) {
        this.info = new ContentInfo[paramASN1Sequence.size()];
        int i = 0;
        while (i != this.info.length) {
            this.info[i] = ContentInfo.getInstance(paramASN1Sequence.getObjectAt(i));
            i += 1;
        }
    }

    public AuthenticatedSafe(ContentInfo[] paramArrayOfContentInfo) {
        this.info = paramArrayOfContentInfo;
    }

    public ContentInfo[] getContentInfo() {
        return this.info;
    }

    public DERObject toASN1Object() {
        ASN1EncodableVector localASN1EncodableVector = new ASN1EncodableVector();
        int i = 0;
        while (i != this.info.length) {
            localASN1EncodableVector.add(this.info[i]);
            i += 1;
        }
        return new BERSequence(localASN1EncodableVector);
    }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/org/bouncycastle/asn1/pkcs/AuthenticatedSafe.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */