package com.keepassdroid.database.load;

import com.keepassdroid.database.PwDbHeaderV3;
import com.keepassdroid.database.PwDbHeaderV4;
import com.keepassdroid.database.exception.InvalidDBSignatureException;
import com.keepassdroid.stream.LEDataInputStream;

import java.io.IOException;
import java.io.InputStream;

public class ImporterFactory {
    public static Importer createImporter(InputStream paramInputStream)
            throws InvalidDBSignatureException, IOException {
        return createImporter(paramInputStream, false);
    }

    public static Importer createImporter(InputStream paramInputStream, boolean paramBoolean)
            throws InvalidDBSignatureException, IOException {
        int i = LEDataInputStream.readInt(paramInputStream);
        int j = LEDataInputStream.readInt(paramInputStream);
        if (PwDbHeaderV3.matchesHeader(i, j)) {
            if (paramBoolean) {
                return new ImporterV3Debug();
            }
            return new ImporterV3();
        }
        if (PwDbHeaderV4.matchesHeader(i, j)) {
            return new ImporterV4();
        }
        throw new InvalidDBSignatureException();
    }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/com/keepassdroid/database/load/ImporterFactory.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */