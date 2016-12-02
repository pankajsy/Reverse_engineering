package org.bouncycastle.asn1;

import java.io.ByteArrayOutputStream;
import java.io.EOFException;
import java.io.IOException;
import java.io.InputStream;
import java.util.Vector;

public class BERInputStream
        extends DERInputStream {
    private static final DERObject END_OF_STREAM = new DERObject() {
        void encode(DEROutputStream paramAnonymousDEROutputStream)
                throws IOException {
            throw new IOException("Eeek!");
        }

        public boolean equals(Object paramAnonymousObject) {
            return paramAnonymousObject == this;
        }

        public int hashCode() {
            return 0;
        }
    };

    public BERInputStream(InputStream paramInputStream) {
        super(paramInputStream);
    }

    private BERConstructedOctetString buildConstructedOctetString()
            throws IOException {
        Vector localVector = new Vector();
        for (; ; ) {
            DERObject localDERObject = readObject();
            if (localDERObject == END_OF_STREAM) {
                return new BERConstructedOctetString(localVector);
            }
            localVector.addElement(localDERObject);
        }
    }

    private byte[] readIndefiniteLengthFully()
            throws IOException {
        ByteArrayOutputStream localByteArrayOutputStream = new ByteArrayOutputStream();
        int j;
        for (int i = read(); ; i = j) {
            j = read();
            if ((j < 0) || ((i == 0) && (j == 0))) {
                return localByteArrayOutputStream.toByteArray();
            }
            localByteArrayOutputStream.write(i);
        }
    }

    public DERObject readObject()
            throws IOException {
        int i = read();
        if (i == -1) {
            throw new EOFException();
        }
        int j = readLength();
        if (j < 0) {
            switch (i) {
                default:
                    if ((i & 0x80) == 0) {
                        break label321;
                    }
                    if ((i & 0x1F) == 31) {
                        throw new IOException("unsupported high tag encountered");
                    }
                    break;
                case 5:
                    localObject1 = null;
                    return (DERObject) localObject1;
                case 48:
                    localObject2 = new BERConstructedSequence();
                    for (; ; ) {
                        localObject3 = readObject();
                        localObject1 = localObject2;
                        if (localObject3 == END_OF_STREAM) {
                            break;
                        }
                        ((BERConstructedSequence) localObject2).addObject((DEREncodable) localObject3);
                    }
                case 36:
                    return buildConstructedOctetString();
                case 49:
                    localObject1 = new ASN1EncodableVector();
                    for (; ; ) {
                        localObject2 = readObject();
                        if (localObject2 == END_OF_STREAM) {
                            return new BERSet((DEREncodableVector) localObject1);
                        }
                        ((ASN1EncodableVector) localObject1).add((DEREncodable) localObject2);
                    }
            }
            if ((i & 0x20) == 0) {
                return new BERTaggedObject(false, i & 0x1F, new DEROctetString(readIndefiniteLengthFully()));
            }
            Object localObject2 = readObject();
            if (localObject2 == END_OF_STREAM) {
                return new DERTaggedObject(i & 0x1F);
            }
            localObject1 = readObject();
            if (localObject1 == END_OF_STREAM) {
                return new BERTaggedObject(i & 0x1F, (DEREncodable) localObject2);
            }
            Object localObject3 = new BERConstructedSequence();
            ((BERConstructedSequence) localObject3).addObject((DEREncodable) localObject2);
            do {
                ((BERConstructedSequence) localObject3).addObject((DEREncodable) localObject1);
                localObject2 = readObject();
                localObject1 = localObject2;
            } while (localObject2 != END_OF_STREAM);
            return new BERTaggedObject(false, i & 0x1F, (DEREncodable) localObject3);
            label321:
            throw new IOException("unknown BER object encountered");
        }
        if ((i == 0) && (j == 0)) {
            return END_OF_STREAM;
        }
        Object localObject1 = new byte[j];
        readFully((byte[]) localObject1);
        return buildObject(i, (byte[]) localObject1);
    }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/org/bouncycastle/asn1/BERInputStream.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */