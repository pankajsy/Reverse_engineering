package org.bouncycastle.jce.provider;

import org.bouncycastle.crypto.BlockCipher;
import org.bouncycastle.crypto.BufferedBlockCipher;
import org.bouncycastle.crypto.CipherParameters;
import org.bouncycastle.crypto.DataLengthException;
import org.bouncycastle.crypto.InvalidCipherTextException;
import org.bouncycastle.crypto.modes.CBCBlockCipher;
import org.bouncycastle.crypto.modes.CFBBlockCipher;
import org.bouncycastle.crypto.modes.CTSBlockCipher;
import org.bouncycastle.crypto.modes.OFBBlockCipher;
import org.bouncycastle.crypto.paddings.BlockCipherPadding;
import org.bouncycastle.crypto.paddings.PaddedBufferedBlockCipher;
import org.bouncycastle.crypto.paddings.ZeroBytePadding;
import org.bouncycastle.crypto.params.KeyParameter;
import org.bouncycastle.crypto.params.ParametersWithIV;
import org.bouncycastle.crypto.params.ParametersWithRandom;
import org.bouncycastle.util.Strings;

import java.security.AlgorithmParameters;
import java.security.InvalidAlgorithmParameterException;
import java.security.InvalidKeyException;
import java.security.InvalidParameterException;
import java.security.Key;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.security.spec.AlgorithmParameterSpec;

import javax.crypto.BadPaddingException;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import javax.crypto.SecretKey;
import javax.crypto.ShortBufferException;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.PBEParameterSpec;

public class JCEBlockCipher
        extends WrapCipherSpi
        implements PBE {
    private Class[] availableSpecs = {IvParameterSpec.class, PBEParameterSpec.class};
    private BlockCipher baseEngine;
    private GenericBlockCipher cipher;
    private int ivLength = 0;
    private ParametersWithIV ivParam;
    private String modeName = null;
    private boolean padded;
    private String pbeAlgorithm = null;
    private PBEParameterSpec pbeSpec = null;

    protected JCEBlockCipher(BlockCipher paramBlockCipher) {
        this.baseEngine = paramBlockCipher;
        this.cipher = new BufferedGenericBlockCipher(paramBlockCipher);
    }

    protected JCEBlockCipher(BlockCipher paramBlockCipher, int paramInt) {
        this.baseEngine = paramBlockCipher;
        this.cipher = new BufferedGenericBlockCipher(paramBlockCipher);
        this.ivLength = (paramInt / 8);
    }

    protected JCEBlockCipher(BufferedBlockCipher paramBufferedBlockCipher, int paramInt) {
        this.baseEngine = paramBufferedBlockCipher.getUnderlyingCipher();
        this.cipher = new BufferedGenericBlockCipher(paramBufferedBlockCipher);
        this.ivLength = (paramInt / 8);
    }

    private boolean isAEADModeName(String paramString) {
        return ("CCM".equals(paramString)) || ("EAX".equals(paramString)) || ("GCM".equals(paramString));
    }

    protected int engineDoFinal(byte[] paramArrayOfByte1, int paramInt1, int paramInt2, byte[] paramArrayOfByte2, int paramInt3)
            throws IllegalBlockSizeException, BadPaddingException {
        int i = 0;
        if (paramInt2 != 0) {
            i = this.cipher.processBytes(paramArrayOfByte1, paramInt1, paramInt2, paramArrayOfByte2, paramInt3);
        }
        try {
            paramInt1 = this.cipher.doFinal(paramArrayOfByte2, paramInt3 + i);
            return paramInt1 + i;
        } catch (DataLengthException paramArrayOfByte1) {
            throw new IllegalBlockSizeException(paramArrayOfByte1.getMessage());
        } catch (InvalidCipherTextException paramArrayOfByte1) {
            throw new BadPaddingException(paramArrayOfByte1.getMessage());
        }
    }

    protected byte[] engineDoFinal(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
            throws IllegalBlockSizeException, BadPaddingException {
        int i = 0;
        byte[] arrayOfByte = new byte[engineGetOutputSize(paramInt2)];
        if (paramInt2 != 0) {
            i = this.cipher.processBytes(paramArrayOfByte, paramInt1, paramInt2, arrayOfByte, 0);
        }
        try {
            paramInt1 = this.cipher.doFinal(arrayOfByte, i);
            paramInt1 = i + paramInt1;
            if (paramInt1 == arrayOfByte.length) {
                return arrayOfByte;
            }
        } catch (DataLengthException paramArrayOfByte) {
            throw new IllegalBlockSizeException(paramArrayOfByte.getMessage());
        } catch (InvalidCipherTextException paramArrayOfByte) {
            throw new BadPaddingException(paramArrayOfByte.getMessage());
        }
        paramArrayOfByte = new byte[paramInt1];
        System.arraycopy(arrayOfByte, 0, paramArrayOfByte, 0, paramInt1);
        return paramArrayOfByte;
    }

    protected int engineGetBlockSize() {
        return this.baseEngine.getBlockSize();
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
        return this.cipher.getOutputSize(paramInt);
    }

    protected AlgorithmParameters engineGetParameters() {
        if ((this.engineParams != null) || (this.pbeSpec != null)) {
        }
        for (; ; ) {
            try {
                this.engineParams = AlgorithmParameters.getInstance(this.pbeAlgorithm, "BC");
                this.engineParams.init(this.pbeSpec);
                return this.engineParams;
            } catch (Exception localException1) {
                return null;
            }
            if (this.ivParam == null) {
                continue;
            }
            String str = this.cipher.getUnderlyingCipher().getAlgorithmName();
            Object localObject = str;
            if (str.indexOf('/') >= 0) {
                localObject = str.substring(0, str.indexOf('/'));
            }
            try {
                this.engineParams = AlgorithmParameters.getInstance((String) localObject, "BC");
                this.engineParams.init(this.ivParam.getIV());
            } catch (Exception localException2) {
                throw new RuntimeException(localException2.toString());
            }
        }
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
        if ((paramAlgorithmParameterSpec == null) && (this.baseEngine.getAlgorithmName().startsWith("RC5-64"))) {
            throw new InvalidAlgorithmParameterException("RC5 requires an RC5ParametersSpec to be passed in.");
        }
        if ((paramKey instanceof JCEPBEKey)) {
            paramKey = (JCEPBEKey) paramKey;
            if (paramKey.getOID() != null) {
                this.pbeAlgorithm = paramKey.getOID().getId();
                if (paramKey.getParam() == null) {
                    break label358;
                }
                paramAlgorithmParameterSpec = paramKey.getParam();
                this.pbeSpec = new PBEParameterSpec(paramKey.getSalt(), paramKey.getIterationCount());
                label151:
                paramKey = paramAlgorithmParameterSpec;
                if ((paramAlgorithmParameterSpec instanceof ParametersWithIV)) {
                    this.ivParam = ((ParametersWithIV) paramAlgorithmParameterSpec);
                    paramKey = paramAlgorithmParameterSpec;
                }
                label170:
                if ((this.ivLength == 0) || ((paramKey instanceof ParametersWithIV))) {
                    break label663;
                }
                Object localObject = paramSecureRandom;
                paramAlgorithmParameterSpec = (AlgorithmParameterSpec) localObject;
                if (localObject == null) {
                    paramAlgorithmParameterSpec = new SecureRandom();
                }
                if ((paramInt != 1) && (paramInt != 3)) {
                    break label602;
                }
                localObject = new byte[this.ivLength];
                paramAlgorithmParameterSpec.nextBytes((byte[]) localObject);
                paramKey = new ParametersWithIV(paramKey, (byte[]) localObject);
                this.ivParam = ((ParametersWithIV) paramKey);
            }
        }
        label358:
        label602:
        label663:
        for (; ; ) {
            if ((paramSecureRandom != null) && (this.padded)) {
                paramKey = new ParametersWithRandom(paramKey, paramSecureRandom);
            }
            for (; ; ) {
                switch (paramInt) {
                    default:
                        try {
                            throw new InvalidParameterException("unknown opmode " + paramInt + " passed");
                        } catch (Exception paramKey) {
                            throw new InvalidKeyException(paramKey.getMessage());
                        }
                        this.pbeAlgorithm = paramKey.getAlgorithm();
                        break;
                    if ((paramAlgorithmParameterSpec instanceof PBEParameterSpec)) {
                        this.pbeSpec = ((PBEParameterSpec) paramAlgorithmParameterSpec);
                        paramAlgorithmParameterSpec = PBE.Util.makePBEParameters(paramKey, paramAlgorithmParameterSpec, this.cipher.getUnderlyingCipher().getAlgorithmName());
                        break label151;
                    }
                    throw new InvalidAlgorithmParameterException("PBE requires PBE parameters to be set.");
                    if (paramAlgorithmParameterSpec == null) {
                        paramKey = new KeyParameter(paramKey.getEncoded());
                        break label170;
                    }
                    if ((paramAlgorithmParameterSpec instanceof IvParameterSpec)) {
                        if (this.ivLength != 0) {
                            paramAlgorithmParameterSpec = (IvParameterSpec) paramAlgorithmParameterSpec;
                            if ((paramAlgorithmParameterSpec.getIV().length != this.ivLength) && (!isAEADModeName(this.modeName))) {
                                throw new InvalidAlgorithmParameterException("IV must be " + this.ivLength + " bytes long.");
                            }
                            paramKey = new ParametersWithIV(new KeyParameter(paramKey.getEncoded()), paramAlgorithmParameterSpec.getIV());
                            this.ivParam = ((ParametersWithIV) paramKey);
                            break label170;
                        }
                        if ((this.modeName != null) && (this.modeName.equals("ECB"))) {
                            throw new InvalidAlgorithmParameterException("ECB mode does not use an IV");
                        }
                        paramKey = new KeyParameter(paramKey.getEncoded());
                        break label170;
                    }
                    throw new InvalidAlgorithmParameterException("unknown parameter type.");
                    if (this.cipher.getUnderlyingCipher().getAlgorithmName().indexOf("PGPCFB") >= 0) {
                        break label663;
                    }
                    throw new InvalidAlgorithmParameterException("no IV set when one expected");
                    case 1:
                    case 3:
                        this.cipher.init(true, paramKey);
                        return;
                    case 2:
                    case 4:
                        this.cipher.init(false, paramKey);
                        return;
                }
            }
        }
    }

    protected void engineSetMode(String paramString)
            throws NoSuchAlgorithmException {
        this.modeName = Strings.toUpperCase(paramString);
        if (this.modeName.equals("ECB")) {
            this.ivLength = 0;
            this.cipher = new BufferedGenericBlockCipher(this.baseEngine);
            return;
        }
        if (this.modeName.equals("CBC")) {
            this.ivLength = this.baseEngine.getBlockSize();
            this.cipher = new BufferedGenericBlockCipher(new CBCBlockCipher(this.baseEngine));
            return;
        }
        int i;
        if (this.modeName.startsWith("OFB")) {
            this.ivLength = this.baseEngine.getBlockSize();
            if (this.modeName.length() != 3) {
                i = Integer.parseInt(this.modeName.substring(3));
                this.cipher = new BufferedGenericBlockCipher(new OFBBlockCipher(this.baseEngine, i));
                return;
            }
            this.cipher = new BufferedGenericBlockCipher(new OFBBlockCipher(this.baseEngine, this.baseEngine.getBlockSize() * 8));
            return;
        }
        if (this.modeName.startsWith("CFB")) {
            this.ivLength = this.baseEngine.getBlockSize();
            if (this.modeName.length() != 3) {
                i = Integer.parseInt(this.modeName.substring(3));
                this.cipher = new BufferedGenericBlockCipher(new CFBBlockCipher(this.baseEngine, i));
                return;
            }
            this.cipher = new BufferedGenericBlockCipher(new CFBBlockCipher(this.baseEngine, this.baseEngine.getBlockSize() * 8));
            return;
        }
        throw new NoSuchAlgorithmException("can't support mode " + paramString);
    }

    protected void engineSetPadding(String paramString)
            throws NoSuchPaddingException {
        String str = Strings.toUpperCase(paramString);
        if (str.equals("NOPADDING")) {
            if (this.cipher.wrapOnNoPadding()) {
                this.cipher = new BufferedGenericBlockCipher(new BufferedBlockCipher(this.cipher.getUnderlyingCipher()));
            }
            return;
        }
        if (str.equals("WITHCTS")) {
            this.cipher = new BufferedGenericBlockCipher(new CTSBlockCipher(this.cipher.getUnderlyingCipher()));
            return;
        }
        this.padded = true;
        if (isAEADModeName(this.modeName)) {
            throw new NoSuchPaddingException("Only NoPadding can be used with AEAD modes.");
        }
        if ((str.equals("PKCS5PADDING")) || (str.equals("PKCS7PADDING"))) {
            this.cipher = new BufferedGenericBlockCipher(this.cipher.getUnderlyingCipher());
            return;
        }
        if (str.equals("ZEROBYTEPADDING")) {
            this.cipher = new BufferedGenericBlockCipher(this.cipher.getUnderlyingCipher(), new ZeroBytePadding());
            return;
        }
        throw new NoSuchPaddingException("Padding " + paramString + " unknown.");
    }

    protected int engineUpdate(byte[] paramArrayOfByte1, int paramInt1, int paramInt2, byte[] paramArrayOfByte2, int paramInt3)
            throws ShortBufferException {
        try {
            paramInt1 = this.cipher.processBytes(paramArrayOfByte1, paramInt1, paramInt2, paramArrayOfByte2, paramInt3);
            return paramInt1;
        } catch (DataLengthException paramArrayOfByte1) {
            throw new ShortBufferException(paramArrayOfByte1.getMessage());
        }
    }

    protected byte[] engineUpdate(byte[] paramArrayOfByte, int paramInt1, int paramInt2) {
        int i = this.cipher.getUpdateOutputSize(paramInt2);
        if (i > 0) {
            byte[] arrayOfByte = new byte[i];
            paramInt1 = this.cipher.processBytes(paramArrayOfByte, paramInt1, paramInt2, arrayOfByte, 0);
            if (paramInt1 == 0) {
                return null;
            }
            if (paramInt1 != arrayOfByte.length) {
                paramArrayOfByte = new byte[paramInt1];
                System.arraycopy(arrayOfByte, 0, paramArrayOfByte, 0, paramInt1);
                return paramArrayOfByte;
            }
            return arrayOfByte;
        }
        this.cipher.processBytes(paramArrayOfByte, paramInt1, paramInt2, null, 0);
        return null;
    }

    private static abstract interface GenericBlockCipher {
        public abstract int doFinal(byte[] paramArrayOfByte, int paramInt)
                throws IllegalStateException, InvalidCipherTextException;

        public abstract String getAlgorithmName();

        public abstract int getOutputSize(int paramInt);

        public abstract BlockCipher getUnderlyingCipher();

        public abstract int getUpdateOutputSize(int paramInt);

        public abstract void init(boolean paramBoolean, CipherParameters paramCipherParameters)
                throws IllegalArgumentException;

        public abstract int processByte(byte paramByte, byte[] paramArrayOfByte, int paramInt)
                throws DataLengthException;

        public abstract int processBytes(byte[] paramArrayOfByte1, int paramInt1, int paramInt2, byte[] paramArrayOfByte2, int paramInt3)
                throws DataLengthException;

        public abstract boolean wrapOnNoPadding();
    }

    private static class BufferedGenericBlockCipher
            implements JCEBlockCipher.GenericBlockCipher {
        private BufferedBlockCipher cipher;

        BufferedGenericBlockCipher(BlockCipher paramBlockCipher) {
            this.cipher = new PaddedBufferedBlockCipher(paramBlockCipher);
        }

        BufferedGenericBlockCipher(BlockCipher paramBlockCipher, BlockCipherPadding paramBlockCipherPadding) {
            this.cipher = new PaddedBufferedBlockCipher(paramBlockCipher, paramBlockCipherPadding);
        }

        BufferedGenericBlockCipher(BufferedBlockCipher paramBufferedBlockCipher) {
            this.cipher = paramBufferedBlockCipher;
        }

        public int doFinal(byte[] paramArrayOfByte, int paramInt)
                throws IllegalStateException, InvalidCipherTextException {
            return this.cipher.doFinal(paramArrayOfByte, paramInt);
        }

        public String getAlgorithmName() {
            return this.cipher.getUnderlyingCipher().getAlgorithmName();
        }

        public int getOutputSize(int paramInt) {
            return this.cipher.getOutputSize(paramInt);
        }

        public BlockCipher getUnderlyingCipher() {
            return this.cipher.getUnderlyingCipher();
        }

        public int getUpdateOutputSize(int paramInt) {
            return this.cipher.getUpdateOutputSize(paramInt);
        }

        public void init(boolean paramBoolean, CipherParameters paramCipherParameters)
                throws IllegalArgumentException {
            this.cipher.init(paramBoolean, paramCipherParameters);
        }

        public int processByte(byte paramByte, byte[] paramArrayOfByte, int paramInt)
                throws DataLengthException {
            return this.cipher.processByte(paramByte, paramArrayOfByte, paramInt);
        }

        public int processBytes(byte[] paramArrayOfByte1, int paramInt1, int paramInt2, byte[] paramArrayOfByte2, int paramInt3)
                throws DataLengthException {
            return this.cipher.processBytes(paramArrayOfByte1, paramInt1, paramInt2, paramArrayOfByte2, paramInt3);
        }

        public boolean wrapOnNoPadding() {
            return !(this.cipher instanceof CTSBlockCipher);
        }
    }

    public static class PBEWithSHAAndTwofish
            extends JCEBlockCipher {
        public PBEWithSHAAndTwofish() {
            super();
        }
    }

    public static class Twofish
            extends JCEBlockCipher {
        public Twofish() {
            super();
        }
    }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/org/bouncycastle/jce/provider/JCEBlockCipher.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */