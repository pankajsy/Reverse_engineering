package org.bouncycastle.jce.interfaces;

public abstract interface ConfigurableProvider {
    public static final String EC_IMPLICITLY_CA = "ecImplicitlyCa";
    public static final String THREAD_LOCAL_EC_IMPLICITLY_CA = "threadLocalEcImplicitlyCa";

    public abstract void setParameter(String paramString, Object paramObject);
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/org/bouncycastle/jce/interfaces/ConfigurableProvider.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */