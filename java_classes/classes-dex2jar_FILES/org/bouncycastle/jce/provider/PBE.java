package org.bouncycastle.jce.provider;

import java.security.spec.AlgorithmParameterSpec;
import javax.crypto.spec.PBEKeySpec;
import javax.crypto.spec.PBEParameterSpec;
import org.bouncycastle.crypto.CipherParameters;
import org.bouncycastle.crypto.PBEParametersGenerator;
import org.bouncycastle.crypto.digests.MD2Digest;
import org.bouncycastle.crypto.digests.MD5Digest;
import org.bouncycastle.crypto.digests.RIPEMD160Digest;
import org.bouncycastle.crypto.digests.SHA1Digest;
import org.bouncycastle.crypto.digests.SHA256Digest;
import org.bouncycastle.crypto.digests.TigerDigest;
import org.bouncycastle.crypto.generators.OpenSSLPBEParametersGenerator;
import org.bouncycastle.crypto.generators.PKCS12ParametersGenerator;
import org.bouncycastle.crypto.generators.PKCS5S1ParametersGenerator;
import org.bouncycastle.crypto.generators.PKCS5S2ParametersGenerator;
import org.bouncycastle.crypto.params.DESParameters;
import org.bouncycastle.crypto.params.KeyParameter;
import org.bouncycastle.crypto.params.ParametersWithIV;

public abstract interface PBE
{
  public static final int MD2 = 5;
  public static final int MD5 = 0;
  public static final int OPENSSL = 3;
  public static final int PKCS12 = 2;
  public static final int PKCS5S1 = 0;
  public static final int PKCS5S2 = 1;
  public static final int RIPEMD160 = 2;
  public static final int SHA1 = 1;
  public static final int SHA256 = 4;
  public static final int TIGER = 3;
  
  public static class Util
  {
    private static PBEParametersGenerator makePBEGenerator(int paramInt1, int paramInt2)
    {
      if (paramInt1 == 0)
      {
        switch (paramInt2)
        {
        case 2: 
        case 3: 
        case 4: 
        default: 
          throw new IllegalStateException("PKCS5 scheme 1 only supports MD2, MD5 and SHA1.");
        case 5: 
          return new PKCS5S1ParametersGenerator(new MD2Digest());
        case 0: 
          return new PKCS5S1ParametersGenerator(new MD5Digest());
        }
        return new PKCS5S1ParametersGenerator(new SHA1Digest());
      }
      if (paramInt1 == 1) {
        return new PKCS5S2ParametersGenerator();
      }
      if (paramInt1 == 2)
      {
        switch (paramInt2)
        {
        default: 
          throw new IllegalStateException("unknown digest scheme for PBE encryption.");
        case 5: 
          return new PKCS12ParametersGenerator(new MD2Digest());
        case 0: 
          return new PKCS12ParametersGenerator(new MD5Digest());
        case 1: 
          return new PKCS12ParametersGenerator(new SHA1Digest());
        case 2: 
          return new PKCS12ParametersGenerator(new RIPEMD160Digest());
        case 3: 
          return new PKCS12ParametersGenerator(new TigerDigest());
        }
        return new PKCS12ParametersGenerator(new SHA256Digest());
      }
      return new OpenSSLPBEParametersGenerator();
    }
    
    static CipherParameters makePBEMacParameters(PBEKeySpec paramPBEKeySpec, int paramInt1, int paramInt2, int paramInt3)
    {
      PBEParametersGenerator localPBEParametersGenerator = makePBEGenerator(paramInt1, paramInt2);
      if (paramInt1 == 2) {}
      for (byte[] arrayOfByte = PBEParametersGenerator.PKCS12PasswordToBytes(paramPBEKeySpec.getPassword());; arrayOfByte = PBEParametersGenerator.PKCS5PasswordToBytes(paramPBEKeySpec.getPassword()))
      {
        localPBEParametersGenerator.init(arrayOfByte, paramPBEKeySpec.getSalt(), paramPBEKeySpec.getIterationCount());
        paramPBEKeySpec = localPBEParametersGenerator.generateDerivedMacParameters(paramInt3);
        paramInt1 = 0;
        while (paramInt1 != arrayOfByte.length)
        {
          arrayOfByte[paramInt1] = 0;
          paramInt1 += 1;
        }
      }
      return paramPBEKeySpec;
    }
    
    static CipherParameters makePBEMacParameters(JCEPBEKey paramJCEPBEKey, AlgorithmParameterSpec paramAlgorithmParameterSpec)
    {
      if ((paramAlgorithmParameterSpec == null) || (!(paramAlgorithmParameterSpec instanceof PBEParameterSpec))) {
        throw new IllegalArgumentException("Need a PBEParameter spec with a PBE key.");
      }
      PBEParameterSpec localPBEParameterSpec = (PBEParameterSpec)paramAlgorithmParameterSpec;
      PBEParametersGenerator localPBEParametersGenerator = makePBEGenerator(paramJCEPBEKey.getType(), paramJCEPBEKey.getDigest());
      paramAlgorithmParameterSpec = paramJCEPBEKey.getEncoded();
      if (paramJCEPBEKey.shouldTryWrongPKCS12()) {
        paramAlgorithmParameterSpec = new byte[2];
      }
      localPBEParametersGenerator.init(paramAlgorithmParameterSpec, localPBEParameterSpec.getSalt(), localPBEParameterSpec.getIterationCount());
      paramJCEPBEKey = localPBEParametersGenerator.generateDerivedMacParameters(paramJCEPBEKey.getKeySize());
      int i = 0;
      while (i != paramAlgorithmParameterSpec.length)
      {
        paramAlgorithmParameterSpec[i] = 0;
        i += 1;
      }
      return paramJCEPBEKey;
    }
    
    static CipherParameters makePBEParameters(PBEKeySpec paramPBEKeySpec, int paramInt1, int paramInt2, int paramInt3, int paramInt4)
    {
      PBEParametersGenerator localPBEParametersGenerator = makePBEGenerator(paramInt1, paramInt2);
      byte[] arrayOfByte;
      if (paramInt1 == 2)
      {
        arrayOfByte = PBEParametersGenerator.PKCS12PasswordToBytes(paramPBEKeySpec.getPassword());
        localPBEParametersGenerator.init(arrayOfByte, paramPBEKeySpec.getSalt(), paramPBEKeySpec.getIterationCount());
        if (paramInt4 == 0) {
          break label83;
        }
      }
      label83:
      for (paramPBEKeySpec = localPBEParametersGenerator.generateDerivedParameters(paramInt3, paramInt4);; paramPBEKeySpec = localPBEParametersGenerator.generateDerivedParameters(paramInt3))
      {
        paramInt1 = 0;
        while (paramInt1 != arrayOfByte.length)
        {
          arrayOfByte[paramInt1] = 0;
          paramInt1 += 1;
        }
        arrayOfByte = PBEParametersGenerator.PKCS5PasswordToBytes(paramPBEKeySpec.getPassword());
        break;
      }
      return paramPBEKeySpec;
    }
    
    static CipherParameters makePBEParameters(JCEPBEKey paramJCEPBEKey, AlgorithmParameterSpec paramAlgorithmParameterSpec, String paramString)
    {
      if ((paramAlgorithmParameterSpec == null) || (!(paramAlgorithmParameterSpec instanceof PBEParameterSpec))) {
        throw new IllegalArgumentException("Need a PBEParameter spec with a PBE key.");
      }
      PBEParameterSpec localPBEParameterSpec = (PBEParameterSpec)paramAlgorithmParameterSpec;
      PBEParametersGenerator localPBEParametersGenerator = makePBEGenerator(paramJCEPBEKey.getType(), paramJCEPBEKey.getDigest());
      paramAlgorithmParameterSpec = paramJCEPBEKey.getEncoded();
      if (paramJCEPBEKey.shouldTryWrongPKCS12()) {
        paramAlgorithmParameterSpec = new byte[2];
      }
      localPBEParametersGenerator.init(paramAlgorithmParameterSpec, localPBEParameterSpec.getSalt(), localPBEParameterSpec.getIterationCount());
      if (paramJCEPBEKey.getIvSize() != 0)
      {
        paramJCEPBEKey = localPBEParametersGenerator.generateDerivedParameters(paramJCEPBEKey.getKeySize(), paramJCEPBEKey.getIvSize());
        if (paramString.startsWith("DES"))
        {
          if (!(paramJCEPBEKey instanceof ParametersWithIV)) {
            break label157;
          }
          DESParameters.setOddParity(((KeyParameter)((ParametersWithIV)paramJCEPBEKey).getParameters()).getKey());
        }
      }
      for (;;)
      {
        int i = 0;
        while (i != paramAlgorithmParameterSpec.length)
        {
          paramAlgorithmParameterSpec[i] = 0;
          i += 1;
        }
        paramJCEPBEKey = localPBEParametersGenerator.generateDerivedParameters(paramJCEPBEKey.getKeySize());
        break;
        label157:
        DESParameters.setOddParity(((KeyParameter)paramJCEPBEKey).getKey());
      }
      return paramJCEPBEKey;
    }
  }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/org/bouncycastle/jce/provider/PBE.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */