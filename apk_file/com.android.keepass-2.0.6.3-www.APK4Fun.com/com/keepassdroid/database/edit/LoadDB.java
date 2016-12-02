package com.keepassdroid.database.edit;

import android.content.Context;
import android.net.Uri;
import android.preference.PreferenceManager;

import com.keepassdroid.Database;
import com.keepassdroid.app.App;
import com.keepassdroid.database.exception.ArcFourException;
import com.keepassdroid.database.exception.ContentFileNotFoundException;
import com.keepassdroid.database.exception.InvalidAlgorithmException;
import com.keepassdroid.database.exception.InvalidDBException;
import com.keepassdroid.database.exception.InvalidDBSignatureException;
import com.keepassdroid.database.exception.InvalidDBVersionException;
import com.keepassdroid.database.exception.InvalidKeyFileException;
import com.keepassdroid.database.exception.InvalidPasswordException;
import com.keepassdroid.database.exception.KeyFileEmptyException;

import java.io.FileNotFoundException;
import java.io.IOException;

public class LoadDB
        extends RunnableOnFinish {
    private Context mCtx;
    private Database mDb;
    private Uri mKey;
    private String mPass;
    private boolean mRememberKeyfile;
    private Uri mUri;

    public LoadDB(Database paramDatabase, Context paramContext, Uri paramUri1, String paramString, Uri paramUri2, OnFinish paramOnFinish) {
        super(paramOnFinish);
        this.mDb = paramDatabase;
        this.mCtx = paramContext;
        this.mUri = paramUri1;
        this.mPass = paramString;
        this.mKey = paramUri2;
        this.mRememberKeyfile = PreferenceManager.getDefaultSharedPreferences(paramContext).getBoolean(paramContext.getString(2131099838), paramContext.getResources().getBoolean(2131230720));
    }

    private void saveFileData(Uri paramUri1, Uri paramUri2) {
        if (!this.mRememberKeyfile) {
            paramUri2 = null;
        }
        App.getFileHistory().createFile(paramUri1, paramUri2);
    }

    public void run() {
        try {
            this.mDb.LoadData(this.mCtx, this.mUri, this.mPass, this.mKey, this.mStatus);
            saveFileData(this.mUri, this.mKey);
            finish(true);
            return;
        } catch (ArcFourException localArcFourException) {
            finish(false, this.mCtx.getString(2131099700));
            return;
        } catch (InvalidPasswordException localInvalidPasswordException) {
            finish(false, this.mCtx.getString(2131099651));
            return;
        } catch (ContentFileNotFoundException localContentFileNotFoundException) {
            finish(false, this.mCtx.getString(2131099816));
            return;
        } catch (FileNotFoundException localFileNotFoundException) {
            finish(false, this.mCtx.getString(2131099650));
            return;
        } catch (IOException localIOException) {
            finish(false, localIOException.getMessage());
            return;
        } catch (KeyFileEmptyException localKeyFileEmptyException) {
            finish(false, this.mCtx.getString(2131099809));
            return;
        } catch (InvalidAlgorithmException localInvalidAlgorithmException) {
            finish(false, this.mCtx.getString(2131099807));
            return;
        } catch (InvalidKeyFileException localInvalidKeyFileException) {
            finish(false, this.mCtx.getString(2131099808));
            return;
        } catch (InvalidDBSignatureException localInvalidDBSignatureException) {
            finish(false, this.mCtx.getString(2131099736));
            return;
        } catch (InvalidDBVersionException localInvalidDBVersionException) {
            finish(false, this.mCtx.getString(2131099793));
            return;
        } catch (InvalidDBException localInvalidDBException) {
            finish(false, this.mCtx.getString(2131099709));
            return;
        } catch (OutOfMemoryError localOutOfMemoryError) {
            finish(false, this.mCtx.getString(2131099713));
        }
    }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/com/keepassdroid/database/edit/LoadDB.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */