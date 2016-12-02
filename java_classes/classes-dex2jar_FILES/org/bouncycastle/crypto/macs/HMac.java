package org.bouncycastle.crypto.macs;

import java.util.Hashtable;
import org.bouncycastle.crypto.CipherParameters;
import org.bouncycastle.crypto.Digest;
import org.bouncycastle.crypto.ExtendedDigest;
import org.bouncycastle.crypto.Mac;
import org.bouncycastle.crypto.params.KeyParameter;

public class HMac
  implements Mac
{
  private static final byte IPAD = 54;
  private static final byte OPAD = 92;
  private static Hashtable blockLengths = new Hashtable();
  private int blockLength;
  private Digest digest;
  private int digestSize;
  private byte[] inputPad;
  private byte[] outputPad;
  
  static
  {
    blockLengths.put("GOST3411", Integer.valueOf(32));
    blockLengths.put("MD2", Integer.valueOf(16));
    blockLengths.put("MD4", Integer.valueOf(64));
    blockLengths.put("MD5", Integer.valueOf(64));
    blockLengths.put("RIPEMD128", Integer.valueOf(64));
    blockLengths.put("RIPEMD160", Integer.valueOf(64));
    blockLengths.put("SHA-1", Integer.valueOf(64));
    blockLengths.put("SHA-224", Integer.valueOf(64));
    blockLengths.put("SHA-256", Integer.valueOf(64));
    blockLengths.put("SHA-384", Integer.valueOf(128));
    blockLengths.put("SHA-512", Integer.valueOf(128));
    blockLengths.put("Tiger", Integer.valueOf(64));
    blockLengths.put("Whirlpool", Integer.valueOf(64));
  }
  
  public HMac(Digest paramDigest)
  {
    this(paramDigest, getByteLength(paramDigest));
  }
  
  private HMac(Digest paramDigest, int paramInt)
  {
    this.digest = paramDigest;
    this.digestSize = paramDigest.getDigestSize();
    this.blockLength = paramInt;
    this.inputPad = new byte[this.blockLength];
    this.outputPad = new byte[this.blockLength];
  }
  
  private static int getByteLength(Digest paramDigest)
  {
    if ((paramDigest instanceof ExtendedDigest)) {
      return ((ExtendedDigest)paramDigest).getByteLength();
    }
    Integer localInteger = (Integer)blockLengths.get(paramDigest.getAlgorithmName());
    if (localInteger == null) {
      throw new IllegalArgumentException("unknown digest passed: " + paramDigest.getAlgorithmName());
    }
    return localInteger.intValue();
  }
  
  public int doFinal(byte[] paramArrayOfByte, int paramInt)
  {
    byte[] arrayOfByte = new byte[this.digestSize];
    this.digest.doFinal(arrayOfByte, 0);
    this.digest.update(this.outputPad, 0, this.outputPad.length);
    this.digest.update(arrayOfByte, 0, arrayOfByte.length);
    paramInt = this.digest.doFinal(paramArrayOfByte, paramInt);
    reset();
    return paramInt;
  }
  
  public String getAlgorithmName()
  {
    return this.digest.getAlgorithmName() + "/HMAC";
  }
  
  public int getMacSize()
  {
    return this.digestSize;
  }
  
  public Digest getUnderlyingDigest()
  {
    return this.digest;
  }
  
  public void init(CipherParameters paramCipherParameters)
  {
    this.digest.reset();
    paramCipherParameters = ((KeyParameter)paramCipherParameters).getKey();
    if (paramCipherParameters.length > this.blockLength)
    {
      this.digest.update(paramCipherParameters, 0, paramCipherParameters.length);
      this.digest.doFinal(this.inputPad, 0);
      i = this.digestSize;
      while (i < this.inputPad.length)
      {
        this.inputPad[i] = 0;
        i += 1;
      }
    }
    System.arraycopy(paramCipherParameters, 0, this.inputPad, 0, paramCipherParameters.length);
    int i = paramCipherParameters.length;
    while (i < this.inputPad.length)
    {
      this.inputPad[i] = 0;
      i += 1;
    }
    this.outputPad = new byte[this.inputPad.length];
    System.arraycopy(this.inputPad, 0, this.outputPad, 0, this.inputPad.length);
    i = 0;
    while (i < this.inputPad.length)
    {
      paramCipherParameters = this.inputPad;
      paramCipherParameters[i] = ((byte)(paramCipherParameters[i] ^ 0x36));
      i += 1;
    }
    i = 0;
    while (i < this.outputPad.length)
    {
      paramCipherParameters = this.outputPad;
      paramCipherParameters[i] = ((byte)(paramCipherParameters[i] ^ 0x5C));
      i += 1;
    }
    this.digest.update(this.inputPad, 0, this.inputPad.length);
  }
  
  public void reset()
  {
    this.digest.reset();
    this.digest.update(this.inputPad, 0, this.inputPad.length);
  }
  
  public void update(byte paramByte)
  {
    this.digest.update(paramByte);
  }
  
  public void update(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
  {
    this.digest.update(paramArrayOfByte, paramInt1, paramInt2);
  }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/org/bouncycastle/crypto/macs/HMac.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */