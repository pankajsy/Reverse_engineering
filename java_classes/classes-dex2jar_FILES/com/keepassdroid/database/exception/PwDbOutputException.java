package com.keepassdroid.database.exception;

public class PwDbOutputException
  extends Exception
{
  private static final long serialVersionUID = 3321212743159473368L;
  
  public PwDbOutputException(Exception paramException)
  {
    super(paramException);
  }
  
  public PwDbOutputException(String paramString)
  {
    super(paramString);
  }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/com/keepassdroid/database/exception/PwDbOutputException.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */