package org.bouncycastle.asn1;

import java.io.FilterOutputStream;
import java.io.IOException;
import java.io.OutputStream;

public class DEROutputStream
        extends FilterOutputStream
        implements DERTags {
    public DEROutputStream(OutputStream paramOutputStream) {
        super(paramOutputStream);
    }

    private void writeLength(int paramInt)
            throws IOException {
        if (paramInt > 127) {
            int i = 1;
            int j = paramInt;
            for (; ; ) {
                j >>>= 8;
                if (j == 0) {
                    break;
                }
                i += 1;
            }
            write((byte) (i | 0x80));
            i = (i - 1) * 8;
            while (i >= 0) {
                write((byte) (paramInt >> i));
                i -= 8;
            }
        }
        write((byte) paramInt);
    }

    public void write(byte[] paramArrayOfByte)
            throws IOException {
        this.out.write(paramArrayOfByte, 0, paramArrayOfByte.length);
    }

    public void write(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
            throws IOException {
        this.out.write(paramArrayOfByte, paramInt1, paramInt2);
    }

    void writeEncoded(int paramInt1, int paramInt2, byte[] paramArrayOfByte)
            throws IOException {
        writeTag(paramInt1, paramInt2);
        writeLength(paramArrayOfByte.length);
        write(paramArrayOfByte);
    }

    void writeEncoded(int paramInt, byte[] paramArrayOfByte)
            throws IOException {
        write(paramInt);
        writeLength(paramArrayOfByte.length);
        write(paramArrayOfByte);
    }

    protected void writeNull()
            throws IOException {
        write(5);
        write(0);
    }

    public void writeObject(Object paramObject)
            throws IOException {
        if (paramObject == null) {
            writeNull();
            return;
        }
        if ((paramObject instanceof DERObject)) {
            ((DERObject) paramObject).encode(this);
            return;
        }
        if ((paramObject instanceof DEREncodable)) {
            ((DEREncodable) paramObject).getDERObject().encode(this);
            return;
        }
        throw new IOException("object not DEREncodable");
    }

    void writeTag(int paramInt1, int paramInt2)
            throws IOException {
        if (paramInt2 < 31) {
            write(paramInt1 | paramInt2);
            return;
        }
        write(paramInt1 | 0x1F);
        if (paramInt2 < 128) {
            write(paramInt2);
            return;
        }
        byte[] arrayOfByte = new byte[5];
        paramInt1 = arrayOfByte.length - 1;
        arrayOfByte[paramInt1] = ((byte) (paramInt2 & 0x7F));
        int i;
        int j;
        do {
            i = paramInt2 >> 7;
            j = paramInt1 - 1;
            arrayOfByte[j] = ((byte) (i & 0x7F | 0x80));
            paramInt1 = j;
            paramInt2 = i;
        } while (i > 127);
        write(arrayOfByte, j, arrayOfByte.length - j);
    }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/org/bouncycastle/asn1/DEROutputStream.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */