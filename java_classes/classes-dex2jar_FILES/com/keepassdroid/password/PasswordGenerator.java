package com.keepassdroid.password;

import android.content.Context;
import java.security.SecureRandom;

public class PasswordGenerator
{
  private static final String bracketChars = "[]{}()<>";
  private static final String digitChars = "0123456789";
  private static final String lowerCaseChars = "abcdefghijklmnopqrstuvwxyz";
  private static final String minusChars = "-";
  private static final String spaceChars = " ";
  private static final String specialChars = "!\"#$%&'*+,./:;=?@\\^`";
  private static final String underlineChars = "_";
  private static final String upperCaseChars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
  private Context cxt;
  
  public PasswordGenerator(Context paramContext)
  {
    this.cxt = paramContext;
  }
  
  public String generatePassword(int paramInt, boolean paramBoolean1, boolean paramBoolean2, boolean paramBoolean3, boolean paramBoolean4, boolean paramBoolean5, boolean paramBoolean6, boolean paramBoolean7, boolean paramBoolean8)
    throws IllegalArgumentException
  {
    if (paramInt <= 0) {
      throw new IllegalArgumentException(this.cxt.getString(2131099719));
    }
    if ((!paramBoolean1) && (!paramBoolean2) && (!paramBoolean3) && (!paramBoolean4) && (!paramBoolean5) && (!paramBoolean6) && (!paramBoolean7) && (!paramBoolean8)) {
      throw new IllegalArgumentException(this.cxt.getString(2131099714));
    }
    String str = getCharacterSet(paramBoolean1, paramBoolean2, paramBoolean3, paramBoolean4, paramBoolean5, paramBoolean6, paramBoolean7, paramBoolean8);
    int j = str.length();
    StringBuffer localStringBuffer = new StringBuffer();
    SecureRandom localSecureRandom = new SecureRandom();
    if (j > 0)
    {
      int i = 0;
      while (i < paramInt)
      {
        localStringBuffer.append(str.charAt((char)localSecureRandom.nextInt(j)));
        i += 1;
      }
    }
    return localStringBuffer.toString();
  }
  
  public String getCharacterSet(boolean paramBoolean1, boolean paramBoolean2, boolean paramBoolean3, boolean paramBoolean4, boolean paramBoolean5, boolean paramBoolean6, boolean paramBoolean7, boolean paramBoolean8)
  {
    StringBuffer localStringBuffer = new StringBuffer();
    if (paramBoolean1) {
      localStringBuffer.append("ABCDEFGHIJKLMNOPQRSTUVWXYZ");
    }
    if (paramBoolean2) {
      localStringBuffer.append("abcdefghijklmnopqrstuvwxyz");
    }
    if (paramBoolean3) {
      localStringBuffer.append("0123456789");
    }
    if (paramBoolean4) {
      localStringBuffer.append("-");
    }
    if (paramBoolean5) {
      localStringBuffer.append("_");
    }
    if (paramBoolean6) {
      localStringBuffer.append(" ");
    }
    if (paramBoolean7) {
      localStringBuffer.append("!\"#$%&'*+,./:;=?@\\^`");
    }
    if (paramBoolean8) {
      localStringBuffer.append("[]{}()<>");
    }
    return localStringBuffer.toString();
  }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/com/keepassdroid/password/PasswordGenerator.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */