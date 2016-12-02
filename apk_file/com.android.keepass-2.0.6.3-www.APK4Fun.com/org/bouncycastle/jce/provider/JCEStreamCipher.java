package org.bouncycastle.jce.provider;

import org.bouncycastle.crypto.BlockCipher;
import org.bouncycastle.crypto.DataLengthException;
import org.bouncycastle.crypto.StreamBlockCipher;
import org.bouncycastle.crypto.StreamCipher;
import org.bouncycastle.crypto.params.KeyParameter;
import org.bouncycastle.crypto.params.ParametersWithIV;

import java.security.AlgorithmParameters;
import java.security.InvalidAlgorithmParameterException;
import java.security.InvalidKeyException;
import java.security.Key;
import java.security.SecureRandom;
import java.security.spec.AlgorithmParameterSpec;

import javax.crypto.NoSuchPaddingException;
import javax.crypto.SecretKey;
import javax.crypto.ShortBufferException;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.PBEParameterSpec;
import javax.crypto.spec.RC2ParameterSpec;
import javax.crypto.spec.RC5ParameterSpec;

public class JCEStreamCipher
        extends WrapCipherSpi
        implements PBE {
    private Class[] availableSpecs = {RC2ParameterSpec.class, RC5ParameterSpec.class, IvParameterSpec.class, PBEParameterSpec.class};
    private StreamCipher cipher;
    private int ivLength = 0;
    private ParametersWithIV ivParam;
    private String pbeAlgorithm = null;
    private PBEParameterSpec pbeSpec = null;

    protected JCEStreamCipher(BlockCipher paramBlockCipher, int paramInt) {
        this.ivLength = paramInt;
        this.cipher = new StreamBlockCipher(paramBlockCipher);
    }

    protected JCEStreamCipher(StreamCipher paramStreamCipher, int paramInt) {
        this.cipher = paramStreamCipher;
        this.ivLength = paramInt;
    }

    protected int engineDoFinal(byte[] paramArrayOfByte1, int paramInt1, int paramInt2, byte[] paramArrayOfByte2, int paramInt3) {
        if (paramInt2 != 0) {
            this.cipher.processBytes(paramArrayOfByte1, paramInt1, paramInt2, paramArrayOfByte2, paramInt3);
        }
        this.cipher.reset();
        return paramInt2;
    }

    protected byte[] engineDoFinal(byte[] paramArrayOfByte, int paramInt1, int paramInt2) {
        if (paramInt2 != 0) {
            paramArrayOfByte = engineUpdate(paramArrayOfByte, paramInt1, paramInt2);
            this.cipher.reset();
            return paramArrayOfByte;
        }
        this.cipher.reset();
        return new byte[0];
    }

    protected int engineGetBlockSize() {
        return 0;
    }

    protected byte[] engineGetIV() {
        if (this.ivParam != null) {
            return this.ivParam.getIV();
        }
        return null;
    }

    protected int engineGetKeySize(Key paramKey) {
        return paramKey.getEncoded().length * 8;
    }

    protected int engineGetOutputSize(int paramInt) {
        return paramInt;
    }

    protected AlgorithmParameters engineGetParameters() {
        if ((this.engineParams == null) && (this.pbeSpec != null)) {
            try {
                AlgorithmParameters localAlgorithmParameters = AlgorithmParameters.getInstance(this.pbeAlgorithm, "BC");
                localAlgorithmParameters.init(this.pbeSpec);
                return localAlgorithmParameters;
            } catch (Exception localException) {
                return null;
            }
        }
        return this.engineParams;
    }

    protected void engineInit(int paramInt, Key paramKey, AlgorithmParameters paramAlgorithmParameters, SecureRandom paramSecureRandom)
            throws InvalidKeyException, InvalidAlgorithmParameterException {
        Object localObject2 = null;
        Object localObject3 = null;
        if (paramAlgorithmParameters != null) {
            int i = 0;
            for (; ; ) {
                Object localObject1 = localObject3;
                if (i != this.availableSpecs.length) {
                }
                try {
                    localObject1 = paramAlgorithmParameters.getParameterSpec(this.availableSpecs[i]);
                    localObject2 = localObject1;
                    if (localObject1 != null) {
                        break;
                    }
                    throw new InvalidAlgorithmParameterException("can't handle parameter " + paramAlgorithmParameters.toString());
                } catch (Exception localException) {
                    i += 1;
                }
            }
        }
        engineInit(paramInt, paramKey, (AlgorithmParameterSpec) localObject2, paramSecureRandom);
        this.engineParams = paramAlgorithmParameters;
    }

    protected void engineInit(int paramInt, Key paramKey, SecureRandom paramSecureRandom)
            throws InvalidKeyException {
        try {
            engineInit(paramInt, paramKey, (AlgorithmParameterSpec) null, paramSecureRandom);
            return;
        } catch (InvalidAlgorithmParameterException paramKey) {
            throw new InvalidKeyException(paramKey.getMessage());
        }
    }

    protected void engineInit(int paramInt, Key paramKey, AlgorithmParameterSpec paramAlgorithmParameterSpec, SecureRandom paramSecureRandom)
            throws InvalidKeyException, InvalidAlgorithmParameterException {
        this.pbeSpec = null;
        this.pbeAlgorithm = null;
        this.engineParams = null;
        if (!(paramKey instanceof SecretKey)) {
            throw new InvalidKeyException("Key for algorithm " + paramKey.getAlgorithm() + " not suitable for symmetric enryption.");
        }
        JCEPBEKey localJCEPBEKey;
        if ((paramKey instanceof JCEPBEKey)) {
            localJCEPBEKey = (JCEPBEKey) paramKey;
            if (localJCEPBEKey.getOID() != null) {
                this.pbeAlgorithm = localJCEPBEKey.getOID().getId();
                label92:
                if (localJCEPBEKey.getParam() == null) {
                    break label277;
                }
                paramAlgorithmParameterSpec = localJCEPBEKey.getParam();
                this.pbeSpec = new PBEParameterSpec(localJCEPBEKey.getSalt(), localJCEPBEKey.getIterationCount());
                label127:
                paramKey = paramAlgorithmParameterSpec;
                if (localJCEPBEKey.getIvSize() != 0) {
                    this.ivParam = ((ParametersWithIV) paramAlgorithmParameterSpec);
                    paramKey = paramAlgorithmParameterSpec;
                }
            }
        }
        for (; ; ) {
            paramAlgorithmParameterSpec = paramKey;
            if (this.ivLength != 0) {
                paramAlgorithmParameterSpec = paramKey;
                if (!(paramKey instanceof ParametersWithIV)) {
                    paramAlgorithmParameterSpec = paramSecureRandom;
                    if (paramSecureRandom == null) {
                        paramAlgorithmParameterSpec = new SecureRandom();
                    }
                    if ((paramInt != 1) && (paramInt != 3)) {
                        break label400;
                    }
                    paramSecureRandom = new byte[this.ivLength];
                    paramAlgorithmParameterSpec.nextBytes(paramSecureRandom);
                    paramAlgorithmParameterSpec = new ParametersWithIV(paramKey, paramSecureRandom);
                    this.ivParam = ((ParametersWithIV) paramAlgorithmParameterSpec);
                }
            }
            switch (paramInt) {
                default:
                    System.out.println("eeek!");
                    return;
                this.pbeAlgorithm = localJCEPBEKey.getAlgorithm();
                break label92;
                label277:
                if ((paramAlgorithmParameterSpec instanceof PBEParameterSpec)) {
                    paramKey = PBE.Util.makePBEParameters(localJCEPBEKey, paramAlgorithmParameterSpec, this.cipher.getAlgorithmName());
                    this.pbeSpec = ((PBEParameterSpec) paramAlgorithmParameterSpec);
                    paramAlgorithmParameterSpec = paramKey;
                    break label127;
                }
                throw new InvalidAlgorithmParameterException("PBE requires PBE parameters to be set.");
                if (paramAlgorithmParameterSpec == null) {
                    paramKey = new KeyParameter(paramKey.getEncoded());
                } else {
                    if (!(paramAlgorithmParameterSpec instanceof IvParameterSpec)) {
                        break label390;
                    }
                    paramKey = new ParametersWithIV(new KeyParameter(paramKey.getEncoded()), ((IvParameterSpec) paramAlgorithmParameterSpec).getIV());
                    this.ivParam = ((ParametersWithIV) paramKey);
                }
                break;
            }
        }
        label390:
        throw new IllegalArgumentException("unknown parameter type.");
        label400:
        throw new InvalidAlgorithmParameterException("no IV set when one expected");
        this.cipher.init(true, paramAlgorithmParameterSpec);
        return;
        this.cipher.init(false, paramAlgorithmParameterSpec);
    }

    protected void engineSetMode(String paramString) {
        if (!paramString.equalsIgnoreCase("ECB")) {
            throw new IllegalArgumentException("can't support mode " + paramString);
        }
    }

    protected void engineSetPadding(String paramString)
            throws NoSuchPaddingException {
        if (!paramString.equalsIgnoreCase("NoPadding")) {
            throw new NoSuchPaddingException("Padding " + paramString + " unknown.");
        }
    }

    protected int engineUpdate(byte[] paramArrayOfByte1, int paramInt1, int paramInt2, byte[] paramArrayOfByte2, int paramInt3)
            throws ShortBufferException {
        try {
            this.cipher.processBytes(paramArrayOfByte1, paramInt1, paramInt2, paramArrayOfByte2, paramInt3);
            return paramInt2;
        } catch (DataLengthException paramArrayOfByte1) {
            throw new ShortBufferException(paramArrayOfByte1.getMessage());
        }
    }

    protected byte[] engineUpdate(byte[] paramArrayOfByte, int paramInt1, int paramInt2) {
        byte[] arrayOfByte = new byte[paramInt2];
        this.cipher.processBytes(paramArrayOfByte, paramInt1, paramInt2, arrayOfByte, 0);
        return arrayOfByte;
    }

    public static class Salsa20
            extends JCEStreamCipher {
        public Salsa20() {
            super(8);
        }
    }

    public static class Twofish_CFB8
            extends JCEStreamCipher {
        public Twofish_CFB8() {
            super(128);
        }
    }

    public static class Twofish_OFB8
            extends JCEStreamCipher {
        public Twofish_OFB8() {
            super(128);
        }
    }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/org/bouncycastle/jce/provider/JCEStreamCipher.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */