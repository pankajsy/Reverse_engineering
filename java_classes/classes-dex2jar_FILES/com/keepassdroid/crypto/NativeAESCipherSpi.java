package com.keepassdroid.crypto;

import android.util.Log;
import java.lang.ref.PhantomReference;
import java.lang.ref.Reference;
import java.lang.ref.ReferenceQueue;
import java.security.AlgorithmParameters;
import java.security.InvalidAlgorithmParameterException;
import java.security.InvalidKeyException;
import java.security.Key;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.security.spec.AlgorithmParameterSpec;
import java.security.spec.InvalidParameterSpecException;
import java.util.HashMap;
import javax.crypto.BadPaddingException;
import javax.crypto.CipherSpi;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import javax.crypto.ShortBufferException;
import javax.crypto.spec.IvParameterSpec;

public class NativeAESCipherSpi
  extends CipherSpi
{
  private static HashMap<PhantomReference<NativeAESCipherSpi>, Long> mCleanup = new HashMap();
  private static boolean mIsStaticInit = false;
  private static ReferenceQueue<NativeAESCipherSpi> mQueue = new ReferenceQueue();
  private final int AES_BLOCK_SIZE = 16;
  private long mCtxPtr;
  private boolean mEncrypting = false;
  private byte[] mIV;
  private boolean mIsInited = false;
  private boolean mPadding = false;
  
  public NativeAESCipherSpi()
  {
    if (!mIsStaticInit) {
      staticInit();
    }
  }
  
  private static void addToCleanupQueue(NativeAESCipherSpi paramNativeAESCipherSpi, long paramLong)
  {
    Log.d("KeepassDroid", "queued cipher context: " + paramLong);
    mCleanup.put(new PhantomReference(paramNativeAESCipherSpi, mQueue), Long.valueOf(paramLong));
  }
  
  private int doFinal(byte[] paramArrayOfByte1, int paramInt1, int paramInt2, byte[] paramArrayOfByte2, int paramInt3)
    throws ShortBufferException, IllegalBlockSizeException, BadPaddingException
  {
    int i = engineGetOutputSize(paramInt2);
    if ((paramArrayOfByte1 != null) && (paramInt2 > 0)) {}
    for (paramInt1 = nUpdate(this.mCtxPtr, paramArrayOfByte1, paramInt1, paramInt2, paramArrayOfByte2, paramInt3, i);; paramInt1 = 0) {
      return paramInt1 + nFinal(this.mCtxPtr, this.mPadding, paramArrayOfByte2, paramInt3 + paramInt1, i - paramInt1);
    }
  }
  
  private void init(int paramInt, Key paramKey, IvParameterSpec paramIvParameterSpec)
  {
    boolean bool = true;
    if (this.mIsInited) {
      throw new RuntimeException("Don't allow multiple inits");
    }
    NativeLib.init();
    this.mIsInited = true;
    this.mIV = paramIvParameterSpec.getIV();
    if (paramInt == 1) {}
    for (;;)
    {
      this.mEncrypting = bool;
      this.mCtxPtr = nInit(this.mEncrypting, paramKey.getEncoded(), this.mIV);
      addToCleanupQueue(this, this.mCtxPtr);
      return;
      bool = false;
    }
  }
  
  private static native void nCleanup(long paramLong);
  
  private native int nFinal(long paramLong, boolean paramBoolean, byte[] paramArrayOfByte, int paramInt1, int paramInt2)
    throws ShortBufferException, IllegalBlockSizeException, BadPaddingException;
  
  private native int nGetCacheSize(long paramLong);
  
  private native long nInit(boolean paramBoolean, byte[] paramArrayOfByte1, byte[] paramArrayOfByte2);
  
  private native int nUpdate(long paramLong, byte[] paramArrayOfByte1, int paramInt1, int paramInt2, byte[] paramArrayOfByte2, int paramInt3, int paramInt4);
  
  private static void staticInit()
  {
    mIsStaticInit = true;
    new Thread(new Cleanup(null)).start();
  }
  
  protected int engineDoFinal(byte[] paramArrayOfByte1, int paramInt1, int paramInt2, byte[] paramArrayOfByte2, int paramInt3)
    throws ShortBufferException, IllegalBlockSizeException, BadPaddingException
  {
    paramInt1 = doFinal(paramArrayOfByte1, paramInt1, paramInt2, paramArrayOfByte2, paramInt3);
    if (paramInt1 == -1) {
      throw new ShortBufferException();
    }
    return paramInt1;
  }
  
  protected byte[] engineDoFinal(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
    throws IllegalBlockSizeException, BadPaddingException
  {
    int i = engineGetOutputSize(paramInt2);
    byte[] arrayOfByte = new byte[i];
    try
    {
      paramInt1 = doFinal(paramArrayOfByte, paramInt1, paramInt2, arrayOfByte, 0);
      if (i == paramInt1) {
        return arrayOfByte;
      }
    }
    catch (ShortBufferException paramArrayOfByte)
    {
      throw new RuntimeException("Short buffer exception shouldn't be possible from here.");
    }
    paramArrayOfByte = new byte[paramInt1];
    System.arraycopy(arrayOfByte, 0, paramArrayOfByte, 0, paramInt1);
    return paramArrayOfByte;
  }
  
  protected int engineGetBlockSize()
  {
    return 16;
  }
  
  protected byte[] engineGetIV()
  {
    return (byte[])this.mIV.clone();
  }
  
  protected int engineGetOutputSize(int paramInt)
  {
    return nGetCacheSize(this.mCtxPtr) + paramInt + 16;
  }
  
  protected AlgorithmParameters engineGetParameters()
  {
    return null;
  }
  
  protected void engineInit(int paramInt, Key paramKey, AlgorithmParameters paramAlgorithmParameters, SecureRandom paramSecureRandom)
    throws InvalidKeyException, InvalidAlgorithmParameterException
  {
    try
    {
      engineInit(paramInt, paramKey, paramAlgorithmParameters.getParameterSpec(AlgorithmParameterSpec.class), paramSecureRandom);
      return;
    }
    catch (InvalidParameterSpecException paramKey)
    {
      throw new InvalidAlgorithmParameterException(paramKey);
    }
  }
  
  protected void engineInit(int paramInt, Key paramKey, SecureRandom paramSecureRandom)
    throws InvalidKeyException
  {
    byte[] arrayOfByte = new byte[16];
    paramSecureRandom.nextBytes(arrayOfByte);
    init(paramInt, paramKey, new IvParameterSpec(arrayOfByte));
  }
  
  protected void engineInit(int paramInt, Key paramKey, AlgorithmParameterSpec paramAlgorithmParameterSpec, SecureRandom paramSecureRandom)
    throws InvalidKeyException, InvalidAlgorithmParameterException
  {
    if ((paramAlgorithmParameterSpec instanceof IvParameterSpec))
    {
      init(paramInt, paramKey, (IvParameterSpec)paramAlgorithmParameterSpec);
      return;
    }
    throw new InvalidAlgorithmParameterException("params must be an IvParameterSpec.");
  }
  
  protected void engineSetMode(String paramString)
    throws NoSuchAlgorithmException
  {
    if (!paramString.equals("CBC")) {
      throw new NoSuchAlgorithmException("This only supports CBC mode");
    }
  }
  
  protected void engineSetPadding(String paramString)
    throws NoSuchPaddingException
  {
    if (!this.mIsInited) {
      NativeLib.init();
    }
    if (paramString.length() == 0) {
      return;
    }
    if (!paramString.equals("PKCS5Padding")) {
      throw new NoSuchPaddingException("Only supports PKCS5Padding.");
    }
    this.mPadding = true;
  }
  
  protected int engineUpdate(byte[] paramArrayOfByte1, int paramInt1, int paramInt2, byte[] paramArrayOfByte2, int paramInt3)
    throws ShortBufferException
  {
    paramInt1 = update(paramArrayOfByte1, paramInt1, paramInt2, paramArrayOfByte2, paramInt3);
    if (paramInt1 == -1) {
      throw new ShortBufferException("Insufficient buffer.");
    }
    return paramInt1;
  }
  
  protected byte[] engineUpdate(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
  {
    int i = engineGetOutputSize(paramInt2);
    byte[] arrayOfByte = new byte[i];
    paramInt1 = update(paramArrayOfByte, paramInt1, paramInt2, arrayOfByte, 0);
    if (paramInt1 == i) {
      return arrayOfByte;
    }
    paramArrayOfByte = new byte[paramInt1];
    System.arraycopy(arrayOfByte, 0, paramArrayOfByte, 0, paramInt1);
    return paramArrayOfByte;
  }
  
  int update(byte[] paramArrayOfByte1, int paramInt1, int paramInt2, byte[] paramArrayOfByte2, int paramInt3)
  {
    int i = engineGetOutputSize(paramInt2);
    return nUpdate(this.mCtxPtr, paramArrayOfByte1, paramInt1, paramInt2, paramArrayOfByte2, paramInt3, i);
  }
  
  private static class Cleanup
    implements Runnable
  {
    public void run()
    {
      try
      {
        for (;;)
        {
          Reference localReference = NativeAESCipherSpi.mQueue.remove();
          long l = ((Long)NativeAESCipherSpi.mCleanup.remove(localReference)).longValue();
          NativeAESCipherSpi.nCleanup(l);
          Log.d("KeePassDroid", "Cleaned up cipher context: " + l);
        }
      }
      catch (InterruptedException localInterruptedException) {}
    }
  }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/com/keepassdroid/crypto/NativeAESCipherSpi.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */