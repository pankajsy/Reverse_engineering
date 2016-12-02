package org.bouncycastle.asn1.util;

import org.bouncycastle.asn1.ASN1OctetString;
import org.bouncycastle.asn1.ASN1Sequence;
import org.bouncycastle.asn1.ASN1Set;
import org.bouncycastle.asn1.BERApplicationSpecific;
import org.bouncycastle.asn1.BERConstructedOctetString;
import org.bouncycastle.asn1.BERConstructedSequence;
import org.bouncycastle.asn1.BERSequence;
import org.bouncycastle.asn1.BERSet;
import org.bouncycastle.asn1.BERTaggedObject;
import org.bouncycastle.asn1.DERApplicationSpecific;
import org.bouncycastle.asn1.DERBMPString;
import org.bouncycastle.asn1.DERBitString;
import org.bouncycastle.asn1.DERBoolean;
import org.bouncycastle.asn1.DERConstructedSequence;
import org.bouncycastle.asn1.DERConstructedSet;
import org.bouncycastle.asn1.DEREncodable;
import org.bouncycastle.asn1.DEREnumerated;
import org.bouncycastle.asn1.DERExternal;
import org.bouncycastle.asn1.DERGeneralizedTime;
import org.bouncycastle.asn1.DERIA5String;
import org.bouncycastle.asn1.DERInteger;
import org.bouncycastle.asn1.DERNull;
import org.bouncycastle.asn1.DERObject;
import org.bouncycastle.asn1.DERObjectIdentifier;
import org.bouncycastle.asn1.DEROctetString;
import org.bouncycastle.asn1.DERPrintableString;
import org.bouncycastle.asn1.DERSequence;
import org.bouncycastle.asn1.DERSet;
import org.bouncycastle.asn1.DERT61String;
import org.bouncycastle.asn1.DERTaggedObject;
import org.bouncycastle.asn1.DERUTCTime;
import org.bouncycastle.asn1.DERUTF8String;
import org.bouncycastle.asn1.DERUnknownTag;
import org.bouncycastle.asn1.DERVisibleString;
import org.bouncycastle.util.encoders.Hex;

import java.io.IOException;
import java.util.Enumeration;

public class ASN1Dump {
    private static final int SAMPLE_SIZE = 32;
    private static final String TAB = "    ";

    static void _dumpAsString(String paramString, boolean paramBoolean, DERObject paramDERObject, StringBuffer paramStringBuffer) {
        String str1 = System.getProperty("line.separator");
        Object localObject;
        if ((paramDERObject instanceof ASN1Sequence)) {
            localObject = ((ASN1Sequence) paramDERObject).getObjects();
            String str2 = paramString + "    ";
            paramStringBuffer.append(paramString);
            if ((paramDERObject instanceof BERConstructedSequence)) {
                paramStringBuffer.append("BER ConstructedSequence");
                paramStringBuffer.append(str1);
            }
            for (; ; ) {
                if (!((Enumeration) localObject).hasMoreElements()) {
                    break label353;
                }
                paramString = ((Enumeration) localObject).nextElement();
                if ((paramString == null) || (paramString.equals(new DERNull()))) {
                    paramStringBuffer.append(str2);
                    paramStringBuffer.append("NULL");
                    paramStringBuffer.append(str1);
                    continue;
                    if ((paramDERObject instanceof DERConstructedSequence)) {
                        paramStringBuffer.append("DER ConstructedSequence");
                        break;
                    }
                    if ((paramDERObject instanceof BERSequence)) {
                        paramStringBuffer.append("BER Sequence");
                        break;
                    }
                    if ((paramDERObject instanceof DERSequence)) {
                        paramStringBuffer.append("DER Sequence");
                        break;
                    }
                    paramStringBuffer.append("Sequence");
                    break;
                }
                if ((paramString instanceof DERObject)) {
                    _dumpAsString(str2, paramBoolean, (DERObject) paramString, paramStringBuffer);
                } else {
                    _dumpAsString(str2, paramBoolean, ((DEREncodable) paramString).getDERObject(), paramStringBuffer);
                }
            }
        }
        if ((paramDERObject instanceof DERTaggedObject)) {
            localObject = paramString + "    ";
            paramStringBuffer.append(paramString);
            if ((paramDERObject instanceof BERTaggedObject)) {
                paramStringBuffer.append("BER Tagged [");
                paramString = (DERTaggedObject) paramDERObject;
                paramStringBuffer.append(Integer.toString(paramString.getTagNo()));
                paramStringBuffer.append(']');
                if (!paramString.isExplicit()) {
                    paramStringBuffer.append(" IMPLICIT ");
                }
                paramStringBuffer.append(str1);
                if (!paramString.isEmpty()) {
                    break label364;
                }
                paramStringBuffer.append((String) localObject);
                paramStringBuffer.append("EMPTY");
                paramStringBuffer.append(str1);
            }
        }
        for (; ; ) {
            label353:
            return;
            paramStringBuffer.append("Tagged [");
            break;
            label364:
            _dumpAsString((String) localObject, paramBoolean, paramString.getObject(), paramStringBuffer);
            return;
            if ((paramDERObject instanceof DERConstructedSet)) {
                paramDERObject = ((ASN1Set) paramDERObject).getObjects();
                localObject = paramString + "    ";
                paramStringBuffer.append(paramString);
                paramStringBuffer.append("ConstructedSet");
                paramStringBuffer.append(str1);
                while (paramDERObject.hasMoreElements()) {
                    paramString = paramDERObject.nextElement();
                    if (paramString == null) {
                        paramStringBuffer.append((String) localObject);
                        paramStringBuffer.append("NULL");
                        paramStringBuffer.append(str1);
                    } else if ((paramString instanceof DERObject)) {
                        _dumpAsString((String) localObject, paramBoolean, (DERObject) paramString, paramStringBuffer);
                    } else {
                        _dumpAsString((String) localObject, paramBoolean, ((DEREncodable) paramString).getDERObject(), paramStringBuffer);
                    }
                }
            } else if ((paramDERObject instanceof BERSet)) {
                paramDERObject = ((ASN1Set) paramDERObject).getObjects();
                localObject = paramString + "    ";
                paramStringBuffer.append(paramString);
                paramStringBuffer.append("BER Set");
                paramStringBuffer.append(str1);
                while (paramDERObject.hasMoreElements()) {
                    paramString = paramDERObject.nextElement();
                    if (paramString == null) {
                        paramStringBuffer.append((String) localObject);
                        paramStringBuffer.append("NULL");
                        paramStringBuffer.append(str1);
                    } else if ((paramString instanceof DERObject)) {
                        _dumpAsString((String) localObject, paramBoolean, (DERObject) paramString, paramStringBuffer);
                    } else {
                        _dumpAsString((String) localObject, paramBoolean, ((DEREncodable) paramString).getDERObject(), paramStringBuffer);
                    }
                }
            } else {
                if (!(paramDERObject instanceof DERSet)) {
                    break label796;
                }
                paramDERObject = ((ASN1Set) paramDERObject).getObjects();
                localObject = paramString + "    ";
                paramStringBuffer.append(paramString);
                paramStringBuffer.append("DER Set");
                paramStringBuffer.append(str1);
                while (paramDERObject.hasMoreElements()) {
                    paramString = paramDERObject.nextElement();
                    if (paramString == null) {
                        paramStringBuffer.append((String) localObject);
                        paramStringBuffer.append("NULL");
                        paramStringBuffer.append(str1);
                    } else if ((paramString instanceof DERObject)) {
                        _dumpAsString((String) localObject, paramBoolean, (DERObject) paramString, paramStringBuffer);
                    } else {
                        _dumpAsString((String) localObject, paramBoolean, ((DEREncodable) paramString).getDERObject(), paramStringBuffer);
                    }
                }
            }
        }
        label796:
        if ((paramDERObject instanceof DERObjectIdentifier)) {
            paramStringBuffer.append(paramString + "ObjectIdentifier(" + ((DERObjectIdentifier) paramDERObject).getId() + ")" + str1);
            return;
        }
        if ((paramDERObject instanceof DERBoolean)) {
            paramStringBuffer.append(paramString + "Boolean(" + ((DERBoolean) paramDERObject).isTrue() + ")" + str1);
            return;
        }
        if ((paramDERObject instanceof DERInteger)) {
            paramStringBuffer.append(paramString + "Integer(" + ((DERInteger) paramDERObject).getValue() + ")" + str1);
            return;
        }
        if ((paramDERObject instanceof BERConstructedOctetString)) {
            paramDERObject = (ASN1OctetString) paramDERObject;
            paramStringBuffer.append(paramString + "BER Constructed Octet String" + "[" + paramDERObject.getOctets().length + "] ");
            if (paramBoolean) {
                paramStringBuffer.append(dumpBinaryDataAsString(paramString, paramDERObject.getOctets()));
                return;
            }
            paramStringBuffer.append(str1);
            return;
        }
        if ((paramDERObject instanceof DEROctetString)) {
            paramDERObject = (ASN1OctetString) paramDERObject;
            paramStringBuffer.append(paramString + "DER Octet String" + "[" + paramDERObject.getOctets().length + "] ");
            if (paramBoolean) {
                paramStringBuffer.append(dumpBinaryDataAsString(paramString, paramDERObject.getOctets()));
                return;
            }
            paramStringBuffer.append(str1);
            return;
        }
        if ((paramDERObject instanceof DERBitString)) {
            paramDERObject = (DERBitString) paramDERObject;
            paramStringBuffer.append(paramString + "DER Bit String" + "[" + paramDERObject.getBytes().length + ", " + paramDERObject.getPadBits() + "] ");
            if (paramBoolean) {
                paramStringBuffer.append(dumpBinaryDataAsString(paramString, paramDERObject.getBytes()));
                return;
            }
            paramStringBuffer.append(str1);
            return;
        }
        if ((paramDERObject instanceof DERIA5String)) {
            paramStringBuffer.append(paramString + "IA5String(" + ((DERIA5String) paramDERObject).getString() + ") " + str1);
            return;
        }
        if ((paramDERObject instanceof DERUTF8String)) {
            paramStringBuffer.append(paramString + "UTF8String(" + ((DERUTF8String) paramDERObject).getString() + ") " + str1);
            return;
        }
        if ((paramDERObject instanceof DERPrintableString)) {
            paramStringBuffer.append(paramString + "PrintableString(" + ((DERPrintableString) paramDERObject).getString() + ") " + str1);
            return;
        }
        if ((paramDERObject instanceof DERVisibleString)) {
            paramStringBuffer.append(paramString + "VisibleString(" + ((DERVisibleString) paramDERObject).getString() + ") " + str1);
            return;
        }
        if ((paramDERObject instanceof DERBMPString)) {
            paramStringBuffer.append(paramString + "BMPString(" + ((DERBMPString) paramDERObject).getString() + ") " + str1);
            return;
        }
        if ((paramDERObject instanceof DERT61String)) {
            paramStringBuffer.append(paramString + "T61String(" + ((DERT61String) paramDERObject).getString() + ") " + str1);
            return;
        }
        if ((paramDERObject instanceof DERUTCTime)) {
            paramStringBuffer.append(paramString + "UTCTime(" + ((DERUTCTime) paramDERObject).getTime() + ") " + str1);
            return;
        }
        if ((paramDERObject instanceof DERGeneralizedTime)) {
            paramStringBuffer.append(paramString + "GeneralizedTime(" + ((DERGeneralizedTime) paramDERObject).getTime() + ") " + str1);
            return;
        }
        if ((paramDERObject instanceof DERUnknownTag)) {
            paramStringBuffer.append(paramString + "Unknown " + Integer.toString(((DERUnknownTag) paramDERObject).getTag(), 16) + " " + new String(Hex.encode(((DERUnknownTag) paramDERObject).getData())) + str1);
            return;
        }
        if ((paramDERObject instanceof BERApplicationSpecific)) {
            paramStringBuffer.append(outputApplicationSpecific("BER", paramString, paramBoolean, paramDERObject, str1));
            return;
        }
        if ((paramDERObject instanceof DERApplicationSpecific)) {
            paramStringBuffer.append(outputApplicationSpecific("DER", paramString, paramBoolean, paramDERObject, str1));
            return;
        }
        if ((paramDERObject instanceof DEREnumerated)) {
            paramDERObject = (DEREnumerated) paramDERObject;
            paramStringBuffer.append(paramString + "DER Enumerated(" + paramDERObject.getValue() + ")" + str1);
            return;
        }
        if ((paramDERObject instanceof DERExternal)) {
            paramDERObject = (DERExternal) paramDERObject;
            paramStringBuffer.append(paramString + "External " + str1);
            paramString = paramString + "    ";
            if (paramDERObject.getDirectReference() != null) {
                paramStringBuffer.append(paramString + "Direct Reference: " + paramDERObject.getDirectReference().getId() + str1);
            }
            if (paramDERObject.getIndirectReference() != null) {
                paramStringBuffer.append(paramString + "Indirect Reference: " + paramDERObject.getIndirectReference().toString() + str1);
            }
            if (paramDERObject.getDataValueDescriptor() != null) {
                _dumpAsString(paramString, paramBoolean, paramDERObject.getDataValueDescriptor(), paramStringBuffer);
            }
            paramStringBuffer.append(paramString + "Encoding: " + paramDERObject.getEncoding() + str1);
            _dumpAsString(paramString, paramBoolean, paramDERObject.getExternalContent(), paramStringBuffer);
            return;
        }
        paramStringBuffer.append(paramString + paramDERObject.toString() + str1);
    }

    private static String calculateAscString(byte[] paramArrayOfByte, int paramInt1, int paramInt2) {
        StringBuffer localStringBuffer = new StringBuffer();
        int i = paramInt1;
        while (i != paramInt1 + paramInt2) {
            if ((paramArrayOfByte[i] >= 32) && (paramArrayOfByte[i] <= 126)) {
                localStringBuffer.append((char) paramArrayOfByte[i]);
            }
            i += 1;
        }
        return localStringBuffer.toString();
    }

    public static String dumpAsString(Object paramObject) {
        return dumpAsString(paramObject, false);
    }

    public static String dumpAsString(Object paramObject, boolean paramBoolean) {
        StringBuffer localStringBuffer = new StringBuffer();
        if ((paramObject instanceof DERObject)) {
            _dumpAsString("", paramBoolean, (DERObject) paramObject, localStringBuffer);
        }
        for (; ; ) {
            return localStringBuffer.toString();
            if (!(paramObject instanceof DEREncodable)) {
                break;
            }
            _dumpAsString("", paramBoolean, ((DEREncodable) paramObject).getDERObject(), localStringBuffer);
        }
        return "unknown object type " + paramObject.toString();
    }

    private static String dumpBinaryDataAsString(String paramString, byte[] paramArrayOfByte) {
        String str = System.getProperty("line.separator");
        StringBuffer localStringBuffer = new StringBuffer();
        paramString = paramString + "    ";
        localStringBuffer.append(str);
        int i = 0;
        if (i < paramArrayOfByte.length) {
            if (paramArrayOfByte.length - i > 32) {
                localStringBuffer.append(paramString);
                localStringBuffer.append(new String(Hex.encode(paramArrayOfByte, i, 32)));
                localStringBuffer.append("    ");
                localStringBuffer.append(calculateAscString(paramArrayOfByte, i, 32));
                localStringBuffer.append(str);
            }
            for (; ; ) {
                i += 32;
                break;
                localStringBuffer.append(paramString);
                localStringBuffer.append(new String(Hex.encode(paramArrayOfByte, i, paramArrayOfByte.length - i)));
                int j = paramArrayOfByte.length - i;
                while (j != 32) {
                    localStringBuffer.append("  ");
                    j += 1;
                }
                localStringBuffer.append("    ");
                localStringBuffer.append(calculateAscString(paramArrayOfByte, i, paramArrayOfByte.length - i));
                localStringBuffer.append(str);
            }
        }
        return localStringBuffer.toString();
    }

    private static String outputApplicationSpecific(String paramString1, String paramString2, boolean paramBoolean, DERObject paramDERObject, String paramString3) {
        DERApplicationSpecific localDERApplicationSpecific = (DERApplicationSpecific) paramDERObject;
        paramDERObject = new StringBuffer();
        if (localDERApplicationSpecific.isConstructed()) {
            try {
                ASN1Sequence localASN1Sequence = ASN1Sequence.getInstance(localDERApplicationSpecific.getObject(16));
                paramDERObject.append(paramString2 + paramString1 + " ApplicationSpecific[" + localDERApplicationSpecific.getApplicationTag() + "]" + paramString3);
                paramString1 = localASN1Sequence.getObjects();
                while (paramString1.hasMoreElements()) {
                    _dumpAsString(paramString2 + "    ", paramBoolean, (DERObject) paramString1.nextElement(), paramDERObject);
                }
                return paramDERObject.toString();
            } catch (IOException paramString1) {
                paramDERObject.append(paramString1);
            }
        }
        return paramString2 + paramString1 + " ApplicationSpecific[" + localDERApplicationSpecific.getApplicationTag() + "] (" + new String(Hex.encode(localDERApplicationSpecific.getContents())) + ")" + paramString3;
    }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/org/bouncycastle/asn1/util/ASN1Dump.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */