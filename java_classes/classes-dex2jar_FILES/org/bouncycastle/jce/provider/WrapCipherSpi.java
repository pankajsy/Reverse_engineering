package org.bouncycastle.jce.provider;

import java.io.PrintStream;
import java.security.AlgorithmParameters;
import java.security.InvalidAlgorithmParameterException;
import java.security.InvalidKeyException;
import java.security.Key;
import java.security.KeyFactory;
import java.security.NoSuchAlgorithmException;
import java.security.NoSuchProviderException;
import java.security.SecureRandom;
import java.security.spec.AlgorithmParameterSpec;
import java.security.spec.InvalidKeySpecException;
import java.security.spec.PKCS8EncodedKeySpec;
import java.security.spec.X509EncodedKeySpec;
import javax.crypto.BadPaddingException;
import javax.crypto.CipherSpi;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import javax.crypto.ShortBufferException;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.PBEParameterSpec;
import javax.crypto.spec.RC2ParameterSpec;
import javax.crypto.spec.RC5ParameterSpec;
import javax.crypto.spec.SecretKeySpec;
import org.bouncycastle.crypto.CipherParameters;
import org.bouncycastle.crypto.InvalidCipherTextException;
import org.bouncycastle.crypto.Wrapper;
import org.bouncycastle.crypto.params.KeyParameter;
import org.bouncycastle.crypto.params.ParametersWithIV;

public abstract class WrapCipherSpi
  extends CipherSpi
  implements PBE
{
  private Class[] availableSpecs = { IvParameterSpec.class, PBEParameterSpec.class, RC2ParameterSpec.class, RC5ParameterSpec.class };
  protected AlgorithmParameters engineParams = null;
  private byte[] iv;
  private int ivSize;
  protected int pbeHash = 1;
  protected int pbeIvSize;
  protected int pbeKeySize;
  protected int pbeType = 2;
  protected Wrapper wrapEngine = null;
  
  protected WrapCipherSpi() {}
  
  protected WrapCipherSpi(Wrapper paramWrapper)
  {
    this(paramWrapper, 0);
  }
  
  protected WrapCipherSpi(Wrapper paramWrapper, int paramInt)
  {
    this.wrapEngine = paramWrapper;
    this.ivSize = paramInt;
  }
  
  protected int engineDoFinal(byte[] paramArrayOfByte1, int paramInt1, int paramInt2, byte[] paramArrayOfByte2, int paramInt3)
    throws IllegalBlockSizeException, BadPaddingException
  {
    return 0;
  }
  
  protected byte[] engineDoFinal(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
    throws IllegalBlockSizeException, BadPaddingException
  {
    return null;
  }
  
  protected int engineGetBlockSize()
  {
    return 0;
  }
  
  protected byte[] engineGetIV()
  {
    return (byte[])this.iv.clone();
  }
  
  protected int engineGetKeySize(Key paramKey)
  {
    return paramKey.getEncoded().length;
  }
  
  protected int engineGetOutputSize(int paramInt)
  {
    return -1;
  }
  
  protected AlgorithmParameters engineGetParameters()
  {
    return null;
  }
  
  protected void engineInit(int paramInt, Key paramKey, AlgorithmParameters paramAlgorithmParameters, SecureRandom paramSecureRandom)
    throws InvalidKeyException, InvalidAlgorithmParameterException
  {
    Object localObject2 = null;
    Object localObject3 = null;
    if (paramAlgorithmParameters != null)
    {
      int i = 0;
      for (;;)
      {
        Object localObject1 = localObject3;
        if (i != this.availableSpecs.length) {}
        try
        {
          localObject1 = paramAlgorithmParameters.getParameterSpec(this.availableSpecs[i]);
          localObject2 = localObject1;
          if (localObject1 != null) {
            break;
          }
          throw new InvalidAlgorithmParameterException("can't handle parameter " + paramAlgorithmParameters.toString());
        }
        catch (Exception localException)
        {
          i += 1;
        }
      }
    }
    this.engineParams = paramAlgorithmParameters;
    engineInit(paramInt, paramKey, (AlgorithmParameterSpec)localObject2, paramSecureRandom);
  }
  
  protected void engineInit(int paramInt, Key paramKey, SecureRandom paramSecureRandom)
    throws InvalidKeyException
  {
    try
    {
      engineInit(paramInt, paramKey, (AlgorithmParameterSpec)null, paramSecureRandom);
      return;
    }
    catch (InvalidAlgorithmParameterException paramKey)
    {
      throw new IllegalArgumentException(paramKey.getMessage());
    }
  }
  
  protected void engineInit(int paramInt, Key paramKey, AlgorithmParameterSpec paramAlgorithmParameterSpec, SecureRandom paramSecureRandom)
    throws InvalidKeyException, InvalidAlgorithmParameterException
  {
    if ((paramKey instanceof JCEPBEKey))
    {
      paramKey = (JCEPBEKey)paramKey;
      if ((paramAlgorithmParameterSpec instanceof PBEParameterSpec)) {
        paramKey = PBE.Util.makePBEParameters(paramKey, paramAlgorithmParameterSpec, this.wrapEngine.getAlgorithmName());
      }
    }
    for (;;)
    {
      Object localObject = paramKey;
      if ((paramAlgorithmParameterSpec instanceof IvParameterSpec)) {
        localObject = new ParametersWithIV(paramKey, ((IvParameterSpec)paramAlgorithmParameterSpec).getIV());
      }
      paramKey = (Key)localObject;
      if ((localObject instanceof KeyParameter))
      {
        paramKey = (Key)localObject;
        if (this.ivSize != 0)
        {
          this.iv = new byte[this.ivSize];
          paramSecureRandom.nextBytes(this.iv);
          paramKey = new ParametersWithIV((CipherParameters)localObject, this.iv);
        }
      }
      switch (paramInt)
      {
      default: 
        System.out.println("eeek!");
        return;
        if (paramKey.getParam() != null)
        {
          paramKey = paramKey.getParam();
        }
        else
        {
          throw new InvalidAlgorithmParameterException("PBE requires PBE parameters to be set.");
          paramKey = new KeyParameter(paramKey.getEncoded());
        }
        break;
      }
    }
    this.wrapEngine.init(true, paramKey);
    return;
    this.wrapEngine.init(false, paramKey);
    return;
    throw new IllegalArgumentException("engine only valid for wrapping");
  }
  
  protected void engineSetMode(String paramString)
    throws NoSuchAlgorithmException
  {
    throw new NoSuchAlgorithmException("can't support mode " + paramString);
  }
  
  protected void engineSetPadding(String paramString)
    throws NoSuchPaddingException
  {
    throw new NoSuchPaddingException("Padding " + paramString + " unknown.");
  }
  
  protected Key engineUnwrap(byte[] paramArrayOfByte, String paramString, int paramInt)
    throws InvalidKeyException
  {
    try
    {
      if (this.wrapEngine == null) {}
      for (paramArrayOfByte = engineDoFinal(paramArrayOfByte, 0, paramArrayOfByte.length); paramInt == 3; paramArrayOfByte = this.wrapEngine.unwrap(paramArrayOfByte, 0, paramArrayOfByte.length)) {
        return new SecretKeySpec(paramArrayOfByte, paramString);
      }
      try
      {
        paramString = KeyFactory.getInstance(paramString, "BC");
        if (paramInt == 1) {
          return paramString.generatePublic(new X509EncodedKeySpec(paramArrayOfByte));
        }
        if (paramInt == 2)
        {
          paramArrayOfByte = paramString.generatePrivate(new PKCS8EncodedKeySpec(paramArrayOfByte));
          return paramArrayOfByte;
        }
      }
      catch (NoSuchProviderException paramArrayOfByte)
      {
        throw new InvalidKeyException("Unknown key type " + paramArrayOfByte.getMessage());
      }
      catch (NoSuchAlgorithmException paramArrayOfByte)
      {
        throw new InvalidKeyException("Unknown key type " + paramArrayOfByte.getMessage());
      }
      catch (InvalidKeySpecException paramArrayOfByte)
      {
        throw new InvalidKeyException("Unknown key type " + paramArrayOfByte.getMessage());
      }
    }
    catch (InvalidCipherTextException paramArrayOfByte)
    {
      throw new InvalidKeyException(paramArrayOfByte.getMessage());
    }
    catch (BadPaddingException paramArrayOfByte)
    {
      throw new InvalidKeyException(paramArrayOfByte.getMessage());
    }
    catch (IllegalBlockSizeException paramArrayOfByte)
    {
      throw new InvalidKeyException(paramArrayOfByte.getMessage());
    }
    throw new InvalidKeyException("Unknown key type " + paramInt);
  }
  
  protected int engineUpdate(byte[] paramArrayOfByte1, int paramInt1, int paramInt2, byte[] paramArrayOfByte2, int paramInt3)
    throws ShortBufferException
  {
    throw new RuntimeException("not supported for wrapping");
  }
  
  protected byte[] engineUpdate(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
  {
    throw new RuntimeException("not supported for wrapping");
  }
  
  protected byte[] engineWrap(Key paramKey)
    throws IllegalBlockSizeException, InvalidKeyException
  {
    paramKey = paramKey.getEncoded();
    if (paramKey == null) {
      throw new InvalidKeyException("Cannot wrap key, null encoding.");
    }
    try
    {
      if (this.wrapEngine == null) {
        return engineDoFinal(paramKey, 0, paramKey.length);
      }
      paramKey = this.wrapEngine.wrap(paramKey, 0, paramKey.length);
      return paramKey;
    }
    catch (BadPaddingException paramKey)
    {
      throw new IllegalBlockSizeException(paramKey.getMessage());
    }
  }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/org/bouncycastle/jce/provider/WrapCipherSpi.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */