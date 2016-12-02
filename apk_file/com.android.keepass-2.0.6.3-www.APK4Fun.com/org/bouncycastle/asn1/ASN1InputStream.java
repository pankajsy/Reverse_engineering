package org.bouncycastle.asn1;

import org.bouncycastle.util.io.Streams;

import java.io.ByteArrayInputStream;
import java.io.EOFException;
import java.io.FilterInputStream;
import java.io.IOException;
import java.io.InputStream;

public class ASN1InputStream
        extends FilterInputStream
        implements DERTags {
    static {
        if (!ASN1InputStream.class.desiredAssertionStatus()) {
        }
        for (boolean bool = true; ; bool = false) {
            $assertionsDisabled = bool;
            return;
        }
    }

    private final boolean lazyEvaluate;
    private final int limit;

    public ASN1InputStream(InputStream paramInputStream) {
        this(paramInputStream, Integer.MAX_VALUE);
    }

    public ASN1InputStream(InputStream paramInputStream, int paramInt) {
        this(paramInputStream, paramInt, false);
    }

    public ASN1InputStream(InputStream paramInputStream, int paramInt, boolean paramBoolean) {
        super(paramInputStream);
        this.limit = paramInt;
        this.lazyEvaluate = paramBoolean;
    }

    public ASN1InputStream(byte[] paramArrayOfByte) {
        this(new ByteArrayInputStream(paramArrayOfByte), paramArrayOfByte.length);
    }

    public ASN1InputStream(byte[] paramArrayOfByte, boolean paramBoolean) {
        this(new ByteArrayInputStream(paramArrayOfByte), paramArrayOfByte.length, paramBoolean);
    }

    static DERObject createPrimitiveDERObject(int paramInt, byte[] paramArrayOfByte) {
        switch (paramInt) {
            case 7:
            case 8:
            case 9:
            case 11:
            case 13:
            case 14:
            case 15:
            case 16:
            case 17:
            case 21:
            case 25:
            case 29:
            default:
                return new DERUnknownTag(false, paramInt, paramArrayOfByte);
            case 3:
                paramInt = paramArrayOfByte[0];
                byte[] arrayOfByte = new byte[paramArrayOfByte.length - 1];
                System.arraycopy(paramArrayOfByte, 1, arrayOfByte, 0, paramArrayOfByte.length - 1);
                return new DERBitString(arrayOfByte, paramInt);
            case 30:
                return new DERBMPString(paramArrayOfByte);
            case 1:
                return new DERBoolean(paramArrayOfByte);
            case 10:
                return new DEREnumerated(paramArrayOfByte);
            case 24:
                return new DERGeneralizedTime(paramArrayOfByte);
            case 27:
                return new DERGeneralString(paramArrayOfByte);
            case 22:
                return new DERIA5String(paramArrayOfByte);
            case 2:
                return new DERInteger(paramArrayOfByte);
            case 5:
                return DERNull.INSTANCE;
            case 18:
                return new DERNumericString(paramArrayOfByte);
            case 6:
                return new DERObjectIdentifier(paramArrayOfByte);
            case 4:
                return new DEROctetString(paramArrayOfByte);
            case 19:
                return new DERPrintableString(paramArrayOfByte);
            case 20:
                return new DERT61String(paramArrayOfByte);
            case 28:
                return new DERUniversalString(paramArrayOfByte);
            case 23:
                return new DERUTCTime(paramArrayOfByte);
            case 12:
                return new DERUTF8String(paramArrayOfByte);
        }
        return new DERVisibleString(paramArrayOfByte);
    }

    static int readLength(InputStream paramInputStream, int paramInt)
            throws IOException {
        int i = paramInputStream.read();
        if (i < 0) {
            throw new EOFException("EOF found when length expected");
        }
        if (i == 128) {
            return -1;
        }
        int j = i;
        if (i > 127) {
            int k = i & 0x7F;
            if (k > 4) {
                throw new IOException("DER length more than 4 bytes: " + k);
            }
            i = 0;
            j = 0;
            while (j < k) {
                int m = paramInputStream.read();
                if (m < 0) {
                    throw new EOFException("EOF found reading length");
                }
                i = (i << 8) + m;
                j += 1;
            }
            if (i < 0) {
                throw new IOException("corrupted stream - negative length found");
            }
            j = i;
            if (i >= paramInt) {
                throw new IOException("corrupted stream - out of bounds length found");
            }
        }
        return j;
    }

    static int readTagNumber(InputStream paramInputStream, int paramInt)
            throws IOException {
        int i = paramInt & 0x1F;
        paramInt = i;
        if (i == 31) {
            i = 0;
            int j = paramInputStream.read();
            paramInt = j;
            if ((j & 0x7F) == 0) {
                throw new IOException("corrupted stream - invalid high tag number found");
            }
            while ((paramInt >= 0) && ((paramInt & 0x80) != 0)) {
                i = (i | paramInt & 0x7F) << 7;
                paramInt = paramInputStream.read();
            }
            if (paramInt < 0) {
                throw new EOFException("EOF found inside tag value.");
            }
            paramInt = i | paramInt & 0x7F;
        }
        return paramInt;
    }

    ASN1EncodableVector buildDEREncodableVector(DefiniteLengthInputStream paramDefiniteLengthInputStream)
            throws IOException {
        return new ASN1InputStream(paramDefiniteLengthInputStream).buildEncodableVector();
    }

    ASN1EncodableVector buildEncodableVector()
            throws IOException {
        ASN1EncodableVector localASN1EncodableVector = new ASN1EncodableVector();
        for (; ; ) {
            DERObject localDERObject = readObject();
            if (localDERObject == null) {
                break;
            }
            localASN1EncodableVector.add(localDERObject);
        }
        return localASN1EncodableVector;
    }

    protected DERObject buildObject(int paramInt1, int paramInt2, int paramInt3)
            throws IOException {
        if ((paramInt1 & 0x20) != 0) {
        }
        DefiniteLengthInputStream localDefiniteLengthInputStream;
        for (boolean bool = true; ; bool = false) {
            localDefiniteLengthInputStream = new DefiniteLengthInputStream(this, paramInt3);
            if ((paramInt1 & 0x40) == 0) {
                break;
            }
            return new DERApplicationSpecific(bool, paramInt2, localDefiniteLengthInputStream.toByteArray());
        }
        if ((paramInt1 & 0x80) != 0) {
            return new BERTaggedObjectParser(paramInt1, paramInt2, localDefiniteLengthInputStream).getDERObject();
        }
        if (bool) {
            switch (paramInt2) {
                default:
                    return new DERUnknownTag(true, paramInt2, localDefiniteLengthInputStream.toByteArray());
                case 4:
                    return new BERConstructedOctetString(buildDEREncodableVector(localDefiniteLengthInputStream).v);
                case 16:
                    if (this.lazyEvaluate) {
                        if (!$assertionsDisabled) {
                            throw new AssertionError();
                        }
                    } else {
                        return DERFactory.createSequence(buildDEREncodableVector(localDefiniteLengthInputStream));
                    }
                case 17:
                    return DERFactory.createSet(buildDEREncodableVector(localDefiniteLengthInputStream), false);
            }
            return new DERExternal(buildDEREncodableVector(localDefiniteLengthInputStream));
        }
        return createPrimitiveDERObject(paramInt2, localDefiniteLengthInputStream.toByteArray());
    }

    protected void readFully(byte[] paramArrayOfByte)
            throws IOException {
        if (Streams.readFully(this, paramArrayOfByte) != paramArrayOfByte.length) {
            throw new EOFException("EOF encountered in middle of object");
        }
    }

    protected int readLength()
            throws IOException {
        return readLength(this, this.limit);
    }

    public DERObject readObject()
            throws IOException {
        int j = read();
        if (j <= 0) {
            if (j == 0) {
                throw new IOException("unexpected end-of-contents marker");
            }
            return null;
        }
        int k = readTagNumber(this, j);
        if ((j & 0x20) != 0) {
        }
        int m;
        for (int i = 1; ; i = 0) {
            m = readLength();
            if (m >= 0) {
                break label255;
            }
            if (i != 0) {
                break;
            }
            throw new IOException("indefinite length primitive encoding encountered");
        }
        Object localObject = new IndefiniteLengthInputStream(this);
        if ((j & 0x40) != 0) {
            return new BERApplicationSpecificParser(k, new ASN1StreamParser((InputStream) localObject, this.limit)).getDERObject();
        }
        if ((j & 0x80) != 0) {
            return new BERTaggedObjectParser(j, k, (InputStream) localObject).getDERObject();
        }
        localObject = new ASN1StreamParser((InputStream) localObject, this.limit);
        switch (k) {
            default:
                throw new IOException("unknown BER object encountered");
            case 4:
                return new BEROctetStringParser((ASN1StreamParser) localObject).getDERObject();
            case 16:
                return new BERSequenceParser((ASN1StreamParser) localObject).getDERObject();
            case 17:
                return new BERSetParser((ASN1StreamParser) localObject).getDERObject();
        }
        return new DERExternalParser((ASN1StreamParser) localObject).getDERObject();
        label255:
        return buildObject(j, k, m);
    }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/org/bouncycastle/asn1/ASN1InputStream.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */