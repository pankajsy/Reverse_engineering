package com.keepassdroid.database.save;

import com.keepassdroid.crypto.CipherFactory;
import com.keepassdroid.database.PwDatabaseV3;
import com.keepassdroid.database.PwDbHeader;
import com.keepassdroid.database.PwDbHeaderV3;
import com.keepassdroid.database.PwEncryptionAlgorithm;
import com.keepassdroid.database.PwEntryV3;
import com.keepassdroid.database.PwGroup;
import com.keepassdroid.database.PwGroupV3;
import com.keepassdroid.database.exception.PwDbOutputException;
import com.keepassdroid.stream.LEDataOutputStream;
import com.keepassdroid.stream.NullOutputStream;

import java.io.BufferedOutputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.security.DigestOutputStream;
import java.security.InvalidAlgorithmParameterException;
import java.security.InvalidKeyException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.List;

import javax.crypto.Cipher;
import javax.crypto.CipherOutputStream;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;

public class PwDbV3Output
        extends PwDbOutput {
    private byte[] headerHashBlock;
    private PwDatabaseV3 mPM;

    public PwDbV3Output(PwDatabaseV3 paramPwDatabaseV3, OutputStream paramOutputStream) {
        super(paramOutputStream);
        this.mPM = paramPwDatabaseV3;
    }

    private byte[] getHeaderHashBuffer(byte[] paramArrayOfByte) {
        ByteArrayOutputStream localByteArrayOutputStream = new ByteArrayOutputStream();
        try {
            writeExtData(paramArrayOfByte, localByteArrayOutputStream);
            paramArrayOfByte = localByteArrayOutputStream.toByteArray();
            return paramArrayOfByte;
        } catch (IOException paramArrayOfByte) {
        }
        return null;
    }

    private void prepForOutput() {
        sortGroupsForOutput();
    }

    private void sortGroup(PwGroupV3 paramPwGroupV3, List<PwGroup> paramList) {
        paramList.add(paramPwGroupV3);
        int i = 0;
        while (i < paramPwGroupV3.childGroups.size()) {
            sortGroup((PwGroupV3) paramPwGroupV3.childGroups.get(i), paramList);
            i += 1;
        }
    }

    private void sortGroupsForOutput() {
        ArrayList localArrayList = new ArrayList();
        List localList = this.mPM.getGrpRoots();
        int i = 0;
        while (i < localList.size()) {
            sortGroup((PwGroupV3) localList.get(i), localArrayList);
            i += 1;
        }
        this.mPM.setGroups(localArrayList);
    }

    private void writeExtData(byte[] paramArrayOfByte, OutputStream paramOutputStream)
            throws IOException {
        paramOutputStream = new LEDataOutputStream(paramOutputStream);
        writeExtDataField(paramOutputStream, 1, paramArrayOfByte, paramArrayOfByte.length);
        paramArrayOfByte = new byte[32];
        new SecureRandom().nextBytes(paramArrayOfByte);
        writeExtDataField(paramOutputStream, 2, paramArrayOfByte, paramArrayOfByte.length);
        writeExtDataField(paramOutputStream, 65535, null, 0);
    }

    private void writeExtDataField(LEDataOutputStream paramLEDataOutputStream, int paramInt1, byte[] paramArrayOfByte, int paramInt2)
            throws IOException {
        paramLEDataOutputStream.writeUShort(paramInt1);
        paramLEDataOutputStream.writeInt(paramInt2);
        if (paramArrayOfByte != null) {
            paramLEDataOutputStream.write(paramArrayOfByte);
        }
    }

    public byte[] getFinalKey(PwDbHeader paramPwDbHeader)
            throws PwDbOutputException {
        try {
            this.mPM.makeFinalKey(paramPwDbHeader.masterSeed, paramPwDbHeader.transformSeed, this.mPM.numKeyEncRounds);
            paramPwDbHeader = this.mPM.finalKey;
            return paramPwDbHeader;
        } catch (IOException paramPwDbHeader) {
            throw new PwDbOutputException("Key creation failed: " + paramPwDbHeader.getMessage());
        }
    }

    public void output()
            throws PwDbOutputException {
        prepForOutput();
        PwDbHeaderV3 localPwDbHeaderV3 = outputHeader(this.mOS);
        byte[] arrayOfByte = getFinalKey(localPwDbHeaderV3);
        for (; ; ) {
            try {
                if (this.mPM.algorithm == PwEncryptionAlgorithm.Rjindal) {
                    localObject = CipherFactory.getInstance("AES/CBC/PKCS5Padding");
                }
            } catch (Exception localException) {
                Object localObject;
                throw new PwDbOutputException("Algorithm not supported.");
            }
            try {
                ((Cipher) localObject).init(1, new SecretKeySpec(arrayOfByte, "AES"), new IvParameterSpec(localPwDbHeaderV3.encryptionIV));
                localObject = new BufferedOutputStream(new CipherOutputStream(this.mOS, (Cipher) localObject));
                outputPlanGroupAndEntries((OutputStream) localObject);
                ((BufferedOutputStream) localObject).flush();
                ((BufferedOutputStream) localObject).close();
                return;
            } catch (InvalidKeyException localInvalidKeyException) {
                throw new PwDbOutputException("Invalid key");
            } catch (InvalidAlgorithmParameterException localInvalidAlgorithmParameterException) {
                throw new PwDbOutputException("Invalid algorithm parameter.");
            } catch (IOException localIOException) {
                throw new PwDbOutputException("Failed to output final encrypted part.");
            }
            if (this.mPM.algorithm != PwEncryptionAlgorithm.Twofish) {
                continue;
            }
            localObject = CipherFactory.getInstance("TWOFISH/CBC/PKCS7PADDING");
        }
        throw new Exception();
    }

    public PwDbHeaderV3 outputHeader(OutputStream paramOutputStream)
            throws PwDbOutputException {
        PwDbHeaderV3 localPwDbHeaderV3 = new PwDbHeaderV3();
        localPwDbHeaderV3.signature1 = -1700603645;
        localPwDbHeaderV3.signature2 = -1253311643;
        localPwDbHeaderV3.flags = 1;
        if (this.mPM.getEncAlgorithm() == PwEncryptionAlgorithm.Rjindal) {
        }
        for (localPwDbHeaderV3.flags |= 0x2; ; localPwDbHeaderV3.flags |= 0x8) {
            localPwDbHeaderV3.version = 196611;
            localPwDbHeaderV3.numGroups = this.mPM.getGroups().size();
            localPwDbHeaderV3.numEntries = this.mPM.entries.size();
            localPwDbHeaderV3.numKeyEncRounds = this.mPM.getNumKeyEncRecords();
            setIVs(localPwDbHeaderV3);
            try {
                localMessageDigest = MessageDigest.getInstance("SHA-256");
            } catch (NoSuchAlgorithmException paramOutputStream) {
                MessageDigest localMessageDigest;
                Object localObject1;
                Object localObject2;
                PwDbHeaderOutputV3 localPwDbHeaderOutputV3;
                throw new PwDbOutputException("SHA-256 not implemented here.");
            }
            try {
                localObject1 = MessageDigest.getInstance("SHA-256");
                localObject2 = new DigestOutputStream(new NullOutputStream(), (MessageDigest) localObject1);
                localPwDbHeaderOutputV3 = new PwDbHeaderOutputV3(localPwDbHeaderV3, (OutputStream) localObject2);
            } catch (NoSuchAlgorithmException paramOutputStream) {
                throw new PwDbOutputException("SHA-256 not implemented here.");
            }
            try {
                localPwDbHeaderOutputV3.outputStart();
                localPwDbHeaderOutputV3.outputEnd();
                ((DigestOutputStream) localObject2).flush();
                this.headerHashBlock = getHeaderHashBuffer(((MessageDigest) localObject1).digest());
                localObject1 = new DigestOutputStream(new NullOutputStream(), localMessageDigest);
                localObject2 = new BufferedOutputStream((OutputStream) localObject1);
            } catch (IOException paramOutputStream) {
                throw new PwDbOutputException(paramOutputStream);
            }
            try {
                outputPlanGroupAndEntries((OutputStream) localObject2);
                ((BufferedOutputStream) localObject2).flush();
                ((BufferedOutputStream) localObject2).close();
                localPwDbHeaderV3.contentsHash = localMessageDigest.digest();
                paramOutputStream = new PwDbHeaderOutputV3(localPwDbHeaderV3, paramOutputStream);
            } catch (IOException paramOutputStream) {
                throw new PwDbOutputException("Failed to generate checksum.");
            }
            try {
                paramOutputStream.outputStart();
                ((DigestOutputStream) localObject1).on(false);
                paramOutputStream.outputContentHash();
                ((DigestOutputStream) localObject1).on(true);
                paramOutputStream.outputEnd();
                ((DigestOutputStream) localObject1).flush();
                return localPwDbHeaderV3;
            } catch (IOException paramOutputStream) {
                throw new PwDbOutputException(paramOutputStream);
            }
            if (this.mPM.getEncAlgorithm() != PwEncryptionAlgorithm.Twofish) {
                break;
            }
        }
        throw new PwDbOutputException("Unsupported algorithm.");
    }

    public void outputPlanGroupAndEntries(OutputStream paramOutputStream)
            throws PwDbOutputException {
        Object localObject = new LEDataOutputStream(paramOutputStream);
        if ((useHeaderHash()) && (this.headerHashBlock != null)) {
        }
        try {
            ((LEDataOutputStream) localObject).writeUShort(0);
            ((LEDataOutputStream) localObject).writeInt(this.headerHashBlock.length);
            ((LEDataOutputStream) localObject).write(this.headerHashBlock);
            localObject = this.mPM.getGroups();
            i = 0;
        } catch (IOException paramOutputStream) {
            try {
                PwGroupOutputV3 localPwGroupOutputV3;
                localPwGroupOutputV3.output();
                i += 1;
            } catch (IOException paramOutputStream) {
                throw new PwDbOutputException("Failed to output a group: " + paramOutputStream.getMessage());
            }
            paramOutputStream = paramOutputStream;
            throw new PwDbOutputException("Failed to output header hash: " + paramOutputStream.getMessage());
        }
        if (i < ((List) localObject).size()) {
            localPwGroupOutputV3 = new PwGroupOutputV3((PwGroupV3) ((List) localObject).get(i), paramOutputStream);
        }
        int i = 0;
        while (i < this.mPM.entries.size()) {
            localObject = new PwEntryOutputV3((PwEntryV3) this.mPM.entries.get(i), paramOutputStream);
            try {
                ((PwEntryOutputV3) localObject).output();
                i += 1;
            } catch (IOException paramOutputStream) {
                throw new PwDbOutputException("Failed to output an entry.");
            }
        }
    }

    protected boolean useHeaderHash() {
        return true;
    }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/com/keepassdroid/database/save/PwDbV3Output.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */