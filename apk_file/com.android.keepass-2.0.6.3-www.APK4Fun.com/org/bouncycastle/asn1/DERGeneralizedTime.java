package org.bouncycastle.asn1;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.SimpleTimeZone;
import java.util.TimeZone;

public class DERGeneralizedTime
        extends ASN1Object {
    String time;

    public DERGeneralizedTime(String paramString) {
        this.time = paramString;
        try {
            getDate();
            return;
        } catch (ParseException paramString) {
            throw new IllegalArgumentException("invalid date string: " + paramString.getMessage());
        }
    }

    public DERGeneralizedTime(Date paramDate) {
        SimpleDateFormat localSimpleDateFormat = new SimpleDateFormat("yyyyMMddHHmmss'Z'");
        localSimpleDateFormat.setTimeZone(new SimpleTimeZone(0, "Z"));
        this.time = localSimpleDateFormat.format(paramDate);
    }

    DERGeneralizedTime(byte[] paramArrayOfByte) {
        char[] arrayOfChar = new char[paramArrayOfByte.length];
        int i = 0;
        while (i != arrayOfChar.length) {
            arrayOfChar[i] = ((char) (paramArrayOfByte[i] & 0xFF));
            i += 1;
        }
        this.time = new String(arrayOfChar);
    }

    public static DERGeneralizedTime getInstance(Object paramObject) {
        if ((paramObject == null) || ((paramObject instanceof DERGeneralizedTime))) {
            return (DERGeneralizedTime) paramObject;
        }
        if ((paramObject instanceof ASN1OctetString)) {
            return new DERGeneralizedTime(((ASN1OctetString) paramObject).getOctets());
        }
        throw new IllegalArgumentException("illegal object in getInstance: " + paramObject.getClass().getName());
    }

    public static DERGeneralizedTime getInstance(ASN1TaggedObject paramASN1TaggedObject, boolean paramBoolean) {
        return getInstance(paramASN1TaggedObject.getObject());
    }

    private String calculateGMTOffset() {
        String str = "+";
        TimeZone localTimeZone = TimeZone.getDefault();
        j = localTimeZone.getRawOffset();
        i = j;
        if (j < 0) {
            str = "-";
            i = -j;
        }
        j = i / 3600000;
        int k = (i - j * 60 * 60 * 1000) / 60000;
        for (i = j; ; i = -1) {
            try {
                if (localTimeZone.useDaylightTime()) {
                    i = j;
                    if (localTimeZone.inDaylightTime(getDate())) {
                        boolean bool = str.equals("+");
                        if (!bool) {
                            continue;
                        }
                        i = 1;
                        i = j + i;
                    }
                }
            } catch (ParseException localParseException) {
                for (; ; ) {
                    i = j;
                }
            }
            return "GMT" + str + convert(i) + ":" + convert(k);
        }
    }

    private String convert(int paramInt) {
        if (paramInt < 10) {
            return "0" + paramInt;
        }
        return Integer.toString(paramInt);
    }

    private byte[] getOctets() {
        char[] arrayOfChar = this.time.toCharArray();
        byte[] arrayOfByte = new byte[arrayOfChar.length];
        int i = 0;
        while (i != arrayOfChar.length) {
            arrayOfByte[i] = ((byte) arrayOfChar[i]);
            i += 1;
        }
        return arrayOfByte;
    }

    private boolean hasFractionalSeconds() {
        return this.time.indexOf('.') == 14;
    }

    boolean asn1Equals(DERObject paramDERObject) {
        if (!(paramDERObject instanceof DERGeneralizedTime)) {
            return false;
        }
        return this.time.equals(((DERGeneralizedTime) paramDERObject).time);
    }

    void encode(DEROutputStream paramDEROutputStream)
            throws IOException {
        paramDEROutputStream.writeEncoded(24, getOctets());
    }

    public Date getDate()
            throws ParseException {
        String str1 = this.time;
        SimpleDateFormat localSimpleDateFormat;
        String str2;
        String str3;
        int i;
        if (this.time.endsWith("Z")) {
            if (hasFractionalSeconds()) {
                localSimpleDateFormat = new SimpleDateFormat("yyyyMMddHHmmss.SSS'Z'");
                localSimpleDateFormat.setTimeZone(new SimpleTimeZone(0, "Z"));
                str2 = str1;
                if (hasFractionalSeconds()) {
                    str3 = str1.substring(14);
                    i = 1;
                }
            }
        }
        for (; ; ) {
            if (i < str3.length()) {
                int j = str3.charAt(i);
                if ((48 <= j) && (j <= 57)) {
                }
            } else {
                str2 = str1;
                if (i - 1 > 3) {
                    str2 = str3.substring(0, 4) + str3.substring(i);
                    str2 = str1.substring(0, 14) + str2;
                }
                return localSimpleDateFormat.parse(str2);
                localSimpleDateFormat = new SimpleDateFormat("yyyyMMddHHmmss'Z'");
                break;
                if ((this.time.indexOf('-') > 0) || (this.time.indexOf('+') > 0)) {
                    str1 = getTime();
                    if (hasFractionalSeconds()) {
                    }
                    for (localSimpleDateFormat = new SimpleDateFormat("yyyyMMddHHmmss.SSSz"); ; localSimpleDateFormat = new SimpleDateFormat("yyyyMMddHHmmssz")) {
                        localSimpleDateFormat.setTimeZone(new SimpleTimeZone(0, "Z"));
                        break;
                    }
                }
                if (hasFractionalSeconds()) {
                }
                for (localSimpleDateFormat = new SimpleDateFormat("yyyyMMddHHmmss.SSS"); ; localSimpleDateFormat = new SimpleDateFormat("yyyyMMddHHmmss")) {
                    localSimpleDateFormat.setTimeZone(new SimpleTimeZone(0, TimeZone.getDefault().getID()));
                    break;
                }
            }
            i += 1;
        }
    }

    public String getTime() {
        if (this.time.charAt(this.time.length() - 1) == 'Z') {
            return this.time.substring(0, this.time.length() - 1) + "GMT+00:00";
        }
        int i = this.time.length() - 5;
        int j = this.time.charAt(i);
        if ((j == 45) || (j == 43)) {
            return this.time.substring(0, i) + "GMT" + this.time.substring(i, i + 3) + ":" + this.time.substring(i + 3);
        }
        i = this.time.length() - 3;
        j = this.time.charAt(i);
        if ((j == 45) || (j == 43)) {
            return this.time.substring(0, i) + "GMT" + this.time.substring(i) + ":00";
        }
        return this.time + calculateGMTOffset();
    }

    public String getTimeString() {
        return this.time;
    }

    public int hashCode() {
        return this.time.hashCode();
    }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/org/bouncycastle/asn1/DERGeneralizedTime.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */