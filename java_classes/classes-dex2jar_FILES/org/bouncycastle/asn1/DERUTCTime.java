package org.bouncycastle.asn1;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.SimpleTimeZone;

public class DERUTCTime
  extends ASN1Object
{
  String time;
  
  public DERUTCTime(String paramString)
  {
    this.time = paramString;
    try
    {
      getDate();
      return;
    }
    catch (ParseException paramString)
    {
      throw new IllegalArgumentException("invalid date string: " + paramString.getMessage());
    }
  }
  
  public DERUTCTime(Date paramDate)
  {
    SimpleDateFormat localSimpleDateFormat = new SimpleDateFormat("yyMMddHHmmss'Z'");
    localSimpleDateFormat.setTimeZone(new SimpleTimeZone(0, "Z"));
    this.time = localSimpleDateFormat.format(paramDate);
  }
  
  DERUTCTime(byte[] paramArrayOfByte)
  {
    char[] arrayOfChar = new char[paramArrayOfByte.length];
    int i = 0;
    while (i != arrayOfChar.length)
    {
      arrayOfChar[i] = ((char)(paramArrayOfByte[i] & 0xFF));
      i += 1;
    }
    this.time = new String(arrayOfChar);
  }
  
  public static DERUTCTime getInstance(Object paramObject)
  {
    if ((paramObject == null) || ((paramObject instanceof DERUTCTime))) {
      return (DERUTCTime)paramObject;
    }
    if ((paramObject instanceof ASN1OctetString)) {
      return new DERUTCTime(((ASN1OctetString)paramObject).getOctets());
    }
    throw new IllegalArgumentException("illegal object in getInstance: " + paramObject.getClass().getName());
  }
  
  public static DERUTCTime getInstance(ASN1TaggedObject paramASN1TaggedObject, boolean paramBoolean)
  {
    return getInstance(paramASN1TaggedObject.getObject());
  }
  
  private byte[] getOctets()
  {
    char[] arrayOfChar = this.time.toCharArray();
    byte[] arrayOfByte = new byte[arrayOfChar.length];
    int i = 0;
    while (i != arrayOfChar.length)
    {
      arrayOfByte[i] = ((byte)arrayOfChar[i]);
      i += 1;
    }
    return arrayOfByte;
  }
  
  boolean asn1Equals(DERObject paramDERObject)
  {
    if (!(paramDERObject instanceof DERUTCTime)) {
      return false;
    }
    return this.time.equals(((DERUTCTime)paramDERObject).time);
  }
  
  void encode(DEROutputStream paramDEROutputStream)
    throws IOException
  {
    paramDEROutputStream.writeEncoded(23, getOctets());
  }
  
  public Date getAdjustedDate()
    throws ParseException
  {
    SimpleDateFormat localSimpleDateFormat = new SimpleDateFormat("yyyyMMddHHmmssz");
    localSimpleDateFormat.setTimeZone(new SimpleTimeZone(0, "Z"));
    return localSimpleDateFormat.parse(getAdjustedTime());
  }
  
  public String getAdjustedTime()
  {
    String str = getTime();
    if (str.charAt(0) < '5') {
      return "20" + str;
    }
    return "19" + str;
  }
  
  public Date getDate()
    throws ParseException
  {
    return new SimpleDateFormat("yyMMddHHmmssz").parse(getTime());
  }
  
  public String getTime()
  {
    if ((this.time.indexOf('-') < 0) && (this.time.indexOf('+') < 0))
    {
      if (this.time.length() == 11) {
        return this.time.substring(0, 10) + "00GMT+00:00";
      }
      return this.time.substring(0, 12) + "GMT+00:00";
    }
    int j = this.time.indexOf('-');
    int i = j;
    if (j < 0) {
      i = this.time.indexOf('+');
    }
    String str2 = this.time;
    String str1 = str2;
    if (i == this.time.length() - 3) {
      str1 = str2 + "00";
    }
    if (i == 10) {
      return str1.substring(0, 10) + "00GMT" + str1.substring(10, 13) + ":" + str1.substring(13, 15);
    }
    return str1.substring(0, 12) + "GMT" + str1.substring(12, 15) + ":" + str1.substring(15, 17);
  }
  
  public int hashCode()
  {
    return this.time.hashCode();
  }
  
  public String toString()
  {
    return this.time;
  }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/org/bouncycastle/asn1/DERUTCTime.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */