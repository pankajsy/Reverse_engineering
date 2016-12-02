package org.bouncycastle.asn1.util;

import org.bouncycastle.asn1.ASN1InputStream;
import org.bouncycastle.asn1.DERObject;

import java.io.FileInputStream;

public class Dump {
    public static void main(String[] paramArrayOfString)
            throws Exception {
        paramArrayOfString = new ASN1InputStream(new FileInputStream(paramArrayOfString[0]));
        for (; ; ) {
            DERObject localDERObject = paramArrayOfString.readObject();
            if (localDERObject == null) {
                break;
            }
            System.out.println(ASN1Dump.dumpAsString(localDERObject));
        }
    }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/org/bouncycastle/asn1/util/Dump.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */