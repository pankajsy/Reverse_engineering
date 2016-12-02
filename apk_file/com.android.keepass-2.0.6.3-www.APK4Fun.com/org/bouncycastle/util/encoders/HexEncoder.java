package org.bouncycastle.util.encoders;

import java.io.IOException;
import java.io.OutputStream;

public class HexEncoder
        implements Encoder {
    protected final byte[] decodingTable = new byte[''];
    protected final byte[] encodingTable = {48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 97, 98, 99, 100, 101, 102};

    public HexEncoder() {
        initialiseDecodingTable();
    }

    private boolean ignore(char paramChar) {
        return (paramChar == '\n') || (paramChar == '\r') || (paramChar == '\t') || (paramChar == ' ');
    }

    public int decode(String paramString, OutputStream paramOutputStream)
            throws IOException {
        int k = 0;
        int j = paramString.length();
        if ((j <= 0) || (!ignore(paramString.charAt(j - 1)))) {
        }
        int m;
        for (int i = 0; ; i = m) {
            if (i >= j) {
                break label152;
            }
            for (; ; ) {
                if ((i < j) && (ignore(paramString.charAt(i)))) {
                    i += 1;
                    continue;
                    j -= 1;
                    break;
                }
            }
            int n = this.decodingTable[paramString.charAt(i)];
            i += 1;
            while ((i < j) && (ignore(paramString.charAt(i)))) {
                i += 1;
            }
            byte[] arrayOfByte = this.decodingTable;
            m = i + 1;
            paramOutputStream.write(n << 4 | arrayOfByte[paramString.charAt(i)]);
            k += 1;
        }
        label152:
        return k;
    }

    public int decode(byte[] paramArrayOfByte, int paramInt1, int paramInt2, OutputStream paramOutputStream)
            throws IOException {
        int i = 0;
        paramInt2 = paramInt1 + paramInt2;
        if ((paramInt2 <= paramInt1) || (!ignore((char) paramArrayOfByte[(paramInt2 - 1)]))) {
        }
        for (; ; ) {
            if (paramInt1 >= paramInt2) {
                break label136;
            }
            for (; ; ) {
                if ((paramInt1 < paramInt2) && (ignore((char) paramArrayOfByte[paramInt1]))) {
                    paramInt1 += 1;
                    continue;
                    paramInt2 -= 1;
                    break;
                }
            }
            int k = this.decodingTable[paramArrayOfByte[paramInt1]];
            paramInt1 += 1;
            while ((paramInt1 < paramInt2) && (ignore((char) paramArrayOfByte[paramInt1]))) {
                paramInt1 += 1;
            }
            byte[] arrayOfByte = this.decodingTable;
            int j = paramInt1 + 1;
            paramOutputStream.write(k << 4 | arrayOfByte[paramArrayOfByte[paramInt1]]);
            i += 1;
            paramInt1 = j;
        }
        label136:
        return i;
    }

    public int encode(byte[] paramArrayOfByte, int paramInt1, int paramInt2, OutputStream paramOutputStream)
            throws IOException {
        int i = paramInt1;
        while (i < paramInt1 + paramInt2) {
            int j = paramArrayOfByte[i] & 0xFF;
            paramOutputStream.write(this.encodingTable[(j >>> 4)]);
            paramOutputStream.write(this.encodingTable[(j & 0xF)]);
            i += 1;
        }
        return paramInt2 * 2;
    }

    protected void initialiseDecodingTable() {
        int i = 0;
        while (i < this.encodingTable.length) {
            this.decodingTable[this.encodingTable[i]] = ((byte) i);
            i += 1;
        }
        this.decodingTable[65] = this.decodingTable[97];
        this.decodingTable[66] = this.decodingTable[98];
        this.decodingTable[67] = this.decodingTable[99];
        this.decodingTable[68] = this.decodingTable[100];
        this.decodingTable[69] = this.decodingTable[101];
        this.decodingTable[70] = this.decodingTable[102];
    }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/org/bouncycastle/util/encoders/HexEncoder.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */