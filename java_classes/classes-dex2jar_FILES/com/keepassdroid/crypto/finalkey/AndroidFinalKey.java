package com.keepassdroid.crypto.finalkey;

public class AndroidFinalKey
  extends FinalKey
{
  /* Error */
  public byte[] transformMasterKey(byte[] paramArrayOfByte1, byte[] paramArrayOfByte2, int paramInt)
    throws java.io.IOException
  {
    // Byte code:
    //   0: ldc 23
    //   2: invokestatic 29	javax/crypto/Cipher:getInstance	(Ljava/lang/String;)Ljavax/crypto/Cipher;
    //   5: astore 5
    //   7: aload 5
    //   9: iconst_1
    //   10: new 31	javax/crypto/spec/SecretKeySpec
    //   13: dup
    //   14: aload_1
    //   15: ldc 33
    //   17: invokespecial 36	javax/crypto/spec/SecretKeySpec:<init>	([BLjava/lang/String;)V
    //   20: invokevirtual 40	javax/crypto/Cipher:init	(ILjava/security/Key;)V
    //   23: aload_2
    //   24: arraylength
    //   25: newarray <illegal type>
    //   27: astore_1
    //   28: aload_2
    //   29: iconst_0
    //   30: aload_1
    //   31: iconst_0
    //   32: aload_2
    //   33: arraylength
    //   34: invokestatic 46	java/lang/System:arraycopy	(Ljava/lang/Object;ILjava/lang/Object;II)V
    //   37: aload_2
    //   38: arraylength
    //   39: newarray <illegal type>
    //   41: astore_2
    //   42: iconst_0
    //   43: istore 4
    //   45: iload 4
    //   47: iload_3
    //   48: if_icmpge +157 -> 205
    //   51: aload 5
    //   53: aload_1
    //   54: iconst_0
    //   55: aload_1
    //   56: arraylength
    //   57: aload_2
    //   58: iconst_0
    //   59: invokevirtual 50	javax/crypto/Cipher:update	([BII[BI)I
    //   62: pop
    //   63: aload_2
    //   64: iconst_0
    //   65: aload_1
    //   66: iconst_0
    //   67: aload_1
    //   68: arraylength
    //   69: invokestatic 46	java/lang/System:arraycopy	(Ljava/lang/Object;ILjava/lang/Object;II)V
    //   72: iload 4
    //   74: iconst_1
    //   75: iadd
    //   76: istore 4
    //   78: goto -33 -> 45
    //   81: astore_1
    //   82: new 13	java/io/IOException
    //   85: dup
    //   86: new 52	java/lang/StringBuilder
    //   89: dup
    //   90: invokespecial 53	java/lang/StringBuilder:<init>	()V
    //   93: ldc 55
    //   95: invokevirtual 59	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   98: aload_1
    //   99: invokevirtual 63	java/security/NoSuchAlgorithmException:getMessage	()Ljava/lang/String;
    //   102: invokevirtual 59	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   105: invokevirtual 66	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   108: invokespecial 69	java/io/IOException:<init>	(Ljava/lang/String;)V
    //   111: athrow
    //   112: astore_1
    //   113: new 13	java/io/IOException
    //   116: dup
    //   117: new 52	java/lang/StringBuilder
    //   120: dup
    //   121: invokespecial 53	java/lang/StringBuilder:<init>	()V
    //   124: ldc 71
    //   126: invokevirtual 59	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   129: aload_1
    //   130: invokevirtual 72	javax/crypto/NoSuchPaddingException:getMessage	()Ljava/lang/String;
    //   133: invokevirtual 59	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   136: invokevirtual 66	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   139: invokespecial 69	java/io/IOException:<init>	(Ljava/lang/String;)V
    //   142: athrow
    //   143: astore_1
    //   144: new 13	java/io/IOException
    //   147: dup
    //   148: new 52	java/lang/StringBuilder
    //   151: dup
    //   152: invokespecial 53	java/lang/StringBuilder:<init>	()V
    //   155: ldc 74
    //   157: invokevirtual 59	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   160: aload_1
    //   161: invokevirtual 75	java/security/InvalidKeyException:getMessage	()Ljava/lang/String;
    //   164: invokevirtual 59	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   167: invokevirtual 66	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   170: invokespecial 69	java/io/IOException:<init>	(Ljava/lang/String;)V
    //   173: athrow
    //   174: astore_1
    //   175: new 13	java/io/IOException
    //   178: dup
    //   179: new 52	java/lang/StringBuilder
    //   182: dup
    //   183: invokespecial 53	java/lang/StringBuilder:<init>	()V
    //   186: ldc 77
    //   188: invokevirtual 59	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   191: aload_1
    //   192: invokevirtual 78	javax/crypto/ShortBufferException:getMessage	()Ljava/lang/String;
    //   195: invokevirtual 59	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   198: invokevirtual 66	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   201: invokespecial 69	java/io/IOException:<init>	(Ljava/lang/String;)V
    //   204: athrow
    //   205: ldc 80
    //   207: invokestatic 85	java/security/MessageDigest:getInstance	(Ljava/lang/String;)Ljava/security/MessageDigest;
    //   210: astore_2
    //   211: aload_2
    //   212: aload_1
    //   213: invokevirtual 88	java/security/MessageDigest:update	([B)V
    //   216: aload_2
    //   217: invokevirtual 92	java/security/MessageDigest:digest	()[B
    //   220: areturn
    //   221: astore_1
    //   222: new 13	java/io/IOException
    //   225: dup
    //   226: new 52	java/lang/StringBuilder
    //   229: dup
    //   230: invokespecial 53	java/lang/StringBuilder:<init>	()V
    //   233: ldc 94
    //   235: invokevirtual 59	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   238: aload_1
    //   239: invokevirtual 63	java/security/NoSuchAlgorithmException:getMessage	()Ljava/lang/String;
    //   242: invokevirtual 59	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   245: invokevirtual 66	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   248: invokespecial 69	java/io/IOException:<init>	(Ljava/lang/String;)V
    //   251: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	252	0	this	AndroidFinalKey
    //   0	252	1	paramArrayOfByte1	byte[]
    //   0	252	2	paramArrayOfByte2	byte[]
    //   0	252	3	paramInt	int
    //   43	34	4	i	int
    //   5	47	5	localCipher	javax.crypto.Cipher
    // Exception table:
    //   from	to	target	type
    //   0	7	81	java/security/NoSuchAlgorithmException
    //   0	7	112	javax/crypto/NoSuchPaddingException
    //   7	23	143	java/security/InvalidKeyException
    //   51	72	174	javax/crypto/ShortBufferException
    //   205	211	221	java/security/NoSuchAlgorithmException
  }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/com/keepassdroid/crypto/finalkey/AndroidFinalKey.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */