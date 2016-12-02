package org.bouncycastle.asn1;

import java.io.ByteArrayInputStream;
import java.io.EOFException;
import java.io.FilterInputStream;
import java.io.IOException;
import java.io.InputStream;

public class DERInputStream
        extends FilterInputStream
        implements DERTags {
    public DERInputStream(InputStream paramInputStream) {
        super(paramInputStream);
    }

    protected DERObject buildObject(int paramInt, byte[] paramArrayOfByte)
            throws IOException {
        switch (paramInt) {
            default:
                if ((paramInt & 0x80) == 0) {
                    break label606;
                }
                if ((paramInt & 0x1F) == 31) {
                    throw new IOException("unsupported high tag encountered");
                }
                break;
            case 5:
                return null;
            case 48:
                BERInputStream localBERInputStream1 = new BERInputStream(new ByteArrayInputStream(paramArrayOfByte));
                paramArrayOfByte = new DERConstructedSequence();
                try {
                    for (; ; ) {
                        paramArrayOfByte.addObject(localBERInputStream1.readObject());
                    }
                    localBERInputStream2 = new BERInputStream(new ByteArrayInputStream(paramArrayOfByte));
                } catch (EOFException localEOFException1) {
                    return paramArrayOfByte;
                }
            case 49:
                BERInputStream localBERInputStream2;
                paramArrayOfByte = new ASN1EncodableVector();
                try {
                    for (; ; ) {
                        paramArrayOfByte.add(localBERInputStream2.readObject());
                    }
                    return new DERBoolean(paramArrayOfByte);
                } catch (EOFException localEOFException2) {
                    return new DERConstructedSet(paramArrayOfByte);
                }
            case 1:
            case 2:
                return new DERInteger(paramArrayOfByte);
            case 10:
                return new DEREnumerated(paramArrayOfByte);
            case 6:
                return new DERObjectIdentifier(paramArrayOfByte);
            case 3:
                paramInt = paramArrayOfByte[0];
                localObject = new byte[paramArrayOfByte.length - 1];
                System.arraycopy(paramArrayOfByte, 1, localObject, 0, paramArrayOfByte.length - 1);
                return new DERBitString((byte[]) localObject, paramInt);
            case 12:
                return new DERUTF8String(paramArrayOfByte);
            case 19:
                return new DERPrintableString(paramArrayOfByte);
            case 22:
                return new DERIA5String(paramArrayOfByte);
            case 20:
                return new DERT61String(paramArrayOfByte);
            case 26:
                return new DERVisibleString(paramArrayOfByte);
            case 28:
                return new DERUniversalString(paramArrayOfByte);
            case 27:
                return new DERGeneralString(paramArrayOfByte);
            case 30:
                return new DERBMPString(paramArrayOfByte);
            case 4:
                return new DEROctetString(paramArrayOfByte);
            case 23:
                return new DERUTCTime(paramArrayOfByte);
            case 24:
                return new DERGeneralizedTime(paramArrayOfByte);
        }
        if (paramArrayOfByte.length == 0) {
            if ((paramInt & 0x20) == 0) {
                return new DERTaggedObject(false, paramInt & 0x1F, new DERNull());
            }
            return new DERTaggedObject(false, paramInt & 0x1F, new DERConstructedSequence());
        }
        if ((paramInt & 0x20) == 0) {
            return new DERTaggedObject(false, paramInt & 0x1F, new DEROctetString(paramArrayOfByte));
        }
        Object localObject = new BERInputStream(new ByteArrayInputStream(paramArrayOfByte));
        DERObject localDERObject = ((BERInputStream) localObject).readObject();
        if (((BERInputStream) localObject).available() == 0) {
            return new DERTaggedObject(paramInt & 0x1F, localDERObject);
        }
        paramArrayOfByte = new DERConstructedSequence();
        paramArrayOfByte.addObject(localDERObject);
        try {
            for (; ; ) {
                paramArrayOfByte.addObject(((BERInputStream) localObject).readObject());
            }
            return new DERUnknownTag(paramInt, paramArrayOfByte);
        } catch (EOFException localEOFException3) {
            return new DERTaggedObject(false, paramInt & 0x1F, paramArrayOfByte);
        }
    }

    protected void readFully(byte[] paramArrayOfByte)
            throws IOException {
        int j = paramArrayOfByte.length;
        int i = j;
        if (j == 0) {
            return;
        }
        do {
            i -= j;
            if (i <= 0) {
                break;
            }
            j = read(paramArrayOfByte, paramArrayOfByte.length - i, i);
        } while (j >= 0);
        throw new EOFException("unexpected end of stream");
    }

    protected int readLength()
            throws IOException {
        int i = read();
        if (i < 0) {
            throw new IOException("EOF found when length expected");
        }
        if (i == 128) {
            return -1;
        }
        int j = i;
        if (i > 127) {
            int k = i & 0x7F;
            if (k > 4) {
                throw new IOException("DER length more than 4 bytes");
            }
            i = 0;
            j = 0;
            while (j < k) {
                int m = read();
                if (m < 0) {
                    throw new IOException("EOF found reading length");
                }
                i = (i << 8) + m;
                j += 1;
            }
            j = i;
            if (i < 0) {
                throw new IOException("corrupted stream - negative length found");
            }
        }
        return j;
    }

    public DERObject readObject()
            throws IOException {
        int i = read();
        if (i == -1) {
            throw new EOFException();
        }
        byte[] arrayOfByte = new byte[readLength()];
        readFully(arrayOfByte);
        return buildObject(i, arrayOfByte);
    }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/org/bouncycastle/asn1/DERInputStream.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */