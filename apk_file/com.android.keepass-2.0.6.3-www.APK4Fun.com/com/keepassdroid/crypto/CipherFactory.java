package com.keepassdroid.crypto;

import android.os.Build;

import com.keepassdroid.utils.Types;

import java.security.InvalidAlgorithmParameterException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.util.UUID;

import javax.crypto.Cipher;
import javax.crypto.NoSuchPaddingException;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;

public class CipherFactory {
    public static final UUID AES_CIPHER = Types.bytestoUUID(new byte[]{49, -63, -14, -26, -65, 113, 67, 80, -66, 88, 5, 33, 106, -4, 90, -1});
    public static final UUID TWOFISH_CIPHER = Types.bytestoUUID(new byte[]{-83, 104, -14, -97, 87, 111, 75, -71, -93, 106, -44, 122, -7, 101, 52, 108});
    private static boolean blacklistInit = false;
    private static boolean blacklisted;

    public static boolean deviceBlacklisted() {
        if (!blacklistInit) {
            blacklistInit = true;
            blacklisted = Build.MODEL.equals("A500");
        }
        return blacklisted;
    }

    public static Cipher getInstance(String paramString)
            throws NoSuchAlgorithmException, NoSuchPaddingException {
        return getInstance(paramString, false);
    }

    public static Cipher getInstance(String paramString, boolean paramBoolean)
            throws NoSuchAlgorithmException, NoSuchPaddingException {
        if ((!deviceBlacklisted()) && (!paramBoolean) && (hasNativeImplementation(paramString)) && (NativeLib.loaded())) {
            return Cipher.getInstance(paramString, new AESProvider());
        }
        try {
            Cipher localCipher = Cipher.getInstance(paramString, new BouncyCastleProvider());
            return localCipher;
        } catch (NoSuchPaddingException localNoSuchPaddingException) {
            return Cipher.getInstance(paramString);
        } catch (NoSuchAlgorithmException localNoSuchAlgorithmException) {
            for (; ; ) {
            }
        }
    }

    public static Cipher getInstance(UUID paramUUID, int paramInt, byte[] paramArrayOfByte1, byte[] paramArrayOfByte2)
            throws NoSuchAlgorithmException, NoSuchPaddingException, InvalidKeyException, InvalidAlgorithmParameterException {
        return getInstance(paramUUID, paramInt, paramArrayOfByte1, paramArrayOfByte2, false);
    }

    public static Cipher getInstance(UUID paramUUID, int paramInt, byte[] paramArrayOfByte1, byte[] paramArrayOfByte2, boolean paramBoolean)
            throws NoSuchAlgorithmException, NoSuchPaddingException, InvalidKeyException, InvalidAlgorithmParameterException {
        if (paramUUID.equals(AES_CIPHER)) {
            paramUUID = getInstance("AES/CBC/PKCS5Padding", paramBoolean);
            paramUUID.init(paramInt, new SecretKeySpec(paramArrayOfByte1, "AES"), new IvParameterSpec(paramArrayOfByte2));
            return paramUUID;
        }
        if (paramUUID.equals(TWOFISH_CIPHER)) {
            if (paramInt == 1) {
            }
            for (paramUUID = getInstance("TWOFISH/CBC/ZeroBytePadding", paramBoolean); ; paramUUID = getInstance("TWOFISH/CBC/NoPadding", paramBoolean)) {
                paramUUID.init(paramInt, new SecretKeySpec(paramArrayOfByte1, "AES"), new IvParameterSpec(paramArrayOfByte2));
                return paramUUID;
            }
        }
        throw new NoSuchAlgorithmException("UUID unrecognized.");
    }

    private static boolean hasNativeImplementation(String paramString) {
        return paramString.equals("AES/CBC/PKCS5Padding");
    }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/com/keepassdroid/crypto/CipherFactory.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */