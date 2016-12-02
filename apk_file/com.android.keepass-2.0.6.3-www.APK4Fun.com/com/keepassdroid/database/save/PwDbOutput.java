package com.keepassdroid.database.save;

import com.keepassdroid.database.PwDatabase;
import com.keepassdroid.database.PwDatabaseV3;
import com.keepassdroid.database.PwDatabaseV4;
import com.keepassdroid.database.PwDbHeader;
import com.keepassdroid.database.exception.PwDbOutputException;

import java.io.OutputStream;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;

public abstract class PwDbOutput {
    protected OutputStream mOS;

    protected PwDbOutput(OutputStream paramOutputStream) {
        this.mOS = paramOutputStream;
    }

    public static PwDbOutput getInstance(PwDatabase paramPwDatabase, OutputStream paramOutputStream) {
        if ((paramPwDatabase instanceof PwDatabaseV3)) {
            return new PwDbV3Output((PwDatabaseV3) paramPwDatabase, paramOutputStream);
        }
        if ((paramPwDatabase instanceof PwDatabaseV4)) {
            return new PwDbV4Output((PwDatabaseV4) paramPwDatabase, paramOutputStream);
        }
        return null;
    }

    public abstract void output()
            throws PwDbOutputException;

    public abstract PwDbHeader outputHeader(OutputStream paramOutputStream)
            throws PwDbOutputException;

    protected SecureRandom setIVs(PwDbHeader paramPwDbHeader)
            throws PwDbOutputException {
        try {
            SecureRandom localSecureRandom = SecureRandom.getInstance("SHA1PRNG");
            localSecureRandom.nextBytes(paramPwDbHeader.encryptionIV);
            localSecureRandom.nextBytes(paramPwDbHeader.masterSeed);
            localSecureRandom.nextBytes(paramPwDbHeader.transformSeed);
            return localSecureRandom;
        } catch (NoSuchAlgorithmException paramPwDbHeader) {
            throw new PwDbOutputException("Does not support secure random number generation.");
        }
    }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/com/keepassdroid/database/save/PwDbOutput.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */